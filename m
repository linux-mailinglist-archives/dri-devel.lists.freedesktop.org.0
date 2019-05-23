Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1182762D
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 08:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71FBF89C83;
	Thu, 23 May 2019 06:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-cys01nam02on061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe45::61a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CCD089C83
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 06:48:21 +0000 (UTC)
Received: from MN2PR05MB6141.namprd05.prod.outlook.com (20.178.241.217) by
 MN2PR05MB6384.namprd05.prod.outlook.com (20.178.246.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.10; Thu, 23 May 2019 06:48:10 +0000
Received: from MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::c19e:e8f8:b151:9ad]) by MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::c19e:e8f8:b151:9ad%6]) with mapi id 15.20.1922.013; Thu, 23 May 2019
 06:48:10 +0000
From: Thomas Hellstrom <thellstrom@vmware.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "emil.l.velikov@gmail.com" <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 2/5] drm/vmgfx: kill off unused init_mutex
Thread-Topic: [PATCH 2/5] drm/vmgfx: kill off unused init_mutex
Thread-Index: AQHVEL1lyIp/v6UOzU+fy6aVglz4WqZ4RXoA
Date: Thu, 23 May 2019 06:48:09 +0000
Message-ID: <1e7f052e2466258f817c5124b0b7fa06744a98ed.camel@vmware.com>
References: <20190522164119.24139-1-emil.l.velikov@gmail.com>
 <20190522164119.24139-2-emil.l.velikov@gmail.com>
In-Reply-To: <20190522164119.24139-2-emil.l.velikov@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [155.4.205.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 59faf644-09a2-4fa6-4d35-08d6df4a9ee7
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:MN2PR05MB6384; 
x-ms-traffictypediagnostic: MN2PR05MB6384:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-microsoft-antispam-prvs: <MN2PR05MB63849934CBB52F970BB141AEA1010@MN2PR05MB6384.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-forefront-prvs: 00462943DE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(346002)(39860400002)(376002)(396003)(189003)(199004)(68736007)(66066001)(36756003)(99286004)(229853002)(8936002)(81166006)(81156014)(8676002)(256004)(14444005)(76116006)(91956017)(102836004)(66476007)(64756008)(66556008)(86362001)(66446008)(73956011)(66946007)(5660300002)(71190400001)(14454004)(6506007)(76176011)(25786009)(71200400001)(316002)(53936002)(54906003)(110136005)(6246003)(7736002)(186003)(26005)(476003)(478600001)(6486002)(6436002)(4326008)(486006)(6116002)(3846002)(2501003)(6512007)(2616005)(305945005)(11346002)(446003)(107886003)(2906002)(118296001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR05MB6384;
 H:MN2PR05MB6141.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tJ/AlS2B0g1sMgMz//XW9hZ/UYbrFKDh6P1NUdwNn1hc+2d8JfBNP6ZEpGmbRvME7l4Pt1MVkq9KE50HrMfxUiBjWUoxqTAgE2TdXKQET50rDLv1py1denKBhp6s58T2GznB+/U5nTMsaj289vS5FNJxml9NN+nnH+YdhR5NyMkdf1O5eakOpaWK/CiG8XH6OuHAV1s8vHT6Gs53KXyQ7NAAiSyb8Aq7hyx8x+LJKtCJAAyhVyd83kGUEGqo7g3eaJ9ClWgFRGIz0jhRkGMqidK3t38EfHTW4DPvzh1ZSNrmk0ZsZjYqpoeOkgA3xjLFkCDtEfHVdH3zqUoyg9TGcWRimA7d1d+7Y0/Xs2pLQEFkHSLByI6OUOPMO4MkOSBSmYjIsq/m3W7s/DNku07oX+6ZyGg3HW5Iik/Unf8rmWs=
Content-ID: <765E8241588600498C1375A7914C9BD2@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59faf644-09a2-4fa6-4d35-08d6df4a9ee7
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2019 06:48:10.4247 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: thellstrom@vmware.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6384
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vmware.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qHUinSZ5canY7/DY8IpicKnK9YZW7KWF5h6tMXYSqC8=;
 b=U+sS0vL9w/PqnhzjuCVsatpDeQ8vUjH8Rv15qzDhn3KxcEKFuwyWBOr13bHs6cIDLQWMOL6sJRIVIJHavRE7NJBlFMbWfyQbOB4BcyUNWmlzicfUm3kacNvgHdu1DSgAeQLAqkxV0CT+GYQKDZccaFY06VsZn79VdiaGQvJ4Ba0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=thellstrom@vmware.com; 
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
Cc: "kernel@collabora.com" <kernel@collabora.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDE5LTA1LTIyIGF0IDE3OjQxICswMTAwLCBFbWlsIFZlbGlrb3Ygd3JvdGU6DQo+
IEZyb206IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+DQo+IA0KPiBB
Y2NvcmRpbmcgdG8gdGhlIGRvY3MgLSBwcmV2ZW50cyBmaXJzdG9wZW4vbGFzdGNsb3NlIHJhY2Vz
LiBZZXQgbmV2ZXINCj4gdXNlZCBpbiBwcmFjdGlzZS4NCj4gDQo+IENjOiAiVk13YXJlIEdyYXBo
aWNzIiA8bGludXgtZ3JhcGhpY3MtbWFpbnRhaW5lckB2bXdhcmUuY29tPg0KPiBDYzogVGhvbWFz
IEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPg0KPiBDYzogRGFuaWVsIFZldHRlciA8
ZGFuaWVsQGZmd2xsLmNoPg0KPiBTaWduZWQtb2ZmLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVs
aWtvdkBjb2xsYWJvcmEuY29tPg0KDQpSZXZpZXdlZC1ieTogVGhvbWFzIEhlbGxzdHJvbSA8dGhl
bGxzdHJvbUB2bXdhcmUuY29tPg0KDQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92
bXdnZnhfZHJ2LmMgfCAxIC0NCj4gIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5o
IHwgNSAtLS0tLQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA2IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jDQo+IGIvZHJpdmVy
cy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMNCj4gaW5kZXggYTM4ZjA2OTA5ZmI2Li5kM2Yx
MDhmN2U1MmQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Ry
di5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jDQo+IEBAIC02
NjQsNyArNjY0LDYgQEAgc3RhdGljIGludCB2bXdfZHJpdmVyX2xvYWQoc3RydWN0IGRybV9kZXZp
Y2UNCj4gKmRldiwgdW5zaWduZWQgbG9uZyBjaGlwc2V0KQ0KPiAgCQlJTklUX0xJU1RfSEVBRCgm
ZGV2X3ByaXYtPnJlc19scnVbaV0pOw0KPiAgCX0NCj4gIA0KPiAtCW11dGV4X2luaXQoJmRldl9w
cml2LT5pbml0X211dGV4KTsNCj4gIAlpbml0X3dhaXRxdWV1ZV9oZWFkKCZkZXZfcHJpdi0+ZmVu
Y2VfcXVldWUpOw0KPiAgCWluaXRfd2FpdHF1ZXVlX2hlYWQoJmRldl9wcml2LT5maWZvX3F1ZXVl
KTsNCj4gIAlkZXZfcHJpdi0+ZmVuY2VfcXVldWVfd2FpdGVycyA9IDA7DQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuaA0KPiBiL2RyaXZlcnMvZ3B1L2Ry
bS92bXdnZngvdm13Z2Z4X2Rydi5oDQo+IGluZGV4IDk2OTgzYzQ3ZmI0MC4uOWJlMjE3NmNjMjYw
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuaA0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuaA0KPiBAQCAtNDg0LDExICs0
ODQsNiBAQCBzdHJ1Y3Qgdm13X3ByaXZhdGUgew0KPiAgDQo+ICAJc3BpbmxvY2tfdCByZXNvdXJj
ZV9sb2NrOw0KPiAgCXN0cnVjdCBpZHIgcmVzX2lkclt2bXdfcmVzX21heF07DQo+IC0JLyoNCj4g
LQkgKiBCbG9jayBsYXN0Y2xvc2UgZnJvbSByYWNpbmcgd2l0aCBmaXJzdG9wZW4uDQo+IC0JICov
DQo+IC0NCj4gLQlzdHJ1Y3QgbXV0ZXggaW5pdF9tdXRleDsNCj4gIA0KPiAgCS8qDQo+ICAJICog
QSByZXNvdXJjZSBtYW5hZ2VyIGZvciBrZXJuZWwtb25seSBzdXJmYWNlcyBhbmQNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
