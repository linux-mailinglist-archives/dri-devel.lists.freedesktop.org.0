Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6350A95A0B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 10:44:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D2D96E7D6;
	Tue, 20 Aug 2019 08:44:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D906E7D6;
 Tue, 20 Aug 2019 08:44:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Aug 2019 01:44:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,408,1559545200"; d="scan'208";a="183132828"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by orsmga006.jf.intel.com with ESMTP; 20 Aug 2019 01:44:07 -0700
Received: from fmsmsx116.amr.corp.intel.com (10.18.116.20) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 20 Aug 2019 01:44:06 -0700
Received: from lcsmsx155.ger.corp.intel.com (10.186.165.233) by
 fmsmsx116.amr.corp.intel.com (10.18.116.20) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 20 Aug 2019 01:44:06 -0700
Received: from hasmsx108.ger.corp.intel.com ([169.254.9.203]) by
 LCSMSX155.ger.corp.intel.com ([169.254.12.21]) with mapi id 14.03.0439.000;
 Tue, 20 Aug 2019 11:44:04 +0300
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: "C, Ramalingam" <ramalingam.c@intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v6 1/3] drm/i915: enum transcoder and pipe are moved
 into i915_drm.h
Thread-Topic: [PATCH v6 1/3] drm/i915: enum transcoder and pipe are moved
 into i915_drm.h
Thread-Index: AQHVVyk+g1D8DNAmekKhQq+jTAB0PqcDt5KQ
Date: Tue, 20 Aug 2019 08:44:03 +0000
Message-ID: <5B8DA87D05A7694D9FA63FD143655C1B9DC9FFCF@hasmsx108.ger.corp.intel.com>
References: <20190820073034.15911-1-ramalingam.c@intel.com>
 <20190820073034.15911-2-ramalingam.c@intel.com>
In-Reply-To: <20190820073034.15911-2-ramalingam.c@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYWY0NzcxMmUtNDMzNi00MzI1LTg3MGMtMDYxYmMxNTI1NDcwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiRlp5Q1dueVg0WDM3WmQzczZyaHhRNWErYk1VM2lFcUxTXC8zV0NJR3dSRFpJWmlJczN4R2RaQVwvVWxLR3kzWTVHIn0=
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.184.70.11]
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

Cgo+IAo+IEZvciB0aGUgcmV1c2FiaWxpdHkgb2YgdGhlIGVudW0gdHJhbnNjb2RlciBhbmQgZW51
bSBwaXBlIGluIG90aGVyIGRyaXZlcgo+IG1vZHVsZXMgKGxpa2UgbWVpX2hkY3ApLCBlbnVtIHBv
cnQgZGVmaW5pdGlvbiBpcyBtb3ZlZCBmcm9tIEk5MTUgbG9jYWwgaGVhZGVyCj4gaW50ZWxfZGlz
cGxheS5oIHRvIGRybS9pOTE1X2RybS5oCgpEb24ndCB5b3UgbmVlZCB0byBuYW1lIHNwYWNlIHRo
b3NlIGRlZmluaXRpb25zIGluIHRoZSBnbG9iYWwgc3BhY2UsIEkgZ3Vlc3MgdGhlcmUgYXJlIGEg
bG90IG9mICdwaXBlJyB2YXJpYWJsZXMgYW5kIGRlZmluaXRpb25zIHlvdSBjYW4gY29uZmxpY3Qg
d2l0aC4gCkkgZ3Vlc3MgaXQgc2hvdWxkIGJlIGVudW0gaTkxNV9waXBlLCBldGMuIAoKVGhhbmtz
ClRvbWFzCgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYW1hbGluZ2FtIEMgPHJhbWFsaW5nYW0uY0Bp
bnRlbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlz
cGxheS5oIHwgNDQgLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBpbmNsdWRlL2RybS9pOTE1X2RybS5o
ICAgICAgICAgICAgICAgICAgICAgICB8IDQ2ICsrKysrKysrKysrKysrKysrKysrCj4gIDIgZmls
ZXMgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKSwgNDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5oCj4gYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuaAo+IGluZGV4IGU1N2U2
OTY5MDUxZC4uNTZmM2Q5MDczMTU5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9kaXNwbGF5LmgKPiBAQCAtNzEsNTAgKzcxLDYgQEAgZW51bSBpOTE1X2dwaW8g
ewo+ICAJR1BJT08sCj4gIH07Cj4gCj4gLS8qCj4gLSAqIEtlZXAgdGhlIHBpcGUgZW51bSB2YWx1
ZXMgZml4ZWQ6IHRoZSBjb2RlIGFzc3VtZXMgdGhhdCBQSVBFX0E9MCwgdGhlCj4gLSAqIHJlc3Qg
aGF2ZSBjb25zZWN1dGl2ZSB2YWx1ZXMgYW5kIG1hdGNoIHRoZSBlbnVtIHZhbHVlcyBvZiB0cmFu
c2NvZGVycwo+IC0gKiB3aXRoIGEgMToxIHRyYW5zY29kZXIgLT4gcGlwZSBtYXBwaW5nLgo+IC0g
Ki8KPiAtZW51bSBwaXBlIHsKPiAtCUlOVkFMSURfUElQRSA9IC0xLAo+IC0KPiAtCVBJUEVfQSA9
IDAsCj4gLQlQSVBFX0IsCj4gLQlQSVBFX0MsCj4gLQlQSVBFX0QsCj4gLQlfUElQRV9FRFAsCj4g
LQo+IC0JSTkxNV9NQVhfUElQRVMgPSBfUElQRV9FRFAKPiAtfTsKPiAtCj4gLSNkZWZpbmUgcGlw
ZV9uYW1lKHApICgocCkgKyAnQScpCj4gLQo+IC1lbnVtIHRyYW5zY29kZXIgewo+IC0JLyoKPiAt
CSAqIFRoZSBmb2xsb3dpbmcgdHJhbnNjb2RlcnMgaGF2ZSBhIDE6MSB0cmFuc2NvZGVyIC0+IHBp
cGUgbWFwcGluZywKPiAtCSAqIGtlZXAgdGhlaXIgdmFsdWVzIGZpeGVkOiB0aGUgY29kZSBhc3N1
bWVzIHRoYXQgVFJBTlNDT0RFUl9BPTAsCj4gdGhlCj4gLQkgKiByZXN0IGhhdmUgY29uc2VjdXRp
dmUgdmFsdWVzIGFuZCBtYXRjaCB0aGUgZW51bSB2YWx1ZXMgb2YgdGhlIHBpcGVzCj4gLQkgKiB0
aGV5IG1hcCB0by4KPiAtCSAqLwo+IC0JVFJBTlNDT0RFUl9BID0gUElQRV9BLAo+IC0JVFJBTlND
T0RFUl9CID0gUElQRV9CLAo+IC0JVFJBTlNDT0RFUl9DID0gUElQRV9DLAo+IC0JVFJBTlNDT0RF
Ul9EID0gUElQRV9ELAo+IC0KPiAtCS8qCj4gLQkgKiBUaGUgZm9sbG93aW5nIHRyYW5zY29kZXJz
IGNhbiBtYXAgdG8gYW55IHBpcGUsIHRoZWlyIGVudW0gdmFsdWUKPiAtCSAqIGRvZXNuJ3QgbmVl
ZCB0byBzdGF5IGZpeGVkLgo+IC0JICovCj4gLQlUUkFOU0NPREVSX0VEUCwKPiAtCVRSQU5TQ09E
RVJfRFNJXzAsCj4gLQlUUkFOU0NPREVSX0RTSV8xLAo+IC0JVFJBTlNDT0RFUl9EU0lfQSA9IFRS
QU5TQ09ERVJfRFNJXzAsCS8qIGxlZ2FjeSBEU0kgKi8KPiAtCVRSQU5TQ09ERVJfRFNJX0MgPSBU
UkFOU0NPREVSX0RTSV8xLAkvKiBsZWdhY3kgRFNJICovCj4gLQo+IC0JSTkxNV9NQVhfVFJBTlND
T0RFUlMKPiAtfTsKPiAtCj4gIHN0YXRpYyBpbmxpbmUgY29uc3QgY2hhciAqdHJhbnNjb2Rlcl9u
YW1lKGVudW0gdHJhbnNjb2RlciB0cmFuc2NvZGVyKSAgewo+ICAJc3dpdGNoICh0cmFuc2NvZGVy
KSB7Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2k5MTVfZHJtLmggYi9pbmNsdWRlL2RybS9p
OTE1X2RybS5oIGluZGV4Cj4gMjMyNzRjZjkyNzEyLi5iMDc3OWI4MjY3YjkgMTAwNjQ0Cj4gLS0t
IGEvaW5jbHVkZS9kcm0vaTkxNV9kcm0uaAo+ICsrKyBiL2luY2x1ZGUvZHJtL2k5MTVfZHJtLmgK
PiBAQCAtMTE4LDQgKzExOCw1MCBAQCBlbnVtIHBvcnQgewo+IAo+ICAjZGVmaW5lIHBvcnRfbmFt
ZShwKSAoKHApICsgJ0EnKQo+IAo+ICsvKgo+ICsgKiBLZWVwIHRoZSBwaXBlIGVudW0gdmFsdWVz
IGZpeGVkOiB0aGUgY29kZSBhc3N1bWVzIHRoYXQgUElQRV9BPTAsIHRoZQo+ICsgKiByZXN0IGhh
dmUgY29uc2VjdXRpdmUgdmFsdWVzIGFuZCBtYXRjaCB0aGUgZW51bSB2YWx1ZXMgb2YKPiArdHJh
bnNjb2RlcnMKPiArICogd2l0aCBhIDE6MSB0cmFuc2NvZGVyIC0+IHBpcGUgbWFwcGluZy4KPiAr
ICovCj4gK2VudW0gcGlwZSB7Cj4gKwlJTlZBTElEX1BJUEUgPSAtMSwKPiArCj4gKwlQSVBFX0Eg
PSAwLAo+ICsJUElQRV9CLAo+ICsJUElQRV9DLAo+ICsJUElQRV9ELAo+ICsJX1BJUEVfRURQLAo+
ICsKPiArCUk5MTVfTUFYX1BJUEVTID0gX1BJUEVfRURQCj4gK307Cj4gKwo+ICsjZGVmaW5lIHBp
cGVfbmFtZShwKSAoKHApICsgJ0EnKQo+ICsKPiArZW51bSB0cmFuc2NvZGVyIHsKPiArCUlOVkFM
SURfVFJBTlNDT0RFUiA9IC0xLAo+ICsKPiArCS8qCj4gKwkgKiBUaGUgZm9sbG93aW5nIHRyYW5z
Y29kZXJzIGhhdmUgYSAxOjEgdHJhbnNjb2RlciAtPiBwaXBlIG1hcHBpbmcsCj4gKwkgKiBrZWVw
IHRoZWlyIHZhbHVlcyBmaXhlZDogdGhlIGNvZGUgYXNzdW1lcyB0aGF0IFRSQU5TQ09ERVJfQT0w
LAo+IHRoZQo+ICsJICogcmVzdCBoYXZlIGNvbnNlY3V0aXZlIHZhbHVlcyBhbmQgbWF0Y2ggdGhl
IGVudW0gdmFsdWVzIG9mIHRoZSBwaXBlcwo+ICsJICogdGhleSBtYXAgdG8uCj4gKwkgKi8KPiAr
CVRSQU5TQ09ERVJfQSA9IFBJUEVfQSwKPiArCVRSQU5TQ09ERVJfQiA9IFBJUEVfQiwKPiArCVRS
QU5TQ09ERVJfQyA9IFBJUEVfQywKPiArCVRSQU5TQ09ERVJfRCA9IFBJUEVfRCwKPiArCj4gKwkv
Kgo+ICsJICogVGhlIGZvbGxvd2luZyB0cmFuc2NvZGVycyBjYW4gbWFwIHRvIGFueSBwaXBlLCB0
aGVpciBlbnVtIHZhbHVlCj4gKwkgKiBkb2Vzbid0IG5lZWQgdG8gc3RheSBmaXhlZC4KPiArCSAq
Lwo+ICsJVFJBTlNDT0RFUl9FRFAsCj4gKwlUUkFOU0NPREVSX0RTSV8wLAo+ICsJVFJBTlNDT0RF
Ul9EU0lfMSwKPiArCVRSQU5TQ09ERVJfRFNJX0EgPSBUUkFOU0NPREVSX0RTSV8wLAkvKiBsZWdh
Y3kgRFNJICovCj4gKwlUUkFOU0NPREVSX0RTSV9DID0gVFJBTlNDT0RFUl9EU0lfMSwJLyogbGVn
YWN5IERTSSAqLwo+ICsKPiArCUk5MTVfTUFYX1RSQU5TQ09ERVJTCj4gK307Cj4gKwo+ICAjZW5k
aWYJCQkJLyogX0k5MTVfRFJNX0hfICovCj4gLS0KPiAyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
