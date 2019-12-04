Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAB1112AC1
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 12:54:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 661376F54B;
	Wed,  4 Dec 2019 11:54:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130079.outbound.protection.outlook.com [40.107.13.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AECA96E89A
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 11:54:00 +0000 (UTC)
Received: from AM4PR08CA0074.eurprd08.prod.outlook.com (2603:10a6:205:2::45)
 by VI1PR08MB3438.eurprd08.prod.outlook.com (2603:10a6:803:82::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.22; Wed, 4 Dec
 2019 11:53:57 +0000
Received: from DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::207) by AM4PR08CA0074.outlook.office365.com
 (2603:10a6:205:2::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13 via Frontend
 Transport; Wed, 4 Dec 2019 11:53:57 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT042.mail.protection.outlook.com (10.152.21.123) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 4 Dec 2019 11:53:57 +0000
Received: ("Tessian outbound 92d30e517f5d:v37");
 Wed, 04 Dec 2019 11:53:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cd0d369be7420467
X-CR-MTA-TID: 64aa7808
Received: from b2b246179d1c.5
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D81B05AE-65D4-4C35-8532-B355C79A0413.1; 
 Wed, 04 Dec 2019 11:48:07 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b2b246179d1c.5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 Dec 2019 11:48:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+KBbfAU84+ImEnbIBHCgwEr0hBWa85nLqrvcYqfohg1m0QfZlyW3P9ftZp1v/eVUOWid/Pkn6Oq5i7gTCtd8RrOlwkMAQ2D4w1Oqua7PcFfEGVJMjynkDvG98IFd5D0Uty9bwZ2w9cG8A2i08LyVHKizAvV5Y74+COLB2PIQGhLTALVTgPmpPt5bebKcnXPw+/dK2zGOYABWrgtFGmDxJzYZuuM5cI0FzvDIlion2fSveaBN7XoSL68mm6YDqRHe4vDMshC7iovDnT4VEJqZa7sgjj1w096ejXy/66N2h7wrCFfzb198ulyHS0A3I70qeVodkKhgHOFWlEp6anvnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HrR+yXjDIEHbJRHX1+pVUBG01j4aIovj/Zqj2yFBPiY=;
 b=Ah203kL8nZSP/pT1ZPVzeNMQLDUIPI3mpDPAfc2e5do1a0JdW7EFs51oOZdrO0CSYLKbvOyZgk5MCIXfti4kDgUwplNFwCj6Tr6t+Xb95o2VwoeQbN8wXoWb4g2pETYBzhTrf/R9mk85w+qKuPwcSYvjQ+aDXTWQVDjx820/Iwtqi4MSAmAEsvqulaL0kH8OfQvLD75kaEJeEXopoa31jpBXEI5HlUyxIewFxZEHx0fCL+1sYhpx3G9feftlZNvk2oI36Dag4k2t55ILbkmfRrIKBg2fxbyZbPxPJTvrIGz+dQ46JbfDUHCjJDJJg44YAMzWfQCRolNGtbKbBTVrFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3085.eurprd08.prod.outlook.com (52.133.15.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.19; Wed, 4 Dec 2019 11:48:05 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2495.014; Wed, 4 Dec 2019
 11:48:05 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 03/28] drm/bridge/analogix: Use drm_bridge_init()
Thread-Topic: [PATCH v2 03/28] drm/bridge/analogix: Use drm_bridge_init()
Thread-Index: AQHVqpiwLcwZikJoJ0a+RtRcqGJSlg==
Date: Wed, 4 Dec 2019 11:48:04 +0000
Message-ID: <20191204114732.28514-4-mihail.atanassov@arm.com>
References: <20191204114732.28514-1-mihail.atanassov@arm.com>
In-Reply-To: <20191204114732.28514-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LNXP265CA0055.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::19) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0a78a5b2-4582-40dd-7202-08d778b0a4cf
X-MS-TrafficTypeDiagnostic: VI1PR08MB3085:|VI1PR08MB3085:|VI1PR08MB3438:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB343843AA714E451E9395F3008F5D0@VI1PR08MB3438.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:3383;OLM:3383;
x-forefront-prvs: 0241D5F98C
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(199004)(189003)(2501003)(1076003)(478600001)(6436002)(6512007)(8936002)(6486002)(54906003)(44832011)(4326008)(316002)(50226002)(8676002)(5660300002)(2906002)(81156014)(81166006)(7416002)(6116002)(3846002)(66946007)(66476007)(66556008)(66446008)(64756008)(11346002)(186003)(2616005)(14454004)(52116002)(76176011)(99286004)(2351001)(25786009)(86362001)(26005)(5640700003)(6916009)(102836004)(71200400001)(305945005)(7736002)(71190400001)(14444005)(6506007)(36756003)(5024004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3085;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 1ffe5rZOEHbjfYqzzbcXz+/I7Hm2qXR1cP4gyHPmGIp6Gl90viHvajFm7GhBDOGYDFvqSsF/rfRxPVjYXl9h5g+lCrto+a9FXmiv4NLYRlFHuJS85HWnRtzXgwdU6u4xbt4i28B4rHOhJFyu4MUzGtq7skv1rhaKF53Do+DdNlzHEBRYP1E4KJSRheJIQsdOHAaWp/NbvKRB1iHOn1OSwtw4lwUoV0G4RHaeLoWJAgzokfjRQr0e+sFILdxsvT6ZSuqxhgSXBTCGPSSV1PhhMF2Vfs9Pi4bAVdK8YTSppG5X+lJPCbNjm9nzBGtYwaf5Zg4hfRpsXYMcGW0d7Z/HcXFYn6WmUgV1j8EFepnG8QoWSGsHHOQ+hUhGQpORpbDK/qeBNZ5kQVbmlAPT0dVldJZ8UF5KYgFPMacQ+a+SVBTLXaxCKAt6xcSQPcA/Sp+q
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3085
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(39860400002)(346002)(189003)(199004)(70586007)(81166006)(186003)(2616005)(81156014)(50226002)(107886003)(11346002)(6486002)(26005)(22756006)(2351001)(7736002)(76130400001)(14444005)(70206006)(23756003)(5024004)(26826003)(356004)(478600001)(54906003)(14454004)(5660300002)(36756003)(8746002)(316002)(3846002)(8936002)(1076003)(305945005)(50466002)(99286004)(102836004)(2501003)(4326008)(76176011)(336012)(25786009)(6506007)(6916009)(6512007)(86362001)(2906002)(8676002)(5640700003)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3438;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: f9a0e851-401f-4cfa-5e26-08d778afd2c1
NoDisclaimer: True
X-Forefront-PRVS: 0241D5F98C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KDkpEtSDDETR+/mLjsy3kcemXmqFooO43IZf/KB4AM4jFz0u6YOCrSAXaWN1ZLqOoayje9REi0SCfc+tUKkNmFr5biYnwCXtdf0mWIaahWZgg/OCtTtZailS8YKnFjZER9pZZAHhpFQiHPjBy3p2JWJvE5KHMEVxyVMWAXE3iu3bOuWUs9SOybrYq8lSl/rjBdYsWbt1hc351uEqEO3WTIEMjBHzrZ4gCWxLNWCfG4OOGsB9t98iIe9t45B9MqH+6kmqPWEMMwDBia3Dz5rTRjyxgFG4455HRH8QrWMHDoYYtd/du379Wf8yAK++Dj0V3EBboAp2IMVPR1YnZqCxxm8WCTB4rdT4F0SQaPCjZh7j/s6ZPS/TXTDqEAjBShilZlDD2jzIKy90pr+w7QxT3zrLpoqu6jQfGsg8KDGaY/UH/KHPCZUCpCm7QGx+xqlt
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2019 11:53:57.0289 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a78a5b2-4582-40dd-7202-08d778b0a4cf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3438
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HrR+yXjDIEHbJRHX1+pVUBG01j4aIovj/Zqj2yFBPiY=;
 b=1vdTznAkTHpyjnfO2SPepj4iGEXNjJD2qANwkjs2j+iegVIJL+Z0BNqBmzLCnbRyUowbmH70v6Fgk9vXj7LAwAzs5yvh+UMPg4mssHd3mvt60EDlV2E/QXkErXwtc0JJHFy1jWWeRh3o1y/dmHenK4gvXpYT6PkZMuz8iwclsZs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HrR+yXjDIEHbJRHX1+pVUBG01j4aIovj/Zqj2yFBPiY=;
 b=1vdTznAkTHpyjnfO2SPepj4iGEXNjJD2qANwkjs2j+iegVIJL+Z0BNqBmzLCnbRyUowbmH70v6Fgk9vXj7LAwAzs5yvh+UMPg4mssHd3mvt60EDlV2E/QXkErXwtc0JJHFy1jWWeRh3o1y/dmHenK4gvXpYT6PkZMuz8iwclsZs=
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
 Icenowy Zheng <icenowy@aosc.io>, Brian Masney <masneyb@onstation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sean Paul <seanpaul@chromium.org>, nd <nd@arm.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpUaGUgc2V0dGluZyBvZiBicmlkZ2UtPm9mX25vZGUgYnkg
ZHJtX2JyaWRnZV9pbml0KCkgaW4KYW5hbG9naXhfZHBfY29yZS5jIGlzIHNhZmUsIHNpbmNlIC0+
b2Zfbm9kZSBpc24ndCB1c2VkIGRpcmVjdGx5IGFuZCB0aGUKYnJpZGdlIGlzbid0IHB1Ymxpc2hl
ZCB3aXRoIGRybV9icmlkZ2VfYWRkKCkuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292
IDxtaWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9h
bmFsb2dpeC9hbmFsb2dpeC1hbng2MzQ1LmMgfCA1ICsrLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4LWFueDc4eHguYyB8IDggKystLS0tLS0KIGRyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhfZHBfY29yZS5jIHwgNSArKy0tLQogMyBmaWxl
cyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXgtYW54NjM0NS5jIGIvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeC1hbng2MzQ1LmMKaW5kZXggYjRm
M2E5MjNhNTJhLi4xMzBkNWMzYTA3ZWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvYW5hbG9naXgvYW5hbG9naXgtYW54NjM0NS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvYW5hbG9naXgvYW5hbG9naXgtYW54NjM0NS5jCkBAIC02OTYsOCArNjk2LDYgQEAgc3RhdGlj
IGludCBhbng2MzQ1X2kyY19wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LAogCiAJbXV0
ZXhfaW5pdCgmYW54NjM0NS0+bG9jayk7CiAKLQlhbng2MzQ1LT5icmlkZ2Uub2Zfbm9kZSA9IGNs
aWVudC0+ZGV2Lm9mX25vZGU7Ci0KIAlhbng2MzQ1LT5jbGllbnQgPSBjbGllbnQ7CiAJaTJjX3Nl
dF9jbGllbnRkYXRhKGNsaWVudCwgYW54NjM0NSk7CiAKQEAgLTc2MCw3ICs3NTgsOCBAQCBzdGF0
aWMgaW50IGFueDYzNDVfaTJjX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsCiAJLyog
TG9vayBmb3Igc3VwcG9ydGVkIGNoaXAgSUQgKi8KIAlhbng2MzQ1X3Bvd2Vyb24oYW54NjM0NSk7
CiAJaWYgKGFueDYzNDVfZ2V0X2NoaXBfaWQoYW54NjM0NSkpIHsKLQkJYW54NjM0NS0+YnJpZGdl
LmZ1bmNzID0gJmFueDYzNDVfYnJpZGdlX2Z1bmNzOworCQlkcm1fYnJpZGdlX2luaXQoJmFueDYz
NDUtPmJyaWRnZSwgJmNsaWVudC0+ZGV2LAorCQkJCSZhbng2MzQ1X2JyaWRnZV9mdW5jcywgTlVM
TCwgTlVMTCk7CiAJCWRybV9icmlkZ2VfYWRkKCZhbng2MzQ1LT5icmlkZ2UpOwogCiAJCXJldHVy
biAwOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dp
eC1hbng3OHh4LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4LWFu
eDc4eHguYwppbmRleCA0MTg2N2JlMDM3NTEuLmUzNzg5MmNkYzljZiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeC1hbng3OHh4LmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeC1hbng3OHh4LmMKQEAgLTEyMTQs
MTAgKzEyMTQsNiBAQCBzdGF0aWMgaW50IGFueDc4eHhfaTJjX3Byb2JlKHN0cnVjdCBpMmNfY2xp
ZW50ICpjbGllbnQsCiAKIAltdXRleF9pbml0KCZhbng3OHh4LT5sb2NrKTsKIAotI2lmIElTX0VO
QUJMRUQoQ09ORklHX09GKQotCWFueDc4eHgtPmJyaWRnZS5vZl9ub2RlID0gY2xpZW50LT5kZXYu
b2Zfbm9kZTsKLSNlbmRpZgotCiAJYW54Nzh4eC0+Y2xpZW50ID0gY2xpZW50OwogCWkyY19zZXRf
Y2xpZW50ZGF0YShjbGllbnQsIGFueDc4eHgpOwogCkBAIC0xMzIxLDggKzEzMTcsOCBAQCBzdGF0
aWMgaW50IGFueDc4eHhfaTJjX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsCiAJCWdv
dG8gZXJyX3Bvd2Vyb2ZmOwogCX0KIAotCWFueDc4eHgtPmJyaWRnZS5mdW5jcyA9ICZhbng3OHh4
X2JyaWRnZV9mdW5jczsKLQorCWRybV9icmlkZ2VfaW5pdCgmYW54Nzh4eC0+YnJpZGdlLCAmY2xp
ZW50LT5kZXYsICZhbng3OHh4X2JyaWRnZV9mdW5jcywKKwkJCU5VTEwsIE5VTEwpOwogCWRybV9i
cmlkZ2VfYWRkKCZhbng3OHh4LT5icmlkZ2UpOwogCiAJLyogSWYgY2FibGUgaXMgcHVsbGVkIG91
dCwganVzdCBwb3dlcm9mZiBhbmQgd2FpdCBmb3IgSFBEIGV2ZW50ICovCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4X2RwX2NvcmUuYyBiL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhfZHBfY29yZS5jCmluZGV4IGJiNDEx
ZmU1MmFlOC4uNDA0MmJhOWE5OGQ4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L2FuYWxvZ2l4L2FuYWxvZ2l4X2RwX2NvcmUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L2FuYWxvZ2l4L2FuYWxvZ2l4X2RwX2NvcmUuYwpAQCAtMTU4NSw5ICsxNTg1LDggQEAgc3RhdGlj
IGludCBhbmFsb2dpeF9kcF9jcmVhdGVfYnJpZGdlKHN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2
LAogCiAJZHAtPmJyaWRnZSA9IGJyaWRnZTsKIAotCWJyaWRnZS0+ZHJpdmVyX3ByaXZhdGUgPSBk
cDsKLQlicmlkZ2UtPmZ1bmNzID0gJmFuYWxvZ2l4X2RwX2JyaWRnZV9mdW5jczsKLQorCWRybV9i
cmlkZ2VfaW5pdChicmlkZ2UsIGRybV9kZXYtPmRldiwgJmFuYWxvZ2l4X2RwX2JyaWRnZV9mdW5j
cywKKwkJCU5VTEwsIGRwKTsKIAlyZXQgPSBkcm1fYnJpZGdlX2F0dGFjaChkcC0+ZW5jb2Rlciwg
YnJpZGdlLCBOVUxMKTsKIAlpZiAocmV0KSB7CiAJCURSTV9FUlJPUigiZmFpbGVkIHRvIGF0dGFj
aCBkcm0gYnJpZGdlXG4iKTsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
