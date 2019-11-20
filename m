Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C78A103E33
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 16:22:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F41C6E796;
	Wed, 20 Nov 2019 15:22:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBAAE6E796
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 15:22:38 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Nov 2019 07:22:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,222,1571727600"; d="scan'208";a="204848878"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 20 Nov 2019 07:22:35 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 20 Nov 2019 17:22:34 +0200
Date: Wed, 20 Nov 2019 17:22:34 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [PATCH] drm/rect: remove useless call to clamp_t
Message-ID: <20191120152234.GG1208@intel.com>
References: <20191119133435.22525-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191119133435.22525-1-benjamin.gaignard@st.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTksIDIwMTkgYXQgMDI6MzQ6MzVQTSArMDEwMCwgQmVuamFtaW4gR2FpZ25h
cmQgd3JvdGU6Cj4gQ2xhbXBpbmcgYSB2YWx1ZSBiZXR3ZWVuIElOVF9NSU4gYW5kIElOVF9NQVgg
YWx3YXlzIHJldHVybiB0aGUgdmFsdWUgaXRzZWxmCj4gYW5kIGdlbmVyYXRlIHdhcm5pbmdzIHdo
ZW4gY29tcGlsaW5nIHdpdGggVz0xLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJlbmphbWluIEdhaWdu
YXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBzdC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9k
cm1fcmVjdC5jIHwgOCArKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3Jl
Y3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcmVjdC5jCj4gaW5kZXggYjgzNjNhYWE5MDMyLi42
ODFmMWZkMDkzNTcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9yZWN0LmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3JlY3QuYwo+IEBAIC04OSw3ICs4OSw3IEBAIGJvb2wg
ZHJtX3JlY3RfY2xpcF9zY2FsZWQoc3RydWN0IGRybV9yZWN0ICpzcmMsIHN0cnVjdCBkcm1fcmVj
dCAqZHN0LAo+ICAJCXUzMiBuZXdfc3JjX3cgPSBjbGlwX3NjYWxlZChkcm1fcmVjdF93aWR0aChz
cmMpLAo+ICAJCQkJCSAgICBkcm1fcmVjdF93aWR0aChkc3QpLCBkaWZmKTsKCkhtbS4gSSB0aGlu
ayB3ZSBib3JrZWQgdGhpcyBhIGJpdCB3aGVuIGludHJvZHVjaW5nIGNsaXBfc2NhbGVkKCkuCidk
aWZmJyBjYW4gZXhjZWVkIGRzdCB3aWR0aCBoZXJlIHNvIGNsaXBfc2NhbGVkKCkgc2hvdWxkIGJl
IGFibGUgdG8KcmV0dXJuIGEgbmVnYXRpdmUgdmFsdWUuCgpQcm9iYWJseSB3ZSBzaG91bGQgbWFr
ZSB0aGlzIG1vcmUgY29uc2lzdGVudCBhbmQgZG8gc29tZXRoaW5nIGxpa2U6CiAgICAgICAgZGlm
ZiA9IGNsaXAtPngxIC0gZHN0LT54MTsKICAgICAgICBpZiAoZGlmZiA+IDApIHsKLSAgICAgICAg
ICAgICAgIHUzMiBuZXdfc3JjX3cgPSBjbGlwX3NjYWxlZChkcm1fcmVjdF93aWR0aChzcmMpLAot
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRybV9yZWN0X3dpZHRo
KGRzdCksIGRpZmYpOworICAgICAgICAgICAgICAgaW50IGRzdF93LCBuZXdfc3JjX3c7CiAKLSAg
ICAgICAgICAgICAgIHNyYy0+eDEgPSBjbGFtcF90KGludDY0X3QsIHNyYy0+eDIgLSBuZXdfc3Jj
X3csIElOVF9NSU4sIElOVF9NQVgpOwotICAgICAgICAgICAgICAgZHN0LT54MSA9IGNsaXAtPngx
OworICAgICAgICAgICAgICAgZHN0X3cgPSBkcm1fcmVjdF93aWR0aChkc3QpOworICAgICAgICAg
ICAgICAgZGlmZiA9IG1pbihkaWZmLCBkc3Rfdyk7CisgICAgICAgICAgICAgICBuZXdfc3JjX3cg
PSBjbGlwX3NjYWxlZChkcm1fcmVjdF93aWR0aChzcmMpLCBkc3RfdywgZGlmZik7CisKKyAgICAg
ICAgICAgICAgIHNyYy0+eDEgPSBzcmMtPngyIC0gbmV3X3NyY193OworICAgICAgICAgICAgICAg
ZHN0LT54MSArPSBkaWZmOwogICAgICAgIH0KCmV0Yy4KCj4gIAo+IC0JCXNyYy0+eDEgPSBjbGFt
cF90KGludDY0X3QsIHNyYy0+eDIgLSBuZXdfc3JjX3csIElOVF9NSU4sIElOVF9NQVgpOwo+ICsJ
CXNyYy0+eDEgPSBzcmMtPngyIC0gbmV3X3NyY193Owo+ICAJCWRzdC0+eDEgPSBjbGlwLT54MTsK
PiAgCX0KPiAgCWRpZmYgPSBjbGlwLT55MSAtIGRzdC0+eTE7Cj4gQEAgLTk3LDcgKzk3LDcgQEAg
Ym9vbCBkcm1fcmVjdF9jbGlwX3NjYWxlZChzdHJ1Y3QgZHJtX3JlY3QgKnNyYywgc3RydWN0IGRy
bV9yZWN0ICpkc3QsCj4gIAkJdTMyIG5ld19zcmNfaCA9IGNsaXBfc2NhbGVkKGRybV9yZWN0X2hl
aWdodChzcmMpLAo+ICAJCQkJCSAgICBkcm1fcmVjdF9oZWlnaHQoZHN0KSwgZGlmZik7Cj4gIAo+
IC0JCXNyYy0+eTEgPSBjbGFtcF90KGludDY0X3QsIHNyYy0+eTIgLSBuZXdfc3JjX2gsIElOVF9N
SU4sIElOVF9NQVgpOwo+ICsJCXNyYy0+eTEgPSBzcmMtPnkyIC0gbmV3X3NyY19oOwo+ICAJCWRz
dC0+eTEgPSBjbGlwLT55MTsKPiAgCX0KPiAgCWRpZmYgPSBkc3QtPngyIC0gY2xpcC0+eDI7Cj4g
QEAgLTEwNSw3ICsxMDUsNyBAQCBib29sIGRybV9yZWN0X2NsaXBfc2NhbGVkKHN0cnVjdCBkcm1f
cmVjdCAqc3JjLCBzdHJ1Y3QgZHJtX3JlY3QgKmRzdCwKPiAgCQl1MzIgbmV3X3NyY193ID0gY2xp
cF9zY2FsZWQoZHJtX3JlY3Rfd2lkdGgoc3JjKSwKPiAgCQkJCQkgICAgZHJtX3JlY3Rfd2lkdGgo
ZHN0KSwgZGlmZik7Cj4gIAo+IC0JCXNyYy0+eDIgPSBjbGFtcF90KGludDY0X3QsIHNyYy0+eDEg
KyBuZXdfc3JjX3csIElOVF9NSU4sIElOVF9NQVgpOwo+ICsJCXNyYy0+eDIgPSBzcmMtPngxICsg
bmV3X3NyY193Owo+ICAJCWRzdC0+eDIgPSBjbGlwLT54MjsKPiAgCX0KPiAgCWRpZmYgPSBkc3Qt
PnkyIC0gY2xpcC0+eTI7Cj4gQEAgLTExMyw3ICsxMTMsNyBAQCBib29sIGRybV9yZWN0X2NsaXBf
c2NhbGVkKHN0cnVjdCBkcm1fcmVjdCAqc3JjLCBzdHJ1Y3QgZHJtX3JlY3QgKmRzdCwKPiAgCQl1
MzIgbmV3X3NyY19oID0gY2xpcF9zY2FsZWQoZHJtX3JlY3RfaGVpZ2h0KHNyYyksCj4gIAkJCQkJ
ICAgIGRybV9yZWN0X2hlaWdodChkc3QpLCBkaWZmKTsKPiAgCj4gLQkJc3JjLT55MiA9IGNsYW1w
X3QoaW50NjRfdCwgc3JjLT55MSArIG5ld19zcmNfaCwgSU5UX01JTiwgSU5UX01BWCk7Cj4gKwkJ
c3JjLT55MiA9IHNyYy0+eTEgKyBuZXdfc3JjX2g7Cj4gIAkJZHN0LT55MiA9IGNsaXAtPnkyOwo+
ICAJfQo+ICAKPiAtLSAKPiAyLjE1LjAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
