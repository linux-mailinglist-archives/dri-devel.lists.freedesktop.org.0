Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C557E103749
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 11:17:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF126E193;
	Wed, 20 Nov 2019 10:17:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AFF76E18F;
 Wed, 20 Nov 2019 10:17:20 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Nov 2019 02:17:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,221,1571727600"; d="scan'208";a="258994973"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 20 Nov 2019 02:17:17 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 20 Nov 2019 12:17:16 +0200
Date: Wed, 20 Nov 2019 12:17:16 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Mikita Lipski <mlipski@amd.com>
Subject: Re: [PATCH] drm/dsc: Return unsigned long on compute offset
Message-ID: <20191120101716.GC1208@intel.com>
References: <20191119144526.31797-1-mikita.lipski@amd.com>
 <20191119145649.GZ1208@intel.com>
 <f7b705a8-9d6a-1db3-e261-a80aca57454a@amd.com>
 <BL0PR12MB24039F7D8CC95CCCC10C3103EE4C0@BL0PR12MB2403.namprd12.prod.outlook.com>
 <20191119171132.GB1208@intel.com>
 <2a61d60c-98f9-a5a2-6e7b-dc94df3fc510@amd.com>
 <362986e6-e5d4-f2d5-12bd-feb0acc06546@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <362986e6-e5d4-f2d5-12bd-feb0acc06546@amd.com>
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
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Cornij,
 Nikola" <Nikola.Cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTksIDIwMTkgYXQgMDQ6MTE6NDNQTSAtMDUwMCwgTWlraXRhIExpcHNraSB3
cm90ZToKPiAKPiAKPiBPbiAxOS8xMS8yMDE5IDE2OjA5LCBNaWtpdGEgTGlwc2tpIHdyb3RlOgo+
ID4gCj4gPiAKPiA+IE9uIDE5LzExLzIwMTkgMTI6MTEsIFZpbGxlIFN5cmrDpGzDpCB3cm90ZToK
PiA+PiBPbiBUdWUsIE5vdiAxOSwgMjAxOSBhdCAwNDo1OTo0MFBNICswMDAwLCBDb3JuaWosIE5p
a29sYSB3cm90ZToKPiA+Pj4gSWYgeW91J3JlIGdvaW5nIHRvIG1ha2UgYWxsIG9mIHRoZW0gdGhl
IHNhbWUsIHRoZW4gdTY0LCBwbGVhc2UuCj4gPj4+Cj4gPj4+IFRoaXMgaXMgYmVjYXVzZSBJJ20g
bm90IHN1cmUgaWYgY2FsY3VsYXRpb25zIHJlcXVpcmUgNjQtYml0IGF0IHNvbWUgCj4gPj4+IHN0
YWdlLgo+ID4+Cj4gPj4gSWYgaXQgZG9lcyB0aGVuIGl0J3MgYWxyZWFkeSBicm9rZW4uIFNvbWVv
bmUgc2hvdWxkIHByb2JhYmx5IGZpZ3VyZSBvdXQKPiA+PiB3aGF0J3MgYWN0YWxseSBuZWVkZWQg
aW5zdGVhZCBvZiBzaG9vdGluZyBkdWNrcyB3aXRoIGFuIGljYm0uCj4gPj4KPiAKPiAKPiBTb3Jy
eSBtYWRlIGEgdHlwZSBiZWxvdy4gU3VwcG9zZWQgdG8gYmUgIkkgZG9uJ3QgdGhpbmsgaXQgaXMg
YnJva2VuIgoKSSBtZWFuIHRoYXQgaXQncyBicm9rZW4gaWYgaXQgYWN0dWFsbHkgbmVlZHMgdTY0
IHdoZW4gaXQncwpjdXJyZW50bHkgdXNpbmcgdW5zaWduZWQgbG9uZy4gU28gdTY0IGlzIGVpdGhl
ciBvdmVya2lsbCBvciB0aGUKY29kZSBpcyBjdXJyZW50bHkgYnJva2VuLgoKPiAKPiA+IEkgZG9u
J3QgdGhpbmsgaXQgaXMgbm90IGJyb2tlbiwgY2F1c2UgSSdtIGN1cnJlbnRseSB0ZXN0aW5nIERT
Qy4KPiA+IFRoZSBwYXRjaCBJIHNlbnQgZWFybHkgc2ltcGx5IGZpeGVzIHRoZSBlcnJvciBvZiBj
b21wYXJpbmfCoCBzaWduZWQgYW5kIAo+ID4gdW5zaWduZWQgdmFyaWFibGVzLgo+ID4gCj4gPiBX
ZSBjYW4gdGhlbiBzdWJtaXQgYSBzZWNvbmQgcGF0Y2ggYWRkcmVzc2luZyB0aGUgaXNzdWUgb2Yg
dXNpbmcgdW5zaWduZWQgCj4gPiBsb25nIGludCBpbnN0ZWFkIG9mIHUzMi4gQWxzbywgc2luY2Ug
dGhlIHZhcmlhYmxlcyBpbiBkcm1fZHNjX2NvbmZpZyAKPiA+IHN0cnVjdHVyZSBhcmUgYWxsIG9m
IHR5cGUgdTggYW5kIHUxNiwgdGhlIGNhbGN1bGF0aW9uIHZhbHVlcyBzaG91bGRuJ3QgCj4gPiBl
eGNlZWQgdGhlIHNpemUgb2YgdTMyLgo+ID4gCj4gPiBUaGFua3MKPiA+IAo+ID4+Pgo+ID4+PiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4+PiBGcm9tOiBMaXBza2ksIE1pa2l0YSA8TWlr
aXRhLkxpcHNraUBhbWQuY29tPgo+ID4+PiBTZW50OiBOb3ZlbWJlciAxOSwgMjAxOSAxMDowOCBB
TQo+ID4+PiBUbzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNv
bT47IExpcHNraSwgTWlraXRhIAo+ID4+PiA8TWlraXRhLkxpcHNraUBhbWQuY29tPgo+ID4+PiBD
YzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7IAo+ID4+PiBDb3JuaWosIE5pa29sYSA8Tmlrb2xhLkNvcm5pakBhbWQuY29tPgo+
ID4+PiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vZHNjOiBSZXR1cm4gdW5zaWduZWQgbG9uZyBv
biBjb21wdXRlIG9mZnNldAo+ID4+Pgo+ID4+Pgo+ID4+Pgo+ID4+PiBPbiAxOS8xMS8yMDE5IDA5
OjU2LCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6Cj4gPj4+PiBPbiBUdWUsIE5vdiAxOSwgMjAxOSBh
dCAwOTo0NToyNkFNIC0wNTAwLCBtaWtpdGEubGlwc2tpQGFtZC5jb20gd3JvdGU6Cj4gPj4+Pj4g
RnJvbTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgo+ID4+Pj4+Cj4gPj4+
Pj4gV2Ugc2hvdWxkbid0IGNvbXBhcmUgaW50IHdpdGggdW5zaWduZWQgbG9uZyB0byBmaW5kIHRo
ZSBtYXggdmFsdWUgYW5kCj4gPj4+Pj4gc2luY2Ugd2UgYXJlIG5vdCBleHBlY3RpbmcgbmVnYXRp
dmUgdmFsdWUgcmV0dXJuZWQgZnJvbQo+ID4+Pj4+IGNvbXB1dGVfb2Zmc2V0IHdlIHNob3VsZCBt
YWtlIHRoaXMgZnVuY3Rpb24gcmV0dXJuIHVuc2lnbmVkIGxvbmcgc28KPiA+Pj4+PiB3ZSBjYW4g
Y29tcGFyZSB0aGUgdmFsdWVzIHdoZW4gY29tcHV0aW5nIHJjIHBhcmFtZXRlcnMuCj4gPj4+Pgo+
ID4+Pj4gV2h5IGFyZSB0aGVyZSBvdGhlciB1bnNpZ25lZCBsb25ncyBpbiBkc2MgcGFyYW1ldGVy
IGNvbXB1dGF0aW9uIGluIHRoZQo+ID4+Pj4gZmlyc3QgcGxhY2U/Cj4gPj4+Cj4gPj4+IEkgYmVs
aWV2ZSBpdCB3YXMgaW5pdGlhbGx5IHNldCB0byBiZSB1bnNpZ25lZCBsb25nIGZvciB2YXJpYWJs
ZSAKPiA+Pj4gY29uc2lzdGVuY3ksIHdoZW4gd2UgcG9ydGVkIGludGVsX2NvbXB1dGVfcmNfcGFy
YW1ldGVycyBpbnRvIAo+ID4+PiBkcm1fZHNjX2NvbXB1dGVfcmNfcGFyYW1ldGVycy4gQnV0IG5v
dyB0aGF0IEkgbG9vayBhdCBpdCwgd2UgY2FuIAo+ID4+PiBhY3R1YWxseSBqdXN0IHNldCB0aGVt
IHRvIHUzMiBvciB1NjQsIGFzIG5vdGhpbmcgc2hvdWxkIGV4Y2VlZCB0aGF0Lgo+ID4+Pj4KPiA+
Pj4+Pgo+ID4+Pj4+IENjOiBOaWtvbGEgQ29ybmlqIDxuaWtvbGEuY29ybmlqQGFtZC5jb20+Cj4g
Pj4+Pj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgo+ID4+Pj4+
IFNpZ25lZC1vZmYtYnk6IE1pa2l0YSBMaXBza2kgPG1pa2l0YS5saXBza2lAYW1kLmNvbT4KPiA+
Pj4+PiAtLS0KPiA+Pj4+PiDCoMKgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHNjLmMgfCA2ICsrKy0t
LQo+ID4+Pj4+IMKgwqAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKPiA+Pj4+Pgo+ID4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rz
Yy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kc2MuYwo+ID4+Pj4+IGluZGV4IDc0ZjM1MjdmNTY3
ZC4uZWM0MDYwNGFiNmEyIDEwMDY0NAo+ID4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZHNjLmMKPiA+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RzYy5jCj4gPj4+Pj4gQEAg
LTI0NSwxMSArMjQ1LDExIEBAIHZvaWQgZHJtX2RzY19wcHNfcGF5bG9hZF9wYWNrKHN0cnVjdCAK
PiA+Pj4+PiBkcm1fZHNjX3BpY3R1cmVfcGFyYW1ldGVyX3NldCAqcHBzX3BheWxvYWQsCj4gPj4+
Pj4gwqDCoCB9Cj4gPj4+Pj4gwqDCoCBFWFBPUlRfU1lNQk9MKGRybV9kc2NfcHBzX3BheWxvYWRf
cGFjayk7Cj4gPj4+Pj4gLXN0YXRpYyBpbnQgY29tcHV0ZV9vZmZzZXQoc3RydWN0IGRybV9kc2Nf
Y29uZmlnICp2ZHNjX2NmZywgaW50IAo+ID4+Pj4+IHBpeGVsc19wZXJfZ3JvdXAsCj4gPj4+Pj4g
K3N0YXRpYyB1bnNpZ25lZCBsb25nIGNvbXB1dGVfb2Zmc2V0KHN0cnVjdCBkcm1fZHNjX2NvbmZp
ZyAKPiA+Pj4+PiAqdmRzY19jZmcsIGludCBwaXhlbHNfcGVyX2dyb3VwLAo+ID4+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbnQgZ3JvdXBzX3Blcl9saW5lLCBpbnQg
Z3JwY250KQo+ID4+Pj4+IMKgwqAgewo+ID4+Pj4+IC3CoMKgwqAgaW50IG9mZnNldCA9IDA7Cj4g
Pj4+Pj4gLcKgwqDCoCBpbnQgZ3JwY250X2lkID0gRElWX1JPVU5EX1VQKHZkc2NfY2ZnLT5pbml0
aWFsX3htaXRfZGVsYXksIAo+ID4+Pj4+IHBpeGVsc19wZXJfZ3JvdXApOwo+ID4+Pj4+ICvCoMKg
wqAgdW5zaWduZWQgbG9uZyBvZmZzZXQgPSAwOwo+ID4+Pj4+ICvCoMKgwqAgdW5zaWduZWQgbG9u
ZyBncnBjbnRfaWQgPSAKPiA+Pj4+PiBESVZfUk9VTkRfVVAodmRzY19jZmctPmluaXRpYWxfeG1p
dF9kZWxheSwgcGl4ZWxzX3Blcl9ncm91cCk7Cj4gPj4+Pj4gwqDCoMKgwqDCoMKgIGlmIChncnBj
bnQgPD0gZ3JwY250X2lkKQo+ID4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIG9mZnNldCA9IERJ
Vl9ST1VORF9VUChncnBjbnQgKiBwaXhlbHNfcGVyX2dyb3VwICogCj4gPj4+Pj4gdmRzY19jZmct
PmJpdHNfcGVyX3BpeGVsLCAxNik7Cj4gPj4+Pj4gLS0gCj4gPj4+Pj4gMi4xNy4xCj4gPj4+Pj4K
PiA+Pj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
ID4+Pj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+Pj4+PiBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gPj4+Pj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwKPiA+Pj4+Cj4gPj4+Cj4gPj4+IC0tIAo+ID4+PiBUaGFua3Ms
Cj4gPj4+IE1pa2l0YSBMaXBza2kKPiA+Pj4gU29mdHdhcmUgRW5naW5lZXIgMiwgQU1ECj4gPj4+
IG1pa2l0YS5saXBza2lAYW1kLmNvbQo+ID4+Cj4gPiAKPiAKPiAtLSAKPiBUaGFua3MsCj4gTWlr
aXRhIExpcHNraQo+IFNvZnR3YXJlIEVuZ2luZWVyIDIsIEFNRAo+IG1pa2l0YS5saXBza2lAYW1k
LmNvbQoKLS0gClZpbGxlIFN5cmrDpGzDpApJbnRlbApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
