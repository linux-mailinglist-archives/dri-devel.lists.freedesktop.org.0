Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2F72A8E4D
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 05:27:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E90CC6EA4E;
	Fri,  6 Nov 2020 04:26:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C7F6EA4E
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 04:26:53 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 82AC4B16;
 Fri,  6 Nov 2020 05:26:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1604636811;
 bh=Dzy4k7oMrh6Qwr0FibbNWC+4whZQko79sRwDL+YBC5M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hp7cQ1Cyu0ma0fKXMBujwp0zP6HjHtC7x3tNfOHBazC+xC9z/qrPFCj03UALtowE0
 YQFP6oDJeY2jNiR1yNJ9Rr1VpM8K6Ry4DNagPN4Gsii0WTEv4uxlhaW/kA5PINLsWF
 H1LLmCc5JSyKR4PwbePZZZUW/cKHHYt0wyziJNEQ=
Date: Fri, 6 Nov 2020 06:26:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 08/19] gpu: drm: omapdrm: dss: dsi: Rework and remove a
 few unused variables
Message-ID: <20201106042650.GA16469@pendragon.ideasonboard.com>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
 <20201105144517.1826692-9-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105144517.1826692-9-lee.jones@linaro.org>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGVlLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBUaHUsIE5vdiAwNSwgMjAyMCBh
dCAwMjo0NTowNlBNICswMDAwLCBMZWUgSm9uZXMgd3JvdGU6Cj4gRml4ZXMgdGhlIGZvbGxvd2lu
ZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4gCj4gIGRyaXZlcnMvZ3B1L2RybS9vbWFw
ZHJtL2Rzcy9kc2kuYzogSW4gZnVuY3Rpb24g4oCYX2RzaV9wcmludF9yZXNldF9zdGF0dXPigJk6
Cj4gIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9kc2kuYzoxMTMxOjY6IHdhcm5pbmc6IHZh
cmlhYmxlIOKAmGzigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJs
ZV0KPiAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2RzaS5jOiBJbiBmdW5jdGlvbiDigJhk
c2lfdXBkYXRl4oCZOgo+ICBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvZHNpLmM6Mzk0Mzox
MDogd2FybmluZzogdmFyaWFibGUg4oCYZGjigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQt
YnV0LXNldC12YXJpYWJsZV0KPiAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2RzaS5jOjM5
NDM6Njogd2FybmluZzogdmFyaWFibGUg4oCYZHfigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVz
ZWQtYnV0LXNldC12YXJpYWJsZV0KPiAKPiBDYzogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2Vp
bmVuQHRpLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IExhdXJlbnQgUGluY2hhcnQgPGxh
dXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+CgpSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBp
ZGVhc29uYm9hcmQuY29tPgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2Rz
aS5jIHwgOSArKy0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNyBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNz
L2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2RzaS5jCj4gaW5kZXggZWVjY2Y0
MGJhZTQxNi4uNTkyOWIzMjBiM2NmYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vb21h
cGRybS9kc3MvZHNpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvZHNpLmMK
PiBAQCAtMTEyOCwxMyArMTEyOCwxMiBAQCBzdGF0aWMgdm9pZCBkc2lfcnVudGltZV9wdXQoc3Ry
dWN0IGRzaV9kYXRhICpkc2kpCj4gIAo+ICBzdGF0aWMgdm9pZCBfZHNpX3ByaW50X3Jlc2V0X3N0
YXR1cyhzdHJ1Y3QgZHNpX2RhdGEgKmRzaSkKPiAgewo+IC0JdTMyIGw7Cj4gIAlpbnQgYjAsIGIx
LCBiMjsKPiAgCj4gIAkvKiBBIGR1bW15IHJlYWQgdXNpbmcgdGhlIFNDUCBpbnRlcmZhY2UgdG8g
YW55IERTSVBIWSByZWdpc3RlciBpcwo+ICAJICogcmVxdWlyZWQgYWZ0ZXIgRFNJUEhZIHJlc2V0
IHRvIGNvbXBsZXRlIHRoZSByZXNldCBvZiB0aGUgRFNJIGNvbXBsZXgKPiAgCSAqIEkvTy4gKi8K
PiAtCWwgPSBkc2lfcmVhZF9yZWcoZHNpLCBEU0lfRFNJUEhZX0NGRzUpOwo+ICsJZHNpX3JlYWRf
cmVnKGRzaSwgRFNJX0RTSVBIWV9DRkc1KTsKPiAgCj4gIAlpZiAoZHNpLT5kYXRhLT5xdWlya3Mg
JiBEU0lfUVVJUktfUkVWRVJTRV9UWENMS0VTQykgewo+ICAJCWIwID0gMjg7Cj4gQEAgLTM5NDAs
NyArMzkzOSw2IEBAIHN0YXRpYyBpbnQgZHNpX3VwZGF0ZShzdHJ1Y3Qgb21hcF9kc3NfZGV2aWNl
ICpkc3NkZXYsIGludCBjaGFubmVsLAo+ICAJCXZvaWQgKCpjYWxsYmFjaykoaW50LCB2b2lkICop
LCB2b2lkICpkYXRhKQo+ICB7Cj4gIAlzdHJ1Y3QgZHNpX2RhdGEgKmRzaSA9IHRvX2RzaV9kYXRh
KGRzc2Rldik7Cj4gLQl1MTYgZHcsIGRoOwo+ICAKPiAgCWRzaV9wZXJmX21hcmtfc2V0dXAoZHNp
KTsKPiAgCj4gQEAgLTM5NDksMTEgKzM5NDcsOCBAQCBzdGF0aWMgaW50IGRzaV91cGRhdGUoc3Ry
dWN0IG9tYXBfZHNzX2RldmljZSAqZHNzZGV2LCBpbnQgY2hhbm5lbCwKPiAgCWRzaS0+ZnJhbWVk
b25lX2NhbGxiYWNrID0gY2FsbGJhY2s7Cj4gIAlkc2ktPmZyYW1lZG9uZV9kYXRhID0gZGF0YTsK
PiAgCj4gLQlkdyA9IGRzaS0+dm0uaGFjdGl2ZTsKPiAtCWRoID0gZHNpLT52bS52YWN0aXZlOwo+
IC0KPiAgI2lmZGVmIERTSV9QRVJGX01FQVNVUkUKPiAtCWRzaS0+dXBkYXRlX2J5dGVzID0gZHcg
KiBkaCAqCj4gKwlkc2ktPnVwZGF0ZV9ieXRlcyA9IGRzaS0+dm0uaGFjdGl2ZSAqIGRzaS0+dm0u
dmFjdGl2ZSAqCj4gIAkJZHNpX2dldF9waXhlbF9zaXplKGRzaS0+cGl4X2ZtdCkgLyA4Owo+ICAj
ZW5kaWYKPiAgCWRzaV91cGRhdGVfc2NyZWVuX2Rpc3BjKGRzaSk7CgotLSAKUmVnYXJkcywKCkxh
dXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
