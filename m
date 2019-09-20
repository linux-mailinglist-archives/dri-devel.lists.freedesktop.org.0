Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FA9B93C0
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 17:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18EB06FD2C;
	Fri, 20 Sep 2019 15:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10078.outbound.protection.outlook.com [40.107.1.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA1E56FD2C
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 15:11:49 +0000 (UTC)
Received: from AM4PR08CA0062.eurprd08.prod.outlook.com (2603:10a6:205:2::33)
 by HE1PR0802MB2380.eurprd08.prod.outlook.com (2603:10a6:3:c6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20; Fri, 20 Sep
 2019 15:11:44 +0000
Received: from VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::200) by AM4PR08CA0062.outlook.office365.com
 (2603:10a6:205:2::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20 via Frontend
 Transport; Fri, 20 Sep 2019 15:11:44 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT051.mail.protection.outlook.com (10.152.19.75) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20 via Frontend Transport; Fri, 20 Sep 2019 15:11:43 +0000
Received: ("Tessian outbound 96594883d423:v31");
 Fri, 20 Sep 2019 15:11:43 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 559811f6c7f1a935
X-CR-MTA-TID: 64aa7808
Received: from eb9bcdb5fd13.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.0.53]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3CD20C1C-D022-4971-B17E-3C2D0624BF6B.1; 
 Fri, 20 Sep 2019 15:11:37 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2053.outbound.protection.outlook.com [104.47.0.53])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eb9bcdb5fd13.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 20 Sep 2019 15:11:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T4O34PFubAK/EOitBubVvox0j8+Op7Z+yHC3J1V2t5WMAcCr2VmYrO8J24FJseV5TMXx82nvnxrGeQZ/UMR43RGS5RVqpAfSaje/y7qMnNC3RDSG58PwBnYflqBxHgNNB63zlLNeHuScrvhXu+UteZST7WxKv8RpDdneTgh48pYtum27VvGJ7vV8jC6vIleEUVgImG/LdbrOCVLfrnJwA330XMcnbtGSYvwbz2IbAPCGT78DmJk1yBfaHWQokkx0XW4t+nt5cJwpfMcO/PBvhaTCoU/OUxNAvObYLPpzDvTzFG0nPVNqcM0agv8C9comhnIYx5lRQDQT1QidmBPn8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sHVkMlSR2b6lI592n0vukuzMF2CuiDiXSXEf8V8Zhzw=;
 b=oc05TgBFek8iNvODGrCcPyk0eXVB0bAmE9NccC0zKbfRjK577cW3eG0KfV2pobo9odrcgzUYvZr7gH1jLGhbEM7vj3oO3nrXDT9eyOM7MsCiy6tFWSDiybX5jCtQiYKdLzU+/sQfUDtydF78V9gAtbA3U6TCI9RD0LIAVr2Q2gargdEVFdvIaqgNBllAcjgOG38zABcMtfpufe37CqnXEGvlNa2VEBeXnGQ3HU+fz3OV/x4kn0qVSHGsfUW1iAYQQVe8gHpd0qmlPqAercPgm7Cq6lTG7YgXXaH3r10I8zhwEd7WpXO2YC6Pdbyg3MfD6w6XJDoRNEa7WndJ1YjQzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3264.eurprd08.prod.outlook.com (52.134.30.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Fri, 20 Sep 2019 15:11:35 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::f164:4d79:79f:dc6f]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::f164:4d79:79f:dc6f%7]) with mapi id 15.20.2263.023; Fri, 20 Sep 2019
 15:11:34 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/komeda: Fix typos in komeda_splitter_validate
Thread-Topic: [PATCH] drm/komeda: Fix typos in komeda_splitter_validate
Thread-Index: AQHVb8WxZ1V2B5EmMkKFYK26VJ4Bbw==
Date: Fri, 20 Sep 2019 15:11:34 +0000
Message-ID: <20190920151117.22725-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LO2P265CA0326.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::26) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: a182b895-551f-4a66-e8bd-08d73ddcd8b2
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB3264; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB3264:|VI1PR08MB3264:|HE1PR0802MB2380:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0802MB2380B53417D87545530BA45F8F880@HE1PR0802MB2380.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:4125;OLM:4125;
x-forefront-prvs: 0166B75B74
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(199004)(189003)(486006)(50226002)(44832011)(99286004)(476003)(52116002)(2616005)(6512007)(305945005)(66476007)(8936002)(6486002)(256004)(6436002)(66066001)(14444005)(25786009)(14454004)(5640700003)(81166006)(8676002)(86362001)(6506007)(386003)(81156014)(26005)(102836004)(186003)(478600001)(36756003)(6116002)(54906003)(2351001)(4326008)(66946007)(4744005)(5660300002)(7736002)(316002)(64756008)(6916009)(66556008)(66446008)(71190400001)(71200400001)(3846002)(1076003)(2906002)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3264;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: pZ4kEpFU60Lz5LR0rKpbeVpBzCccW+SFe5z2yjrCuiMlQ0DbjJlm/h0geq0mGaqc3wD+3JO5SE0IfZHdI1fcZvsAyaIOi0kcjnnBENmKfKTakO5KTOuc13z9xW2jeIrRjnhSzSrxxIOxNpRfc4CLETJOXF9AGRrRvPbuZw9W+ZQriPZn3JTPsulNhlsRDFrs+vkD852WPd1dnDqDbmASpux7lQDcfEE2ob8QpgJQrp3G1DcLxEmzRrCg78Ywfap9dH2v0NgW75tHslg1cDJAOzY/bZpeIiYQNfbYJJqWagLgLPc4V4GJyfWy7jxtpTM/qij5D4U553kXEwXR+7G2kxvcAwIgJ1sXxRO23wS5NvWh897QccV/Ny3et9vat2u9Z6GrRvdcA/+BtYq2//pqfcfHEgl4x4TQEJdazIkG+fw=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3264
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(396003)(346002)(136003)(189003)(199004)(8936002)(6512007)(6486002)(50466002)(14444005)(107886003)(23756003)(22756006)(54906003)(5640700003)(316002)(356004)(36756003)(2501003)(36906005)(6116002)(99286004)(7736002)(305945005)(76130400001)(3846002)(102836004)(1076003)(386003)(6506007)(81166006)(8676002)(14454004)(81156014)(25786009)(478600001)(5660300002)(186003)(26005)(26826003)(486006)(126002)(476003)(2616005)(336012)(70586007)(63350400001)(4744005)(4326008)(70206006)(47776003)(66066001)(2906002)(2351001)(50226002)(86362001)(8746002)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0802MB2380;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3e808726-8e9d-4170-0aa9-08d73ddcd374
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:HE1PR0802MB2380; 
NoDisclaimer: True
X-Forefront-PRVS: 0166B75B74
X-Microsoft-Antispam-Message-Info: LloVR/8/GVvvN/JMgBDYiP2PiXdLHRJDnqHVkZP7Y9mml50cBIty0uTLRTSJ8udF5HmDNfqOVUdCFDXZI7Ovpg61WLOCuR+mGQ2RV3KeR9BCIONqATzY7DnJBA/7KEK36WirIDqadbLgtDaMy0nnQW6ZvF4Mg+An7hUAPM9r108k/fBEi+QFHZi+OtLAqJ5c2CmcyIwhOWJHMn9skhRS9FVf91YxS1JzBIRu84xw5xSauHpCTJz6MGSJdckKNUAojxXM3rmDvm+pUsEt/489KWwKGO6tWrAZcHAb9Tw1TvXMaGBazdaHEiv6hD5QpDfHIDT1xLsqV5eMl73X8x1PV0cwqLAgiFx1c+Brc4aTfSh+vDbh8gg368X+gkA/sFCz2vm6V1G8yJ9UqU4R4++wyetrzaWjTTpAbYSFiuOYiKc=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2019 15:11:43.2846 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a182b895-551f-4a66-e8bd-08d73ddcd8b2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2380
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sHVkMlSR2b6lI592n0vukuzMF2CuiDiXSXEf8V8Zhzw=;
 b=LH5AE6PrFrq8mHV3szGUZQHhZnlFkKZRwqNzi/m6RGZnqW+mP9O93F1orDjmokTY/sMxgGe7BY9FmTEl6wu+igdYdy+fvw9aB4zbEoOC964bfa6p8VCujqpiDCHjxCXWlbRYX3PO5HIlffG9c4wly8BeDx+voq4WJ1ALU/cxBiE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sHVkMlSR2b6lI592n0vukuzMF2CuiDiXSXEf8V8Zhzw=;
 b=LH5AE6PrFrq8mHV3szGUZQHhZnlFkKZRwqNzi/m6RGZnqW+mP9O93F1orDjmokTY/sMxgGe7BY9FmTEl6wu+igdYdy+fvw9aB4zbEoOC964bfa6p8VCujqpiDCHjxCXWlbRYX3PO5HIlffG9c4wly8BeDx+voq4WJ1ALU/cxBiE=
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

Rml4IGJvdGggdGhlIHN0cmluZyBhbmQgdGhlIHN0cnVjdCBtZW1iZXIgYmVpbmcgcHJpbnRlZC4K
CkZpeGVzOiAyNjRiOTQzNmQyM2IgKCJkcm0va29tZWRhOiBFbmFibGUgd3JpdGViYWNrIHNwbGl0
IHN1cHBvcnQiKQpTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRhbmFz
c292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfcGlwZWxpbmVfc3RhdGUuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYwppbmRleCA5NTAyMzVhZjFl
NzkuLmRlNjRhNmE5OTY0ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jCkBAIC01NjQsOCArNTY0LDgg
QEAga29tZWRhX3NwbGl0dGVyX3ZhbGlkYXRlKHN0cnVjdCBrb21lZGFfc3BsaXR0ZXIgKnNwbGl0
dGVyLAogCX0KIAogCWlmICghaW5fcmFuZ2UoJnNwbGl0dGVyLT52c2l6ZSwgZGZsb3ctPmluX2gp
KSB7Ci0JCURSTV9ERUJVR19BVE9NSUMoInNwbGl0IGluX2luOiAlZCBleGNlZWQgdGhlIGFjY2Vw
dGFibGUgcmFuZ2UuXG4iLAotCQkJCSBkZmxvdy0+aW5fdyk7CisJCURSTV9ERUJVR19BVE9NSUMo
InNwbGl0IGluX2g6ICVkIGV4Y2VlZCB0aGUgYWNjZXB0YWJsZSByYW5nZS5cbiIsCisJCQkJIGRm
bG93LT5pbl9oKTsKIAkJcmV0dXJuIC1FSU5WQUw7CiAJfQogCi0tIAoyLjIzLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
