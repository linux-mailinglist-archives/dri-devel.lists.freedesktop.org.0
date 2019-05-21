Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AA725320
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 16:58:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B49B689458;
	Tue, 21 May 2019 14:58:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720089.outbound.protection.outlook.com [40.107.72.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4257889458
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 14:58:41 +0000 (UTC)
Received: from BYAPR05MB5240.namprd05.prod.outlook.com (20.177.231.90) by
 BYAPR05MB5463.namprd05.prod.outlook.com (20.177.185.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.12; Tue, 21 May 2019 14:58:36 +0000
Received: from BYAPR05MB5240.namprd05.prod.outlook.com
 ([fe80::fcdb:d7ca:1d55:4cc3]) by BYAPR05MB5240.namprd05.prod.outlook.com
 ([fe80::fcdb:d7ca:1d55:4cc3%6]) with mapi id 15.20.1922.013; Tue, 21 May 2019
 14:58:36 +0000
From: Deepak Singh Rawat <drawat@vmware.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/vmwgfx: Don't look at state->allow_modeset
Thread-Topic: [PATCH] drm/vmwgfx: Don't look at state->allow_modeset
Thread-Index: AQHVD1xK2DoQdYH4C0mZoGcxdLXc36Z1rM+A
Date: Tue, 21 May 2019 14:58:36 +0000
Message-ID: <e93299564404090bd8275ae4566893965e57f13f.camel@vmware.com>
References: <20190520223500.6032-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20190520223500.6032-1-daniel.vetter@ffwll.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR08CA0012.namprd08.prod.outlook.com
 (2603:10b6:a03:100::25) To BYAPR05MB5240.namprd05.prod.outlook.com
 (2603:10b6:a03:9f::26)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-originating-ip: [66.170.99.2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ae071a3-6cf8-44af-a924-08d6ddfcccd6
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:BYAPR05MB5463; 
x-ms-traffictypediagnostic: BYAPR05MB5463:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-microsoft-antispam-prvs: <BYAPR05MB546379B611EE7045A39570C0BA070@BYAPR05MB5463.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0044C17179
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(136003)(396003)(39860400002)(366004)(346002)(189003)(199004)(2906002)(14454004)(107886003)(446003)(186003)(11346002)(2616005)(476003)(26005)(86362001)(478600001)(8936002)(68736007)(229853002)(50226002)(8676002)(6486002)(5660300002)(6512007)(81156014)(81166006)(305945005)(7736002)(6436002)(316002)(66946007)(73956011)(66446008)(64756008)(66556008)(66476007)(71190400001)(71200400001)(256004)(486006)(36756003)(14444005)(386003)(6506007)(53936002)(66066001)(76176011)(4326008)(102836004)(6246003)(118296001)(3846002)(99286004)(6116002)(110136005)(52116002)(54906003)(25786009)(99106002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR05MB5463;
 H:BYAPR05MB5240.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qBWb4GqpYuampyDQR7+Yky9eHT/x6uZZ8zxWEON7+qRaODqfBv/0v78VCLvg8KDn3mjxRi7KPFX2ilRZaIdfquYh38gH/Y5neRh6DS0RESv+zCBwyW6aO0EfhEFgn5WGlel2rFIiyheBc7YBee1Zq4WzUkPN+3Af1RLEVRnikXwpiU73OAigBu/dXO8Bslzyn0HdYQCkMpHOGty0asIDipb2sX6A1wAAIKAgWS82Ucv2ZNtiqlRDhR/mGRSu2vxVcGup8XSOlw+zg3831LhqERq8g5sOzJ9CN5FMU0Cd9mbDGlVnyeN+TtqJRHIcPelOet2q2UM8JJGZL6lnQHRspbSEDMNFugziHwNN12qZBa1+0l95c/qSvJ+3wQ/PA5Ks4o9wgjgVZksdRFpCkePBrnydwasff0xB52NgMwkfd+g=
Content-ID: <4E66595D7510E94CA41EB901F041F232@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae071a3-6cf8-44af-a924-08d6ddfcccd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2019 14:58:36.7415 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: drawat@vmware.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR05MB5463
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vmware.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJskKUfQqupPcB1gEQxoNx7CGeZLaovpSYy65ycjkLQ=;
 b=MZIuTIR47+MotoxVMGsINc16GB3wcnoXxU8SiNKjhVmxqptpGw0qhpRZnXiUhvpxmyeHHJrg4cKu6DegXcwxE9sVDwSaU1gS75IKhpf7pjhDGjwjPhj8onnUS6NN0Iys3g+9V37Lw9KNcC52TNe1PVlX+tIEvuTDyAKqRkvlAzY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=drawat@vmware.com; 
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IERlZXBhayBSYXdhdCA8ZHJhd2F0QHZtd2FyZS5jb20+DQoNCk9uIFR1ZSwg
MjAxOS0wNS0yMSBhdCAwMDozNSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToNCj4gVGhhdCdz
IHB1cmVseSBmb3IgdGhlIHVhcGkgbGF5ZXIgdG8gaW1wbGVtZW50IHRoZSBBTExPV19NT0RFU0VU
IGZsYWcuDQo+IA0KPiBEcml2ZXJzIHNob3VsZCBpbnN0ZWFkIGxvb2sgYXQgdGhlIHN0YXRlLCBl
LmcuIHRocm91Z2gNCj4gZHJtX2F0b21pY19jcnRjX25lZWRzX21vZGVzZXQoKSwgd2hpY2ggdm13
Z2Z4IGFscmVhZHkgZG9lcy4gQWxzbw0KPiByZW1vdmUNCj4gdGhlIGNvbmZ1c2luZyBjb21tZW50
LCBzaW5jZSBjaGVja2luZyBhbGxvd19tb2Rlc2V0IGlzIGF0IGJlc3QgYQ0KPiBtaWNybw0KPiBv
cHRpbWl6YXRpb24uDQo+IA0KPiB2MjogUmViYXNlDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPg0KPiBDYzogVk13YXJlIEdyYXBoaWNz
IDxsaW51eC1ncmFwaGljcy1tYWludGFpbmVyQHZtd2FyZS5jb20+DQo+IENjOiBUaG9tYXMgSGVs
bHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJt
L3Ztd2dmeC92bXdnZnhfa21zLmMgfCA4IC0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgOCBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Zt
d2dmeF9rbXMuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2ttcy5jDQo+IGlu
ZGV4IGI5N2JjOGU1OTQ0Yi4uMzQyODRmMGY1MDg0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vdm13Z2Z4L3Ztd2dmeF9rbXMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4
L3Ztd2dmeF9rbXMuYw0KPiBAQCAtMTcwNCwxNCArMTcwNCw2IEBAIHZtd19rbXNfYXRvbWljX2No
ZWNrX21vZGVzZXQoc3RydWN0IGRybV9kZXZpY2UNCj4gKmRldiwNCj4gIAlpZiAocmV0KQ0KPiAg
CQlyZXR1cm4gcmV0Ow0KPiAgDQo+IC0JaWYgKCFzdGF0ZS0+YWxsb3dfbW9kZXNldCkNCj4gLQkJ
cmV0dXJuIHJldDsNCj4gLQ0KPiAtCS8qDQo+IC0JICogTGVnYWN5IHBhdGggZG8gbm90IHNldCBh
bGxvd19tb2Rlc2V0IHByb3Blcmx5IGxpa2UNCj4gLQkgKiBAZHJtX2F0b21pY19oZWxwZXJfdXBk
YXRlX3BsYW5lLCBUaGlzIHdpbGwgcmVzdWx0IGluDQo+IHVubmVjZXNzYXJ5IGNhbGwNCj4gLQkg
KiB0byB2bXdfa21zX2NoZWNrX3RvcG9sb2d5LiBTbyBleHRyYSBzZXQgb2YgY2hlY2suDQo+IC0J
ICovDQo+ICAJZm9yX2VhY2hfbmV3X2NydGNfaW5fc3RhdGUoc3RhdGUsIGNydGMsIGNydGNfc3Rh
dGUsIGkpIHsNCj4gIAkJaWYgKGRybV9hdG9taWNfY3J0Y19uZWVkc19tb2Rlc2V0KGNydGNfc3Rh
dGUpKQ0KPiAgCQkJbmVlZF9tb2Rlc2V0ID0gdHJ1ZTsNCg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
