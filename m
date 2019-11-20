Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E586C1041CB
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 18:11:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CCED6E610;
	Wed, 20 Nov 2019 17:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07E2E6E610;
 Wed, 20 Nov 2019 17:11:43 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Nov 2019 09:11:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,222,1571727600"; d="scan'208";a="237813109"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 20 Nov 2019 09:11:39 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 20 Nov 2019 19:11:38 +0200
Date: Wed, 20 Nov 2019 19:11:38 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/rect: Keep the clipped dst rectangle
 in place
Message-ID: <20191120171138.GI1208@intel.com>
References: <20191120162512.12484-1-ville.syrjala@linux.intel.com>
 <20191120162512.12484-2-ville.syrjala@linux.intel.com>
 <20191120164340.GS30416@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191120164340.GS30416@phenom.ffwll.local>
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
Cc: intel-gfx@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMDU6NDM6NDBQTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBXZWQsIE5vdiAyMCwgMjAxOSBhdCAwNjoyNToxMlBNICswMjAwLCBWaWxsZSBT
eXJqYWxhIHdyb3RlOgo+ID4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxp
bnV4LmludGVsLmNvbT4KPiA+IAo+ID4gTm93IHRoYXQgd2UndmUgY29uc3RyYWluZWQgdGhlIGNs
aXBwZWQgc291cmNlIHJlY3RhbmdsZSBzdWNoCj4gPiB0aGF0IGl0IGNhbid0IGhhdmUgbmVnYXRp
dmUgZGltZW5zaW9ucyBkb2luZyB0aGUgc2FtZSBmb3IgdGhlCj4gPiBkc3QgcmVjdGFuZ2xlIHNl
ZW1zIGFwcHJvcHJpYXRlLiBTaG91bGQgYXQgbGVhc3QgcmVzdWx0IGluCj4gPiB0aGUgY2xpcHBl
ZCBzcmMgYW5kIGRzdCByZWN0YW5nbGVzIGJlaW5nIGEgYml0IG1vcmUgY29uc2lzdGVudAo+ID4g
d2l0aCBlYWNoIG90aGVyLgo+ID4gCj4gPiBDYzogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWlu
LmdhaWduYXJkQHN0LmNvbT4KPiA+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5r
aG9yc3RAbGludXguaW50ZWwuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOk
IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiAKPiBzZWxmdGVzdHMgZm9yIHRoaXMg
c3R1ZmY/IExvb2tzIGxpa2UgdGhlIHByaW1lIGV4YW1wbGUsIHdyaXRlIHRlc3RjYXNlCj4gcHJv
dmluZyBjb2RlIGlzIGJ1c3RlZCwgZml4IGl0LCBldmVyeW9uZSBjZWxlYnJhdGU/CgpZZWFoLCBz
ZWVtcyBsaWtlIGEgZ29vZCBpZGVhLiBUaG91Z2ggSSdsbCBoYXZlIHRvIGZpZ3VyZSBvdXQgaWYg
aXQncwphY3R1YWxseSBicm9rZW4gb3Igbm90IDspCgpIbW0uIE91Y2guIFRoZXJlJ3Mgc2VlbXMg
dG8gYmUgYSBkaXYgYnkgemVybyBsdXJraW5nIGluIHRoZXJlIGlmCmRzdF93L2ggPT0gMC4gSSB3
b25kZXIgd2h5IG5vdGhpbmcgaGFzIGhpdCB0aGF0LgoKPiAtRGFuaWVsCj4gCj4gPiAtLS0KPiA+
ICBkcml2ZXJzL2dwdS9kcm0vZHJtX3JlY3QuYyB8IDIyICsrKysrKysrKysrLS0tLS0tLS0tLS0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4g
PiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3JlY3QuYyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fcmVjdC5jCj4gPiBpbmRleCA3NzYyYjZlOTI3OGQuLjIyOTMyNWZjZjMzMyAx
MDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcmVjdC5jCj4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX3JlY3QuYwo+ID4gQEAgLTUyLDE0ICs1MiwxNCBAQCBib29sIGRybV9y
ZWN0X2ludGVyc2VjdChzdHJ1Y3QgZHJtX3JlY3QgKnIxLCBjb25zdCBzdHJ1Y3QgZHJtX3JlY3Qg
KnIyKQo+ID4gIH0KPiA+ICBFWFBPUlRfU1lNQk9MKGRybV9yZWN0X2ludGVyc2VjdCk7Cj4gPiAg
Cj4gPiAtc3RhdGljIHUzMiBjbGlwX3NjYWxlZCh1MzIgc3JjLCB1MzIgZHN0LCB1MzIgY2xpcCkK
PiA+ICtzdGF0aWMgdTMyIGNsaXBfc2NhbGVkKGludCBzcmMsIGludCBkc3QsIGludCAqY2xpcCkK
PiA+ICB7Cj4gPiAgCXU2NCB0bXA7Cj4gPiAgCj4gPiAgCS8qIE9ubHkgY2xpcCB3aGF0IHdlIGhh
dmUuIEtlZXBzIHRoZSByZXN1bHQgYm91bmRlZCBhcyB3ZWxsLiAqLwo+ID4gLQljbGlwID0gbWlu
KGNsaXAsIGRzdCk7Cj4gPiArCSpjbGlwID0gbWluKCpjbGlwLCBkc3QpOwo+ID4gIAo+ID4gLQl0
bXAgPSBtdWxfdTMyX3UzMihzcmMsIGRzdCAtIGNsaXApOwo+ID4gKwl0bXAgPSBtdWxfdTMyX3Uz
MihzcmMsIGRzdCAtICpjbGlwKTsKPiA+ICAKPiA+ICAJLyoKPiA+ICAJICogUm91bmQgdG93YXJk
IDEuMCB3aGVuIGNsaXBwaW5nIHNvIHRoYXQgd2UgZG9uJ3QgYWNjaWRlbnRhbGx5Cj4gPiBAQCAt
OTIsMzQgKzkyLDM0IEBAIGJvb2wgZHJtX3JlY3RfY2xpcF9zY2FsZWQoc3RydWN0IGRybV9yZWN0
ICpzcmMsIHN0cnVjdCBkcm1fcmVjdCAqZHN0LAo+ID4gIAlkaWZmID0gY2xpcC0+eDEgLSBkc3Qt
PngxOwo+ID4gIAlpZiAoZGlmZiA+IDApIHsKPiA+ICAJCXUzMiBuZXdfc3JjX3cgPSBjbGlwX3Nj
YWxlZChkcm1fcmVjdF93aWR0aChzcmMpLAo+ID4gLQkJCQkJICAgIGRybV9yZWN0X3dpZHRoKGRz
dCksIGRpZmYpOwo+ID4gKwkJCQkJICAgIGRybV9yZWN0X3dpZHRoKGRzdCksICZkaWZmKTsKPiA+
ICAKPiA+ICAJCXNyYy0+eDEgPSBzcmMtPngyIC0gbmV3X3NyY193Owo+ID4gLQkJZHN0LT54MSA9
IGNsaXAtPngxOwo+ID4gKwkJZHN0LT54MSArPSBkaWZmOwo+ID4gIAl9Cj4gPiAgCWRpZmYgPSBj
bGlwLT55MSAtIGRzdC0+eTE7Cj4gPiAgCWlmIChkaWZmID4gMCkgewo+ID4gIAkJdTMyIG5ld19z
cmNfaCA9IGNsaXBfc2NhbGVkKGRybV9yZWN0X2hlaWdodChzcmMpLAo+ID4gLQkJCQkJICAgIGRy
bV9yZWN0X2hlaWdodChkc3QpLCBkaWZmKTsKPiA+ICsJCQkJCSAgICBkcm1fcmVjdF9oZWlnaHQo
ZHN0KSwgJmRpZmYpOwo+ID4gIAo+ID4gIAkJc3JjLT55MSA9IHNyYy0+eTIgLSBuZXdfc3JjX2g7
Cj4gPiAtCQlkc3QtPnkxID0gY2xpcC0+eTE7Cj4gPiArCQlkc3QtPnkxICs9IGRpZmY7Cj4gPiAg
CX0KPiA+ICAJZGlmZiA9IGRzdC0+eDIgLSBjbGlwLT54MjsKPiA+ICAJaWYgKGRpZmYgPiAwKSB7
Cj4gPiAgCQl1MzIgbmV3X3NyY193ID0gY2xpcF9zY2FsZWQoZHJtX3JlY3Rfd2lkdGgoc3JjKSwK
PiA+IC0JCQkJCSAgICBkcm1fcmVjdF93aWR0aChkc3QpLCBkaWZmKTsKPiA+ICsJCQkJCSAgICBk
cm1fcmVjdF93aWR0aChkc3QpLCAmZGlmZik7Cj4gPiAgCj4gPiAgCQlzcmMtPngyID0gc3JjLT54
MSArIG5ld19zcmNfdzsKPiA+IC0JCWRzdC0+eDIgPSBjbGlwLT54MjsKPiA+ICsJCWRzdC0+eDIg
LT0gZGlmZjsKPiA+ICAJfQo+ID4gIAlkaWZmID0gZHN0LT55MiAtIGNsaXAtPnkyOwo+ID4gIAlp
ZiAoZGlmZiA+IDApIHsKPiA+ICAJCXUzMiBuZXdfc3JjX2ggPSBjbGlwX3NjYWxlZChkcm1fcmVj
dF9oZWlnaHQoc3JjKSwKPiA+IC0JCQkJCSAgICBkcm1fcmVjdF9oZWlnaHQoZHN0KSwgZGlmZik7
Cj4gPiArCQkJCQkgICAgZHJtX3JlY3RfaGVpZ2h0KGRzdCksICZkaWZmKTsKPiA+ICAKPiA+ICAJ
CXNyYy0+eTIgPSBzcmMtPnkxICsgbmV3X3NyY19oOwo+ID4gLQkJZHN0LT55MiA9IGNsaXAtPnky
Owo+ID4gKwkJZHN0LT55MiAtPSBkaWZmOwo+ID4gIAl9Cj4gPiAgCj4gPiAgCXJldHVybiBkcm1f
cmVjdF92aXNpYmxlKGRzdCk7Cj4gPiAtLSAKPiA+IDIuMjMuMAo+ID4gCj4gPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gSW50ZWwtZ2Z4IG1haWxp
bmcgbGlzdAo+ID4gSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngKPiAKPiAtLSAK
PiBEYW5pZWwgVmV0dGVyCj4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4g
aHR0cDovL2Jsb2cuZmZ3bGwuY2gKCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
