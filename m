Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A1C463DF
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 18:19:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B5589AEE;
	Fri, 14 Jun 2019 16:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A272F89AEE
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 16:19:47 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jun 2019 09:19:47 -0700
X-ExtLoop1: 1
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 14 Jun 2019 09:19:43 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 14 Jun 2019 19:19:42 +0300
Date: Fri, 14 Jun 2019 19:19:42 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Oleg Vasilev <oleg.vasilev@intel.com>
Subject: Re: [PATCH 1/3] drm: add debug print to update_vblank_count
Message-ID: <20190614161942.GC5942@intel.com>
References: <20190613121802.2193-1-oleg.vasilev@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613121802.2193-1-oleg.vasilev@intel.com>
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
Cc: Shayenne Moura <shayenneluzmoura@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDM6MTg6MDBQTSArMDMwMCwgT2xlZyBWYXNpbGV2IHdy
b3RlOgo+IFNpbmNlIHdlIGFyZSBsb2dnaW5nIGFsbCB2YmxhbmsgY291bnRlciB1cGRhdGVzIDMw
IGxpbmVzIGJlbG93LAo+IGl0IGlzIGFsc28gZ29vZCB0byBoYXZlIHNvbWUgZGV0YWlscyB3aGV0
aGVyIGFuZCBob3cgdmJsYW5rIGNvdW50Cj4gZGlmZmVyZW5jZSBpcyBjYWxjdWxhdGVkLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IE9sZWcgVmFzaWxldiA8b2xlZy52YXNpbGV2QGludGVsLmNvbT4KPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYyB8IDEwICsrKysrKystLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
dmJsYW5rLmMKPiBpbmRleCAwZDcwNGJkZGIxYTYuLjYwM2FiMTA1MTI1ZCAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV92YmxhbmsuYwo+IEBAIC0yNDEsMTIgKzI0MSwxNiBAQCBzdGF0aWMgdm9pZCBkcm1fdXBkYXRl
X3ZibGFua19jb3VudChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgcGlwZSwK
PiAgCQkgKiBvbiB0aGUgZGlmZmVyZW5jZSBpbiB0aGUgdGltZXN0YW1wcyBhbmQgdGhlCj4gIAkJ
ICogZnJhbWUvZmllbGQgZHVyYXRpb24uCj4gIAkJICovCj4gKwo+ICsJCURSTV9ERUJVR19WQkwo
ImNydGMgJXU6IENhbGN1bGF0aW5nIG51bWJlciBvZiB2YmxhbmtzLiIKPiArCQkJICAgICAgIiBk
aWZmX25zID0gJWxsZCwgZnJhbWVkdXJfbnMgPSAlZClcbiIsCj4gKwkJCSAgICAgIHBpcGUsIChs
b25nIGxvbmcpIGRpZmZfbnMsIGZyYW1lZHVyX25zKTsKCllvdSBjYW4gZ2VuZXJhbGx5IGV4dHJh
Y3QgdGhhdCBpbmZvIGZyb20gdGhlIHRpbWVzdGFtcHMgdGhhdCBhbHJlYWR5CmdldCBkdW1wZWQs
IGJ1dCBJIGd1ZXNzIHRoYXQgaXMgYSBiaXQgb2YgYSBoYXNzbGUuIFNvIG1pZ2h0IGFzIHdlbGwK
cHJpbnQgdGhlIHN0dWZmIHRoZSBrZXJuZWwgYWxyZWFkeSBjYWxjdWxhdGVkIGZvciB5b3UuCgpU
aGUgb25seSBkb3duc2lkZSBpcyB0aGF0IGxvdHMgb2YgcHJpbnRrcyBmcm9tIHRoZSBpcnEgaGFu
ZGxlciBib2dzCnRoZSBtYWNoaW5lIGRvd24gcXVpdGUgYSBiaXQuIEJ1dCB0aGVzZSBzaG91bGRu
J3QgYmUgdXNlZCBvdXRzaWRlIG9mCnNob3J0IHZibCBkZWJ1Z2dpbmcgc2Vzc2lvbnMgYW55d2F5
LgoKUHVzaGVkIHRoaXMgb25lIHRvIGRybS1taXNjLW5leHQuIFRoYW5rcyBmb3IgdGhlIHBhdGNo
LgoKPiArCj4gIAkJZGlmZiA9IERJVl9ST1VORF9DTE9TRVNUX1VMTChkaWZmX25zLCBmcmFtZWR1
cl9ucyk7Cj4gIAo+ICAJCWlmIChkaWZmID09IDAgJiYgaW5fdmJsYW5rX2lycSkKPiAtCQkJRFJN
X0RFQlVHX1ZCTCgiY3J0YyAldTogUmVkdW5kYW50IHZibGlycSBpZ25vcmVkLiIKPiAtCQkJCSAg
ICAgICIgZGlmZl9ucyA9ICVsbGQsIGZyYW1lZHVyX25zID0gJWQpXG4iLAo+IC0JCQkJICAgICAg
cGlwZSwgKGxvbmcgbG9uZykgZGlmZl9ucywgZnJhbWVkdXJfbnMpOwo+ICsJCQlEUk1fREVCVUdf
VkJMKCJjcnRjICV1OiBSZWR1bmRhbnQgdmJsaXJxIGlnbm9yZWRcbiIsCj4gKwkJCQkgICAgICBw
aXBlKTsKPiAgCX0gZWxzZSB7Cj4gIAkJLyogc29tZSBraW5kIG9mIGRlZmF1bHQgZm9yIGRyaXZl
cnMgdy9vIGFjY3VyYXRlIHZibCB0aW1lc3RhbXBpbmcgKi8KPiAgCQlkaWZmID0gaW5fdmJsYW5r
X2lycSA/IDEgOiAwOwo+IC0tIAo+IDIuMjEuMAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKLS0gClZpbGxlIFN5cmrDpGzDpApJbnRlbApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
