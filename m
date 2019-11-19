Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F12102A89
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 18:11:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B424D6E9C4;
	Tue, 19 Nov 2019 17:11:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F71B6E8FA;
 Tue, 19 Nov 2019 17:11:36 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Nov 2019 09:11:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,218,1571727600"; d="scan'208";a="204459597"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 19 Nov 2019 09:11:33 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 19 Nov 2019 19:11:32 +0200
Date: Tue, 19 Nov 2019 19:11:32 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Cornij, Nikola" <Nikola.Cornij@amd.com>
Subject: Re: [PATCH] drm/dsc: Return unsigned long on compute offset
Message-ID: <20191119171132.GB1208@intel.com>
References: <20191119144526.31797-1-mikita.lipski@amd.com>
 <20191119145649.GZ1208@intel.com>
 <f7b705a8-9d6a-1db3-e261-a80aca57454a@amd.com>
 <BL0PR12MB24039F7D8CC95CCCC10C3103EE4C0@BL0PR12MB2403.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BL0PR12MB24039F7D8CC95CCCC10C3103EE4C0@BL0PR12MB2403.namprd12.prod.outlook.com>
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
Cc: "Lipski, Mikita" <Mikita.Lipski@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTksIDIwMTkgYXQgMDQ6NTk6NDBQTSArMDAwMCwgQ29ybmlqLCBOaWtvbGEg
d3JvdGU6Cj4gSWYgeW91J3JlIGdvaW5nIHRvIG1ha2UgYWxsIG9mIHRoZW0gdGhlIHNhbWUsIHRo
ZW4gdTY0LCBwbGVhc2UuCj4gCj4gVGhpcyBpcyBiZWNhdXNlIEknbSBub3Qgc3VyZSBpZiBjYWxj
dWxhdGlvbnMgcmVxdWlyZSA2NC1iaXQgYXQgc29tZSBzdGFnZS4KCklmIGl0IGRvZXMgdGhlbiBp
dCdzIGFscmVhZHkgYnJva2VuLiBTb21lb25lIHNob3VsZCBwcm9iYWJseSBmaWd1cmUgb3V0Cndo
YXQncyBhY3RhbGx5IG5lZWRlZCBpbnN0ZWFkIG9mIHNob290aW5nIGR1Y2tzIHdpdGggYW4gaWNi
bS4KCj4gCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBGcm9tOiBMaXBza2ksIE1pa2l0
YSA8TWlraXRhLkxpcHNraUBhbWQuY29tPiAKPiBTZW50OiBOb3ZlbWJlciAxOSwgMjAxOSAxMDow
OCBBTQo+IFRvOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29t
PjsgTGlwc2tpLCBNaWtpdGEgPE1pa2l0YS5MaXBza2lAYW1kLmNvbT4KPiBDYzogYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IENv
cm5paiwgTmlrb2xhIDxOaWtvbGEuQ29ybmlqQGFtZC5jb20+Cj4gU3ViamVjdDogUmU6IFtQQVRD
SF0gZHJtL2RzYzogUmV0dXJuIHVuc2lnbmVkIGxvbmcgb24gY29tcHV0ZSBvZmZzZXQKPiAKPiAK
PiAKPiBPbiAxOS8xMS8yMDE5IDA5OjU2LCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6Cj4gPiBPbiBU
dWUsIE5vdiAxOSwgMjAxOSBhdCAwOTo0NToyNkFNIC0wNTAwLCBtaWtpdGEubGlwc2tpQGFtZC5j
b20gd3JvdGU6Cj4gPj4gRnJvbTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29t
Pgo+ID4+Cj4gPj4gV2Ugc2hvdWxkbid0IGNvbXBhcmUgaW50IHdpdGggdW5zaWduZWQgbG9uZyB0
byBmaW5kIHRoZSBtYXggdmFsdWUgYW5kIAo+ID4+IHNpbmNlIHdlIGFyZSBub3QgZXhwZWN0aW5n
IG5lZ2F0aXZlIHZhbHVlIHJldHVybmVkIGZyb20gCj4gPj4gY29tcHV0ZV9vZmZzZXQgd2Ugc2hv
dWxkIG1ha2UgdGhpcyBmdW5jdGlvbiByZXR1cm4gdW5zaWduZWQgbG9uZyBzbyAKPiA+PiB3ZSBj
YW4gY29tcGFyZSB0aGUgdmFsdWVzIHdoZW4gY29tcHV0aW5nIHJjIHBhcmFtZXRlcnMuCj4gPiAK
PiA+IFdoeSBhcmUgdGhlcmUgb3RoZXIgdW5zaWduZWQgbG9uZ3MgaW4gZHNjIHBhcmFtZXRlciBj
b21wdXRhdGlvbiBpbiB0aGUgCj4gPiBmaXJzdCBwbGFjZT8KPiAKPiBJIGJlbGlldmUgaXQgd2Fz
IGluaXRpYWxseSBzZXQgdG8gYmUgdW5zaWduZWQgbG9uZyBmb3IgdmFyaWFibGUgY29uc2lzdGVu
Y3ksIHdoZW4gd2UgcG9ydGVkIGludGVsX2NvbXB1dGVfcmNfcGFyYW1ldGVycyBpbnRvIGRybV9k
c2NfY29tcHV0ZV9yY19wYXJhbWV0ZXJzLiBCdXQgbm93IHRoYXQgSSBsb29rIGF0IGl0LCB3ZSBj
YW4gYWN0dWFsbHkganVzdCBzZXQgdGhlbSB0byB1MzIgb3IgdTY0LCBhcyBub3RoaW5nIHNob3Vs
ZCBleGNlZWQgdGhhdC4KPiA+IAo+ID4+Cj4gPj4gQ2M6IE5pa29sYSBDb3JuaWogPG5pa29sYS5j
b3JuaWpAYW1kLmNvbT4KPiA+PiBDYzogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFt
ZC5jb20+Cj4gPj4gU2lnbmVkLW9mZi1ieTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBh
bWQuY29tPgo+ID4+IC0tLQo+ID4+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9kc2MuYyB8IDYgKysr
LS0tCj4gPj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHNjLmMgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX2RzYy5jCj4gPj4gaW5kZXggNzRmMzUyN2Y1NjdkLi5lYzQwNjA0YWI2
YTIgMTAwNjQ0Cj4gPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kc2MuYwo+ID4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZHNjLmMKPiA+PiBAQCAtMjQ1LDExICsyNDUsMTEgQEAgdm9p
ZCBkcm1fZHNjX3Bwc19wYXlsb2FkX3BhY2soc3RydWN0IGRybV9kc2NfcGljdHVyZV9wYXJhbWV0
ZXJfc2V0ICpwcHNfcGF5bG9hZCwKPiA+PiAgIH0KPiA+PiAgIEVYUE9SVF9TWU1CT0woZHJtX2Rz
Y19wcHNfcGF5bG9hZF9wYWNrKTsKPiA+PiAgIAo+ID4+IC1zdGF0aWMgaW50IGNvbXB1dGVfb2Zm
c2V0KHN0cnVjdCBkcm1fZHNjX2NvbmZpZyAqdmRzY19jZmcsIGludCBwaXhlbHNfcGVyX2dyb3Vw
LAo+ID4+ICtzdGF0aWMgdW5zaWduZWQgbG9uZyBjb21wdXRlX29mZnNldChzdHJ1Y3QgZHJtX2Rz
Y19jb25maWcgKnZkc2NfY2ZnLCBpbnQgcGl4ZWxzX3Blcl9ncm91cCwKPiA+PiAgIAkJCQlpbnQg
Z3JvdXBzX3Blcl9saW5lLCBpbnQgZ3JwY250KQo+ID4+ICAgewo+ID4+IC0JaW50IG9mZnNldCA9
IDA7Cj4gPj4gLQlpbnQgZ3JwY250X2lkID0gRElWX1JPVU5EX1VQKHZkc2NfY2ZnLT5pbml0aWFs
X3htaXRfZGVsYXksIHBpeGVsc19wZXJfZ3JvdXApOwo+ID4+ICsJdW5zaWduZWQgbG9uZyBvZmZz
ZXQgPSAwOwo+ID4+ICsJdW5zaWduZWQgbG9uZyBncnBjbnRfaWQgPSBESVZfUk9VTkRfVVAodmRz
Y19jZmctPmluaXRpYWxfeG1pdF9kZWxheSwgcGl4ZWxzX3Blcl9ncm91cCk7Cj4gPj4gICAKPiA+
PiAgIAlpZiAoZ3JwY250IDw9IGdycGNudF9pZCkKPiA+PiAgIAkJb2Zmc2V0ID0gRElWX1JPVU5E
X1VQKGdycGNudCAqIHBpeGVsc19wZXJfZ3JvdXAgKiB2ZHNjX2NmZy0+Yml0c19wZXJfcGl4ZWws
IDE2KTsKPiA+PiAtLSAKPiA+PiAyLjE3LjEKPiA+Pgo+ID4+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+
ID4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+PiBodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+ID4gCj4gCj4gLS0gCj4g
VGhhbmtzLAo+IE1pa2l0YSBMaXBza2kKPiBTb2Z0d2FyZSBFbmdpbmVlciAyLCBBTUQKPiBtaWtp
dGEubGlwc2tpQGFtZC5jb20KCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
