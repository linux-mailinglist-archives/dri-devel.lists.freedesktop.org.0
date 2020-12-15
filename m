Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F232DB04C
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 16:43:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7716E408;
	Tue, 15 Dec 2020 15:43:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8A16E3FE;
 Tue, 15 Dec 2020 15:43:05 +0000 (UTC)
IronPort-SDR: dOdbmGVFv7ASQO6HYJVkTbOV6ncloObuWo3GH1nCqS5pIfGTyaoiiaBSMb80014WOQII5wIN0X
 +Pq6SWdrjZew==
X-IronPort-AV: E=McAfee;i="6000,8403,9836"; a="154702393"
X-IronPort-AV: E=Sophos;i="5.78,421,1599548400"; d="scan'208";a="154702393"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2020 07:43:04 -0800
IronPort-SDR: EjW/ANEyflaolRAPf4fgD322wQ7REj3mK67a/XWoK54fiQXk0oOsiUkydoCaSinq8DReVJgGaZ
 I/3/qNiyECDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,421,1599548400"; d="scan'208";a="487929620"
Received: from irsmsx606.ger.corp.intel.com ([163.33.146.139])
 by orsmga004.jf.intel.com with ESMTP; 15 Dec 2020 07:43:03 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 IRSMSX606.ger.corp.intel.com (163.33.146.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 15 Dec 2020 15:43:02 +0000
Received: from orsmsx610.amr.corp.intel.com ([10.22.229.23]) by
 ORSMSX610.amr.corp.intel.com ([10.22.229.23]) with mapi id 15.01.1713.004;
 Tue, 15 Dec 2020 07:43:00 -0800
From: "Souza, Jose" <jose.souza@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v6 1/5] drm: Add function to convert rect in 16.16 fixed
 format to regular format
Thread-Topic: [PATCH v6 1/5] drm: Add function to convert rect in 16.16 fixed
 format to regular format
Thread-Index: AQHW0kFngQ/CzWTNIEm4x5s/JtNgt6n4wxSAgAAQmAA=
Date: Tue, 15 Dec 2020 15:43:00 +0000
Message-ID: <734d417a49858fd11d418a25831e76c8d6b566c1.camel@intel.com>
References: <20201214174912.174065-1-jose.souza@intel.com>
 <X9jLt5p62uJ38cE7@intel.com>
In-Reply-To: <X9jLt5p62uJ38cE7@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.100]
Content-ID: <489209DD0663AF43991AE6AD949DF9E9@intel.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Mun, 
 Gwan-gyeong" <gwan-gyeong.mun@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIwLTEyLTE1IGF0IDE2OjQ0ICswMjAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
DQo+IE9uIE1vbiwgRGVjIDE0LCAyMDIwIGF0IDA5OjQ5OjA4QU0gLTA4MDAsIEpvc8OpIFJvYmVy
dG8gZGUgU291emEgd3JvdGU6DQo+ID4gTXVjaCBtb3JlIGNsZWFyIHRvIHJlYWQgb25lIGZ1bmN0
aW9uIGNhbGwgdGhhbiBmb3VyIGxpbmVzIGRvaW5nIHRoaXMNCj4gPiBjb252ZXJzaW9uLg0KPiA+
IA0KPiA+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4gQ2M6IEd3YW4t
Z3llb25nIE11biA8Z3dhbi1neWVvbmcubXVuQGludGVsLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCj4gPiAtLS0N
Cj4gPiDCoGRyaXZlcnMvZ3B1L2RybS9kcm1fcmVjdC5jIHwgMTUgKysrKysrKysrKysrKysrDQo+
ID4gwqBpbmNsdWRlL2RybS9kcm1fcmVjdC5oICAgICB8ICAyICsrDQo+ID4gwqAyIGZpbGVzIGNo
YW5nZWQsIDE3IGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2RybV9yZWN0LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3JlY3QuYw0KPiA+IGluZGV4
IDA0NjBlODc0ODk2ZS4uMjQzNDU3MDRiMzUzIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fcmVjdC5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9yZWN0LmMNCj4g
PiBAQCAtMzczLDMgKzM3MywxOCBAQCB2b2lkIGRybV9yZWN0X3JvdGF0ZV9pbnYoc3RydWN0IGRy
bV9yZWN0ICpyLA0KPiA+IMKgCX0NCj4gPiDCoH0NCj4gPiDCoEVYUE9SVF9TWU1CT0woZHJtX3Jl
Y3Rfcm90YXRlX2ludik7DQo+ID4gKw0KPiA+ICsvKioNCj4gPiArICogZHJtX3JlY3RfY29udmVy
dF8xNl8xNl90b19yZWd1bGFyIC0gQ29udmVydCBhIHJlY3QgaW4gMTYuMTYgZml4ZWQgcG9pbnQg
Zm9ybQ0KPiA+ICsgKiB0byByZWd1bGFyIGZvcm0uDQo+ID4gKyAqIEBpbjogcmVjdCBpbiAxNi4x
NiBmaXhlZCBwb2ludCBmb3JtDQo+ID4gKyAqIEBvdXQ6IHJlY3QgdG8gYmUgc3RvcmVkIHRoZSBj
b252ZXJ0ZWQgdmFsdWUNCj4gPiArICovDQo+ID4gK3ZvaWQgZHJtX3JlY3RfY29udmVydF8xNl8x
Nl90b19yZWd1bGFyKHN0cnVjdCBkcm1fcmVjdCAqaW4sIHN0cnVjdCBkcm1fcmVjdCAqb3V0KQ0K
PiA+ICt7DQo+ID4gKwlvdXQtPngxID0gaW4tPngxID4+IDE2Ow0KPiA+ICsJb3V0LT55MSA9IGlu
LT55MSA+PiAxNjsNCj4gPiArCW91dC0+eDIgPSBpbi0+eDIgPj4gMTY7DQo+ID4gKwlvdXQtPnky
ID0gaW4tPnkyID4+IDE2Ow0KPiA+ICt9DQo+IA0KPiBUaGF0J3Mgbm90IHRoZSBzYW1lIGFzIHdo
YXQgd2UgZG8gaW4gbW9zdCBwbGFjZXMuIFdlIHRydW5jYXRlDQo+IHRoZSB3aWR0aC9oZWlnaHQs
IG5vdCB4Mi95Mi4gRG9pbmcgaXQgb24geDIveTIgbWF5IGluY3JlYXNlDQo+IHRoZSB3aWR0aC9o
ZWlnaHQuDQo+IA0KPiBTbyBJIHN1Z2dlc3Qgc29tZXRoaW5nIG1vcmUgbGlrZToNCj4gDQo+IHN0
YXRpYyBpbmxpbmUgdm9pZCBkcm1fcmVjdF9mcF90b19pbnQoc3RydWN0IGRybV9yZWN0ICpyKQ0K
PiB7DQo+IAlkcm1fcmVjdF9pbml0KHIsIHItPngxID4+IDE2LCByLT55MSA+PiAxNiwNCj4gCQkg
ICAgICBkcm1fcmVjdF93aWR0aChyKSA+PiAxNiwNCj4gCQkgICAgICBkcm1fcmVjdF9oZWlnaHQo
cikgPj4gMTYpOw0KPiB9DQo+IA0KPiB0byBtYXRjaCB0aGUgY3VycmVudCB3YXkgb2YgZG9pbmcg
dGhpbmdzLg0KDQpPa2F5LCBidXQgbW9zdCB1c2UgY2FzZXMgdGFrZXMgZHJtX3BsYW5lX3N0YXRl
LnNyYyBhbmQgY29udmVydHMgYW5kIHNldHMgaXQgaW4gYW5vdGhlciByZWN0LCBzbyB3aWxsIG1v
ZGlmeSBpdCB0byBoYXZlIHR3byBwYXJhbWV0ZXJzLg0KDQoNCj4gDQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
