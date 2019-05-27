Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4212B5C8
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E57489F4F;
	Mon, 27 May 2019 12:53:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5918089FA6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 12:53:40 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4RCkOT6004541; Mon, 27 May 2019 14:53:32 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2spvkgtv0a-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 27 May 2019 14:53:32 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F02FB34;
 Mon, 27 May 2019 12:53:30 +0000 (GMT)
Received: from Webmail-eu.st.com (gpxdag6node5.st.com [10.75.127.81])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C01C92ADC;
 Mon, 27 May 2019 12:53:30 +0000 (GMT)
Received: from GPXDAG6NODE6.st.com (10.75.127.82) by GPXDAG6NODE5.st.com
 (10.75.127.81) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 27 May
 2019 14:53:30 +0200
Received: from GPXDAG6NODE6.st.com ([fe80::57f:5f53:243f:cb11]) by
 GPXDAG6NODE6.st.com ([fe80::57f:5f53:243f:cb11%19]) with mapi id
 15.00.1473.003; Mon, 27 May 2019 14:53:30 +0200
From: Philippe CORNU <philippe.cornu@st.com>
To: Yannick FERTRE <yannick.fertre@st.com>, Andrzej Hajda
 <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Heiko
 Stuebner" <heiko@sntech.de>, Sam Ravnborg <sam@ravnborg.org>, Nickey Yang
 <nickey.yang@rock-chips.com>, Benjamin Gaignard
 <benjamin.gaignard@linaro.org>, Vincent ABRIOU <vincent.abriou@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre TORGUE
 <alexandre.torgue@st.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] drm/bridge/synopsys: dsi: add power on/off
 optional phy ops
Thread-Topic: [PATCH v1 1/2] drm/bridge/synopsys: dsi: add power on/off
 optional phy ops
Thread-Index: AQHVFHX9KBxWIDA/jkOuEOiHDf5mE6Z+y+mA
Date: Mon, 27 May 2019 12:53:30 +0000
Message-ID: <50f33b3f-1d64-0855-3d58-6eb965fab41b@st.com>
References: <1558952499-15418-1-git-send-email-yannick.fertre@st.com>
 <1558952499-15418-2-git-send-email-yannick.fertre@st.com>
In-Reply-To: <1558952499-15418-2-git-send-email-yannick.fertre@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <D7E3BD1C5510A34B9D31426A3781436B@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-27_07:, , signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=nJEt/0BDRs46PfwpdaEFAdcDOVcKCwDyd5gY5UsWH2E=;
 b=Zw6s5KutqRT1XS8QjcpMm/vridKNb7sBAFu6iOjdTqp4kLr2OxIuuxHtSS3oPwDVsDaZ
 r9W0B+OAaTBwQJuuWujN/GyLh7ciO8lVnQt0H1+HVGLMflNRIsFXszZsRot7bocQ49U5
 NOPD6oQE9dayG7M8O2fWTXICwsjJfiPScIjuZXtXphHNw3HOWdBuKGgE/1pOXIJU6vZF
 EUEkB5AKzR5d8jI4TuW4/SMD2mNIkrjfM3yO5iBsKZEncWIt6CKR2MdBsG9/TeLsyoOa
 Cd6fBPykXx2KXm4hVpf9uM4TI06axM1YasSSjPQRsczSIHVzIDv2gM4wnj0jjCBJ7krd zw== 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgWWFubmljaywNCmFuZCB0aGFuayB5b3UgZm9yIHlvdXIgcGF0Y2guDQoNClRlc3RlZCBzdWNj
ZXNzZnVsbHkgb24gc3RtMzJmIHRvby4NCg0KUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIENvcm51IDxw
aGlsaXBwZS5jb3JudUBzdC5jb20+DQpUZXN0ZWQtYnk6IFBoaWxpcHBlIENvcm51IDxwaGlsaXBw
ZS5jb3JudUBzdC5jb20+DQoNClBoaWxpcHBlIDotKQ0KDQpPbiA1LzI3LzE5IDEyOjIxIFBNLCBZ
YW5uaWNrIEZlcnRyw6kgd3JvdGU6DQo+IEFkZCBwb3dlciBvbiAmIG9mZiBvcHRpb25hbCBwaHlz
aWNhbCBvcGVyYXRpb24gZnVuY3Rpb25zLCBoZWxwZnVsIHRvDQo+IHByb2dyYW0gc3BlY2lmaWMg
cmVnaXN0ZXJzIG9mIHRoZSBEU0kgcGh5c2ljYWwgcGFydC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IFlhbm5pY2sgRmVydHLDqSA8eWFubmljay5mZXJ0cmVAc3QuY29tPg0KPiAtLS0NCj4gICBkcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LW1pcGktZHNpLmMgfCA4ICsrKysrKysrDQo+
ICAgaW5jbHVkZS9kcm0vYnJpZGdlL2R3X21pcGlfZHNpLmggICAgICAgICAgICAgIHwgMiArKw0K
PiAgIDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYyBiL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYw0KPiBpbmRleCBlOTE1YWU4Li41
YmI2NzZmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3
LW1pcGktZHNpLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1t
aXBpLWRzaS5jDQo+IEBAIC03NzUsNiArNzc1LDEwIEBAIHN0YXRpYyB2b2lkIGR3X21pcGlfZHNp
X2NsZWFyX2VycihzdHJ1Y3QgZHdfbWlwaV9kc2kgKmRzaSkNCj4gICBzdGF0aWMgdm9pZCBkd19t
aXBpX2RzaV9icmlkZ2VfcG9zdF9kaXNhYmxlKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpDQo+
ICAgew0KPiAgIAlzdHJ1Y3QgZHdfbWlwaV9kc2kgKmRzaSA9IGJyaWRnZV90b19kc2koYnJpZGdl
KTsNCj4gKwljb25zdCBzdHJ1Y3QgZHdfbWlwaV9kc2lfcGh5X29wcyAqcGh5X29wcyA9IGRzaS0+
cGxhdF9kYXRhLT5waHlfb3BzOw0KPiArDQo+ICsJaWYgKHBoeV9vcHMtPnBvd2VyX29mZikNCj4g
KwkJcGh5X29wcy0+cG93ZXJfb2ZmKGRzaS0+cGxhdF9kYXRhLT5wcml2X2RhdGEpOw0KPiAgIA0K
PiAgIAkvKg0KPiAgIAkgKiBTd2l0Y2ggdG8gY29tbWFuZCBtb2RlIGJlZm9yZSBwYW5lbC1icmlk
Z2UgcG9zdF9kaXNhYmxlICYNCj4gQEAgLTg3NCwxMSArODc4LDE1IEBAIHN0YXRpYyB2b2lkIGR3
X21pcGlfZHNpX2JyaWRnZV9tb2RlX3NldChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLA0KPiAg
IHN0YXRpYyB2b2lkIGR3X21pcGlfZHNpX2JyaWRnZV9lbmFibGUoc3RydWN0IGRybV9icmlkZ2Ug
KmJyaWRnZSkNCj4gICB7DQo+ICAgCXN0cnVjdCBkd19taXBpX2RzaSAqZHNpID0gYnJpZGdlX3Rv
X2RzaShicmlkZ2UpOw0KPiArCWNvbnN0IHN0cnVjdCBkd19taXBpX2RzaV9waHlfb3BzICpwaHlf
b3BzID0gZHNpLT5wbGF0X2RhdGEtPnBoeV9vcHM7DQo+ICAgDQo+ICAgCS8qIFN3aXRjaCB0byB2
aWRlbyBtb2RlIGZvciBwYW5lbC1icmlkZ2UgZW5hYmxlICYgcGFuZWwgZW5hYmxlICovDQo+ICAg
CWR3X21pcGlfZHNpX3NldF9tb2RlKGRzaSwgTUlQSV9EU0lfTU9ERV9WSURFTyk7DQo+ICAgCWlm
IChkc2ktPnNsYXZlKQ0KPiAgIAkJZHdfbWlwaV9kc2lfc2V0X21vZGUoZHNpLT5zbGF2ZSwgTUlQ
SV9EU0lfTU9ERV9WSURFTyk7DQo+ICsNCj4gKwlpZiAocGh5X29wcy0+cG93ZXJfb24pDQo+ICsJ
CXBoeV9vcHMtPnBvd2VyX29uKGRzaS0+cGxhdF9kYXRhLT5wcml2X2RhdGEpOw0KPiAgIH0NCj4g
ICANCj4gICBzdGF0aWMgZW51bSBkcm1fbW9kZV9zdGF0dXMNCj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvZHJtL2JyaWRnZS9kd19taXBpX2RzaS5oIGIvaW5jbHVkZS9kcm0vYnJpZGdlL2R3X21pcGlf
ZHNpLmgNCj4gaW5kZXggN2QzZGQ2OS4uZGY2ZWRhNiAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9k
cm0vYnJpZGdlL2R3X21pcGlfZHNpLmgNCj4gKysrIGIvaW5jbHVkZS9kcm0vYnJpZGdlL2R3X21p
cGlfZHNpLmgNCj4gQEAgLTE0LDYgKzE0LDggQEAgc3RydWN0IGR3X21pcGlfZHNpOw0KPiAgIA0K
PiAgIHN0cnVjdCBkd19taXBpX2RzaV9waHlfb3BzIHsNCj4gICAJaW50ICgqaW5pdCkodm9pZCAq
cHJpdl9kYXRhKTsNCj4gKwl2b2lkICgqcG93ZXJfb24pKHZvaWQgKnByaXZfZGF0YSk7DQo+ICsJ
dm9pZCAoKnBvd2VyX29mZikodm9pZCAqcHJpdl9kYXRhKTsNCj4gICAJaW50ICgqZ2V0X2xhbmVf
bWJwcykodm9pZCAqcHJpdl9kYXRhLA0KPiAgIAkJCSAgICAgY29uc3Qgc3RydWN0IGRybV9kaXNw
bGF5X21vZGUgKm1vZGUsDQo+ICAgCQkJICAgICB1bnNpZ25lZCBsb25nIG1vZGVfZmxhZ3MsIHUz
MiBsYW5lcywgdTMyIGZvcm1hdCwNCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
