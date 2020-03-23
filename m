Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4134018F8F3
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 16:51:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B2B89D86;
	Mon, 23 Mar 2020 15:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 612CF89D86
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 15:51:14 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=localhost)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1jGPM3-0004GB-Ny; Mon, 23 Mar 2020 16:51:07 +0100
Message-ID: <d39209a3664179f895a7dfabbd02d27a6adb9895.camel@pengutronix.de>
Subject: Re: [PATCH] drm/mxsfb: Make supported modifiers explicit
From: Lucas Stach <l.stach@pengutronix.de>
To: Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>, Marek Vasut
 <marex@denx.de>, Stefan Agner <stefan@agner.ch>, David Airlie
 <airlied@linux.ie>,  Daniel Vetter <daniel@ffwll.ch>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,  Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 23 Mar 2020 16:51:05 +0100
In-Reply-To: <26877532e272c12a74c33188e2a72abafc9a2e1c.1584973664.git.agx@sigxcpu.org>
References: <26877532e272c12a74c33188e2a72abafc9a2e1c.1584973664.git.agx@sigxcpu.org>
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gTW9udGFnLCBkZW4gMjMuMDMuMjAyMCwgMTU6NTIgKzAxMDAgc2NocmllYiBHdWlkbyBHw7xu
dGhlcjoKPiBJbiBjb250cmFzdCB0byBvdGhlciBkaXNwbGF5IGNvbnRyb2xsZXJzIG9uIGlteCBs
aWtlIERDU1MgYW5kIGlwdXYzCj4gbGNkaWYvbXhzZmIgZG9lcyBub3Qgc3VwcG9ydCBkZXRpbGlu
ZyBlLmcuIHZpdmFudGUgdGlsZWQgbGF5b3V0cy4KPiBTaW5jZSBtZXNhIG1pZ2h0IGFzc3VtZSBv
dGhlcndpc2UgbWFrZSBpdCBleHBsaWNpdCB0aGF0IG9ubHkKPiBEUk1fRk9STUFUX01PRF9MSU5F
QVIgaXMgc3VwcG9ydGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEd1aWRvIEfDvG50aGVyIDxhZ3hA
c2lneGNwdS5vcmc+CgpSZXZpZXdlZC1ieTogTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9u
aXguZGU+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfZHJ2LmMgfCA5ICsr
KysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfZHJ2LmMgYi9k
cml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfZHJ2LmMKPiBpbmRleCA3NjIzNzk1MzA5MjguLmZj
NzFlN2E3YTAyZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfZHJ2
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfZHJ2LmMKPiBAQCAtNzMsNiAr
NzMsMTEgQEAgc3RhdGljIGNvbnN0IHVpbnQzMl90IG14c2ZiX2Zvcm1hdHNbXSA9IHsKPiAgCURS
TV9GT1JNQVRfUkdCNTY1Cj4gIH07Cj4gIAo+ICtzdGF0aWMgY29uc3QgdWludDY0X3QgbXhzZmJf
bW9kaWZpZXJzW10gPSB7Cj4gKwlEUk1fRk9STUFUX01PRF9MSU5FQVIsCj4gKwlEUk1fRk9STUFU
X01PRF9JTlZBTElECj4gK307Cj4gKwo+ICBzdGF0aWMgc3RydWN0IG14c2ZiX2RybV9wcml2YXRl
ICoKPiAgZHJtX3BpcGVfdG9fbXhzZmJfZHJtX3ByaXZhdGUoc3RydWN0IGRybV9zaW1wbGVfZGlz
cGxheV9waXBlICpwaXBlKQo+ICB7Cj4gQEAgLTMzNCw4ICszMzksOCBAQCBzdGF0aWMgaW50IG14
c2ZiX2xvYWQoc3RydWN0IGRybV9kZXZpY2UgKmRybSwgdW5zaWduZWQgbG9uZyBmbGFncykKPiAg
CX0KPiAgCj4gIAlyZXQgPSBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZV9pbml0KGRybSwgJm14c2Zi
LT5waXBlLCAmbXhzZmJfZnVuY3MsCj4gLQkJCW14c2ZiX2Zvcm1hdHMsIEFSUkFZX1NJWkUobXhz
ZmJfZm9ybWF0cyksIE5VTEwsCj4gLQkJCW14c2ZiLT5jb25uZWN0b3IpOwo+ICsJCQlteHNmYl9m
b3JtYXRzLCBBUlJBWV9TSVpFKG14c2ZiX2Zvcm1hdHMpLAo+ICsJCQlteHNmYl9tb2RpZmllcnMs
IG14c2ZiLT5jb25uZWN0b3IpOwo+ICAJaWYgKHJldCA8IDApIHsKPiAgCQlkZXZfZXJyKGRybS0+
ZGV2LCAiQ2Fubm90IHNldHVwIHNpbXBsZSBkaXNwbGF5IHBpcGVcbiIpOwo+ICAJCWdvdG8gZXJy
X3ZibGFuazsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
