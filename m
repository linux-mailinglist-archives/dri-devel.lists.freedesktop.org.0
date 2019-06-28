Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB4C5B148
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 20:27:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B625789DC7;
	Sun, 30 Jun 2019 18:27:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7F36E8C0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 10:03:09 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p11so5630153wre.7
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 03:03:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2fXlJr+KLvMvzQ39JeY61bDwufklUTFeJJHO6S5cuaU=;
 b=Gax6Ug6D/AkCG4gXiEVXD13CRxHF0IoYLGGj0+fDDcIC7EVLPl+rTrLb3qdOf3EK5C
 rCD7QCDdLQADznyGApsgkArVSPDAJnmA/GSQZMjjSLpFzDPTHjmULn39AsKL72y9xvQg
 KAiPXzyOPFM2pdFjtpDsDOXX9eDJE+Fn686ZFDZ33XjLzqO5DgTc1BGzYVnPITegNXL6
 UFq0FF+Zw0bP1R61ViGAyZrLPNR/Pj0+IMKJCqqRywXTVrmDoqHjFCTeps1cfK1ccDXB
 1ct/ZEh739n9/mBL/qqPJKMZYnFFSdJlowgeVLbarOK6u97WAcx/REU9yp+sZEwKvYCS
 1l/g==
X-Gm-Message-State: APjAAAXnAzBgCSMA6s2kpu1Ul/IM9RAShIVH8ezDDa1fcOu4FbbpgoTA
 tStKLRHUiKxcFU5xw9YlNqJdGg==
X-Google-Smtp-Source: APXvYqykUEXT3B0487J5sArEnZO+0OtmpAg6hB7ll9Lv+cgBqkGF8/Iqkv/JGRgFkwYe/JBUjT/HeQ==
X-Received: by 2002:adf:c654:: with SMTP id u20mr4384217wrg.271.1561716188085; 
 Fri, 28 Jun 2019 03:03:08 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
 by smtp.gmail.com with ESMTPSA id l124sm1628874wmf.36.2019.06.28.03.03.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Jun 2019 03:03:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH RFT 4/4] backlight: gpio: remove unused fields from platform
 data
Date: Fri, 28 Jun 2019 12:02:53 +0200
Message-Id: <20190628100253.8385-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190628100253.8385-1-brgl@bgdev.pl>
References: <20190628100253.8385-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 30 Jun 2019 18:26:11 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2fXlJr+KLvMvzQ39JeY61bDwufklUTFeJJHO6S5cuaU=;
 b=sD7MfnUDEG9Nd5uhC9bU5PmddNwA0kXjHFTB641OJnJbCVKMFSAVMjZL3WHIHVu9yK
 fWS6zgw4R+OgBrpyehUiUda/A3VJaZHc4PQcV+1UrPo/fQTnVzHjg/wFJEQUgJ1LTof1
 A9rU7MhtRr4OfO5v5XUSDXGeveEB3DlbEytfcutjLNQ4Rq7n+QsPRVzpFRBhT6WwrgXA
 P824u8V2ZL/4JLS1+D2X9xh51UyCdJVPvsZ2h1alJHkiGzhpqmMD3JjADNtIfb2zXS5g
 sU6GozYeONWsvwBkC7JcyYFmXUK0vJjNv7o2sInGwoPWQyhMsXRPA2eW77XBfYz7HMWu
 ZUmg==
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
