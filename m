Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6FC10A199
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 16:55:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F836E426;
	Tue, 26 Nov 2019 15:55:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00048.outbound.protection.outlook.com [40.107.0.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 859496E426
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 15:55:23 +0000 (UTC)
Received: from AM6PR08CA0024.eurprd08.prod.outlook.com (2603:10a6:20b:b2::36)
 by AM6PR08MB4039.eurprd08.prod.outlook.com (2603:10a6:20b:a1::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.16; Tue, 26 Nov
 2019 15:55:20 +0000
Received: from AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::200) by AM6PR08CA0024.outlook.office365.com
 (2603:10a6:20b:b2::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17 via Frontend
 Transport; Tue, 26 Nov 2019 15:55:20 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT048.mail.protection.outlook.com (10.152.17.177) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Tue, 26 Nov 2019 15:55:20 +0000
Received: ("Tessian outbound 712c40e503a7:v33");
 Tue, 26 Nov 2019 15:55:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 397163439ad1a7a2
X-CR-MTA-TID: 64aa7808
Received: from 06fdba92f32a.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.10.53]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 202671C2-FE55-47FA-862F-657EA1580813.1; 
 Tue, 26 Nov 2019 15:55:13 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2053.outbound.protection.outlook.com [104.47.10.53])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 06fdba92f32a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Nov 2019 15:55:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4Qyj9SflSM3pa1A+FJi0+QYxmdYYymfF/+8CutIdYrZCoG5wQAgyIjl7Vx3K9dEAQg23RiUsVXrPL/FgobWD5lO5me8LugSCUdXSPgB0AkKT+XfRGOPR25A/zEnC4MGpTp5BIThmdXQFHk88oRI/y9fVdFlkCECdWQjHW8nCA8/eJ1ZfyA5dXg7oq8Qa71+ruJx9UwuWMTAy9H7tiH1DxhQLTDfzrnbpuw4uEbZ53trKoh7436fS7gd6kpj4vx4AasXpQbTb//+ZU38Os5pQxMEoxa79iDblHKp1r1dnaIdA5LIyTXbC5W8doJGXlzkXEsle/2J+/NqsK817y1DRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zl3qQPCDC7XLE+VUu2Y0pSPBq7qvlmlQWmyGMrE6WAQ=;
 b=QXQwupBGA7X7wgSwVYkfVANktoNNf7slkzlLkcUOWjlXXv8857y1ARjDG2Bq7cKhn3OUDe+oMtSSu5QRMNjy/QeCsUVG6loyWJEnZXfHtog/UkTebXOgQUbGbzDveHfX8XUVYva3K/VhoqbJFqWonVpmoTnPQrJ4v4+0TA+cT1qMlVYyW7M5pxfXUpzJRqhuO3y2wK013Cw7CROXQ2XJ8T9qr7C9suXPLurRFev6Jx8l8pUDaKo2ye7ngFIQ/yjEd08mZoxP0EhUni+KnlwiC2PbIcthvNy4c7PpgYY/CIgaLA3WoBoTynC9OFcHCASxVZal1Jvo1+1JRrjQgEOK5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2910.eurprd08.prod.outlook.com (10.175.245.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Tue, 26 Nov 2019 15:55:09 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 15:55:09 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>, Martyn Welch
 <martyn.welch@collabora.co.uk>, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 00/30] drm/bridge: Add device links for lifetime control
Thread-Topic: [PATCH 00/30] drm/bridge: Add device links for lifetime control
Thread-Index: AQHVpFukT2OcrFpfwECdPD+snGfepaedk0AAgAAHSYA=
Date: Tue, 26 Nov 2019 15:55:08 +0000
Message-ID: <4032989.Zq53gbr9kj@e123338-lin>
References: <20191126131541.47393-1-mihail.atanassov@arm.com>
 <20191126152716.GY25745@shell.armlinux.org.uk>
In-Reply-To: <20191126152716.GY25745@shell.armlinux.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LNXP123CA0008.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::20) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1909cace-6d52-4864-0b4a-08d772890a40
X-MS-TrafficTypeDiagnostic: VI1PR08MB2910:|VI1PR08MB2910:|AM6PR08MB4039:
X-MS-Exchange-PUrlCount: 1
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4039D33E84AD43304EA13D178F450@AM6PR08MB4039.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:2331;OLM:2331;
x-forefront-prvs: 0233768B38
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(189003)(199004)(6246003)(86362001)(81156014)(81166006)(66946007)(8936002)(110136005)(66476007)(5660300002)(7416002)(2906002)(316002)(6116002)(3846002)(66066001)(7406005)(386003)(66446008)(6436002)(14454004)(446003)(6486002)(99286004)(11346002)(229853002)(71190400001)(26005)(8676002)(64756008)(256004)(25786009)(478600001)(71200400001)(966005)(54906003)(66556008)(6306002)(6506007)(33716001)(4326008)(76176011)(186003)(6512007)(305945005)(7736002)(102836004)(52116002)(9686003)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2910;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 1qsvhICN5pWgg1IhC8NEKHeXl0icZkx77p1B2HF8xkJ4NDOHSx6CTDcI25vThdw2hIKkydY2Vls0SnYMMWZiFNczc5OWUJtRqZpvW9YKAL0IsWsHKy9X++HXcxY6pp20Q4p3yI81GC+/s1kuriwkVpgYZTGIFuG4kTn9RFsFKVIkPWfwUUUs/c1Sefv95rWWAxaZvYzPTbqnpG8Dv67zCLlGXVZ6XLP8YJ7f0c6thQCzhk/vR7vZKqE7QX0GWAWaz8qOItzvjkGu0UBrkfZO/JG4qK4lMPKmtHj81aWCkZpPfgi/1358HGzZMchUp0wmrAK7sgHlBv/0EtA21nvTDg7t+vJhqKk4JZv1qEvGpMW3Bc7rtRPbwiAa2CkM32yUTwyINjLR/bBW3pmLtF8KN4W3/BEroAQeEYYR9Z36E5cagKiwKoYYylwS9+2lO1gdlEj7Aym5PgoNF9Q6zDlj+k0RfLSMGkjobxteuegjPNk=
Content-ID: <F480F6FEA28CC444BAE40C61CCA1878B@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2910
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(1496009)(136003)(376002)(39860400002)(346002)(396003)(189003)(199004)(305945005)(7736002)(336012)(6486002)(316002)(36906005)(106002)(99286004)(356004)(8676002)(81166006)(81156014)(86362001)(54906003)(110136005)(22756006)(14454004)(966005)(25786009)(26826003)(478600001)(76130400001)(3846002)(186003)(2906002)(23756003)(47776003)(8936002)(8746002)(66066001)(102836004)(26005)(6306002)(50466002)(6512007)(9686003)(33716001)(386003)(70586007)(70206006)(76176011)(6246003)(107886003)(4326008)(446003)(6506007)(5660300002)(229853002)(6116002)(11346002)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4039;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6cdd9194-e4e6-4315-34f0-08d77289034e
NoDisclaimer: True
X-Forefront-PRVS: 0233768B38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C5Y0RtebgbXYPhB7+X7DiQhGWiU7kO9TS+ojReUWqWZ03D7bFcYTSAj7P2lMKpnE67Fj2f1J7e2Y+/w3NC6yflU/fD+tyIP4+5vzp0WMX9ZpDxnv+cyklJA4PPUNA7Z50RpGLPv4AKLUBQqMIgwWEjFn/m85eAo1JVe/fTVn26NoaymL7jp6EH04tUYtgSyaGD4weYZAeRkrgGbVqbPKeCd2OpcrFYNZC9ahHyt+nU53AsqQRemJB6ZIoJU8hFyFOrBOOkFvZaly2DE3wJBT5RlbCTnDTdMgTGZIBgYWJN/TGna1BXRj/5m9jRMsYDcYb1OqRhe7Y6h0Ti2XWP9iiKB06HBxI6pIj+bPAcAq21X9coZJqYyru+eK+DqMYJpSCzAky7uITxoOJYTYSNC1hMVj2tGwBEyTADpkKiZGfDZwMetj3mFn/hKdEdiVmvf17GIDBQXdYWOJMfk/Zj7Asaeydv4wHmX27TfzEiTbGfQ=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 15:55:20.3669 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1909cace-6d52-4864-0b4a-08d772890a40
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4039
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zl3qQPCDC7XLE+VUu2Y0pSPBq7qvlmlQWmyGMrE6WAQ=;
 b=B/Q7FZmW5quglvTc1Numvpqa4Hjg5+JmGiM5pRinIKX6NNxLgwcwt7C/Zm33Xbob6IXo+MQEfoQN+pvZUESs8bKr4amX5+LL/wPXIiOL05l1TZNQbvWtYRL3eA42eDyARWPMNdeLxL5uhySo0gN1Ou/63Hpjy8K/UXzP8724tNY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zl3qQPCDC7XLE+VUu2Y0pSPBq7qvlmlQWmyGMrE6WAQ=;
 b=B/Q7FZmW5quglvTc1Numvpqa4Hjg5+JmGiM5pRinIKX6NNxLgwcwt7C/Zm33Xbob6IXo+MQEfoQN+pvZUESs8bKr4amX5+LL/wPXIiOL05l1TZNQbvWtYRL3eA42eDyARWPMNdeLxL5uhySo0gN1Ou/63Hpjy8K/UXzP8724tNY=
X-Mailman-Original-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Philippe Cornu <philippe.cornu@st.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jerome Brunet <jbrunet@baylibre.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Kukjin Kim <kgene@kernel.org>, "james qian wang \(Arm
 Technology China\)" <james.qian.wang@arm.com>,
 Thierry Reding <treding@nvidia.com>, Icenowy Zheng <icenowy@aosc.io>,
 Jonas Karlman <jonas@kwiboo.se>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, nd <nd@arm.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Dariusz Marcinkiewicz <darekm@google.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Douglas Anderson <dianders@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?iso-8859-1?Q?Yannick_Fertr=E9?= <yannick.fertre@st.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Torsten Duwe <duwe@lst.de>, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlc2RheSwgMjYgTm92ZW1iZXIgMjAxOSAxNToyNzoxNiBHTVQgUnVzc2VsbCBLaW5nIC0g
QVJNIExpbnV4IGFkbWluIHdyb3RlOgo+IFdoYXQgaGFwcGVuZWQgd2l0aCB0aGUgcGF0Y2hlcyBJ
IHBvc3RlZCBkb2luZyBleGFjdGx5IHRoaXM/CgpIaSBSdXNzZWxsLAoKPiAKPiBbc25pcF0KPiA+
IAo+ID4gUnVzc2VsbCBLaW5nICgxKToKPiA+ICAgZHJtL2JyaWRnZTogYWRkIHN1cHBvcnQgZm9y
IGRldmljZSBsaW5rcyB0byBicmlkZ2UKCl5eXgpEbyB5b3UgbWVhbiB0aGlzIG9uZT8gSXQncyAy
OS8zMCBpbiB0aGUgc2VyaWVzLCB5b3UncmUgQ2MnZCBvbiBpdC4KSSd2ZSBrZXB0IHRoZSBub24t
dHJpdmlhbCBwYXJ0IGlkZW50aWNhbCB0bwpodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5v
cmcvcGF0Y2gvMzM3MTgxLyAsIHdoaWNoIGlzIHRoZSBvbmx5CnJlY2VudCBwYXRjaCBvZiB5b3Vy
cyB0aGF0IEknbSBhd2FyZSBvZiBvbiB0aGUgdG9waWMuIEkndmUgcHJlc2VydmVkCnRoZSBhdXRo
b3JzaGlwLgoKPiA+IAo+ID4gIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
ZHJ2LmMgICB8IDU0ICsrKysrKy0tLS0tLS0KPiA+ICAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX2ttcy5jICAgfCA3NyArKysrKysrKysrKysrKysrLS0KPiA+ICAuLi4vZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5oICAgfCAgMiArCj4gPiAgZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMgIHwgIDUgKy0KPiA+ICAuLi4v
ZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeC1hbng2MzQ1LmMgICAgfCAgNSArLQo+ID4gIC4u
Li9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4LWFueDc4eHguYyAgICB8ICA4ICstCj4gPiAg
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9jZG5zLWRzaS5jICAgICAgICAgICAgIHwgIDQgKy0KPiA+
ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2R1bWItdmdhLWRhYy5jICAgICAgICAgfCAgNiArLQo+
ID4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbHZkcy1lbmNvZGVyLmMgICAgICAgICB8ICA3ICst
Cj4gPiAgLi4uL2JyaWRnZS9tZWdhY2hpcHMtc3RkcHh4eHgtZ2UtYjg1MHYzLWZ3LmMgIHwgIDQg
Ky0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL254cC1wdG4zNDYwLmMgICAgICAgICAgfCAg
NCArLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFuZWwuYyAgICAgICAgICAgICAgICB8
ICA3ICstCj4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9wYXJhZGUtcHM4NjIyLmMgICAgICAg
IHwgIDMgKy0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYyAgICAgICAgICAg
ICAgfCAgNSArLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTIzNC5jICAgICAgICAg
ICAgICB8ICAzICstCj4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWwtc2lpODYyMC5jICAg
ICAgICAgIHwgIDMgKy0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhk
bWkuYyAgICAgfCAgNyArLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHct
bWlwaS1kc2kuYyB8ICA3ICstCj4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2NC5j
ICAgICAgICAgICAgIHwgIDQgKy0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3
LmMgICAgICAgICAgICAgfCAgMyArLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGhjNjNs
dmQxMDI0LmMgICAgICAgICB8ICA3ICstCj4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS1z
bjY1ZHNpODYuYyAgICAgICAgIHwgIDUgKy0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3Rp
LXRmcDQxMC5jICAgICAgICAgICAgfCAgNSArLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fYnJp
ZGdlLmMgICAgICAgICAgICAgICAgICB8IDc4ICsrKysrKysrKysrKysrKy0tLS0KPiA+ICBkcml2
ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fbWljLmMgICAgICAgfCAgOCArLQo+ID4gIGRy
aXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk4eF9kcnYuYyAgICAgICAgICAgICB8ICA2ICstCj4gPiAg
ZHJpdmVycy9ncHUvZHJtL21jZGUvbWNkZV9kc2kuYyAgICAgICAgICAgICAgIHwgIDMgKy0KPiA+
ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyAgICAgICAgICAgfCAgNCArLQo+
ID4gIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5jICAgICAgICAgICB8ICA1ICst
Cj4gPiAgZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfZHZvLmMgICAgICAgICAgICAgICAgIHwgIDQg
Ky0KPiA+ICBpbmNsdWRlL2RybS9kcm1fYnJpZGdlLmggICAgICAgICAgICAgICAgICAgICAgfCAg
OCArKwo+ID4gIDMxIGZpbGVzIGNoYW5nZWQsIDIxNyBpbnNlcnRpb25zKCspLCAxMzQgZGVsZXRp
b25zKC0pCj4gPiAKPiAKPiAKCgotLSAKTWloYWlsCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
