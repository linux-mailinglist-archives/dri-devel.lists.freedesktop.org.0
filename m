Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CA471263
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:14:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7AA88F2D;
	Tue, 23 Jul 2019 07:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67F489C53
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 15:03:21 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id n4so39858622wrs.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 08:03:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2fXlJr+KLvMvzQ39JeY61bDwufklUTFeJJHO6S5cuaU=;
 b=XkgJV6tI7kSL04aYfXbtZ7YG71lJU54BiCB5g7aY90p7VW3rLjGklQNbSRNZtmEquN
 1UI4RoD5R/QEj1DOv/7EX2rkaBA+wCPAUSPjk6pZzqqZNxCnq9DLeS88EmcGZCIzW/WR
 71waxWL5hfHpBSi5aHc+y3n6bnOu4GwIkWNse1C+OEVcOs1xTzvYYcCR4dxRuoaa2Gy9
 M6FLft9A7gARPtRPLJuRj9vrmQe+FNzrPDWn4NP/wC7uGUjLYSYE2oXInsAfEn2in61A
 Y/mOCk9xAijaTmZ2Tj3ZA5APaL3y5tjUQ1nZXfEL34jfE66Y9hgaz8Bk3FQL/y/iD9rO
 dvJQ==
X-Gm-Message-State: APjAAAU111/LVdpBqcVepc9zBYBRi96Omvs++lXurNu1Foomyb8Gk6Me
 KjdchCJcutDk8RBzhgg6BoA=
X-Google-Smtp-Source: APXvYqxoeDtZa5rhm0zJCPGIZ4TMlrHuW999eBJciN+bFmDJu+7YqfLFUW1lZ8pkGVH3rxoddiSyZQ==
X-Received: by 2002:a5d:4205:: with SMTP id n5mr67472226wrq.52.1563807800356; 
 Mon, 22 Jul 2019 08:03:20 -0700 (PDT)
Received: from localhost.localdomain
 (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
 by smtp.gmail.com with ESMTPSA id v23sm36310460wmj.32.2019.07.22.08.03.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 08:03:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 4/7] backlight: gpio: remove unused fields from platform
 data
Date: Mon, 22 Jul 2019 17:02:59 +0200
Message-Id: <20190722150302.29526-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190722150302.29526-1-brgl@bgdev.pl>
References: <20190722150302.29526-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2fXlJr+KLvMvzQ39JeY61bDwufklUTFeJJHO6S5cuaU=;
 b=PJAy/C6vXvCtjG9cGnPYgiNGwkOIJk+KMB3Hs8FT99JhTqlwQM4ckAzGH3iKRAayZ+
 iV/nZcbx791twxijQMtdSxUHDo93XhTru7W+g3/iYIZ8gMfa+OPKrLh3YOS5xrDbE7ru
 0sMb2R218gWc90gUVV2gMVObSFCCTCRfQE86Q1B63igf9cqq132AGo8H4Wv6hd1Ejjtb
 h2gFntQ4iRMvTfsbHbE7QWzSjxJP1E450Ju/Mr1HGI6tAcA1irI5MnKCUzxTgpdqr5Zf
 GNGAMIFY5x2IiKME7B71HGD5bkP3IoDbd9tUWm5H+vZopp4bVu030OERZT3QXuEgMU5a
 7yRg==
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
ZmYtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+Ci0t
LQogaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhL2dwaW9fYmFja2xpZ2h0LmggfCAzIC0tLQog
MSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51
eC9wbGF0Zm9ybV9kYXRhL2dwaW9fYmFja2xpZ2h0LmggYi9pbmNsdWRlL2xpbnV4L3BsYXRmb3Jt
X2RhdGEvZ3Bpb19iYWNrbGlnaHQuaAppbmRleCAzNDE3OWQ2MDAzNjAuLjFhOGI1YjE5NDZmZSAx
MDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhL2dwaW9fYmFja2xpZ2h0LmgK
KysrIGIvaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhL2dwaW9fYmFja2xpZ2h0LmgKQEAgLTks
OSArOSw2IEBAIHN0cnVjdCBkZXZpY2U7CiAKIHN0cnVjdCBncGlvX2JhY2tsaWdodF9wbGF0Zm9y
bV9kYXRhIHsKIAlzdHJ1Y3QgZGV2aWNlICpmYmRldjsKLQlpbnQgZ3BpbzsKLQlpbnQgZGVmX3Zh
bHVlOwotCWNvbnN0IGNoYXIgKm5hbWU7CiB9OwogCiAjZW5kaWYKLS0gCjIuMjEuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
