Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DC7C483E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 09:19:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF18C6E8DC;
	Wed,  2 Oct 2019 07:18:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD836E788
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 12:59:27 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a6so3249349wma.5
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Oct 2019 05:59:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OU2bh+kVbPH2QOESllwlntXEadkasZXlFhA24tJCYMc=;
 b=nuTxd7vJP91R0rRCo9kclElCz9fUxQKRZJNv7tyVPXyp1g2QT0fznDM3B8hGq9iCmu
 LYcBXl4ZxzGetpNGbMtVWXexa6UKMWXhVyZJttI3BpD98IG0PlmrnljOrnpuzFmqsYjB
 +0HXKtFcsXXBIJHqEqtsBNrihSYVm7oIYFQkQArNc3i5xjUSWbYjFdEv8kuyZAN8zzw5
 VkWTiydUURimLmSkqJ6d+XeHrw/AV7eGI0vcotacrTLGK+tBSJ6O8xzYXy58Jjfj8q8o
 vqoNrigFKkiWmp44cb1l0B+97UjUJFV74/n1jwRQ5HYWFQB6iRXNdl7Jk17ZU0bQbtZl
 zjrQ==
X-Gm-Message-State: APjAAAUylr+qK2ee/tn7hfugKGNB/jhIDYBiJjz7nuAh8PKTEz0jdq8+
 PXR72DqT2di6mN5HcsUIa0saYA==
X-Google-Smtp-Source: APXvYqx1Kr64Tj6Qz4cblkoPu+gaNwnWELKZxN/qXd6/fHiNvyOllFG948GDKWDssvQCyIjl5kMnvw==
X-Received: by 2002:a1c:7d92:: with SMTP id y140mr3594002wmc.141.1569934766193; 
 Tue, 01 Oct 2019 05:59:26 -0700 (PDT)
Received: from localhost.localdomain
 (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
 by smtp.gmail.com with ESMTPSA id 3sm3561400wmo.22.2019.10.01.05.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 05:59:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v4 1/7] backlight: gpio: remove unneeded include
Date: Tue,  1 Oct 2019 14:58:31 +0200
Message-Id: <20191001125837.4472-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191001125837.4472-1-brgl@bgdev.pl>
References: <20191001125837.4472-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 02 Oct 2019 07:18:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OU2bh+kVbPH2QOESllwlntXEadkasZXlFhA24tJCYMc=;
 b=rZwtI0mZre9T+U1FCWCcvcEBN85L3YXBKHzWkcFPGHcFAeM3WYEdwywJEKfA7rfFk/
 7Hfu9B48gxfbPWbmoY1voarlphxyl2u5YfnAxoOM1ZLF+VcqOqh6AcxM/2O3RSvEHSLF
 4rC2yzROzddoadVAXP+KAIYdyCxB4OBCVnMmH7F/bBFh/QWaqcQGY3iHqq0YpN/yEM4X
 SB2DlNqTIjDqR8g1WMR9vhTqPSeY5n2nbSV7tuUxYhJTJZ31nr7dHQmLnLtjQtMSm/Fg
 Cu9tJYKtjLO4SSHmxYjO2YxLREkDXzQe5+wkRkggXqXmvm9CVar6d7cDED/jfgvNPNTq
 nbFg==
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
YmF5bGlicmUuY29tPgotLS0KIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0
LmMgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYyBiL2RyaXZlcnMvdmlkZW8vYmFj
a2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMKaW5kZXggMThlMDUzZTQ3MTZjLi43ZTE5OTAxOTlmYWUg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMKKysr
IGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYwpAQCAtMTIsNyArMTIs
NiBAQAogI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5o
PgogI2luY2x1ZGUgPGxpbnV4L29mLmg+Ci0jaW5jbHVkZSA8bGludXgvb2ZfZ3Bpby5oPgogI2lu
Y2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RhdGEvZ3Bpb19iYWNrbGlnaHQuaD4KICNpbmNsdWRlIDxs
aW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KICNpbmNsdWRlIDxsaW51eC9wcm9wZXJ0eS5oPgotLSAK
Mi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
