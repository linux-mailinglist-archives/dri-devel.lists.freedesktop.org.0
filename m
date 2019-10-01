Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD0DC4852
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 09:19:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E3936E8F4;
	Wed,  2 Oct 2019 07:18:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4137B6E788
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 12:59:32 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 5so3300387wmg.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Oct 2019 05:59:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fJb9zTJUFk5gt04WV606l1pH2Oso/m6U1KjJZ/jsQAQ=;
 b=m+TqraW8vg85IZEsaLWzkaQSWbxxs3I+jNx40riftyazZcayXKt/FzfG5pwTRXUPkq
 BBSxXwZ+KALQbVUxFsRsBM3qE+Lj8L+G9rdDcxVj6zrULKuGGPrCSw2Fxrh6F38FsbyZ
 MS4GRYyEbw6pcNcJlf2MMALXaWAgWb5DHKDYw1Rrh/Y80bBIIXmdI0uPYHpJIQe/olvP
 TB+4HEqOk9O5QNUula0RAUar5BOmZS3aaECQn9DKD9p9voDBgdcUHoEeml1Bz8+GvirH
 2Boxpb5bi8yx+uu9hJe1hTLDo50YEmmX4gP4T/iUnKf5fn63ZjNPbYtl9ldi2zjb+0Qa
 kgyg==
X-Gm-Message-State: APjAAAUo6qCWNKytLC5/B/LeADkmZYLThesx9GI9VkqB6i4ckIHtAhJP
 0OsIajNS0aJTdCSYO6ZUIHvh6g==
X-Google-Smtp-Source: APXvYqy3/DmZXqN3YFKLxvkfXEQz4vfrJsXzpQUD3G3jaeUG/Y4mWtb+jhRmWonqX1buJ2udxNd/xQ==
X-Received: by 2002:a1c:9d52:: with SMTP id g79mr3474322wme.91.1569934770925; 
 Tue, 01 Oct 2019 05:59:30 -0700 (PDT)
Received: from localhost.localdomain
 (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
 by smtp.gmail.com with ESMTPSA id 3sm3561400wmo.22.2019.10.01.05.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 05:59:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v4 5/7] backlight: gpio: remove unused fields from platform
 data
Date: Tue,  1 Oct 2019 14:58:35 +0200
Message-Id: <20191001125837.4472-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191001125837.4472-1-brgl@bgdev.pl>
References: <20191001125837.4472-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 02 Oct 2019 07:18:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fJb9zTJUFk5gt04WV606l1pH2Oso/m6U1KjJZ/jsQAQ=;
 b=e9zGUWIrAnJPy7zH0daodOP5A42zAKpfk3GklS6/uyW//JHY97R6fivbB05Og7UESK
 R/GXudS+cvP2/5BCo4x9qcTL28BstxtkktdGb/3tZ2mdkkbGnvqCsDwQOOIelgQhu9Ih
 d5d2HJAlG/EumY3UKQfSq+sRYWnkagCW/7aXxVpKXqK8LSsB0JZzFK8LVAfT71uCZDcq
 z/3J9sVzHso1zUyb3BkDZWMm3tG68KtHujqJDJ3d3KP3SBnKewioZIDESV1KDXNMvAsA
 fTB+yIY5M6/HUyWQ2VSsNCESU/S1G6xrp/pYkpI9bT5cKloypooIngT/0BxatlIhcsDY
 w+2A==
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
