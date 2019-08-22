Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB3699E86
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 20:17:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079786E9F9;
	Thu, 22 Aug 2019 18:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A1F26E9F9
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 18:17:26 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0CE4928D3E4;
 Thu, 22 Aug 2019 19:17:25 +0100 (BST)
Date: Thu, 22 Aug 2019 20:17:22 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 16/50] drm/bridge: tfp410: Allow operation without
 drm_connector
Message-ID: <20190822201722.39dbbd7c@collabora.com>
In-Reply-To: <20190820011721.30136-17-laurent.pinchart@ideasonboard.com>
References: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
 <20190820011721.30136-17-laurent.pinchart@ideasonboard.com>
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

T24gVHVlLCAyMCBBdWcgMjAxOSAwNDoxNjo0NyArMDMwMApMYXVyZW50IFBpbmNoYXJ0IDxsYXVy
ZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgoKPiBUaGUgdGZwNDEwIGRyaXZl
ciBjYW4gb3BlcmF0ZSBhcyBwYXJ0IG9mIGEgcGlwZWxpbmUgd2hlcmUgdGhlCj4gZHJtX2Nvbm5l
Y3RvciBpcyBjcmVhdGVkIGJ5IHRoZSBkaXNwbGF5IGNvbnRyb2xsZXIuIEVuYWJsZSB0aGlzIG1v
ZGUgb2YKPiBvcGVyYXRpb24gYnkgc2tpcHBpbmcgY3JlYXRpb24gb2YgYSBkcm1fY29ubmVjdG9y
IGludGVybmFsbHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVu
dC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgoKUmV2aWV3ZWQtYnk6IEJvcmlzIEJyZXppbGxv
biA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3RpLXRmcDQxMC5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS90aS10ZnA0MTAuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktdGZwNDEwLmMKPiBp
bmRleCA2NTY1MWFlNmM1NTMuLjE2Y2M4YWJlMzI2MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3RpLXRmcDQxMC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90
aS10ZnA0MTAuYwo+IEBAIC0xMzMsNyArMTMzLDcgQEAgc3RhdGljIGludCB0ZnA0MTBfYXR0YWNo
KHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsCj4gIAkJcmV0dXJuIHJldDsKPiAgCj4gIAlpZiAo
ZmxhZ3MgJiBEUk1fQlJJREdFX0FUVEFDSF9OT19DT05ORUNUT1IpCj4gLQkJcmV0dXJuIC1FSU5W
QUw7Cj4gKwkJcmV0dXJuIDA7Cj4gIAo+ICAJaWYgKCFicmlkZ2UtPmVuY29kZXIpIHsKPiAgCQlk
ZXZfZXJyKGR2aS0+ZGV2LCAiTWlzc2luZyBlbmNvZGVyXG4iKTsKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
