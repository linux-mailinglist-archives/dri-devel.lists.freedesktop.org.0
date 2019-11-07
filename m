Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 834FEF33A1
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 16:43:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B79BE6E4AA;
	Thu,  7 Nov 2019 15:43:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AAC96E4AA;
 Thu,  7 Nov 2019 15:43:09 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Nov 2019 07:43:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,278,1569308400"; d="scan'208";a="286023194"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 07 Nov 2019 07:43:04 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 07 Nov 2019 17:43:04 +0200
Date: Thu, 7 Nov 2019 17:43:04 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
Subject: Re: [PATCH 01/12] drm: Inline drm_color_lut_extract()
Message-ID: <20191107154304.GD1208@intel.com>
References: <20191107151725.10507-1-ville.syrjala@linux.intel.com>
 <20191107151725.10507-2-ville.syrjala@linux.intel.com>
 <79b85116-1a88-5a2d-a1ea-46836a67bfa2@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <79b85116-1a88-5a2d-a1ea-46836a67bfa2@amd.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Swati Sharma <swati2.sharma@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMDM6MzE6MjhQTSArMDAwMCwgS2F6bGF1c2thcywgTmlj
aG9sYXMgd3JvdGU6Cj4gT24gMjAxOS0xMS0wNyAxMDoxNyBhLm0uLCBWaWxsZSBTeXJqYWxhIHdy
b3RlOgo+ID4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVs
LmNvbT4KPiA+IAo+ID4gVGhpcyB0aGluZyBjYW4gZ2V0IGNhbGxlZCBzZXZlcmFsIHRob3VzYW5k
IHRpbWVzIHBlciBMVVQKPiA+IHNvIHNlZW1zIGxpa2Ugd2Ugd2FudCB0byBpbmxpbmUgaXQgdG86
Cj4gPiAtIGF2b2lkIHRoZSBmdW5jdGlvbiBjYWxsIG92ZXJoZWFkCj4gPiAtIGFsbG93IGNvbnN0
YW50IGZvbGRpbmcKPiA+IAo+ID4gQSBxdWljayBzeW50aGV0aWMgdGVzdCAody9vIGFueSBoYXJk
d2FyZSBpbnRlcmFjdGlvbikgd2l0aAo+ID4gYSByaWRpY3Vsb3VzbHkgbGFyZ2UgTFVUIHNpemUg
c2hvd3MgYWJvdXQgNTAlIHJlZHVjdGlvbiBpbgo+ID4gcnVudGltZSBvbiBteSBIU1cgYW5kIEJT
VyBib3hlcy4gU2xpZ2h0bHkgbGVzcyB3aXRoIG1vcmUKPiA+IHJlYXNvbmFibGUgTFVUIHNpemUg
YnV0IHN0aWxsIGVhc2lseSBtZWFzdXJhYmxlIGluIHRlbnMKPiA+IG9mIG1pY3Jvc2Vjb25kcy4K
PiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxp
bnV4LmludGVsLmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmlj
aG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgo+IAo+IFNlZW1zIHJlYXNvbmFibGUgdG8gbWUuIEl0
IHdvdWxkIHByb2JhYmx5IG1ha2Ugc2Vuc2UgdG8gZXZlbiBzcGxpdCB0aGlzIAo+IGZ1cnRoZXIg
aW50byB0d28gZnVuY3Rpb25zLCBvbmUgZm9yIGhpZ2ggcHJlY2lzaW9uIGFuZCBvbmUgZm9yIGxv
dyAKPiBwcmVjaXNpb24gc28gaXQncyBwdXJlbHkgYSBjYWxjdWxhdGlvbiBhbmQgbm90IGhpdHRp
bmcgYW55IGJyYW5jaGVzLgoKQ29uc3RhbnQgZm9sZGluZyBnZXRzIHJpZCBvZiBpdC4KCj4gCj4g
TmljaG9sYXMgS2F6bGF1c2thcwo+IAo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1f
Y29sb3JfbWdtdC5jIHwgMjQgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiAgIGluY2x1ZGUv
ZHJtL2RybV9jb2xvcl9tZ210LmggICAgIHwgMjMgKysrKysrKysrKysrKysrKysrKysrKy0KPiA+
ICAgMiBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAyNSBkZWxldGlvbnMoLSkKPiA+
IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3JfbWdtdC5jIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9jb2xvcl9tZ210LmMKPiA+IGluZGV4IDRjZTVjNmQ4ZGU5OS4uMTlj
NWY2MzU5OTJhIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9jb2xvcl9tZ210
LmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3JfbWdtdC5jCj4gPiBAQCAtMTA4
LDMwICsxMDgsNiBAQAo+ID4gICAgKiAJc3RhbmRhcmQgZW51bSB2YWx1ZXMgc3VwcG9ydGVkIGJ5
IHRoZSBEUk0gcGxhbmUuCj4gPiAgICAqLwo+ID4gICAKPiA+IC0vKioKPiA+IC0gKiBkcm1fY29s
b3JfbHV0X2V4dHJhY3QgLSBjbGFtcCBhbmQgcm91bmQgTFVUIGVudHJpZXMKPiA+IC0gKiBAdXNl
cl9pbnB1dDogaW5wdXQgdmFsdWUKPiA+IC0gKiBAYml0X3ByZWNpc2lvbjogbnVtYmVyIG9mIGJp
dHMgdGhlIGh3IExVVCBzdXBwb3J0cwo+ID4gLSAqCj4gPiAtICogRXh0cmFjdCBhIGRlZ2FtbWEv
Z2FtbWEgTFVUIHZhbHVlIHByb3ZpZGVkIGJ5IHVzZXIgKGluIHRoZSBmb3JtIG9mCj4gPiAtICog
JmRybV9jb2xvcl9sdXQgZW50cmllcykgYW5kIHJvdW5kIGl0IHRvIHRoZSBwcmVjaXNpb24gc3Vw
cG9ydGVkIGJ5IHRoZQo+ID4gLSAqIGhhcmR3YXJlLgo+ID4gLSAqLwo+ID4gLXVpbnQzMl90IGRy
bV9jb2xvcl9sdXRfZXh0cmFjdCh1aW50MzJfdCB1c2VyX2lucHV0LCB1aW50MzJfdCBiaXRfcHJl
Y2lzaW9uKQo+ID4gLXsKPiA+IC0JdWludDMyX3QgdmFsID0gdXNlcl9pbnB1dDsKPiA+IC0JdWlu
dDMyX3QgbWF4ID0gMHhmZmZmID4+ICgxNiAtIGJpdF9wcmVjaXNpb24pOwo+ID4gLQo+ID4gLQkv
KiBSb3VuZCBvbmx5IGlmIHdlJ3JlIG5vdCB1c2luZyBmdWxsIHByZWNpc2lvbi4gKi8KPiA+IC0J
aWYgKGJpdF9wcmVjaXNpb24gPCAxNikgewo+ID4gLQkJdmFsICs9IDFVTCA8PCAoMTYgLSBiaXRf
cHJlY2lzaW9uIC0gMSk7Cj4gPiAtCQl2YWwgPj49IDE2IC0gYml0X3ByZWNpc2lvbjsKPiA+IC0J
fQo+ID4gLQo+ID4gLQlyZXR1cm4gY2xhbXBfdmFsKHZhbCwgMCwgbWF4KTsKPiA+IC19Cj4gPiAt
RVhQT1JUX1NZTUJPTChkcm1fY29sb3JfbHV0X2V4dHJhY3QpOwo+ID4gLQo+ID4gICAvKioKPiA+
ICAgICogZHJtX2NydGNfZW5hYmxlX2NvbG9yX21nbXQgLSBlbmFibGUgY29sb3IgbWFuYWdlbWVu
dCBwcm9wZXJ0aWVzCj4gPiAgICAqIEBjcnRjOiBEUk0gQ1JUQwo+ID4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvZHJtL2RybV9jb2xvcl9tZ210LmggYi9pbmNsdWRlL2RybS9kcm1fY29sb3JfbWdtdC5o
Cj4gPiBpbmRleCBkMWM2NjJkOTJhYjcuLjA2OWIyMWQ2MTg3MSAxMDA2NDQKPiA+IC0tLSBhL2lu
Y2x1ZGUvZHJtL2RybV9jb2xvcl9tZ210LmgKPiA+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9jb2xv
cl9tZ210LmgKPiA+IEBAIC0yOSw3ICsyOSwyOCBAQAo+ID4gICBzdHJ1Y3QgZHJtX2NydGM7Cj4g
PiAgIHN0cnVjdCBkcm1fcGxhbmU7Cj4gPiAgIAo+ID4gLXVpbnQzMl90IGRybV9jb2xvcl9sdXRf
ZXh0cmFjdCh1aW50MzJfdCB1c2VyX2lucHV0LCB1aW50MzJfdCBiaXRfcHJlY2lzaW9uKTsKPiA+
ICsvKioKPiA+ICsgKiBkcm1fY29sb3JfbHV0X2V4dHJhY3QgLSBjbGFtcCBhbmQgcm91bmQgTFVU
IGVudHJpZXMKPiA+ICsgKiBAdXNlcl9pbnB1dDogaW5wdXQgdmFsdWUKPiA+ICsgKiBAYml0X3By
ZWNpc2lvbjogbnVtYmVyIG9mIGJpdHMgdGhlIGh3IExVVCBzdXBwb3J0cwo+ID4gKyAqCj4gPiAr
ICogRXh0cmFjdCBhIGRlZ2FtbWEvZ2FtbWEgTFVUIHZhbHVlIHByb3ZpZGVkIGJ5IHVzZXIgKGlu
IHRoZSBmb3JtIG9mCj4gPiArICogJmRybV9jb2xvcl9sdXQgZW50cmllcykgYW5kIHJvdW5kIGl0
IHRvIHRoZSBwcmVjaXNpb24gc3VwcG9ydGVkIGJ5IHRoZQo+ID4gKyAqIGhhcmR3YXJlLgo+ID4g
KyAqLwo+ID4gK3N0YXRpYyBpbmxpbmUgdTMyIGRybV9jb2xvcl9sdXRfZXh0cmFjdCh1MzIgdXNl
cl9pbnB1dCwgaW50IGJpdF9wcmVjaXNpb24pCj4gPiArewo+ID4gKwl1MzIgdmFsID0gdXNlcl9p
bnB1dDsKPiA+ICsJdTMyIG1heCA9IDB4ZmZmZiA+PiAoMTYgLSBiaXRfcHJlY2lzaW9uKTsKPiA+
ICsKPiA+ICsJLyogUm91bmQgb25seSBpZiB3ZSdyZSBub3QgdXNpbmcgZnVsbCBwcmVjaXNpb24u
ICovCj4gPiArCWlmIChiaXRfcHJlY2lzaW9uIDwgMTYpIHsKPiA+ICsJCXZhbCArPSAxVUwgPDwg
KDE2IC0gYml0X3ByZWNpc2lvbiAtIDEpOwo+ID4gKwkJdmFsID4+PSAxNiAtIGJpdF9wcmVjaXNp
b247Cj4gPiArCX0KPiA+ICsKPiA+ICsJcmV0dXJuIGNsYW1wX3ZhbCh2YWwsIDAsIG1heCk7Cj4g
PiArfQo+ID4gICAKPiA+ICAgdm9pZCBkcm1fY3J0Y19lbmFibGVfY29sb3JfbWdtdChzdHJ1Y3Qg
ZHJtX2NydGMgKmNydGMsCj4gPiAgIAkJCQl1aW50IGRlZ2FtbWFfbHV0X3NpemUsCj4gPiAKPiAK
Ci0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
