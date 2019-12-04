Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E712C112A7C
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 12:48:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C38766E8C7;
	Wed,  4 Dec 2019 11:48:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0610.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::610])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316A06E8C7
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 11:48:18 +0000 (UTC)
Received: from VI1PR08CA0234.eurprd08.prod.outlook.com (2603:10a6:802:15::43)
 by VI1PR0801MB2000.eurprd08.prod.outlook.com (2603:10a6:800:8e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12; Wed, 4 Dec
 2019 11:48:15 +0000
Received: from AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::203) by VI1PR08CA0234.outlook.office365.com
 (2603:10a6:802:15::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.20 via Frontend
 Transport; Wed, 4 Dec 2019 11:48:15 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT033.mail.protection.outlook.com (10.152.16.99) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 4 Dec 2019 11:48:15 +0000
Received: ("Tessian outbound 92d30e517f5d:v37");
 Wed, 04 Dec 2019 11:48:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4ece2eb33055af6f
X-CR-MTA-TID: 64aa7808
Received: from a83b0422c187.4
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FAFB5E4E-1174-4539-8B17-A85DE494B0F6.1; 
 Wed, 04 Dec 2019 11:48:09 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a83b0422c187.4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 Dec 2019 11:48:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hsNUgPB5be3q+u2kjNpYqyOrjh19A+ZBQOk0vFj1jOjwjc+rFqk3gsLY8pwGubavO2igxfgeZVe8UVSpS3abFXdWPBSG6LBY9yv8kHtTutj87WHgusFlK20+kRTevLEgz1elLRZPiRUYKKvBC6jRGSXi9iuXBv5X5f6hfoGrhEmy1yw9ZRAJMYNH1XAqtaXxYiOWHh10eZ+B9wNIt64unWBrY30lpnOX4uYB9JfORZPubFHh5NjrFSMe9GNTCfo21WPf6CIk2EpAh1SlOa8Tr61nMwXMeqwsSM6JrhlZ8eK5bhZ5TJ0tzrzlxw1K0AMb7RNHMlJWd5amVWnjw00/Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+gIcXwMEpaWbNQmu/uXel91VQjEKWqcp2Xv7hI8VDc=;
 b=eZmAWafuGxFKmDTVIuTq11MmpOQhk+m1lNBV8j53GX9aIzaoOgJ8NMjgC3T+fdq287nGaeVpo9CLVldltmntr8yjNcXjg8Bd4L0xCC2Su/MvV6xBUCv80UxrAP++MAeyKq0Ce98hFv0/7uMTZyZVfT9o6n0rU73OFQxYh+aBgqRDCSZHrgw1rfCNvkgZT/pmrXeddp7EmUffN9qe25uPeFAKoTF7tqkVogeeMjsVwAOQm6ZYSP13dPtsHodA+F6pJ6mA0nspc3woWUvlpgk+I44A3ujqMdNYhAtiPMp76uLsakwxpk2MIMw/bgzX7TJe4vpL2FRptQni9GYQyHqsHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3085.eurprd08.prod.outlook.com (52.133.15.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.19; Wed, 4 Dec 2019 11:48:07 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2495.014; Wed, 4 Dec 2019
 11:48:07 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 06/28] drm/bridge: lvds-encoder: Use drm_bridge_init()
Thread-Topic: [PATCH v2 06/28] drm/bridge: lvds-encoder: Use drm_bridge_init()
Thread-Index: AQHVqpixLTYeoXxq3k24Lvd2CHXKqA==
Date: Wed, 4 Dec 2019 11:48:07 +0000
Message-ID: <20191204114732.28514-7-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: bd4028d3-238b-45cb-65e8-08d778afd95b
X-MS-TrafficTypeDiagnostic: VI1PR08MB3085:|VI1PR08MB3085:|VI1PR0801MB2000:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0801MB2000FA6632C2DF1770C853E58F5D0@VI1PR0801MB2000.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
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
X-Microsoft-Antispam-Message-Info-Original: 5WwEJXi/rYpSxmxs9WPWYjLnVWnXyrs7wSFhsXfqqn+TINeuLsOYM7hf2l8Mg+AzWB+7iEaEhdyv7gRanHEXNn+Iqc8KcfrqnbVRpDeCIAtEPlbR+CEkFkydgSeGRz0asM0FWkyj+stN5P2wUjh0HONL6RO/kXYuLpph8wQyjkex+kbE83aUPI13EBN982G2KYyCtXZ52Ibv1qZLc0UD3vVsoUDDibUGAW9HXDLpmtfTF0wQ9GeEjFHa+Q84TyFXbJl+GsU6zOhJDUR0A5jF3LpLSw86rIx6sK6qmh40WRXpId0h3CuwTdN768pSrHE4vU1VMlBe8kh3krjlmlrwYnqxmON4BZtRxHa5gQP3x3OmCAAGQcD7rnelpedZyYw3L+ET+eR2N83P/vaSHr4IDptsPpxfILGJ76LCjMOi7Qe7mKwWpK0tFSEVq2wenQ+f
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3085
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(346002)(376002)(189003)(199004)(2906002)(50226002)(2616005)(11346002)(6916009)(305945005)(76176011)(7736002)(5660300002)(6506007)(26005)(102836004)(336012)(81156014)(316002)(6486002)(4326008)(186003)(107886003)(81166006)(36906005)(8676002)(8936002)(8746002)(99286004)(2351001)(54906003)(5640700003)(1076003)(6116002)(3846002)(70586007)(86362001)(70206006)(14454004)(36756003)(356004)(23756003)(22756006)(76130400001)(50466002)(2501003)(26826003)(5024004)(6512007)(25786009)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0801MB2000;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 34f5fbeb-c1a6-4b40-8db5-08d778afd434
NoDisclaimer: True
X-Forefront-PRVS: 0241D5F98C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cglmmPui4Sw4Bvj+PT7U4jG0GDoYj6pLxfYneH1h+I2CdvbAUhASo8U9MLA2cRFTATb/f/HMiogaP+0Iyl8Qleg9Qfy35l0gG5h8eUkb/P+Egs7/Nim49UPRiWIhbefUsog69k4VzRHq/Rz5iH1VazhFQPaTaRDupQKkHknnssXSNsegVMRoTxubE31cppyHxybq3wDfxgCuFktk8tjl+xUkziiPlqYDQ23fDxqfdaBChiZP2ttnVNf/IWeUVfu0yoYNGMPEOsGu6NMgcgYuvuAGIKj6yUEMYqU8qW3x0oTLQXe7LEIKbx+meS1PftgOSQDP0/VqJRl0sOSwz1AWKRMCz4RyL0UG4qyMCydxDYh+O/65d9EBl/rg+1vnmGDUEqIdyYOmGZ+i+LfnAGlGLepx7JbW0J4/fLINEV0JhmWwgDNlyPKw8JDbK0A9xV6R
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2019 11:48:15.6889 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd4028d3-238b-45cb-65e8-08d778afd95b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB2000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+gIcXwMEpaWbNQmu/uXel91VQjEKWqcp2Xv7hI8VDc=;
 b=c9jMVbTc0lbvCjlCdGsj/BZ0F7HpLPRahzoWiifeiZgKgdL+hAe0vaZyYvRhKVxyiboMOsgY77DyeyVqb3Qahzl25A/ix3lgDdsdjSCX5E9uhC4NowkZQf05kLhBK4uMkIVtupiFp364uPC5Os3y4He4Nfg9Al8QPTNRfcRn6H8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+gIcXwMEpaWbNQmu/uXel91VQjEKWqcp2Xv7hI8VDc=;
 b=c9jMVbTc0lbvCjlCdGsj/BZ0F7HpLPRahzoWiifeiZgKgdL+hAe0vaZyYvRhKVxyiboMOsgY77DyeyVqb3Qahzl25A/ix3lgDdsdjSCX5E9uhC4NowkZQf05kLhBK4uMkIVtupiFp364uPC5Os3y4He4Nfg9Al8QPTNRfcRn6H8=
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
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sdmRz
LWVuY29kZXIuYyB8IDcgKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2x2ZHMt
ZW5jb2Rlci5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sdmRzLWVuY29kZXIuYwppbmRleCBl
MjEzMmE4ZDUxMDYuLjE1NTQwNjUxMDQxNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9sdmRzLWVuY29kZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2x2ZHMtZW5j
b2Rlci5jCkBAIC0xMTIsMTEgKzExMiwxMCBAQCBzdGF0aWMgaW50IGx2ZHNfZW5jb2Rlcl9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQlyZXR1cm4gUFRSX0VSUihsdmRzX2Vu
Y29kZXItPnBhbmVsX2JyaWRnZSk7CiAKIAkvKiBUaGUgcGFuZWxfYnJpZGdlIGJyaWRnZSBpcyBh
dHRhY2hlZCB0byB0aGUgcGFuZWwncyBvZl9ub2RlLAotCSAqIGJ1dCB3ZSBuZWVkIGEgYnJpZGdl
IGF0dGFjaGVkIHRvIG91ciBvZl9ub2RlIGZvciBvdXIgdXNlcgotCSAqIHRvIGxvb2sgdXAuCisJ
ICogYnV0IHdlIG5lZWQgYSBicmlkZ2UgYXR0YWNoZWQgdG8gb3VyIG9mX25vZGUgKGluIGRldi0+
b2Zfbm9kZSkKKwkgKiBmb3Igb3VyIHVzZXIgdG8gbG9vayB1cC4KIAkgKi8KLQlsdmRzX2VuY29k
ZXItPmJyaWRnZS5vZl9ub2RlID0gZGV2LT5vZl9ub2RlOwotCWx2ZHNfZW5jb2Rlci0+YnJpZGdl
LmZ1bmNzID0gJmZ1bmNzOworCWRybV9icmlkZ2VfaW5pdCgmbHZkc19lbmNvZGVyLT5icmlkZ2Us
IGRldiwgJmZ1bmNzLCBOVUxMLCBOVUxMKTsKIAlkcm1fYnJpZGdlX2FkZCgmbHZkc19lbmNvZGVy
LT5icmlkZ2UpOwogCiAJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgbHZkc19lbmNvZGVyKTsK
LS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
