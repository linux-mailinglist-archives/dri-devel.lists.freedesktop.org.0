Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A45106996
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 11:05:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C6C6EEA4;
	Fri, 22 Nov 2019 10:05:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B866EEAD
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2019 10:05:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9187BB154;
 Fri, 22 Nov 2019 10:05:47 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 2/6] drm/gma500: Remove field 'fbdev' from struct
 psb_framebuffer
Date: Fri, 22 Nov 2019 11:05:41 +0100
Message-Id: <20191122100545.16812-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191122100545.16812-1-tzimmermann@suse.de>
References: <20191122100545.16812-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGZpZWxkICdmYmRldicgaW4gc3RydWN0IHBzYl9mcmFtZWJ1ZmZlciBzZXJ2ZXMgbm8gcHVy
cG9zZS4gUmVtb3ZlCml0LgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9mcmFtZWJ1ZmZlci5j
IHwgMSAtCiBkcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2ZyYW1lYnVmZmVyLmggfCAxIC0KIDIgZmls
ZXMgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
Z21hNTAwL2ZyYW1lYnVmZmVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2ZyYW1lYnVmZmVy
LmMKaW5kZXggNTk4ZGM1MWQ5ZTI0Li5mNTZhMWZjZjU4YWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9nbWE1MDAvZnJhbWVidWZmZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAw
L2ZyYW1lYnVmZmVyLmMKQEAgLTM4Myw3ICszODMsNiBAQCBzdGF0aWMgaW50IHBzYmZiX2NyZWF0
ZShzdHJ1Y3QgcHNiX2ZiZGV2ICpmYmRldiwKIAkJZ290byBvdXQ7CiAKIAlmYiA9ICZwc2JmYi0+
YmFzZTsKLQlwc2JmYi0+ZmJkZXYgPSBpbmZvOwogCiAJZmJkZXYtPnBzYl9mYl9oZWxwZXIuZmIg
PSBmYjsKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9mcmFtZWJ1ZmZlci5o
IGIvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9mcmFtZWJ1ZmZlci5oCmluZGV4IGEyZDY4ZGQ3NGMx
Mi4uOTVkNDQ4NWRjODYwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2ZyYW1l
YnVmZmVyLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9mcmFtZWJ1ZmZlci5oCkBAIC0x
NSw3ICsxNSw2IEBACiAKIHN0cnVjdCBwc2JfZnJhbWVidWZmZXIgewogCXN0cnVjdCBkcm1fZnJh
bWVidWZmZXIgYmFzZTsKLQlzdHJ1Y3QgZmJfaW5mbyAqZmJkZXY7CiB9OwogCiBzdHJ1Y3QgcHNi
X2ZiZGV2IHsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
