Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B9C109F1C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 14:18:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3056E3B8;
	Tue, 26 Nov 2019 13:18:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150077.outbound.protection.outlook.com [40.107.15.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF4B6E3B8
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 13:18:21 +0000 (UTC)
Received: from VI1PR0802CA0048.eurprd08.prod.outlook.com
 (2603:10a6:800:a9::34) by DBBPR08MB4918.eurprd08.prod.outlook.com
 (2603:10a6:10:dc::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17; Tue, 26 Nov
 2019 13:18:16 +0000
Received: from AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::206) by VI1PR0802CA0048.outlook.office365.com
 (2603:10a6:800:a9::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.16 via Frontend
 Transport; Tue, 26 Nov 2019 13:18:15 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT020.mail.protection.outlook.com (10.152.16.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Tue, 26 Nov 2019 13:18:15 +0000
Received: ("Tessian outbound af6b7800e6cb:v33");
 Tue, 26 Nov 2019 13:18:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 88abe4fe9b598599
X-CR-MTA-TID: 64aa7808
Received: from 687810ec6074.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.14.52]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9431D19B-8F27-4295-8303-9987175DBD7C.1; 
 Tue, 26 Nov 2019 13:16:01 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 687810ec6074.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Nov 2019 13:16:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=loCJsxgdhnaI3BvvBmF5rP9JRxXUkv8zV8eIVQckGUE0+yRjCGLb9vg8ltcJAKLegeM6VlgcnEKDq89y50MZd5xB8i8sO498oGGSQN1UOh/uFqMehav+e2LNQD/RRK5XySY0wupx5QIIEQ/7EkYG6FAydMYOZJyPsSN1xXfuEzZM9ivlPlyw/4Oh6bTWpqk0WaPApI45oypzfdyueJpbGQI8jITAWN54EzYUL/m0xUEfxAhyasEP3LXNvjiWS0lTIm6KQhngtlJNVPegGSuLkEXlPiaIWjWq3BtCu6Jly1UeAZ2H5fKTPpO9Ep4/QKSPoXPMZeXTEsucF+Dij17nig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4kUDpYiSoqePOiJ2bE44NmSpf5EX65bMonmNaQR1LIQ=;
 b=Dq9ed+9GO0dRnZKyAwB7BKNGhK42nlh+HJg65PpFoUjSOFsEvrlhoGKkoGtKJcbWodgRSnMtV98//lx0Dzib0ZHk/RSsWZed9Lx2NReA2QScr3+KwGa/9zLEwM3rsrDpW8fWKoywKLxBSI8sXFcWRtqmtPe49xcyhYz75KCsRpkX1ahJ+LXxab1OpjP379ffAqLPkn7Ik3RDezv6GvXDyE+6aGeMxB4Whr5mcT5SHzHtMJtTfbVgbB9roc4QaKMOJrqCCCq2e/s50DfVTvouXnx9OJN5Ghxl/MGdD+i+3Y8f32qOqv/qyENd7m4/nJ+OZLGEuowPYVccSkKPjD8riA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4317.eurprd08.prod.outlook.com (20.179.28.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Tue, 26 Nov 2019 13:15:58 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 13:15:58 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 00/30] drm/bridge: Add device links for lifetime control
Thread-Topic: [PATCH 00/30] drm/bridge: Add device links for lifetime control
Thread-Index: AQHVpFukT2OcrFpfwECdPD+snGfepQ==
Date: Tue, 26 Nov 2019 13:15:58 +0000
Message-ID: <20191126131541.47393-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LO2P265CA0453.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::33) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 904bdbe0-b493-46b1-3772-08d7727318ce
X-MS-TrafficTypeDiagnostic: VI1PR08MB4317:|VI1PR08MB4317:|DBBPR08MB4918:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DBBPR08MB4918BBDCA187458E972F07948F450@DBBPR08MB4918.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:1850;OLM:1850;
x-forefront-prvs: 0233768B38
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(189003)(199004)(53754006)(5640700003)(86362001)(6512007)(71200400001)(2616005)(6486002)(71190400001)(2906002)(4326008)(6916009)(44832011)(54906003)(66946007)(316002)(66446008)(64756008)(66556008)(66476007)(6436002)(7416002)(8936002)(186003)(26005)(5660300002)(102836004)(305945005)(14454004)(25786009)(99286004)(81166006)(50226002)(478600001)(2501003)(7406005)(7736002)(6116002)(2351001)(1076003)(52116002)(66066001)(256004)(14444005)(8676002)(81156014)(6506007)(3846002)(386003)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4317;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: roUWUUtA84B28BzAX+GPfSUJxME4YomFXtXePmcbD9wqy749/gM2zjPrU+q8cZHpU5mJlGjmO3qlo3p5Ch4MYIbN9cOigoF4oARRUjO1fQQw8VB9IgfbqhOYb/9t797EpN0Ma5R3FAk4TLvSt7F33+zrRlQp0jjL2EjAQBcYiq68LoT8A4UZKRQ5od7uMBwhilfW9PVRQF7hKJP/VdZ+hWCcdbl9MyLEoqfT9EZsZ7nyQJhmd0cq02Z6UjitW5HU3CQmDZ3XmGlnJYXCvf6Ca0xJK2dM6wlcYm+35v7bqmUyc7WmoQFbl8r5MTjKWjKihczXXrAi9TyHFMSHvWFjGQ6S/ONK/RHzNLb2L/Q+dlzblv25PKmaYvOYbG1n00aHa0bN92juZovCEURADcWz5clU05yUd7mpXJ193OKplB9pqJs+XgDjFAxr8evtcKNf
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4317
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(1496009)(4636009)(376002)(136003)(346002)(39860400002)(396003)(189003)(199004)(53754006)(107886003)(76130400001)(70586007)(8936002)(8746002)(50226002)(50466002)(8676002)(81156014)(5660300002)(70206006)(86362001)(23756003)(6116002)(3846002)(305945005)(14454004)(7736002)(25786009)(81166006)(1076003)(26826003)(478600001)(66066001)(47776003)(22756006)(2501003)(2906002)(2351001)(356004)(6512007)(5640700003)(6486002)(36756003)(14444005)(336012)(316002)(106002)(54906003)(186003)(36906005)(99286004)(2616005)(26005)(102836004)(4326008)(386003)(6506007)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DBBPR08MB4918;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: b4c22472-5fc7-464f-0916-08d77272c692
NoDisclaimer: True
X-Forefront-PRVS: 0233768B38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qzkUkIIpNCTXROrl9knOSZGW+tMV6mW0LDVMCijdEdUe8GcX6CuE0uSB75QRbv3WjcFvbgGoPBIOTFYcjXZAKY5AK8m/FmQ5zAqhcfljbtMQaLyPN7sEMdtmQ7wby2hKYQBSyzw7li6ni5vZ0np/lR3zOSCD46YNYr9UBTBa+FDK5drpDyclus4cbq1unORAcSos1ah/tXnxw7h9xVs3ydwxpPoC7VMR90+fA1s8B5RGYyTlHcx/C2saSpM5Tqd3vcaPRGHX3X6bA+YC4P8IXhuBz2kvkjvn9ZrhizOU0r9XluaSHLJeD10hSPLUOnJkcrOUKDztG72xEV7mg3sZCO4htxQREOsQoJVafRnWng1sat/GuPNbEvA1GqlUR9gyJOhzBT8njMD6sACVnlthqhW/VEtGitkgxI/rgZbsb+GdhyerXzXjVn4x3fFQ43K1
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 13:18:15.8557 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 904bdbe0-b493-46b1-3772-08d7727318ce
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4918
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4kUDpYiSoqePOiJ2bE44NmSpf5EX65bMonmNaQR1LIQ=;
 b=1mlsCuWQf1ybGN5lEd73ShumXV5+7DlrUdzp38+AT7aCTuLW+l6SXhO2fiDipRtvLnpNa5zOD9Ht0f7WhJ0m6J6UgF/cOGKkjLMrdl6F0k56O4MKZRZwe6NNxbFpD9zEfdNMdY/p46NgbJF3pnesqSeqMZ8N8hQvDGyE2v3VP3Y=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4kUDpYiSoqePOiJ2bE44NmSpf5EX65bMonmNaQR1LIQ=;
 b=1mlsCuWQf1ybGN5lEd73ShumXV5+7DlrUdzp38+AT7aCTuLW+l6SXhO2fiDipRtvLnpNa5zOD9Ht0f7WhJ0m6J6UgF/cOGKkjLMrdl6F0k56O4MKZRZwe6NNxbFpD9zEfdNMdY/p46NgbJF3pnesqSeqMZ8N8hQvDGyE2v3VP3Y=
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
Cc: Martyn Welch <martyn.welch@collabora.co.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Philippe Cornu <philippe.cornu@st.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Rob Clark <robdclark@chromium.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 Thierry Reding <treding@nvidia.com>, Martin Donnelly <martin.donnelly@ge.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Brian Masney <masneyb@onstation.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, nd <nd@arm.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Dariusz Marcinkiewicz <darekm@google.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Douglas Anderson <dianders@chromium.org>,
 Matt Redfearn <matt.redfearn@thinci.com>,
 =?iso-8859-1?Q?Yannick_Fertr=E9?= <yannick.fertre@st.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Torsten Duwe <duwe@lst.de>, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLAoKVGhpcyBzZXJpZXMgYWRkcyBkZXZpY2UgbGlua3Mgc3VwcG9ydCB0byBkcm1fYnJp
ZGdlLiBUaGUgbW90aXZhdGlvbgpiZWhpbmQgaXQgaXMgdGhhdCBhIGRybV9icmlkZ2UgaW4gYSBt
b2R1bGUgY291bGQgZ2V0IHJlbW92ZWQgdW5kZXIgdGhlCmZlZXQgb2YgdGhlIGJyaWRnZSB1c2Vy
IHdpdGhvdXQgd2FybmluZywgc28gd2UgbmVlZCBhIHdheSB0byByZW1vdmUgYW5kCnJlcHJvYmUg
dGhlIGNsaWVudCBhcyBuZWVkZWQgdG8gYXZvaWQgcGVlcmluZyBpbnRvIHRoZSB2b2lkLgoKMTog
QWRkIGEgZHJtX2JyaWRnZV9pbml0KCkgZnVuY3Rpb24gd2hpY2ggd3JhcHMgYWxsIGluaXRpYWxp
c2F0aW9uIG9mCnRoZSBzdHJ1Y3R1cmUgcHJpb3IgdG8gY2FsbGluZyBkcm1fYnJpZGdlX2FkZCgp
LgoKMi0yNiwyODogQXBwbHkgdGhlIGRybV9icmlkZ2VfaW5pdCgpIHJlZmFjdG9yIHRvIGV2ZXJ5
IGJyaWRnZSB0aGF0IHVzZXMKZHJtX2JyaWRnZV9hZGQoKS4KCjI3OiBNaW5vciBjbGVhbnVwIGlu
IHJjYXItZHUuCgoyOTogQWRkIG9mX2RybV9maW5kX2JyaWRnZV9kZXZsaW5rKCkgd2hpY2ggZnVu
Y3Rpb25zIHRoZSBzYW1lIGFzCm9mX2RybV9maW5kX2JyaWRnZSgpIHBsdXMgYWRkcyBhIGRldmlj
ZSBkZXZpY2UgbGluayBmcm9tIHRoZSBvd25pbmcKZHJtX2RldmljZSB0byB0aGUgYnJpZGdlIGRl
dmljZS4KCjMwOiBBcyBhIG1vdGl2YXRpbmcgZXhhbXBsZSwgY29udmVydCBrb21lZGEgdG8gZXhj
bHVzaXZlbHkgdXNlCmRybV9icmlkZ2UgZm9yIGl0cyBwaXBlIG91dHB1dHM7IHRoaXMgaXNuJ3Qg
YSByZWdyZXNzaW9uIGluIHVzYWJpbGl0eQphbnkgbW9yZSBzaW5jZSBkZXZpY2UgbGlua3MgYnJp
bmcgdGhlIHNhbWUgYXV0b21hdGljIHJlbW92ZS9yZXByb2JlCmZlYXR1cmUgYXMgY29tcG9uZW50
cy4KCk1paGFpbCBBdGFuYXNzb3YgKDI5KToKICBkcm06IEludHJvZHVjZSBkcm1fYnJpZGdlX2lu
aXQoKQogIGRybS9icmlkZ2U6IGFkdjc1MTE6IFVzZSBkcm1fYnJpZGdlX2luaXQoKQogIGRybS9i
cmlkZ2U6IGFueDYzNDU6IFVzZSBkcm1fYnJpZGdlX2luaXQoKQogIGRybS9icmlkZ2U6IGFueDc4
eHg6IFVzZSBkcm1fYnJpZGdlX2luaXQoKQogIGRybS9icmlkZ2U6IGNkbnM6IFVzZSBkcm1fYnJp
ZGdlX2luaXQoKQogIGRybS9icmlkZ2U6IGR1bWItdmdhLWRhYzogVXNlIGRybV9icmlkZ2VfaW5p
dCgpCiAgZHJtL2JyaWRnZTogbHZkcy1lbmNvZGVyOiBVc2UgZHJtX2JyaWRnZV9pbml0KCkKICBk
cm0vYnJpZGdlOiBtZWdhY2hpcHMtc3RkcHh4eHgtZ2UtYjg1MHYzLWZ3OiBVc2UgZHJtX2JyaWRn
ZV9pbml0KCkKICBkcm0vYnJpZGdlOiBueHAtcHRuMzQ2MDogVXNlIGRybV9icmlkZ2VfaW5pdCgp
CiAgZHJtL2JyaWRnZTogcGFuZWw6IFVzZSBkcm1fYnJpZGdlX2luaXQoKQogIGRybS9icmlkZ2U6
IHBzODYyMjogVXNlIGRybV9icmlkZ2VfaW5pdCgpCiAgZHJtL2JyaWRnZTogc2lpOTAyeDogVXNl
IGRybV9icmlkZ2VfaW5pdCgpCiAgZ3B1OiBkcm06IGJyaWRnZTogc2lpOTIzNDogVXNlIGRybV9i
cmlkZ2VfaW5pdCgpCiAgZHJtL2JyaWRnZTogc2lsX3NpaTg2MjA6IFVzZSBkcm1fYnJpZGdlX2lu
aXQoKQogIGRybS9icmlkZ2U6IGR3LWhkbWk6IFVzZSBkcm1fYnJpZGdlX2luaXQoKQogIGRybS9i
cmlkZ2Uvc3lub3BzeXM6IGRzaTogVXNlIGRybV9icmlkZ2VfaW5pdCgpCiAgZHJtL2JyaWRnZTog
dGMzNTg3NjQ6IFVzZSBkcm1fYnJpZGdlX2luaXQoKQogIGRybS9icmlkZ2U6IHRjMzU4NzY3OiBV
c2UgZHJtX2JyaWRnZV9pbml0KCkKICBkcm0vYnJpZGdlOiB0aGM2MzogVXNlIGRybV9icmlkZ2Vf
aW5pdCgpCiAgZHJtL2JyaWRnZTogdGktc242NWRzaTg2OiBVc2UgZHJtX2JyaWRnZV9pbml0KCkK
ICBkcm0vYnJpZGdlOiB0aS10ZnA0MTA6IFVzZSBkcm1fYnJpZGdlX2luaXQoKQogIGRybS9leHlu
b3M6IG1pYzogVXNlIGRybV9icmlkZ2VfaW5pdCgpCiAgZHJtL2kyYzogdGRhOTk4eDogVXNlIGRy
bV9icmlkZ2VfaW5pdCgpCiAgZHJtL21jZGU6IGRzaTogVXNlIGRybV9icmlkZ2VfaW5pdCgpCiAg
ZHJtL21lZGlhdGVrOiBoZG1pOiBVc2UgZHJtX2JyaWRnZV9pbml0KCkKICBkcm06IHJjYXItZHU6
IGx2ZHM6IFVzZSBkcm1fYnJpZGdlX2luaXQoKQogIGRybTogcmNhci1kdTogbHZkczogRG9uJ3Qg
c2V0IGRybV9icmlkZ2UgcHJpdmF0ZSBwb2ludGVyCiAgZHJtL3N0aTogc3RpX3ZkbzogVXNlIGRy
bV9icmlkZ2VfaW5pdCgpCiAgZHJtL2tvbWVkYTogVXNlIGRybV9icmlkZ2UgaW50ZXJmYWNlIGZv
ciBwaXBlIG91dHB1dHMKClJ1c3NlbGwgS2luZyAoMSk6CiAgZHJtL2JyaWRnZTogYWRkIHN1cHBv
cnQgZm9yIGRldmljZSBsaW5rcyB0byBicmlkZ2UKCiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX2Rydi5jICAgfCA1NCArKysrKystLS0tLS0tCiAuLi4vZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jICAgfCA3NyArKysrKysrKysrKysrKysrLS0KIC4u
Li9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmggICB8ICAyICsKIGRyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2Rydi5jICB8ICA1ICstCiAuLi4vZHJt
L2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeC1hbng2MzQ1LmMgICAgfCAgNSArLQogLi4uL2RybS9i
cmlkZ2UvYW5hbG9naXgvYW5hbG9naXgtYW54Nzh4eC5jICAgIHwgIDggKy0KIGRyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvY2Rucy1kc2kuYyAgICAgICAgICAgICB8ICA0ICstCiBkcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL2R1bWItdmdhLWRhYy5jICAgICAgICAgfCAgNiArLQogZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9sdmRzLWVuY29kZXIuYyAgICAgICAgIHwgIDcgKy0KIC4uLi9icmlkZ2UvbWVnYWNo
aXBzLXN0ZHB4eHh4LWdlLWI4NTB2My1mdy5jICB8ICA0ICstCiBkcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL254cC1wdG4zNDYwLmMgICAgICAgICAgfCAgNCArLQogZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9wYW5lbC5jICAgICAgICAgICAgICAgIHwgIDcgKy0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
cGFyYWRlLXBzODYyMi5jICAgICAgICB8ICAzICstCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3Np
aTkwMnguYyAgICAgICAgICAgICAgfCAgNSArLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5
MjM0LmMgICAgICAgICAgICAgIHwgIDMgKy0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lsLXNp
aTg2MjAuYyAgICAgICAgICB8ICAzICstCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lz
L2R3LWhkbWkuYyAgICAgfCAgNyArLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9k
dy1taXBpLWRzaS5jIHwgIDcgKy0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjQuYyAg
ICAgICAgICAgICB8ICA0ICstCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMgICAg
ICAgICAgICAgfCAgMyArLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aGM2M2x2ZDEwMjQuYyAg
ICAgICAgIHwgIDcgKy0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMgICAg
ICAgICB8ICA1ICstCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXRmcDQxMC5jICAgICAgICAg
ICAgfCAgNSArLQogZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2UuYyAgICAgICAgICAgICAgICAg
IHwgNzggKysrKysrKysrKysrKysrLS0tLQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3Nf
ZHJtX21pYy5jICAgICAgIHwgIDggKy0KIGRyaXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk4eF9kcnYu
YyAgICAgICAgICAgICB8ICA2ICstCiBkcml2ZXJzL2dwdS9kcm0vbWNkZS9tY2RlX2RzaS5jICAg
ICAgICAgICAgICAgfCAgMyArLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMg
ICAgICAgICAgIHwgIDQgKy0KIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5jICAg
ICAgICAgICB8ICA1ICstCiBkcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9kdm8uYyAgICAgICAgICAg
ICAgICAgfCAgNCArLQogaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oICAgICAgICAgICAgICAgICAg
ICAgIHwgIDggKysKIDMxIGZpbGVzIGNoYW5nZWQsIDIxNyBpbnNlcnRpb25zKCspLCAxMzQgZGVs
ZXRpb25zKC0pCgotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
