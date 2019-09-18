Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E64B6B79
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 21:02:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF706F8EE;
	Wed, 18 Sep 2019 19:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C586F8FC;
 Wed, 18 Sep 2019 19:02:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Sep 2019 12:02:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,521,1559545200"; d="scan'208";a="199145755"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
 by orsmga002.jf.intel.com with ESMTP; 18 Sep 2019 12:02:07 -0700
Received: from irsmsx106.ger.corp.intel.com ([169.254.8.184]) by
 IRSMSX102.ger.corp.intel.com ([169.254.2.160]) with mapi id 14.03.0439.000;
 Wed, 18 Sep 2019 20:02:06 +0100
From: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 07/12] drm/i915: Don't look at unrelated
 PIPECONF bits for interlaced readout
Thread-Topic: [Intel-gfx] [PATCH 07/12] drm/i915: Don't look at unrelated
 PIPECONF bits for interlaced readout
Thread-Index: AQHVPXhPifqY6tqnzU6Rr+s+VciOSacyG2cA
Date: Wed, 18 Sep 2019 19:02:06 +0000
Message-ID: <72b631f96a9d45c3c44fe5d572ebd97a52b83974.camel@intel.com>
References: <20190718145053.25808-1-ville.syrjala@linux.intel.com>
 <20190718145053.25808-8-ville.syrjala@linux.intel.com>
In-Reply-To: <20190718145053.25808-8-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.66.162]
Content-ID: <FB896146F89A1B43B22FDB0F8A01D40C@intel.com>
MIME-Version: 1.0
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDE5LTA3LTE4IGF0IDE3OjUwICswMzAwLCBWaWxsZSBTeXJqYWxhIHdyb3RlOg0K
PiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0K
PiANCj4gU2luY2UgSFNXIHRoZSBQSVBFQ09ORiBwcm9ncmVzc2l2ZSB2cy4gaW50ZXJsYWNlZCBz
ZWxlY3Rpb24gaXMgZG9uZQ0KPiB3aXRoIGp1c3QgdHdvIGJpdHMgaW5zdGVhZCBvZiB0aGUgZWFy
bGllciB0aHJlZS4gTGV0J3Mgbm90IGxvb2sgYXQNCj4gdGhlDQo+IGV4dHJhIGJpdCBvbiBIU1cr
LiBBbHNvIGdlbjIgZG9lc24ndCBzdXBwb3J0IGludGVybGFjZWQgZGlzcGxheXMgYXQNCj4gYWxs
Lg0KPiANCj4gVGhpcyBpcyBhY3R1YWxseSBmaW5lIGFzIGlzIGN1cnJlbnRseSBiZWNhdXNlIHRo
ZSBleHRyYSBiaXQgaXMgbWJ6DQo+IChhcw0KPiBhcmUgYWxsIHRocmVlIGJpdHMgb24gZ2VuMiku
IEJ1dCBqdXN0IHRvIGF2b2lkIG1pc2hhcHMgaW4gdGhlIGZ1dHVyZQ0KPiBpZiB0aGUgYml0cyBn
ZXQgcmV1c2VkIGxldCdzIG9ubHkgbG9vayBhdCB3aGF0J3MgcHJvcGVybHkgZGVmaW5lZC4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5p
bnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9k
aXNwbGF5LmMgfCAxNyArKysrKysrKysrKysrKysrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jDQo+IGluZGV4IGUyNWI4MmQwN2Q0Zi4uZmZkYzM1
MGRjMjRhIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2Rpc3BsYXkuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rp
c3BsYXkuYw0KPiBAQCAtODE4OSw2ICs4MTg5LDIxIEBAIHN0YXRpYyB2b2lkIGludGVsX3NldF9w
aXBlX3NyY19zaXplKGNvbnN0DQo+IHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0YXRl
KQ0KPiAgCQkgICAoY3J0Y19zdGF0ZS0+cGlwZV9zcmNfaCAtIDEpKTsNCj4gIH0NCj4gIA0KPiAr
c3RhdGljIGJvb2wgaW50ZWxfcGlwZV9pc19pbnRlcmxhY2VkKHN0cnVjdCBpbnRlbF9jcnRjX3N0
YXRlDQo+ICpjcnRjX3N0YXRlKQ0KPiArew0KPiArCXN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpk
ZXZfcHJpdiA9IHRvX2k5MTUoY3J0Y19zdGF0ZS0NCj4gPmJhc2UuY3J0Yy0+ZGV2KTsNCj4gKwll
bnVtIHRyYW5zY29kZXIgY3B1X3RyYW5zY29kZXIgPSBjcnRjX3N0YXRlLT5jcHVfdHJhbnNjb2Rl
cjsNCj4gKw0KPiArCWlmIChJU19HRU4oZGV2X3ByaXYsIDIpKQ0KPiArCQlyZXR1cm4gZmFsc2U7
DQo+ICsNCj4gKwlpZiAoSU5URUxfR0VOKGRldl9wcml2KSA+PSA5IHx8DQo+ICsJICAgIElTX0JS
T0FEV0VMTChkZXZfcHJpdikgfHwgSVNfSEFTV0VMTChkZXZfcHJpdikpDQo+ICsJCXJldHVybiBJ
OTE1X1JFQUQoUElQRUNPTkYoY3B1X3RyYW5zY29kZXIpKSAmDQo+IFBJUEVDT05GX0lOVEVSTEFD
RV9NQVNLX0hTVzsNCj4gKwllbHNlDQo+ICsJCXJldHVybiBJOTE1X1JFQUQoUElQRUNPTkYoY3B1
X3RyYW5zY29kZXIpKSAmDQo+IFBJUEVDT05GX0lOVEVSTEFDRV9NQVNLOw0KPiArfQ0KPiArDQo+
ICBzdGF0aWMgdm9pZCBpbnRlbF9nZXRfcGlwZV90aW1pbmdzKHN0cnVjdCBpbnRlbF9jcnRjICpj
cnRjLA0KPiAgCQkJCSAgIHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlDQo+ICpwaXBlX2NvbmZpZykN
Cj4gIHsNCj4gQEAgLTgyMjcsNyArODI0Miw3IEBAIHN0YXRpYyB2b2lkIGludGVsX2dldF9waXBl
X3RpbWluZ3Moc3RydWN0DQo+IGludGVsX2NydGMgKmNydGMsDQo+ICAJcGlwZV9jb25maWctPmJh
c2UuYWRqdXN0ZWRfbW9kZS5jcnRjX3ZzeW5jX3N0YXJ0ID0gKHRtcCAmDQo+IDB4ZmZmZikgKyAx
Ow0KPiAgCXBpcGVfY29uZmlnLT5iYXNlLmFkanVzdGVkX21vZGUuY3J0Y192c3luY19lbmQgPSAo
KHRtcCA+PiAxNikgJg0KPiAweGZmZmYpICsgMTsNCj4gIA0KPiAtCWlmIChJOTE1X1JFQUQoUElQ
RUNPTkYoY3B1X3RyYW5zY29kZXIpKSAmDQo+IFBJUEVDT05GX0lOVEVSTEFDRV9NQVNLKSB7DQo+
ICsJaWYgKGludGVsX3BpcGVfaXNfaW50ZXJsYWNlZChwaXBlX2NvbmZpZykpIHsNCj4gIAkJcGlw
ZV9jb25maWctPmJhc2UuYWRqdXN0ZWRfbW9kZS5mbGFncyB8PQ0KPiBEUk1fTU9ERV9GTEFHX0lO
VEVSTEFDRTsNCj4gIAkJcGlwZV9jb25maWctPmJhc2UuYWRqdXN0ZWRfbW9kZS5jcnRjX3Z0b3Rh
bCArPSAxOw0KPiAgCQlwaXBlX2NvbmZpZy0+YmFzZS5hZGp1c3RlZF9tb2RlLmNydGNfdmJsYW5r
X2VuZCArPSAxOw0KVGhlIGNoYW5nZXMgbG9vayBnb29kIHRvIG1lLg0KUmV2aWV3ZWQtYnk6IEd3
YW4tZ3llb25nIE11biA8Z3dhbi1neWVvbmcubXVuQGludGVsLmNvbT4NCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
