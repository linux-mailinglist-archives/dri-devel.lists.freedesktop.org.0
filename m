Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEF7DDB99
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2019 02:07:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D52889CAA;
	Sun, 20 Oct 2019 00:06:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FDEC89E19
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2019 08:36:13 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 3so8169105wmi.3
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2019 01:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A5bBJYbCyuRW60GB1XX7z+M5+e/gSwELCNj1WMzvFBY=;
 b=ZBV8uv7s5JWMZixJtfA3K7ZO0XLWsSFoNcT3YWxcL/zAM84cefG9H/F60gD3q3GmPs
 P6CXPieINZ1JOE4qpHyI686asmu1bTOCS8fre1qBI9Uw4FjkG92dVZTYAObhCfyVMcTr
 DsdVd3lG2kNj2rPN7r9MsLP4RuXZbWFEgAk4+UZ0J77q3epDGhnSXTMiE3M6MzPHx6Od
 mIyzdztgFMVaucaoO36KC8skryOZzVco2IN3Ptt7EvuuN+IZ1lVS3HWyivzgJMr5mY7I
 DdXUYZFo+yK678hk8Ber/WsFyUSAoXhUOwuincrj1K1ZXb9EmpuimshGW6BaU6bZbfaU
 n33g==
X-Gm-Message-State: APjAAAUCvV+b3s/xzmi3CPuFVxcbERdSbDHVLjh8BJKqL7stznRAkSqO
 fESiIW9LY9xcbhWiHXdijUtDYQ==
X-Google-Smtp-Source: APXvYqxeYmGu5PXx2s97sAMDcdiXX69oA5DXi1FfFsUYc8NVqOjz+0qhCX+j4MhOe+oQg8Ct+ADcyw==
X-Received: by 2002:a05:600c:2196:: with SMTP id
 e22mr7093447wme.1.1571474172029; 
 Sat, 19 Oct 2019 01:36:12 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
 by smtp.gmail.com with ESMTPSA id u1sm7242627wmc.38.2019.10.19.01.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Oct 2019 01:36:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v6 2/9] backlight: gpio: remove stray newline
Date: Sat, 19 Oct 2019 10:35:49 +0200
Message-Id: <20191019083556.19466-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191019083556.19466-1-brgl@bgdev.pl>
References: <20191019083556.19466-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 20 Oct 2019 00:06:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A5bBJYbCyuRW60GB1XX7z+M5+e/gSwELCNj1WMzvFBY=;
 b=PJcwaQcGOcOoFaLJc055qdw97PLYGQoFfRDf67LSJ8X9W1A1iGnc9ys8Qho6+Mvx3h
 q/BFei4zPDPOU7WWher6lqxzBZF921nW9bY9N/y3aYxEH5RCHkBFNNKK65i1iHilMwMx
 Bz5ZuyNmoSChqk8Alt/jNZxnZqQEOrxMTDWfzo3emNhzVjH46dK92qzd54hVyvJf31u0
 OBDyP/yUyKOOquD3ZA6N6xzMMLUi79NYGl2MFLOziQgEr0BvASZOtEAm9CbkzeI6nQmj
 TZKydUBlM9LXTKGo77rB8gA35rZvsGzwKchlILK1iLHpGXX9lg/299GPbb3BTZgyjnCj
 +SGw==
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
bW92ZSBhIGRvdWJsZSBuZXdsaW5lIGZyb20gdGhlIGRyaXZlci4KClNpZ25lZC1vZmYtYnk6IEJh
cnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVy
cy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQs
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlv
X2JhY2tsaWdodC5jIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYwpp
bmRleCA3ZTE5OTAxOTlmYWUuLjM5NTViNTEzZjJmOCAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRl
by9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYworKysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdo
dC9ncGlvX2JhY2tsaWdodC5jCkBAIC05MSw3ICs5MSw2IEBAIHN0YXRpYyBpbnQgZ3Bpb19iYWNr
bGlnaHRfaW5pdGlhbF9wb3dlcl9zdGF0ZShzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHQgKmdibCkKIAly
ZXR1cm4gRkJfQkxBTktfVU5CTEFOSzsKIH0KIAotCiBzdGF0aWMgaW50IGdwaW9fYmFja2xpZ2h0
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0IGdwaW9fYmFj
a2xpZ2h0X3BsYXRmb3JtX2RhdGEgKnBkYXRhID0KLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
