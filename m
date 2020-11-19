Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D822B90DF
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 12:22:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7593188602;
	Thu, 19 Nov 2020 11:22:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605AC884D4;
 Thu, 19 Nov 2020 11:22:41 +0000 (UTC)
IronPort-SDR: Kjuvg2bGM5dDMuh34UeQmaDF9O9dZn/vmXAD+vSMxKfnBjH7q8g1A683ZVySRLbPG+lCQ8QnEi
 phtKQ+Zx9NAA==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="255982470"
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; d="scan'208";a="255982470"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2020 03:22:40 -0800
IronPort-SDR: xyRfHnN7/Xrg/JKFPw/+5XXRqkavn8bWgzvJ5Xaw/RgtwI0PlZz08LO/Cw3eYmtK6U7ntde5yX
 Fw5nqWeVCsww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; d="scan'208";a="311609986"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga007.fm.intel.com with ESMTP; 19 Nov 2020 03:22:39 -0800
Received: from bgsmsx606.gar.corp.intel.com (10.67.234.8) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 19 Nov 2020 03:22:38 -0800
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX606.gar.corp.intel.com (10.67.234.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 19 Nov 2020 16:52:36 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.1713.004;
 Thu, 19 Nov 2020 16:52:36 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v2 10/13] drm/i915: Add support for enabling link status
 and recovery
Thread-Topic: [PATCH v2 10/13] drm/i915: Add support for enabling link status
 and recovery
Thread-Index: AQHWsDe9BMe73e0bU0eAlktMKCowQqnPbA4g
Date: Thu, 19 Nov 2020 11:22:36 +0000
Message-ID: <33bee5c0316a4a299451ae4ab76cea5e@intel.com>
References: <20201101100657.12087-1-ankit.k.nautiyal@intel.com>
 <20201101100657.12087-11-ankit.k.nautiyal@intel.com>
In-Reply-To: <20201101100657.12087-11-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.223.10.1]
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
Cc: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Sharma, 
 Swati2" <swati2.sharma@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTmF1dGl5YWwsIEFua2l0
IEsgPGFua2l0LmsubmF1dGl5YWxAaW50ZWwuY29tPg0KPiBTZW50OiBTdW5kYXksIE5vdmVtYmVy
IDEsIDIwMjAgMzozNyBQTQ0KPiBUbzogaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
PiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgU2hhbmthciwgVW1hIDx1bWEu
c2hhbmthckBpbnRlbC5jb20+Ow0KPiBLdWxrYXJuaSwgVmFuZGl0YSA8dmFuZGl0YS5rdWxrYXJu
aUBpbnRlbC5jb20+OyB2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbTsNCj4gU2hhcm1hLCBT
d2F0aTIgPHN3YXRpMi5zaGFybWFAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjIgMTAv
MTNdIGRybS9pOTE1OiBBZGQgc3VwcG9ydCBmb3IgZW5hYmxpbmcgbGluayBzdGF0dXMgYW5kDQo+
IHJlY292ZXJ5DQo+IA0KPiBGcm9tOiBTd2F0aSBTaGFybWEgPHN3YXRpMi5zaGFybWFAaW50ZWwu
Y29tPg0KPiANCj4gSW4gdGhpcyBwYXRjaCBlbmFibGVzIHN1cHBvcnQgZm9yIGRldGVjdGluZyBs
aW5rIGZhaWx1cmVzIGJldHdlZW4gUENPTiBhbmQgSERNSQ0KPiBzaW5rIGluIGk5MTUgZHJpdmVy
LiBIRE1JIGxpbmsgbG9zcyBpbmRpY2F0aW9uIHRvIHVwc3RyZWFtIERQIHNvdXJjZSBpcyBpbmRp
Y2F0ZWQNCj4gdmlhIElSUV9IUEQuIFRoaXMgaXMgZm9sbG93ZWQgYnkgcmVhZGluZyBvZiBIRE1J
IGxpbmsgY29uZmlndXJhdGlvbiBzdGF0dXMNCj4gKEhETUlfVFhfTElOS19BQ1RJVkVfU1RBVFVT
KS4NCj4gSWYgdGhlIFBDT04g4oaSIEhETUkgMi4xIGxpbmsgc3RhdHVzIGlzIG9mZjsgcmVpbml0
aWF0ZSBmcmwgbGluayB0cmFpbmluZyB0byByZWNvdmVyLg0KPiBBbHNvLCByZXBvcnQgSERNSSBG
UkwgbGluayBlcnJvciBjb3VudCByYW5nZSBmb3IgZWFjaCBpbmRpdmlkdWFsIEZSTCBhY3RpdmUg
bGFuZSBpcw0KPiBpbmRpY2F0ZWQgYnkgRE9XTlNUUkVBTV9IRE1JX0VSUk9SX1NUQVRVU19MTiBy
ZWdpc3RlcnMuDQo+IA0KPiB2MjogQ2hlY2tlZCBmb3IgZHBjZCByZWFkIGFuZCB3cml0ZSBmYWls
dXJlcyBhbmQgYWRkZWQgZGVidWcgbWVzc2FnZS4NCj4gKFVtYSBTaGFua2FyKQ0KDQpSZXZpZXdl
ZC1ieTogVW1hIFNoYW5rYXIgPHVtYS5zaGFua2FyQGludGVsLmNvbT4NCg0KPiBTaWduZWQtb2Zm
LWJ5OiBTd2F0aSBTaGFybWEgPHN3YXRpMi5zaGFybWFAaW50ZWwuY29tPg0KPiBTaWduZWQtb2Zm
LWJ5OiBBbmtpdCBOYXV0aXlhbCA8YW5raXQuay5uYXV0aXlhbEBpbnRlbC5jb20+DQo+IC0tLQ0K
PiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jIHwgNTYgKysrKysrKysr
KysrKysrKysrKysrKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDUzIGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9kcC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9k
cC5jDQo+IGluZGV4IDkwNDdiNjIwYzBkMC4uNjE3NzE2OWM0NDAxIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jDQo+IEBAIC01OTMyLDYgKzU5MzIsMzEgQEAg
aW50ZWxfZHBfY2hlY2tfbXN0X3N0YXR1cyhzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwKQ0KPiAg
CXJldHVybiBsaW5rX29rOw0KPiAgfQ0KPiANCj4gK3N0YXRpYyB2b2lkDQo+ICtpbnRlbF9kcF9o
YW5kbGVfaGRtaV9saW5rX3N0YXR1c19jaGFuZ2Uoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCkg
ew0KPiArCWJvb2wgaXNfYWN0aXZlOw0KPiArCXU4IGJ1ZiA9IDA7DQo+ICsNCj4gKwlpc19hY3Rp
dmUgPSBkcm1fZHBfcGNvbl9oZG1pX2xpbmtfYWN0aXZlKCZpbnRlbF9kcC0+YXV4KTsNCj4gKwlp
ZiAoaW50ZWxfZHAtPmZybC5pc190cmFpbmVkICYmICFpc19hY3RpdmUpIHsNCj4gKwkJaWYgKGRy
bV9kcF9kcGNkX3JlYWRiKCZpbnRlbF9kcC0+YXV4LA0KPiBEUF9QQ09OX0hETUlfTElOS19DT05G
SUdfMSwgJmJ1ZikgPCAwKQ0KPiArCQkJcmV0dXJuOw0KPiArDQo+ICsJCWJ1ZiAmPSAgfkRQX1BD
T05fRU5BQkxFX0hETUlfTElOSzsNCj4gKwkJaWYgKGRybV9kcF9kcGNkX3dyaXRlYigmaW50ZWxf
ZHAtPmF1eCwNCj4gRFBfUENPTl9IRE1JX0xJTktfQ09ORklHXzEsIGJ1ZikgPCAwKQ0KPiArCQkJ
cmV0dXJuOw0KPiArDQo+ICsJCWRybV9kcF9wY29uX2hkbWlfZnJsX2xpbmtfZXJyb3JfY291bnQo
JmludGVsX2RwLT5hdXgsDQo+ICsmaW50ZWxfZHAtPmF0dGFjaGVkX2Nvbm5lY3Rvci0+YmFzZSk7
DQo+ICsNCj4gKwkJaW50ZWxfZHAtPmZybC5pc190cmFpbmVkID0gZmFsc2U7DQo+ICsJCWludGVs
X2RwLT5mcmwudHJhaW5lZF9yYXRlX2dicHMgPSAwOw0KPiArDQo+ICsJCS8qIFJlc3RhcnQgRlJM
IHRyYWluaW5nIG9yIGZhbGwgYmFjayB0byBUTURTIG1vZGUgKi8NCj4gKwkJaW50ZWxfZHBfY2hl
Y2tfZnJsX3RyYWluaW5nKGludGVsX2RwKTsNCj4gKwl9DQo+ICt9DQo+ICsNCj4gIHN0YXRpYyBi
b29sDQo+ICBpbnRlbF9kcF9uZWVkc19saW5rX3JldHJhaW4oc3RydWN0IGludGVsX2RwICppbnRl
bF9kcCkgIHsgQEAgLTYyOTcsNyArNjMyMiw3DQo+IEBAIGludGVsX2RwX2hvdHBsdWcoc3RydWN0
IGludGVsX2VuY29kZXIgKmVuY29kZXIsDQo+ICAJcmV0dXJuIHN0YXRlOw0KPiAgfQ0KPiANCj4g
LXN0YXRpYyB2b2lkIGludGVsX2RwX2NoZWNrX3NlcnZpY2VfaXJxKHN0cnVjdCBpbnRlbF9kcCAq
aW50ZWxfZHApDQo+ICtzdGF0aWMgdm9pZCBpbnRlbF9kcF9jaGVja19kZXZpY2Vfc2VydmljZV9p
cnEoc3RydWN0IGludGVsX2RwDQo+ICsqaW50ZWxfZHApDQo+ICB7DQo+ICAJc3RydWN0IGRybV9p
OTE1X3ByaXZhdGUgKmk5MTUgPSBkcF90b19pOTE1KGludGVsX2RwKTsNCj4gIAl1OCB2YWw7DQo+
IEBAIC02MzIxLDYgKzYzNDYsMzAgQEAgc3RhdGljIHZvaWQgaW50ZWxfZHBfY2hlY2tfc2Vydmlj
ZV9pcnEoc3RydWN0IGludGVsX2RwDQo+ICppbnRlbF9kcCkNCj4gIAkJZHJtX2RiZ19rbXMoJmk5
MTUtPmRybSwgIlNpbmsgc3BlY2lmaWMgaXJxIHVuaGFuZGxlZFxuIik7ICB9DQo+IA0KPiArc3Rh
dGljIHZvaWQgaW50ZWxfZHBfY2hlY2tfbGlua19zZXJ2aWNlX2lycShzdHJ1Y3QgaW50ZWxfZHAg
KmludGVsX2RwKQ0KPiArew0KPiArCXN0cnVjdCBkcm1faTkxNV9wcml2YXRlICppOTE1ID0gZHBf
dG9faTkxNShpbnRlbF9kcCk7DQo+ICsJdTggdmFsOw0KPiArDQo+ICsJaWYgKGludGVsX2RwLT5k
cGNkW0RQX0RQQ0RfUkVWXSA8IDB4MTEpDQo+ICsJCXJldHVybjsNCj4gKw0KPiArCWlmIChkcm1f
ZHBfZHBjZF9yZWFkYigmaW50ZWxfZHAtPmF1eCwNCj4gKwkJCSAgICAgIERQX0xJTktfU0VSVklD
RV9JUlFfVkVDVE9SX0VTSTAsICZ2YWwpICE9IDEgfHwNCj4gIXZhbCkgew0KPiArCQlkcm1fZGJn
X2ttcygmaTkxNS0+ZHJtLCAiRXJyb3IgaW4gcmVhZGluZyBsaW5rIHNlcnZpY2UgaXJxDQo+IHZl
Y3RvclxuIik7DQo+ICsJCXJldHVybjsNCj4gKwl9DQo+ICsNCj4gKwlpZiAoZHJtX2RwX2RwY2Rf
d3JpdGViKCZpbnRlbF9kcC0+YXV4LA0KPiArCQkJICAgICAgIERQX0xJTktfU0VSVklDRV9JUlFf
VkVDVE9SX0VTSTAsIHZhbCkgIT0gMSkgew0KPiArCQlkcm1fZGJnX2ttcygmaTkxNS0+ZHJtLCAi
RXJyb3IgaW4gd3JpdGluZyBsaW5rIHNlcnZpY2UgaXJxDQo+IHZlY3RvclxuIik7DQo+ICsJCXJl
dHVybjsNCj4gKwl9DQo+ICsNCj4gKwlpZiAodmFsICYgSERNSV9MSU5LX1NUQVRVU19DSEFOR0VE
KQ0KPiArCQlpbnRlbF9kcF9oYW5kbGVfaGRtaV9saW5rX3N0YXR1c19jaGFuZ2UoaW50ZWxfZHAp
Ow0KPiArfQ0KPiArDQo+ICAvKg0KPiAgICogQWNjb3JkaW5nIHRvIERQIHNwZWMNCj4gICAqIDUu
MS4yOg0KPiBAQCAtNjM2MCw3ICs2NDA5LDggQEAgaW50ZWxfZHBfc2hvcnRfcHVsc2Uoc3RydWN0
IGludGVsX2RwICppbnRlbF9kcCkNCj4gIAkJcmV0dXJuIGZhbHNlOw0KPiAgCX0NCj4gDQo+IC0J
aW50ZWxfZHBfY2hlY2tfc2VydmljZV9pcnEoaW50ZWxfZHApOw0KPiArCWludGVsX2RwX2NoZWNr
X2RldmljZV9zZXJ2aWNlX2lycShpbnRlbF9kcCk7DQo+ICsJaW50ZWxfZHBfY2hlY2tfbGlua19z
ZXJ2aWNlX2lycShpbnRlbF9kcCk7DQo+IA0KPiAgCS8qIEhhbmRsZSBDRUMgaW50ZXJydXB0cywg
aWYgYW55ICovDQo+ICAJZHJtX2RwX2NlY19pcnEoJmludGVsX2RwLT5hdXgpOw0KPiBAQCAtNjc5
NCw3ICs2ODQ0LDcgQEAgaW50ZWxfZHBfZGV0ZWN0KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25u
ZWN0b3IsDQo+ICAJICAgIHRvX2ludGVsX2Nvbm5lY3Rvcihjb25uZWN0b3IpLT5kZXRlY3RfZWRp
ZCkNCj4gIAkJc3RhdHVzID0gY29ubmVjdG9yX3N0YXR1c19jb25uZWN0ZWQ7DQo+IA0KPiAtCWlu
dGVsX2RwX2NoZWNrX3NlcnZpY2VfaXJxKGludGVsX2RwKTsNCj4gKwlpbnRlbF9kcF9jaGVja19k
ZXZpY2Vfc2VydmljZV9pcnEoaW50ZWxfZHApOw0KPiANCj4gIG91dDoNCj4gIAlpZiAoc3RhdHVz
ICE9IGNvbm5lY3Rvcl9zdGF0dXNfY29ubmVjdGVkICYmICFpbnRlbF9kcC0+aXNfbXN0KQ0KPiAt
LQ0KPiAyLjE3LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
