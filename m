Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4608C185EF
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 09:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA89E89994;
	Thu,  9 May 2019 07:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140054.outbound.protection.outlook.com [40.107.14.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8000E892E0
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2019 09:41:43 +0000 (UTC)
Received: from AM0PR04MB4865.eurprd04.prod.outlook.com (20.176.215.158) by
 AM0PR04MB4610.eurprd04.prod.outlook.com (52.135.149.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Wed, 8 May 2019 09:41:40 +0000
Received: from AM0PR04MB4865.eurprd04.prod.outlook.com
 ([fe80::f496:84c1:30b5:43be]) by AM0PR04MB4865.eurprd04.prod.outlook.com
 ([fe80::f496:84c1:30b5:43be%7]) with mapi id 15.20.1856.012; Wed, 8 May 2019
 09:41:40 +0000
From: Wen He <wen.he_1@nxp.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
Subject: [v1] gpu: ipu-v3: allow to build with ARCH_LAYERSCAPE
Thread-Topic: [v1] gpu: ipu-v3: allow to build with ARCH_LAYERSCAPE
Thread-Index: AQHVBYI8unZbTlbg6kW+K6MnY/7TAw==
Date: Wed, 8 May 2019 09:41:40 +0000
Message-ID: <20190508094318.25849-1-wen.he_1@nxp.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0198.apcprd02.prod.outlook.com
 (2603:1096:201:21::34) To AM0PR04MB4865.eurprd04.prod.outlook.com
 (2603:10a6:208:c4::30)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27699fe9-c147-4ec6-06e6-08d6d3995ee4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR04MB4610; 
x-ms-traffictypediagnostic: AM0PR04MB4610:
x-microsoft-antispam-prvs: <AM0PR04MB46103DC5C2E31AA40857286EE2320@AM0PR04MB4610.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0031A0FFAF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(136003)(376002)(366004)(346002)(39860400002)(189003)(199004)(305945005)(2906002)(81166006)(81156014)(478600001)(66946007)(8676002)(68736007)(6116002)(5660300002)(14444005)(14454004)(256004)(86362001)(8936002)(3846002)(2501003)(50226002)(7736002)(1076003)(71200400001)(71190400001)(99286004)(25786009)(64756008)(66556008)(66476007)(66446008)(476003)(2616005)(73956011)(4326008)(486006)(36756003)(186003)(52116002)(53936002)(316002)(110136005)(54906003)(26005)(6512007)(66066001)(102836004)(6436002)(6506007)(386003)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR04MB4610;
 H:AM0PR04MB4865.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6nBkK2OQPb9ZCseU0Z/+G6IeilFKqmjM8x7cKv6c5WSeljtrWtVDL+le5zlEVqvM8rlrBNaxj7VbjZSyjxcxrY/3Um18G4kf+AlAk1zf3+LZ4+d1JqScxt+p3TC4IrYrM2sZEsdLL0PeRLTcW08vChpX6PVLY1aVKpVY3tIgLVP9I1b+DOgRZWLymVyMoLSPgHHAAzVg1BiDH2WL5nMBoe9TMmlpTdFnd24bNXsQbjVHu3tktQBb6KewLt+ErnsbMLb5yIMAsVnTHxBztC7954LRZb+6iM+i8cr6SZG4Sq4Yb61+RcoIMDIj1sxsiZ2KOt8tnbX/zWCJKKaVSgIhr6GdJe/OC4yahXGENVQRpE/dqySVokgfrFww0KYNFvdxugUPcIcQP9bvUZeS2Ku6DQ4TGvlBpexMSsH4NtfhvS0=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27699fe9-c147-4ec6-06e6-08d6d3995ee4
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2019 09:41:40.0450 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4610
X-Mailman-Approved-At: Thu, 09 May 2019 07:18:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=inx5d25rd8G6Df9jrjb5Sa7t1OqRpA2ZrIRCEqAyGGc=;
 b=yKyrbavdiv0C++uKMoCsNpUqX+R7KMnNn9zJw8vD7QDikrhz1/mLKp1ySjXcxLWkV6Rqrsl/ukIPiFwTrPQuR4Hh5MBrvZIx2RfpRe7k1o7V1dwhvhu/gFMLtpPT7B04mB5BTHiyd/hFjwPRMTdA//3AZ20VhqsllM0mUoliQfc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=wen.he_1@nxp.com; 
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
Cc: Wen He <wen.he_1@nxp.com>, Leo Li <leoyang.li@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIG5ldyBMUzEwMjhBIERQIGRyaXZlciBjb2RlIGNhdXNlcyBhIGxpbmsgZmFpbHVyZSB3aGVu
IERSTV9JTVggYnVpbHQtaW4sDQpidXQgcGxhdGZvcm0gaXMgQVJDSF9MQVlFUlNDQVBFOg0KDQpk
cml2ZXJzL2dwdS9kcm0vaW14L2lwdXYzLWNydGMuYzo1MTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0
byBgaXB1X3ByZ19lbmFibGUnDQpkcml2ZXJzL2dwdS9kcm0vaW14L2lwdXYzLWNydGMuYzo1Mjog
dW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgaXB1X2RjX2VuYWJsZScNCmRyaXZlcnMvZ3B1L2RybS9p
bXgvaXB1djMtY3J0Yy5jOjUzOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBpcHVfZGNfZW5hYmxl
X2NoYW5uZWwnDQpkcml2ZXJzL2dwdS9kcm0vaW14L2lwdXYzLWNydGMuYzo1NDogdW5kZWZpbmVk
IHJlZmVyZW5jZSB0byBgaXB1X2RpX2VuYWJsZScNCmRyaXZlcnMvZ3B1L2RybS9pbXgvaXB1djMt
Y3J0Yy5vOiBJbiBmdW5jdGlvbiBgaXB1X2NydGNfbW9kZV9zZXRfbm9mYg0KDQpBZGRpbmcgYSBL
Y29uZmlnIGRlcGVuZGVuY3kgYWxsb3cgdG8gYnVpbGQgaWYgQVJDSF9MQVlFUlNDQVBFIGlzIGVu
YWJsZS4NCg0KU2lnbmVkLW9mZi1ieTogV2VuIEhlIDx3ZW4uaGVfMUBueHAuY29tPg0KLS0tDQog
ZHJpdmVycy9ncHUvaXB1LXYzL0tjb25maWcgfCAyICstDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9pcHUt
djMvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2lwdS12My9LY29uZmlnDQppbmRleCBmZTZmOGM1YjQ0
NDUuLjUxZWE4OGM0NDBkZiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2lwdS12My9LY29uZmln
DQorKysgYi9kcml2ZXJzL2dwdS9pcHUtdjMvS2NvbmZpZw0KQEAgLTEsNiArMSw2IEBADQogY29u
ZmlnIElNWF9JUFVWM19DT1JFDQogCXRyaXN0YXRlICJJUFV2MyBjb3JlIHN1cHBvcnQiDQotCWRl
cGVuZHMgb24gU09DX0lNWDUgfHwgU09DX0lNWDZRIHx8IEFSQ0hfTVVMVElQTEFURk9STSB8fCBD
T01QSUxFX1RFU1QNCisJZGVwZW5kcyBvbiBTT0NfSU1YNSB8fCBTT0NfSU1YNlEgfHwgQVJDSF9N
VUxUSVBMQVRGT1JNIHx8IENPTVBJTEVfVEVTVCB8fCBBUkNIX0xBWUVSU0NBUEUNCiAJZGVwZW5k
cyBvbiBEUk0gfHwgIURSTSAjIGlmIERSTT1tLCB0aGlzIGNhbid0IGJlICd5Jw0KIAlzZWxlY3Qg
QklUUkVWRVJTRQ0KIAlzZWxlY3QgR0VORVJJQ19BTExPQ0FUT1IgaWYgRFJNDQotLSANCjIuMTcu
MQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
