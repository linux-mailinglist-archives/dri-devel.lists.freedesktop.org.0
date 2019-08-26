Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CD19D0E0
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 15:45:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33BC889DC2;
	Mon, 26 Aug 2019 13:45:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E2B289DC2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 13:44:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Aug 2019 06:44:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,433,1559545200"; d="scan'208";a="174213392"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
 by orsmga008.jf.intel.com with ESMTP; 26 Aug 2019 06:44:57 -0700
Received: from irsmsx104.ger.corp.intel.com ([169.254.5.21]) by
 IRSMSX103.ger.corp.intel.com ([169.254.3.144]) with mapi id 14.03.0439.000;
 Mon, 26 Aug 2019 14:44:56 +0100
From: "Ser, Simon" <simon.ser@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/i915: add port info to debugfs
Thread-Topic: [PATCH] drm/i915: add port info to debugfs
Thread-Index: AQHVXA+Zf+Gldctl9Eao3pAIPI2uBqcNYD6A
Date: Mon, 26 Aug 2019 13:44:56 +0000
Message-ID: <5a3069c89c31af68eb667e33021ddc7723e349da.camel@intel.com>
References: <20190822110927.28249-1-simon.ser@intel.com>
 <878srg9ion.fsf@intel.com>
In-Reply-To: <878srg9ion.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.72.188]
Content-ID: <76384CE7EFE2044CB9784B35B3292263@intel.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDE5LTA4LTI2IGF0IDE2OjEwICswMzAwLCBKYW5pIE5pa3VsYSB3cm90ZToNCj4g
T24gVGh1LCAyMiBBdWcgMjAxOSwgU2ltb24gU2VyIDxzaW1vbi5zZXJAaW50ZWwuY29tPiB3cm90
ZToNCj4gPiBUaGlzIHBhdGNoIGFkZHMgYSBsaW5lIHdpdGggdGhlIHBvcnQgbmFtZSB0byBjb25u
ZWN0b3JzIGluDQo+ID4gZGVidWdmcy9pOTE1X2RlYnVnX2luZm8uIElmIHRoZSBwb3J0IGlzIFR5
cGUtQywgdGhlIFR5cGUtQyBwb3J0DQo+ID4gbnVtYmVyIGlzDQo+ID4gcHJpbnRlZCB0b28uDQo+
ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogU2ltb24gU2VyIDxzaW1vbi5zZXJAaW50ZWwuY29tPg0K
PiA+IENjOiBJbXJlIERlYWsgPGltcmUuZGVha0BpbnRlbC5jb20+DQo+ID4gQ2M6IE1hbmFzaSBO
YXZhcmUgPG5hYmFzaS5kLm5hdmFyZUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gDQo+ID4gVGhh
bmtzIGZvciB5b3VyIGNvbW1lbnRzLCBJbXJlIGFuZCBNYW5hc2kuIEhlcmUgaXMgdjI6DQo+ID4g
DQo+ID4gLSBVc2Ugc2FtZSBwb3J0IGZvcm1hdHRpbmcgYXMgaW50ZWxfdGNfcG9ydF9pbml0IChl
LmcuICJDL1RDIzEiKQ0KPiA+IC0gRml4IHR5cG8gaW4gY29tbWl0IG1lc3NhZ2UNCj4gDQo+IFVz
dWFsbHkgaW4gZHJtIHdlIHB1dCB0aGUgcGF0Y2ggY2hhbmdlbG9nIGFzIHBhcnQgb2YgdGhlIGNv
bW1pdA0KPiBtZXNzYWdlLg0KDQpFcnIsIGFjay4NCg0KPiBQbGVhc2UgcmVzZW5kIHRoZSBwYXRj
aCB0byBpbnRlbC1nZnhALCBhbmQgeW91J2xsIGdldCBvdXIgQ0kgcmVzdWx0cw0KPiB0b28uDQoN
Clllcywgc29ycnkgYWJvdXQgdGhhdC4gSSd2ZSByZS1zdWJtaXR0ZWQgdGhlIHNlcmllcyBoZXJl
Og0KaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82NTY5NS8NCg0KPiAN
Cj4gQlIsDQo+IEphbmkuDQo+IA0KPiANCj4gDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5
MTVfZGVidWdmcy5jIHwgMTAgKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5z
ZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9p
OTE1X2RlYnVnZnMuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kZWJ1Z2ZzLmMN
Cj4gPiBpbmRleCBiMzkyMjZkN2Y4ZDIuLjRiYTUwOGM5NTRmOCAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2RlYnVnZnMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2k5MTVfZGVidWdmcy5jDQo+ID4gQEAgLTI1NTcsOSArMjU1NywxMSBAQCBzdGF0
aWMgdm9pZCBpbnRlbF9sdmRzX2luZm8oc3RydWN0IHNlcV9maWxlDQo+ID4gKm0sDQo+ID4gIHN0
YXRpYyB2b2lkIGludGVsX2Nvbm5lY3Rvcl9pbmZvKHN0cnVjdCBzZXFfZmlsZSAqbSwNCj4gPiAg
CQkJCSBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQ0KPiA+ICB7DQo+ID4gKwlzdHJ1
Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSA9IHRvX2k5MTUoY29ubmVjdG9yLT5kZXYpOw0KPiA+
ICAJc3RydWN0IGludGVsX2Nvbm5lY3RvciAqaW50ZWxfY29ubmVjdG9yID0NCj4gPiB0b19pbnRl
bF9jb25uZWN0b3IoY29ubmVjdG9yKTsNCj4gPiAgCXN0cnVjdCBpbnRlbF9lbmNvZGVyICppbnRl
bF9lbmNvZGVyID0gaW50ZWxfY29ubmVjdG9yLT5lbmNvZGVyOw0KPiA+ICAJc3RydWN0IGRybV9k
aXNwbGF5X21vZGUgKm1vZGU7DQo+ID4gKwllbnVtIHRjX3BvcnQgdGNfcG9ydDsNCj4gPiANCj4g
PiAgCXNlcV9wcmludGYobSwgImNvbm5lY3RvciAlZDogdHlwZSAlcywgc3RhdHVzOiAlc1xuIiwN
Cj4gPiAgCQkgICBjb25uZWN0b3ItPmJhc2UuaWQsIGNvbm5lY3Rvci0+bmFtZSwNCj4gPiBAQCAt
MjU3OCw2ICsyNTgwLDE0IEBAIHN0YXRpYyB2b2lkIGludGVsX2Nvbm5lY3Rvcl9pbmZvKHN0cnVj
dA0KPiA+IHNlcV9maWxlICptLA0KPiA+ICAJaWYgKCFpbnRlbF9lbmNvZGVyKQ0KPiA+ICAJCXJl
dHVybjsNCj4gPiANCj4gPiArCWlmIChpbnRlbF9lbmNvZGVyLT5wb3J0ICE9IFBPUlRfTk9ORSkg
ew0KPiA+ICsJCXNlcV9wcmludGYobSwgIlx0cG9ydDogJWMiLCBwb3J0X25hbWUoaW50ZWxfZW5j
b2Rlci0NCj4gPiA+cG9ydCkpOw0KPiA+ICsJCXRjX3BvcnQgPSBpbnRlbF9wb3J0X3RvX3RjKGk5
MTUsIGludGVsX2VuY29kZXItPnBvcnQpOw0KPiA+ICsJCWlmICh0Y19wb3J0ICE9IFBPUlRfVENf
Tk9ORSkNCj4gPiArCQkJc2VxX3ByaW50ZihtLCAiL1RDIyVkIiwgdGNfcG9ydCArIDEpOw0KPiA+
ICsJCXNlcV9wcmludGYobSwgIlxuIik7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICAJc3dpdGNoIChj
b25uZWN0b3ItPmNvbm5lY3Rvcl90eXBlKSB7DQo+ID4gIAljYXNlIERSTV9NT0RFX0NPTk5FQ1RP
Ul9EaXNwbGF5UG9ydDoNCj4gPiAgCWNhc2UgRFJNX01PREVfQ09OTkVDVE9SX2VEUDoNCj4gPiAt
LQ0KPiA+IDIuMjIuMQ0KPiA+IA0KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fDQo+ID4gZHJpLWRldmVsIG1haWxpbmcgbGlzdA0KPiA+IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
