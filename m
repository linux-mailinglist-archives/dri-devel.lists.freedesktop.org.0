Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1698FDDB9E
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2019 02:07:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E38EA89CAF;
	Sun, 20 Oct 2019 00:07:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 797E989F08
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2019 08:36:20 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id o28so8548279wro.7
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2019 01:36:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fJb9zTJUFk5gt04WV606l1pH2Oso/m6U1KjJZ/jsQAQ=;
 b=LFA7gtdoPwqdORQqoLl9xbhdjgh7D8JAzuZyWLgKw9bVRBWaFedNKlnxyAZurR/DEe
 wlKiFbqvE2gV32U9g7m3BVOAJULJyG8tUNva/20UtoExUpk/WOwI2getzZpcEytJyuxy
 eLWY/XAp3U1hCyp8m386XtvQE5ZdeogNUE7BkF98AVKcROAz3WJWp09E040cqsv8/42J
 r3F6f8PhziFGtJfKKLMS7X0emvrJjw/ECMOc9UH8cHwxg8igElg/ECwdAlgMQdNFQrp0
 r7MUy9Ad8pwVPJXogopP+cO06moNRQOWpZS8kmW+XPP/S1svM2wvHDXBAjjO/fZGSlFm
 Z66g==
X-Gm-Message-State: APjAAAWHzfy/ZpmykKK0Gai12KmTfs6OvuX1FcNvDsyoQoLfhbsMU3zP
 Ojxpz+LnImVY93To/ZM+AkzrYg==
X-Google-Smtp-Source: APXvYqyC7Ckh43yEeLj+N7+h+UruFS+0KKtHRNyoTyt/JpzLBEE5Q2IIWFp45JPp3FFZIDaUQ2sQwg==
X-Received: by 2002:a5d:6984:: with SMTP id g4mr1432291wru.43.1571474179094;
 Sat, 19 Oct 2019 01:36:19 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
 by smtp.gmail.com with ESMTPSA id u1sm7242627wmc.38.2019.10.19.01.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Oct 2019 01:36:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v6 7/9] backlight: gpio: remove unused fields from platform
 data
Date: Sat, 19 Oct 2019 10:35:54 +0200
Message-Id: <20191019083556.19466-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191019083556.19466-1-brgl@bgdev.pl>
References: <20191019083556.19466-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 20 Oct 2019 00:06:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fJb9zTJUFk5gt04WV606l1pH2Oso/m6U1KjJZ/jsQAQ=;
 b=P1X7rjfTUJ3nuQIt5WgPxo/bWVF1kNL7UC7z6D3mpB5+R/b/fRt812wGTpBYsf1l4X
 yLrW5jtqYTj9YCVhQyVaKhVahExaGBVsQ24kF8hxTisINKX9Ki9dkJoqd2OpUJpey5aw
 RJJfG8f4obCZrlt1J0H/Aed3CeK19+tFD1NoDtUEVAktPR+PGIL/dtASqLofSrkNqxKp
 OuTN9is8GL3bPXKg141be4zDoB0/wM51Cbdiu+mJ4FQidBEmd8QXf3ney/4vuQGHJQlL
 h+uHFSpFqfIzhmhbYrFM7LUnDmKWRncFKOUNY6CY2/IQnjXIx1JqTuDAaUOQDcS+FrRP
 UXAg==
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
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sh@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KClJl
bW92ZSB0aGUgcGxhdGZvcm0gZGF0YSBmaWVsZHMgdGhhdCBub2JvZHkgdXNlcy4KClNpZ25lZC1v
ZmYtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+ClJl
dmlld2VkLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVs
LmNvbT4KUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9y
Zz4KUmV2aWV3ZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5v
cmc+Ci0tLQogaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhL2dwaW9fYmFja2xpZ2h0LmggfCAz
IC0tLQogMSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9saW51eC9wbGF0Zm9ybV9kYXRhL2dwaW9fYmFja2xpZ2h0LmggYi9pbmNsdWRlL2xpbnV4L3Bs
YXRmb3JtX2RhdGEvZ3Bpb19iYWNrbGlnaHQuaAppbmRleCAzNDE3OWQ2MDAzNjAuLjFhOGI1YjE5
NDZmZSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhL2dwaW9fYmFja2xp
Z2h0LmgKKysrIGIvaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhL2dwaW9fYmFja2xpZ2h0LmgK
QEAgLTksOSArOSw2IEBAIHN0cnVjdCBkZXZpY2U7CiAKIHN0cnVjdCBncGlvX2JhY2tsaWdodF9w
bGF0Zm9ybV9kYXRhIHsKIAlzdHJ1Y3QgZGV2aWNlICpmYmRldjsKLQlpbnQgZ3BpbzsKLQlpbnQg
ZGVmX3ZhbHVlOwotCWNvbnN0IGNoYXIgKm5hbWU7CiB9OwogCiAjZW5kaWYKLS0gCjIuMjMuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
