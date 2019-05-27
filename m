Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F682BA3F
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 20:37:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC9989A91;
	Mon, 27 May 2019 18:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5804F89A91
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 18:37:06 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id p18so19101904qkk.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 11:37:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=K6OVAmaBOqD68iXkzTW2npsdToRyLFXbtYu9zE4kNLA=;
 b=r1uvpSa1anUP++gJXCm10PX2TtQ70txB4bNUCz5sAbGmGf6HrTw0J+g2sTIcySMzYr
 Jip6ot18+kp4gev6HeYxH3bA4/UtscL2B8xWq4KM8kyKLkpC45X3z9e1g99l2qR9lQOK
 ZKAK2DPDyg4+CAmOeWeAr7Mu7bG/MBDUmLGZHiXKdQNjcPkWtmnqjPgxcm3eUoAKVNf2
 7QRivMXRmOgG2fjtFxDyHEUDU/sy1Lh/wgRZOd11aEwA/eHfF8wCpb/EmIyRdBt0Jrro
 fTBIwRbBNh4S4cZMcnIf3twJsf3UlTSP8TZ4qGcHhQIdjJj9aL5T7mCX0AKcPKFqeU6i
 IDcw==
X-Gm-Message-State: APjAAAUkQfUqQTa0yJhK1VkqpZtEudeMBXkdLiedRZymYhuYgoockQGK
 682zEOjCIsMG/NbDdMFJW/g=
X-Google-Smtp-Source: APXvYqy3oenGCtrjTihLLnWQN85/RzRKArhTIdPKQT0Kh2qE7rGimUyEkxJ1p9vIRMQfRH71BxsyKQ==
X-Received: by 2002:a37:424a:: with SMTP id p71mr16397869qka.17.1558982225455; 
 Mon, 27 May 2019 11:37:05 -0700 (PDT)
Received: from fabio-Latitude-E5450.nxp.com ([177.221.114.206])
 by smtp.gmail.com with ESMTPSA id g54sm5643754qta.51.2019.05.27.11.37.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 May 2019 11:37:04 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: maarten.lankhorst@linux.intel.com
Subject: [PATCH] drm/damage-helper: Use NULL instead of 0
Date: Mon, 27 May 2019 15:37:14 -0300
Message-Id: <20190527183714.11168-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=K6OVAmaBOqD68iXkzTW2npsdToRyLFXbtYu9zE4kNLA=;
 b=LyKX1h3pJpQRbE8YnZeWAn8KBwRgMG0OWvOs4fkY7oob6WgxUZoBDd0Nrz+yPl/XVo
 SLnDIpWWbOcqawz1IWD1mDJoGvc4PS/OY3x8H7iynL/Q6EZYvBEeQhirlMRycaWNXOuL
 xpERoCuirrB+4EmMYlcR0k1ESN9fQrCxbsLfl3CTeGA17Cal5NFVgVWzEGLGDUJhmqhW
 29noJ9rjq/yo+0RNgJeETRBGrkFSP/7sv8/MnceT6XIBGW0O5cUND8pdka/1cahEcI3f
 z09opivAWMHmu94K3VS5utIvpVKTSy2wAa3yICznZ3gMkpFIYd0jEsiLChQ9PeusTncB
 04yA==
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
Cc: maxime.ripard@bootlin.com, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlICdjbGlwcycgbWVtYmVyIGlzIGEgcG9pbnRlciwgc28gYXNzaWduIE5VTEwgaW5zdGVhZCBv
ZiAwLgoKVGhpcyBmaXhlcyB0aGUgZm9sbG93aW5nIHNwYXJzZSB3YXJuaW5nOgoKZHJpdmVycy9n
cHUvZHJtL2RybV9kYW1hZ2VfaGVscGVyLmM6Mjg5OjMxOiB3YXJuaW5nOiBVc2luZyBwbGFpbiBp
bnRlZ2VyIGFzIE5VTEwgcG9pbnRlcgoKU2lnbmVkLW9mZi1ieTogRmFiaW8gRXN0ZXZhbSA8ZmVz
dGV2YW1AZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZGFtYWdlX2hlbHBlci5j
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kYW1hZ2VfaGVscGVyLmMgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2RhbWFnZV9oZWxwZXIuYwppbmRleCBlZTY3Yzk2ODQxZmEuLjgyMzBkYWMw
MWE4OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kYW1hZ2VfaGVscGVyLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9kYW1hZ2VfaGVscGVyLmMKQEAgLTI4Niw3ICsyODYsNyBA
QCBkcm1fYXRvbWljX2hlbHBlcl9kYW1hZ2VfaXRlcl9pbml0KHN0cnVjdCBkcm1fYXRvbWljX2hl
bHBlcl9kYW1hZ2VfaXRlciAqaXRlciwKIAlpdGVyLT5wbGFuZV9zcmMueTIgPSAoc3RhdGUtPnNy
Yy55MiA+PiAxNikgKyAhIShzdGF0ZS0+c3JjLnkyICYgMHhGRkZGKTsKIAogCWlmICghaXRlci0+
Y2xpcHMgfHwgIWRybV9yZWN0X2VxdWFscygmc3RhdGUtPnNyYywgJm9sZF9zdGF0ZS0+c3JjKSkg
ewotCQlpdGVyLT5jbGlwcyA9IDA7CisJCWl0ZXItPmNsaXBzID0gTlVMTDsKIAkJaXRlci0+bnVt
X2NsaXBzID0gMDsKIAkJaXRlci0+ZnVsbF91cGRhdGUgPSB0cnVlOwogCX0KLS0gCjIuMTcuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
