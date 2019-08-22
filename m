Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C804999B2
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 19:00:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE046E54E;
	Thu, 22 Aug 2019 17:00:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8ECF6E54E
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 17:00:16 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 39C4528D21C;
 Thu, 22 Aug 2019 18:00:15 +0100 (BST)
Date: Thu, 22 Aug 2019 19:00:11 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 34/50] drm/omap: Create connector for bridges
Message-ID: <20190822190011.6030579d@collabora.com>
In-Reply-To: <20190820011721.30136-35-laurent.pinchart@ideasonboard.com>
References: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
 <20190820011721.30136-35-laurent.pinchart@ideasonboard.com>
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

T24gVHVlLCAyMCBBdWcgMjAxOSAwNDoxNzowNSArMDMwMApMYXVyZW50IFBpbmNoYXJ0IDxsYXVy
ZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgoKPiBVc2UgdGhlIGRybV9icmlk
Z2VfY29ubmVjdG9yIGhlbHBlciB0byBjcmVhdGUgYSBjb25uZWN0b3IgZm9yIHBpcGVsaW5lcwo+
IHRoYXQgdXNlIGRybV9icmlkZ2UuIFRoaXMgYWxsb3dzIHNwbGl0dGluZyBjb25uZWN0b3Igb3Bl
cmF0aW9ucyBhY3Jvc3MKPiBtdWx0aXBsZSBicmlkZ2VzIHdoZW4gbmVjZXNzYXJ5LCBpbnN0ZWFk
IG9mIGhhdmluZyB0aGUgbGFzdCBicmlkZ2UgaW4KPiB0aGUgY2hhaW4gY3JlYXRpbmcgdGhlIGNv
bm5lY3RvciBhbmQgaGFuZGxpbmcgYWxsIGNvbm5lY3RvciBvcGVyYXRpb25zCj4gaW50ZXJuYWxs
eS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0
QGlkZWFzb25ib2FyZC5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBzaW5jZSB2MToKPiAKPiAtIFNxdWFz
aCB3aXRoIHBhdGNoICJkcm0vb21hcDogRGV0YWNoIGZyb20gcGFuZWxzIGF0IHJlbW92ZSB0aW1l
Igo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2Rydi5jIHwgODIgKysrKysr
KysrKysrKysrKysrKysrKysrKy0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA3MCBpbnNlcnRpb25z
KCspLCAxMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL29t
YXBkcm0vb21hcF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZHJ2LmMKPiBp
bmRleCBkZTM3M2ZkNTA3MjkuLmYzOGQ5NWNiMzFiYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vb21hcGRybS9vbWFwX2Rydi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0v
b21hcF9kcnYuYwo+IEBAIC0xMSwxMCArMTEsMTIgQEAKPiAgCj4gICNpbmNsdWRlIDxkcm0vZHJt
X2F0b21pYy5oPgo+ICAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWNfaGVscGVyLmg+Cj4gKyNpbmNs
dWRlIDxkcm0vZHJtX2JyaWRnZV9jb25uZWN0b3IuaD4KPiAgI2luY2x1ZGUgPGRybS9kcm1fZHJ2
Lmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJtX2ZiX2hlbHBlci5oPgo+ICAjaW5jbHVkZSA8ZHJtL2Ry
bV9maWxlLmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJtX2lvY3RsLmg+Cj4gKyNpbmNsdWRlIDxkcm0v
ZHJtX3BhbmVsLmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJtX3ByaW1lLmg+Cj4gICNpbmNsdWRlIDxk
cm0vZHJtX3Byb2JlX2hlbHBlci5oPgo+ICAjaW5jbHVkZSA8ZHJtL2RybV92YmxhbmsuaD4KPiBA
QCAtMjkwLDkgKzI5MiwxNCBAQCBzdGF0aWMgaW50IG9tYXBfbW9kZXNldF9pbml0KHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYpCj4gIAo+ICAJCWlmIChwaXBlLT5vdXRwdXQtPmJyaWRnZSkgewo+ICAJ
CQlyZXQgPSBkcm1fYnJpZGdlX2F0dGFjaChwaXBlLT5lbmNvZGVyLAo+IC0JCQkJCQlwaXBlLT5v
dXRwdXQtPmJyaWRnZSwgTlVMTCwgMCk7Cj4gLQkJCWlmIChyZXQgPCAwKQo+ICsJCQkJCQlwaXBl
LT5vdXRwdXQtPmJyaWRnZSwgTlVMTCwKPiArCQkJCQkJRFJNX0JSSURHRV9BVFRBQ0hfTk9fQ09O
TkVDVE9SKTsKCkkgZ3Vlc3MgdGhlIG9ubHkgZXh0ZXJuYWwgYnJpZGdlIGNvbm5lY3RlZCB0byBh
biBvbWFwIGRpc3BsYXkKY29udHJvbGxlciBpbiB1cHN0cmVhbSBEVHMgaXMgdGhlIFRGUDQxMC4g
SSB3YXMgd29uZGVyaW5nIGlmIGZhbGxpbmcKYmFjayB0byAhRFJNX0JSSURHRV9BVFRBQ0hfTk9f
Q09OTkVDVE9SIHdvdWxkIGJlIGFjY2VwdGFibGUgaW4gY2FzZSBvbmUKd2FudHMgdG8gY29udmVy
dCBhIGRpc3BsYXkgY29udHJvbGxlciBkcml2ZXIgd2hpY2ggaXMga25vd24gdG8gYmUKdXNlZCBp
biBjb25qdW5jdGlvbiB3aXRoIHZhcmlvdXMgZXh0ZXJuYWwgYnJpZGdlcy4KCj4gKwkJCWlmIChy
ZXQgPCAwKSB7Cj4gKwkJCQlkZXZfZXJyKHByaXYtPmRldiwKPiArCQkJCQkidW5hYmxlIHRvIGF0
dGFjaCBicmlkZ2UgJXBPRlxuIiwKPiArCQkJCQlwaXBlLT5vdXRwdXQtPmJyaWRnZS0+b2Zfbm9k
ZSk7Cj4gIAkJCQlyZXR1cm4gcmV0Owo+ICsJCQl9Cj4gIAkJfQo+ICAKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
