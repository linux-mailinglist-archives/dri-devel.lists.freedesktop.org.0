Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B04F467
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 12:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B563189180;
	Tue, 30 Apr 2019 10:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B0C89180
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 10:44:23 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Apr 2019 03:44:23 -0700
X-ExtLoop1: 1
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 30 Apr 2019 03:44:19 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 30 Apr 2019 13:44:19 +0300
Date: Tue, 30 Apr 2019 13:44:19 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] drm/atomic-helper: Bump vblank timeout to 100 ms
Message-ID: <20190430104419.GD24299@intel.com>
References: <20190430093746.26485-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190430093746.26485-1-linus.walleij@linaro.org>
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
Cc: Sean Paul <seanpaul@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgMTE6Mzc6NDZBTSArMDIwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBUaGUgNTAgbXMgZGVmYXVsdCB0aW1lb3V0IHdhaXRpbmcgZm9yIHZibGFua3MgaXMg
dG9vIHNtYWxsCj4gZm9yIHRoZSBmaXJzdCB2YmxhbmsgZnJvbSB0aGUgU1QtRXJpY3Nzb24gTUNE
RSBkaXNwbGF5Cj4gY29udHJvbGxlciBvdmVyIERTSS4gUHJlc3VtYWJseSB0aGlzIGlzIGJlY2F1
c2UgdGhlIERTSQo+IGRpc3BsYXkgaXMgY29tbWFuZC1tb2RlIG9ubHkgYW5kIHRoZSBzdGF0ZSBt
YWNoaW5lIHdpbGwKPiB0YWtlIHNvbWUgdGltZSBzZXR0aW5nIHVwIGl0cyBzdGF0ZSBmb3IgdGhl
IGZpcnN0IGRpc3BsYXkKPiB1cGRhdGUsIGFuZCB3ZSBoaXQgYSB0aW1lb3V0LiAxMDAgbXMgbWFr
ZXMgaXQgcGFzcyB3aXRob3V0Cj4gcHJvYmxlbXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogTGludXMg
V2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgo+IC0tLQo+IEFmdGVyIGEgcXVpdGUg
cHJvbG9uZ2VkIGh1bnRpbmcgZm9yIHRoZSBjYXVzZSBvZiBtaXNzZWQKPiB2YmxhbmtzIGluIHRo
ZSBNQ0RFIGRyaXZlciBJIGZpbmFsbHkgcmVhbGl6ZWQgaXQgdGltZWQKPiBvdXQgYmVjYXVzZSBp
dCB3YXMgc2ltcGx5IHRha2luZyBzb21lIHRpbWUgb24gdGhlIGZpcnN0Cj4gdmJsYW5rLiA1MCBt
cyBtYWtlcyBzZW5zZSBvbiA2MEh6IG1vbml0b3JzIGZvciBzdXJlLAo+IGJ1dCBhbiBlbWJlZGRl
ZCBEU0kgc3RhdGUgbWFjaGluZSBjYW4gYmUgc2xvdywgYXMgaXQKPiB0dXJucyBvdXQuCj4gCj4g
VGVsbCBtZSBpZiB0aGlzIHNob3VsZCBiZSBhIHBlci1kcml2ZXIgdmFyaWFibGUgYW5kIEkKPiB3
aWxsIHRoaW5rIG9mIHNvbWV0aGluZy4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9hdG9t
aWNfaGVscGVyLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19o
ZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5jCj4gaW5kZXggNDBh
YzE5ODQ4MDM0Li5mMGFhN2IxOTVkNzkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9hdG9taWNfaGVscGVyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxw
ZXIuYwo+IEBAIC0xNDI0LDcgKzE0MjQsNyBAQCBkcm1fYXRvbWljX2hlbHBlcl93YWl0X2Zvcl92
YmxhbmtzKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gIAkJcmV0ID0gd2FpdF9ldmVudF90aW1l
b3V0KGRldi0+dmJsYW5rW2ldLnF1ZXVlLAo+ICAJCQkJb2xkX3N0YXRlLT5jcnRjc1tpXS5sYXN0
X3ZibGFua19jb3VudCAhPQo+ICAJCQkJCWRybV9jcnRjX3ZibGFua19jb3VudChjcnRjKSwKPiAt
CQkJCW1zZWNzX3RvX2ppZmZpZXMoNTApKTsKPiArCQkJCW1zZWNzX3RvX2ppZmZpZXMoMTAwKSk7
Cgo1MG1zIGlzIHByZXR0eSB0aWdodCBmb3IgMjRIeiBhcyB3ZWxsLiBJIHN1cHBvc2Ugd2UgY291
bGQgbWFrZSB0aGlzCmRlcGVuZCBvbiB0aGUgZXhwZWN0ZWQgZnJhbWUvZmllbGQgZHVyYXRpb24s
IGJ1dCBpdCdzIGdlbmVyYWxseQppbmRpY2F0aXZlIG9mIGEgcHJvZ3JhbW1pbmcgZXJyb3Igb2Yg
c29tZSBzb3J0LCBzbyBhcyBsb25nIGFzIGl0J3MKbG9uZyBlbm91Z2ggSSB0aGluayB3ZSdyZSBn
b29kLgoKUmV2aWV3ZWQtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5p
bnRlbC5jb20+Cgo+ICAKPiAgCQlXQVJOKCFyZXQsICJbQ1JUQzolZDolc10gdmJsYW5rIHdhaXQg
dGltZWQgb3V0XG4iLAo+ICAJCSAgICAgY3J0Yy0+YmFzZS5pZCwgY3J0Yy0+bmFtZSk7Cj4gLS0g
Cj4gMi4yMC4xCgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
