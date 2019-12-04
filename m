Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA46C112A98
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 12:49:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF9C6F4C0;
	Wed,  4 Dec 2019 11:48:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10045.outbound.protection.outlook.com [40.107.1.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A47376F50F
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 11:48:37 +0000 (UTC)
Received: from VE1PR08CA0030.eurprd08.prod.outlook.com (2603:10a6:803:104::43)
 by AM0PR08MB3761.eurprd08.prod.outlook.com (2603:10a6:208:103::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13; Wed, 4 Dec
 2019 11:48:35 +0000
Received: from DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::200) by VE1PR08CA0030.outlook.office365.com
 (2603:10a6:803:104::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13 via Frontend
 Transport; Wed, 4 Dec 2019 11:48:35 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT048.mail.protection.outlook.com (10.152.21.28) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 4 Dec 2019 11:48:35 +0000
Received: ("Tessian outbound 691822eda51f:v37");
 Wed, 04 Dec 2019 11:48:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: fe38f37264b717bf
X-CR-MTA-TID: 64aa7808
Received: from 65f79e651b26.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 11FFE7A2-17A4-4C25-98E1-1ADCFD12043C.1; 
 Wed, 04 Dec 2019 11:48:23 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 65f79e651b26.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 Dec 2019 11:48:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GweuT9zZqd4r1pYzXvAT/PxsLgnAS1srfVrK4tjyYrQ64x9lpWFNmz7yEKotwU5fT5UAbvIlBjMPlDjCfR05JuZ99Oju9pjlK5RXqX2YVekvbXzr4nahjdfq3XFvYmooY+6+JyIaQR/oD6jwJ7/Kgxl47EmSJSzlE3F+NpglAKHBE6fv3HJvQxo4Uze0z0isBUH+5hf21zr5QtOcStn6tKCoiedDZfH/1g/k1LjZwbSLFcuOUc+tTvY2k3f6+YCBHZPPV6S7WAcXz4Y5oPky9EngbBMwdWHWQscfpZswWFLhZ7AqdgFjVnKRJweYAtJT4A8VyAS9NP3m2zK/QyxTRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1DpZqtyyKVj6Kcjcgie43kZcxVAkBsJ624+DdPaI1+U=;
 b=BSO7e9jnLbzv9oaqonRL6ihnuTR1gUamAb51BnwsI4n6C5jG+g41toE/JW9aM/s55+6x7vn5W98htp0MRV2H52uQNSlNr5SgIOUmt5YRrau7lNtHiiw9whZ3XS+0UUCVHzIkFnFiL9VeZB2h19XI9e3OSaW57W85aO9+iIn7Jwa8GnKW9UHZyyaiyQWcDB6ag/C1FgGo1GdJA7wvTjUNRyFOTW1XSCURgQWtPf0DoSqo4BAseSbyEvVBU/zBpvhm/MhGDmY+t8Nn7dQUe0hOE6fJQHu6RGN8EfWpomJ+UWeWZIbrM9KhtfdqIdFoVtINWokaTSQ5XXCKFOsRcuUssg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3085.eurprd08.prod.outlook.com (52.133.15.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.19; Wed, 4 Dec 2019 11:48:21 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2495.014; Wed, 4 Dec 2019
 11:48:21 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 22/28] drm/i2c: tda998x: Use drm_bridge_init()
Thread-Topic: [PATCH v2 22/28] drm/i2c: tda998x: Use drm_bridge_init()
Thread-Index: AQHVqpi6ihgm+7aiek25lHH7QqgvMA==
Date: Wed, 4 Dec 2019 11:48:21 +0000
Message-ID: <20191204114732.28514-23-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: d8975875-fb5f-4831-461b-08d778afe4e2
X-MS-TrafficTypeDiagnostic: VI1PR08MB3085:|VI1PR08MB3085:|AM0PR08MB3761:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB376136A6871369B4990AE0E18F5D0@AM0PR08MB3761.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:176;OLM:176;
x-forefront-prvs: 0241D5F98C
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(199004)(189003)(2501003)(1076003)(478600001)(4744005)(6436002)(6512007)(8936002)(6486002)(54906003)(44832011)(4326008)(316002)(50226002)(8676002)(5660300002)(2906002)(81156014)(81166006)(6116002)(3846002)(66946007)(66476007)(66556008)(66446008)(64756008)(11346002)(186003)(2616005)(14454004)(52116002)(76176011)(99286004)(2351001)(25786009)(86362001)(26005)(5640700003)(6916009)(102836004)(71200400001)(305945005)(7736002)(71190400001)(6506007)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3085;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: KYxcctMOwWUkTYEl2YZvoI2q0VKnt8ZwsttTkeFnRqVDZL2q74pFkvX3WGX7GhxVSIvq5x/pfoN3Z1HthjiPOrVtTC8soU4u93Jf8IPvUD9YfJmqjuvIkE7AA93KhjhQIt/+dkg2889k+Jq5wXWFWTkKt4zwRp6Tp1JKBFeapwE3PKdj6n3LVd/L5DEAaqaEfbBeAmADab5/WsNEFcvC5Z69KZOcmlZWxJLm5JstvDYA0YjfKRTXbP+6vRGUAkyLR9PUFm5n7JZ23p4e9ly/sGl8DAHtd+WllRPrYQZQjHIPvI5IRywMphHEUTDmwmDmUD0RQ2WmpKdui+VgEmnLxKk4oomos1Ps2KOA85o3kJCqZTu0jXM4CkEmUOifaawtKnEeprdyO+CmtbOLu1G97dA/gBunUEtZy8+10nWZe+kl/Pw8/Lx0i5zhmH56+RGY
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3085
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(396003)(376002)(136003)(199004)(189003)(5660300002)(186003)(54906003)(316002)(6512007)(336012)(8676002)(81156014)(81166006)(2906002)(305945005)(7736002)(50466002)(356004)(36756003)(76130400001)(70586007)(4744005)(1076003)(14454004)(70206006)(22756006)(26826003)(478600001)(2351001)(86362001)(8936002)(5640700003)(2501003)(3846002)(11346002)(2616005)(50226002)(107886003)(4326008)(6506007)(25786009)(6916009)(6116002)(99286004)(6486002)(26005)(102836004)(23756003)(76176011)(8746002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3761;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8f123b41-01bb-42dd-7bba-08d778afdca5
NoDisclaimer: True
X-Forefront-PRVS: 0241D5F98C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AWV2jkTktz8OcBNi1RVGZ0BsWhaE7FABN84oLGTdfE/97ptRqjQyVh8YdMvmG8zO7gOX14d7Ia7DN5UEXdruDcXmp8jQb8AShehbGiCjj2zQtsBvYCiEMIt2+WR9fuM9IQJvboRnqJuJcNEtsXkPJAiiHnebo3cIm54qiu93W+8fiSXUYn+8bVGxn85EMIkiN70yaKL4Wb9Df8pleUgzw8LOf0oh2297BrxmjqZJr6TnGWhqBQCJEj56pmPt5lWZOGFaIS49ny+0LlIKNbXc9z2wwl3qFiF46LKG6i6dSY5dxa32esNXuXhjgJuwfVVLADnVO5t4QcwoA141zCqrNIiXtVpMiyu+nx3SvxR5di6rJjl34x5aBNG7d9qJrf5fxXxSAWV6fMmYN6qQ9ZhABkth9uqYQRlYGKkUVbbrFGMoIcBXOgrOhdKRrPZLrMKE
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2019 11:48:35.0328 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8975875-fb5f-4831-461b-08d778afe4e2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3761
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1DpZqtyyKVj6Kcjcgie43kZcxVAkBsJ624+DdPaI1+U=;
 b=Hks2Nh4tKLaPbxE7stJ3gDOp+YpzvWKVR7KJDXhD6UJ8JS5Gy+wZN0wuahVXRKdbISDc6Bnd8xV9/ymF1dK0896IvraSm6eyY0EYF2zoYC6LT+V7CeIt4OxBsL6VN3eWqiCTf7arhljkwI4NpJJ1ItnoZC0vYzYvznyETl0DiPE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1DpZqtyyKVj6Kcjcgie43kZcxVAkBsJ624+DdPaI1+U=;
 b=Hks2Nh4tKLaPbxE7stJ3gDOp+YpzvWKVR7KJDXhD6UJ8JS5Gy+wZN0wuahVXRKdbISDc6Bnd8xV9/ymF1dK0896IvraSm6eyY0EYF2zoYC6LT+V7CeIt4OxBsL6VN3eWqiCTf7arhljkwI4NpJJ1ItnoZC0vYzYvznyETl0DiPE=
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Russell King <linux@armlinux.org.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxt
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2kyYy90ZGE5OTh4
X2Rydi5jIHwgNiArLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNSBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTJjL3RkYTk5OHhfZHJ2LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vaTJjL3RkYTk5OHhfZHJ2LmMKaW5kZXggYTYzNzkwZDMyZDc1Li5m
N2RmYTY5NGFmZjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk4eF9kcnYu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTJjL3RkYTk5OHhfZHJ2LmMKQEAgLTE5NzQsMTEgKzE5
NzQsNyBAQCBzdGF0aWMgaW50IHRkYTk5OHhfY3JlYXRlKHN0cnVjdCBkZXZpY2UgKmRldikKIAkJ
CWdvdG8gZmFpbDsKIAl9CiAKLQlwcml2LT5icmlkZ2UuZnVuY3MgPSAmdGRhOTk4eF9icmlkZ2Vf
ZnVuY3M7Ci0jaWZkZWYgQ09ORklHX09GCi0JcHJpdi0+YnJpZGdlLm9mX25vZGUgPSBkZXYtPm9m
X25vZGU7Ci0jZW5kaWYKLQorCWRybV9icmlkZ2VfaW5pdCgmcHJpdi0+YnJpZGdlLCBkZXYsICZ0
ZGE5OTh4X2JyaWRnZV9mdW5jcywgTlVMTCwgTlVMTCk7CiAJZHJtX2JyaWRnZV9hZGQoJnByaXYt
PmJyaWRnZSk7CiAKIAlyZXR1cm4gMDsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
