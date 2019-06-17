Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B39484E5
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 16:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 320C389265;
	Mon, 17 Jun 2019 14:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A9A989267;
 Mon, 17 Jun 2019 14:07:28 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 4FDC95C2258;
 Mon, 17 Jun 2019 15:59:20 +0200 (CEST)
MIME-Version: 1.0
Date: Mon, 17 Jun 2019 15:59:20 +0200
From: Stefan Agner <stefan@agner.ch>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 22/59] drm/mxsfb: Drop drm_gem_prime_export/import
In-Reply-To: <20190614203615.12639-23-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-23-daniel.vetter@ffwll.ch>
Message-ID: <059b788d46482f3391737a016eb47f58@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.7
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1560779960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KhgnWDt7MaNAVpnDtbz9ZJ+MmEsayIckDtW20dx4WZE=;
 b=s5UlJEMgB8DUD8jd7KL36lnibTs8uY9J+pEaqmCo902/AJPzBhQXdOvQfV1Ob3rjA3t/z2
 w8A8M5X5meIVVQD7hUm3Vm1xdNnve4RxyZlc7/rcbIzj1GN1YgIw/Ih2GVFcSyjmrlodLg
 MnsSrk1hmWhA+Pq9eR0+qKD0SAzfDuo=
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
Cc: Marek Vasut <marex@denx.de>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTQuMDYuMjAxOSAyMjozNSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBUaGV5J3JlIHRoZSBk
ZWZhdWx0Lgo+IAo+IEFzaWRlOiBXb3VsZCBiZSByZWFsbHkgbmljZSB0byBzd2l0Y2ggdGhlIG90
aGVycyBvdmVyIHRvCj4gZHJtX2dlbV9vYmplY3RfZnVuY3MuCgpBY2tlZC1ieTogU3RlZmFuIEFn
bmVyIDxzdGVmYW5AYWduZXIuY2g+CgotLQpTdGVmYW4KCj4gCj4gU2lnbmVkLW9mZi1ieTogRGFu
aWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gQ2M6IE1hcmVrIFZhc3V0IDxt
YXJleEBkZW54LmRlPgo+IENjOiBTdGVmYW4gQWduZXIgPHN0ZWZhbkBhZ25lci5jaD4KPiBDYzog
U2hhd24gR3VvIDxzaGF3bmd1b0BrZXJuZWwub3JnPgo+IENjOiBTYXNjaGEgSGF1ZXIgPHMuaGF1
ZXJAcGVuZ3V0cm9uaXguZGU+Cj4gQ2M6IFBlbmd1dHJvbml4IEtlcm5lbCBUZWFtIDxrZXJuZWxA
cGVuZ3V0cm9uaXguZGU+Cj4gQ2M6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4K
PiBDYzogTlhQIExpbnV4IFRlYW0gPGxpbnV4LWlteEBueHAuY29tPgo+IENjOiBsaW51eC1hcm0t
a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL214c2Zi
L214c2ZiX2Rydi5jIHwgMiAtLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2Rydi5jCj4gYi9kcml2
ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfZHJ2LmMKPiBpbmRleCBiNWJjYWY0MDM2YmQuLjZkNmEw
YjNlMmJiMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfZHJ2LmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfZHJ2LmMKPiBAQCAtMzIyLDggKzMy
Miw2IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciBteHNmYl9kcml2ZXIgPSB7Cj4gIAkuZHVt
Yl9jcmVhdGUJCT0gZHJtX2dlbV9jbWFfZHVtYl9jcmVhdGUsCj4gIAkucHJpbWVfaGFuZGxlX3Rv
X2ZkCT0gZHJtX2dlbV9wcmltZV9oYW5kbGVfdG9fZmQsCj4gIAkucHJpbWVfZmRfdG9faGFuZGxl
CT0gZHJtX2dlbV9wcmltZV9mZF90b19oYW5kbGUsCj4gLQkuZ2VtX3ByaW1lX2V4cG9ydAk9IGRy
bV9nZW1fcHJpbWVfZXhwb3J0LAo+IC0JLmdlbV9wcmltZV9pbXBvcnQJPSBkcm1fZ2VtX3ByaW1l
X2ltcG9ydCwKPiAgCS5nZW1fcHJpbWVfZ2V0X3NnX3RhYmxlCT0gZHJtX2dlbV9jbWFfcHJpbWVf
Z2V0X3NnX3RhYmxlLAo+ICAJLmdlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUgPSBkcm1fZ2VtX2Nt
YV9wcmltZV9pbXBvcnRfc2dfdGFibGUsCj4gIAkuZ2VtX3ByaW1lX3ZtYXAJCT0gZHJtX2dlbV9j
bWFfcHJpbWVfdm1hcCwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
