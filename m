Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D832798EE5
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 11:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A237D6EABC;
	Thu, 22 Aug 2019 09:13:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81AA6EABC
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 09:13:42 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6A35D28BD37;
 Thu, 22 Aug 2019 10:13:41 +0100 (BST)
Date: Thu, 22 Aug 2019 11:13:38 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 02/50] drm/connector: Add helper to get a connector
 type name
Message-ID: <20190822111338.776742ed@collabora.com>
In-Reply-To: <20190820011721.30136-3-laurent.pinchart@ideasonboard.com>
References: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
 <20190820011721.30136-3-laurent.pinchart@ideasonboard.com>
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

T24gVHVlLCAyMCBBdWcgMjAxOSAwNDoxNjozMyArMDMwMApMYXVyZW50IFBpbmNoYXJ0IDxsYXVy
ZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgoKPiBkcm1fY29ubmVjdG9yLmMg
Y29udGFpbnMgYSBtYXAgb2YgY29ubmVjdG9yIHR5cGVzIChEUk1fTU9ERV9DT05ORUNUT1JfKikK
PiB0byBuYW1lIHN0cmluZ3MsIGJ1dCBkb2Vzbid0IGV4cG9zZSBpdC4gVGhpcyBsZWFkcyB0byBk
cml2ZXJzIGhhdmluZyB0bwo+IHN0b3JlIGEgc2ltaWxhciBtYXAuCj4gCj4gQWRkIGEgbmV3IGRy
bV9nZXRfY29ubmVjdG9yX3R5cGVfbmFtZSgpIGhlbHBlciBmdW5jdGlvbiB0aGF0IHJldHVybiBh
Cj4gbmFtZSBzdHJpbmcgZm9yIGEgY29ubmVjdG9yIHR5cGUuCj4gCj4gU2lnbmVkLW9mZi1ieTog
TGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgoKUmV2
aWV3ZWQtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+
Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jIHwgMTUgKysrKysrKysr
KysrKysrCj4gIGluY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaCAgICAgfCAgMSArCj4gIDIgZmls
ZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2Nvbm5lY3Rvci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYwo+
IGluZGV4IDRjNzY2NjI0YjIwZC4uM2Y5MzYzM2E5ZmYyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fY29ubmVjdG9yLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5l
Y3Rvci5jCj4gQEAgLTExMSw2ICsxMTEsMjEgQEAgdm9pZCBkcm1fY29ubmVjdG9yX2lkYV9kZXN0
cm95KHZvaWQpCj4gIAkJaWRhX2Rlc3Ryb3koJmRybV9jb25uZWN0b3JfZW51bV9saXN0W2ldLmlk
YSk7Cj4gIH0KPiAgCj4gKy8qKgo+ICsgKiBkcm1fZ2V0X2Nvbm5lY3Rvcl90eXBlX25hbWUgLSBy
ZXR1cm4gYSBzdHJpbmcgZm9yIGNvbm5lY3RvciB0eXBlCj4gKyAqIEB0eXBlOiBUaGUgY29ubmVj
dG9yIHR5cGUgKERSTV9NT0RFX0NPTk5FQ1RPUl8qKQo+ICsgKgo+ICsgKiBSZXR1cm5zOiB0aGUg
bmFtZSBvZiB0aGUgY29ubmVjdG9yIHR5cGUsIG9yIE5VTEwgaWYgdGhlIHR5cGUgaXMgbm90IHZh
bGlkLgo+ICsgKi8KPiArY29uc3QgY2hhciAqZHJtX2dldF9jb25uZWN0b3JfdHlwZV9uYW1lKHVu
c2lnbmVkIGludCB0eXBlKQo+ICt7Cj4gKwlpZiAodHlwZSA8IEFSUkFZX1NJWkUoZHJtX2Nvbm5l
Y3Rvcl9lbnVtX2xpc3QpKQo+ICsJCXJldHVybiBkcm1fY29ubmVjdG9yX2VudW1fbGlzdFt0eXBl
XS5uYW1lOwo+ICsKPiArCXJldHVybiBOVUxMOwo+ICt9Cj4gK0VYUE9SVF9TWU1CT0woZHJtX2dl
dF9jb25uZWN0b3JfdHlwZV9uYW1lKTsKPiArCj4gIC8qKgo+ICAgKiBkcm1fY29ubmVjdG9yX2dl
dF9jbWRsaW5lX21vZGUgLSByZWFkcyB0aGUgdXNlcidzIGNtZGxpbmUgbW9kZQo+ICAgKiBAY29u
bmVjdG9yOiBjb25uZWN0b3IgdG8gcXV3ZXJ5Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2Ry
bV9jb25uZWN0b3IuaCBiL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaAo+IGluZGV4IDY4MWNi
NTkwZjk1Mi4uYjkxZTM2OWNmYjExIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9jb25u
ZWN0b3IuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaAo+IEBAIC0xNTAwLDYg
KzE1MDAsNyBAQCBkcm1fY29ubmVjdG9yX2lzX3VucmVnaXN0ZXJlZChzdHJ1Y3QgZHJtX2Nvbm5l
Y3RvciAqY29ubmVjdG9yKQo+ICAJCURSTV9DT05ORUNUT1JfVU5SRUdJU1RFUkVEOwo+ICB9Cj4g
IAo+ICtjb25zdCBjaGFyICpkcm1fZ2V0X2Nvbm5lY3Rvcl90eXBlX25hbWUodW5zaWduZWQgaW50
IGNvbm5lY3Rvcl90eXBlKTsKPiAgY29uc3QgY2hhciAqZHJtX2dldF9jb25uZWN0b3Jfc3RhdHVz
X25hbWUoZW51bSBkcm1fY29ubmVjdG9yX3N0YXR1cyBzdGF0dXMpOwo+ICBjb25zdCBjaGFyICpk
cm1fZ2V0X3N1YnBpeGVsX29yZGVyX25hbWUoZW51bSBzdWJwaXhlbF9vcmRlciBvcmRlcik7Cj4g
IGNvbnN0IGNoYXIgKmRybV9nZXRfZHBtc19uYW1lKGludCB2YWwpOwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
