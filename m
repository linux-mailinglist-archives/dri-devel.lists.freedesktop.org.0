Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1EB1D6436
	for <lists+dri-devel@lfdr.de>; Sat, 16 May 2020 23:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5616F6E26C;
	Sat, 16 May 2020 21:23:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 896D06E26C
 for <dri-devel@lists.freedesktop.org>; Sat, 16 May 2020 21:23:40 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 21215643-1500050 
 for multiple; Sat, 16 May 2020 22:23:34 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm: Help unconfuse gcc,
 avoid accidental impossible unsigned comparisons
Date: Sat, 16 May 2020 22:23:28 +0100
Message-Id: <20200516212330.13633-2-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200516212330.13633-1-chris@chris-wilson.co.uk>
References: <20200516212330.13633-1-chris@chris-wilson.co.uk>
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5jOiBJbiBmdW5jdGlvbiDigJhkcm1f
Y2xpZW50X2Zpcm13YXJlX2NvbmZpZ+KAmToKLi9pbmNsdWRlL2xpbnV4L2JpdHMuaDoyNjoyODog
d2FybmluZzogY29tcGFyaXNvbiBvZiB1bnNpZ25lZCBleHByZXNzaW9uIDwgMCBpcyBhbHdheXMg
ZmFsc2UgWy1XdHlwZS1saW1pdHNdCiAgIF9fYnVpbHRpbl9jb25zdGFudF9wKChsKSA+IChoKSks
IChsKSA+IChoKSwgMCkpKQoKU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJp
cy13aWxzb24uY28udWs+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5j
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5jCmluZGV4IDc0NDMxMTRiZDcxMy4uNmU5NTMw
ZGYwNzM3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVudF9tb2Rlc2V0LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5jCkBAIC01NjMsNyArNTYz
LDcgQEAgc3RhdGljIGJvb2wgZHJtX2NsaWVudF9maXJtd2FyZV9jb25maWcoc3RydWN0IGRybV9j
bGllbnRfZGV2ICpjbGllbnQsCiAJCQkJICAgICAgIHN0cnVjdCBkcm1fY2xpZW50X29mZnNldCAq
b2Zmc2V0cywKIAkJCQkgICAgICAgYm9vbCAqZW5hYmxlZCwgaW50IHdpZHRoLCBpbnQgaGVpZ2h0
KQogewotCXVuc2lnbmVkIGludCBjb3VudCA9IG1pbl90KHVuc2lnbmVkIGludCwgY29ubmVjdG9y
X2NvdW50LCBCSVRTX1BFUl9MT05HKTsKKwljb25zdCBpbnQgY291bnQgPSBtaW5fdCh1bnNpZ25l
ZCBpbnQsIGNvbm5lY3Rvcl9jb3VudCwgQklUU19QRVJfTE9ORyk7CiAJdW5zaWduZWQgbG9uZyBj
b25uX2NvbmZpZ3VyZWQsIGNvbm5fc2VxLCBtYXNrOwogCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYg
PSBjbGllbnQtPmRldjsKIAlpbnQgaSwgajsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
