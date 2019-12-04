Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 196D4112A89
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 12:48:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A716E8D8;
	Wed,  4 Dec 2019 11:48:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe06::605])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F7AF6E8D2
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 11:48:26 +0000 (UTC)
Received: from DB6PR0802CA0028.eurprd08.prod.outlook.com (2603:10a6:4:a3::14)
 by AM0PR08MB5314.eurprd08.prod.outlook.com (2603:10a6:208:184::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13; Wed, 4 Dec
 2019 11:48:24 +0000
Received: from DB5EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::201) by DB6PR0802CA0028.outlook.office365.com
 (2603:10a6:4:a3::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13 via Frontend
 Transport; Wed, 4 Dec 2019 11:48:24 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT040.mail.protection.outlook.com (10.152.20.243) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 4 Dec 2019 11:48:23 +0000
Received: ("Tessian outbound 54081306375c:v37");
 Wed, 04 Dec 2019 11:48:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9cd65ecdf5485573
X-CR-MTA-TID: 64aa7808
Received: from cee6bfb0cd5a.5
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F6A44D8C-B783-4F4D-936F-697CE910D5AB.1; 
 Wed, 04 Dec 2019 11:48:18 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cee6bfb0cd5a.5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 Dec 2019 11:48:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aL7t9FEj7ejUy2M5BVZZx2r5VQMPcUIJJD7uURLyZUCbXQn9Z/zue1/Aa09zvvMm8P/FaeoLLDhmHRXN9PaIG4yEHr81h99nwu+CW7//Ujl77BztII6Ez951LLzNT54fHO1Pwk54ZgZH01yGTRGPArI39jANuw2U9DeBggcz21yqQRTjQEuSved/Q3Sj5Kf69qFXgV1EgpZVhsDdKa54738EfIkRupBIN1f7U4znh/eKrE9OzjaIFF7vkQx26+gEr4FSLE6P4ub1SjbH4n2RCPPgcX8YEgCKVbLbw874iQyrr2aH4k22r4Ig7aHTmLA6YwAuVHkSmhwC5gtmoCJ2og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFvLZuLVx0CkgA0/ZpPlhqvVnfV4TlettTTn32zufE0=;
 b=NbaoFSL6aPbkoZvcqEsibz7x24QnlT6XUt/asm0s40j0Cinv7NcgbQHQBhgDeenC9QVd9EZ2HvaX0JQea6JEPwsi2tWZGy+ODaDy8k+ckLugCxm7kcCVWYSeg4I9npOFvSt35gO55sceR95EgmZsFMW+LLIi0uzdHus6Pr+GAxxvfcIYZLJn9vIpfFk2o4SffbWxaGWqYOqdZgmNoflGbKy9w8GqUZCDJa5iX4jswAw6yU4rC1df/udBLOFZPTmKcPh1hBbkY9xPx2Wv5bSHMLApC29LLBPN3kzG2zTksZIMzszNPFlaIeSJbvh7crFgeWGF6IsaR2u+awQEJQhAcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3085.eurprd08.prod.outlook.com (52.133.15.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.19; Wed, 4 Dec 2019 11:48:16 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2495.014; Wed, 4 Dec 2019
 11:48:16 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 16/28] drm/bridge: tc358764: Use drm_bridge_init()
Thread-Topic: [PATCH v2 16/28] drm/bridge: tc358764: Use drm_bridge_init()
Thread-Index: AQHVqpi3/vcd+A+epE2FZfNxIDV2vw==
Date: Wed, 4 Dec 2019 11:48:16 +0000
Message-ID: <20191204114732.28514-17-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6efab064-c6ec-4756-f943-08d778afde3b
X-MS-TrafficTypeDiagnostic: VI1PR08MB3085:|VI1PR08MB3085:|AM0PR08MB5314:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB5314A1B6DC6E73A5FDBE5FAD8F5D0@AM0PR08MB5314.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:376;OLM:376;
x-forefront-prvs: 0241D5F98C
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(199004)(189003)(2501003)(1076003)(478600001)(4744005)(6436002)(6512007)(8936002)(6486002)(54906003)(44832011)(4326008)(316002)(50226002)(8676002)(5660300002)(2906002)(81156014)(81166006)(6116002)(3846002)(66946007)(66476007)(66556008)(66446008)(64756008)(11346002)(186003)(2616005)(14454004)(52116002)(76176011)(99286004)(2351001)(25786009)(86362001)(26005)(5640700003)(6916009)(102836004)(71200400001)(305945005)(7736002)(71190400001)(6506007)(36756003)(5024004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3085;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: iptSpS+N3AMIgAm+fy7D3XvroCa4u7YbadPYWTmTrtx3L+Emg6MwRQq/NSFogDjN4F3h4VmMAEzbdq83p/DD+ixyqmQEUicaWlEcf+4NhoT3SFlyqCXlIuwa2hiyCJUevSvcLTu7vrksiFJpi2Ej2Uqzg7SqG/Ij0K4iNIKwTqWjnpJEDjUgC9J3AVr4oh2tNGyP9fO73mVuoC6qBbJk8d/lGv3YTg5tL9y7WhoQouFXPThjYhHUfjLklI6BY5ELPwTb663ZsOZhFv6+M+f3em6ITMAKApJ/3Eejl1ovL2xm4P7NSvaFt2lRQOT+QBFLLRmBF1apXfEnKjanbL3W9F1oU68AM5a+sMWETHcfj34BwYjH+UiBOvD0ph9/NMXmHc9k6/Ds1lvLDloa322a6bPnw7hqh+4RCPWReXSdkm+1sRF1nj9C5g7oveIOMxCa
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3085
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(346002)(39860400002)(189003)(199004)(8936002)(5640700003)(2501003)(86362001)(2616005)(11346002)(50226002)(3846002)(478600001)(26826003)(2351001)(26005)(6486002)(6116002)(99286004)(8746002)(76176011)(23756003)(102836004)(4326008)(5024004)(107886003)(25786009)(6916009)(6506007)(8676002)(6512007)(336012)(50466002)(7736002)(305945005)(2906002)(81166006)(81156014)(186003)(5660300002)(316002)(54906003)(1076003)(14454004)(4744005)(22756006)(70206006)(356004)(36756003)(76130400001)(70586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB5314;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: a283bea7-6794-4355-ddd7-08d778afd99d
NoDisclaimer: True
X-Forefront-PRVS: 0241D5F98C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5+d4JqZ42RnrGPgjlZtbXjNweRsiD/mUhC31IFDnW8EcPAMDZpTw6I69tpH5ROwxLm1uE4MAVmEvBTQzlq5KzVOhnCvVGjKmKvO52tN6GnwThU8sr+dpk/Y7Vg3+VkWZrl29gAzGV45Ixy0zsEWiwLpxHoKWUwyEV0mn/B6ZEHQBM6xO7XN0WSCnmrSmk8sS7rpVyfR9vydK83qaWNRj3d5JW0ONrjWE8eb9lf+dD2AHWwBFLpcrpD6mje/hrAgBrVXZLEFSGkBl76crCwl8s/IOlJlExBiuJaXG7RIfBH7i+0GOXAAAfRaPjWZGDKPOjzGJNrJz/AM0jDqZ3ovQuzWLFw561JfLzJ2SlVtk5kdKet0yADw4zEPs+ZhTZm0qQhyNFqvOO9opsuI2wDlm9JyR/aTB/tyXZS25+vSYLit99JG2yLX8/EkQR7/fly1z
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2019 11:48:23.8606 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6efab064-c6ec-4756-f943-08d778afde3b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5314
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFvLZuLVx0CkgA0/ZpPlhqvVnfV4TlettTTn32zufE0=;
 b=kRRRJTf4mPIaHRSXWEAoW9eLeMmteOMEROl+BJhnHywEm1/x+SnppQ55gmrhhZ+r7i43CTxasbR0/ZwqO2FMpfaZoSMteOvkZmXDyA1sPUKwrydOyFSPaDZ2whuwkNf0l/+QdnnbdBU2NHvf/fV9vPnxQhOAqY9SyXOu627BzLY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFvLZuLVx0CkgA0/ZpPlhqvVnfV4TlettTTn32zufE0=;
 b=kRRRJTf4mPIaHRSXWEAoW9eLeMmteOMEROl+BJhnHywEm1/x+SnppQ55gmrhhZ+r7i43CTxasbR0/ZwqO2FMpfaZoSMteOvkZmXDyA1sPUKwrydOyFSPaDZ2whuwkNf0l/+QdnnbdBU2NHvf/fV9vPnxQhOAqY9SyXOu627BzLY=
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
