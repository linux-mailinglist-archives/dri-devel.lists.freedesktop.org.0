Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCCFDDBA9
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2019 02:07:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECBB189D49;
	Sun, 20 Oct 2019 00:07:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F91089E19
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2019 08:36:12 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id t16so3412277wrr.1
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2019 01:36:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XXUGs3TD/mQ9EDaZ43OuKw31dOCYSa+NG57KsS4H5LI=;
 b=o4XY0Xo2w/qOoOO78YwtUQfiAkeZIE6sxHXYIvOS+A0KE9BrvS2bEHzpZs3Vnpzz+F
 XXlMxqDzuy5B5j4pkDtO18AuA6S4z5aTzkE5rF5deAPca1NggyNhq5mhHPmV3eqTKj0u
 h+dDCK5HsZ+qsqTOFU/jeq83gJWRhFDQlfOEkx8vQwTHFLjWn4l3FfK23C7A0sZunu4M
 19N3SCzdGF0FhlVoYloZPadgKwR9e617OoThZXZqhDY0DMBOOIvR6vi7q+8coMCpcF7E
 9jekeU/qGxuon0eFlbuRwNs9VpwvqLIi7wzLHZt2qgygAsPcfGY+E61IH40Gz3aAZCIP
 BuxQ==
X-Gm-Message-State: APjAAAXFehHfydWPmR2RK0gqKCPiOiOU5a/j9cIJzIOSmer1hCHuOTZq
 3N+HPuvWJk/AsK3N2QmQL/WUMw==
X-Google-Smtp-Source: APXvYqxPlR4nFfXz0/v7vOrifsB6kSjQvy0Wc6RIcmJ4sgheny/orFuy+qohKi8LgVIRjVcx5C5DJg==
X-Received: by 2002:a5d:4f8b:: with SMTP id d11mr758160wru.25.1571474170742;
 Sat, 19 Oct 2019 01:36:10 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
 by smtp.gmail.com with ESMTPSA id u1sm7242627wmc.38.2019.10.19.01.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Oct 2019 01:36:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v6 1/9] backlight: gpio: remove unneeded include
Date: Sat, 19 Oct 2019 10:35:48 +0200
Message-Id: <20191019083556.19466-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191019083556.19466-1-brgl@bgdev.pl>
References: <20191019083556.19466-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 20 Oct 2019 00:06:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XXUGs3TD/mQ9EDaZ43OuKw31dOCYSa+NG57KsS4H5LI=;
 b=BwfSeKvNQho1S2E0R2jApkJ/vho0BYWPz+4V23X7TOnHYSRx3lpOCWdHMbDRFkxEBY
 d17qES1EiwEJenWdMuh8jPg5mCZrt53cDRFr1wi4aQbOGodZoZjInfEvDZXE1XvGwekY
 1/6Y7IIWM6Ub5sX6wkkPbWZhx0ViiXmKPmf8I3A9keQoHm8nmBtNzKut+RPGquxny5Xx
 XQstSrDGl7h2Onpoi4YTSp0XNaFglAgp5x1e7ywXrAnZWfp5jh+RDh5VCfLaCxNDLGWk
 xiZXU3GLEsnOYQ18EI3ciR5deo3EiCnpeWXE5hO8DYE3+FhSTW5LU3DaapmmQYvki14c
 wXuA==
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

RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KCldl
IG5vIGxvbmdlciB1c2UgYW55IHN5bWJvbHMgZnJvbSBvZl9ncGlvLmguIFJlbW92ZSB0aGlzIGlu
Y2x1ZGUuCgpTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lA
YmF5bGlicmUuY29tPgpSZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBs
aW5hcm8ub3JnPgpSZXZpZXdlZC1ieTogRGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhvbXBzb25A
bGluYXJvLm9yZz4KUmV2aWV3ZWQtYnk6IEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVu
a29AbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFj
a2xpZ2h0LmMgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYyBiL2RyaXZlcnMvdmlk
ZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMKaW5kZXggMThlMDUzZTQ3MTZjLi43ZTE5OTAx
OTlmYWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0
LmMKKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYwpAQCAtMTIs
NyArMTIsNiBAQAogI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgogI2luY2x1ZGUgPGxpbnV4L21v
ZHVsZS5oPgogI2luY2x1ZGUgPGxpbnV4L29mLmg+Ci0jaW5jbHVkZSA8bGludXgvb2ZfZ3Bpby5o
PgogI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RhdGEvZ3Bpb19iYWNrbGlnaHQuaD4KICNpbmNs
dWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KICNpbmNsdWRlIDxsaW51eC9wcm9wZXJ0eS5o
PgotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
