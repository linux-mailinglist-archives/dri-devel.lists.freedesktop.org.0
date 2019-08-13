Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFDC8AE29
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 06:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 140C66E630;
	Tue, 13 Aug 2019 04:56:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30083.outbound.protection.outlook.com [40.107.3.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B8456E630
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 04:56:20 +0000 (UTC)
Received: from VI1PR08CA0230.eurprd08.prod.outlook.com (2603:10a6:802:15::39)
 by VE1PR08MB4957.eurprd08.prod.outlook.com (2603:10a6:803:110::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.18; Tue, 13 Aug
 2019 04:56:16 +0000
Received: from VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::200) by VI1PR08CA0230.outlook.office365.com
 (2603:10a6:802:15::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.16 via Frontend
 Transport; Tue, 13 Aug 2019 04:56:16 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT020.mail.protection.outlook.com (10.152.18.242) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 13 Aug 2019 04:56:15 +0000
Received: ("Tessian outbound 40a263b748b4:v26");
 Tue, 13 Aug 2019 04:56:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: de0535b376d47595
X-CR-MTA-TID: 64aa7808
Received: from 5a9e516d9020.2 (cr-mta-lb-1.cr-mta-net [104.47.2.58])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3CA80F2B-4F52-4659-A844-F0FD2A629A0F.1; 
 Tue, 13 Aug 2019 04:56:04 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2058.outbound.protection.outlook.com [104.47.2.58])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5a9e516d9020.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Tue, 13 Aug 2019 04:56:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2B6ebQP4uaP/RMjLLCVGEhpPODhPQZoYUPe5m5PDporzWepuOJkB1aWZtxfVIjS3aoTEPe5bxhkEhohm5zWPTeiNUfjsDnMnwgw1sHlODIeEBr0lfCgi6VCXHzk9knlSJ7QOmNSh+rmTelPV9x/mdjb3yRcl6eREkgUEDZq/VGAExGJEr1tC8C4JQW0Hy/7LBUUpg12KkzHZY+OAfgkwrkIFOHR8H85JeCb11mQuOYdEH9afEXrJdEEz5FhaRK2Z4CiDkJHDmft0TYO6UdpCjxKN4djMJg3Xetm3QGNFbRAUhO2xEwHDZcy3prPT6jUwcbkOeUKXdT1/ivn/NOUzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nuGciigGkwP439dkP0n3XwvBbunHid96eGr9XRrL5Jw=;
 b=T2GsNnUxSbK7/cBCzrm65pSPL0SCEISVNYr9xNd5VxdbwakiVej9sBKc9F4lI+KEYiEVtlEE0Gfew3iuGQH8wZ2gwZ97x3O7Y0QqWno68gcD2Tvl3pohgyN6OKdT2w5FD3Vs/az7q7VN9HQDzD4Kol6EBzIP+MNPwBII3KaWTqORNWQKp3L8brJwvMmeQmBnoXcNZ3XFvrUPU4/vrNEdU+zTmCHQ7UMMsgdxgAHnR5vHwk1/m3bPrcPZ/6BYfz8okxLTVPoTNbLSnLwNkbPTXNcmeXJL7THrd3eTkhN1esCXamvk63QsJ8zhuOpOv7vUvri/UgcoeieUtYMfOCCTzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4752.eurprd08.prod.outlook.com (10.255.112.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.15; Tue, 13 Aug 2019 04:56:02 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2151:f0b1:3ea7:c134]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2151:f0b1:3ea7:c134%6]) with mapi id 15.20.2157.022; Tue, 13 Aug 2019
 04:56:01 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>
Subject: [PATCH v2 1/4] drm/komeda: Introduce komeda_coeffs_table/manager
Thread-Topic: [PATCH v2 1/4] drm/komeda: Introduce komeda_coeffs_table/manager
Thread-Index: AQHVUZNn0XyAilFXnEawB/L5bqoU/A==
Date: Tue, 13 Aug 2019 04:56:01 +0000
Message-ID: <20190813045536.28239-2-james.qian.wang@arm.com>
References: <20190813045536.28239-1-james.qian.wang@arm.com>
In-Reply-To: <20190813045536.28239-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR01CA0070.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::34) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: a4e163dd-5d1e-466b-5298-08d71faa923b
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4752; 
X-MS-TrafficTypeDiagnostic: VE1PR08MB4752:|VE1PR08MB4957:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB495716B606919DBAE6B9BAF5B3D20@VE1PR08MB4957.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:3968;OLM:3968;
x-forefront-prvs: 01283822F8
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(136003)(376002)(39860400002)(366004)(346002)(396003)(199004)(189003)(50226002)(5660300002)(2201001)(110136005)(26005)(316002)(66066001)(6116002)(3846002)(305945005)(2906002)(7736002)(103116003)(71190400001)(71200400001)(8676002)(1076003)(54906003)(446003)(55236004)(66946007)(478600001)(81156014)(14454004)(386003)(6506007)(4326008)(36756003)(52116002)(2616005)(102836004)(25786009)(256004)(11346002)(14444005)(81166006)(186003)(76176011)(6486002)(64756008)(66556008)(66476007)(99286004)(2501003)(6512007)(6436002)(86362001)(66446008)(8936002)(486006)(476003)(53936002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4752;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: LoQbVzAb6R/gLMANugwmN1ykWg7l4Yebc6tgWNiiiczZ7ygFlBsvuBy9hHOpZx0kk7Ep64h5I6ELE9WWDzkUXJWWiqLj2ovLJ35eqAWfWFP22t2DJ13IJ5R1NH2QwqMTfgjtY17460JoGmox0qjfX/kSE8e1/ptOQ5paGJmlYqwX0RI/XaWzlj4IXzj62eFEeYyMui+i3+cm5SodCtRcZWyW8hqpPNuhP7G1Sftzz2UP0ZSBJfFdQ2/f8AHIJgKQqyvnpiQdCLtKpND3uzwkgTKURZ94McHCXLrJzftB9KC1ntJ4i/TsNgtVLB7pGbqEIbqDU9vpTywXEgVXD2MiEUpVEtWkJN61e/n8y83egbMmrbBwTKZ0WBOzwonvBW2cxJQJk5NrxCQetSSjqIz4VtT0lJefVIolpTpeq4PbA1s=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4752
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(376002)(346002)(136003)(396003)(39860400002)(2980300002)(199004)(189003)(47776003)(110136005)(99286004)(486006)(76130400001)(1076003)(36756003)(76176011)(2501003)(25786009)(5660300002)(63350400001)(63370400001)(336012)(2616005)(70206006)(476003)(70586007)(11346002)(54906003)(126002)(446003)(81166006)(8676002)(81156014)(103116003)(8746002)(66066001)(6512007)(6486002)(8936002)(4326008)(356004)(316002)(6116002)(305945005)(26005)(186003)(50226002)(3846002)(50466002)(14454004)(7736002)(6506007)(86362001)(26826003)(102836004)(36906005)(478600001)(23756003)(14444005)(22756006)(2201001)(386003)(2906002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4957;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 683bd389-c07b-44cf-c8dd-08d71faa89ef
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VE1PR08MB4957; 
NoDisclaimer: True
X-Forefront-PRVS: 01283822F8
X-Microsoft-Antispam-Message-Info: QcOHbfAL6GLr2q/6VeBPyzSGHFxKjJpzcx2huEY/SngIoY2GNGO2nHjQLK1lTBw5XgGDS1hc65G1rFsr06iGvfslt41KcZMQTVxjvkVHs1/X/a5uWE33h5UCyVVoF/gGSPjF+xVjMWrC1CNB8C6mNyRyh4go5l2DFDYrxaiEElQl6rjuSWnlCUyEHDJsDbSIQcxHNp1pXgQkd1z69xuiK6QkpR+aiqOAzckAhyrZZ90m5XdNsWzSEpBW1bxpD2yprgElhG5GKAHzI0Xy7LP/vgAy4Udf//FKiiql8oIhhnkuyfQXZyX1NBSEmrLZTSN5z380yYYPMETAFRo6TDVQutRX4UJvs6zutWR0pJ2m8kDIPp0gecS+mdr8L5ZY61Lzj3riUNrrju+3r2Tv5cuWmI06XtpREMnh8EePDtOewLY=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2019 04:56:15.2835 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4e163dd-5d1e-466b-5298-08d71faa923b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4957
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nuGciigGkwP439dkP0n3XwvBbunHid96eGr9XRrL5Jw=;
 b=JtpkwfinRXAjAP6UHPNk9EaKCUbrtWWMgHZAu12NxpaeTPfYsJ+FJm/oAF9bFyBy02PzLxLKeR4c+aYCd9255wwQRvagT7M7JojyiJcqb3f11FRiCZTSdQVdYsvb5kbbO6cV5jNjjhMJvwv3NQY+q/Rn/UgglTvUFhIdc0Z7dgI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nuGciigGkwP439dkP0n3XwvBbunHid96eGr9XRrL5Jw=;
 b=JtpkwfinRXAjAP6UHPNk9EaKCUbrtWWMgHZAu12NxpaeTPfYsJ+FJm/oAF9bFyBy02PzLxLKeR4c+aYCd9255wwQRvagT7M7JojyiJcqb3f11FRiCZTSdQVdYsvb5kbbO6cV5jNjjhMJvwv3NQY+q/Rn/UgglTvUFhIdc0Z7dgI=
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>, "Tiannan Zhu \(Arm
 Technology China\)" <Tiannan.Zhu@arm.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

a29tZWRhIGRpc3BsYXkgSFdzIGhhdmUga2luZHMgb2YgY29lZmZpY2llbnQgdGFibGVzIGZvciB2
YXJpb3VzIHB1cnBvc2VzCmxpa2UgZ2FtbWEvZGVnYW1tYS4gdXN1c2FsbHkgdGhlc2UgdGFibGVz
IGFyZSBzaGFyZWQgYnkgbXVsdGlwbGUgSFcKY29tcG9uZW50IGFuZCBoYXZlIGxpbWl0ZWQgbnVt
YmVyLgpJbnRyb2R1Y2Uga29tZWRhX2NvZWZmc190YWJsZS9tYW5hZ2VyIGZvciBkZXNjcmliaW5n
IGFuZCBtYW5hZ2luZyB0aGVzZQp0YWJsZXMsIGxpa2UgdGFibGUgcmV1c2UsIHJhY2luZy4KClNp
Z25lZC1vZmYtYnk6IEphbWVzIFFpYW4gV2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1l
cy5xaWFuLndhbmdAYXJtLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL01ha2VmaWxlICAgfCAgIDEgKwogLi4uL2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X2NvZWZmcy5jICAgIHwgMTE5ICsrKysrKysrKysrKysrKysrKwogLi4uL2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2NvZWZmcy5oICAgIHwgIDc0ICsrKysrKysrKysrCiAzIGZpbGVzIGNo
YW5nZWQsIDE5NCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29lZmZzLmMKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2VmZnMuaAoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvTWFrZWZpbGUgYi9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL01ha2VmaWxlCmluZGV4IDVjMzkwMGMy
ZTc2NC4uMzhhYTU4NDNjMDNhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL01ha2VmaWxlCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEvTWFrZWZpbGUKQEAgLTgsNiArOCw3IEBAIGtvbWVkYS15IDo9IFwKIAlrb21lZGFfZHJ2Lm8g
XAogCWtvbWVkYV9kZXYubyBcCiAJa29tZWRhX2Zvcm1hdF9jYXBzLm8gXAorCWtvbWVkYV9jb2Vm
ZnMubyBcCiAJa29tZWRhX2NvbG9yX21nbXQubyBcCiAJa29tZWRhX3BpcGVsaW5lLm8gXAogCWtv
bWVkYV9waXBlbGluZV9zdGF0ZS5vIFwKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2NvZWZmcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfY29lZmZzLmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMDAwMDAwLi5kOWQzNWUyMzAwM2MKLS0tIC9kZXYvbnVsbAorKysgYi9kcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2VmZnMuYwpAQCAtMCwwICsxLDExOSBAQAor
Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKKy8qCisgKiAoQykgQ09QWVJJR0hU
IDIwMTkgQVJNIExpbWl0ZWQuIEFsbCByaWdodHMgcmVzZXJ2ZWQuCisgKiBBdXRob3I6IEphbWVz
LlFpYW4uV2FuZyA8amFtZXMucWlhbi53YW5nQGFybS5jb20+CisgKgorICovCisjaW5jbHVkZSA8
bGludXgvc2xhYi5oPgorI2luY2x1ZGUgImtvbWVkYV9jb2VmZnMuaCIKKworc3RhdGljIGlubGlu
ZSBib29sIGlzX3RhYmxlX2luX3VzaW5nKHN0cnVjdCBrb21lZGFfY29lZmZzX3RhYmxlICp0YWJs
ZSkKK3sKKwlyZXR1cm4gcmVmY291bnRfcmVhZCgmdGFibGUtPnJlZmNvdW50KSA+IDE7Cit9CisK
Ky8qIHJlcXVlc3QgYSBjb2VmZnMgdGFibGUgZm9yIHRoZSBjb2VmZnMgZGF0YSBzcGVjaWZpZWQg
YnkgYXJndW1lbnQgY29lZmZzICovCitzdHJ1Y3Qga29tZWRhX2NvZWZmc190YWJsZSAqCitrb21l
ZGFfY29lZmZzX3JlcXVlc3Qoc3RydWN0IGtvbWVkYV9jb2VmZnNfbWFuYWdlciAqbWdyLCB2b2lk
ICpjb2VmZnMpCit7CisJc3RydWN0IGtvbWVkYV9jb2VmZnNfdGFibGUgKnRhYmxlOworCXUzMiBp
OworCisJbXV0ZXhfbG9jaygmbWdyLT5tdXRleCk7CisKKwkvKiBzZWFyY2ggdGFibGUgbGlzdCB0
byBmaW5kIGlmIHRoZXJlIGlzIGEgaW4tdXNpbmcgdGFibGUgd2l0aCB0aGUKKwkgKiBzYW1lIGNv
ZWZmaWNpZW50IGNvbnRlbnQsIGlmIGZpbmQsIHJldXNlIHRoaXMgdGFibGUuCisJICovCisJZm9y
IChpID0gMDsgaSA8IG1nci0+bl90YWJsZXM7IGkrKykgeworCQl0YWJsZSA9IG1nci0+dGFibGVz
W2ldOworCisJCS8qIHNraXAgdGhlIHVudXNlZCB0YWJsZSAqLworCQlpZiAoIWlzX3RhYmxlX2lu
X3VzaW5nKHRhYmxlKSkKKwkJCWNvbnRpbnVlOworCisJCWlmICghbWVtY21wKHRhYmxlLT5jb2Vm
ZnMsIGNvZWZmcywgbWdyLT5jb2VmZnNfc3opKQorCQkJZ290byBmb3VuZDsKKwl9CisKKwkvKiBj
YW4gbm90IHJldXNlIHRoZSBleGlzdGluZyBpbi11c2luZyB0YWJsZSwgbG9vcCBmb3IgYSBuZXcg
b25lICovCisJZm9yIChpID0gMDsgaSA8IG1nci0+bl90YWJsZXM7IGkrKykgeworCQl0YWJsZSA9
IG1nci0+dGFibGVzW2ldOworCisJCWlmICghaXNfdGFibGVfaW5fdXNpbmcodGFibGUpKSB7CisJ
CQltZW1jcHkodGFibGUtPmNvZWZmcywgY29lZmZzLCBtZ3ItPmNvZWZmc19zeik7CisJCQl0YWJs
ZS0+bmVlZHNfdXBkYXRlID0gdHJ1ZTsKKwkJCWdvdG8gZm91bmQ7CisJCX0KKwl9CisKKwkvKiBT
aW5jZSBwcmV2aW91cyB0d28gc2VhcmNoIGxvb3Agd2lsbCBkaXJlY3RseSBnb3RvIGZvdW5kIGlm
IGZvdW5kIGFuCisJICogYXZhaWxhYmxlIHRhYmxlLCBzbyBvbmNlIHByb2dyYW0gcmFuIGhlcmUg
bWVhbnMgc2VhcmNoIGZhaWxlZC4KKwkgKiBjbGVhciB0aGUgdGFibGUgdG8gTlVMTCwgdW5sb2Nr
KG1nci0+bXV0ZXgpIGFuZCByZXR1cm4gTlVMTC4KKwkgKi8KKwl0YWJsZSA9IE5VTEw7CisKK2Zv
dW5kOgorCWtvbWVkYV9jb2VmZnNfZ2V0KHRhYmxlKTsKKwltdXRleF91bmxvY2soJm1nci0+bXV0
ZXgpOworCXJldHVybiB0YWJsZTsKK30KKworLyogQWRkIGEgY29lZmZzIHRhYmxlIHRvIG1hbmFn
ZXIgKi8KK2ludCBrb21lZGFfY29lZmZzX2FkZChzdHJ1Y3Qga29tZWRhX2NvZWZmc19tYW5hZ2Vy
ICptZ3IsCisJCSAgICAgIHUzMiBod19pZCwgdTMyIF9faW9tZW0gKnJlZywKKwkJICAgICAgdm9p
ZCAoKnVwZGF0ZSkoc3RydWN0IGtvbWVkYV9jb2VmZnNfdGFibGUgKnRhYmxlKSkKK3sKKwlzdHJ1
Y3Qga29tZWRhX2NvZWZmc190YWJsZSAqdGFibGU7CisKKwlpZiAobWdyLT5uX3RhYmxlcyA+PSBB
UlJBWV9TSVpFKG1nci0+dGFibGVzKSkKKwkJcmV0dXJuIC1FTk9TUEM7CisKKwl0YWJsZSA9IGt6
YWxsb2Moc2l6ZW9mKCp0YWJsZSksIEdGUF9LRVJORUwpOworCWlmICghdGFibGUpCisJCXJldHVy
biAtRU5PTUVNOworCisJdGFibGUtPmNvZWZmcyA9IGt6YWxsb2MobWdyLT5jb2VmZnNfc3osIEdG
UF9LRVJORUwpOworCWlmICghdGFibGUtPmNvZWZmcykgeworCQlrZnJlZSh0YWJsZSk7CisJCXJl
dHVybiAtRU5PTUVNOworCX0KKworCXJlZmNvdW50X3NldCgmdGFibGUtPnJlZmNvdW50LCAxKTsK
Kwl0YWJsZS0+bWdyID0gbWdyOworCXRhYmxlLT5od19pZCA9IGh3X2lkOworCXRhYmxlLT51cGRh
dGUgPSB1cGRhdGU7CisJdGFibGUtPnJlZyA9IHJlZzsKKworCW1nci0+dGFibGVzW21nci0+bl90
YWJsZXMrK10gPSB0YWJsZTsKKwlyZXR1cm4gMDsKK30KKworc3RydWN0IGtvbWVkYV9jb2VmZnNf
bWFuYWdlciAqa29tZWRhX2NvZWZmc19jcmVhdGVfbWFuYWdlcih1MzIgY29lZmZzX3N6KQorewor
CXN0cnVjdCBrb21lZGFfY29lZmZzX21hbmFnZXIgKm1ncjsKKworCW1nciA9IGt6YWxsb2Moc2l6
ZW9mKCptZ3IpLCBHRlBfS0VSTkVMKTsKKwlpZiAoIW1ncikKKwkJcmV0dXJuIEVSUl9QVFIoLUVO
T01FTSk7CisKKwltdXRleF9pbml0KCZtZ3ItPm11dGV4KTsKKwltZ3ItPmNvZWZmc19zeiA9IGNv
ZWZmc19zejsKKworCXJldHVybiBtZ3I7Cit9CisKK3ZvaWQga29tZWRhX2NvZWZmc19kZXN0cm95
X21hbmFnZXIoc3RydWN0IGtvbWVkYV9jb2VmZnNfbWFuYWdlciAqbWdyKQoreworCXUzMiBpOwor
CisJaWYgKCFtZ3IpCisJCXJldHVybjsKKworCWZvciAoaSA9IDA7IGkgPCBtZ3ItPm5fdGFibGVz
OyBpKyspIHsKKwkJV0FSTl9PTihpc190YWJsZV9pbl91c2luZyhtZ3ItPnRhYmxlc1tpXSkpOwor
CQlrZnJlZShtZ3ItPnRhYmxlc1tpXS0+Y29lZmZzKTsKKwkJa2ZyZWUobWdyLT50YWJsZXNbaV0p
OworCX0KKworCWtmcmVlKG1ncik7Cit9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2VmZnMuaCBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX2NvZWZmcy5oCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAw
MDAwMDAwMDAwMC4uMTcyYWMyZWExN2JhCi0tLSAvZGV2L251bGwKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29lZmZzLmgKQEAgLTAsMCArMSw3NCBAQAor
LyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KKy8qCisgKiAoQykgQ09QWVJJ
R0hUIDIwMTkgQVJNIExpbWl0ZWQuIEFsbCByaWdodHMgcmVzZXJ2ZWQuCisgKiBBdXRob3I6IEph
bWVzLlFpYW4uV2FuZyA8amFtZXMucWlhbi53YW5nQGFybS5jb20+CisgKgorICovCisjaWZuZGVm
IF9LT01FREFfQ09FRkZTX0hfCisjZGVmaW5lIF9LT01FREFfQ09FRkZTX0hfCisKKyNpbmNsdWRl
IDxsaW51eC9yZWZjb3VudC5oPgorCisvKiBLb21lZGEgZGlzcGxheSBIV3MgaGF2ZSBraW5kcyBv
ZiBjb2VmZmljaWVudCB0YWJsZXMgZm9yIHZhcmlvdXMgcHVycG9zZXMsCisgKiBsaWtlIGdhbW1h
L2RlZ2FtbWEuIHVzdXNhbGx5IHRoZXNlIHRhYmxlcyBhcmUgc2hhcmVkIGJ5IG11bHRpcGxlIEhX
IGNvbXBvbmVudAorICogYW5kIGxpbWl0ZWQgbnVtYmVyLgorICogVGhlIGtvbWVkYV9jb2VmZnNf
dGFibGUvbWFuYWdlciBhcmUgaW1wb3J0ZWQgZm9yIGRlc2NyaWJpbmcgYW5kIG1hbmFnaW5nCisg
KiB0aGVzZSB0YWJsZXMgZm9yIHRhYmxlIHJldXNlIGFuZCByYWNpbmcuCisgKi8KK3N0cnVjdCBr
b21lZGFfY29lZmZzX3RhYmxlIHsKKwlzdHJ1Y3Qga29tZWRhX2NvZWZmc19tYW5hZ2VyICptZ3I7
CisJcmVmY291bnRfdCByZWZjb3VudDsKKwlib29sIG5lZWRzX3VwZGF0ZTsKKwl1MzIgaHdfaWQ7
CisJdm9pZCAqY29lZmZzOworCXUzMiBfX2lvbWVtICpyZWc7CisJdm9pZCAoKnVwZGF0ZSkoc3Ry
dWN0IGtvbWVkYV9jb2VmZnNfdGFibGUgKnRhYmxlKTsKK307CisKK3N0cnVjdCBrb21lZGFfY29l
ZmZzX21hbmFnZXIgeworCXN0cnVjdCBtdXRleCBtdXRleDsgLyogZm9yIHRhYmxlcyBhY2Nlc3Np
bmcgKi8KKwl1MzIgbl90YWJsZXM7CisJdTMyIGNvZWZmc19zejsKKwlzdHJ1Y3Qga29tZWRhX2Nv
ZWZmc190YWJsZSAqdGFibGVzWzhdOworfTsKKworc3RhdGljIGlubGluZSBzdHJ1Y3Qga29tZWRh
X2NvZWZmc190YWJsZSAqCitrb21lZGFfY29lZmZzX2dldChzdHJ1Y3Qga29tZWRhX2NvZWZmc190
YWJsZSAqdGFibGUpCit7CisJaWYgKHRhYmxlKQorCQlyZWZjb3VudF9pbmMoJnRhYmxlLT5yZWZj
b3VudCk7CisKKwlyZXR1cm4gdGFibGU7Cit9CisKK3N0YXRpYyBpbmxpbmUgdm9pZCBfX2tvbWVk
YV9jb2VmZnNfcHV0KHN0cnVjdCBrb21lZGFfY29lZmZzX3RhYmxlICp0YWJsZSkKK3sKKwlpZiAo
dGFibGUpCisJCXJlZmNvdW50X2RlYygmdGFibGUtPnJlZmNvdW50KTsKK30KKworI2RlZmluZSBr
b21lZGFfY29lZmZzX3B1dCh0YWJsZSkgXAorZG8geyBcCisJX19rb21lZGFfY29lZmZzX3B1dCh0
YWJsZSk7IFwKKwkodGFibGUpID0gTlVMTDsgXAorfSB3aGlsZSAoMCkKKworc3RhdGljIGlubGlu
ZSB2b2lkIGtvbWVkYV9jb2VmZnNfdXBkYXRlKHN0cnVjdCBrb21lZGFfY29lZmZzX3RhYmxlICp0
YWJsZSkKK3sKKwlpZiAoIXRhYmxlIHx8ICF0YWJsZS0+bmVlZHNfdXBkYXRlKQorCQlyZXR1cm47
CisKKwl0YWJsZS0+dXBkYXRlKHRhYmxlKTsKKwl0YWJsZS0+bmVlZHNfdXBkYXRlID0gZmFsc2U7
Cit9CisKK3N0cnVjdCBrb21lZGFfY29lZmZzX21hbmFnZXIgKmtvbWVkYV9jb2VmZnNfY3JlYXRl
X21hbmFnZXIodTMyIGNvZWZmc19zeik7Cit2b2lkIGtvbWVkYV9jb2VmZnNfZGVzdHJveV9tYW5h
Z2VyKHN0cnVjdCBrb21lZGFfY29lZmZzX21hbmFnZXIgKm1ncik7CisKK2ludCBrb21lZGFfY29l
ZmZzX2FkZChzdHJ1Y3Qga29tZWRhX2NvZWZmc19tYW5hZ2VyICptZ3IsCisJCSAgICAgIHUzMiBo
d19pZCwgdTMyIF9faW9tZW0gKnJlZywKKwkJICAgICAgdm9pZCAoKnVwZGF0ZSkoc3RydWN0IGtv
bWVkYV9jb2VmZnNfdGFibGUgKnRhYmxlKSk7CitzdHJ1Y3Qga29tZWRhX2NvZWZmc190YWJsZSAq
Citrb21lZGFfY29lZmZzX3JlcXVlc3Qoc3RydWN0IGtvbWVkYV9jb2VmZnNfbWFuYWdlciAqbWdy
LCB2b2lkICpjb2VmZnMpOworCisjZW5kaWYgLypfS09NRURBX0NPRUZGU19IXyovCi0tIAoyLjIw
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
