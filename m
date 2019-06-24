Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FD750B9F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 15:15:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC4C899E8;
	Mon, 24 Jun 2019 13:15:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 7964 seconds by postgrey-1.36 at gabe;
 Mon, 24 Jun 2019 13:15:05 UTC
Received: from rout5.hes.trendmicro.com (rout5.hes.trendmicro.com
 [54.219.188.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E23899E8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 13:15:05 +0000 (UTC)
Received: from 0.0.0.0_hes.trendmicro.com (unknown [10.64.10.43])
 by rout5.hes.trendmicro.com (Postfix) with SMTP id 5059AEFC08E;
 Mon, 24 Jun 2019 13:15:04 +0000 (UTC)
Received: from IND01-BO1-obe.outbound.protection.outlook.com (unknown
 [104.47.101.53])
 by relay1.hes.trendmicro.com (TrendMicro Hosted Email Security) with ESMTPS id
 2CEB1AFA016; Mon, 24 Jun 2019 13:15:02 +0000 (UTC)
Received: from BMXPR01MB0759.INDPRD01.PROD.OUTLOOK.COM (10.174.217.139) by
 BMXPR01MB2152.INDPRD01.PROD.OUTLOOK.COM (20.178.168.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Mon, 24 Jun 2019 13:14:59 +0000
Received: from BMXPR01MB0759.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9a2:6d6:3674:cfe4]) by BMXPR01MB0759.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9a2:6d6:3674:cfe4%2]) with mapi id 15.20.1987.014; Mon, 24 Jun 2019
 13:14:59 +0000
From: Matt Redfearn <matt.redfearn@thinci.com>
To: Andrzej Hajda <a.hajda@samsung.com>, Philippe CORNU
 <philippe.cornu@st.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2] drm/bridge/synopsys: dsi: Allow VPG to be enabled via
 debugfs
Thread-Topic: [PATCH v2] drm/bridge/synopsys: dsi: Allow VPG to be enabled via
 debugfs
Thread-Index: AQHU/y0X85i6EeTE0U60zrEiE1o5cqZZawCAgFGPLICAAAvBgIAAGVWA
Date: Mon, 24 Jun 2019 13:14:59 +0000
Message-ID: <8759164e-9bb9-dac8-68ff-bb93df984b6c@thinci.com>
References: <20190430081646.23845-1-matt.redfearn@thinci.com>
 <0832ec0c-cf21-7b43-17a7-dbe54513453c@st.com>
 <CGME20190624110224epcas3p45442d82c6f6c3e99311334c2603b9143@epcas3p4.samsung.com>
 <fd4f3c69-5bbd-a7ac-983c-4aa9a2a2313e@thinci.com>
 <d73e0df8-761d-380c-17f3-f3cbb737c677@samsung.com>
In-Reply-To: <d73e0df8-761d-380c-17f3-f3cbb737c677@samsung.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR05CA0020.eurprd05.prod.outlook.com
 (2603:10a6:6:14::33) To BMXPR01MB0759.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:13::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.242.198.86]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ecada44-c6b8-4d15-350c-08d6f8a5f54a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BMXPR01MB2152; 
x-ms-traffictypediagnostic: BMXPR01MB2152:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BMXPR01MB21528FE2836B14348EF4882BF1E00@BMXPR01MB2152.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 007814487B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(39840400004)(346002)(136003)(376002)(366004)(51914003)(189003)(199004)(66446008)(66556008)(66476007)(478600001)(66066001)(5660300002)(2616005)(64756008)(5024004)(53546011)(52116002)(76176011)(386003)(305945005)(6246003)(14444005)(6512007)(3846002)(6116002)(14454004)(256004)(31686004)(6306002)(966005)(25786009)(53936002)(7736002)(54906003)(73956011)(99286004)(4326008)(68736007)(71190400001)(110136005)(71200400001)(2906002)(6506007)(6486002)(229853002)(66946007)(31696002)(8936002)(486006)(6436002)(36756003)(316002)(8676002)(26005)(186003)(81166006)(446003)(81156014)(11346002)(102836004)(476003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BMXPR01MB2152;
 H:BMXPR01MB0759.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: thinci.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6BatjTHhNq0yobgPj8B2bviGojy5myo8Kb3XofAhiV1LqiofcUKb8+CFJpeekVdXQMqjzObQoztCt7AaJ15DnjowWcTsQqGH/l/2Ha765PQ+1/hKIlflF7gqpqMBCPssmZcNJK3OlaWHg0TNkEB8UTACOV7hTzVfkvdahJ+WVhLCJnIxvUu8pOoRoGls0IzAJQbanFyNQXWxMer0CMFH4ReBMrQUqIRM58xMA2J4qgLxa760CYNs+2bagff9/ER1bEUQSfoFlbJwpsPqpR+mMTkU94cAKAXqmgj7eMK8IsgzROckVRZTi7ygOYsMEZhzr3aQ8jbRnLMNwjbHL37oR2w6ZUM+beADwNtjJ7TfpV2d/JPrH91SIHHYAZKa2IAdeOlrBKWunUgUdIzuFrR3yWHx09GGrRvgF7w3ekWZV28=
Content-ID: <29F7025E3786EA469FB1DB1FCB994053@INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: thinci.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ecada44-c6b8-4d15-350c-08d6f8a5f54a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2019 13:14:59.0549 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9d1c3c89-8615-4064-88a7-bb1a8537c779
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: matthew.redfearn@thinci.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB2152
X-TMASE-Version: StarCloud-1.3-8.2.1013-24708.007
X-TMASE-Result: 10--20.898800-4.000000
X-TMASE-MatchedRID: gjZGo2H/wj/mLzc6AOD8DfHkpkyUphL9FK2R34l7CK1IXJo+eGm+FCvz
 6n8ktwf/FYJTPqa5nBCugmHX/LLuylrSDeyzIgwoGMURfhQkELLhwsEcDDUFFj8fBHJpFUzVZSz
 W4l9VtK2Y3nI9nuhyRq+GiaAH1lEUcyn09m+qqw5mPsTq8ee41kupr1fvkyppV4i674aSi3xnkE
 suGK0jP9ttEvq88DOw0w28kwy4mJ2cQSVlSLHS6gPZZctd3P4BjWP6asaL88U4WKr1PmPdtZJAF
 oLbeMln8qwX7mwx2576G/rXI1fsLGymsXpN1zOACesU3iPiNCyZ2scyRQcer4oij12xHbPu33pX
 Y2CsQeJcoXDiEo69o2DjlAC3n4bDc3eYMKyaPyRtawJSSsDgSaLwP+jjbL9KjzQKv3NY6iHZULV
 BYooo+t52cu5YqzrPri8AYtl46rNhKq67QCdeJv9XRIMLUOjQOHhqIXe4IzYVO5ChMqIWZGNoke
 yvFnLMrY81Gk+qTQV+NZ4lfSsps4f1OcQR3MIT0gVVXNgaM0pZDL1gLmoa/PoA9r2LThYYKrauX
 d3MZDUD/dHyT/Xh7Q==
X-TM-Deliver-Signature: 553B78098EF0E098AD66C6B4C4A54C58
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thinciit.onmicrosoft.com; s=selector2-thinciit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iEImW3tUpclzTo2H754MGpuYvjYlu6DJpOOKgm0FJH0=;
 b=a6YqemI1KCtgo4eJGAj0C6MsyhXMCmOLvogDietaruxb6V873pBUDlB23/9c3AaBlEPKBbZlvhyM5JqTuzFqdQSs+NmVvG6nxrScf+EnO8eaQp76gslrLVUqSIQN7HTuzwbo6QKUB5r4lxlCWc4Dr0O9cNEFWI+a636q5ZyLRhI=
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

DQoNCk9uIDI0LzA2LzIwMTkgMTI6NDQsIEFuZHJ6ZWogSGFqZGEgd3JvdGU6DQo+IE9uIDI0LjA2
LjIwMTkgMTM6MDIsIE1hdHQgUmVkZmVhcm4gd3JvdGU6DQo+PiBIaSwNCj4+IEFueXRoaW5nIHN0
b3BwaW5nIHRoaXMgYmVpbmcgYXBwbGllZD8NCj4gDQo+IA0KPiBRdWV1ZWQgdG8gZHJtLW1pc2Mt
bmV4dC4NCg0KVGhhbmtzIEFuZHJ6ZWohDQoNCj4gDQo+IC0tDQo+IFJlZ2FyZHMNCj4gQW5kcnpl
ag0KPiANCj4gDQo+Pg0KPj4gVGhhbmtzLA0KPj4gTWF0dA0KPj4NCj4+IE9uIDAzLzA1LzIwMTkg
MTY6MzIsIFBoaWxpcHBlIENPUk5VIHdyb3RlOg0KPj4+IEhpIE1hdHQsDQo+Pj4gYW5kIG1hbnkg
dGhhbmtzIGZvciB0aGUgcGF0Y2guDQo+Pj4NCj4+PiBUZXN0ZWQgc3VjY2Vzc2Z1bGx5IGJ5IFlh
bm5pY2sgb24gU1RNMzJNUDEgYm9hcmRzIDotKQ0KPj4+DQo+Pj4gVGVzdGVkLWJ5OiBZYW5uaWNr
IEZlcnRyw6kgPHlhbm5pY2suZmVydHJlQHN0LmNvbT4NCj4+PiBSZXZpZXdlZC1ieTogUGhpbGlw
cGUgQ29ybnUgPHBoaWxpcHBlLmNvcm51QHN0LmNvbT4NCj4+Pg0KPj4+IFRoYW5rIHlvdSwNCj4+
PiBQaGlsaXBwZSA6LSkNCj4+Pg0KPj4+DQo+Pj4gT24gNC8zMC8xOSAxMDoxNyBBTSwgTWF0dCBS
ZWRmZWFybiB3cm90ZToNCj4+Pj4gVGhlIFN5bm9wc3lzIE1JUEkgRFNJIElQIGNvbnRhaW5zIGEg
dmlkZW8gdGVzdCBwYXR0ZXJuIGdlbmVyYXRvciB3aGljaA0KPj4+PiBpcyBoZWxwZnVsIGluIGRl
YnVnZ2luZyB2aWRlbyB0aW1pbmcgd2l0aCBjb25uZWN0ZWQgZGlzcGxheXMuDQo+Pj4+IEFkZCBh
IGRlYnVnZnMgZGlyZWN0b3J5IGNvbnRhaW5pbmcgZmlsZXMgd2hpY2ggYWxsb3cgdGhlIFZQRyB0
byBiZQ0KPj4+PiBlbmFibGVkIGFuZCBkaXNhYmxlZCwgYW5kIGl0cyBvcmllbnRhdGlvbiB0byBi
ZSBjaGFuZ2VkLg0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBNYXR0IFJlZGZlYXJuIDxtYXR0
LnJlZGZlYXJuQHRoaW5jaS5jb20+DQo+Pj4+DQo+Pj4+IC0tLQ0KPj4+Pg0KPj4+PiBDaGFuZ2Vz
IGluIHYyOg0KPj4+PiAtIEVuc3VyZSBkd19taXBpX2RzaV92aWRlb19tb2RlX2NvbmZpZygpIGRv
ZXNuJ3QgYnJlYWsgd2l0aG91dCBDT05GSUdfREVCVUdfRlMNCj4+Pj4gLSBUaWR5IHVwIGluaXRp
YWxpc2F0aW9uIC8gdGlkeSB1cCBvZiBkZWJ1Z2ZzDQo+Pj4+DQo+Pj4+ICAgICBkcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LW1pcGktZHNpLmMgfCA0NyArKysrKysrKysrKysrKysr
KysrDQo+Pj4+ICAgICAxIGZpbGUgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKQ0KPj4+Pg0KPj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1taXBpLWRz
aS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1taXBpLWRzaS5jDQo+Pj4+
IGluZGV4IDBlZTQ0MDIxNmI4Li5iZmZlZWY3YTZjYyAxMDA2NDQNCj4+Pj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1taXBpLWRzaS5jDQo+Pj4+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYw0KPj4+PiBAQCAtMTAsNiAr
MTAsNyBAQA0KPj4+PiAgICAgDQo+Pj4+ICAgICAjaW5jbHVkZSA8bGludXgvY2xrLmg+DQo+Pj4+
ICAgICAjaW5jbHVkZSA8bGludXgvY29tcG9uZW50Lmg+DQo+Pj4+ICsjaW5jbHVkZSA8bGludXgv
ZGVidWdmcy5oPg0KPj4+PiAgICAgI2luY2x1ZGUgPGxpbnV4L2lvcG9sbC5oPg0KPj4+PiAgICAg
I2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPj4+PiAgICAgI2luY2x1ZGUgPGxpbnV4L29mX2Rl
dmljZS5oPg0KPj4+PiBAQCAtODYsNiArODcsOCBAQA0KPj4+PiAgICAgI2RlZmluZSBWSURfTU9E
RV9UWVBFX05PTl9CVVJTVF9TWU5DX0VWRU5UUwkweDENCj4+Pj4gICAgICNkZWZpbmUgVklEX01P
REVfVFlQRV9CVVJTVAkJCTB4Mg0KPj4+PiAgICAgI2RlZmluZSBWSURfTU9ERV9UWVBFX01BU0sJ
CQkweDMNCj4+Pj4gKyNkZWZpbmUgVklEX01PREVfVlBHX0VOQUJMRQkJQklUKDE2KQ0KPj4+PiAr
I2RlZmluZSBWSURfTU9ERV9WUEdfSE9SSVpPTlRBTAkJQklUKDI0KQ0KPj4+PiAgICAgDQo+Pj4+
ICAgICAjZGVmaW5lIERTSV9WSURfUEtUX1NJWkUJCTB4M2MNCj4+Pj4gICAgICNkZWZpbmUgVklE
X1BLVF9TSVpFKHApCQkJKChwKSAmIDB4M2ZmZikNCj4+Pj4gQEAgLTIzNCw2ICsyMzcsMTMgQEAg
c3RydWN0IGR3X21pcGlfZHNpIHsNCj4+Pj4gICAgIAl1MzIgZm9ybWF0Ow0KPj4+PiAgICAgCXVu
c2lnbmVkIGxvbmcgbW9kZV9mbGFnczsNCj4+Pj4gICAgIA0KPj4+PiArI2lmZGVmIENPTkZJR19E
RUJVR19GUw0KPj4+PiArCXN0cnVjdCBkZW50cnkgKmRlYnVnZnM7DQo+Pj4+ICsNCj4+Pj4gKwli
b29sIHZwZzsNCj4+Pj4gKwlib29sIHZwZ19ob3Jpem9udGFsOw0KPj4+PiArI2VuZGlmIC8qIENP
TkZJR19ERUJVR19GUyAqLw0KPj4+PiArDQo+Pj4+ICAgICAJc3RydWN0IGR3X21pcGlfZHNpICpt
YXN0ZXI7IC8qIGR1YWwtZHNpIG1hc3RlciBwdHIgKi8NCj4+Pj4gICAgIAlzdHJ1Y3QgZHdfbWlw
aV9kc2kgKnNsYXZlOyAvKiBkdWFsLWRzaSBzbGF2ZSBwdHIgKi8NCj4+Pj4gICAgIA0KPj4+PiBA
QCAtNTI1LDYgKzUzNSwxMyBAQCBzdGF0aWMgdm9pZCBkd19taXBpX2RzaV92aWRlb19tb2RlX2Nv
bmZpZyhzdHJ1Y3QgZHdfbWlwaV9kc2kgKmRzaSkNCj4+Pj4gICAgIAllbHNlDQo+Pj4+ICAgICAJ
CXZhbCB8PSBWSURfTU9ERV9UWVBFX05PTl9CVVJTVF9TWU5DX0VWRU5UUzsNCj4+Pj4gICAgIA0K
Pj4+PiArI2lmZGVmIENPTkZJR19ERUJVR19GUw0KPj4+PiArCWlmIChkc2ktPnZwZykgew0KPj4+
PiArCQl2YWwgfD0gVklEX01PREVfVlBHX0VOQUJMRTsNCj4+Pj4gKwkJdmFsIHw9IGRzaS0+dnBn
X2hvcml6b250YWwgPyBWSURfTU9ERV9WUEdfSE9SSVpPTlRBTCA6IDA7DQo+Pj4+ICsJfQ0KPj4+
PiArI2VuZGlmIC8qIENPTkZJR19ERUJVR19GUyAqLw0KPj4+PiArDQo+Pj4+ICAgICAJZHNpX3dy
aXRlKGRzaSwgRFNJX1ZJRF9NT0RFX0NGRywgdmFsKTsNCj4+Pj4gICAgIH0NCj4+Pj4gICAgIA0K
Pj4+PiBAQCAtOTM1LDYgKzk1MiwzMyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9icmlkZ2Vf
ZnVuY3MgZHdfbWlwaV9kc2lfYnJpZGdlX2Z1bmNzID0gew0KPj4+PiAgICAgCS5hdHRhY2gJICAg
ICAgPSBkd19taXBpX2RzaV9icmlkZ2VfYXR0YWNoLA0KPj4+PiAgICAgfTsNCj4+Pj4gICAgIA0K
Pj4+PiArI2lmZGVmIENPTkZJR19ERUJVR19GUw0KPj4+PiArDQo+Pj4+ICtzdGF0aWMgdm9pZCBk
d19taXBpX2RzaV9kZWJ1Z2ZzX2luaXQoc3RydWN0IGR3X21pcGlfZHNpICpkc2kpDQo+Pj4+ICt7
DQo+Pj4+ICsJZHNpLT5kZWJ1Z2ZzID0gZGVidWdmc19jcmVhdGVfZGlyKGRldl9uYW1lKGRzaS0+
ZGV2KSwgTlVMTCk7DQo+Pj4+ICsJaWYgKElTX0VSUihkc2ktPmRlYnVnZnMpKSB7DQo+Pj4+ICsJ
CWRldl9lcnIoZHNpLT5kZXYsICJmYWlsZWQgdG8gY3JlYXRlIGRlYnVnZnMgcm9vdFxuIik7DQo+
Pj4+ICsJCXJldHVybjsNCj4+Pj4gKwl9DQo+Pj4+ICsNCj4+Pj4gKwlkZWJ1Z2ZzX2NyZWF0ZV9i
b29sKCJ2cGciLCAwNjYwLCBkc2ktPmRlYnVnZnMsICZkc2ktPnZwZyk7DQo+Pj4+ICsJZGVidWdm
c19jcmVhdGVfYm9vbCgidnBnX2hvcml6b250YWwiLCAwNjYwLCBkc2ktPmRlYnVnZnMsDQo+Pj4+
ICsJCQkgICAgJmRzaS0+dnBnX2hvcml6b250YWwpOw0KPj4+PiArfQ0KPj4+PiArDQo+Pj4+ICtz
dGF0aWMgdm9pZCBkd19taXBpX2RzaV9kZWJ1Z2ZzX3JlbW92ZShzdHJ1Y3QgZHdfbWlwaV9kc2kg
KmRzaSkNCj4+Pj4gK3sNCj4+Pj4gKwlkZWJ1Z2ZzX3JlbW92ZV9yZWN1cnNpdmUoZHNpLT5kZWJ1
Z2ZzKTsNCj4+Pj4gK30NCj4+Pj4gKw0KPj4+PiArI2Vsc2UNCj4+Pj4gKw0KPj4+PiArc3RhdGlj
IHZvaWQgZHdfbWlwaV9kc2lfZGVidWdmc19pbml0KHN0cnVjdCBkd19taXBpX2RzaSAqZHNpKSB7
IH0NCj4+Pj4gK3N0YXRpYyB2b2lkIGR3X21pcGlfZHNpX2RlYnVnZnNfcmVtb3ZlKHN0cnVjdCBk
d19taXBpX2RzaSAqZHNpKSB7IH0NCj4+Pj4gKw0KPj4+PiArI2VuZGlmIC8qIENPTkZJR19ERUJV
R19GUyAqLw0KPj4+PiArDQo+Pj4+ICAgICBzdGF0aWMgc3RydWN0IGR3X21pcGlfZHNpICoNCj4+
Pj4gICAgIF9fZHdfbWlwaV9kc2lfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwN
Cj4+Pj4gICAgIAkJICAgIGNvbnN0IHN0cnVjdCBkd19taXBpX2RzaV9wbGF0X2RhdGEgKnBsYXRf
ZGF0YSkNCj4+Pj4gQEAgLTEwMDUsNiArMTA0OSw3IEBAIF9fZHdfbWlwaV9kc2lfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwNCj4+Pj4gICAgIAkJY2xrX2Rpc2FibGVfdW5wcmVw
YXJlKGRzaS0+cGNsayk7DQo+Pj4+ICAgICAJfQ0KPj4+PiAgICAgDQo+Pj4+ICsJZHdfbWlwaV9k
c2lfZGVidWdmc19pbml0KGRzaSk7DQo+Pj4+ICAgICAJcG1fcnVudGltZV9lbmFibGUoZGV2KTsN
Cj4+Pj4gICAgIA0KPj4+PiAgICAgCWRzaS0+ZHNpX2hvc3Qub3BzID0gJmR3X21pcGlfZHNpX2hv
c3Rfb3BzOw0KPj4+PiBAQCAtMTAxMiw2ICsxMDU3LDcgQEAgX19kd19taXBpX2RzaV9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LA0KPj4+PiAgICAgCXJldCA9IG1pcGlfZHNpX2hv
c3RfcmVnaXN0ZXIoJmRzaS0+ZHNpX2hvc3QpOw0KPj4+PiAgICAgCWlmIChyZXQpIHsNCj4+Pj4g
ICAgIAkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8gcmVnaXN0ZXIgTUlQSSBob3N0OiAlZFxuIiwg
cmV0KTsNCj4+Pj4gKwkJZHdfbWlwaV9kc2lfZGVidWdmc19yZW1vdmUoZHNpKTsNCj4+Pj4gICAg
IAkJcmV0dXJuIEVSUl9QVFIocmV0KTsNCj4+Pj4gICAgIAl9DQo+Pj4+ICAgICANCj4+Pj4gQEAg
LTEwMjksNiArMTA3NSw3IEBAIHN0YXRpYyB2b2lkIF9fZHdfbWlwaV9kc2lfcmVtb3ZlKHN0cnVj
dCBkd19taXBpX2RzaSAqZHNpKQ0KPj4+PiAgICAgCW1pcGlfZHNpX2hvc3RfdW5yZWdpc3Rlcigm
ZHNpLT5kc2lfaG9zdCk7DQo+Pj4+ICAgICANCj4+Pj4gICAgIAlwbV9ydW50aW1lX2Rpc2FibGUo
ZHNpLT5kZXYpOw0KPj4+PiArCWR3X21pcGlfZHNpX2RlYnVnZnNfcmVtb3ZlKGRzaSk7DQo+Pj4+
ICAgICB9DQo+Pj4+ICAgICANCj4+Pj4gICAgIHZvaWQgZHdfbWlwaV9kc2lfc2V0X3NsYXZlKHN0
cnVjdCBkd19taXBpX2RzaSAqZHNpLCBzdHJ1Y3QgZHdfbWlwaV9kc2kgKnNsYXZlKQ0KPj4+Pg0K
Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+Pj4g
ZHJpLWRldmVsIG1haWxpbmcgbGlzdA0KPj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCj4+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA0KPj4+DQo+IA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
