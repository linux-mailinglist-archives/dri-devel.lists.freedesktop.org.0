Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDEB1A2B0D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 23:24:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0F66E169;
	Wed,  8 Apr 2020 21:24:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07EBB6E169
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 21:24:28 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 20844177-1500050 
 for multiple; Wed, 08 Apr 2020 22:24:07 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Don't return 0 from a void drm_fbdev_generic_setup
Date: Wed,  8 Apr 2020 22:24:07 +0100
Message-Id: <20200408212407.4309-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJtX2ZiZGV2X2dlbmVyaWNfc2V0dXAoKSB3YXMgY2hhbmdlZCB0byBiZSBhIHZvaWQgcmV0dXJu
LCBidXQgdGhlIHN0dWIKd2FzIGxlZnQgcmV0dXJuaW5nIDAuCgouL2luY2x1ZGUvZHJtL2RybV9m
Yl9oZWxwZXIuaDogSW4gZnVuY3Rpb24g4oCYZHJtX2ZiZGV2X2dlbmVyaWNfc2V0dXDigJk6Ci4v
aW5jbHVkZS9kcm0vZHJtX2ZiX2hlbHBlci5oOjQ1MDo5OiB3YXJuaW5nOiDigJhyZXR1cm7igJkg
d2l0aCBhIHZhbHVlLCBpbiBmdW5jdGlvbiByZXR1cm5pbmcgdm9pZCBbLVdyZXR1cm4tdHlwZV0K
Li9pbmNsdWRlL2RybS9kcm1fZmJfaGVscGVyLmg6NDQ4OjE6IG5vdGU6IGRlY2xhcmVkIGhlcmUK
ICA0NDggfCBkcm1fZmJkZXZfZ2VuZXJpY19zZXR1cChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1
bnNpZ25lZCBpbnQgcHJlZmVycmVkX2JwcCkKCkZpeGVzOiAxYWVkOTUwOWIyOWEgKCJkcm0vZmIt
aGVscGVyOiBSZW1vdmUgcmV0dXJuIHZhbHVlIGZyb20gZHJtX2ZiZGV2X2dlbmVyaWNfc2V0dXAo
KSIpClNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVr
PgpDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+CkNjOiBTYW0gUmF2
bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Ci0tLQogaW5jbHVkZS9kcm0vZHJtX2ZiX2hlbHBlci5o
IHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2luY2x1
ZGUvZHJtL2RybV9mYl9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9mYl9oZWxwZXIuaAppbmRl
eCBmYjAzN2JlODM5OTcuLjMwNmFhM2E2MGJlOSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJt
X2ZiX2hlbHBlci5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9mYl9oZWxwZXIuaApAQCAtNDQ3LDcg
KzQ0Nyw2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBkcm1fZmJfaGVscGVyX291dHB1dF9wb2xsX2No
YW5nZWQoc3RydWN0IGRybV9kZXZpY2UgKmRldikKIHN0YXRpYyBpbmxpbmUgdm9pZAogZHJtX2Zi
ZGV2X2dlbmVyaWNfc2V0dXAoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IHBy
ZWZlcnJlZF9icHApCiB7Ci0JcmV0dXJuIDA7CiB9CiAKICNlbmRpZgotLSAKMi4yMC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
