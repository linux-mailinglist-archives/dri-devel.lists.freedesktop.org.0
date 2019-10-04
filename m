Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8D8CBA60
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 14:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 781866E2F3;
	Fri,  4 Oct 2019 12:27:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B56E6E2F3
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 12:27:52 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Oct 2019 05:27:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,256,1566889200"; d="scan'208";a="205842974"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 04 Oct 2019 05:27:47 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 04 Oct 2019 15:27:47 +0300
Date: Fri, 4 Oct 2019 15:27:47 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: Re: [PATCH] drm: atomic helper: fix W=1 warnings
Message-ID: <20191004122747.GT1208@intel.com>
References: <20190909135205.10277-1-benjamin.gaignard@st.com>
 <20190909135205.10277-2-benjamin.gaignard@st.com>
 <20191003142738.GM1208@intel.com>
 <CA+M3ks4FBAgCRDDHZ=x7kvQ1Y=0dBdj4+KLO2djh__hW+L=3gQ@mail.gmail.com>
 <20191003150526.GN1208@intel.com>
 <CA+M3ks7-SNusVJsiHqrmy4AN+_OO5e1X=ZRN16Hj6f-V3GnVow@mail.gmail.com>
 <20191003154627.GQ1208@intel.com>
 <CA+M3ks4gpDdZTPdBYRd=CrwgEYiSWJbXqvtPb-0KpW1BhzvmEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+M3ks4gpDdZTPdBYRd=CrwgEYiSWJbXqvtPb-0KpW1BhzvmEQ@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Benjamin Gaignard <benjamin.gaignard@st.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMDQsIDIwMTkgYXQgMTI6NDg6MDJQTSArMDIwMCwgQmVuamFtaW4gR2FpZ25h
cmQgd3JvdGU6Cj4gTGUgamV1LiAzIG9jdC4gMjAxOSDDoCAxNzo0NiwgVmlsbGUgU3lyasOkbMOk
Cj4gPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPiBhIMOpY3JpdCA6Cj4gPgo+ID4gT24g
VGh1LCBPY3QgMDMsIDIwMTkgYXQgMDU6Mzc6MTVQTSArMDIwMCwgQmVuamFtaW4gR2FpZ25hcmQg
d3JvdGU6Cj4gPiA+IExlIGpldS4gMyBvY3QuIDIwMTkgw6AgMTc6MDUsIFZpbGxlIFN5cmrDpGzD
pAo+ID4gPiA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+IGEgw6ljcml0IDoKPiA+ID4g
Pgo+ID4gPiA+IE9uIFRodSwgT2N0IDAzLCAyMDE5IGF0IDA0OjQ2OjU0UE0gKzAyMDAsIEJlbmph
bWluIEdhaWduYXJkIHdyb3RlOgo+ID4gPiA+ID4gTGUgamV1LiAzIG9jdC4gMjAxOSDDoCAxNjoy
NywgVmlsbGUgU3lyasOkbMOkCj4gPiA+ID4gPiA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5j
b20+IGEgw6ljcml0IDoKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gT24gTW9uLCBTZXAgMDksIDIw
MTkgYXQgMDM6NTI6MDVQTSArMDIwMCwgQmVuamFtaW4gR2FpZ25hcmQgd3JvdGU6Cj4gPiA+ID4g
PiA+ID4gRml4IHdhcm5pbmdzIHdpdGggVz0xLgo+ID4gPiA+ID4gPiA+IEZldyBmb3JfZWFjaCBt
YWNybyBzZXQgdmFyaWFibGVzIHRoYXQgYXJlIG5ldmVyIHVzZWQgbGF0ZXIuCj4gPiA+ID4gPiA+
ID4gUHJldmVudCB3YXJuaW5nIGJ5IG1hcmtpbmcgdGhlc2UgdmFyaWFibGVzIGFzIF9fbWF5YmVf
dW51c2VkLgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQmVuamFt
aW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQHN0LmNvbT4KPiA+ID4gPiA+ID4gPiAtLS0K
PiA+ID4gPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmMgfCAzNiAr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0KPiA+ID4gPiA+ID4gPiAgMSBmaWxl
IGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQo+ID4gPiA+ID4gPiA+
Cj4gPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hl
bHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmMKPiA+ID4gPiA+ID4g
PiBpbmRleCBhYTE2ZWExN2ZmOWIuLmI2OWQxN2IwYjliZCAxMDA2NDQKPiA+ID4gPiA+ID4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYwo+ID4gPiA+ID4gPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5jCj4gPiA+ID4gPiA+ID4gQEAg
LTI2Miw3ICsyNjIsNyBAQCBzdGVhbF9lbmNvZGVyKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpz
dGF0ZSwKPiA+ID4gPiA+ID4gPiAgICAgICAgICAgICBzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29k
ZXIpCj4gPiA+ID4gPiA+ID4gIHsKPiA+ID4gPiA+ID4gPiAgICAgICBzdHJ1Y3QgZHJtX2NydGNf
c3RhdGUgKmNydGNfc3RhdGU7Cj4gPiA+ID4gPiA+ID4gLSAgICAgc3RydWN0IGRybV9jb25uZWN0
b3IgKmNvbm5lY3RvcjsKPiA+ID4gPiA+ID4gPiArICAgICBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciBf
X21heWJlX3VudXNlZCAqY29ubmVjdG9yOwo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBSYXRoZXIg
dWdseS4gSU1PIHdvdWxkIGJlIG5pY2VyIGlmIHdlIGNvdWxkIGhpZGUgc29tZXRoaW5nIGluc2lk
ZQo+ID4gPiA+ID4gPiB0aGUgaXRlcmF0b3IgbWFjcm9zIHRvIHN1cHByZXNzIHRoZSB3YXJuaW5n
Lgo+ID4gPiA+ID4KPiA+ID4gPiA+IE9rIGJ1dCBob3cgPwo+ID4gPiA+ID4gY29ubmVjdG9yIGlz
IGFzc2lnbmVkIGluIHRoZSBtYWNyb3MgYnV0IG5vdCB1c2VkIGxhdGVyIGFuZCB3ZSBjYW4ndAo+
ID4gPiA+ID4gc2V0ICJfX21heWJlX3VudXNlZCIKPiA+ID4gPiA+IGluIHRoZSBtYWNyby4KPiA+
ID4gPiA+IERvZXMgYW5vdGhlciBrZXl3b3JkIGV4aXN0IGZvciB0aGF0ID8KPiA+ID4gPgo+ID4g
PiA+IFN0aWNrIGEgKHZvaWQpKGNvbm5lY3RvcikgaW50byB0aGUgbWFjcm8/Cj4gPiA+Cj4gPiA+
IFRoYXQgY291bGQgd29yayBidXQgaXQgd2lsbCBsb29rIHN0cmFuZ2UgaW5zaWRlIHRoZSBtYWNy
by4KPiA+ID4KPiA+ID4gPgo+ID4gPiA+IEFub3RoZXIgKGFyZ3VhYmx5IGNsZWFuZXIpIGlkZWEg
d291bGQgYmUgdG8gcmVtb3ZlIHRoZSBjb25uZWN0b3IvY3J0Yy9wbGFuZQo+ID4gPiA+IGFyZ3Vt
ZW50IGZyb20gdGhlIGl0ZXJhdG9ycyBlbnRpcmVseSBzaW5jZSBpdCdzIHJlZHVuZGFudCwgYW5k
IGluc3RlYWQganVzdAo+ID4gPiA+IGV4dHJhY3QgaXQgZnJvbSB0aGUgYXBwcm9wcmlhdGUgbmV3
L29sZCBzdGF0ZSBhcyBuZWVkZWQuCj4gPiA+ID4KPiA+ID4gPiBXZSBjb3VsZCB0aGVuIGFsc28g
YWRkIGEgZm9yX2VhY2hfY29ubmVjdG9yX2luX3N0YXRlKCkvZXRjLiB3aGljaCBvbWl0Cj4gPiA+
ID4gcyB0aGUgc3RhdGUgYXJndW1lbnRzIGFuZCBqdXN0IGhhcyB0aGUgY29ubmVjdG9yIGFyZ3Vt
ZW50LCBmb3IgY2FzZXMgd2hlcmUKPiA+ID4gPiB5b3UgZG9uJ3QgY2FyZSBhYm91dCB0aGUgc3Rh
dGVzIHdoZW4gaXRlcmF0aW5nLgo+ID4gPgo+ID4gPiBUaGF0IG1heSBsZWFkIHRvIGdldCBhIG1h
Y3JvIGZvciBlYWNoIHBvc3NpYmxlIGNvbWJpbmF0aW9uIG9mIHVzZWQgdmFyaWFibGVzLgo+ID4K
PiA+IFdlIGFscmVhZHkgaGF2ZSBuZXcvb2xkL29sZG5ldywgc28gd291bGQgImp1c3QiIGFkZCBv
bmUgbW9yZS4KPiAKPiBOb3QganVzdCBvbmUsIGl0IHdpbGwgYmUgb25lIGVhY2ggbmV3L29sZC9v
bGRuZXcgbWFjcm8gdG8gYmUgYWJsZSB0byBkaXN0aW5ndWlzaAo+IHdoZW4gY29ubmVjdG9yIGlz
IHVzZWQgb3Igbm90LgoKV2hhdCBJJ20gc3VnZ2VzdGluZyBpcyB0aGlzOgpmb3JfZWFjaF9jb25u
ZWN0b3JfaW5fc3RhdGUoc3RhdGUsIGNvbm5lY3RvciwgaSkKZm9yX2VhY2hfb2xkX2Nvbm5lY3Rv
cl9pbl9zdGF0ZShzdGF0ZSwgb2xkX2Nvbm5fc3RhdGUsIGkpCmZvcl9lYWNoX25ld19jb25uZWN0
b3JfaW5fc3RhdGUoc3RhdGUsIG5ld19jb25uX3N0YXRlLCBpKQpmb3JfZWFjaF9vbGRuZXdfY29u
bmVjdG9yX2luX3N0YXRlKHN0YXRlLCBvbGRfY29ubl9zdGF0ZSwgbmV3X2Nvbm5fc3RhdGUsIGkp
CgpTbyBvbmx5IGZvdXIgaW4gdG90YWwgZm9yIGVhY2ggb2JqZWN0IHR5cGUsIGluc3RlYWQgb2Yg
dGhlIGN1cnJlbnQKdGhyZWUuCgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
