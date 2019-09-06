Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DB6ABF42
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 20:17:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 771256E10D;
	Fri,  6 Sep 2019 18:17:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E556E10D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 18:17:17 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Sep 2019 11:17:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,473,1559545200"; d="scan'208";a="213231606"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 06 Sep 2019 11:17:14 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 06 Sep 2019 21:17:14 +0300
Date: Fri, 6 Sep 2019 21:17:14 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH] fbdev: matrox: make array wtst_xlat static const, makes
 object smaller
Message-ID: <20190906181714.GU7482@intel.com>
References: <20190906181114.31414-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190906181114.31414-1-colin.king@canonical.com>
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
Cc: linux-fbdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMDYsIDIwMTkgYXQgMDc6MTE6MTRQTSArMDEwMCwgQ29saW4gS2luZyB3cm90
ZToKPiBGcm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+IAo+
IERvbid0IHBvcHVsYXRlIHRoZSBhcnJheSB3dHN0X3hsYXQgb24gdGhlIHN0YWNrIGJ1dCBpbnN0
ZWFkIG1ha2UgaXQKPiBzdGF0aWMgY29uc3QuIE1ha2VzIHRoZSBvYmplY3QgY29kZSBzbWFsbGVy
IGJ5IDg5IGJ5dGVzLgo+IAo+IEJlZm9yZToKPiAgICB0ZXh0CSAgIGRhdGEJICAgIGJzcwkgICAg
ZGVjCSAgICBoZXgJZmlsZW5hbWUKPiAgIDE0MzQ3CSAgICA4NDAJICAgICAgMAkgIDE1MTg3CSAg
IDNiNTMJZmJkZXYvbWF0cm94L21hdHJveGZiX21pc2Mubwo+IAo+IEFmdGVyOgo+ICAgIHRleHQJ
ICAgZGF0YQkgICAgYnNzCSAgICBkZWMJICAgIGhleAlmaWxlbmFtZQo+ICAgMTQxNjIJICAgIDkz
NgkgICAgICAwCSAgMTUwOTgJICAgM2FmYQlmYmRldi9tYXRyb3gvbWF0cm94ZmJfbWlzYy5vCj4g
Cj4gKGdjYyB2ZXJzaW9uIDkuMi4xLCBhbWQ2NCkKPiAKPiBTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJ
YW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3ZpZGVv
L2ZiZGV2L21hdHJveC9tYXRyb3hmYl9taXNjLmMgfCA1ICsrKystCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy92aWRlby9mYmRldi9tYXRyb3gvbWF0cm94ZmJfbWlzYy5jIGIvZHJpdmVycy92aWRlby9mYmRl
di9tYXRyb3gvbWF0cm94ZmJfbWlzYy5jCj4gaW5kZXggYzdhYWNhMTI4MDVlLi5mZWIwOTc3Yzgy
ZWIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9tYXRyb3gvbWF0cm94ZmJfbWlz
Yy5jCj4gKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9tYXRyb3gvbWF0cm94ZmJfbWlzYy5jCj4g
QEAgLTY3Myw3ICs2NzMsMTAgQEAgc3RhdGljIGludCBwYXJzZV9waW5zNShzdHJ1Y3QgbWF0cm94
X2ZiX2luZm8gKm1pbmZvLAo+ICAJaWYgKGJkLT5waW5zWzExNV0gJiA0KSB7Cj4gIAkJbWluZm8t
PnZhbHVlcy5yZWcubWN0bHd0c3RfY29yZSA9IG1pbmZvLT52YWx1ZXMucmVnLm1jdGx3dHN0Owo+
ICAJfSBlbHNlIHsKPiAtCQl1X2ludDMyX3Qgd3RzdF94bGF0W10gPSB7IDAsIDEsIDUsIDYsIDcs
IDUsIDIsIDMgfTsKPiArCQlzdGF0aWMgY29uc3QgdV9pbnQzMl90IHd0c3RfeGxhdFtdID0gewo+
ICsJCQkwLCAxLCA1LCA2LCA3LCA1LCAyLCAzCgpBbGwgb2YgdGhvc2Ugd291bGQgZWFzaWx5IGZp
dCBpbiB1OCBhcyB3ZWxsLgoKPiArCQl9Owo+ICsKPiAgCQltaW5mby0+dmFsdWVzLnJlZy5tY3Rs
d3RzdF9jb3JlID0gKG1pbmZvLT52YWx1ZXMucmVnLm1jdGx3dHN0ICYgfjcpIHwKPiAgCQkJCQkJ
ICB3dHN0X3hsYXRbbWluZm8tPnZhbHVlcy5yZWcubWN0bHd0c3QgJiA3XTsKPiAgCX0KPiAtLSAK
PiAyLjIwLjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwKCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
