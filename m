Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE885099C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 13:17:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B58BC89ACD;
	Mon, 24 Jun 2019 11:17:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 908 seconds by postgrey-1.36 at gabe;
 Mon, 24 Jun 2019 11:17:32 UTC
Received: from rfout2.hes.trendmicro.com (rfout2.hes.trendmicro.com
 [54.67.111.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D65D89A57
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 11:17:32 +0000 (UTC)
Received: from 0.0.0.0_hes.trendmicro.com (unknown [10.64.14.197])
 by rfout2.hes.trendmicro.com (Postfix) with ESMTPS id 09170110B257
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 11:02:21 +0000 (UTC)
Received: from 0.0.0.0_hes.trendmicro.com (unknown [10.64.0.244])
 by rout5.hes.trendmicro.com (Postfix) with SMTP id 50681EFC05A;
 Mon, 24 Jun 2019 11:02:21 +0000 (UTC)
Received: from IND01-BO1-obe.outbound.protection.outlook.com (unknown
 [104.47.101.51])
 by relay1.hes.trendmicro.com (TrendMicro Hosted Email Security) with ESMTPS id
 E3AABAFA016; Mon, 24 Jun 2019 11:02:17 +0000 (UTC)
Received: from BMXPR01MB0759.INDPRD01.PROD.OUTLOOK.COM (10.174.217.139) by
 BMXPR01MB0725.INDPRD01.PROD.OUTLOOK.COM (10.174.216.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Mon, 24 Jun 2019 11:02:12 +0000
Received: from BMXPR01MB0759.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9a2:6d6:3674:cfe4]) by BMXPR01MB0759.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9a2:6d6:3674:cfe4%2]) with mapi id 15.20.1987.014; Mon, 24 Jun 2019
 11:02:12 +0000
From: Matt Redfearn <matt.redfearn@thinci.com>
To: Philippe CORNU <philippe.cornu@st.com>, Andrzej Hajda
 <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2] drm/bridge/synopsys: dsi: Allow VPG to be enabled via
 debugfs
Thread-Topic: [PATCH v2] drm/bridge/synopsys: dsi: Allow VPG to be enabled via
 debugfs
Thread-Index: AQHU/y0X85i6EeTE0U60zrEiE1o5cqZZawCAgFGPLIA=
Date: Mon, 24 Jun 2019 11:02:12 +0000
Message-ID: <fd4f3c69-5bbd-a7ac-983c-4aa9a2a2313e@thinci.com>
References: <20190430081646.23845-1-matt.redfearn@thinci.com>
 <0832ec0c-cf21-7b43-17a7-dbe54513453c@st.com>
In-Reply-To: <0832ec0c-cf21-7b43-17a7-dbe54513453c@st.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0329.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::29) To BMXPR01MB0759.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:13::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.242.198.86]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 458d473f-065e-4419-7706-08d6f89368df
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BMXPR01MB0725; 
x-ms-traffictypediagnostic: BMXPR01MB0725:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BMXPR01MB072540B5C152631D3D0B6C0FF1E00@BMXPR01MB0725.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 007814487B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(376002)(346002)(39830400003)(136003)(366004)(51914003)(199004)(189003)(36756003)(316002)(256004)(11346002)(73956011)(5660300002)(52116002)(66946007)(81166006)(66476007)(8676002)(81156014)(99286004)(6506007)(386003)(53546011)(7736002)(64756008)(66446008)(76176011)(66556008)(14444005)(5024004)(102836004)(966005)(66066001)(31696002)(2906002)(186003)(14454004)(6246003)(26005)(8936002)(31686004)(6116002)(54906003)(110136005)(3846002)(4326008)(25786009)(6306002)(6436002)(53936002)(305945005)(6512007)(71190400001)(476003)(2616005)(71200400001)(68736007)(486006)(478600001)(229853002)(6486002)(446003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BMXPR01MB0725;
 H:BMXPR01MB0759.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: thinci.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nRt3ZWnZFJwsEBj+r7APRL4n/QMp6m/RgpQokXizC8JKR8J29cK9zlvtiPoa4X/t/HqZy6vjwTMP3D7FvorgMw9vXmzH1s7h2r4c6aDTI7qvqgbf5hVaGrX0kSKsqo+SvOLw8urjivtumYVxMqoY74jCWCurZce7VeQc/u/RmK5tfaFOe/tClyrUz/QkzBnBoY/cf1L39FI4gq6WaVeK/p7GGZxeNKDmiH1IphvborfJdEs0U2fAFBUxEGFv95qPFcsolmXLDYD+oi7nbNaut4mRypZmwGlJFCy1ZOYrOmMQM4oeUia3/XmrKcVOb8rJ6Yx7VnuuPQskJcSwGgGRshFKxU9yOATp141p41AjkLusZ5HAgrtTrhed499crw3Wz4N6G8wq5eAWJjf+bALYEefrsKDwE5UOAT2SjbtTWlE=
Content-ID: <673ED493782C624FA846A402D3246AF3@INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: thinci.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 458d473f-065e-4419-7706-08d6f89368df
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2019 11:02:12.6393 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9d1c3c89-8615-4064-88a7-bb1a8537c779
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: matthew.redfearn@thinci.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB0725
X-TMASE-Version: StarCloud-1.3-8.2.1013-24708.006
X-TMASE-Result: 10--21.930600-4.000000
X-TMASE-MatchedRID: gjZGo2H/wj+WFjFUJMrS47rbxxduc6FP69aS+7/zbj+qvcIF1TcLYCvz
 6n8ktwf/FYJTPqa5nBCugmHX/LLuylrSDeyzIgwoGMURfhQkELLhwsEcDDUFFj8fBHJpFUzVZSz
 W4l9VtK2Y3nI9nuhyRq+GiaAH1lEUcyn09m+qqw5mPsTq8ee41kupr1fvkyppV4i674aSi3xnkE
 suGK0jP9ttEvq88DOw0w28kwy4mJ2cQSVlSLHS6gPZZctd3P4BjWP6asaL88U4WKr1PmPdtZJAF
 oLbeMln8qwX7mwx2576G/rXI1fsLGymsXpN1zOACesU3iPiNCyZ2scyRQcer4oij12xHbPu33pX
 Y2CsQeJcoXDiEo69o2DjlAC3n4bDc3eYMKyaPyRtawJSSsDgSaLwP+jjbL9KjzQKv3NY6iHZULV
 BYooo+t52cu5YqzrPri8AYtl46rNhKq67QCdeJv9XRIMLUOjQOHhqIXe4IzYVO5ChMqIWZGNoke
 yvFnLMrY81Gk+qTQV+NZ4lfSsps4f1OcQR3MIT0gVVXNgaM0pZDL1gLmoa/PoA9r2LThYYKrauX
 d3MZDUD/dHyT/Xh7Q==
X-TM-Deliver-Signature: 10D71DD5B4155AA96D5DDEFB11996D04
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thinciit.onmicrosoft.com; s=selector2-thinciit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZnFNfnz8FC8TSY5lVA+56i2fRx8Ginhvoa0wWCWdlY=;
 b=pta1ILi7k3IbEcVzHV16/sdD3cVEpxDS79BveiSTh01Fybg/W7QLbBVNwpAnzQHtYY5F7ZH0w2/8ePZ4nrFpqGnfCGhyoosVlZnupXrhGYC2j7dkYQNyYQh7jOEWwzfrz09EIUqHzk4Xy+lc/yg74jKHDR2G49LXxWDUbuM4oEc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=matthew.redfearn@thinci.com; 
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
Cc: Archit Taneja <architt@codeaurora.org>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Matthew Redfearn <matthew.redfearn@thinci.com>,
 Yannick FERTRE <yannick.fertre@st.com>,
 Nickey Yang <nickey.yang@rock-chips.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksDQpBbnl0aGluZyBzdG9wcGluZyB0aGlzIGJlaW5nIGFwcGxpZWQ/DQoNClRoYW5rcywNCk1h
dHQNCg0KT24gMDMvMDUvMjAxOSAxNjozMiwgUGhpbGlwcGUgQ09STlUgd3JvdGU6DQo+IEhpIE1h
dHQsDQo+IGFuZCBtYW55IHRoYW5rcyBmb3IgdGhlIHBhdGNoLg0KPiANCj4gVGVzdGVkIHN1Y2Nl
c3NmdWxseSBieSBZYW5uaWNrIG9uIFNUTTMyTVAxIGJvYXJkcyA6LSkNCj4gDQo+IFRlc3RlZC1i
eTogWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+DQo+IFJldmlld2VkLWJ5
OiBQaGlsaXBwZSBDb3JudSA8cGhpbGlwcGUuY29ybnVAc3QuY29tPg0KPiANCj4gVGhhbmsgeW91
LA0KPiBQaGlsaXBwZSA6LSkNCj4gDQo+IA0KPiBPbiA0LzMwLzE5IDEwOjE3IEFNLCBNYXR0IFJl
ZGZlYXJuIHdyb3RlOg0KPj4gVGhlIFN5bm9wc3lzIE1JUEkgRFNJIElQIGNvbnRhaW5zIGEgdmlk
ZW8gdGVzdCBwYXR0ZXJuIGdlbmVyYXRvciB3aGljaA0KPj4gaXMgaGVscGZ1bCBpbiBkZWJ1Z2dp
bmcgdmlkZW8gdGltaW5nIHdpdGggY29ubmVjdGVkIGRpc3BsYXlzLg0KPj4gQWRkIGEgZGVidWdm
cyBkaXJlY3RvcnkgY29udGFpbmluZyBmaWxlcyB3aGljaCBhbGxvdyB0aGUgVlBHIHRvIGJlDQo+
PiBlbmFibGVkIGFuZCBkaXNhYmxlZCwgYW5kIGl0cyBvcmllbnRhdGlvbiB0byBiZSBjaGFuZ2Vk
Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IE1hdHQgUmVkZmVhcm4gPG1hdHQucmVkZmVhcm5AdGhp
bmNpLmNvbT4NCj4+DQo+PiAtLS0NCj4+DQo+PiBDaGFuZ2VzIGluIHYyOg0KPj4gLSBFbnN1cmUg
ZHdfbWlwaV9kc2lfdmlkZW9fbW9kZV9jb25maWcoKSBkb2Vzbid0IGJyZWFrIHdpdGhvdXQgQ09O
RklHX0RFQlVHX0ZTDQo+PiAtIFRpZHkgdXAgaW5pdGlhbGlzYXRpb24gLyB0aWR5IHVwIG9mIGRl
YnVnZnMNCj4+DQo+PiAgICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LW1pcGkt
ZHNpLmMgfCA0NyArKysrKysrKysrKysrKysrKysrDQo+PiAgICAxIGZpbGUgY2hhbmdlZCwgNDcg
aW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3N5bm9wc3lzL2R3LW1pcGktZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lz
L2R3LW1pcGktZHNpLmMNCj4+IGluZGV4IDBlZTQ0MDIxNmI4Li5iZmZlZWY3YTZjYyAxMDA2NDQN
Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYw0K
Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1taXBpLWRzaS5jDQo+
PiBAQCAtMTAsNiArMTAsNyBAQA0KPj4gICAgDQo+PiAgICAjaW5jbHVkZSA8bGludXgvY2xrLmg+
DQo+PiAgICAjaW5jbHVkZSA8bGludXgvY29tcG9uZW50Lmg+DQo+PiArI2luY2x1ZGUgPGxpbnV4
L2RlYnVnZnMuaD4NCj4+ICAgICNpbmNsdWRlIDxsaW51eC9pb3BvbGwuaD4NCj4+ICAgICNpbmNs
dWRlIDxsaW51eC9tb2R1bGUuaD4NCj4+ICAgICNpbmNsdWRlIDxsaW51eC9vZl9kZXZpY2UuaD4N
Cj4+IEBAIC04Niw2ICs4Nyw4IEBADQo+PiAgICAjZGVmaW5lIFZJRF9NT0RFX1RZUEVfTk9OX0JV
UlNUX1NZTkNfRVZFTlRTCTB4MQ0KPj4gICAgI2RlZmluZSBWSURfTU9ERV9UWVBFX0JVUlNUCQkJ
MHgyDQo+PiAgICAjZGVmaW5lIFZJRF9NT0RFX1RZUEVfTUFTSwkJCTB4Mw0KPj4gKyNkZWZpbmUg
VklEX01PREVfVlBHX0VOQUJMRQkJQklUKDE2KQ0KPj4gKyNkZWZpbmUgVklEX01PREVfVlBHX0hP
UklaT05UQUwJCUJJVCgyNCkNCj4+ICAgIA0KPj4gICAgI2RlZmluZSBEU0lfVklEX1BLVF9TSVpF
CQkweDNjDQo+PiAgICAjZGVmaW5lIFZJRF9QS1RfU0laRShwKQkJCSgocCkgJiAweDNmZmYpDQo+
PiBAQCAtMjM0LDYgKzIzNywxMyBAQCBzdHJ1Y3QgZHdfbWlwaV9kc2kgew0KPj4gICAgCXUzMiBm
b3JtYXQ7DQo+PiAgICAJdW5zaWduZWQgbG9uZyBtb2RlX2ZsYWdzOw0KPj4gICAgDQo+PiArI2lm
ZGVmIENPTkZJR19ERUJVR19GUw0KPj4gKwlzdHJ1Y3QgZGVudHJ5ICpkZWJ1Z2ZzOw0KPj4gKw0K
Pj4gKwlib29sIHZwZzsNCj4+ICsJYm9vbCB2cGdfaG9yaXpvbnRhbDsNCj4+ICsjZW5kaWYgLyog
Q09ORklHX0RFQlVHX0ZTICovDQo+PiArDQo+PiAgICAJc3RydWN0IGR3X21pcGlfZHNpICptYXN0
ZXI7IC8qIGR1YWwtZHNpIG1hc3RlciBwdHIgKi8NCj4+ICAgIAlzdHJ1Y3QgZHdfbWlwaV9kc2kg
KnNsYXZlOyAvKiBkdWFsLWRzaSBzbGF2ZSBwdHIgKi8NCj4+ICAgIA0KPj4gQEAgLTUyNSw2ICs1
MzUsMTMgQEAgc3RhdGljIHZvaWQgZHdfbWlwaV9kc2lfdmlkZW9fbW9kZV9jb25maWcoc3RydWN0
IGR3X21pcGlfZHNpICpkc2kpDQo+PiAgICAJZWxzZQ0KPj4gICAgCQl2YWwgfD0gVklEX01PREVf
VFlQRV9OT05fQlVSU1RfU1lOQ19FVkVOVFM7DQo+PiAgICANCj4+ICsjaWZkZWYgQ09ORklHX0RF
QlVHX0ZTDQo+PiArCWlmIChkc2ktPnZwZykgew0KPj4gKwkJdmFsIHw9IFZJRF9NT0RFX1ZQR19F
TkFCTEU7DQo+PiArCQl2YWwgfD0gZHNpLT52cGdfaG9yaXpvbnRhbCA/IFZJRF9NT0RFX1ZQR19I
T1JJWk9OVEFMIDogMDsNCj4+ICsJfQ0KPj4gKyNlbmRpZiAvKiBDT05GSUdfREVCVUdfRlMgKi8N
Cj4+ICsNCj4+ICAgIAlkc2lfd3JpdGUoZHNpLCBEU0lfVklEX01PREVfQ0ZHLCB2YWwpOw0KPj4g
ICAgfQ0KPj4gICAgDQo+PiBAQCAtOTM1LDYgKzk1MiwzMyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGRybV9icmlkZ2VfZnVuY3MgZHdfbWlwaV9kc2lfYnJpZGdlX2Z1bmNzID0gew0KPj4gICAgCS5h
dHRhY2gJICAgICAgPSBkd19taXBpX2RzaV9icmlkZ2VfYXR0YWNoLA0KPj4gICAgfTsNCj4+ICAg
IA0KPj4gKyNpZmRlZiBDT05GSUdfREVCVUdfRlMNCj4+ICsNCj4+ICtzdGF0aWMgdm9pZCBkd19t
aXBpX2RzaV9kZWJ1Z2ZzX2luaXQoc3RydWN0IGR3X21pcGlfZHNpICpkc2kpDQo+PiArew0KPj4g
Kwlkc2ktPmRlYnVnZnMgPSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIoZGV2X25hbWUoZHNpLT5kZXYpLCBO
VUxMKTsNCj4+ICsJaWYgKElTX0VSUihkc2ktPmRlYnVnZnMpKSB7DQo+PiArCQlkZXZfZXJyKGRz
aS0+ZGV2LCAiZmFpbGVkIHRvIGNyZWF0ZSBkZWJ1Z2ZzIHJvb3RcbiIpOw0KPj4gKwkJcmV0dXJu
Ow0KPj4gKwl9DQo+PiArDQo+PiArCWRlYnVnZnNfY3JlYXRlX2Jvb2woInZwZyIsIDA2NjAsIGRz
aS0+ZGVidWdmcywgJmRzaS0+dnBnKTsNCj4+ICsJZGVidWdmc19jcmVhdGVfYm9vbCgidnBnX2hv
cml6b250YWwiLCAwNjYwLCBkc2ktPmRlYnVnZnMsDQo+PiArCQkJICAgICZkc2ktPnZwZ19ob3Jp
em9udGFsKTsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGljIHZvaWQgZHdfbWlwaV9kc2lfZGVidWdm
c19yZW1vdmUoc3RydWN0IGR3X21pcGlfZHNpICpkc2kpDQo+PiArew0KPj4gKwlkZWJ1Z2ZzX3Jl
bW92ZV9yZWN1cnNpdmUoZHNpLT5kZWJ1Z2ZzKTsNCj4+ICt9DQo+PiArDQo+PiArI2Vsc2UNCj4+
ICsNCj4+ICtzdGF0aWMgdm9pZCBkd19taXBpX2RzaV9kZWJ1Z2ZzX2luaXQoc3RydWN0IGR3X21p
cGlfZHNpICpkc2kpIHsgfQ0KPj4gK3N0YXRpYyB2b2lkIGR3X21pcGlfZHNpX2RlYnVnZnNfcmVt
b3ZlKHN0cnVjdCBkd19taXBpX2RzaSAqZHNpKSB7IH0NCj4+ICsNCj4+ICsjZW5kaWYgLyogQ09O
RklHX0RFQlVHX0ZTICovDQo+PiArDQo+PiAgICBzdGF0aWMgc3RydWN0IGR3X21pcGlfZHNpICoN
Cj4+ICAgIF9fZHdfbWlwaV9kc2lfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwN
Cj4+ICAgIAkJICAgIGNvbnN0IHN0cnVjdCBkd19taXBpX2RzaV9wbGF0X2RhdGEgKnBsYXRfZGF0
YSkNCj4+IEBAIC0xMDA1LDYgKzEwNDksNyBAQCBfX2R3X21pcGlfZHNpX3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYsDQo+PiAgICAJCWNsa19kaXNhYmxlX3VucHJlcGFyZShkc2kt
PnBjbGspOw0KPj4gICAgCX0NCj4+ICAgIA0KPj4gKwlkd19taXBpX2RzaV9kZWJ1Z2ZzX2luaXQo
ZHNpKTsNCj4+ICAgIAlwbV9ydW50aW1lX2VuYWJsZShkZXYpOw0KPj4gICAgDQo+PiAgICAJZHNp
LT5kc2lfaG9zdC5vcHMgPSAmZHdfbWlwaV9kc2lfaG9zdF9vcHM7DQo+PiBAQCAtMTAxMiw2ICsx
MDU3LDcgQEAgX19kd19taXBpX2RzaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
LA0KPj4gICAgCXJldCA9IG1pcGlfZHNpX2hvc3RfcmVnaXN0ZXIoJmRzaS0+ZHNpX2hvc3QpOw0K
Pj4gICAgCWlmIChyZXQpIHsNCj4+ICAgIAkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8gcmVnaXN0
ZXIgTUlQSSBob3N0OiAlZFxuIiwgcmV0KTsNCj4+ICsJCWR3X21pcGlfZHNpX2RlYnVnZnNfcmVt
b3ZlKGRzaSk7DQo+PiAgICAJCXJldHVybiBFUlJfUFRSKHJldCk7DQo+PiAgICAJfQ0KPj4gICAg
DQo+PiBAQCAtMTAyOSw2ICsxMDc1LDcgQEAgc3RhdGljIHZvaWQgX19kd19taXBpX2RzaV9yZW1v
dmUoc3RydWN0IGR3X21pcGlfZHNpICpkc2kpDQo+PiAgICAJbWlwaV9kc2lfaG9zdF91bnJlZ2lz
dGVyKCZkc2ktPmRzaV9ob3N0KTsNCj4+ICAgIA0KPj4gICAgCXBtX3J1bnRpbWVfZGlzYWJsZShk
c2ktPmRldik7DQo+PiArCWR3X21pcGlfZHNpX2RlYnVnZnNfcmVtb3ZlKGRzaSk7DQo+PiAgICB9
DQo+PiAgICANCj4+ICAgIHZvaWQgZHdfbWlwaV9kc2lfc2V0X3NsYXZlKHN0cnVjdCBkd19taXBp
X2RzaSAqZHNpLCBzdHJ1Y3QgZHdfbWlwaV9kc2kgKnNsYXZlKQ0KPj4NCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gZHJpLWRldmVsIG1haWxpbmcg
bGlzdA0KPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsDQo+IA0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
