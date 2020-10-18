Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57012292083
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 00:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B4E6E8C4;
	Sun, 18 Oct 2020 22:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E94326E8C4;
 Sun, 18 Oct 2020 22:49:04 +0000 (UTC)
IronPort-SDR: ie27hV3k6xcrZP4o2fzuxO8X0hN90ZZY2wZ+SRkYfMhVY1oFdjGAWLPyad8yioTfAr3bA/hWUa
 RT7EAseaEh0Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9778"; a="153876965"
X-IronPort-AV: E=Sophos;i="5.77,392,1596524400"; d="scan'208";a="153876965"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2020 15:49:03 -0700
IronPort-SDR: QvTXn5pyLB4ADzYKDR/4vDbh0JUby0Mj/41Gbsdb+Dz4dD5CEusdhD7ODXA/xjwd8Q9MiaD1gP
 u27goeJvAPKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,392,1596524400"; d="scan'208";a="522906227"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga005.fm.intel.com with ESMTP; 18 Oct 2020 15:49:03 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 18 Oct 2020 15:49:02 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX604.gar.corp.intel.com (10.67.234.6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 19 Oct 2020 04:19:00 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.1713.004;
 Mon, 19 Oct 2020 04:19:00 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [RFC 08/13] drm/i915: Add support for enabling link status and
 recovery
Thread-Topic: [RFC 08/13] drm/i915: Add support for enabling link status and
 recovery
Thread-Index: AQHWouJf07tP3E8UREmZ8psX5XyXzKmd+fBA
Date: Sun, 18 Oct 2020 22:49:00 +0000
Message-ID: <7de8d75aab0e42cf9fba4e7945304b5e@intel.com>
References: <20201015105259.27934-1-ankit.k.nautiyal@intel.com>
 <20201015105259.27934-9-ankit.k.nautiyal@intel.com>
In-Reply-To: <20201015105259.27934-9-ankit.k.nautiyal@intel.com>
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
IEsgPGFua2l0LmsubmF1dGl5YWxAaW50ZWwuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgT2N0b2Jl
ciAxNSwgMjAyMCA0OjIzIFBNDQo+IFRvOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
DQo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBTaGFua2FyLCBVbWEgPHVt
YS5zaGFua2FyQGludGVsLmNvbT47DQo+IEt1bGthcm5pLCBWYW5kaXRhIDx2YW5kaXRhLmt1bGth
cm5pQGludGVsLmNvbT47IHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tOw0KPiBTaGFybWEs
IFN3YXRpMiA8c3dhdGkyLnNoYXJtYUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtSRkMgMDgvMTNd
IGRybS9pOTE1OiBBZGQgc3VwcG9ydCBmb3IgZW5hYmxpbmcgbGluayBzdGF0dXMgYW5kIHJlY292
ZXJ5DQo+IA0KPiBGcm9tOiBTd2F0aSBTaGFybWEgPHN3YXRpMi5zaGFybWFAaW50ZWwuY29tPg0K
PiANCj4gSW4gdGhpcyBwYXRjaCBlbmFibGVkIHN1cHBvcnQgZm9yIGxpbmsgc3RhdHVzIGFuZCBy
ZWNvdmVyeSBpbiBpOTE1IGRyaXZlci4gSERNSQ0KPiBsaW5rIGxvc3MgaW5kaWNhdGlvbiB0byB1
cHN0cmVhbSBEUCBzb3VyY2UgaXMgaW5kaWNhdGVkIHZpYSBJUlFfSFBELiBUaGlzIGlzDQo+IGZv
bGxvd2VkIGJ5IHJlYWRpbmcgb2YgSERNSSBsaW5rIGNvbmZpZ3VyYXRpb24gc3RhdHVzDQo+IChI
RE1JX1RYX0xJTktfQUNUSVZFX1NUQVRVUykuIElmIHRoZSBQQ09OIOKGkiBIRE1JIDIuMSBsaW5r
IHN0YXR1cyBpcyBvZmY7DQo+IHJlaW5pdGlhdGUgZnJsIGxpbmsgdHJhaW5pbmcgdG8gcmVjb3Zl
ci4NCj4gQWxzbywgSERNSSBGUkwgbGluayBlcnJvciBjb3VudCByYW5nZSBmb3IgZWFjaCBpbmRp
dmlkdWFsIEZSTCBhY3RpdmUgbGFuZSBpcw0KPiBpbmRpY2F0ZWQgYnkgRE9XTlNUUkVBTV9IRE1J
X0VSUk9SX1NUQVRVU19MTiByZWdpc3RlcnMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTd2F0aSBT
aGFybWEgPHN3YXRpMi5zaGFybWFAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbmtpdCBO
YXV0aXlhbCA8YW5raXQuay5uYXV0aXlhbEBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jIHwgNDcgKysrKysrKysrKysrKysrKysrKysr
KystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9k
cC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jDQo+IGluZGV4
IDY2ODE2NWRkMmIxYS4uZTZjNGNiODQ0ZTM3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kcC5jDQo+IEBAIC01OTU1LDYgKzU5NTUsMjkgQEAgaW50ZWxfZHBfY2hl
Y2tfbXN0X3N0YXR1cyhzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwKQ0KPiAgCXJldHVybiBsaW5r
X29rOw0KPiAgfQ0KPiANCj4gK3N0YXRpYyB2b2lkDQo+ICtpbnRlbF9kcF9oYW5kbGVfaGRtaV9s
aW5rX3N0YXR1c19jaGFuZ2Uoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCkgew0KPiArCWJvb2wg
aXNfYWN0aXZlOw0KPiArCXU4IGJ1ZiA9IDA7DQo+ICsNCj4gKwlpc19hY3RpdmUgPSBkcm1fZHBf
cGNvbl9oZG1pX2xpbmtfYWN0aXZlKCZpbnRlbF9kcC0+YXV4KTsNCj4gKwlpZiAoaW50ZWxfZHAt
PmZybC5pc190cmFpbmVkICYmICFpc19hY3RpdmUpIHsNCj4gKwkJaWYgKGRybV9kcF9kcGNkX3Jl
YWRiKCZpbnRlbF9kcC0+YXV4LA0KPiBEUF9QQ09OX0hETUlfTElOS19DT05GSUdfMSwgJmJ1Zikg
PCAwKQ0KPiArCQkJcmV0dXJuOw0KPiArDQo+ICsJCWJ1ZiAmPSAgfkRQX1BDT05fRU5BQkxFX0hE
TUlfTElOSzsNCj4gKwkJaWYgKGRybV9kcF9kcGNkX3dyaXRlYigmaW50ZWxfZHAtPmF1eCwNCj4g
RFBfUENPTl9IRE1JX0xJTktfQ09ORklHXzEsIGJ1ZikgPCAwKQ0KPiArCQkJcmV0dXJuOw0KPiAr
DQo+ICsJCWludGVsX2RwLT5mcmwuaXNfdHJhaW5lZCA9IGZhbHNlOw0KPiArCQlpbnRlbF9kcC0+
ZnJsLnRyYWluZWRfcmF0ZV9nYnBzID0gMDsNCj4gKw0KPiArCQlpbnRlbF9kcF9jaGVja19mcmxf
dHJhaW5pbmcoaW50ZWxfZHApOw0KPiArCQlkcm1fZHBfcGNvbl9oZG1pX2ZybF9saW5rX2Vycm9y
X2NvdW50KCZpbnRlbF9kcC0+YXV4LA0KPiAmaW50ZWxfZHAtPmF0dGFjaGVkX2Nvbm5lY3Rvci0+
YmFzZSk7DQoNCkp1c3QgcHJpbnRpbmcgdGhlIGVycm9yIGhlcmUgbWF5IG5vdCBoZWxwIGluIHJl
Y292ZXJ5LiBJZiBGUkwgaXMgZmFpbGluZyBtYXkgYmUgYSBUTURTIGZhbGxiYWNrIHNob3VsZCBi
ZQ0KYXR0ZW1wdGVkLiBBbHNvIGVycm9yIGNvdW50IHNob3VsZCBiZSByZXR1cm5lZCBpbnN0ZWFk
IG9mIGp1c3QgYSBwcmludC4NCg0KPiArCX0NCj4gK30NCj4gKw0KPiAgc3RhdGljIGJvb2wNCj4g
IGludGVsX2RwX25lZWRzX2xpbmtfcmV0cmFpbihzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwKSAg
eyBAQCAtNjMyMCw3ICs2MzQzLDcNCj4gQEAgaW50ZWxfZHBfaG90cGx1ZyhzdHJ1Y3QgaW50ZWxf
ZW5jb2RlciAqZW5jb2RlciwNCj4gIAlyZXR1cm4gc3RhdGU7DQo+ICB9DQo+IA0KPiAtc3RhdGlj
IHZvaWQgaW50ZWxfZHBfY2hlY2tfc2VydmljZV9pcnEoc3RydWN0IGludGVsX2RwICppbnRlbF9k
cCkNCj4gK3N0YXRpYyB2b2lkIGludGVsX2RwX2NoZWNrX2RldmljZV9zZXJ2aWNlX2lycShzdHJ1
Y3QgaW50ZWxfZHANCj4gKyppbnRlbF9kcCkNCj4gIHsNCj4gIAlzdHJ1Y3QgZHJtX2k5MTVfcHJp
dmF0ZSAqaTkxNSA9IGRwX3RvX2k5MTUoaW50ZWxfZHApOw0KPiAgCXU4IHZhbDsNCj4gQEAgLTYz
NDQsNiArNjM2NywyMyBAQCBzdGF0aWMgdm9pZCBpbnRlbF9kcF9jaGVja19zZXJ2aWNlX2lycShz
dHJ1Y3QgaW50ZWxfZHANCj4gKmludGVsX2RwKQ0KPiAgCQlkcm1fZGJnX2ttcygmaTkxNS0+ZHJt
LCAiU2luayBzcGVjaWZpYyBpcnEgdW5oYW5kbGVkXG4iKTsgIH0NCj4gDQo+ICtzdGF0aWMgdm9p
ZCBpbnRlbF9kcF9jaGVja19saW5rX3NlcnZpY2VfaXJxKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxf
ZHApDQo+ICt7DQo+ICsJdTggdmFsOw0KPiArDQo+ICsJaWYgKGludGVsX2RwLT5kcGNkW0RQX0RQ
Q0RfUkVWXSA8IDB4MTEpDQo+ICsJCXJldHVybjsNCj4gKw0KPiArCWlmIChkcm1fZHBfZHBjZF9y
ZWFkYigmaW50ZWxfZHAtPmF1eCwNCj4gKwkJCSAgICAgIERQX0xJTktfU0VSVklDRV9JUlFfVkVD
VE9SX0VTSTAsICZ2YWwpICE9IDEgfHwNCj4gIXZhbCkNCg0KQW4gZXJyb3IgbWVzc2FnZSB3b3Vs
ZCBiZSBoYW5keSBoZXJlLg0KDQo+ICsJCXJldHVybjsNCj4gKw0KPiArCWRybV9kcF9kcGNkX3dy
aXRlYigmaW50ZWxfZHAtPmF1eCwNCj4gRFBfTElOS19TRVJWSUNFX0lSUV9WRUNUT1JfRVNJMCwN
Cj4gK3ZhbCk7DQoNCkNoZWNrIGZvciBlcnJvciBtZXNzYWdlIGhlcmUuDQoNCj4gKw0KPiArCWlm
ICh2YWwgJiBIRE1JX0xJTktfU1RBVFVTX0NIQU5HRUQpDQo+ICsJCWludGVsX2RwX2hhbmRsZV9o
ZG1pX2xpbmtfc3RhdHVzX2NoYW5nZShpbnRlbF9kcCk7DQo+ICt9DQo+ICsNCj4gIC8qDQo+ICAg
KiBBY2NvcmRpbmcgdG8gRFAgc3BlYw0KPiAgICogNS4xLjI6DQo+IEBAIC02MzgzLDcgKzY0MjMs
OCBAQCBpbnRlbF9kcF9zaG9ydF9wdWxzZShzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwKQ0KPiAg
CQlyZXR1cm4gZmFsc2U7DQo+ICAJfQ0KPiANCj4gLQlpbnRlbF9kcF9jaGVja19zZXJ2aWNlX2ly
cShpbnRlbF9kcCk7DQo+ICsJaW50ZWxfZHBfY2hlY2tfZGV2aWNlX3NlcnZpY2VfaXJxKGludGVs
X2RwKTsNCj4gKwlpbnRlbF9kcF9jaGVja19saW5rX3NlcnZpY2VfaXJxKGludGVsX2RwKTsNCj4g
DQo+ICAJLyogSGFuZGxlIENFQyBpbnRlcnJ1cHRzLCBpZiBhbnkgKi8NCj4gIAlkcm1fZHBfY2Vj
X2lycSgmaW50ZWxfZHAtPmF1eCk7DQo+IEBAIC02ODE1LDcgKzY4NTYsNyBAQCBpbnRlbF9kcF9k
ZXRlY3Qoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwNCj4gIAkgICAgdG9faW50ZWxf
Y29ubmVjdG9yKGNvbm5lY3RvciktPmRldGVjdF9lZGlkKQ0KPiAgCQlzdGF0dXMgPSBjb25uZWN0
b3Jfc3RhdHVzX2Nvbm5lY3RlZDsNCj4gDQo+IC0JaW50ZWxfZHBfY2hlY2tfc2VydmljZV9pcnEo
aW50ZWxfZHApOw0KPiArCWludGVsX2RwX2NoZWNrX2RldmljZV9zZXJ2aWNlX2lycShpbnRlbF9k
cCk7DQo+IA0KPiAgb3V0Og0KPiAgCWlmIChzdGF0dXMgIT0gY29ubmVjdG9yX3N0YXR1c19jb25u
ZWN0ZWQgJiYgIWludGVsX2RwLT5pc19tc3QpDQo+IC0tDQo+IDIuMTcuMQ0KDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
