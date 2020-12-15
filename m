Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F261D2DADF2
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 14:26:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D28A6E0E5;
	Tue, 15 Dec 2020 13:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6131E6E039;
 Tue, 15 Dec 2020 13:25:55 +0000 (UTC)
IronPort-SDR: lKOHcFTmhHcRF9scrMqJea9orGF5iVlQ6Fxdb24F/hokgOE2gD8KzYDgzZztkfMqkRrcKQdUNh
 i07ebzPb8S/w==
X-IronPort-AV: E=McAfee;i="6000,8403,9835"; a="162621455"
X-IronPort-AV: E=Sophos;i="5.78,421,1599548400"; d="scan'208";a="162621455"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2020 05:25:52 -0800
IronPort-SDR: EL8pT2ZjE0/UrmD6RA/cYSegwyQQ2OUhdYOCUQi/3hM5nQZ/bZvagRMX7O/GGktvWn7FcnS+Ww
 KWAO3uQ4bXfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,421,1599548400"; d="scan'208";a="385439018"
Received: from irsmsx602.ger.corp.intel.com ([163.33.146.8])
 by fmsmga002.fm.intel.com with ESMTP; 15 Dec 2020 05:25:51 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 irsmsx602.ger.corp.intel.com (163.33.146.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 15 Dec 2020 13:25:50 +0000
Received: from orsmsx610.amr.corp.intel.com ([10.22.229.23]) by
 ORSMSX610.amr.corp.intel.com ([10.22.229.23]) with mapi id 15.01.1713.004;
 Tue, 15 Dec 2020 05:25:48 -0800
From: "Souza, Jose" <jose.souza@intel.com>
To: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v6 1/5] drm: Add function to convert rect in 16.16 fixed
 format to regular format
Thread-Topic: [PATCH v6 1/5] drm: Add function to convert rect in 16.16 fixed
 format to regular format
Thread-Index: AQHW0kFngQ/CzWTNIEm4x5s/JtNgt6n4pAEAgAAJVIA=
Date: Tue, 15 Dec 2020 13:25:48 +0000
Message-ID: <c8bcc42b753a75b4b70730fb19334ebf9c401553.camel@intel.com>
References: <20201214174912.174065-1-jose.souza@intel.com>
 <49d845f03e5ada5462c130345ac4ba11e14c25c9.camel@intel.com>
In-Reply-To: <49d845f03e5ada5462c130345ac4ba11e14c25c9.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.100]
Content-ID: <17532F155084D64FA93C916135638AF7@intel.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIwLTEyLTE1IGF0IDEyOjUyICswMDAwLCBNdW4sIEd3YW4tZ3llb25nIHdyb3Rl
Og0KPiBPbiBNb24sIDIwMjAtMTItMTQgYXQgMDk6NDkgLTA4MDAsIEpvc8OpIFJvYmVydG8gZGUg
U291emEgd3JvdGU6DQo+ID4gTXVjaCBtb3JlIGNsZWFyIHRvIHJlYWQgb25lIGZ1bmN0aW9uIGNh
bGwgdGhhbiBmb3VyIGxpbmVzIGRvaW5nIHRoaXMNCj4gPiBjb252ZXJzaW9uLg0KPiA+IA0KPiA+
IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4gQ2M6IEd3YW4tZ3llb25n
IE11biA8Z3dhbi1neWVvbmcubXVuQGludGVsLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb3PD
qSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiDC
oGRyaXZlcnMvZ3B1L2RybS9kcm1fcmVjdC5jIHwgMTUgKysrKysrKysrKysrKysrDQo+ID4gwqBp
bmNsdWRlL2RybS9kcm1fcmVjdC5oICAgICB8ICAyICsrDQo+ID4gwqAyIGZpbGVzIGNoYW5nZWQs
IDE3IGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2RybV9yZWN0LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3JlY3QuYw0KPiA+IGluZGV4IDA0NjBl
ODc0ODk2ZS4uMjQzNDU3MDRiMzUzIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fcmVjdC5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9yZWN0LmMNCj4gPiBAQCAt
MzczLDMgKzM3MywxOCBAQCB2b2lkIGRybV9yZWN0X3JvdGF0ZV9pbnYoc3RydWN0IGRybV9yZWN0
ICpyLA0KPiA+IMKgCX0NCj4gPiDCoH0NCj4gPiDCoEVYUE9SVF9TWU1CT0woZHJtX3JlY3Rfcm90
YXRlX2ludik7DQo+ID4gKw0KPiA+ICsvKioNCj4gPiArICogZHJtX3JlY3RfY29udmVydF8xNl8x
Nl90b19yZWd1bGFyIC0gQ29udmVydCBhIHJlY3QgaW4gMTYuMTYgZml4ZWQNCj4gPiBwb2ludCBm
b3JtDQo+ID4gKyAqIHRvIHJlZ3VsYXIgZm9ybS4NCj4gPiArICogQGluOiByZWN0IGluIDE2LjE2
IGZpeGVkIHBvaW50IGZvcm0NCj4gPiArICogQG91dDogcmVjdCB0byBiZSBzdG9yZWQgdGhlIGNv
bnZlcnRlZCB2YWx1ZQ0KPiA+ICsgKi8NCj4gPiArdm9pZCBkcm1fcmVjdF9jb252ZXJ0XzE2XzE2
X3RvX3JlZ3VsYXIoc3RydWN0IGRybV9yZWN0ICppbiwgc3RydWN0DQo+ID4gZHJtX3JlY3QgKm91
dCkNCj4gPiArew0KPiA+ICsJb3V0LT54MSA9IGluLT54MSA+PiAxNjsNCj4gPiArCW91dC0+eTEg
PSBpbi0+eTEgPj4gMTY7DQo+ID4gKwlvdXQtPngyID0gaW4tPngyID4+IDE2Ow0KPiA+ICsJb3V0
LT55MiA9IGluLT55MiA+PiAxNjsNCj4gPiArfQ0KPiA+ICtFWFBPUlRfU1lNQk9MKGRybV9yZWN0
X2NvbnZlcnRfMTZfMTZfdG9fcmVndWxhcik7DQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJt
L2RybV9yZWN0LmggYi9pbmNsdWRlL2RybS9kcm1fcmVjdC5oDQo+ID4gaW5kZXggZTdmNGQyNGNk
ZDAwLi4yZWY4MTgwNDE2Y2QgMTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX3JlY3Qu
aA0KPiA+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9yZWN0LmgNCj4gPiBAQCAtMjIzLDUgKzIyMyw3
IEBAIHZvaWQgZHJtX3JlY3Rfcm90YXRlKHN0cnVjdCBkcm1fcmVjdCAqciwNCj4gPiDCoHZvaWQg
ZHJtX3JlY3Rfcm90YXRlX2ludihzdHJ1Y3QgZHJtX3JlY3QgKnIsDQo+ID4gwqAJCQkgaW50IHdp
ZHRoLCBpbnQgaGVpZ2h0LA0KPiA+IMKgCQkJIHVuc2lnbmVkIGludCByb3RhdGlvbik7DQo+ID4g
K3ZvaWQgZHJtX3JlY3RfY29udmVydF8xNl8xNl90b19yZWd1bGFyKHN0cnVjdCBkcm1fcmVjdCAq
aW4sDQo+ID4gKwkJCQkgICAgICAgc3RydWN0IGRybV9yZWN0ICpvdXQpOw0KPiA+IA0KPiBIaSwN
Cj4gaWYgaXQncyBwdXJwb3NlIGlzIGp1c3QgY29udmVydGluZyAxNi4xNiBmcCB0byBpbnRlZ2Vy
LCBob3cgYWJvdXQgeW91DQo+IGhhdmUgZnVuY3Rpb24gcHJvdG90eXBlIGxpa2UgdGhpcz8NCj4g
ZXh0ZXJuIGlubGluZSBzdHJ1Y3QgZHJtX3JlY3QNCj4gZHJtX3JlY3RfY29udmVydF8xNl8xNl9m
cF90b19pbnRlZ2VyKHN0cnVjdCBkcm1fcmVjdCBpbikNCg0KSSBwcmVmZXIgaGF2ZSBhIGZ1bmN0
aW9uIGNhbGwgYXMgdGhpcyBjYW4gYmUgcmV1c2VkIGluIHNldmVyYWwgcGxhY2VzLCBzbyB0aGUg
YmluYXJpZXMgc2l6ZSBjYW4gZGVjcmVhc2UgYSBiaXQuDQpBbHNvIHBvaW50ZXJzIGFyZSBiZXR0
ZXIsIGNvbXBpbGVyIGNhbiBkZWNpZGUgdG8gbm90IGlubGluZSB0aGUgZnVuY3Rpb24gYWJvdmUg
YW5kIGl0IHdvdWxkIG5lZWQgdG8gYWxsb2NhdGUgaW4gc3RhY2sgMiBkcm1fcmVjdHMgZm9yIGV2
ZXJ5IGNhbGwuDQoNCj4gDQo+IEFuZCBpZiB0aGVyZSBhcmUgbm8gdXNlIGNhc2Ugb24gZHJtIGNv
cmUgb3Igb3RoZXIgZHJpdmVycyBleGNlcHQgaTkxNQ0KPiBkaXNwbGF5IHlldCwNCj4gYmVmb3Jl
IGFkZGluZyB0aGlzIGZ1bmN0aW9uIHRvIGRybSBjb3JlLCBob3cgYWJvdXQgeW91IGFkZCB0aGlz
DQo+IGZ1bmN0aW9uIGNvZGUgdG8gaTkxNSBmaXJzdD8NCg0KVGhlcmUgaXMgcGxlbnR5IG9mIHVz
ZXJzIGluIG90aGVyIGRyaXZlcnMsIGp1c3Qgbm90IGRvaW5nIGluIHRoaXMgc2VyaWVzLg0KDQo+
IA0KPiBCciwNCj4gRy5HLg0KPiA+IMKgI2VuZGlmDQoNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
