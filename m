Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBBD2B4DD1
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:42:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79B366E9FC;
	Mon, 16 Nov 2020 17:42:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0594D6E9FC
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:42:14 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c17so19630512wrc.11
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z9hqlcpW7hereULOoI8627Xoa15VHuxF/Ol1jNzvX80=;
 b=VzWzCJBPPmyM3LpM7la4ilnDI68trSv7JH2kfu2f+DU0i4SMuZmeKKXiNLD1Hu4Etc
 wIhTyantuHh0S7h+NwM9t/QpaHtrBiT/mhLmz2It8yTttVcJAvk3V+u2b40CnNADXgKR
 HA6ChwT3TtKgoqlfuS732ua9sE7/x3Av0/dDNvBe+qbOU7Qkb4DYV+WabOT4A/++AZgY
 urAa0e+d4vnAcXCsaIw3qiDif6pZknYz13s9Xt2VaOHpca1hEYKNdjSMuim15K33YJXr
 wcsFYRRcZBKmBLiqjcaZk+SZrNmLGMiuVVoTO+Hja3MJLGnOx6GDJUgm/SZVzDrPyaAJ
 pwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z9hqlcpW7hereULOoI8627Xoa15VHuxF/Ol1jNzvX80=;
 b=rZUHILw54o+kdBUjQXSdRCgWvGYz9F8P/yWzA7xkIrsVKv99bwRJkVUyPHJ4WARuHD
 6BcW0MaPee5TYheqgP26dJuPbE/Ym6W2SZdVChwZGrN4+KDbGqx3nB3mkdffimTD8UBD
 p1Ck5WhYQC3mAcm961ETSrmZRsws3U8Ts/5O3E7gRPBraEN3BYLdJI7iC5GQh8SZRIUW
 xUjRyCYn3eISiYN1Y+mQ6i5EZXSYcrR4aUbLhUpYtpGGyyqcTRy/m52gH4lb72KT4Ule
 8oLbm6Bw+Fu86mILWd76z5VucRymdIvBmIGRfCu3SL5nz7b1y+tGGPOZVOjSm8swlxjr
 u5FA==
X-Gm-Message-State: AOAM5310p5f4lZVPt4gjf+YhJAPWYvwIEGpQkM37XBl8SGRijf9hSih9
 /FpeqCUhPs1ivO+Nb0U/HcqTtw==
X-Google-Smtp-Source: ABdhPJwe4OeSF0fUEzmtQPCyVZBNL4CH7EopB3/QGF4xEgcwY0RS9lBoS1zjZjxDp+VwWScJhmJ/Ww==
X-Received: by 2002:a05:6000:110c:: with SMTP id
 z12mr20268702wrw.214.1605548532636; 
 Mon, 16 Nov 2020 09:42:12 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:42:12 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 37/42] drm/vc4/vc4_hdmi_regs: Mark some data sets as
 __maybe_unused
Date: Mon, 16 Nov 2020 17:41:07 +0000
Message-Id: <20201116174112.1833368-38-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
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
