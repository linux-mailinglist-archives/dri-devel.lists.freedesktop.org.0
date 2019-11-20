Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F911040BB
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 17:25:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 624886E6C3;
	Wed, 20 Nov 2019 16:25:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 643146E894
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 16:25:49 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Nov 2019 08:25:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,222,1571727600"; d="scan'208";a="196910415"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 20 Nov 2019 08:25:45 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 20 Nov 2019 18:25:44 +0200
Date: Wed, 20 Nov 2019 18:25:44 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [PATCH] drm/rect: remove useless call to clamp_t
Message-ID: <20191120162544.GH1208@intel.com>
References: <20191119133435.22525-1-benjamin.gaignard@st.com>
 <20191120152234.GG1208@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191120152234.GG1208@intel.com>
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

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMDU6MjI6MzRQTSArMDIwMCwgVmlsbGUgU3lyasOkbMOk
IHdyb3RlOgo+IE9uIFR1ZSwgTm92IDE5LCAyMDE5IGF0IDAyOjM0OjM1UE0gKzAxMDAsIEJlbmph
bWluIEdhaWduYXJkIHdyb3RlOgo+ID4gQ2xhbXBpbmcgYSB2YWx1ZSBiZXR3ZWVuIElOVF9NSU4g
YW5kIElOVF9NQVggYWx3YXlzIHJldHVybiB0aGUgdmFsdWUgaXRzZWxmCj4gPiBhbmQgZ2VuZXJh
dGUgd2FybmluZ3Mgd2hlbiBjb21waWxpbmcgd2l0aCBXPTEuCj4gPiAKPiA+IFNpZ25lZC1vZmYt
Ynk6IEJlbmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBzdC5jb20+Cj4gPiAtLS0K
PiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX3JlY3QuYyB8IDggKysrKy0tLS0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9yZWN0LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3Jl
Y3QuYwo+ID4gaW5kZXggYjgzNjNhYWE5MDMyLi42ODFmMWZkMDkzNTcgMTAwNjQ0Cj4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX3JlY3QuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9yZWN0LmMKPiA+IEBAIC04OSw3ICs4OSw3IEBAIGJvb2wgZHJtX3JlY3RfY2xpcF9zY2FsZWQo
c3RydWN0IGRybV9yZWN0ICpzcmMsIHN0cnVjdCBkcm1fcmVjdCAqZHN0LAo+ID4gIAkJdTMyIG5l
d19zcmNfdyA9IGNsaXBfc2NhbGVkKGRybV9yZWN0X3dpZHRoKHNyYyksCj4gPiAgCQkJCQkgICAg
ZHJtX3JlY3Rfd2lkdGgoZHN0KSwgZGlmZik7Cj4gCj4gSG1tLiBJIHRoaW5rIHdlIGJvcmtlZCB0
aGlzIGEgYml0IHdoZW4gaW50cm9kdWNpbmcgY2xpcF9zY2FsZWQoKS4KPiAnZGlmZicgY2FuIGV4
Y2VlZCBkc3Qgd2lkdGggaGVyZSBzbyBjbGlwX3NjYWxlZCgpIHNob3VsZCBiZSBhYmxlIHRvCj4g
cmV0dXJuIGEgbmVnYXRpdmUgdmFsdWUuCj4gCj4gUHJvYmFibHkgd2Ugc2hvdWxkIG1ha2UgdGhp
cyBtb3JlIGNvbnNpc3RlbnQgYW5kIGRvIHNvbWV0aGluZyBsaWtlOgo+ICAgICAgICAgZGlmZiA9
IGNsaXAtPngxIC0gZHN0LT54MTsKPiAgICAgICAgIGlmIChkaWZmID4gMCkgewo+IC0gICAgICAg
ICAgICAgICB1MzIgbmV3X3NyY193ID0gY2xpcF9zY2FsZWQoZHJtX3JlY3Rfd2lkdGgoc3JjKSwK
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRybV9yZWN0X3dp
ZHRoKGRzdCksIGRpZmYpOwo+ICsgICAgICAgICAgICAgICBpbnQgZHN0X3csIG5ld19zcmNfdzsK
PiAgCj4gLSAgICAgICAgICAgICAgIHNyYy0+eDEgPSBjbGFtcF90KGludDY0X3QsIHNyYy0+eDIg
LSBuZXdfc3JjX3csIElOVF9NSU4sIElOVF9NQVgpOwo+IC0gICAgICAgICAgICAgICBkc3QtPngx
ID0gY2xpcC0+eDE7Cj4gKyAgICAgICAgICAgICAgIGRzdF93ID0gZHJtX3JlY3Rfd2lkdGgoZHN0
KTsKPiArICAgICAgICAgICAgICAgZGlmZiA9IG1pbihkaWZmLCBkc3Rfdyk7Cj4gKyAgICAgICAg
ICAgICAgIG5ld19zcmNfdyA9IGNsaXBfc2NhbGVkKGRybV9yZWN0X3dpZHRoKHNyYyksIGRzdF93
LCBkaWZmKTsKPiArCj4gKyAgICAgICAgICAgICAgIHNyYy0+eDEgPSBzcmMtPngyIC0gbmV3X3Ny
Y193Owo+ICsgICAgICAgICAgICAgICBkc3QtPngxICs9IGRpZmY7Cj4gICAgICAgICB9Cj4gCj4g
ZXRjLgoKSSB0cmllZCB0byByZWZpbmUgdGhhdCBhIGJpdCBtb3JlIGFuZCBzZW50IGl0IG91dCBh
cyB0d28gcGF0Y2hlcy4KCj4gCj4gPiAgCj4gPiAtCQlzcmMtPngxID0gY2xhbXBfdChpbnQ2NF90
LCBzcmMtPngyIC0gbmV3X3NyY193LCBJTlRfTUlOLCBJTlRfTUFYKTsKPiA+ICsJCXNyYy0+eDEg
PSBzcmMtPngyIC0gbmV3X3NyY193Owo+ID4gIAkJZHN0LT54MSA9IGNsaXAtPngxOwo+ID4gIAl9
Cj4gPiAgCWRpZmYgPSBjbGlwLT55MSAtIGRzdC0+eTE7Cj4gPiBAQCAtOTcsNyArOTcsNyBAQCBi
b29sIGRybV9yZWN0X2NsaXBfc2NhbGVkKHN0cnVjdCBkcm1fcmVjdCAqc3JjLCBzdHJ1Y3QgZHJt
X3JlY3QgKmRzdCwKPiA+ICAJCXUzMiBuZXdfc3JjX2ggPSBjbGlwX3NjYWxlZChkcm1fcmVjdF9o
ZWlnaHQoc3JjKSwKPiA+ICAJCQkJCSAgICBkcm1fcmVjdF9oZWlnaHQoZHN0KSwgZGlmZik7Cj4g
PiAgCj4gPiAtCQlzcmMtPnkxID0gY2xhbXBfdChpbnQ2NF90LCBzcmMtPnkyIC0gbmV3X3NyY19o
LCBJTlRfTUlOLCBJTlRfTUFYKTsKPiA+ICsJCXNyYy0+eTEgPSBzcmMtPnkyIC0gbmV3X3NyY19o
Owo+ID4gIAkJZHN0LT55MSA9IGNsaXAtPnkxOwo+ID4gIAl9Cj4gPiAgCWRpZmYgPSBkc3QtPngy
IC0gY2xpcC0+eDI7Cj4gPiBAQCAtMTA1LDcgKzEwNSw3IEBAIGJvb2wgZHJtX3JlY3RfY2xpcF9z
Y2FsZWQoc3RydWN0IGRybV9yZWN0ICpzcmMsIHN0cnVjdCBkcm1fcmVjdCAqZHN0LAo+ID4gIAkJ
dTMyIG5ld19zcmNfdyA9IGNsaXBfc2NhbGVkKGRybV9yZWN0X3dpZHRoKHNyYyksCj4gPiAgCQkJ
CQkgICAgZHJtX3JlY3Rfd2lkdGgoZHN0KSwgZGlmZik7Cj4gPiAgCj4gPiAtCQlzcmMtPngyID0g
Y2xhbXBfdChpbnQ2NF90LCBzcmMtPngxICsgbmV3X3NyY193LCBJTlRfTUlOLCBJTlRfTUFYKTsK
PiA+ICsJCXNyYy0+eDIgPSBzcmMtPngxICsgbmV3X3NyY193Owo+ID4gIAkJZHN0LT54MiA9IGNs
aXAtPngyOwo+ID4gIAl9Cj4gPiAgCWRpZmYgPSBkc3QtPnkyIC0gY2xpcC0+eTI7Cj4gPiBAQCAt
MTEzLDcgKzExMyw3IEBAIGJvb2wgZHJtX3JlY3RfY2xpcF9zY2FsZWQoc3RydWN0IGRybV9yZWN0
ICpzcmMsIHN0cnVjdCBkcm1fcmVjdCAqZHN0LAo+ID4gIAkJdTMyIG5ld19zcmNfaCA9IGNsaXBf
c2NhbGVkKGRybV9yZWN0X2hlaWdodChzcmMpLAo+ID4gIAkJCQkJICAgIGRybV9yZWN0X2hlaWdo
dChkc3QpLCBkaWZmKTsKPiA+ICAKPiA+IC0JCXNyYy0+eTIgPSBjbGFtcF90KGludDY0X3QsIHNy
Yy0+eTEgKyBuZXdfc3JjX2gsIElOVF9NSU4sIElOVF9NQVgpOwo+ID4gKwkJc3JjLT55MiA9IHNy
Yy0+eTEgKyBuZXdfc3JjX2g7Cj4gPiAgCQlkc3QtPnkyID0gY2xpcC0+eTI7Cj4gPiAgCX0KPiA+
ICAKPiA+IC0tIAo+ID4gMi4xNS4wCj4gPiAKPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+IAo+IC0tIAo+IFZpbGxlIFN5cmrDpGzD
pAo+IEludGVsCgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
