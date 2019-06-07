Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD9B38E55
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 17:03:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBDE489D87;
	Fri,  7 Jun 2019 15:03:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0613.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1f::613])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BDEC89D87
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 15:03:42 +0000 (UTC)
Received: from AM0PR08MB4226.eurprd08.prod.outlook.com (20.179.36.17) by
 AM0PR08MB3219.eurprd08.prod.outlook.com (52.134.95.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.14; Fri, 7 Jun 2019 15:03:39 +0000
Received: from AM0PR08MB4226.eurprd08.prod.outlook.com
 ([fe80::bc0c:5148:629e:1a31]) by AM0PR08MB4226.eurprd08.prod.outlook.com
 ([fe80::bc0c:5148:629e:1a31%6]) with mapi id 15.20.1965.011; Fri, 7 Jun 2019
 15:03:39 +0000
From: Ayan Halder <Ayan.Halder@arm.com>
To: Ayan Halder <Ayan.Halder@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>, Brian
 Starkey <Brian.Starkey@arm.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "airlied@linux.ie" <airlied@linux.ie>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/komeda: Enable/Disable vblank interrupts
Thread-Topic: [PATCH] drm/komeda: Enable/Disable vblank interrupts
Thread-Index: AQHVHUIw9rNeEORvRUuKBGT248hnNw==
Date: Fri, 7 Jun 2019 15:03:39 +0000
Message-ID: <20190607150323.20395-1-ayan.halder@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0196.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::16) To AM0PR08MB4226.eurprd08.prod.outlook.com
 (2603:10a6:208:147::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.21.0
x-originating-ip: [217.140.106.52]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef5dfeb2-ccbc-4f99-446b-08d6eb5952ef
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR08MB3219; 
x-ms-traffictypediagnostic: AM0PR08MB3219:
nodisclaimer: True
x-microsoft-antispam-prvs: <AM0PR08MB3219F8B82CCE1CBE83EB184DE4100@AM0PR08MB3219.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 0061C35778
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(39850400004)(346002)(396003)(366004)(376002)(199004)(189003)(2501003)(1076003)(81166006)(476003)(2616005)(66066001)(81156014)(99286004)(486006)(7736002)(2906002)(72206003)(305945005)(71190400001)(5660300002)(6506007)(66946007)(73956011)(386003)(66476007)(66446008)(64756008)(102836004)(66556008)(52116002)(26005)(6486002)(50226002)(256004)(6512007)(5024004)(316002)(2201001)(4326008)(25786009)(86362001)(110136005)(44832011)(6436002)(6116002)(8936002)(3846002)(478600001)(71200400001)(186003)(8676002)(68736007)(36756003)(53936002)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3219;
 H:AM0PR08MB4226.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jLVyfg2eUL2Y0L9YFIlrTlPZttAzf2mybJzb6mDUMBNtsTMT0qjbC2YW3Ec9m42Cfys9691+Ne4Qyja/dfxnasGqCvqqjFDnvcDtYfqYTiXbz5VO6HTIcP4BKkfxkcXNp++S1Ir6g/Hv1jXac+7qK5euPjHrPT7AApUa+0j8A9Up6zXtOQL9nJRjvCftXBynad3zT8lkS6EP5HrpypvTy6EIfYFmP1o9Yota0CFMGJljB6WO9Iy3AMVBAMX4c0Tf2YxjtvqrE68xmm9Wy4m3Y3hCWCV/HbOauuILQ6NkqZVRIMqk+0abZ0/3HZQ6xawkLSHZkHtbTKpzf6PJQrkBIoM6KfTX+OthDoZIhOPhBg24xNamZr00FSbhQvjRdNMJjpWiktkQMa/8EVLFYxVO4TG7uB7LV/pDnaWIFtvsXxU=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef5dfeb2-ccbc-4f99-446b-08d6eb5952ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2019 15:03:39.8131 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ayan.Halder@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3219
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNkaq0/5Lf//tT41Zpi6esnwv21pP8q6+SwlpU6KhpU=;
 b=PUsM67q+3c24HWptTylJxHV+a2/aKHOWYQU2bjl3Pefwal+UXra3PEnm09PcDtlbgOmaU7rHCTiOnrGdWfcosJms8UCi1tztv0PKAYJdiYruUZCax2CGiS6lqhzPdKlWN5wR0DEJIavUIjm1RwuzhVnEWGU/U46Y1iPeEKohlJw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
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
Cc: nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T25lIG5lZWRzIHRvIHNldCAiKHN0cnVjdCBkcm1fZGV2aWNlICopLT5pcnFfZW5hYmxlZCA9IHRy
dWUiIHRvIHNpZ25hbCBkcm0gY29yZQ0KdG8gZW5hYmxlIHZibGFuayBpbnRlcnJ1cHRzIGFmdGVy
IHRoZSBoYXJkd2FyZSBoYXMgYmVlbiBpbml0aWFsaXplZC4NCkNvcnJlc3BvbmRpbmdseSwgb25l
IG5lZWRzIHRvIGRpc2FibGUgdmJsYW5rIGludGVycnVwdHMgYnkgc2V0dGluZw0KIihzdHJ1Y3Qg
ZHJtX2RldmljZSAqKS0+aXJxX2VuYWJsZWQgPSBmYWxzZSIgYXQgdGhlIGJlZ2lubmluZyBvZiB0
aGUNCmRlLWluaXRpYWxpemluZyByb3V0aW5lLg0KDQpTaWduZWQtb2ZmLWJ5OiBBeWFuIEt1bWFy
IGhhbGRlciA8YXlhbi5oYWxkZXJAYXJtLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jIHwgNCArKysrDQogMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9rbXMuYw0KaW5kZXggN2I1Y2RlMTRlM2JhLi5iNGZkOGVlMGQwNWYgMTAwNjQ0DQot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYw0KKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMNCkBAIC0y
MDQsNiArMjA0LDggQEAgc3RydWN0IGtvbWVkYV9rbXNfZGV2ICprb21lZGFfa21zX2F0dGFjaChz
dHJ1Y3Qga29tZWRhX2RldiAqbWRldikNCiAJaWYgKGVycikNCiAJCWdvdG8gdW5pbnN0YWxsX2ly
cTsNCiANCisJZHJtLT5pcnFfZW5hYmxlZCA9IHRydWU7DQorDQogCWVyciA9IGRybV9kZXZfcmVn
aXN0ZXIoZHJtLCAwKTsNCiAJaWYgKGVycikNCiAJCWdvdG8gdW5pbnN0YWxsX2lycTsNCkBAIC0y
MTEsNiArMjEzLDcgQEAgc3RydWN0IGtvbWVkYV9rbXNfZGV2ICprb21lZGFfa21zX2F0dGFjaChz
dHJ1Y3Qga29tZWRhX2RldiAqbWRldikNCiAJcmV0dXJuIGttczsNCiANCiB1bmluc3RhbGxfaXJx
Og0KKwlkcm0tPmlycV9lbmFibGVkID0gZmFsc2U7DQogCWRybV9pcnFfdW5pbnN0YWxsKGRybSk7
DQogY2xlYW51cF9tb2RlX2NvbmZpZzoNCiAJZHJtX21vZGVfY29uZmlnX2NsZWFudXAoZHJtKTsN
CkBAIC0yMjUsNiArMjI4LDcgQEAgdm9pZCBrb21lZGFfa21zX2RldGFjaChzdHJ1Y3Qga29tZWRh
X2ttc19kZXYgKmttcykNCiAJc3RydWN0IGRybV9kZXZpY2UgKmRybSA9ICZrbXMtPmJhc2U7DQog
CXN0cnVjdCBrb21lZGFfZGV2ICptZGV2ID0gZHJtLT5kZXZfcHJpdmF0ZTsNCiANCisJZHJtLT5p
cnFfZW5hYmxlZCA9IGZhbHNlOw0KIAltZGV2LT5mdW5jcy0+ZGlzYWJsZV9pcnEobWRldik7DQog
CWRybV9kZXZfdW5yZWdpc3Rlcihkcm0pOw0KIAlkcm1faXJxX3VuaW5zdGFsbChkcm0pOw0KLS0g
DQoyLjIxLjANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
