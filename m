Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC6A4B515
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 11:40:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F676E31E;
	Wed, 19 Jun 2019 09:40:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E66376E31E
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 09:40:18 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1hdX4j-0004KW-AJ; Wed, 19 Jun 2019 11:40:17 +0200
Message-ID: <1560937217.2398.1.camel@pengutronix.de>
Subject: Re: [PATCH] drm/imx: correct order of crtc disable
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Robert Beckett <bob.beckett@collabora.com>, 
 dri-devel@lists.freedesktop.org
Date: Wed, 19 Jun 2019 11:40:17 +0200
In-Reply-To: <20190618155003.18499-1-bob.beckett@collabora.com>
References: <20190618155003.18499-1-bob.beckett@collabora.com>
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iZXJ0LAoKdGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBUdWUsIDIwMTktMDYtMTgg
YXQgMTY6NTAgKzAxMDAsIFJvYmVydCBCZWNrZXR0IHdyb3RlOgo+IE5vdGlmeSBkcm0gY29yZSBi
ZWZvcmUgc2VuZGluZyBwZW5kaW5nIGV2ZW50cyBkdXJpbmcgY3J0YyBkaXNhYmxlLgo+IFRoaXMg
Zml4ZXMgdGhlIGZpcnN0IGV2ZW50IGFmdGVyIGRpc2FibGUgaGF2aW5nIGFuIG9sZCBzdGFsZSB0
aW1lc3RhbXAKPiBieSBoYXZpbmcgZHJtX2NydGNfdmJsYW5rX29mZiB1cGRhdGUgdGhlIHRpbWVz
dGFtcCB0byBub3cuCj4gCj4gVGhpcyB3YXMgc2VlbiB3aGlsZSBkZWJ1Z2dpbmcgd2VzdG9uIGxv
ZyBtZXNzYWdlOgo+IFdhcm5pbmc6IGNvbXB1dGVkIHJlcGFpbnQgZGVsYXkgaXMgaW5zYW5lOiAt
ODIxMiBtc2VjCj4gCgpXb3VsZCB5b3Ugc2F5IHRoaXMKRml4ZXM6IGE0NzQ0Nzg2NDJkNSAoImRy
bS9pbXg6IGZpeCBjcnRjIHZibGFuayBzdGF0ZSByZWdyZXNzaW9uIikKPwoKPiBTaWduZWQtb2Zm
LWJ5OiBSb2JlcnQgQmVja2V0dCA8Ym9iLmJlY2tldHRAY29sbGFib3JhLmNvbT4KPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL2lteC9pcHV2My1jcnRjLmMgfCA2ICsrKy0tLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaW14L2lwdXYzLWNydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9pbXgvaXB1
djMtY3J0Yy5jCj4gaW5kZXggOWNjMWQ2Nzg2NzRmLi5jNDM2YTI4ZDUwZTQgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2lteC9pcHV2My1jcnRjLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vaW14L2lwdXYzLWNydGMuYwo+IEBAIC05MSwxNCArOTEsMTQgQEAgc3RhdGljIHZvaWQgaXB1
X2NydGNfYXRvbWljX2Rpc2FibGUoc3RydWN0IGRybV9jcnRjICpjcnRjLAo+ICAJaXB1X2RjX2Rp
c2FibGUoaXB1KTsKPiAgCWlwdV9wcmdfZGlzYWJsZShpcHUpOwo+ICAKPiArCWRybV9jcnRjX3Zi
bGFua19vZmYoY3J0Yyk7Cj4gKwoKVGhpcyBpcyBleHBsYWluZWQgaW4gdGhlIGNvbW1pdCBtZXNz
YWdlIGFuZCBhbGlnbnMgd2l0aCB0aGUKZHJtX2NydGNfc3RhdGUgQGV2ZW50IGRvY3VtZW50YXRp
b24uCgo+ICAJc3Bpbl9sb2NrX2lycSgmY3J0Yy0+ZGV2LT5ldmVudF9sb2NrKTsKPiAtCWlmIChj
cnRjLT5zdGF0ZS0+ZXZlbnQpIHsKPiArCWlmIChjcnRjLT5zdGF0ZS0+ZXZlbnQgJiYgIWNydGMt
PnN0YXRlLT5hY3RpdmUpIHsKClRoaXMgaXMgbm90IG1lbnRpb25lZCB0aG91Z2guwqAKCklmIHRo
ZSBwZW5kaW5nIGV2ZW50IGlzIG5vdCBzZW50IGhlcmUsIEkgYXNzdW1lIGl0IHdpbGwgYmUgcGlj
a2VkIHVwIGJ5Ci5hdG9taWNfZmx1c2ggYW5kIHdpbGwgdGhlbiBiZSBzZW50IGFmdGVyIHRoZSBm
aXJzdCBFT0YgaW50ZXJydXB0IGFmdGVyCnRoZSBtb2Rlc2V0IGlzIGNvbXBsZXRlLiBDYW4geW91
IGV4cGxhaW4gdGhpcyBpbiB0aGUgY29tbWl0IG1lc3NhZ2U/CgpXaXRoIHRoYXQsClJldmlld2Vk
LWJ5OiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgoKPiAgCQlkcm1fY3J0
Y19zZW5kX3ZibGFua19ldmVudChjcnRjLCBjcnRjLT5zdGF0ZS0+ZXZlbnQpOwo+ICAJCWNydGMt
PnN0YXRlLT5ldmVudCA9IE5VTEw7Cj4gIAl9Cj4gIAlzcGluX3VubG9ja19pcnEoJmNydGMtPmRl
di0+ZXZlbnRfbG9jayk7Cj4gLQo+IC0JZHJtX2NydGNfdmJsYW5rX29mZihjcnRjKTsKPiAgfQo+
ICAKPiAgc3RhdGljIHZvaWQgaW14X2RybV9jcnRjX3Jlc2V0KHN0cnVjdCBkcm1fY3J0YyAqY3J0
YykKCnJlZ2FyZHMKUGhpbGlwcApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
