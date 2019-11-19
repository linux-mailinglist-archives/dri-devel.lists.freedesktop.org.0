Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18738102892
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 16:47:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B6E891FB;
	Tue, 19 Nov 2019 15:47:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C182B6E8AF;
 Tue, 19 Nov 2019 15:47:24 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Nov 2019 07:47:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,324,1569308400"; d="scan'208";a="209453942"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 19 Nov 2019 07:47:18 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 19 Nov 2019 17:47:17 +0200
Date: Tue, 19 Nov 2019 17:47:17 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 3/3] drm/i915: DSI: select correct PWM controller to use
 based on the VBT
Message-ID: <20191119154717.GA1208@intel.com>
References: <20191119151818.67531-1-hdegoede@redhat.com>
 <20191119151818.67531-4-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191119151818.67531-4-hdegoede@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTksIDIwMTkgYXQgMDQ6MTg6MThQTSArMDEwMCwgSGFucyBkZSBHb2VkZSB3
cm90ZToKPiBBdCBsZWFzdCBCYXkgVHJhaWwgKEJZVCkgYW5kIENoZXJyeSBUcmFpbCAoQ0hUKSBk
ZXZpY2VzIGNhbiB1c2UgMSBvZiAyCj4gZGlmZmVyZW50IFBXTSBjb250cm9sbGVycyBmb3IgY29u
dHJvbGxpbmcgdGhlIExDRCdzIGJhY2tsaWdodCBicmlnaHRuZXNzLgo+IEVpdGhlciB0aGUgb25l
IGludGVncmF0ZWQgaW50byB0aGUgUE1JQyBvciB0aGUgb25lIGludGVncmF0ZWQgaW50byB0aGUK
PiBTb0MgKHRoZSAxc3QgTFBTUyBQV00gY29udHJvbGxlcikuCj4gCj4gU28gZmFyIGluIHRoZSBM
UFNTIGNvZGUgb24gQllUIHdlIGhhdmUgc2tpcHBlZCByZWdpc3RlcmluZyB0aGUgTFBTUyBQV00K
PiBjb250cm9sbGVyICJwd21fYmFja2xpZ2h0IiBsb29rdXAgZW50cnkgd2hlbiBhIENyeXN0YWwg
Q292ZSBQTUlDIGlzCj4gcHJlc2VudCwgYXNzdW1pbmcgdGhhdCBpbiB0aGlzIGNhc2UgdGhlIFBN
SUMgUFdNIGNvbnRyb2xsZXIgd2lsbCBiZSB1c2VkLgo+IAo+IE9uIENIVCB3ZSBoYXZlIGJlZW4g
cmVseWluZyBvbiBvbmx5IDEgb2YgdGhlIDIgUFdNIGNvbnRyb2xsZXJzIGJlaW5nCj4gZW5hYmxl
ZCBpbiB0aGUgRFNEVCBhdCB0aGUgc2FtZSB0aW1lOyBhbmQgYWx3YXlzIHJlZ2lzdGVyZWQgdGhl
IGxvb2t1cC4KPiAKPiBTbyBmYXIgdGhpcyBoYXMgYmVlbiB3b3JraW5nLCBidXQgdGhlIGNvcnJl
Y3Qgd2F5IHRvIGRldGVybWluZSB3aGljaCBQV00KPiBjb250cm9sbGVyIG5lZWRzIHRvIGJlIHVz
ZWQgaXMgYnkgY2hlY2tpbmcgYSBiaXQgaW4gdGhlIFZCVCB0YWJsZSBhbmQKPiByZWNlbnRseSBJ
J3ZlIGxlYXJuZWQgYWJvdXQgMiBkaWZmZXJlbnQgQllUIGRldmljZXM6Cj4gUG9pbnQgb2YgVmll
dyBNT0JJSSBUQUItUDgwMFcKPiBBY2VyIFN3aXRjaCAxMCBTVzUtMDEyCj4gCj4gV2hpY2ggdXNl
IGEgQ3J5c3RhbCBDb3ZlIFBNSUMsIHlldCB0aGUgTENEIGlzIGNvbm5lY3RlZCB0byB0aGUgU29D
L0xQU1MKPiBQV00gY29udHJvbGxlciAoYW5kIHRoZSBWQlQgY29ycmVjdGx5IGluZGljYXRlcyB0
aGlzKSwgc28gaGVyZSBvdXIgb2xkCj4gaGV1cmlzdGljcyBmYWlsLgo+IAo+IFRoaXMgY29tbWl0
IGZpeGVzIHVzaW5nIHRoZSB3cm9uZyBQV00gY29udHJvbGxlciBvbiB0aGVzZSBkZXZpY2VzIGJ5
Cj4gY2FsbGluZyBwd21fZ2V0KCkgZm9yIHRoZSByaWdodCBQV00gY29udHJvbGxlciBiYXNlZCBv
biB0aGUKPiBWQlQgZHNpLmNvbmZpZy5wd21fYmxjIGJpdC4KPiAKPiBOb3RlIHRoaXMgaXMgcGFy
dCBvZiBhIHNlcmllcyB3aGljaCBjb250YWlucyAyIG90aGVyIHBhdGNoZXMgd2hpY2ggcmVuYW1l
cwo+IHRoZSBQV00gbG9va3VwIGZvciB0aGUgMXN0IFNvQy9MUFNTIFBXTSBmcm9tICJwd21fYmFj
a2xpZ2h0IiB0bwo+ICJwd21fcG1pY19iYWNrbGlnaHQiIGFuZCB0aGUgUFdNIGxvb2t1cCBmb3Ig
dGhlIENyeXN0YWwgQ292ZSBQTUlDIFBXTQo+IGZyb20gInB3bV9iYWNrbGlnaHQiIHRvICJwd21f
cG1pY19iYWNrbGlnaHQiLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdv
ZWRlQHJlZGhhdC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfcGFuZWwuYyB8IDE2ICsrKysrKysrKysrKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcGFuZWwuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfcGFuZWwuYwo+IGluZGV4IGJjMTRlOWMwMjg1YS4uZGRjZjMxMWQxMTE0IDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcGFuZWwuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcGFuZWwuYwo+IEBAIC0x
ODQwLDEzICsxODQwLDIyIEBAIHN0YXRpYyBpbnQgcHdtX3NldHVwX2JhY2tsaWdodChzdHJ1Y3Qg
aW50ZWxfY29ubmVjdG9yICpjb25uZWN0b3IsCj4gIAkJCSAgICAgICBlbnVtIHBpcGUgcGlwZSkK
PiAgewo+ICAJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IGNvbm5lY3Rvci0+YmFzZS5kZXY7Cj4g
KwlzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYgPSB0b19pOTE1KGRldik7Cj4gIAlz
dHJ1Y3QgaW50ZWxfcGFuZWwgKnBhbmVsID0gJmNvbm5lY3Rvci0+cGFuZWw7Cj4gKwljb25zdCBj
aGFyICpkZXNjOwo+ICAJaW50IHJldHZhbDsKPiAgCj4gLQkvKiBHZXQgdGhlIFBXTSBjaGlwIGZv
ciBiYWNrbGlnaHQgY29udHJvbCAqLwo+IC0JcGFuZWwtPmJhY2tsaWdodC5wd20gPSBwd21fZ2V0
KGRldi0+ZGV2LCAicHdtX2JhY2tsaWdodCIpOwo+ICsJLyogR2V0IHRoZSByaWdodCBQV00gY2hp
cCBmb3IgRFNJIGJhY2tsaWdodCBhY2NvcmRpbmcgdG8gVkJUICovCj4gKwlpZiAoZGV2X3ByaXYt
PnZidC5kc2kuY29uZmlnLT5wd21fYmxjID09IFBQU19CTENfUE1JQykgewo+ICsJCXBhbmVsLT5i
YWNrbGlnaHQucHdtID0gcHdtX2dldChkZXYtPmRldiwgInB3bV9wbWljX2JhY2tsaWdodCIpOwo+
ICsJCWRlc2MgPSAiUE1JQyI7Cj4gKwl9IGVsc2Ugewo+ICsJCXBhbmVsLT5iYWNrbGlnaHQucHdt
ID0gcHdtX2dldChkZXYtPmRldiwgInB3bV9zb2NfYmFja2xpZ2h0Iik7Cj4gKwkJZGVzYyA9ICJT
b0MiOwo+ICsJfQoKTWlnaHQgd2Ugd2FudCB0aGUgc2FtZSB0aGluZyBmb3IgdGhlIHBhbmVsIGVu
YWJsZSBncGlvPwoKPiArCj4gIAlpZiAoSVNfRVJSKHBhbmVsLT5iYWNrbGlnaHQucHdtKSkgewo+
IC0JCURSTV9FUlJPUigiRmFpbGVkIHRvIG93biB0aGUgcHdtIGNoaXBcbiIpOwo+ICsJCURSTV9F
UlJPUigiRmFpbGVkIHRvIGdldCB0aGUgJXMgUFdNIGNoaXBcbiIsIGRlc2MpOwo+ICAJCXBhbmVs
LT5iYWNrbGlnaHQucHdtID0gTlVMTDsKPiAgCQlyZXR1cm4gLUVOT0RFVjsKPiAgCX0KPiBAQCAt
MTg3Myw2ICsxODgyLDcgQEAgc3RhdGljIGludCBwd21fc2V0dXBfYmFja2xpZ2h0KHN0cnVjdCBp
bnRlbF9jb25uZWN0b3IgKmNvbm5lY3RvciwKPiAgCQkJCSBDUkNfUE1JQ19QV01fUEVSSU9EX05T
KTsKPiAgCXBhbmVsLT5iYWNrbGlnaHQuZW5hYmxlZCA9IHBhbmVsLT5iYWNrbGlnaHQubGV2ZWwg
IT0gMDsKPiAgCj4gKwlEUk1fSU5GTygiVXNpbmcgJXMgUFdNIGZvciBMQ0QgYmFja2xpZ2h0IGNv
bnRyb2xcbiIsIGRlc2MpOwo+ICAJcmV0dXJuIDA7Cj4gIH0KPiAgCj4gLS0gCj4gMi4yMy4wCgot
LSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
