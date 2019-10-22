Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 552FEE13A4
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 10:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05DE36E98F;
	Wed, 23 Oct 2019 08:09:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 451486E454
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 08:36:40 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 6so3150603wmf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 01:36:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2xc7P6YHG166j+xVZ+q+qvlahi4iLSSnRxTtpR6znoo=;
 b=E8ZxQQaYSiZW5MaCSsvbqUe+KNOE8InuGG77E69yYBbWzDl+xV4omTmAvStHIQcPNA
 MqgxYS1eUaFiBS9BsE4MxKcEtBMbRzD821vC+GiLO/CUW9gEPvTcSzzEnBJY5Uu6cteq
 ilwoyzxVC4+w5m6NLOALI1W63G0ziN2g8XAz241J/rcbvxIqzD4IF0uNg68ZQ7OycNqs
 nWvI9jipDoSGwxxbqjVlUWyzfopWD2clU3kTaVXULApenstgJeCt49ykgFTR47ynbgBS
 aN1njDborLtfw3bis7yBV2cbtPpFoty4mgbrdzB8NDRHMqiPTehVwj7tgDL8iEQsjpXw
 fLkA==
X-Gm-Message-State: APjAAAVe3wsl503Iy16WruPBbKT2xsP6X+AF0mpurczwu4rLogafVSzY
 RWYKi758ws9349NPEY1Ig1ESww==
X-Google-Smtp-Source: APXvYqyy9MvnYosLqyhGfKwbAizvJ2k43MowPI9FAKwbz4NYrwbFvayyhqWxgKL+r8/O7OFc8r1k2Q==
X-Received: by 2002:a7b:ce94:: with SMTP id q20mr933111wmj.130.1571733398843; 
 Tue, 22 Oct 2019 01:36:38 -0700 (PDT)
Received: from localhost.localdomain
 (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
 by smtp.gmail.com with ESMTPSA id g17sm17115253wrq.58.2019.10.22.01.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 01:36:38 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v7 2/9] backlight: gpio: remove stray newline
Date: Tue, 22 Oct 2019 10:36:23 +0200
Message-Id: <20191022083630.28175-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191022083630.28175-1-brgl@bgdev.pl>
References: <20191022083630.28175-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 23 Oct 2019 08:09:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2xc7P6YHG166j+xVZ+q+qvlahi4iLSSnRxTtpR6znoo=;
 b=dunLQ6gemIPjAP14+LRlmcclJuj0+sE8QniGZlmFE08l1BlWFoQ3/YWyhzvhngeu+J
 dtmBlbSAa2m99suSdqj0+hnyNzLlrwshDFR2kGmSShauix4nPJOF3InPnR1y8mrqX4r0
 WL0tptIRlo0DXkwgFnfzkS4P/sEbB9x+RS6chKfgD95OyHdRXNg4xNZ/5p2SvKSXXhVW
 dkoYqMMZqsxitmArA1FzomKEKu1XhgBnOIJv3ypzSa4fBNMGMuYJa2shWuSFjBsH2kf/
 DBq3Pjy9PiZ/YTenBUFmd1ty84SsEbnThYuB02SajOxgoRHhSeja1ud5df0UmMs1+aEu
 Kvvg==
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
Cc: linux-fbdev@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KClJl
bW92ZSBhIGRvdWJsZSBuZXdsaW5lIGZyb20gdGhlIGRyaXZlci4KClNpZ25lZC1vZmYtYnk6IEJh
cnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+ClJldmlld2VkLWJ5
OiBBbmR5IFNoZXZjaGVua28gPGFuZHkuc2hldmNoZW5rb0BnbWFpbC5jb20+ClJldmlld2VkLWJ5
OiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgotLS0KIGRyaXZl
cnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMgfCAxIC0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bp
b19iYWNrbGlnaHQuYyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMK
aW5kZXggN2UxOTkwMTk5ZmFlLi4zOTU1YjUxM2YyZjggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlk
ZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMKKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGln
aHQvZ3Bpb19iYWNrbGlnaHQuYwpAQCAtOTEsNyArOTEsNiBAQCBzdGF0aWMgaW50IGdwaW9fYmFj
a2xpZ2h0X2luaXRpYWxfcG93ZXJfc3RhdGUoc3RydWN0IGdwaW9fYmFja2xpZ2h0ICpnYmwpCiAJ
cmV0dXJuIEZCX0JMQU5LX1VOQkxBTks7CiB9CiAKLQogc3RhdGljIGludCBncGlvX2JhY2tsaWdo
dF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBncGlvX2Jh
Y2tsaWdodF9wbGF0Zm9ybV9kYXRhICpwZGF0YSA9Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
