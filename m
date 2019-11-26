Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B89109ED2
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 14:16:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B376E328;
	Tue, 26 Nov 2019 13:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00087.outbound.protection.outlook.com [40.107.0.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE556E328
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 13:16:12 +0000 (UTC)
Received: from VI1PR08CA0202.eurprd08.prod.outlook.com (2603:10a6:800:d2::32)
 by AM0PR08MB3457.eurprd08.prod.outlook.com (2603:10a6:208:d7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.21; Tue, 26 Nov
 2019 13:16:10 +0000
Received: from AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::200) by VI1PR08CA0202.outlook.office365.com
 (2603:10a6:800:d2::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.19 via Frontend
 Transport; Tue, 26 Nov 2019 13:16:10 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT020.mail.protection.outlook.com (10.152.16.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Tue, 26 Nov 2019 13:16:10 +0000
Received: ("Tessian outbound af6b7800e6cb:v33");
 Tue, 26 Nov 2019 13:16:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: fb4723f78734d0df
X-CR-MTA-TID: 64aa7808
Received: from 687810ec6074.10 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.14.52]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2F217A09-623C-49E8-B37E-CF4052EFEC4C.1; 
 Tue, 26 Nov 2019 13:16:04 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 687810ec6074.10 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Nov 2019 13:16:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S3cQlI4zvt/+OHU2pVh7hfwxsWrAp+SdV84i6igsmMBc21N2A2JhI5Oikn4FpAre6PLk6fDVYHPMJCEsSN475wBn5V2bq4ethfRHYxQFUQTxcEyuwvnJhZumvVvGZ/daiE8vxM2ThyPALlecGd8EzXuW9fARvruh8kV+5BPX/WEZgz0OguZFzK+4zRIUPxncgPDN4xg7nlkQ2LWqWZ+BGx0pqTJLPv9Vno8OurFINTOS13+N9IQT4N0r1Dc08piuKuO2xOnRvPJqMP+ULbu9dIWVpBEfz0IPdQ6Z1IXhjF30CncOPGY7+JwqA9HTnIS7/mqbGIsDBTp4oScyo6J9sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fd38oFLWy/vll1uYa5+Hk1oRG4a6AluP5w8w6ULnIGg=;
 b=fBkCVjFBPQRxFklSClWSnCHRYiwzyzrpJ14s1a59AV40jyqtDi4OyuvKEsZ5Vy4Z90PI3ZNTapxF89F1hsS1vxPLBbSi81AvR0AIXS9tz7cvOdCeKlm2hn+LS1XKm/xkIskDekn3ba9URqzV+pSZkQFd7gha1IJJFZV0fcTQQVOsmoQRafzVb9HTrRBjI/gt4me4lAbdxbYeJEFXA+/A73olDGd4MBV6cmeYrSyWer5NwNxSOWBsiKAJcWNKQ8e6pyePkVUHOb2CNSByo0/FuQkVcHwThDsswTNX0DtExCbNuvHp95joN+4HMf1XDlA4yGE8TJKLAGl9NHaPKDbv/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4317.eurprd08.prod.outlook.com (20.179.28.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Tue, 26 Nov 2019 13:16:02 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 13:16:02 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 04/30] drm/bridge: anx78xx: Use drm_bridge_init()
Thread-Topic: [PATCH 04/30] drm/bridge: anx78xx: Use drm_bridge_init()
Thread-Index: AQHVpFumHisFg0Uva0+DP6hJJNbsSA==
Date: Tue, 26 Nov 2019 13:16:02 +0000
Message-ID: <20191126131541.47393-5-mihail.atanassov@arm.com>
References: <20191126131541.47393-1-mihail.atanassov@arm.com>
In-Reply-To: <20191126131541.47393-1-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 65b223b5-d00d-45d6-ea8b-08d77272cdd6
X-MS-TrafficTypeDiagnostic: VI1PR08MB4317:|VI1PR08MB4317:|AM0PR08MB3457:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB34579593B90D18409BF2434A8F450@AM0PR08MB3457.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:386;OLM:386;
x-forefront-prvs: 0233768B38
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(189003)(199004)(5640700003)(86362001)(6512007)(71200400001)(2616005)(6486002)(71190400001)(2906002)(4326008)(6916009)(44832011)(446003)(11346002)(54906003)(66946007)(316002)(66446008)(64756008)(66556008)(66476007)(6436002)(7416002)(8936002)(186003)(26005)(5660300002)(102836004)(305945005)(14454004)(25786009)(99286004)(81166006)(50226002)(478600001)(2501003)(7736002)(6116002)(2351001)(76176011)(1076003)(52116002)(66066001)(256004)(14444005)(8676002)(81156014)(6506007)(3846002)(386003)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4317;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: COB1H5tODTimTBTb62Oj7IlBN8//512Ypw9ICiugdIem+geE+UwM9smcvo4amELaMbOiRxxhyF9wMRjYQr367vQF9bOout7fvizAivxfBq4fTMMhOMd6tSmXjx5YPZ7m+PqeO3+Gxi33Rd4myDI4VsjPWUX7Ib6RixvZrFBozR61czgSReMS+o4WQJ3mFMBinaV4G8XqZ0J97udaPtvOo8l48lNYG904toH6hSfFxMAbcUegoakALTLfssWsdKa39r73ycd9dWE9NfzGARdVSdjoi0MSVOgnsmNrtQ+8J7IqOBbA3UyLCSl1axvxjVcQhupG6/8dllKRBFihX6AMyImtqysIuPwoGqAKETivYmOLFv/SVogRXpHL8nKDcnesrax5oX1lXIxqVCBtvpiWRkrWb5v9OunLjrlU2aXd4dwJNi36wY4Vym1WKEyh/Bt2
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4317
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(136003)(346002)(199004)(189003)(47776003)(36756003)(186003)(102836004)(7736002)(26005)(2906002)(14444005)(26826003)(76176011)(11346002)(99286004)(356004)(107886003)(2351001)(6116002)(3846002)(106002)(305945005)(336012)(316002)(36906005)(25786009)(50466002)(70206006)(70586007)(23756003)(386003)(76130400001)(86362001)(1076003)(5640700003)(4326008)(81166006)(8746002)(8936002)(54906003)(8676002)(81156014)(50226002)(6506007)(6916009)(446003)(14454004)(22756006)(5660300002)(6512007)(6486002)(478600001)(66066001)(2616005)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3457;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: adc0ef46-da66-43ce-c287-08d77272c913
NoDisclaimer: True
X-Forefront-PRVS: 0233768B38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ckb7DcKemV8/9OU7X4EUvLUx42+mNsDPdasHxBioVdjN1xA7LldaQknRLq4pTp0MIUPTZTOCyoZvwhPlfHhbDhwSnkJfdtV+8f37Sry8rjdClcRe9yuMCcr2TPuSBFNX1/WWc1jSwxO2/xsHowPKU4b+Wmj2NmZBDUvKKA1NgferikGiQZ2I78jPQ6GPf09IlVNNPCvV0l3pAGyIWZuGnyuP1+QLTjWCCB4G6ERnlBNorbobKUA6hlYROD09FwmJFCyGT9yx+ahphb9EVR39q3D8W4K9iIu1ge4QNLnq6zMD3wUc0m83G9mDYo3ejEcgQdJsN/ROm57bGzbvfpE343glhuTUbIC+OGid27HNpUX1gRja7ndvqosp7HrUt7kmlHRmLejKfpV/P0TPF4uRhyTXJD0+VEudM6eXcgkQjz79Fe3AT3NdJuqNHILpnjDJ
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 13:16:10.0556 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b223b5-d00d-45d6-ea8b-08d77272cdd6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3457
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fd38oFLWy/vll1uYa5+Hk1oRG4a6AluP5w8w6ULnIGg=;
 b=g/X/NnbDW5lKwUPqbDN8I0DiX6mdGtaTQe+jRqPIp1nH2Xq8lnuL+VevTA3mrG0FQAIru1T36jmG4u+XBoCMw2Ql7wIwpH1BldNGUJfg4loqQ/Kfm9LEm6qVwC8AbBGoiLrm/kLA8yc81fPhuMN6hH2b7k800O1XwkmteoFTBdE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fd38oFLWy/vll1uYa5+Hk1oRG4a6AluP5w8w6ULnIGg=;
 b=g/X/NnbDW5lKwUPqbDN8I0DiX6mdGtaTQe+jRqPIp1nH2Xq8lnuL+VevTA3mrG0FQAIru1T36jmG4u+XBoCMw2Ql7wIwpH1BldNGUJfg4loqQ/Kfm9LEm6qVwC8AbBGoiLrm/kLA8yc81fPhuMN6hH2b7k800O1XwkmteoFTBdE=
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 Icenowy Zheng <icenowy@aosc.io>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, nd <nd@arm.com>,
 Sam Ravnborg <sam@ravnborg.org>, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxt
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFs
b2dpeC9hbmFsb2dpeC1hbng3OHh4LmMgfCA4ICsrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXgtYW54Nzh4eC5jIGIvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9hbmFsb2dpeC9hbmFsb2dpeC1hbng3OHh4LmMKaW5kZXggNDE4NjdiZTAzNzUxLi5lMzc4
OTJjZGM5Y2YgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5h
bG9naXgtYW54Nzh4eC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5h
bG9naXgtYW54Nzh4eC5jCkBAIC0xMjE0LDEwICsxMjE0LDYgQEAgc3RhdGljIGludCBhbng3OHh4
X2kyY19wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LAogCiAJbXV0ZXhfaW5pdCgmYW54
Nzh4eC0+bG9jayk7CiAKLSNpZiBJU19FTkFCTEVEKENPTkZJR19PRikKLQlhbng3OHh4LT5icmlk
Z2Uub2Zfbm9kZSA9IGNsaWVudC0+ZGV2Lm9mX25vZGU7Ci0jZW5kaWYKLQogCWFueDc4eHgtPmNs
aWVudCA9IGNsaWVudDsKIAlpMmNfc2V0X2NsaWVudGRhdGEoY2xpZW50LCBhbng3OHh4KTsKIApA
QCAtMTMyMSw4ICsxMzE3LDggQEAgc3RhdGljIGludCBhbng3OHh4X2kyY19wcm9iZShzdHJ1Y3Qg
aTJjX2NsaWVudCAqY2xpZW50LAogCQlnb3RvIGVycl9wb3dlcm9mZjsKIAl9CiAKLQlhbng3OHh4
LT5icmlkZ2UuZnVuY3MgPSAmYW54Nzh4eF9icmlkZ2VfZnVuY3M7Ci0KKwlkcm1fYnJpZGdlX2lu
aXQoJmFueDc4eHgtPmJyaWRnZSwgJmNsaWVudC0+ZGV2LCAmYW54Nzh4eF9icmlkZ2VfZnVuY3Ms
CisJCQlOVUxMLCBOVUxMKTsKIAlkcm1fYnJpZGdlX2FkZCgmYW54Nzh4eC0+YnJpZGdlKTsKIAog
CS8qIElmIGNhYmxlIGlzIHB1bGxlZCBvdXQsIGp1c3QgcG93ZXJvZmYgYW5kIHdhaXQgZm9yIEhQ
RCBldmVudCAqLwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
