Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A03A5CFC
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 22:16:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 700FE899F0;
	Mon,  2 Sep 2019 20:15:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACBED8910E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 12:34:58 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id k2so12966230wmj.4
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 05:34:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bHnB1L+P4+1aGMlVqMp08Ixue8e2E9v91GNi38QqZ9c=;
 b=iTNHp+nQbrLg9K0bCyRyZELFMUpE4Bq6RFDm43Syesd1DkxrtPf1czhMjXTJg118Sd
 OpsB66zxwWyGsgj2wiu0/OOQRobCKh24VkUTnbsQ066Hg4t6jRVzsnYW+x8zI2VnrBp1
 curw2Hb6NmG5yA23gekMsv/uvdO/mXgApCoz6CUBUslUIgG0X3fmfDODMTn4BvxhyI6n
 9AvZL5u7lbT2gppV6n4zg5sIEPe3DstVuC7DblYpY4OT1hG6t2K4mfbbedqHdje7sAW/
 dugNswt3ZEPImn0blGXY1K7W7/bGIC6MVMymTRIU4um2ySuKdVsCZDrfLp+FAaT4ytay
 qrNw==
X-Gm-Message-State: APjAAAXLx91KvTWGrRctqJXQiDOMyFWmNZX7VzQz13LqirLz4Ng467pI
 tZPS5hNS5Bx1hmXTzYO/HbzROQ==
X-Google-Smtp-Source: APXvYqwFfCqx6lY10v5xazk7iXImJ1ceSZ7J4x9MKHeaOck5dr4/AvcHY1Tlp222xnKOcnKqL+InVA==
X-Received: by 2002:a1c:7513:: with SMTP id o19mr34854600wmc.126.1567427697250; 
 Mon, 02 Sep 2019 05:34:57 -0700 (PDT)
Received: from localhost.localdomain
 (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
 by smtp.gmail.com with ESMTPSA id k9sm22645759wrd.7.2019.09.02.05.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 05:34:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [RESEND PATCH v3 4/7] backlight: gpio: remove unused fields from
 platform data
Date: Mon,  2 Sep 2019 14:34:41 +0200
Message-Id: <20190902123444.19924-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190902123444.19924-1-brgl@bgdev.pl>
References: <20190902123444.19924-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 02 Sep 2019 20:15:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bHnB1L+P4+1aGMlVqMp08Ixue8e2E9v91GNi38QqZ9c=;
 b=RiF6eugg6V5iUB4obVg0sR7cypt5WU9YOMFriMux45aF+xW0zjazRTUXDi8WQsm1NS
 cprxfuxAqEy1Vi9GNJuDxtyOJDs3NxNE7C9s+QOaAzCiVDn2YZrr63DziJcnmI8NAv6z
 CuhKqFsWHUkId5jp1hhvWrNPeh89aSuhuLHbvxngPoxOuZPuhkBFz3kpHI3Jg0qgWfoc
 u8WqJ+8E8Y7kDB7zjnn4AFUOKg32D33j+AOOEfYjKVQeir7zocUMw1Wf9W8dQZVBlkyG
 zfDL4DzrWaWUq8JzI6ZajlZ06ZiDjw88IY5cycMsHkilxMazzMWK6wmmV/gSarzR6D2b
 kETA==
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
ZGVmX3ZhbHVlOwotCWNvbnN0IGNoYXIgKm5hbWU7CiB9OwogCiAjZW5kaWYKLS0gCjIuMjEuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
