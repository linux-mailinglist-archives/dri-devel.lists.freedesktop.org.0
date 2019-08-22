Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E30998D7
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 18:11:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1600F6E536;
	Thu, 22 Aug 2019 16:11:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B28B6E536
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 16:11:04 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E1E4E28D1E4;
 Thu, 22 Aug 2019 17:11:02 +0100 (BST)
Date: Thu, 22 Aug 2019 18:11:00 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 14/50] drm/bridge: tfp410: Don't include drmP.h
Message-ID: <20190822181100.406b9557@collabora.com>
In-Reply-To: <20190820011721.30136-15-laurent.pinchart@ideasonboard.com>
References: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
 <20190820011721.30136-15-laurent.pinchart@ideasonboard.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMCBBdWcgMjAxOSAwNDoxNjo0NSArMDMwMApMYXVyZW50IFBpbmNoYXJ0IDxsYXVy
ZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgoKPiBUaGUgZHJtUC5oIGhlYWRl
ciBpcyBkZXByZWNhdGVkLCByZXBsYWNlIGl0IHdpdGggdGhlIGhlYWRlcnMKPiBzcGVjaWZpY2Fs
bHkgbmVlZGVkIGJ5IHRoZSB0ZnA0MTAgZHJpdmVyLiBXaGlsZSBhdCBpdCwgcmVwbGFjZSB0aGUg
RFJNCj4gcHJpbnQgbWFjcm9zIHdpdGggZGV2X2luZm8oKSBhbmQgZGV2X2VycigpIGluc3RlYWQg
b2YgaW5jbHVkaW5nCj4gZHJtX3ByaW50LmgKCkxvb2tzIGxpa2UgZHJtX3ByaW50LmggaXMgc3Rp
bGwgaW5jbHVkZWQuCgo+IAo+IFNpZ25lZC1vZmYtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJl
bnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS90aS10ZnA0MTAuYyB8IDYgKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvdGktdGZwNDEwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXRmcDQxMC5jCj4g
aW5kZXggYTkzNTkwMzhmN2RjLi40YTQ2OGY0NGVmNjkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS90aS10ZnA0MTAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
dGktdGZwNDEwLmMKPiBAQCAtMTQsNiArMTQsNyBAQAo+ICAjaW5jbHVkZSA8bGludXgvcGxhdGZv
cm1fZGV2aWNlLmg+Cj4gIAo+ICAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWNfaGVscGVyLmg+Cj4g
KyNpbmNsdWRlIDxkcm0vZHJtX2JyaWRnZS5oPgo+ICAjaW5jbHVkZSA8ZHJtL2RybV9jcnRjLmg+
Cj4gICNpbmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJtX3Byb2Jl
X2hlbHBlci5oPgo+IEBAIC02MCw3ICs2MSw4IEBAIHN0YXRpYyBpbnQgdGZwNDEwX2dldF9tb2Rl
cyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+ICAKPiAgCWVkaWQgPSBkcm1fZ2V0
X2VkaWQoY29ubmVjdG9yLCBkdmktPmRkYyk7Cj4gIAlpZiAoIWVkaWQpIHsKPiAtCQlEUk1fSU5G
TygiRURJRCByZWFkIGZhaWxlZC4gRmFsbGJhY2sgdG8gc3RhbmRhcmQgbW9kZXNcbiIpOwo+ICsJ
CWRldl9pbmZvKGR2aS0+ZGV2LAo+ICsJCQkgIkVESUQgcmVhZCBmYWlsZWQuIEZhbGxiYWNrIHRv
IHN0YW5kYXJkIG1vZGVzXG4iKTsKPiAgCQlnb3RvIGZhbGxiYWNrOwo+ICAJfQo+ICAKPiBAQCAt
MzY0LDcgKzM2Niw3IEBAIHN0YXRpYyBpbnQgdGZwNDEwX2luaXQoc3RydWN0IGRldmljZSAqZGV2
LCBib29sIGkyYykKPiAgCQkJSVJRRl9UUklHR0VSX0ZBTExJTkcgfCBJUlFGX09ORVNIT1QsCj4g
IAkJCSJoZG1pLWhwZCIsIGR2aSk7Cj4gIAkJaWYgKHJldCkgewo+IC0JCQlEUk1fRVJST1IoImZh
aWxlZCB0byByZWdpc3RlciBocGQgaW50ZXJydXB0XG4iKTsKPiArCQkJZGV2X2VycihkZXYsICJm
YWlsZWQgdG8gcmVnaXN0ZXIgaHBkIGludGVycnVwdFxuIik7Cj4gIAkJCWdvdG8gZmFpbDsKPiAg
CQl9Cj4gIAl9CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
