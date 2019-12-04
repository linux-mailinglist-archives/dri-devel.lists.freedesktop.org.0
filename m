Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C601A112A86
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 12:48:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B05916E8D4;
	Wed,  4 Dec 2019 11:48:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1f::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 219746E8CA
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 11:48:20 +0000 (UTC)
Received: from VI1PR08CA0271.eurprd08.prod.outlook.com (2603:10a6:803:dc::44)
 by DB6PR0801MB2054.eurprd08.prod.outlook.com (2603:10a6:4:77::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13; Wed, 4 Dec
 2019 11:48:18 +0000
Received: from DB5EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::202) by VI1PR08CA0271.outlook.office365.com
 (2603:10a6:803:dc::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12 via Frontend
 Transport; Wed, 4 Dec 2019 11:48:17 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT059.mail.protection.outlook.com (10.152.21.175) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 4 Dec 2019 11:48:17 +0000
Received: ("Tessian outbound d55de055a19b:v37");
 Wed, 04 Dec 2019 11:48:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5650f19524fa2463
X-CR-MTA-TID: 64aa7808
Received: from a83b0422c187.10
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EF83EFD7-450A-4D9A-924A-75C692893502.1; 
 Wed, 04 Dec 2019 11:48:11 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 a83b0422c187.10 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 Dec 2019 11:48:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YEfaWgHCCcjs2b6hm3SHyoTteuuye8fF5TYcc0GTm0qabvibFU/pU93XH4HOss2ZR43ddepnoXnj2d0XdVPa1zPZMYi5vInLKBYdYPcDohFuZcLI8PT1FUoV1gSAhbG8D2qFsTJw0B4ArQwbA2JNx6qy0GIM8SybkPu3JHMV/y/1aspUq/u6G3/BvcCaCbWbyEJ5l/4geKNOhsZLDTbNffKxJVisqN5NDCfi6XYje338m/ZmkIm1Fl2ZgBrBzusn6qf/xTKPAIDV4rwLrszm0+7D9JziSPZAaMWW6STCoZ+QzGxycVlNOl9SVwFH850ajv6kTuso2Ybo2DTpq4KnaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKX2QEoiMcI48kOVP6yPNKCVpbRPSGyLW7NiFE2+cdA=;
 b=aCo57wA707PenYc5hwFoCCAUgIODSKRf6Tgvp9Jo8rZmI4IH8zFp6ZGu6YsHyIozQuZ3a31SCs8E9O6L/wrMazIJkJrN/o7aKMqU4HxH7wDjgP1H4Xmnp/eIivJLca5Z7on2j6pQNK9qxVRbV0uWAyPjan9yuwSQMz27hhLMsCUYxMHrLznP8cm/TSsFRjNph3BLW+aLsZgT1UgQM27MPBS9D1JZtYkOiEHnnMM/PszF6Ky13/Q2MiCde0ZgGA4iZ2Mkst6YBuYOuHkOimCC6MtlxJNDQCAvPpXd6T80IenlZXiRX5iAX05Q2sRv1owig7oyxtFuww+U4EB6PjmhgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3085.eurprd08.prod.outlook.com (52.133.15.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.19; Wed, 4 Dec 2019 11:48:10 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2495.014; Wed, 4 Dec 2019
 11:48:10 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 09/28] drm/bridge: panel: Use drm_bridge_init()
Thread-Topic: [PATCH v2 09/28] drm/bridge: panel: Use drm_bridge_init()
Thread-Index: AQHVqpizLmyi9uuCLEufX5SpMevoGw==
Date: Wed, 4 Dec 2019 11:48:10 +0000
Message-ID: <20191204114732.28514-10-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: fec9c9bc-33d4-4860-6bd2-08d778afda91
X-MS-TrafficTypeDiagnostic: VI1PR08MB3085:|VI1PR08MB3085:|DB6PR0801MB2054:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0801MB2054D9C41E860226016B9A3B8F5D0@DB6PR0801MB2054.eurprd08.prod.outlook.com>
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
X-Microsoft-Antispam-Message-Info-Original: O4EEZbtDM4zoQx3SSpZjXEJwGiDU5/SV48sxyj4/tEJ5Cm1+41yPtR9I8l2s0jggcYDbr2OL+FLra2bQP5Wj0RPklmRkd08/SdM1JIxsuTCwgoJIzWABw+1Sel0TBHyONEls57xmnMvr1UUy/RzLvji6B9I2W58XQEilpzV6KaiJ6WCOXBdeRes4z2hZlwoB+3uVo9ipcUQ+ZIEzhgiNWNVxhfKDgnBdv8OVyiPA5il6GfjWgtwlhtJXxSzfS+4qg3WZWKMu56DOfcVH//AKizPOcIJgcdIP4cKYsWgsUArMDCpQuiogmi6304uohMm2jcYVqMkIlqLlbq1kRCWg2abCp24Ym0zCdp4JKYCtA6HsxaN810XT/zrajQathrc/2P6A6dIpQbB70CmM02wLdWM6qQd6bP3bzVNn+g6rfMNxpcfU/Zx0f4YM6DwRu1N6
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3085
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(396003)(346002)(189003)(199004)(76176011)(1076003)(4744005)(26826003)(6512007)(36756003)(81166006)(107886003)(50226002)(81156014)(4326008)(6116002)(3846002)(5660300002)(478600001)(305945005)(2501003)(6916009)(86362001)(8936002)(25786009)(8746002)(76130400001)(14454004)(22756006)(7736002)(99286004)(5640700003)(8676002)(2351001)(102836004)(186003)(6486002)(356004)(2906002)(54906003)(23756003)(6506007)(316002)(70586007)(336012)(11346002)(2616005)(50466002)(70206006)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0801MB2054;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4f489c83-9237-4450-74f9-08d778afd5d0
NoDisclaimer: True
X-Forefront-PRVS: 0241D5F98C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ruXQtfULRsvM7BBjYwykdTfl51j62hKODWYaEseUzYH9MWPS4eYTghe6V8m+cyAbqYRdvRMUzrCoZCIUEvHwwe9ZF58zfQfSfSuc5tLsMLpxucDZwzcgM/uwqVo3qKX33GOckj1xmzovfXoV3ZGWKjUJleNBW/GYAeGPg8Ip4TyYEiidpjvX1TSFVXxbnlPGYfyBTlJ6ROa6aqas4425Q5VJ8yhih8EFH0eDMMwaG3CFDug1vljm0lAVxHSdZvgg4+s7+MZlZikGNHUFvKOXDmVEanjpxhsAZoMSu+3o3J4Ry7+wv9FE7CTNbsphdHSlec1Wdy9QVTJrK6mnOY89sw89w92VAI1TLYjW95tPaJcXSPWDQ93OhYU8OZcSEexYQ2L56hBI89aLQR19h3sw3OMKn5C0AGRmVWk5ybqIQHWng5MwZzI8mInO8N59Nd+T
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2019 11:48:17.7127 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fec9c9bc-33d4-4860-6bd2-08d778afda91
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2054
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKX2QEoiMcI48kOVP6yPNKCVpbRPSGyLW7NiFE2+cdA=;
 b=8waFNdZlu5B7rSyhtJoawQEVA+7W+8VQaPdrKX0vIBMhy57U+ZCvU1HZR+rJXU5onDq3IgnpVHDJRigqog/q3E82R48FEHzPucmRsp7Bm8IIgw7EhJjXh2E+pYDA+AKBUOHxXoUPqULrxTNuvlQCjnx1TafjsSTzDGrfCu46NdM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKX2QEoiMcI48kOVP6yPNKCVpbRPSGyLW7NiFE2+cdA=;
 b=8waFNdZlu5B7rSyhtJoawQEVA+7W+8VQaPdrKX0vIBMhy57U+ZCvU1HZR+rJXU5onDq3IgnpVHDJRigqog/q3E82R48FEHzPucmRsp7Bm8IIgw7EhJjXh2E+pYDA+AKBUOHxXoUPqULrxTNuvlQCjnx1TafjsSTzDGrfCu46NdM=
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
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9wYW5l
bC5jIHwgNyArKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA1IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFuZWwuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFuZWwuYwppbmRleCBmNGUyOTNlN2NmNjQuLjkxZDY4ZDAz
MzdjYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9wYW5lbC5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFuZWwuYwpAQCAtMTkyLDExICsxOTIsOCBAQCBzdHJ1Y3Qg
ZHJtX2JyaWRnZSAqZHJtX3BhbmVsX2JyaWRnZV9hZGRfdHlwZWQoc3RydWN0IGRybV9wYW5lbCAq
cGFuZWwsCiAJcGFuZWxfYnJpZGdlLT5jb25uZWN0b3JfdHlwZSA9IGNvbm5lY3Rvcl90eXBlOwog
CXBhbmVsX2JyaWRnZS0+cGFuZWwgPSBwYW5lbDsKIAotCXBhbmVsX2JyaWRnZS0+YnJpZGdlLmZ1
bmNzID0gJnBhbmVsX2JyaWRnZV9icmlkZ2VfZnVuY3M7Ci0jaWZkZWYgQ09ORklHX09GCi0JcGFu
ZWxfYnJpZGdlLT5icmlkZ2Uub2Zfbm9kZSA9IHBhbmVsLT5kZXYtPm9mX25vZGU7Ci0jZW5kaWYK
LQorCWRybV9icmlkZ2VfaW5pdCgmcGFuZWxfYnJpZGdlLT5icmlkZ2UsIHBhbmVsLT5kZXYsCisJ
CQkmcGFuZWxfYnJpZGdlX2JyaWRnZV9mdW5jcywgTlVMTCwgTlVMTCk7CiAJZHJtX2JyaWRnZV9h
ZGQoJnBhbmVsX2JyaWRnZS0+YnJpZGdlKTsKIAogCXJldHVybiAmcGFuZWxfYnJpZGdlLT5icmlk
Z2U7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
