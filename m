Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 286EB315BE
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2019 21:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE57898F0;
	Fri, 31 May 2019 19:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD45C892CD;
 Fri, 31 May 2019 09:46:32 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id C82CB3E80A;
 Fri, 31 May 2019 09:46:31 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: robdclark@gmail.com, sean@poorly.run, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 airlied@linux.ie, daniel@ffwll.ch, linux-kernel@vger.kernel.org,
 linus.walleij@linaro.org, jonathan@marek.ca, robh@kernel.org,
 jeffrey.l.hugo@gmail.com
Subject: [PATCH v3 4/6] ARM: dts: qcom: msm8974-hammerhead: add support for
 backlight
Date: Fri, 31 May 2019 05:46:17 -0400
Message-Id: <20190531094619.31704-5-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190531094619.31704-1-masneyb@onstation.org>
References: <20190531094619.31704-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 31 May 2019 19:58:01 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1559295992;
 bh=z19j7KTiQGNjB+y5FL55+Cd65y/Lrg2+p2hbtOtwvj8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=czFJjNlsFURU6O7RJWBWz4QRnjcfhrn2QruWHjw9xlo+PwertXAo7MiYnt5/UHxjZ
 s93hTyxB6ULeaKiIpNiqt4ex2Ytaxeey3GCYgf8nmPgMZl7Dz+ChZHtFd7fvhq4Vsr
 vtwNq0K0Gx1UxlbgqAQ0F1mHhyjTNJ3g1EtSb4g8=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIG5lY2Vzc2FyeSBkZXZpY2UgdHJlZSBub2RlcyBmb3IgdGhlIG1haW4gTENEIGJhY2tsaWdo
dC4KClNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3JnPgpS
ZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgotLS0K
IC4uLi9xY29tLW1zbTg5NzQtbGdlLW5leHVzNS1oYW1tZXJoZWFkLmR0cyAgICB8IDM0ICsrKysr
KysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvcWNvbS1tc204OTc0LWxnZS1uZXh1czUtaGFtbWVyaGVh
ZC5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9xY29tLW1zbTg5NzQtbGdlLW5leHVzNS1oYW1tZXJo
ZWFkLmR0cwppbmRleCAxZmQ5ZjQyOWYzNGEuLjUxODg5ZDY2YjU1YSAxMDA2NDQKLS0tIGEvYXJj
aC9hcm0vYm9vdC9kdHMvcWNvbS1tc204OTc0LWxnZS1uZXh1czUtaGFtbWVyaGVhZC5kdHMKKysr
IGIvYXJjaC9hcm0vYm9vdC9kdHMvcWNvbS1tc204OTc0LWxnZS1uZXh1czUtaGFtbWVyaGVhZC5k
dHMKQEAgLTI5MCw2ICsyOTAsMTYgQEAKIAkJCX07CiAJCX07CiAKKwkJaTJjMTFfcGluczogaTJj
MTEgeworCQkJbXV4IHsKKwkJCQlwaW5zID0gImdwaW84MyIsICJncGlvODQiOworCQkJCWZ1bmN0
aW9uID0gImJsc3BfaTJjMTEiOworCisJCQkJZHJpdmUtc3RyZW5ndGggPSA8Mj47CisJCQkJYmlh
cy1kaXNhYmxlOworCQkJfTsKKwkJfTsKKwogCQlpMmMxMl9waW5zOiBpMmMxMiB7CiAJCQltdXgg
ewogCQkJCXBpbnMgPSAiZ3Bpbzg3IiwgImdwaW84OCI7CkBAIC00MDAsNiArNDEwLDMwIEBACiAJ
CX07CiAJfTsKIAorCWkyY0BmOTk2NzAwMCB7CisJCXN0YXR1cyA9ICJvayI7CisJCXBpbmN0cmwt
bmFtZXMgPSAiZGVmYXVsdCI7CisJCXBpbmN0cmwtMCA9IDwmaTJjMTFfcGlucz47CisJCWNsb2Nr
LWZyZXF1ZW5jeSA9IDwzNTUwMDA+OworCQlxY29tLHNyYy1mcmVxID0gPDUwMDAwMDAwPjsKKwor
CQlsZWQtY29udHJvbGxlckAzOCB7CisJCQljb21wYXRpYmxlID0gInRpLGxtMzYzMGEiOworCQkJ
c3RhdHVzID0gIm9rIjsKKwkJCXJlZyA9IDwweDM4PjsKKworCQkJI2FkZHJlc3MtY2VsbHMgPSA8
MT47CisJCQkjc2l6ZS1jZWxscyA9IDwwPjsKKworCQkJbGVkQDAgeworCQkJCXJlZyA9IDwwPjsK
KwkJCQlsZWQtc291cmNlcyA9IDwwIDE+OworCQkJCWxhYmVsID0gImxjZC1iYWNrbGlnaHQiOwor
CQkJCWRlZmF1bHQtYnJpZ2h0bmVzcyA9IDwyMDA+OworCQkJfTsKKwkJfTsKKwl9OworCiAJaTJj
QGY5OTY4MDAwIHsKIAkJc3RhdHVzID0gIm9rIjsKIAkJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0
IjsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
