Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC537D2730
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 12:30:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9566E1CE;
	Thu, 10 Oct 2019 10:30:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130053.outbound.protection.outlook.com [40.107.13.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A176E1CE
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 10:30:23 +0000 (UTC)
Received: from AM6PR08CA0016.eurprd08.prod.outlook.com (2603:10a6:20b:b2::28)
 by DB6PR08MB2822.eurprd08.prod.outlook.com (2603:10a6:6:1d::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.24; Thu, 10 Oct
 2019 10:30:19 +0000
Received: from DB5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::206) by AM6PR08CA0016.outlook.office365.com
 (2603:10a6:20b:b2::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.24 via Frontend
 Transport; Thu, 10 Oct 2019 10:30:18 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT021.mail.protection.outlook.com (10.152.20.238) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15 via Frontend Transport; Thu, 10 Oct 2019 10:30:17 +0000
Received: ("Tessian outbound 0939a6bab6b1:v33");
 Thu, 10 Oct 2019 10:30:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4b6e63a8a16d55a6
X-CR-MTA-TID: 64aa7808
Received: from 9c9f4f447ad7.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.8.52]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 942B22FE-5A49-4879-8534-068B5C1C307E.1; 
 Thu, 10 Oct 2019 10:30:09 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2052.outbound.protection.outlook.com [104.47.8.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9c9f4f447ad7.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Oct 2019 10:30:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RwknWVVUZKJRcNSpAbIpf/AI2AtbOqe8Gi9d5drX2l90ZQlP1zSUhMJHIXgQGNNx+6MRRWU+ZzZJazx4CRXRxOuFm5GkP0OksRoicaXhC20+PmHMd7mvOfQkU34MhNz0cydk5sUk9BVxOlJom9wk2IQtKK/qb1gkm0yzkNKofvm8mcWhMy7vKfs6+kHlZsUVTB9uvuIKJXJhCO/nismojMxE6Ky5/DUIVoNGa7R//c3z9n1UtAIB+hmObAk9kOhbi20Si2Cp2ay5yUnRbO6h6HkGCQF5tevkNMk6blKcOKOnYaz11Pt7xe7YqLkduUFzdkB62arlIArViVWSOBAQxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aO3ca2kTzKqEQ4c4xLvysJUSS7b3CP42BXAWZNLISMg=;
 b=XHLvxJnfYLHZ1s44fDSaBOGODS9nMVoiTns9tYXUVhjNCemd2AVBBZWSlJKTmSRvgmTgEo7Z7DLqGuHR4tTSAa9FZoEbinobo32I1ACHQ7SvThTTb0MCGBSgGnvSfY0T3Dsyp1FcbLaDGIoS4Av8EWTn5/YA66LUGo33e5OkBm6UPyiP4+pEHUiwbCDT7FEfSz/Ra+vf7aHd0UwXFmAYICtt+kj4wCKI7VT4VfsIcZ0cTG+HfrNuPMfJyn/uYFw+ouqrNVB8eGWFCF+H10o/xZ1LsG2u0udwThjYs72kVLoO06tlliytUuPnTBVAO/h16OzJSwDOSVwXO/hahEJHFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB5552.eurprd08.prod.outlook.com (20.179.28.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Thu, 10 Oct 2019 10:30:08 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b%6]) with mapi id 15.20.2347.016; Thu, 10 Oct 2019
 10:30:08 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/komeda: Don't flush inactive pipes
Thread-Topic: [PATCH] drm/komeda: Don't flush inactive pipes
Thread-Index: AQHVf1Wv2yHbm0bBS0KhNr2i/1d6YQ==
Date: Thu, 10 Oct 2019 10:30:07 +0000
Message-ID: <20191010102950.56253-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.54]
x-clientproxiedby: LO2P265CA0454.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::34) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 25bd2221-1ab3-421d-5d90-08d74d6cd82d
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR08MB5552:|VI1PR08MB5552:|DB6PR08MB2822:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR08MB2822E703229940717FEDD5E28F940@DB6PR08MB2822.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:210;OLM:210;
x-forefront-prvs: 018632C080
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(39860400002)(346002)(376002)(366004)(189003)(199004)(386003)(6506007)(6486002)(4744005)(14454004)(1076003)(5640700003)(2906002)(6436002)(102836004)(2501003)(81166006)(6916009)(8676002)(81156014)(50226002)(36756003)(486006)(476003)(86362001)(2616005)(8936002)(186003)(26005)(6512007)(2351001)(52116002)(44832011)(3846002)(71200400001)(6116002)(256004)(71190400001)(5660300002)(99286004)(14444005)(66446008)(305945005)(66946007)(54906003)(64756008)(66556008)(66476007)(478600001)(4326008)(25786009)(66066001)(316002)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB5552;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: O3E/VkTguXfS7hHZHCVxt4j3qrQ0dAJFdsiOidmum9Dil6J39bPPCAw+bejUfK65g7Gtt3Om0o8gZ3lZXKDUwSsMerM/rsT580FVxmgieZ3ZQQnTQ1BqrZ14hBwFZJ/aiTqA5Gkfxb/Q4UNNffQDEVlz0jbX8Zq2ky1V/Mxaq9XbGSOsc7Z0yUti5Yk7LuUp0kIh/wcK8Swqmd126oScPqp+WqLfsUMaV4M7YWYIW7ljZzUhWJ5J52oX4qZquCCX0fjDQwIMuZL1e1zt0/dH0pTOAxqZyKEm8lzeTZN/c+TFdzuI0CB4gTj2McSkFSjInXAcSvCGXrMG0vRJv77IDMaZhxnlr8Ri4tqOHtU4aTxX1q/O3zUZkE/vh2soQgjs8EATMXDBLY8fXcgGEYOyo0mwkn76w+5nDHx1EvapkcQ=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5552
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(39860400002)(136003)(189003)(199004)(8676002)(25786009)(8936002)(81166006)(50226002)(107886003)(23756003)(36756003)(54906003)(14444005)(6486002)(2351001)(47776003)(50466002)(3846002)(5640700003)(4326008)(6116002)(8746002)(2501003)(76130400001)(102836004)(14454004)(22756006)(81156014)(386003)(5660300002)(4744005)(316002)(6512007)(6506007)(26005)(486006)(476003)(2616005)(126002)(336012)(70586007)(66066001)(7736002)(478600001)(86362001)(70206006)(356004)(2906002)(186003)(305945005)(99286004)(1076003)(63350400001)(26826003)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR08MB2822;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1f486e70-896a-402f-f362-08d74d6cd257
NoDisclaimer: True
X-Forefront-PRVS: 018632C080
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fYG/l29CaU6moZ00qY9ZolJBTHLW9P9mRuUBbVlHkVi/5zPE6LXPcQ6o1LRBw4WT7qzmUwEOC2WuWwetG2U1ecZaKBjjcQfoHU6YL8PJ3ZLIcvMYxcIy6hyV8sh+U83V+wtkK2IXHk7u/lLAKqPnEajVeaSb4OewXIk3N/pAkPLSVIqVcqIhZzPDTNEcXE+yVsCq3toCgn+TUw3Jyul1kRFsqw4a3Yyj2LhvKo1jfdZ/beWlfDA60owG2RQXW2uvLyusSoU7FkDVdCs7IgoujHJZ0NB3nvzqda+YhyX6xiy7JhVaHgBQ9wcU3WVXwGpP5s09zMybi70FpCfvq9c6u11xTne5BrGBe/m/krOKJhIVsaJQEl8STTt+ymuTb9CaBS3zTN266VF8Ad4hg9xF3MED9msXb29BU36z+ZMjLZg=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2019 10:30:17.4352 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25bd2221-1ab3-421d-5d90-08d74d6cd82d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2822
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aO3ca2kTzKqEQ4c4xLvysJUSS7b3CP42BXAWZNLISMg=;
 b=VxgilF6zcXrR6wwdjLPTiFsC0Fzo9ZtgWzBzxgqDhxoBBItsipi4LLzMX/9p4sy1yrCTFwIIivYAb8QjVNCQquPXhM6kzXdf3FVIQ1nMgy05qbRYk+/ANYlbBVRHkMmxMlr0ky8VEarbTLsSOhyZlFugOI5Zzl+kSopJ0q8uPhE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aO3ca2kTzKqEQ4c4xLvysJUSS7b3CP42BXAWZNLISMg=;
 b=VxgilF6zcXrR6wwdjLPTiFsC0Fzo9ZtgWzBzxgqDhxoBBItsipi4LLzMX/9p4sy1yrCTFwIIivYAb8QjVNCQquPXhM6kzXdf3FVIQ1nMgy05qbRYk+/ANYlbBVRHkMmxMlr0ky8VEarbTLsSOhyZlFugOI5Zzl+kSopJ0q8uPhE=
X-Mailman-Original-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=none
 action=none header.from=arm.com;
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
 David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "james qian
 wang \(Arm Technology China\)" <james.qian.wang@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SFcgZG9lc24ndCBhbGxvdyBmbHVzaGluZyBpbmFjdGl2ZSBwaXBlcyBhbmQgcmFpc2VzIGFuIE1F
UlIgaW50ZXJydXB0CmlmIHlvdSB0cnkgdG8gZG8gc28uIFN0b3AgdHJpZ2dlcmluZyB0aGUgTUVS
UiBpbnRlcnJ1cHQgaW4gdGhlCm1pZGRsZSBvZiBhIGNvbW1pdCBieSBjYWxsaW5nIGRybV9hdG9t
aWNfaGVscGVyX2NvbW1pdF9wbGFuZXMKd2l0aCB0aGUgQUNUSVZFX09OTFkgZmxhZy4KClNpZ25l
ZC1vZmYtYnk6IE1paGFpbCBBdGFuYXNzb3YgPG1paGFpbC5hdGFuYXNzb3ZAYXJtLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYyB8IDMgKyst
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYwppbmRleCA4ODIw
Y2UxNWNlMzcuLmFlMjc0OTAyZmY5MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfa21zLmMKQEAgLTgyLDcgKzgyLDggQEAgc3RhdGljIHZvaWQga29t
ZWRhX2ttc19jb21taXRfdGFpbChzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqb2xkX3N0YXRlKQog
CiAJZHJtX2F0b21pY19oZWxwZXJfY29tbWl0X21vZGVzZXRfZGlzYWJsZXMoZGV2LCBvbGRfc3Rh
dGUpOwogCi0JZHJtX2F0b21pY19oZWxwZXJfY29tbWl0X3BsYW5lcyhkZXYsIG9sZF9zdGF0ZSwg
MCk7CisJZHJtX2F0b21pY19oZWxwZXJfY29tbWl0X3BsYW5lcyhkZXYsIG9sZF9zdGF0ZSwKKwkJ
CQkJRFJNX1BMQU5FX0NPTU1JVF9BQ1RJVkVfT05MWSk7CiAKIAlkcm1fYXRvbWljX2hlbHBlcl9j
b21taXRfbW9kZXNldF9lbmFibGVzKGRldiwgb2xkX3N0YXRlKTsKIAotLSAKMi4yMy4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
