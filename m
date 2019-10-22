Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D91AE13B2
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 10:10:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2AD06E998;
	Wed, 23 Oct 2019 08:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E8036E454
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 08:36:39 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id v9so5744047wrq.5
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 01:36:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XXUGs3TD/mQ9EDaZ43OuKw31dOCYSa+NG57KsS4H5LI=;
 b=BNJ/pBysJcoG2Sgl09d/7FQoI5uzdgJisgpXGJGFa5slSOpDj4dB+Fx4RFqhjCGhpO
 vndWjW+RTMesEbQ+hORUJdC9IBsjHc4G7c8kDnA7lHsme+6QaiyMkiJ/5CuYqdxjmBv6
 zc9o5OpbP4oBC63uafUF+nbaZB040pZF3CAqVdr+cgmq88I82HaEsYIihXXk0RI1H4xe
 xGficAF2KpA1pDhMBdjKcj6lpBV8mUHMHj5VgHSEQG3rWy7LvYdwFHw4lMbu9gSa4nLX
 3/MGwbeP+0QyK20hvESrB7mArt9T79N7ZJPP7nSP/OyjgKs6YEDPfRtqiMZkyRbxTnbl
 QlKQ==
X-Gm-Message-State: APjAAAXnRD2v36D9DNneJVAEwzQbLKlZK1a+i7hL0f2wG/bn1uYUX3ds
 3OVyifmBOadlwg5XUHheTtDI8Q==
X-Google-Smtp-Source: APXvYqxz6AIr8fWnzKdVVzEewafWfmryfrIOZCjdoeaPq7mVTlB+8VWT79OlNyvmz2Bd6kRuyVN66w==
X-Received: by 2002:a5d:498a:: with SMTP id r10mr2396794wrq.129.1571733397641; 
 Tue, 22 Oct 2019 01:36:37 -0700 (PDT)
Received: from localhost.localdomain
 (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
 by smtp.gmail.com with ESMTPSA id g17sm17115253wrq.58.2019.10.22.01.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 01:36:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v7 1/9] backlight: gpio: remove unneeded include
Date: Tue, 22 Oct 2019 10:36:22 +0200
Message-Id: <20191022083630.28175-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191022083630.28175-1-brgl@bgdev.pl>
References: <20191022083630.28175-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 23 Oct 2019 08:09:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XXUGs3TD/mQ9EDaZ43OuKw31dOCYSa+NG57KsS4H5LI=;
 b=Bq+WXbKond/Rk9fhT8Y+bUAcQeyz3dkHjScEjk448jWb1Cp5GqJJPCE/dB22YytQit
 h6rjUQWMBpc6TooG9agn4sMX+chbXQnG5/8GgY+UxdpejJgraAYrt48FfVjryUqgw14o
 eKxMTfkTMWm6W1yJ42/yHNIZN8oq7M3iZ8mEiAbWi4ivzIihNzO6TCeTyTQVmTlgQkKe
 w6GlUVEL7VzvEO8ptqVO/U2g/gEt53Lk5q/TY+E9Eno8mRgVIsykdcC0QMwT9om0FLNt
 R47+/7FvF2qIahLXXIjlHw8sxq2q5/N9Ji3jmmIME4Sz3qd6qMUDOxZG0TtzF9ObGur4
 yPZg==
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
