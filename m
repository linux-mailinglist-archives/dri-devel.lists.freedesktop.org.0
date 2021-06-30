Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 634843B815A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 13:36:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3D7B6E0F2;
	Wed, 30 Jun 2021 11:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54A46E0F2;
 Wed, 30 Jun 2021 11:36:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10030"; a="205323835"
X-IronPort-AV: E=Sophos;i="5.83,311,1616482800"; d="scan'208";a="205323835"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2021 04:36:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,311,1616482800"; d="scan'208";a="558269236"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga004.jf.intel.com with ESMTP; 30 Jun 2021 04:36:15 -0700
Received: from bgsmsx603.gar.corp.intel.com (10.109.78.82) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 30 Jun 2021 04:36:14 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX603.gar.corp.intel.com (10.109.78.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 30 Jun 2021 17:06:12 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.2242.008;
 Wed, 30 Jun 2021 17:06:12 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Harry Wentland <harry.wentland@amd.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 04/21] drm/i915/xelpd: Define Degamma Lut range struct for
 HDR planes
Thread-Topic: [PATCH 04/21] drm/i915/xelpd: Define Degamma Lut range struct
 for HDR planes
Thread-Index: AQHXVs8kUUeAmGLzREqUBbFHfmv9YqspVtkAgAM8z2A=
Date: Wed, 30 Jun 2021 11:36:11 +0000
Message-ID: <bce1077600544c3d93ee045ddf9b9bfd@intel.com>
References: <20210601105218.29185-1-uma.shankar@intel.com>
 <20210601105218.29185-5-uma.shankar@intel.com>
 <cac45158-a7b9-c92e-eaf6-1067c29497e5@amd.com>
In-Reply-To: <cac45158-a7b9-c92e-eaf6-1067c29497e5@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.22.254.132]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
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
Cc: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogZHJpLWRldmVsIDxkcmkt
ZGV2ZWwtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBIYXJyeQ0K
PiBXZW50bGFuZA0KPiBTZW50OiBNb25kYXksIEp1bmUgMjgsIDIwMjEgODo0NSBQTQ0KPiBUbzog
U2hhbmthciwgVW1hIDx1bWEuc2hhbmthckBpbnRlbC5jb20+OyBpbnRlbC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnOyBkcmktDQo+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzog
TW9kZW0sIEJoYW51cHJha2FzaCA8YmhhbnVwcmFrYXNoLm1vZGVtQGludGVsLmNvbT4NCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCAwNC8yMV0gZHJtL2k5MTUveGVscGQ6IERlZmluZSBEZWdhbW1hIEx1
dCByYW5nZSBzdHJ1Y3QgZm9yDQo+IEhEUiBwbGFuZXMNCj4gDQo+IE9uIDIwMjEtMDYtMDEgNjo1
MiBhLm0uLCBVbWEgU2hhbmthciB3cm90ZToNCj4gPiBEZWZpbmUgdGhlIHN0cnVjdHVyZSB3aXRo
IFhFX0xQRCBkZWdhbW1hIGx1dCByYW5nZXMuIEhEUiBhbmQgU0RSDQo+ID4gcGxhbmVzIGhhdmUg
ZGlmZmVyZW50IGNhcGFiaWxpdGllcywgaW1wbGVtZW50ZWQgcmVzcGVjdGl2ZSBzdHJ1Y3R1cmUN
Cj4gPiBmb3IgdGhlIEhEUiBwbGFuZXMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBVbWEgU2hh
bmthciA8dW1hLnNoYW5rYXJAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2NvbG9yLmMgfCA1Mg0KPiA+ICsrKysrKysrKysrKysrKysr
KysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2NvbG9yLmMNCj4g
PiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY29sb3IuYw0KPiA+IGluZGV4
IGRhYjg5MmQyMjUxYi4uYzczNWQwNmE2YjU0IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY29sb3IuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfY29sb3IuYw0KPiA+IEBAIC0yMDkzLDYgKzIwOTMsNTggQEAg
c3RhdGljIHZvaWQgaWNsX3JlYWRfbHV0cyhzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZQ0KPiAqY3J0
Y19zdGF0ZSkNCj4gPiAgCX0NCj4gPiAgfQ0KPiA+DQo+ID4gKyAvKiBGSVhNRSBpbnB1dCBicGM/
ICovDQo+ID4gK19fbWF5YmVfdW51c2VkDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Nv
bG9yX2x1dF9yYW5nZSBkMTNfZGVnYW1tYV9oZHJbXSA9IHsNCj4gPiArCS8qIHNlZ21lbnQgMSAq
Lw0KPiA+ICsJew0KPiA+ICsJCS5mbGFncyA9IChEUk1fTU9ERV9MVVRfR0FNTUEgfA0KPiANCj4g
V2h5IGFyZSB0aGVzZSB1c2luZyBEUk1fTU9ERV9MVVRfR0FNTUEgYW5kIG5vdA0KPiBEUk1fTU9E
RV9MVVRfREVHQU1NQSB3aGVuIHRoZSBsdXRfdHlwZSBmb3IgdGhpcyBMVVQgaXMNCj4gTFVUX1RZ
UEVfREVHQU1NQT8NCg0KVGhhbmtzIEhhcnJ5IGZvciB0aGUgY29tbWVudHMuDQoNClllYWggdGhp
cyBpcyBhbiBvdmVyc2lnaHQsIHdpbGwgZml4IHRoaXMuDQo+IA0KPiANCj4gPiArCQkJICBEUk1f
TU9ERV9MVVRfUkVGTEVDVF9ORUdBVElWRSB8DQo+ID4gKwkJCSAgRFJNX01PREVfTFVUX0lOVEVS
UE9MQVRFIHwNCj4gPiArCQkJICBEUk1fTU9ERV9MVVRfTk9OX0RFQ1JFQVNJTkcpLA0KPiA+ICsJ
CS5jb3VudCA9IDEyOCwNCj4gPiArCQkuaW5wdXRfYnBjID0gMjQsIC5vdXRwdXRfYnBjID0gMTYs
DQo+IA0KPiBXaHkgZG8gd2UgbmVlZCBtb3JlIHRoYW4gMTYgYnBjIGZvciBMVVQ/IEZQMTYgaXMg
ZW5vdWdoIHRvIHJlcHJlc2VudCBIRFIgaW4NCj4gbGluZWFyIHNwYWNlLiBXb3VsZG4ndCAxNiBi
cGMgYmUgZW5vdWdoPw0KDQpQaXBlIHNvbWV0aW1lcyB3b3JrcyBpbnRlcm5hbGx5IG9uIGhpZ2hl
ciBwcmVjaXNpb24gKGp1c3QgdG8gdGFrZSBjYXJlIG9mIHJvdW5kaW5nIGV0Yy4pLCBsYXRlciB0
aGUNCmV4dHJhIGRhdGEgZ2V0cyBkcm9wcGVkIGF0IHRoZSBlbmQgb2YgdGhlIHBpcGUuIFNvIGZy
b20gc291cmNlIHNpZGUgeW91IGFyZSByaWdodCwgMTZicGMgaXMgZW5vdWdoDQpidXQgdGhlIGx1
dCBwcmVjaXNpb24gY2FuIGdvIGhpZ2hlci4NCg0KPiANCj4gPiArCQkuc3RhcnQgPSAwLCAuZW5k
ID0gKDEgPDwgMjQpIC0gMSwNCj4gPiArCQkubWluID0gMCwgLm1heCA9ICgxIDw8IDI0KSAtIDEs
DQo+ID4gKwl9LA0KPiA+ICsJLyogc2VnbWVudCAyICovDQo+ID4gKwl7DQo+ID4gKwkJLmZsYWdz
ID0gKERSTV9NT0RFX0xVVF9HQU1NQSB8DQo+ID4gKwkJCSAgRFJNX01PREVfTFVUX1JFRkxFQ1Rf
TkVHQVRJVkUgfA0KPiA+ICsJCQkgIERSTV9NT0RFX0xVVF9JTlRFUlBPTEFURSB8DQo+ID4gKwkJ
CSAgRFJNX01PREVfTFVUX1JFVVNFX0xBU1QgfA0KPiA+ICsJCQkgIERSTV9NT0RFX0xVVF9OT05f
REVDUkVBU0lORyksDQo+ID4gKwkJLmNvdW50ID0gMSwNCj4gPiArCQkuaW5wdXRfYnBjID0gMjQs
IC5vdXRwdXRfYnBjID0gMTYsDQo+ID4gKwkJLnN0YXJ0ID0gKDEgPDwgMjQpIC0gMSwgLmVuZCA9
IDEgPDwgMjQsDQo+ID4gKwkJLm1pbiA9IDAsIC5tYXggPSAoMSA8PCAyNykgLSAxLA0KPiANCj4g
SG93IGNhbiBtYXggYmUgMSA8PCAyNyBpZiBpbnB1dF9icGMgaXMgMjQ/DQoNClRoaXMgaXMgdG8g
dGFrZSBjYXJlIG9mID4gMS4wIHNlY3Rpb24uIDEuMCB0byAzLjAgYW5kIDMuMCB0byA3LjAuDQpT
byB3ZSBoYXZlIDMuMjQgZm9ybWF0IGZvciBMdXQgdG8gdGFrZSBjYXJlIG9mIHRoaXMuIA0KDQpB
bHNvLCBJIGhhdmUgYW4gYWN0aW9uIHRvIHVwZGF0ZSB0aGUgc2VyaWVzIHdpdGggVUFQSSBkb2Mg
YW5kIG5ldyBuYW1pbmcgZm9yIHRoZSBwcm9wZXJ0eS4NCk15IGFwb2xvZ2llcyBmb3IgYmVpbmcg
bGF0ZSBvbiB0aGF0IG9uZS4gV2lsbCB1cGRhdGUgYW5kIHNlbmQgdGhhdCBvdXQgc29vbi4NCg0K
VGhhbmtzICYgUmVnYXJkcywNClVtYSBTaGFua2FyDQo+IA0KPiBIYXJyeQ0KPiANCj4gPiArCX0s
DQo+ID4gKwkvKiBTZWdtZW50IDMgKi8NCj4gPiArCXsNCj4gPiArCQkuZmxhZ3MgPSAoRFJNX01P
REVfTFVUX0dBTU1BIHwNCj4gPiArCQkJICBEUk1fTU9ERV9MVVRfUkVGTEVDVF9ORUdBVElWRSB8
DQo+ID4gKwkJCSAgRFJNX01PREVfTFVUX0lOVEVSUE9MQVRFIHwNCj4gPiArCQkJICBEUk1fTU9E
RV9MVVRfUkVVU0VfTEFTVCB8DQo+ID4gKwkJCSAgRFJNX01PREVfTFVUX05PTl9ERUNSRUFTSU5H
KSwNCj4gPiArCQkuY291bnQgPSAxLA0KPiA+ICsJCS5pbnB1dF9icGMgPSAyNCwgLm91dHB1dF9i
cGMgPSAxNiwNCj4gPiArCQkuc3RhcnQgPSAxIDw8IDI0LCAuZW5kID0gMyA8PCAyNCwNCj4gPiAr
CQkubWluID0gMCwgLm1heCA9ICgxIDw8IDI3KSAtIDEsDQo+ID4gKwl9LA0KPiA+ICsJLyogU2Vn
bWVudCA0ICovDQo+ID4gKwl7DQo+ID4gKwkJLmZsYWdzID0gKERSTV9NT0RFX0xVVF9HQU1NQSB8
DQo+ID4gKwkJCSAgRFJNX01PREVfTFVUX1JFRkxFQ1RfTkVHQVRJVkUgfA0KPiA+ICsJCQkgIERS
TV9NT0RFX0xVVF9JTlRFUlBPTEFURSB8DQo+ID4gKwkJCSAgRFJNX01PREVfTFVUX1JFVVNFX0xB
U1QgfA0KPiA+ICsJCQkgIERSTV9NT0RFX0xVVF9OT05fREVDUkVBU0lORyksDQo+ID4gKwkJLmNv
dW50ID0gMSwNCj4gPiArCQkuaW5wdXRfYnBjID0gMjQsIC5vdXRwdXRfYnBjID0gMTYsDQo+ID4g
KwkJLnN0YXJ0ID0gMyA8PCAyNCwgLmVuZCA9IDcgPDwgMjQsDQo+ID4gKwkJLm1pbiA9IDAsIC5t
YXggPSAoMSA8PCAyNykgLSAxLA0KPiA+ICsJfSwNCj4gPiArfTsNCj4gPiArDQo+ID4gIHZvaWQg
aW50ZWxfY29sb3JfaW5pdChzdHJ1Y3QgaW50ZWxfY3J0YyAqY3J0YykNCj4gPiAgew0KPiA+ICAJ
c3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2ID0gdG9faTkxNShjcnRjLT5iYXNlLmRl
dik7DQo+ID4NCg0K
