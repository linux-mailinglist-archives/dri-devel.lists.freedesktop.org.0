Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C86BC28B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 09:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E6606E9D8;
	Tue, 24 Sep 2019 07:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150070.outbound.protection.outlook.com [40.107.15.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6986E9D8
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 07:26:37 +0000 (UTC)
Received: from VI1PR08CA0139.eurprd08.prod.outlook.com (2603:10a6:800:d5::17)
 by VI1PR0801MB1872.eurprd08.prod.outlook.com (2603:10a6:800:86::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.23; Tue, 24 Sep
 2019 07:26:33 +0000
Received: from VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::200) by VI1PR08CA0139.outlook.office365.com
 (2603:10a6:800:d5::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.22 via Frontend
 Transport; Tue, 24 Sep 2019 07:26:32 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT005.mail.protection.outlook.com (10.152.18.172) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20 via Frontend Transport; Tue, 24 Sep 2019 07:26:31 +0000
Received: ("Tessian outbound d5a1f2820a4f:v31");
 Tue, 24 Sep 2019 07:26:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d15885c2100208e0
X-CR-MTA-TID: 64aa7808
Received: from 331ba10d9251.2 (cr-mta-lb-1.cr-mta-net [104.47.14.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 698C6375-B7EC-4F03-AC6E-5818656E38EC.1; 
 Tue, 24 Sep 2019 07:26:20 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 331ba10d9251.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Sep 2019 07:26:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QUNSEf4Q1rbsgt3S9Xs/8/sqzuWBVnPXyAftuaKZW7QS/lUwxTh8qcQJh71kmWaaUOHV3YOP24GM1OL91uPlUENCU2xQ4TdZjd8xW5zsatriJWULnJygAJ3M+hNjKE+LgVrZpR6PzinSR3QqZOFzIHXkEbv2q1b90n7PtLqE+xx/tgn3ubtx1yBlhvd5Vp6scjOJLPROcvaLyiUSU8wo3xQ1zoBYqHcgfG62HeAi2kgRMbpLNnA8X3DYwjdeiHcjPtrXHXNSA7VWbCObbyF67JFVURwLIb2bGBiZPHgkyAuZ7wK1lUsFWoW1HxdMCVzTObDVqkxw3HnAUvpxoc0AqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=432SZBl+XgNRowFEJpvuppz3A/j8ZcamL456V3bwWEE=;
 b=V09qKZzUAnyeWTCv/kjNRZEO1qgC7fesC1+Da000+2YTcPCyLEX+VrlBOk2Bax3cOrKk+lib7Ibf+4/GAreZLTnbTcEgWshc6DKAA9RV4RSWjLWjDGp0vic1Ag1q2dmXyH3KdvgJyrPwQ92/pK5c1r4fD1bVirnpxszbvEtQUSCpIJ6CqHVzmQiiw1fJoGTKQ8zoAomSeOCZOz81PHqTHRn6+v1dzoBVTGGYY/a39eDRNdTORSlbShkuQjRuok4QrK7R88o9EMWniaHsxXCL7S3NVyblWvLqhtQTs3MxmBKRyy/JgeCUe44Ecv9cudxbM7ZYjmt0knu82gjjXFRBqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB3199.eurprd08.prod.outlook.com (52.133.15.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Tue, 24 Sep 2019 07:26:18 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::d09e:254b:4d3b:456b]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::d09e:254b:4d3b:456b%3]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 07:26:18 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey
 <Brian.Starkey@arm.com>, Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: [PATCH v2 2/2] drm/komeda: Adds layer horizontal input size
 limitation check for D71
Thread-Topic: [PATCH v2 2/2] drm/komeda: Adds layer horizontal input size
 limitation check for D71
Thread-Index: AQHVcqlbZ+q1ta0ytEW/DVb0H7fVog==
Date: Tue, 24 Sep 2019 07:26:18 +0000
Message-ID: <20190924072552.32446-3-lowry.li@arm.com>
References: <20190924072552.32446-1-lowry.li@arm.com>
In-Reply-To: <20190924072552.32446-1-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2P15301CA0006.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::16) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 17139cc3-7052-400b-953f-08d740c0855a
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB3199; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB3199:|VI1PR08MB3199:|VI1PR0801MB1872:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0801MB18726C2D9212951AE0D7EBF89F840@VI1PR0801MB1872.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:4941;OLM:4941;
x-forefront-prvs: 0170DAF08C
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(346002)(39860400002)(136003)(396003)(199004)(189003)(6116002)(71200400001)(50226002)(6512007)(3846002)(6506007)(4326008)(66476007)(476003)(14454004)(66946007)(386003)(52116002)(66556008)(486006)(2616005)(6636002)(6436002)(14444005)(36756003)(2501003)(99286004)(110136005)(64756008)(2906002)(446003)(256004)(66066001)(54906003)(71190400001)(76176011)(81156014)(6486002)(8676002)(478600001)(55236004)(66446008)(5660300002)(81166006)(102836004)(11346002)(86362001)(2201001)(1076003)(8936002)(26005)(186003)(7736002)(316002)(305945005)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3199;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: e387BRipFUQslMY7fImmJpYXFX30B+6G6iRyQFJ4KVcj6HRUnt3YHEfFnqRQwnwwCAeCx7pQYfAtsGTsfP7fJWp4DmyI8RHOje2RqD8pPxFGw0y1RHu8IQ21/ncLi0Rc4MtmXdJhJZ8QvZqJaSbfNb5A1DxMRlax/X4bgDi3jwQGGFLMLn4mfhQvKv1i8gg1EyZ29YL4291gWnrNO9XyHYjIhuMJiCLCXJ15hhc9eDaLgKj8URcDKFF00e0YeiJeC/zrmkanrNcG7o+B7C587d1slY0tO3C25rv38AI6D5AOOtDlz5B6YGRP/nJRRy2Se2/DlwYFUTQhWmR/X4PBTTfcv9wFjCRo6NY5kYl4pIHBM3NcxN0pdai/KaNOzqdwHm34B7OhWv04mUDeuOGlf3YAVnLMnpqSki0b8K+m4MM=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3199
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(39860400002)(346002)(189003)(199004)(2906002)(99286004)(22756006)(8676002)(81166006)(6486002)(81156014)(50226002)(6636002)(70206006)(66066001)(47776003)(76130400001)(26826003)(4326008)(7736002)(6506007)(14444005)(50466002)(386003)(2501003)(23756003)(478600001)(76176011)(36756003)(6512007)(63350400001)(11346002)(2616005)(486006)(476003)(86362001)(446003)(126002)(336012)(305945005)(70586007)(8746002)(2201001)(102836004)(25786009)(1076003)(356004)(186003)(26005)(6116002)(36906005)(316002)(3846002)(5660300002)(110136005)(14454004)(54906003)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0801MB1872;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3f63e72f-865e-41b2-9866-08d740c07d9f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VI1PR0801MB1872; 
NoDisclaimer: True
X-Forefront-PRVS: 0170DAF08C
X-Microsoft-Antispam-Message-Info: 5wgp5rnNUfkiNQ/GlDnTjvHkHhk90WAUm+7nQPkcGRauzrqbfbkX/X6beBX5Jn/Q+7E6m8C0/jhsuxThCzXWfCdnSbFlek/qqSsJDVkWfpkAThc6fyhUpx3fDSeTwN+yV1FuNQUC2qGH+VKQtnMmgYwm2M3/JJVoX9umUu9FK0SotxdEzEKdDdpScQIsoh4rYjUrO8JN/LiWhu3t6bPnjUd5dTs7sutWhdpRuIEB1QybzBpe4VZ+Nv7Nk7QsQxw0IG1cTdfql0YzhJ6H0nFy39WU6SJ1n108lm0VBYN8MiY0lrnuAhPMfFoFoJ5LxxSVHpfMEuLb5+3XJHvCBviN55iZUIB19qvuVkqUOILQq1Mgc8I+RcE63tZVrVE07qtdaRFmtZd84PJT6K2eU3HEdOl+HE+Uw1pIxJTmxuNakNk=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2019 07:26:31.0368 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17139cc3-7052-400b-953f-08d740c0855a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1872
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=432SZBl+XgNRowFEJpvuppz3A/j8ZcamL456V3bwWEE=;
 b=ruVOeaNBE9lw8p2yR80eFIoLEAdWQgCdp70cR5PE6xaUco/pjC5NNla6DO8/hpIKol27tVY9S/Cb0JaLQ4v09TrjiuFpHVhJ4lgqTBFDpyOxErcwzj/M9ckU/KTmHRQLATzJ5AMvz9j545tBUTcVxulx4g6GZVecnDqA+FRK1eo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=432SZBl+XgNRowFEJpvuppz3A/j8ZcamL456V3bwWEE=;
 b=ruVOeaNBE9lw8p2yR80eFIoLEAdWQgCdp70cR5PE6xaUco/pjC5NNla6DO8/hpIKol27tVY9S/Cb0JaLQ4v09TrjiuFpHVhJ4lgqTBFDpyOxErcwzj/M9ckU/KTmHRQLATzJ5AMvz9j545tBUTcVxulx4g6GZVecnDqA+FRK1eo=
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, "Jonathan Chai
 \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogIkxvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkiIDxMb3dyeS5MaUBhcm0uY29t
PgoKQWRkcyBtYXhpbXVtIGxpbmUgc2l6ZSBjaGVjayBhY2NvcmRpbmcgdG8gdGhlIEFGQkMgZGVj
b2RlciBsaW1pdGF0aW9uCmFuZCBzcGVjaWFsIExpbmUgc2l6ZSBsaW1pdGF0aW9uKDIwNDYpIGZv
ciBmb3JtYXQ6IFlVVjQyMF8xMEJJVCBhbmQgWDBMMi4KClNpZ25lZC1vZmYtYnk6IExvd3J5IExp
IChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGxvd3J5LmxpQGFybS5jb20+Ci0tLQogLi4uL2FybS9k
aXNwbGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jICAgIHwgNDkgKysrKysrKysrKysrKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMgYi9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMKaW5kZXgg
MzU3ODM3YjlkNmVkLi42NzQwYjg0MjJmMTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMKQEAgLTM0OSw3ICszNDks
NTYgQEAgc3RhdGljIHZvaWQgZDcxX2xheWVyX2R1bXAoc3RydWN0IGtvbWVkYV9jb21wb25lbnQg
KmMsIHN0cnVjdCBzZXFfZmlsZSAqc2YpCiAJc2VxX3ByaW50ZihzZiwgIiVzQURfVl9DUk9QOlx0
XHQweCVYXG4iLCBwcmVmaXgsIHZbMl0pOwogfQogCitzdGF0aWMgaW50IGQ3MV9sYXllcl92YWxp
ZGF0ZShzdHJ1Y3Qga29tZWRhX2NvbXBvbmVudCAqYywKKwkJCSAgICAgIHN0cnVjdCBrb21lZGFf
Y29tcG9uZW50X3N0YXRlICpzdGF0ZSkKK3sKKwlzdHJ1Y3Qga29tZWRhX2xheWVyX3N0YXRlICpz
dCA9IHRvX2xheWVyX3N0KHN0YXRlKTsKKwlzdHJ1Y3Qga29tZWRhX2xheWVyICpsYXllciA9IHRv
X2xheWVyKGMpOworCXN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKnBsYW5lX3N0OworCXN0cnVjdCBk
cm1fZnJhbWVidWZmZXIgKmZiOworCXUzMiBmb3VyY2MsIGxpbmVfc3osIG1heF9saW5lX3N6Owor
CisJcGxhbmVfc3QgPSBkcm1fYXRvbWljX2dldF9uZXdfcGxhbmVfc3RhdGUoc3RhdGUtPm9iai5z
dGF0ZSwKKwkJCQkJCSAgc3RhdGUtPnBsYW5lKTsKKwlmYiA9IHBsYW5lX3N0LT5mYjsKKwlmb3Vy
Y2MgPSBmYi0+Zm9ybWF0LT5mb3JtYXQ7CisKKwlpZiAoZHJtX3JvdGF0aW9uXzkwX29yXzI3MChz
dC0+cm90KSkKKwkJbGluZV9zeiA9IHN0LT52c2l6ZSAtIHN0LT5hZmJjX2Nyb3BfdCAtIHN0LT5h
ZmJjX2Nyb3BfYjsKKwllbHNlCisJCWxpbmVfc3ogPSBzdC0+aHNpemUgLSBzdC0+YWZiY19jcm9w
X2wgLSBzdC0+YWZiY19jcm9wX3I7CisKKwlpZiAoZmItPm1vZGlmaWVyKSB7CisJCWlmICgoZmIt
Pm1vZGlmaWVyICYgQUZCQ19GT1JNQVRfTU9EX0JMT0NLX1NJWkVfTUFTSykgPT0KKwkJCUFGQkNf
Rk9STUFUX01PRF9CTE9DS19TSVpFXzMyeDgpCisJCQltYXhfbGluZV9zeiA9IGxheWVyLT5saW5l
X3N6OworCQllbHNlCisJCQltYXhfbGluZV9zeiA9IGxheWVyLT5saW5lX3N6IC8gMjsKKworCQlp
ZiAobGluZV9zeiA+IG1heF9saW5lX3N6KSB7CisJCQlEUk1fREVCVUdfQVRPTUlDKCJhZmJjIHJl
cXVlc3QgbGluZV9zejogJWQgZXhjZWVkIHRoZSBtYXggYWZiYyBsaW5lX3N6OiAlZC5cbiIsCisJ
CQkJCSBsaW5lX3N6LCBtYXhfbGluZV9zeik7CisJCQlyZXR1cm4gLUVJTlZBTDsKKwkJfQorCX0K
KworCWlmIChmb3VyY2MgPT0gRFJNX0ZPUk1BVF9ZVVY0MjBfMTBCSVQgJiYgbGluZV9zeiA+IDIw
NDYgJiYgKHN0LT5hZmJjX2Nyb3BfbCAlIDQpKSB7CisJCURSTV9ERUJVR19BVE9NSUMoIllVVjQy
MF8xMEJJVCBpbnB1dF9oc2l6ZTogJWQgZXhjZWVkIHRoZSBtYXggc2l6ZSAyMDQ2LlxuIiwKKwkJ
CQkgbGluZV9zeik7CisJCXJldHVybiAtRUlOVkFMOworCX0KKworCWlmIChmb3VyY2MgPT0gRFJN
X0ZPUk1BVF9YMEwyICYmIGxpbmVfc3ogPiAyMDQ2ICYmIChzdC0+YWRkclswXSAlIDE2KSkgewor
CQlEUk1fREVCVUdfQVRPTUlDKCJYMEwyIGlucHV0X2hzaXplOiAlZCBleGNlZWQgdGhlIG1heCBz
aXplIDIwNDYuXG4iLAorCQkJCSBsaW5lX3N6KTsKKwkJcmV0dXJuIC1FSU5WQUw7CisJfQorCisJ
cmV0dXJuIDA7Cit9CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qga29tZWRhX2NvbXBvbmVudF9mdW5j
cyBkNzFfbGF5ZXJfZnVuY3MgPSB7CisJLnZhbGlkYXRlCT0gZDcxX2xheWVyX3ZhbGlkYXRlLAog
CS51cGRhdGUJCT0gZDcxX2xheWVyX3VwZGF0ZSwKIAkuZGlzYWJsZQk9IGQ3MV9sYXllcl9kaXNh
YmxlLAogCS5kdW1wX3JlZ2lzdGVyCT0gZDcxX2xheWVyX2R1bXAsCi0tIAoyLjE3LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
