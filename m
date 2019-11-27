Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C28910B412
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 18:05:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 547E589624;
	Wed, 27 Nov 2019 17:05:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80080.outbound.protection.outlook.com [40.107.8.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0BD46E55C
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 17:05:42 +0000 (UTC)
Received: from AM6PR08CA0031.eurprd08.prod.outlook.com (2603:10a6:20b:c0::19)
 by AM0PR08MB3203.eurprd08.prod.outlook.com (2603:10a6:208:63::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.19; Wed, 27 Nov
 2019 17:05:40 +0000
Received: from DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::205) by AM6PR08CA0031.outlook.office365.com
 (2603:10a6:20b:c0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.17 via Frontend
 Transport; Wed, 27 Nov 2019 17:05:40 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT034.mail.protection.outlook.com (10.152.20.87) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Wed, 27 Nov 2019 17:05:40 +0000
Received: ("Tessian outbound a8ced1463995:v37");
 Wed, 27 Nov 2019 17:05:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e8bdaf8c06de47e7
X-CR-MTA-TID: 64aa7808
Received: from 9b35aa232de1.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 093DDD6A-8041-4F13-A044-08A894671602.1; 
 Wed, 27 Nov 2019 17:05:34 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9b35aa232de1.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 27 Nov 2019 17:05:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dgU7o2uauc43IeRoTmRgcN/Pa5oU5jceWHLyA9kG2sjzvmHBTF4rQ23XJxDG7hM8XpzjZ5mlJPQg89hFV33mltdOy6KQ/4EwnmxAxpO52hNOfRH24Mvv+J8ukEJozihd+KpI9Eo6Q0H9YY5ybMqbYCIZ2OOyWSj3wymvnr3WUfRSmEp1arEMGtSkEnfskH61xik4Z6zTRH21SXmFCEnm7ySE4SpmJ+hqJ5B71ARGd1vOlDjiFDLQdVi8bDbggUKhYsu3TxpdOrCkVYxyfQJIRF8DRuagsck1PHxl8G4ySm8UKST3+tVXtgr54bYKsRlUgqkdmoWdI32QsTiYqkRNdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1RkxB4FcHHJ9kJiSuN2bQh3PnSvvlqY9WJnFMwl0M7c=;
 b=Vu0YPcD4jjhf6K8ySSozx9+BtHR+zyHKEBkVlhsrx0MT0txVyoQWXvRBe6Z4g/9U27y7fBE1RhHZjJ8nUJJgqEBFCj5Y7LT9IXTZPYwypbjYLuBA0R85jJ3reS3Tu0XL6u3LfI/esC8QxZR4DaA79PHzu60kGk1QIutpaMICNXXV6JsF3ho8szspb9c6fZrrx9HZXqGUkACpUP6di1ghtqZIynVztbgHPysKLa/zu7XIzRUnf0GoMd65cQJXpGhVyOUwbaM1pAaVRAzblyGfau4jKzVQM/SqRVm8lcFOHXS0v3DXD+NaJ+SYvHQLjZqboVgE5dgcReowdcvzvTeNrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3392.eurprd08.prod.outlook.com (20.177.58.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.19; Wed, 27 Nov 2019 17:05:32 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2495.014; Wed, 27 Nov 2019
 17:05:32 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/mediatek: Fix build break
Thread-Topic: [PATCH] drm/mediatek: Fix build break
Thread-Index: AQHVpUTglbQGfFJTpU2EijDb8Zpv/Q==
Date: Wed, 27 Nov 2019 17:05:32 +0000
Message-ID: <20191127170513.42251-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LNXP265CA0033.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::21) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fd65a91d-2445-491e-2d5a-08d7735c07cc
X-MS-TrafficTypeDiagnostic: VI1PR08MB3392:|VI1PR08MB3392:|AM0PR08MB3203:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB320373648E3E0F091DB7DC9A8F440@AM0PR08MB3203.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:626;OLM:626;
x-forefront-prvs: 023495660C
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(199004)(189003)(6116002)(52116002)(3846002)(66556008)(66066001)(6486002)(44832011)(5640700003)(386003)(256004)(71200400001)(14444005)(4744005)(6436002)(6512007)(6506007)(6916009)(50226002)(478600001)(2501003)(25786009)(81156014)(8676002)(66946007)(316002)(8936002)(36756003)(2351001)(81166006)(14454004)(305945005)(1076003)(2616005)(7736002)(71190400001)(5660300002)(4326008)(26005)(54906003)(99286004)(186003)(66476007)(86362001)(66446008)(64756008)(7416002)(102836004)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3392;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: VL5g8Ufcgrq1hCg23Wz18xRzoEZePF+8V+kUfsC493Re5zBMWAR8zzfbQwi3tl7fGOPWLqBg3Ak+juBxwdKtVVIJY+AYVZzAq9fB4+KNKEFqBfEXxsR392ET7YSdcDA8FU7Hw/jh31fUpnkzTtpMefUHaF8xj07z+U99ROWyfS1VAhHJ15lu89NOfF6mqd92fky8p9CMOuHdN5lmCwQOAP1RSeBg+Po0EZ09fzAYMK+3CgfHOMWUIkRMHLRpx8lNq2kuc3ChX9GQdsr2GRkh36gk1vNC3KhDBtalgl7urgbwEp9mgyXNd/HwvVJZaNfm7Hbb1WZjTUh0OuSHaZFu7G/0122WCb0nvGROyVPYjalJiZ9l/1Oxep0bhNM4254XAupvxS/9fdDDMSpMlnf4krFor6lqPGWWvtl8Wzy6Bn6v750C+dEtVQNkf/I3c+OV
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3392
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(376002)(136003)(189003)(199004)(14444005)(386003)(6506007)(6916009)(186003)(86362001)(2501003)(7736002)(5640700003)(26826003)(107886003)(8676002)(14454004)(478600001)(305945005)(36756003)(99286004)(4326008)(4744005)(316002)(106002)(1076003)(25786009)(6486002)(54906003)(66066001)(6512007)(26005)(22756006)(47776003)(2616005)(6116002)(2906002)(356004)(76130400001)(3846002)(23756003)(81156014)(81166006)(50466002)(5660300002)(70586007)(336012)(70206006)(2351001)(102836004)(8936002)(50226002)(8746002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3203;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0e19c98e-4d7f-4033-61c1-08d7735c0325
NoDisclaimer: True
X-Forefront-PRVS: 023495660C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: voA4zci0b7BykhYFAIBroksDqMy4GRoJwlDosN2amZgpCPEZsJ9FRbIwPRWppnHur++00cDg2V9XbDoXx8zN2X0plUnKkIX8+phtu6XOxAG9NYRm9ocXbEN1gGHan0PKMhg4LSNII/+kUAjyEIodaz46Dl25R2Dfz9vrqv5Xq0ElkohtMlbiB3rXWjruhicvlkf0kRYSmeoFTn9asf2MYdiE2IQAeTeD5tjo/X8QUoY474JdUqqkm2zLYnA/ZmYu5NXuXMF5+7RAJjQZd1fUgjEoeIm34d8fPeOybgf6Vn/Ghm/GwPn2RIMJbakHkv8YHIhkvO1HdhIJZvRjczi0UubmHaq2hvWR7tCZYDXRch9wMmBwIu3f5/sOgjygJKBUZtS2LRzaSzTSkdndKg8/qcQNd6/wnU60/Wmgrs5uVGqrmEldUW+Cz2QPDihdFNtq
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2019 17:05:40.0711 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd65a91d-2445-491e-2d5a-08d7735c07cc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3203
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1RkxB4FcHHJ9kJiSuN2bQh3PnSvvlqY9WJnFMwl0M7c=;
 b=a8A46wVjKdKrbVaFZwZ81gTWUuOXPz5YQBxkQFwhWV+gTb3UJ0IBDiBuNiS63MHWe7y4pPdQEmYAU9A6p1t2wa7gJeh0OkTrHqH4J1Yx/T9aiF05AVh44z+Tn69EqANwjhnTlPquvVMZYLV4xocTG86cdiRMLKN9RM6m4/zK5rE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1RkxB4FcHHJ9kJiSuN2bQh3PnSvvlqY9WJnFMwl0M7c=;
 b=a8A46wVjKdKrbVaFZwZ81gTWUuOXPz5YQBxkQFwhWV+gTb3UJ0IBDiBuNiS63MHWe7y4pPdQEmYAU9A6p1t2wa7gJeh0OkTrHqH4J1Yx/T9aiF05AVh44z+Tn69EqANwjhnTlPquvVMZYLV4xocTG86cdiRMLKN9RM6m4/zK5rE=
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
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 nd <nd@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2F1c2VkIGJ5IGZpbGUgcmVtb3ZhbCB3aXRob3V0IGFkanVzdGluZyB0aGUgTWFrZWZpbGUuCgpG
aXhlczogZDI2OGY0MmU2ODU2ICgiZHJtL21lZGlhdGVrOiBkb24ndCBvcGVuLWNvZGUgZHJtX2dl
bV9mYl9jcmVhdGUiKQpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4K
Q2M6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+CkNjOiBQaGlsaXBwIFphYmVsIDxwLnphYmVs
QHBlbmd1dHJvbml4LmRlPgpDYzogTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWls
LmNvbT4KQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFz
c292IDxtaWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL01ha2VmaWxlIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9NYWtlZmlsZQppbmRleCA4MDY3YTRiZTgzMTEuLjUwNDRkZmI4ZTNkNiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL01ha2VmaWxlCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9NYWtlZmlsZQpAQCAtNyw3ICs3LDYgQEAgbWVkaWF0ZWstZHJtLXkg
Oj0gbXRrX2Rpc3BfY29sb3IubyBcCiAJCSAgbXRrX2RybV9kZHAubyBcCiAJCSAgbXRrX2RybV9k
ZHBfY29tcC5vIFwKIAkJICBtdGtfZHJtX2Rydi5vIFwKLQkJICBtdGtfZHJtX2ZiLm8gXAogCQkg
IG10a19kcm1fZ2VtLm8gXAogCQkgIG10a19kcm1fcGxhbmUubyBcCiAJCSAgbXRrX2RzaS5vIFwK
LS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
