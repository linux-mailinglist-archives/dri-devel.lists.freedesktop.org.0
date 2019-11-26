Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D3A109EEB
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 14:17:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C3796E354;
	Tue, 26 Nov 2019 13:16:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60043.outbound.protection.outlook.com [40.107.6.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F9616E37C
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 13:16:33 +0000 (UTC)
Received: from VI1PR08CA0193.eurprd08.prod.outlook.com (2603:10a6:800:d2::23)
 by HE1PR08MB2681.eurprd08.prod.outlook.com (2603:10a6:7:30::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.21; Tue, 26 Nov
 2019 13:16:30 +0000
Received: from AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::206) by VI1PR08CA0193.outlook.office365.com
 (2603:10a6:800:d2::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17 via Frontend
 Transport; Tue, 26 Nov 2019 13:16:30 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT020.mail.protection.outlook.com (10.152.16.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Tue, 26 Nov 2019 13:16:29 +0000
Received: ("Tessian outbound af6b7800e6cb:v33");
 Tue, 26 Nov 2019 13:16:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5fd3d59c4e12c313
X-CR-MTA-TID: 64aa7808
Received: from 206d54aa05cd.4 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.10.58]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2D8174F7-A801-4DB8-9F5A-0A7DEC77055C.1; 
 Tue, 26 Nov 2019 13:16:17 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2058.outbound.protection.outlook.com [104.47.10.58])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 206d54aa05cd.4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Nov 2019 13:16:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S3unJYRilQJMF1AM7nttyN1taKwQeiXjzxaX4BYpfOm/6voTf6i3DklcYL73dX3chW1eAMfrd2lJ3HI1Oo4+4GuvnJElhB5ISVVdzmBrAl2KtfN/ntuvX52cNKeMkN/9psnOAKIXakO58a0SQ1kM9cG7LSwtUIgpk0TnAjKo9vpN3JgrNWMc8k1f+BobbMrdnHb6u/DWQTRfyX/EO+77XSPijVA54/JgEJgqNsV0Ax2qP3tlWfgy5LENN5EIUii8LE952tRhFAJdn6JDB8v/IjN6dYSZKvdYGWjHMn+B88Fsn95TUHeWZ1pDGTpgR0Yz5UkxQz8Ys+F4MkrjMUOVCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFvLZuLVx0CkgA0/ZpPlhqvVnfV4TlettTTn32zufE0=;
 b=lHo2jjPrDHWxJpg6mxvLhr50g1Ntz30vobhms0eECWutxS1dNQDHjloTq6oG8/B7nIJL6IQR9hEyslcdI475nxfDorib3ULna1JysNCSEn5/KN+NSAKQTFthGO2BEPHcMMbXCP9J35yFcrGAiId9ztPS4vzMD+yY4kBegw92zSrXvyznDbHaNAYdnX9cfhRZd12akHQvBn+HGteYjpg7xH0jKlL5NPJnnteCayE6voxL0i0ZryTReTEK2XAJuGUHWw57RhsaQVR5ZVtAQxG/6KCVU3tAFlHnSn7L9OMpLeyE6Ix32XVVOYQfS/rvH+LmakZpb+7nrxcjN71Rmkc76A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4317.eurprd08.prod.outlook.com (20.179.28.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Tue, 26 Nov 2019 13:16:16 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 13:16:16 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 17/30] drm/bridge: tc358764: Use drm_bridge_init()
Thread-Topic: [PATCH 17/30] drm/bridge: tc358764: Use drm_bridge_init()
Thread-Index: AQHVpFuuQXVEpOM6HUSYvP61oYNULA==
Date: Tue, 26 Nov 2019 13:16:15 +0000
Message-ID: <20191126131541.47393-18-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: f05d6e31-9fac-41e5-84cf-08d77272d9b2
X-MS-TrafficTypeDiagnostic: VI1PR08MB4317:|VI1PR08MB4317:|HE1PR08MB2681:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HE1PR08MB26811A25B26AC1D3F7D4B9838F450@HE1PR08MB2681.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:376;OLM:376;
x-forefront-prvs: 0233768B38
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(1496009)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(189003)(199004)(5640700003)(86362001)(6512007)(71200400001)(2616005)(6486002)(71190400001)(2906002)(4326008)(6916009)(44832011)(446003)(11346002)(54906003)(66946007)(316002)(66446008)(64756008)(66556008)(66476007)(6436002)(4744005)(8936002)(186003)(26005)(5660300002)(102836004)(305945005)(14454004)(25786009)(99286004)(81166006)(50226002)(478600001)(2501003)(7736002)(6116002)(2351001)(76176011)(1076003)(52116002)(66066001)(256004)(5024004)(8676002)(81156014)(6506007)(3846002)(386003)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4317;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: hkkYl2StNqQc4+vH2kf5Yv69Fnpty2t1n8x5cz5y1SjcW4GPXoXy9vA+AVt2YFcE/pJk9uAyJSN/Lwuu6oA8tDkQfq0vKNTWEc0dd1P+3g0MAUWqXTH7pI7zLVhOLGN8rXaXNSbAR7M95fmxRaWv+NycoD6Pfxjmfy+VUWCLwtnogkMIheqKf/Ly5+1inuuthq1LJdpGBr/XHZHZWantjAVT92HN5a1EG4XCeYVtd3xXAT5tik88YusUOBatethKMwLKClSOxVagXhXjZEJOf7aPJIrE+wJZXKIgV2s4Z2VcG+dvZY/a2G+vk6dLaVcGk5cyxsCrzgUDPwi2neVcYW3LUoqaP1a1TTucnfYOxPF7GLYfm1gRZqiPwTXjvu5tWglBHHFr1EhPeP9kGz8JHH2R1EsjLybCz8tp4ANEuU7utXe/jkY2DtCSCF+r6+Ao
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4317
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(376002)(396003)(189003)(199004)(5640700003)(316002)(11346002)(22756006)(107886003)(446003)(2616005)(47776003)(305945005)(26005)(66066001)(50226002)(50466002)(23756003)(36906005)(2501003)(3846002)(8746002)(8936002)(6116002)(4326008)(2906002)(356004)(70206006)(76130400001)(106002)(478600001)(26826003)(2351001)(5660300002)(99286004)(54906003)(25786009)(86362001)(1076003)(70586007)(4744005)(36756003)(7736002)(336012)(76176011)(102836004)(6512007)(6506007)(386003)(8676002)(81156014)(81166006)(14454004)(5024004)(186003)(6916009)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR08MB2681;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: f49a15b0-70a2-47cf-192b-08d77272d123
NoDisclaimer: True
X-Forefront-PRVS: 0233768B38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3TH/MY0uUn4qitGztMCfhEG2bfB+Klg/3ygLqzpOJuKFn5J/bN+1IP4AkjPBuAyAEjiQ+HAsJQt3+UBusS/2ePwRO0l3oklqyJCZMIGOjK0Aw9JemB7/VwgTJHQJemeU7mhq6F+90jQkyGlidN58Oi1evNV+IDCblfpTWpq3fqv1SITtHxRTHphFHNFQYVZ5QCKCbquTuQHmup4FrIJxYmwMr6e0B0tQG2S5KDgceNaZjvGiFHibB1Ae/gyUu7KC19PaaDeQUuaPMeYHyU6VHIQTo62ETShxtT7mtRdoAPxPJOcuwWZmz6YP+tjcXhf1ZYX4CBThCVK1U88AHiuv8tf5j7ypLKIXTq4eeVOzNHORdUU9iAZktKz0fJjLN7Kc/hhjf1gEhnoBWufW4Wnw3HDeSN8el2a+DtKoa9vLgHMhXWWlmheqOZoYT0raNVzj
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 13:16:29.9777 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f05d6e31-9fac-41e5-84cf-08d77272d9b2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2681
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFvLZuLVx0CkgA0/ZpPlhqvVnfV4TlettTTn32zufE0=;
 b=50wLLw3TXGvWp2dtsBQXj0HUr4rS15+vfDvXBZGEUK9F+1pRWB4yHkFwPatJgwGSUeZUPSy5E/BUgiPLA6ZONPEvJtjfZGN4/EnR7BuQaLRk5KGOJwsOKlSWbNYaQlkn2b7LQUKs8IkQr3g5wLhWz8N0Qv/8U+O4Us5/0R++5WA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFvLZuLVx0CkgA0/ZpPlhqvVnfV4TlettTTn32zufE0=;
 b=50wLLw3TXGvWp2dtsBQXj0HUr4rS15+vfDvXBZGEUK9F+1pRWB4yHkFwPatJgwGSUeZUPSy5E/BUgiPLA6ZONPEvJtjfZGN4/EnR7BuQaLRk5KGOJwsOKlSWbNYaQlkn2b7LQUKs8IkQr3g5wLhWz8N0Qv/8U+O4Us5/0R++5WA=
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxt
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1
ODc2NC5jIHwgNCArLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2NC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2NC5jCmluZGV4IGRiMjk4ZjU1MGE1YS4uODYx
ZDRkZjY4N2VlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY0LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2NC5jCkBAIC00NTcsOSArNDU3LDcg
QEAgc3RhdGljIGludCB0YzM1ODc2NF9wcm9iZShzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNlICpkc2kp
CiAJaWYgKHJldCA8IDApCiAJCXJldHVybiByZXQ7CiAKLQljdHgtPmJyaWRnZS5mdW5jcyA9ICZ0
YzM1ODc2NF9icmlkZ2VfZnVuY3M7Ci0JY3R4LT5icmlkZ2Uub2Zfbm9kZSA9IGRldi0+b2Zfbm9k
ZTsKLQorCWRybV9icmlkZ2VfaW5pdCgmY3R4LT5icmlkZ2UsIGRldiwgJnRjMzU4NzY0X2JyaWRn
ZV9mdW5jcywgTlVMTCwgTlVMTCk7CiAJZHJtX2JyaWRnZV9hZGQoJmN0eC0+YnJpZGdlKTsKIAog
CXJldCA9IG1pcGlfZHNpX2F0dGFjaChkc2kpOwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
