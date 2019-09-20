Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2214B91A0
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 16:24:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 922726E049;
	Fri, 20 Sep 2019 14:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B46D6E049;
 Fri, 20 Sep 2019 14:24:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Sep 2019 07:24:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,528,1559545200"; d="scan'208";a="189949550"
Received: from irsmsx153.ger.corp.intel.com ([163.33.192.75])
 by orsmga003.jf.intel.com with ESMTP; 20 Sep 2019 07:24:33 -0700
Received: from irsmsx106.ger.corp.intel.com ([169.254.8.184]) by
 IRSMSX153.ger.corp.intel.com ([169.254.9.123]) with mapi id 14.03.0439.000;
 Fri, 20 Sep 2019 15:24:32 +0100
From: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 10/12] drm/i915: Document ILK+ pipe csc
 matrix better
Thread-Topic: [Intel-gfx] [PATCH 10/12] drm/i915: Document ILK+ pipe csc
 matrix better
Thread-Index: AQHVPXhS4oP84F03pUGJGV6t25OcD6c08oOA
Date: Fri, 20 Sep 2019 14:24:32 +0000
Message-ID: <d9b15be4584ac023148cffd199eda733583218bd.camel@intel.com>
References: <20190718145053.25808-1-ville.syrjala@linux.intel.com>
 <20190718145053.25808-11-ville.syrjala@linux.intel.com>
In-Reply-To: <20190718145053.25808-11-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.66.135]
Content-ID: <51F7BAE3B8A0C04FB987C30AF67D1D10@intel.com>
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
PiANCj4gQWRkIGNvbW1lbnRzIHRvIGV4cGxhaW4gdGhlIGlsayBwaXBlIGNzYyBvcGVyYXRpb24g
YSBiaXQgYmV0dGVyLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxs
ZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2NvbG9yLmMgfCAyNiArKysrKysrKysrKysrKysrKy0tLQ0KPiAtLQ0K
PiAgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jb2xvci5j
DQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jb2xvci5jDQo+IGluZGV4
IDIzYTg0ZGQ3OTg5Zi4uNzM2YzQyNzIwZGFmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2NvbG9yLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9jb2xvci5jDQo+IEBAIC00Miw2ICs0MiwyMSBAQA0KPiAgDQo+ICAj
ZGVmaW5lIExFR0FDWV9MVVRfTEVOR1RICQkyNTYNCj4gIA0KPiArLyoNCj4gKyAqIElMSysgY3Nj
IG1hdHJpeDoNCj4gKyAqDQo+ICsgKiB8Ui9DcnwgICB8IGMwIGMxIGMyIHwgICAoIHxSL0NyfCAg
IHxwcmVvZmYwfCApICAgfHBvc3RvZmYwfA0KPiArICogfEcvWSB8ID0gfCBjMyBjNCBjNSB8IHgg
KCB8Ry9ZIHwgKyB8cHJlb2ZmMXwgKSArIHxwb3N0b2ZmMXwNCj4gKyAqIHxCL0NifCAgIHwgYzYg
YzcgYzggfCAgICggfEIvQ2J8ICAgfHByZW9mZjJ8ICkgICB8cG9zdG9mZjJ8DQo+ICsgKg0KPiAr
ICogSUxLL1NOQiBkb24ndCBoYXZlIGV4cGxpY2l0IHBvc3Qgb2Zmc2V0cywgYW5kIGluc3RlYWQN
Cj4gKyAqIENTQ19NT0RFX1lVVl9UT19SR0IgYW5kIENTQ19CTEFDS19TQ1JFRU5fT0ZGU0VUIGFy
ZSB1c2VkOg0KPiArICogIENTQ19NT0RFX1lVVl9UT19SR0I9MCArIENTQ19CTEFDS19TQ1JFRU5f
T0ZGU0VUPTAgLT4gMS8yLCAwLCAxLzINCj4gKyAqICBDU0NfTU9ERV9ZVVZfVE9fUkdCPTAgKyBD
U0NfQkxBQ0tfU0NSRUVOX09GRlNFVD0xIC0+IDEvMiwgMS8xNiwNCj4gMS8yDQpJdCBzZWVtcyB0
aGF0IHRoZSBjYWxjdWxhdGVkIHZhbHVlcyBhcmUgYXNzdW1lcyBJVFUtUiBCVC43MDkgc3BlYywN
CmlmIHlvdSBkb24ndCBtaW5kLCBjYW4gd2UgYWRkIHNvbWUgY29tbWVudHMgd2hpY2ggaXMgYmFz
ZWQgb24gSVRVLVINCkJULjcwOT8NCj4gKyAqICBDU0NfTU9ERV9ZVVZfVE9fUkdCPTEgKyBDU0Nf
QkxBQ0tfU0NSRUVOX09GRlNFVD0wIC0+IDAsIDAsIDANCj4gKyAqICBDU0NfTU9ERV9ZVVZfVE9f
UkdCPTEgKyBDU0NfQkxBQ0tfU0NSRUVOX09GRlNFVD0xIC0+IDEvMTYsIDEvMTYsDQo+IDEvMTYN
Cj4gKyAqLw0KPiArDQo+ICAvKg0KPiAgICogRXh0cmFjdCB0aGUgQ1NDIGNvZWZmaWNpZW50IGZy
b20gYSBDVE0gY29lZmZpY2llbnQgKGluIFUzMi4zMg0KPiBmaXhlZCBwb2ludA0KPiAgICogZm9y
bWF0KS4gVGhpcyBtYWNybyB0YWtlcyB0aGUgY29lZmZpY2llbnQgd2Ugd2FudCB0cmFuc2Zvcm1l
ZCBhbmQNCj4gdGhlDQo+IEBAIC01OSwzNyArNzQsMzggQEANCj4gIA0KPiAgI2RlZmluZSBJTEtf
Q1NDX1BPU1RPRkZfTElNSVRFRF9SQU5HRSAoMTYgKiAoMSA8PCAxMikgLyAyNTUpDQo+ICANCj4g
Ky8qIE5vcCBwcmUvcG9zdCBvZmZzZXRzICovDQo+ICBzdGF0aWMgY29uc3QgdTE2IGlsa19jc2Nf
b2ZmX3plcm9bM10gPSB7fTsNCj4gIA0KPiArLyogSWRlbnRpdHkgbWF0cml4ICovDQo+ICBzdGF0
aWMgY29uc3QgdTE2IGlsa19jc2NfY29lZmZfaWRlbnRpdHlbOV0gPSB7DQo+ICAJSUxLX0NTQ19D
T0VGRl8xXzAsIDAsIDAsDQo+ICAJMCwgSUxLX0NTQ19DT0VGRl8xXzAsIDAsDQo+ICAJMCwgMCwg
SUxLX0NTQ19DT0VGRl8xXzAsDQo+ICB9Ow0KPiAgDQo+ICsvKiBMaW1pdGVkIHJhbmdlIFJHQiBw
b3N0IG9mZnNldHMgKi8NCj4gIHN0YXRpYyBjb25zdCB1MTYgaWxrX2NzY19wb3N0b2ZmX2xpbWl0
ZWRfcmFuZ2VbM10gPSB7DQo+ICAJSUxLX0NTQ19QT1NUT0ZGX0xJTUlURURfUkFOR0UsDQo+ICAJ
SUxLX0NTQ19QT1NUT0ZGX0xJTUlURURfUkFOR0UsDQo+ICAJSUxLX0NTQ19QT1NUT0ZGX0xJTUlU
RURfUkFOR0UsDQo+ICB9Ow0KPiAgDQo+ICsvKiBGdWxsIHJhbmdlIFJHQiAtPiBsaW1pdGVkIHJh
bmdlIFJHQiBtYXRyaXggKi8NCj4gIHN0YXRpYyBjb25zdCB1MTYgaWxrX2NzY19jb2VmZl9saW1p
dGVkX3JhbmdlWzldID0gew0KPiAgCUlMS19DU0NfQ09FRkZfTElNSVRFRF9SQU5HRSwgMCwgMCwN
Cj4gIAkwLCBJTEtfQ1NDX0NPRUZGX0xJTUlURURfUkFOR0UsIDAsDQo+ICAJMCwgMCwgSUxLX0NT
Q19DT0VGRl9MSU1JVEVEX1JBTkdFLA0KPiAgfTsNCj4gIA0KPiAtLyoNCj4gLSAqIFRoZXNlIHZh
bHVlcyBhcmUgZGlyZWN0IHJlZ2lzdGVyIHZhbHVlcyBzcGVjaWZpZWQgaW4gdGhlIEJzcGVjLA0K
PiAtICogZm9yIFJHQi0+WVVWIGNvbnZlcnNpb24gbWF0cml4IChjb2xvcnNwYWNlIEJUNzA5KQ0K
PiAtICovDQo+ICsvKiBCVC43MDkgZnVsbCByYW5nZSBSR0IgLT4gbGltaXRlZCByYW5nZSBZQ2JD
ciBtYXRyaXggKi8NCj4gIHN0YXRpYyBjb25zdCB1MTYgaWxrX2NzY19jb2VmZl9yZ2JfdG9feWNi
Y3JbOV0gPSB7DQo+ICAJMHgxZTA4LCAweDljYzAsIDB4YjUyOCwNCj4gIAkweDJiYTgsIDB4MDlk
OCwgMHgzN2U4LA0KPiAgCTB4YmNlOCwgMHg5YWQ4LCAweDFlMDgsDQo+ICB9Ow0KPiAgDQo+IC0v
KiBQb3N0IG9mZnNldCB2YWx1ZXMgZm9yIFJHQi0+WUNCQ1IgY29udmVyc2lvbiAqLw0KPiArLyog
TGltaXRlZCByYW5nZSBZQ2JDciBwb3N0IG9mZnNldHMgKi8NCj4gIHN0YXRpYyBjb25zdCB1MTYg
aWxrX2NzY19wb3N0b2ZmX3JnYl90b195Y2JjclszXSA9IHsNCj4gIAkweDA4MDAsIDB4MDEwMCwg
MHgwODAwLA0KPiAgfTsNClRoZSBjaGFuZ2VzIGxvb2sgZ29vZCB0byBtZS4NClJldmlld2VkLWJ5
OiBHd2FuLWd5ZW9uZyBNdW4gPGd3YW4tZ3llb25nLm11bkBpbnRlbC5jb20+DQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
