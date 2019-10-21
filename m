Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE891DF386
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 18:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 353B26E183;
	Mon, 21 Oct 2019 16:47:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150079.outbound.protection.outlook.com [40.107.15.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 742DB6E183
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 16:47:29 +0000 (UTC)
Received: from VI1PR08CA0177.eurprd08.prod.outlook.com (2603:10a6:800:d1::31)
 by DB7PR08MB3900.eurprd08.prod.outlook.com (2603:10a6:10:33::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Mon, 21 Oct
 2019 16:47:25 +0000
Received: from VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::209) by VI1PR08CA0177.outlook.office365.com
 (2603:10a6:800:d1::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.21 via Frontend
 Transport; Mon, 21 Oct 2019 16:47:25 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT028.mail.protection.outlook.com (10.152.18.88) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.23 via Frontend Transport; Mon, 21 Oct 2019 16:47:24 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Mon, 21 Oct 2019 16:47:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b2b627294ba105bc
X-CR-MTA-TID: 64aa7808
Received: from e73906f62ecb.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.13.52]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3E7EF3FF-36EC-4CAC-AE51-7A41C97904CD.1; 
 Mon, 21 Oct 2019 16:47:17 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e73906f62ecb.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 21 Oct 2019 16:47:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ispBJWdzjzVJqhSOPVru+/3jwKYXJA9SoxiN32xXG7meIBSobfLGiZwi4WDFb3FankZFWq/2kgc0zh4UWBCDl81FBfQuHPjV4bgMO6huQoBbS38ez+CB9UyX+SmmWpak+HIWTwJ/UtQjErmPZvho5qWUYw26T8X1ZyaMQfbsO28veuiKpWDfTDI2Syb1Nta5pGFHGMG/7ZhwzBk1JVmXNQS8MAYbZ00uKdIKHEnXWd+dXj9lbj5WkyQlM90dVNdbRpnZhaIPDmqUtdXl2ozQCf8JMavSG2GnOaMhEh9iE7Yql9gzb7rNxmQPSSiBgOHBvfI6l1pnJWevopMXFdQGlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2lFNENYY2WBTzISF1cViWb9ogN+++Rr/m8RIJQFVph0=;
 b=mImirJsU7w+enaAWb6S0mbSG/i2jp19WyCLtZGLTmv1eUAAaXGvN/KkArDwngRHjYXFYFu5M307i2Oi5pblprFRKAlfX2qa3QRF4sFoSV/+u5iZPJaXFHSTh7VO9j5RCGLT5sYv6My5U66OYXQi7Ta6aryNq2/pzJrDKS0yWFi4ylKufrx1/jLo2Cm6aW/wl04lh2QlgWVrbmSqdJCHJMS8hj3jNjUqPh7nxaXsHB8pUxkwFm3MQR4Sj/qET2Cbc19zipGzAEuuwDFyQuLyOOkpgZU/6XI+G/rtI8iaLXfzyo4Xr5kXsZpNehjRW8ueapDQLqKCgUzThZOm0KtdOAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3231.eurprd08.prod.outlook.com (52.134.123.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.21; Mon, 21 Oct 2019 16:47:14 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b%6]) with mapi id 15.20.2367.022; Mon, 21 Oct 2019
 16:47:14 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/5] drm/komeda: Add debugfs node to control error verbosity
Thread-Topic: [PATCH 1/5] drm/komeda: Add debugfs node to control error
 verbosity
Thread-Index: AQHViC8xuPMk/kmsbUCVoX21Aq4jyg==
Date: Mon, 21 Oct 2019 16:47:14 +0000
Message-ID: <20191021164654.9642-2-mihail.atanassov@arm.com>
References: <20191021164654.9642-1-mihail.atanassov@arm.com>
In-Reply-To: <20191021164654.9642-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.51]
x-clientproxiedby: LO2P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::15) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 580f9f6a-2e21-4467-b0c1-08d75646596c
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR08MB3231:|VI1PR08MB3231:|DB7PR08MB3900:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB7PR08MB390020FF2B46DAE3AAAE0C7E8F690@DB7PR08MB3900.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:1850;OLM:1850;
x-forefront-prvs: 0197AFBD92
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(376002)(366004)(396003)(189003)(199004)(66476007)(8936002)(2616005)(81166006)(81156014)(386003)(50226002)(44832011)(76176011)(6506007)(2501003)(102836004)(1076003)(25786009)(71200400001)(6486002)(3846002)(6116002)(476003)(11346002)(316002)(71190400001)(256004)(446003)(99286004)(486006)(54906003)(14454004)(26005)(5640700003)(86362001)(305945005)(7736002)(8676002)(6436002)(6916009)(5660300002)(4326008)(6512007)(66446008)(64756008)(66946007)(66556008)(478600001)(36756003)(52116002)(66066001)(2906002)(2351001)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3231;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 2VO7Tqx8aoVFFuhlMZWvq3Ph9VmYVldu8iY4dT0oxoV/uGfZkejSq9tmU8ER9/GMJLDzycAzgZ6PpCk3SsFpRwJStC+XsqlohhX7YpP/fhPZobAfQaWTqU63qzwkR1tN4S6lxWFT1Qu1KrMKc+6cuULSe390LxXKveDNzih230o+FNaHu3sc+2UxYZDgivXELbZkIAkP9hiy6uVCmJx87ZS+ZA4/0uYS3smndEzRlHCNPJ91WOgUAPz1nhi6euLd8Zv6YN3i5aTtcZ75OZXqYFrQsYLIFYxH0oBfEkujsZZHfhfvI7OLZP2I5B9YYY+c3xHPe92vfWZDEr8BcevVqUMbxyxw27nel7y+7YPY2sw7mfOEGorJiCX41H9ZXJFn1Ouo5vlozzRHDWBvOQOXAI6NCVFUgP2KSbFziUyG8SvAbl8HuV3AhFxwe/S+CpS2
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3231
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(376002)(396003)(189003)(199004)(36756003)(2501003)(6512007)(2351001)(486006)(126002)(54906003)(25786009)(50226002)(47776003)(6916009)(316002)(36906005)(2616005)(476003)(6486002)(11346002)(8936002)(446003)(478600001)(336012)(2906002)(26826003)(81156014)(81166006)(8746002)(63350400001)(6506007)(4326008)(22756006)(186003)(7736002)(1076003)(5660300002)(305945005)(14454004)(8676002)(3846002)(50466002)(386003)(66066001)(86362001)(5640700003)(23756003)(70586007)(76176011)(99286004)(70206006)(107886003)(356004)(76130400001)(26005)(6116002)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR08MB3900;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: f0cabc26-5c2c-4b5e-39ce-08d756465375
NoDisclaimer: True
X-Forefront-PRVS: 0197AFBD92
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jgNo5nqHNP8PivbVp+6Kf3FgFwGbHa7jq7uJPxndlb1sdWjHwnhFvvn+eVpy1BprInTzLM6nYCwo8V9mZbZChVUVCztEe/YjDyMxhgefRE1Lvg4wgq+Q7tfesHRP4P1U0Z4qk8eVzPyvTjwyiaI/nKeVcX05pl8w6avxkimo4Lje9gemn7/ySF1XI2zxzGZyFM/3VxT+r5ncttCGR7BzQdJAa5dJl0Io5AOukCibZaaxmfh+4hRy4E7Kns/yS28m9UMAHkJTYyBbFpGk+wdRiNycRGd3PSHeQbdgqcnrXh7Zg3Kx8om9xjLgw6zqTrylIZoCz2TDkgsYMYhiaK8mKdjOnFbnYpeheAse83AtWrojL3DWp4WVvKjxHhbxjmXr/UJDR73VFT4iKfAjd5h4vIDk4zhkQ96dKBMqFTNcd7A=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2019 16:47:24.3098 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 580f9f6a-2e21-4467-b0c1-08d75646596c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3900
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2lFNENYY2WBTzISF1cViWb9ogN+++Rr/m8RIJQFVph0=;
 b=57mjF/6g6NIB1lvp12k7RLxMNkoR8cgA5B2+EmglsgNj8IBQo8DeQa1su1M29swLU+s4pbsakLtbrvwOpNh2yFUQBPMGsLxVrljcsalrrfbeUXjp1Sa3hqQXqe+HRThK/8uI8oUPEksaPuBHPj0HCWuh1frJWVdGtN6ZiUk8OpI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2lFNENYY2WBTzISF1cViWb9ogN+++Rr/m8RIJQFVph0=;
 b=57mjF/6g6NIB1lvp12k7RLxMNkoR8cgA5B2+EmglsgNj8IBQo8DeQa1su1M29swLU+s4pbsakLtbrvwOpNh2yFUQBPMGsLxVrljcsalrrfbeUXjp1Sa3hqQXqe+HRThK/8uI8oUPEksaPuBHPj0HCWuh1frJWVdGtN6ZiUk8OpI=
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "james qian wang \(Arm
 Technology China\)" <james.qian.wang@arm.com>, "Lowry Li \(Arm Technology
 China\)" <Lowry.Li@arm.com>, nd <nd@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TmFtZWQgJ2Vycl92ZXJib3NpdHknLCBjdXJyZW50bHkgd2l0aCBvbmx5IDEgYWN0aXZlIGJpdCBp
biB0aGF0CnJlcGxpY2F0ZXMgdGhlIGV4aXN0aW5nIGxldmVsIC0gcHJpbnQgZXJyb3IgZXZlbnRz
IG9uY2UgcGVyIGZsaXAuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwu
YXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfZGV2LmMgICB8ICA0ICsrKysKIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX2Rldi5oICAgfCAxNCArKysrKysrKysrKystLQogZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZXZlbnQuYyB8ICA5ICsrKysrKystLQogZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMgICB8ICAyICstCiA0IGZp
bGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmMgYi9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYwppbmRleCA5MzdhNmQ0
YzQ4NjUuLjgyMjMwYzBkZGVjMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfZGV2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfZGV2LmMKQEAgLTU4LDYgKzU4LDggQEAgc3RhdGljIHZvaWQga29tZWRh
X2RlYnVnZnNfaW5pdChzdHJ1Y3Qga29tZWRhX2RldiAqbWRldikKIAltZGV2LT5kZWJ1Z2ZzX3Jv
b3QgPSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIoImtvbWVkYSIsIE5VTEwpOwogCWRlYnVnZnNfY3JlYXRl
X2ZpbGUoInJlZ2lzdGVyIiwgMDQ0NCwgbWRldi0+ZGVidWdmc19yb290LAogCQkJICAgIG1kZXYs
ICZrb21lZGFfcmVnaXN0ZXJfZm9wcyk7CisJZGVidWdmc19jcmVhdGVfeDE2KCJlcnJfdmVyYm9z
aXR5IiwgMDY2NCwgbWRldi0+ZGVidWdmc19yb290LAorCQkJICAgJm1kZXYtPmVycl92ZXJib3Np
dHkpOwogfQogI2VuZGlmCiAKQEAgLTI4MCw2ICsyODIsOCBAQCBzdHJ1Y3Qga29tZWRhX2RldiAq
a29tZWRhX2Rldl9jcmVhdGUoc3RydWN0IGRldmljZSAqZGV2KQogCQlnb3RvIGVycl9jbGVhbnVw
OwogCX0KIAorCW1kZXYtPmVycl92ZXJib3NpdHkgPSBLT01FREFfREVWX1BSSU5UX0VSUl9FVkVO
VFM7CisKICNpZmRlZiBDT05GSUdfREVCVUdfRlMKIAlrb21lZGFfZGVidWdmc19pbml0KG1kZXYp
OwogI2VuZGlmCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9kZXYuaCBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X2Rldi5oCmluZGV4IDQxNDIwMDIzM2I2NC4uYjViZDNkNTg5OGVlIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaAorKysgYi9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaApAQCAtMjAyLDYgKzIwMiwx
NCBAQCBzdHJ1Y3Qga29tZWRhX2RldiB7CiAKIAkvKiogQGRlYnVnZnNfcm9vdDogcm9vdCBkaXJl
Y3Rvcnkgb2Yga29tZWRhIGRlYnVnZnMgKi8KIAlzdHJ1Y3QgZGVudHJ5ICpkZWJ1Z2ZzX3Jvb3Q7
CisJLyoqCisJICogQGVycl92ZXJib3NpdHk6IGJpdG1hc2sgZm9yIGhvdyBtdWNoIGV4dHJhIGlu
Zm8gdG8gcHJpbnQgb24gZXJyb3IKKwkgKgorCSAqIFNlZSBLT01FREFfREVWXyogbWFjcm9zIGZv
ciBkZXRhaWxzLgorCSAqLworCXUxNiBlcnJfdmVyYm9zaXR5OworCS8qIFByaW50IGEgc2luZ2xl
IGxpbmUgcGVyIGVycm9yIHBlciBmcmFtZSB3aXRoIGVycm9yIGV2ZW50cy4gKi8KKyNkZWZpbmUg
S09NRURBX0RFVl9QUklOVF9FUlJfRVZFTlRTIEJJVCgwKQogfTsKIAogc3RhdGljIGlubGluZSBi
b29sCkBAIC0yMTksOSArMjI3LDExIEBAIHZvaWQga29tZWRhX2Rldl9kZXN0cm95KHN0cnVjdCBr
b21lZGFfZGV2ICptZGV2KTsKIHN0cnVjdCBrb21lZGFfZGV2ICpkZXZfdG9fbWRldihzdHJ1Y3Qg
ZGV2aWNlICpkZXYpOwogCiAjaWZkZWYgQ09ORklHX0RSTV9LT01FREFfRVJST1JfUFJJTlQKLXZv
aWQga29tZWRhX3ByaW50X2V2ZW50cyhzdHJ1Y3Qga29tZWRhX2V2ZW50cyAqZXZ0cyk7Cit2b2lk
IGtvbWVkYV9wcmludF9ldmVudHMoc3RydWN0IGtvbWVkYV9ldmVudHMgKmV2dHMsIHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYpOwogI2Vsc2UKLXN0YXRpYyBpbmxpbmUgdm9pZCBrb21lZGFfcHJpbnRf
ZXZlbnRzKHN0cnVjdCBrb21lZGFfZXZlbnRzICpldnRzKSB7fQorc3RhdGljIGlubGluZSB2b2lk
IGtvbWVkYV9wcmludF9ldmVudHMoc3RydWN0IGtvbWVkYV9ldmVudHMgKmV2dHMsCisJCQkJICAg
ICAgIHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCit7fQogI2VuZGlmCiAKIGludCBrb21lZGFfZGV2
X3Jlc3VtZShzdHJ1Y3Qga29tZWRhX2RldiAqbWRldik7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9ldmVudC5jIGIvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZXZlbnQuYwppbmRleCBhMzZmYjg2Y2MwNTQuLjU3
NWVkNGRmNzRlZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfZXZlbnQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9ldmVudC5jCkBAIC0xMDcsMTAgKzEwNywxMiBAQCBzdGF0aWMgYm9vbCBpc19uZXdf
ZnJhbWUoc3RydWN0IGtvbWVkYV9ldmVudHMgKmEpCiAJICAgICAgIChLT01FREFfRVZFTlRfRkxJ
UCB8IEtPTUVEQV9FVkVOVF9FT1cpOwogfQogCi12b2lkIGtvbWVkYV9wcmludF9ldmVudHMoc3Ry
dWN0IGtvbWVkYV9ldmVudHMgKmV2dHMpCit2b2lkIGtvbWVkYV9wcmludF9ldmVudHMoc3RydWN0
IGtvbWVkYV9ldmVudHMgKmV2dHMsIHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiB7Ci0JdTY0IHBy
aW50X2V2dHMgPSBLT01FREFfRVJSX0VWRU5UUzsKKwl1NjQgcHJpbnRfZXZ0cyA9IDA7CiAJc3Rh
dGljIGJvb2wgZW5fcHJpbnQgPSB0cnVlOworCXN0cnVjdCBrb21lZGFfZGV2ICptZGV2ID0gZGV2
LT5kZXZfcHJpdmF0ZTsKKwl1MTYgY29uc3QgZXJyX3ZlcmJvc2l0eSA9IG1kZXYtPmVycl92ZXJi
b3NpdHk7CiAKIAkvKiByZWR1Y2UgdGhlIHNhbWUgbXNnIHByaW50LCBvbmx5IHByaW50IHRoZSBm
aXJzdCBldnQgZm9yIG9uZSBmcmFtZSAqLwogCWlmIChldnRzLT5nbG9iYWwgfHwgaXNfbmV3X2Zy
YW1lKGV2dHMpKQpAQCAtMTE4LDYgKzEyMCw5IEBAIHZvaWQga29tZWRhX3ByaW50X2V2ZW50cyhz
dHJ1Y3Qga29tZWRhX2V2ZW50cyAqZXZ0cykKIAlpZiAoIWVuX3ByaW50KQogCQlyZXR1cm47CiAK
KwlpZiAoZXJyX3ZlcmJvc2l0eSAmIEtPTUVEQV9ERVZfUFJJTlRfRVJSX0VWRU5UUykKKwkJcHJp
bnRfZXZ0cyB8PSBLT01FREFfRVJSX0VWRU5UUzsKKwogCWlmICgoZXZ0cy0+Z2xvYmFsIHwgZXZ0
cy0+cGlwZXNbMF0gfCBldnRzLT5waXBlc1sxXSkgJiBwcmludF9ldnRzKSB7CiAJCWNoYXIgbXNn
WzI1Nl07CiAJCXN0cnVjdCBrb21lZGFfc3RyIHN0cjsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMKaW5kZXggZDQ5NzcyZGU5M2UwLi5lMzBhNWI0
M2NhYTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2ttcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X2ttcy5jCkBAIC00OCw3ICs0OCw3IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBrb21lZGFfa21zX2ly
cV9oYW5kbGVyKGludCBpcnEsIHZvaWQgKmRhdGEpCiAJbWVtc2V0KCZldnRzLCAwLCBzaXplb2Yo
ZXZ0cykpOwogCXN0YXR1cyA9IG1kZXYtPmZ1bmNzLT5pcnFfaGFuZGxlcihtZGV2LCAmZXZ0cyk7
CiAKLQlrb21lZGFfcHJpbnRfZXZlbnRzKCZldnRzKTsKKwlrb21lZGFfcHJpbnRfZXZlbnRzKCZl
dnRzLCBkcm0pOwogCiAJLyogTm90aWZ5IHRoZSBjcnRjIHRvIGhhbmRsZSB0aGUgZXZlbnRzICov
CiAJZm9yIChpID0gMDsgaSA8IGttcy0+bl9jcnRjczsgaSsrKQotLSAKMi4yMy4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
