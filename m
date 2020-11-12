Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0173A2B0D1A
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 20:01:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7AFA6E32F;
	Thu, 12 Nov 2020 19:01:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E6D6E32F
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 19:01:07 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p8so7170902wrx.5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 11:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z9hqlcpW7hereULOoI8627Xoa15VHuxF/Ol1jNzvX80=;
 b=s8i5onDX/rg5gWCD7HaLyJM+wKiQn/RZHAN9N9s+jIYLgKocbJRWeJW96iZ7piGHrf
 cUr8rpL/UIFShlV4GrkjRsUCsedoNDq/fh/oUHIWBIyscRKe8qiIrkvUYW/2CpQF45so
 T9ZB4CcBZIJOhzW8rea3CXj3gRVDYzXC/aMzOvVQKn+pceTygbzdDUdFCj3gng5sd9HD
 iolE2XLyKcEBDSYrqmdxvTp1D5N8IfFOYD6+jUfNaUD08qpeq5jIcTWy9qcFqonNF+LH
 PT+Rpe69EN5bZ4oNGoUhkIJ767NqzJSxU+YIikqm+6fYF3H56oTb8abF9G3LtFRQtClZ
 +Q/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z9hqlcpW7hereULOoI8627Xoa15VHuxF/Ol1jNzvX80=;
 b=EF2Uu9FjjCgZFxpnOYKBUAVX8Awscr2VhAtA1I2v2sYSgML3mo5WGoIYOtW9C0HTz9
 8YH/urJyx+gjU1SRh/ZvekhcCfQCbg8SJF1/8KyR5v47h5ZuKlVify754+FmwaIQiKsl
 /SFIy86hupV+/CPeL/r/X6DjZvBJd355HYWfsk1Veg2Ma9SkZu+8rh3IyEiWfRxEi1Bb
 4tRDMM/JzwUy5/p7AhRzwVpddWBU090DwUt0KbHrsgOYmgDxF0s9ZrbhXC/3Vn/vrDUP
 nXqPnxbBsXjkD4ee1FBU0eOHXgmKUvH8h2NhE7w1sP6t7DI8+xt3VFsmoXHJfAL6boKS
 GctA==
X-Gm-Message-State: AOAM531BJra0zltB2JpY0IUiV8eh0TlSSCScrAc4ykDjVCT8x8wGK3Cc
 DuzgRWMoNashiE+jL+kg/fwZdA==
X-Google-Smtp-Source: ABdhPJzqYmCuCuPGUHhvR1gFv1JTE0Oj+Uvn7zIksuPSSRPWbaMe6RqDfiiHzGBdAR4sf5iqgyFqWw==
X-Received: by 2002:a5d:54c7:: with SMTP id x7mr1071487wrv.359.1605207665964; 
 Thu, 12 Nov 2020 11:01:05 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id p4sm8105214wrm.51.2020.11.12.11.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 11:01:05 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 10/30] drm/vc4/vc4_hdmi_regs: Mark some data sets as
 __maybe_unused
Date: Thu, 12 Nov 2020 19:00:19 +0000
Message-Id: <20201112190039.2785914-11-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112190039.2785914-1-lee.jones@linaro.org>
References: <20201112190039.2785914-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGFsdGVybmF0aXZlIGlzIHRvIG1vdmUgdGhlbSBpbnRvIHRoZSBzb3VyY2UgZmlsZSB0aGF0
IHVzZXMgdGhlbiwKYnV0IHRoZXkgYXJlIGxhcmdlIGFuZCBpbnRydXNpdmUsIHNvIHRoYXQgc3Ry
YXRlZ3kgaXMgYmVpbmcgYXZvaWRlZC4KCkZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBi
dWlsZCB3YXJuaW5nKHMpOgoKIGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2hkbWlfcmVncy5oOjI4
MjozOTogd2FybmluZzog4oCYdmM1X2hkbWlfaGRtaTFfZmllbGRz4oCZIGRlZmluZWQgYnV0IG5v
dCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dCiBkcml2ZXJzL2dwdS9kcm0vdmM0L3Zj
NF9oZG1pX3JlZ3MuaDoyMDY6Mzk6IHdhcm5pbmc6IOKAmHZjNV9oZG1pX2hkbWkwX2ZpZWxkc+KA
mSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQogZHJpdmVy
cy9ncHUvZHJtL3ZjNC92YzRfaGRtaV9yZWdzLmg6MTQ1OjM5OiB3YXJuaW5nOiDigJh2YzRfaGRt
aV9maWVsZHPigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxl
PV0KCkNjOiBFcmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0PgpDYzogTWF4aW1lIFJpcGFyZCA8
bXJpcGFyZEBrZXJuZWwub3JnPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpD
YzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8u
b3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2hkbWlfcmVncy5oIHwgNiArKystLS0K
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaV9yZWdzLmggYi9kcml2ZXJzL2dwdS9k
cm0vdmM0L3ZjNF9oZG1pX3JlZ3MuaAppbmRleCA3YzZiNDgxOGYyNDU1Li45NmQ3NjRlYmZlNjc1
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1pX3JlZ3MuaAorKysgYi9k
cml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1pX3JlZ3MuaApAQCAtMTQyLDcgKzE0Miw3IEBAIHN0
cnVjdCB2YzRfaGRtaV9yZWdpc3RlciB7CiAjZGVmaW5lIFZDNV9SQU1fUkVHKHJlZywgb2Zmc2V0
KQlfVkM0X1JFRyhWQzVfUkFNLCByZWcsIG9mZnNldCkKICNkZWZpbmUgVkM1X1JNX1JFRyhyZWcs
IG9mZnNldCkJCV9WQzRfUkVHKFZDNV9STSwgcmVnLCBvZmZzZXQpCiAKLXN0YXRpYyBjb25zdCBz
dHJ1Y3QgdmM0X2hkbWlfcmVnaXN0ZXIgdmM0X2hkbWlfZmllbGRzW10gPSB7CitzdGF0aWMgY29u
c3Qgc3RydWN0IHZjNF9oZG1pX3JlZ2lzdGVyIF9fbWF5YmVfdW51c2VkIHZjNF9oZG1pX2ZpZWxk
c1tdID0gewogCVZDNF9IRF9SRUcoSERNSV9NX0NUTCwgMHgwMDBjKSwKIAlWQzRfSERfUkVHKEhE
TUlfTUFJX0NUTCwgMHgwMDE0KSwKIAlWQzRfSERfUkVHKEhETUlfTUFJX1RIUiwgMHgwMDE4KSwK
QEAgLTIwMyw3ICsyMDMsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHZjNF9oZG1pX3JlZ2lzdGVy
IHZjNF9oZG1pX2ZpZWxkc1tdID0gewogCVZDNF9IRE1JX1JFRyhIRE1JX1JBTV9QQUNLRVRfU1RB
UlQsIDB4MDQwMCksCiB9OwogCi1zdGF0aWMgY29uc3Qgc3RydWN0IHZjNF9oZG1pX3JlZ2lzdGVy
IHZjNV9oZG1pX2hkbWkwX2ZpZWxkc1tdID0geworc3RhdGljIGNvbnN0IHN0cnVjdCB2YzRfaGRt
aV9yZWdpc3RlciBfX21heWJlX3VudXNlZCB2YzVfaGRtaV9oZG1pMF9maWVsZHNbXSA9IHsKIAlW
QzRfSERfUkVHKEhETUlfRFZQX0NUTCwgMHgwMDAwKSwKIAlWQzRfSERfUkVHKEhETUlfTUFJX0NU
TCwgMHgwMDEwKSwKIAlWQzRfSERfUkVHKEhETUlfTUFJX1RIUiwgMHgwMDE0KSwKQEAgLTI3OSw3
ICsyNzksNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHZjNF9oZG1pX3JlZ2lzdGVyIHZjNV9oZG1p
X2hkbWkwX2ZpZWxkc1tdID0gewogCVZDNV9DU0NfUkVHKEhETUlfQ1NDXzM0XzMzLCAweDAxOCks
CiB9OwogCi1zdGF0aWMgY29uc3Qgc3RydWN0IHZjNF9oZG1pX3JlZ2lzdGVyIHZjNV9oZG1pX2hk
bWkxX2ZpZWxkc1tdID0geworc3RhdGljIGNvbnN0IHN0cnVjdCB2YzRfaGRtaV9yZWdpc3RlciBf
X21heWJlX3VudXNlZCB2YzVfaGRtaV9oZG1pMV9maWVsZHNbXSA9IHsKIAlWQzRfSERfUkVHKEhE
TUlfRFZQX0NUTCwgMHgwMDAwKSwKIAlWQzRfSERfUkVHKEhETUlfTUFJX0NUTCwgMHgwMDMwKSwK
IAlWQzRfSERfUkVHKEhETUlfTUFJX1RIUiwgMHgwMDM0KSwKLS0gCjIuMjUuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
