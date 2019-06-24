Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2355248B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:28:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5951489FFD;
	Tue, 25 Jun 2019 07:27:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B55189C2C
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 14:49:13 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id c66so13108831wmf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 07:49:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:references:reply-to
 :message-id:mime-version;
 bh=+1HDQZviZEdEBIaZ3+cqb2NOlWyANG1RyMLvCgYrlxQ=;
 b=uLyRHKZg1iux1cGGwPQ0+Yx1+FnxUmFJ1bHoOsrarZp1LOzgKrngmYytMrCSxIzpL9
 lIMElcZSODVPhAyCrOnWHFSBV/5GyNfbmoXqUAgT5rQ8Vjiybf9bgxdFnpblhJtusjeL
 VUYHFU1HM5scnV/S6cIKRYP0sDCPFxPGgGbQGsqf1o1XKxZnvDCQpa2bW1S8afeZZGQ/
 InuBMzzYYdh7hivN6ozy42Y+rhp+rM5yBR/Npcnn/Zh7G3frOr03gTVMergbFMxiFJcV
 dhRHIZ5OB9gE27yStU9WOJIlEMTmX0p3efcDG4mG6k4z79FGq1mwFRH+UGtVKgDcF35I
 9FEQ==
X-Gm-Message-State: APjAAAUVu1QWvyZmQqQJbwwoHViw1zPdpsB6n/ThZ2P/N+ah0BvWOWSx
 d5IxRRvuYtbZSdZ0ERBcqybrNQ==
X-Google-Smtp-Source: APXvYqyKFT1ZDPov7FN01BjdxpOOg83+Hng//XfE/Nmzv8hToft5RZH9KSY96c9YR1WZPkYlwxu+Iw==
X-Received: by 2002:a1c:343:: with SMTP id 64mr17222141wmd.116.1561387751980; 
 Mon, 24 Jun 2019 07:49:11 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id k82sm10654558wma.15.2019.06.24.07.49.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jun 2019 07:49:11 -0700 (PDT)
From: Julien Masson <jmasson@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 8/9] drm: meson: add macro used to enable HDMI PLL
Date: Mon, 24 Jun 2019 16:49:04 +0200
References: <86zhm782g5.fsf@baylibre.com>
Message-ID: <86o92n82e1.fsf@baylibre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 25 Jun 2019 07:27:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:references:reply-to:message-id:mime-version;
 bh=+1HDQZviZEdEBIaZ3+cqb2NOlWyANG1RyMLvCgYrlxQ=;
 b=f+kqTndKvKQtaO3uX+rPt78/8vXst8PI3NwjdbB1DABotaFBkHQIV/ydAjoVPhg0Jv
 I2o7qcH/kgyDbaPjhUwHSYcYOQ1yhR2jAIoeV8Yj+hFpdXd7vJUlAja6IZmU2KHUwDqu
 tPvfg05GytpLRIkXHEmKbkwKSQ3Tx2d/zbi8yEa8QCRcQIUur0lj3GsxW+eizD1wdI3o
 dgLsliZhzNRKCBjgNgwmg6A3J5pXwmfgmB9aPfLtLodYBL+RQTEix6ezIZ67blO10OPx
 YJyEaUSR1/QcRZcvtvcARhuvkSCDUHz3S6/R9U5nEJ0ZfjHASF00lpJEOyf8O1YLLdTz
 weiw==
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
Reply-To: 86zhm782g5.fsf@baylibre.com
Cc: Julien Masson <jmasson@baylibre.com>, linux-amlogic@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBhZGQgbmV3IG1hY3JvIEhISV9IRE1JX1BMTF9DTlRMX0VOIHdoaWNoIGlzIHVz
ZWQgdG8gZW5hYmxlCkhETUkgUExMLgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIE1hc3NvbiA8am1h
c3NvbkBiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZjbGsu
YyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZjbGsuYyBiL2RyaXZl
cnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92Y2xrLmMKaW5kZXggZTdjMmI0MzlkMGY3Li5iZTZlMTUy
ZmM3NWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92Y2xrLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZjbGsuYwpAQCAtOTYsNiArOTYsNyBAQAog
I2RlZmluZSBISElfVkRBQ19DTlRMMQkJMHgyRjggLyogMHhiZSBvZmZzZXQgaW4gZGF0YSBzaGVl
dCAqLwogCiAjZGVmaW5lIEhISV9IRE1JX1BMTF9DTlRMCTB4MzIwIC8qIDB4Yzggb2Zmc2V0IGlu
IGRhdGEgc2hlZXQgKi8KKyNkZWZpbmUgSEhJX0hETUlfUExMX0NOVExfRU4JQklUKDMwKQogI2Rl
ZmluZSBISElfSERNSV9QTExfQ05UTDIJMHgzMjQgLyogMHhjOSBvZmZzZXQgaW4gZGF0YSBzaGVl
dCAqLwogI2RlZmluZSBISElfSERNSV9QTExfQ05UTDMJMHgzMjggLyogMHhjYSBvZmZzZXQgaW4g
ZGF0YSBzaGVldCAqLwogI2RlZmluZSBISElfSERNSV9QTExfQ05UTDQJMHgzMkMgLyogMHhjYiBv
ZmZzZXQgaW4gZGF0YSBzaGVldCAqLwpAQCAtNDY4LDcgKzQ2OSw3IEBAIHZvaWQgbWVzb25faGRt
aV9wbGxfc2V0X3BhcmFtcyhzdHJ1Y3QgbWVzb25fZHJtICpwcml2LCB1bnNpZ25lZCBpbnQgbSwK
IAogCQkvKiBFbmFibGUgYW5kIHVucmVzZXQgKi8KIAkJcmVnbWFwX3VwZGF0ZV9iaXRzKHByaXYt
PmhoaSwgSEhJX0hETUlfUExMX0NOVEwsCi0JCQkJICAgMHg3IDw8IDI4LCAweDQgPDwgMjgpOwor
CQkJCSAgIDB4NyA8PCAyOCwgSEhJX0hETUlfUExMX0NOVExfRU4pOwogCiAJCS8qIFBvbGwgZm9y
IGxvY2sgYml0ICovCiAJCXJlZ21hcF9yZWFkX3BvbGxfdGltZW91dChwcml2LT5oaGksIEhISV9I
RE1JX1BMTF9DTlRMLAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
