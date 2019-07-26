Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 533E27605B
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 10:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A5FB6E89B;
	Fri, 26 Jul 2019 08:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30040.outbound.protection.outlook.com [40.107.3.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765696E89B
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 08:06:36 +0000 (UTC)
Received: from HE1PR08CA0054.eurprd08.prod.outlook.com (2603:10a6:7:2a::25) by
 AM6PR08MB4949.eurprd08.prod.outlook.com (2603:10a6:20b:e1::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.13; Fri, 26 Jul 2019 08:06:33 +0000
Received: from VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::208) by HE1PR08CA0054.outlook.office365.com
 (2603:10a6:7:2a::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.14 via Frontend
 Transport; Fri, 26 Jul 2019 08:06:32 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT061.mail.protection.outlook.com (10.152.19.220) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18 via Frontend Transport; Fri, 26 Jul 2019 08:06:30 +0000
Received: ("Tessian outbound 220137ab7b0b:v26");
 Fri, 26 Jul 2019 08:06:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d5257653352837db
X-CR-MTA-TID: 64aa7808
Received: from 0336800e1fa2.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.5.57]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 84EFA102-3C93-485C-87EA-D9EC5F7848F5.1; 
 Fri, 26 Jul 2019 08:06:20 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2057.outbound.protection.outlook.com [104.47.5.57])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0336800e1fa2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Fri, 26 Jul 2019 08:06:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H6I1/C1u6d1vY19FQmYbaHXnaItPMWCDmyIqi6E9OU2f4/nPnERFo2a7gpZRRHW/YjUi0cRenNMHeT1dvYi+ekbYzFoMBTa9MQOA8RgYihLgItSVlKg8Gd44U25L+3ADDJQl6lUuwdYO3j7h7jdZ1CTJ9iwR9foHzBjV5zhrS0F7Gn8br/quQziPx5ujTeEjSEbWZNQqCJzaUt9AQ8kIuWr4CkpMIQEmghv9iS5Hwi/12kH4EktAq1NPvTfhuRtkJi4Pp/uScnOGeTQti9xa1C9D/aSly+MBfHouF2Yt6Pma+yKUwWUaf/ON7sz8GqJTxITcD23bs43ULc48i18QeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUfoFgrtNmB/wYkagr+4myXoTJddbZcjxtK+yvMwbjY=;
 b=B8/FuAr99f8bA5RMw07NL2CKhMvz5hg0nH0/pFGojoNWso14QZVTwA+gWk2ndK3pjlmLjt/bBKtRjUEmUyfIvlVCFs7Hbepz3up/0tCZ9Ego7JoHTrXGYoUT+Vn6eih/yslgHsy7cNdVVLVrYS+xvIMFQ8oPrUAoR6ejRLsXJUgNWNKxzLQrGYsRVZyC0dDXarumrBvrY4RixyptFObCtMzCmMfXEE4CuWUqioGdG4YKJrZRv+mDY1Nwi0AOmQKie75OqTnaA3gMZ2VdRvSD4v49whKfLUd7lCsFyVjS7ebTkZePHXDimp7bnxZ28z+G+ZvpxiUN0dMG01+vcKcXBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB2941.eurprd08.prod.outlook.com (10.170.238.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.13; Fri, 26 Jul 2019 08:06:16 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::c091:c28c:bb1a:5236]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::c091:c28c:bb1a:5236%2]) with mapi id 15.20.2115.005; Fri, 26 Jul 2019
 08:06:16 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey
 <Brian.Starkey@arm.com>
Subject: [PATCH] drm/komeda: Adds more check in mode_valid
Thread-Topic: [PATCH] drm/komeda: Adds more check in mode_valid
Thread-Index: AQHVQ4j/fedIk6fUkkilpyBPPcwKlQ==
Date: Fri, 26 Jul 2019 08:06:16 +0000
Message-ID: <1564128364-23055-1-git-send-email-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0062.apcprd03.prod.outlook.com
 (2603:1096:203:52::26) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.9.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: a6585219-f81e-474f-c943-08d711a02a91
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB2941; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB2941:|AM6PR08MB4949:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4949DEC659053AC3DA3AD49D9FC00@AM6PR08MB4949.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:2449;OLM:2449;
x-forefront-prvs: 01106E96F6
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(199004)(189003)(50226002)(5660300002)(14454004)(486006)(476003)(54906003)(110136005)(256004)(2616005)(305945005)(6636002)(81166006)(14444005)(81156014)(186003)(68736007)(26005)(478600001)(2501003)(6436002)(71190400001)(52116002)(71200400001)(6486002)(66066001)(4326008)(36756003)(25786009)(53936002)(2906002)(316002)(6512007)(99286004)(3846002)(8936002)(102836004)(7736002)(55236004)(6116002)(2201001)(386003)(6506007)(86362001)(66946007)(66556008)(64756008)(66446008)(66476007)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2941;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: lswQ9Kg3RaILZGa9HKn06dhjVl0rXyobOsRSKiqTUGr4Lhsl6fTyVJTNE8Jmwh0tDX1Xl1KHKC7yEaE8XGq19fZ+DqLV3h/VlBt0uK2V0FxCf8IpjsUlhm9vdsFwIrtVse5jTGZdd7lTQrM45HQ1W0QUGJRYkzHFYgFan6UzkSG9GCfs+3ZZot+HXhPcYnZjxr5xnBdnPTZtqf3BELxNguPFe0JSayes9YX+gAe7OOMWULmu4aomHqEnaE4R1IHAy44+9a+H9/LXaYiJwyrrB59oNOxHs0Q91WRzBQ5Oxap/6HNIFgjA/0tN/d88uDZU1N2Cm3CUkFYadwdzNVbmwWxXLKHUOB6tjJJSWyppt5TdzFeQJrzlG7YwjsEFQCOSW/QsjGBNKx5JcTvr8Fm2S3UJwBuahBYPxiVjCRZTzW4=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2941
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(396003)(136003)(2980300002)(189003)(199004)(2616005)(476003)(126002)(336012)(63350400001)(63370400001)(356004)(386003)(6636002)(486006)(70206006)(2501003)(186003)(6486002)(36906005)(99286004)(26005)(316002)(70586007)(5660300002)(305945005)(6506007)(25786009)(2201001)(23756003)(86362001)(4326008)(14444005)(76130400001)(7736002)(8936002)(8746002)(102836004)(26826003)(6116002)(22756006)(6512007)(14454004)(50226002)(8676002)(81156014)(81166006)(2906002)(66066001)(47776003)(54906003)(110136005)(3846002)(36756003)(50466002)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4949;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: a1576bdc-ab5f-4370-c210-08d711a021f4
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR08MB4949; 
NoDisclaimer: True
X-Forefront-PRVS: 01106E96F6
X-Microsoft-Antispam-Message-Info: qls4uItwLnTFohjIxMLAx00DozB724Wk1kdyxI0R91hm8lbrFsQRf0n+7cQuMpTqI955DC3csQfUmhkhYs+lw9PUhiz4M6Aze6HkXfgfEabpKFV6ThpCXnL5usoeGmC1kVHyJxMMxUJCrAuJRpAxJ6W1lkigULNdBGkH4WMuA3U7LiJnyLg8As1HHP1mSD9hzbiXos/4XIkghgczmA5H9B641l/DyryRbdfAMMKKP7UqYNxLfJJ9GyeelqgJmD5fYLJqxDs3XMaxunhg1+def6BsS7tBXq9RN8+WZSrJi9b6LnJAnemcWeJPw+UFRNtZjbDW7zmqgGy5lJWkU+0LDksbpmt0XvUCBFRElvIkT+Qv5S0PupxBqeaIo1ba2kMZjWmstHhAB7J2v62q7xOBNEC9Wd0SqaYTmPwxKQgPlvo=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2019 08:06:30.1580 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6585219-f81e-474f-c943-08d711a02a91
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4949
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUfoFgrtNmB/wYkagr+4myXoTJddbZcjxtK+yvMwbjY=;
 b=QaZ0ARBZZDSzkjjyM4eWKs2XzgVijlSOySWmaU5tBeuGUeru06ZePsHjPiF6MtQfsznQmAV5uvCHHaEZvCIrs117emrzsWRGx23U8k584Pr4hiJIRgrWzEVjzd0pbHEpLslxV59Qfmw59Ncz7yr40BqzQ4GPYiRVbn9PFbwVKhU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUfoFgrtNmB/wYkagr+4myXoTJddbZcjxtK+yvMwbjY=;
 b=QaZ0ARBZZDSzkjjyM4eWKs2XzgVijlSOySWmaU5tBeuGUeru06ZePsHjPiF6MtQfsznQmAV5uvCHHaEZvCIrs117emrzsWRGx23U8k584Pr4hiJIRgrWzEVjzd0pbHEpLslxV59Qfmw59Ncz7yr40BqzQ4GPYiRVbn9PFbwVKhU=
X-Mailman-Original-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=temperror action=none header.from=arm.com;
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, "Jonathan Chai
 \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBhZGRzIHRoZSBjaGVja3MgZm9yIHZyZWZyZXNoLCBjcnRjX2hkaXNwbGF5IGFu
ZCBjcnRjX3ZkaXNwbGF5LgoKU2lnbmVkLW9mZi1ieTogTG93cnkgTGkgKEFybSBUZWNobm9sb2d5
IENoaW5hKSA8bG93cnkubGlAYXJtLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9jcnRjLmMgfCAyOCArKysrKysrKysrKysrKysrKysrKysrKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jIGIvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCmluZGV4IDJmZWQx
ZjYuLjAxN2Y2YjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX2NydGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9jcnRjLmMKQEAgLTQwMywxMSArNDAzLDM3IEBAIHVuc2lnbmVkIGxvbmcga29tZWRh
X2NydGNfZ2V0X2FjbGsoc3RydWN0IGtvbWVkYV9jcnRjX3N0YXRlICprY3J0Y19zdCkKIAlzdHJ1
Y3Qga29tZWRhX2RldiAqbWRldiA9IGNydGMtPmRldi0+ZGV2X3ByaXZhdGU7CiAJc3RydWN0IGtv
bWVkYV9jcnRjICprY3J0YyA9IHRvX2tjcnRjKGNydGMpOwogCXN0cnVjdCBrb21lZGFfcGlwZWxp
bmUgKm1hc3RlciA9IGtjcnRjLT5tYXN0ZXI7Ci0JdW5zaWduZWQgbG9uZyBtaW5fcHhsY2xrLCBt
aW5fYWNsazsKKwlzdHJ1Y3Qga29tZWRhX2NvbXBpeiAqY29tcGl6ID0gbWFzdGVyLT5jb21waXo7
CisJdW5zaWduZWQgbG9uZyBtaW5fcHhsY2xrLCBtaW5fYWNsaywgZGVsdGEsIGZ1bGxfZnJhbWU7
CisJaW50IGhkaXNwbGF5ID0gbS0+aGRpc3BsYXk7CiAKIAlpZiAobS0+ZmxhZ3MgJiBEUk1fTU9E
RV9GTEFHX0lOVEVSTEFDRSkKIAkJcmV0dXJuIE1PREVfTk9fSU5URVJMQUNFOwogCisJZnVsbF9m
cmFtZSA9IG0tPmh0b3RhbCAqIG0tPnZ0b3RhbDsKKwlkZWx0YSA9IGFicyhtLT5jbG9jayAqIDEw
MDAgLSBtLT52cmVmcmVzaCAqIGZ1bGxfZnJhbWUpOworCWlmIChtLT52cmVmcmVzaCAmJiAoZGVs
dGEgPiBmdWxsX2ZyYW1lKSkgeworCQlEUk1fREVCVUdfQVRPTUlDKCJtb2RlIGNsb2NrIGNoZWNr
IGVycm9yIVxuIik7CisJCXJldHVybiBNT0RFX0NMT0NLX1JBTkdFOworCX0KKworCWlmIChrY3J0
Yy0+c2lkZV9ieV9zaWRlKQorCQloZGlzcGxheSAvPSAyOworCisJaWYgKCFpbl9yYW5nZSgmY29t
cGl6LT5oc2l6ZSwgaGRpc3BsYXkpKSB7CisJCURSTV9ERUJVR19BVE9NSUMoImhkaXNwbGF5WyV1
XSBpcyBvdXQgb2YgcmFuZ2VbJXUsICV1XSFcbiIsCisJCQkJIGhkaXNwbGF5LCBjb21waXotPmhz
aXplLnN0YXJ0LAorCQkJCSBjb21waXotPmhzaXplLmVuZCk7CisJCXJldHVybiBNT0RFX0JBRF9I
VkFMVUU7CisJfQorCisJaWYgKCFpbl9yYW5nZSgmY29tcGl6LT52c2l6ZSwgbS0+dmRpc3BsYXkp
KSB7CisJCURSTV9ERUJVR19BVE9NSUMoInZkaXNwbGF5WyV1XSBpcyBvdXQgb2YgcmFuZ2VbJXUs
ICV1XSFcbiIsCisJCQkJIG0tPnZkaXNwbGF5LCBjb21waXotPnZzaXplLnN0YXJ0LAorCQkJCSBj
b21waXotPnZzaXplLmVuZCk7CisJCXJldHVybiBNT0RFX0JBRF9WVkFMVUU7CisJfQorCiAJbWlu
X3B4bGNsayA9IG0tPmNsb2NrICogMTAwMDsKIAlpZiAobWFzdGVyLT5kdWFsX2xpbmspCiAJCW1p
bl9weGxjbGsgLz0gMjsKLS0gCjEuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
