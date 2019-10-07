Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E075CDC0F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 09:02:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5D906E455;
	Mon,  7 Oct 2019 07:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E235C6E44D
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 03:32:04 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id v4so7729615pff.6
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Oct 2019 20:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XXUGs3TD/mQ9EDaZ43OuKw31dOCYSa+NG57KsS4H5LI=;
 b=P694T/V/HuUQa9jsZVu80Va4iQ9wtecy4da5VAGcgoBCAt4HzLKBeknNUVEhKAoQCj
 Vnu6klBIxwiQ3trtI9vFRqvmjIcXPcqHB9fSNEROQ8BXLuQYWn4pI1hG2C+UnKgwgm6o
 bjnNkoX1Jx2BpxcIJG/ws72QkPLORzb3uvSv/V3hSFBf0LO4pnrB8I0OKFtpRHjV3ORL
 WVncOpAA72iEL91vlbH8+hMdB7VfXBKSOta50WEF5ZlooM+1YgN8K2q36Ztz5LqQPmXK
 weCiJImi5BGZEGOi/KLp7A4u2SoWl9jCSIVijpIgIQDox5tHOwFqs5VnZ1/h9hzMVybH
 BiCw==
X-Gm-Message-State: APjAAAULZFX7N1AM96V9MYrnY9jib+iiALpo5NiL+7LrhFI8EEnVruGv
 d2Nbcbk5HvOfa3qR9H4LnlCALg==
X-Google-Smtp-Source: APXvYqwD1Ahm73jrBPcdOwtpwjSteXXDBGfgtBkjwZk7/DaYkZiI+mMtwaDZj10mJprtCxD4b2Gkfw==
X-Received: by 2002:a63:1915:: with SMTP id z21mr5731158pgl.343.1570419124423; 
 Sun, 06 Oct 2019 20:32:04 -0700 (PDT)
Received: from debian-brgl.local (96-95-220-76-static.hfc.comcastbusiness.net.
 [96.95.220.76])
 by smtp.gmail.com with ESMTPSA id x10sm16377720pfr.44.2019.10.06.20.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Oct 2019 20:32:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v5 1/7] backlight: gpio: remove unneeded include
Date: Mon,  7 Oct 2019 05:31:54 +0200
Message-Id: <20191007033200.13443-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007033200.13443-1-brgl@bgdev.pl>
References: <20191007033200.13443-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 07 Oct 2019 07:01:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XXUGs3TD/mQ9EDaZ43OuKw31dOCYSa+NG57KsS4H5LI=;
 b=edi7NYtYkiqE1uOWeL+U87Ck5mZpITswFODSgMcBAtpM60H+NcmQ1P13TeUemB2tXb
 nYWc7NXa2Rygyfr0y+T+T6F/VX/YcYhwJX+hIjXFAxA8pv3CNNRtzGAYoje6QugPsHgW
 7f8J7IIc8ejfyyLdcO4inN5wtPcu/z7VdbEHq9yvGW3on1vSaNYWpqxFWSVJhJUpvlVu
 jNDWGewuuI45w5ms+ZPxtc5MHS2i/2ehOYqGySiFBXVOb3KMy9aSruKofSgiOehdlH1F
 PR3LajUBOwTC7I5nYpXz+9X6zPjE5V7Qrh6z9DBAFH+HjVolLxiJbfAn1FVYsHHgLIz/
 9JOg==
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
