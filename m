Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E7E1E704
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 05:02:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D7D289369;
	Wed, 15 May 2019 03:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130048.outbound.protection.outlook.com [40.107.13.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FCAC89369
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 03:02:09 +0000 (UTC)
Received: from AM0PR08MB3521.eurprd08.prod.outlook.com (20.177.109.93) by
 AM0PR08MB3636.eurprd08.prod.outlook.com (20.177.43.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Wed, 15 May 2019 03:02:06 +0000
Received: from AM0PR08MB3521.eurprd08.prod.outlook.com
 ([fe80::b4c8:8cb9:c2a8:461c]) by AM0PR08MB3521.eurprd08.prod.outlook.com
 ([fe80::b4c8:8cb9:c2a8:461c%7]) with mapi id 15.20.1878.024; Wed, 15 May 2019
 03:02:06 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey
 <Brian.Starkey@arm.com>
Subject: [PATCH] drm/komeda: Clear enable bit in CU_INPUTx_CONTROL
Thread-Topic: [PATCH] drm/komeda: Clear enable bit in CU_INPUTx_CONTROL
Thread-Index: AQHVCsqTwNjl4L6cQ0Wy1WLvQGs8og==
Date: Wed, 15 May 2019 03:02:05 +0000
Message-ID: <1557889313-31326-1-git-send-email-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0029.apcprd03.prod.outlook.com
 (2603:1096:203:2f::17) To AM0PR08MB3521.eurprd08.prod.outlook.com
 (2603:10a6:208:dc::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.9.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cfcd0a31-2602-4056-5f41-08d6d8e1b60a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR08MB3636; 
x-ms-traffictypediagnostic: AM0PR08MB3636:
nodisclaimer: True
x-microsoft-antispam-prvs: <AM0PR08MB363624CAE652656338689D8A9F090@AM0PR08MB3636.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0038DE95A2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(39860400002)(396003)(376002)(346002)(189003)(199004)(81156014)(72206003)(14454004)(50226002)(386003)(478600001)(81166006)(6506007)(68736007)(8936002)(486006)(66066001)(3846002)(2616005)(6116002)(7736002)(305945005)(99286004)(8676002)(2906002)(52116002)(256004)(25786009)(14444005)(476003)(4326008)(54906003)(110136005)(2501003)(6486002)(6636002)(66446008)(64756008)(66556008)(66476007)(66946007)(71190400001)(71200400001)(73956011)(36756003)(316002)(53936002)(6512007)(5660300002)(2201001)(102836004)(26005)(6436002)(55236004)(186003)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3636;
 H:AM0PR08MB3521.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RH7UPMxumgRT/6cJ9yrXdfRj4VSzCIBc/99+0m8PyobcIYl80hpMlyaCz3h9VHMAxFmBAsVBABgCYniWK/M6BTth4rXayLJURXCzpCq/WJI1gatiHg0egohSYN452TuULdatFKapjsnnU+4m212+R8Q5QtScYqYjDHOnSJt+9YD0I6UkFiSdGearlYH12IGyThTa9H9W6ALkmueYwX7ZBDWiZQJ8ou5sEUy+aRshnhKLHOoGc0eDvabe1S9SiS3yCmrxSDkpQxx8N6xZr14FREkGmIMnn60j4DwXLLDXWqSe1JXZbJKuHGq/MoHgGvztHzRs7FpkuxQafVXIy/hKZE3HEp17wBxKhjEh+WDT/jGcfKigzuSt+MHRMgRusOiskzTAmlGtLdrvCPOaMj+c17J6zQz23ogmYEDYY8gsZYE=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfcd0a31-2602-4056-5f41-08d6d8e1b60a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2019 03:02:05.9814 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3636
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector1-arm-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4k0tsDuLY8JMYmozcEqZWiNTFixIgotjIAW7rlLQa40=;
 b=icJFC+czZQIke0mpTYpL+8T2emDszHq2Wm8GvIseyZBRLn462mglaKiZldc06qbtoCQvf3ap0LQ0H8lKtx7wK7BE2Rj/vVYWPaeb7AcpYBMyxyW1K4oUl6MaVQNSGhyOm+Vbs2T1+5aplYod07zQ9qWxr+Y7izH9Rgx1HhMuP9o=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
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

QmVzaWRlcyBjbGVhcmluZyB0aGUgaW5wdXQgSUQgdG8gemVybywgRDcxIGNvbXBpeiBhbHNvIGhh
cyBpbnB1dA0KZW5hYmxlIGJpdCBpbiBDVV9JTlBVVHhfQ09OVFJPTCB3aGljaCBuZWVkIHRvIGJl
IGNsZWFyZWQuDQoNClNpZ25lZC1vZmYtYnk6IExvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGlu
YSkgPGxvd3J5LmxpQGFybS5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMgfCAxMiArKysrKysrKysrKy0NCiAxIGZpbGUgY2hh
bmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jIGIvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jDQppbmRl
eCAxMTM1ZTM4Li5mODg0NmM2IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMNCkBAIC00MzUsOCArNDM1LDE4IEBA
IHN0YXRpYyB2b2lkIGQ3MV9jb21wb25lbnRfZGlzYWJsZShzdHJ1Y3Qga29tZWRhX2NvbXBvbmVu
dCAqYykNCiANCiAJbWFsaWRwX3dyaXRlMzIocmVnLCBCTEtfQ09OVFJPTCwgMCk7DQogDQotCWZv
ciAoaSA9IDA7IGkgPCBjLT5tYXhfYWN0aXZlX2lucHV0czsgaSsrKQ0KKwlmb3IgKGkgPSAwOyBp
IDwgYy0+bWF4X2FjdGl2ZV9pbnB1dHM7IGkrKykgew0KIAkJbWFsaWRwX3dyaXRlMzIocmVnLCBC
TEtfSU5QVVRfSUQwICsgKGkgPDwgMiksIDApOw0KKw0KKwkJLyogQmVzaWRlcyBjbGVhcmluZyB0
aGUgaW5wdXQgSUQgdG8gemVybywgRDcxIGNvbXBpeiBhbHNvIGhhcw0KKwkJICogaW5wdXQgZW5h
YmxlIGJpdCBpbiBDVV9JTlBVVHhfQ09OVFJPTCB3aGljaCBuZWVkIHRvIGJlDQorCQkgKiBjbGVh
cmVkLg0KKwkJICovDQorCQlpZiAoaGFzX2JpdChjLT5pZCwgS09NRURBX1BJUEVMSU5FX0NPTVBJ
WlMpKQ0KKwkJCW1hbGlkcF93cml0ZTMyKHJlZywgQ1VfSU5QVVQwX0NPTlRST0wgKw0KKwkJCQkg
ICAgICAgaSAqIENVX1BFUl9JTlBVVF9SRUdTICogNCwNCisJCQkJICAgICAgIENVX0lOUFVUX0NU
UkxfQUxQSEEoMHhGRikpOw0KKwl9DQogfQ0KIA0KIHN0YXRpYyB2b2lkIGNvbXBpel9lbmFibGVf
aW5wdXQodTMyIF9faW9tZW0gKmlkX3JlZywNCi0tIA0KMS45LjENCg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
