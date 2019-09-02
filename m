Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9D6A5D03
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 22:16:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA8089A32;
	Mon,  2 Sep 2019 20:16:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 284F389104
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 12:34:55 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id b16so13832920wrq.9
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 05:34:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u5S/jk4kN1cW3dXt1c4GIbV2CwRkei66gd1V6gGISEA=;
 b=ojkMJhwRS29m0lCjGtrEttaNKJ4n58JpMWLR+yuys0k5lC4K1+BKeadKshqFsZfRNX
 E0B7acDE+JKhKYsBN5zZpSlgRseq1Kgsg1Y08zeud1OC1ee8jNcUBe2dtlCcL+PjxyFZ
 GZ9Au8wNht/vVh/gnBngb/Y4MmkqFlk0BWhvmPsTxdNf5gDUpPrZquh/0Rh39EpEd7b7
 7WYfnS89bAPoK8fE9pWAjB46lNzn025O63O5VjO9eYplHymMbPNjokgzYnK/8X+LYkiu
 81/Zb1I5DtRGKjXqtIYftgb4xGan69+fGe8bmXWFWI8QTs6krCEndyOY6oKgIcZv9KIC
 K6LA==
X-Gm-Message-State: APjAAAWrM1fa0wanvijp/qF2/xTaitPd5zmz1wMNw3N/LnCmxb5FtCUw
 86bEWtxi3vwaEFlNqzF9HM4HdQ==
X-Google-Smtp-Source: APXvYqxTC0BM9tDm/ou/+6NHgIhl0sMhYD6xMWKqzgKkh8bJTTRx1y01GLTonCc+zkavzqLiw2nDkQ==
X-Received: by 2002:adf:f705:: with SMTP id r5mr35411010wrp.342.1567427693786; 
 Mon, 02 Sep 2019 05:34:53 -0700 (PDT)
Received: from localhost.localdomain
 (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
 by smtp.gmail.com with ESMTPSA id k9sm22645759wrd.7.2019.09.02.05.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 05:34:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [RESEND PATCH v3 1/7] sh: ecovec24: add additional properties to the
 backlight device
Date: Mon,  2 Sep 2019 14:34:38 +0200
Message-Id: <20190902123444.19924-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190902123444.19924-1-brgl@bgdev.pl>
References: <20190902123444.19924-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 02 Sep 2019 20:15:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u5S/jk4kN1cW3dXt1c4GIbV2CwRkei66gd1V6gGISEA=;
 b=HKn491ajfZEYRSluCvhIrCHY7+9bRctMymF6AhDpuHdPHdRZUKOHaHZKIecyzjhiW/
 b1nAk+OBKgJldctBzlfm5v7WwX3UfptpC9zkiZgWztRCW2WMmxLCwXuW5F+xldmX9C9h
 lQx4iSLhLL6v2EUEg1hXv7Z/MvzrgN4omtwQjW09fsttzpGAAo+m28FH4LrGheRS2PwX
 05VT34aZbkq1PV99nsYvuHFvaybdnwIpntv8H4Gi3i2XHEAXN9xr48gNL0pFf2Br+qDi
 WTFQPjefarIobm1KH/oPcVXCQrnlBQZ8b6DGHkAfO103tPJ3Xm08LIKUkqwclaay7pyN
 +4eA==
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

RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KCkFk
ZCBhIEdQSU8gbG9va3VwIGVudHJ5IGFuZCBhIGRldmljZSBwcm9wZXJ0eSBmb3IgR1BJTyBiYWNr
bGlnaHQgdG8gdGhlCmJvYXJkIGZpbGUuIFRpZSB0aGVtIHRvIHRoZSBwbGF0Zm9ybSBkZXZpY2Ug
d2hpY2ggaXMgbm93IHJlZ2lzdGVyZWQgdXNpbmcKcGxhdGZvcm1fZGV2aWNlX3JlZ2lzdGVyX2Z1
bGwoKSBiZWNhdXNlIG9mIHRoZSBwcm9wZXJ0aWVzLiBUaGVzZSBjaGFuZ2VzCmFyZSBpbmFjdGl2
ZSBub3cgYnV0IHdpbGwgYmUgdXNlZCBvbmNlIHRoZSBncGlvIGJhY2tsaWdodCBkcml2ZXIgaXMK
bW9kaWZpZWQuCgpTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdz
a2lAYmF5bGlicmUuY29tPgpSZXZpZXdlZC1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hl
dmNoZW5rb0BsaW51eC5pbnRlbC5jb20+ClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51
cy53YWxsZWlqQGxpbmFyby5vcmc+Ci0tLQogYXJjaC9zaC9ib2FyZHMvbWFjaC1lY292ZWMyNC9z
ZXR1cC5jIHwgMzAgKysrKysrKysrKysrKysrKysrKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDI1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9zaC9i
b2FyZHMvbWFjaC1lY292ZWMyNC9zZXR1cC5jIGIvYXJjaC9zaC9ib2FyZHMvbWFjaC1lY292ZWMy
NC9zZXR1cC5jCmluZGV4IGY0MDJhYTc0MWJmMy4uNjkyNmJiMzg2NWI5IDEwMDY0NAotLS0gYS9h
cmNoL3NoL2JvYXJkcy9tYWNoLWVjb3ZlYzI0L3NldHVwLmMKKysrIGIvYXJjaC9zaC9ib2FyZHMv
bWFjaC1lY292ZWMyNC9zZXR1cC5jCkBAIC0zNzEsNiArMzcxLDE5IEBAIHN0YXRpYyBzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlIGxjZGNfZGV2aWNlID0gewogCX0sCiB9OwogCitzdGF0aWMgc3RydWN0
IGdwaW9kX2xvb2t1cF90YWJsZSBncGlvX2JhY2tsaWdodF9sb29rdXAgPSB7CisJLmRldl9pZAkJ
PSAiZ3Bpby1iYWNrbGlnaHQuMCIsCisJLnRhYmxlID0geworCQlHUElPX0xPT0tVUCgic2g3NzI0
X3BmYyIsIEdQSU9fUFRSMSwgTlVMTCwgR1BJT19BQ1RJVkVfSElHSCksCisJCXsgfQorCX0sCit9
OworCitzdGF0aWMgc3RydWN0IHByb3BlcnR5X2VudHJ5IGdwaW9fYmFja2xpZ2h0X3Byb3BzW10g
PSB7CisJUFJPUEVSVFlfRU5UUllfQk9PTCgiZGVmYXVsdC1vbiIpLAorCXsgfQorfTsKKwogc3Rh
dGljIHN0cnVjdCBncGlvX2JhY2tsaWdodF9wbGF0Zm9ybV9kYXRhIGdwaW9fYmFja2xpZ2h0X2Rh
dGEgPSB7CiAJLmZiZGV2ID0gJmxjZGNfZGV2aWNlLmRldiwKIAkuZ3BpbyA9IEdQSU9fUFRSMSwK
QEAgLTM3OCwxMyArMzkxLDE1IEBAIHN0YXRpYyBzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHRfcGxhdGZv
cm1fZGF0YSBncGlvX2JhY2tsaWdodF9kYXRhID0gewogCS5uYW1lID0gImJhY2tsaWdodCIsCiB9
OwogCi1zdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RldmljZSBncGlvX2JhY2tsaWdodF9kZXZpY2Ug
PSB7CitzdGF0aWMgY29uc3Qgc3RydWN0IHBsYXRmb3JtX2RldmljZV9pbmZvIGdwaW9fYmFja2xp
Z2h0X2RldmljZV9pbmZvID0gewogCS5uYW1lID0gImdwaW8tYmFja2xpZ2h0IiwKLQkuZGV2ID0g
ewotCQkucGxhdGZvcm1fZGF0YSA9ICZncGlvX2JhY2tsaWdodF9kYXRhLAotCX0sCisJLmRhdGEg
PSAmZ3Bpb19iYWNrbGlnaHRfZGF0YSwKKwkuc2l6ZV9kYXRhID0gc2l6ZW9mKGdwaW9fYmFja2xp
Z2h0X2RhdGEpLAorCS5wcm9wZXJ0aWVzID0gZ3Bpb19iYWNrbGlnaHRfcHJvcHMsCiB9OwogCitz
dGF0aWMgc3RydWN0IHBsYXRmb3JtX2RldmljZSAqZ3Bpb19iYWNrbGlnaHRfZGV2aWNlOworCiAv
KiBDRVUwICovCiBzdGF0aWMgc3RydWN0IGNldV9wbGF0Zm9ybV9kYXRhIGNldTBfcGRhdGEgPSB7
CiAJLm51bV9zdWJkZXZzCQkJPSAyLApAQCAtMTAwNiw3ICsxMDIxLDYgQEAgc3RhdGljIHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKmVjb3ZlY19kZXZpY2VzW10gX19pbml0ZGF0YSA9IHsKIAkmdXNi
MV9jb21tb25fZGV2aWNlLAogCSZ1c2Joc19kZXZpY2UsCiAJJmxjZGNfZGV2aWNlLAotCSZncGlv
X2JhY2tsaWdodF9kZXZpY2UsCiAJJmtleXNjX2RldmljZSwKIAkmY24xMl9wb3dlciwKICNpZiBk
ZWZpbmVkKENPTkZJR19NTUNfU0RISSkgfHwgZGVmaW5lZChDT05GSUdfTU1DX1NESElfTU9EVUxF
KQpAQCAtMTQ2NCw2ICsxNDc4LDEyIEBAIHN0YXRpYyBpbnQgX19pbml0IGFyY2hfc2V0dXAodm9p
ZCkKICNlbmRpZgogI2VuZGlmCiAKKwlncGlvZF9hZGRfbG9va3VwX3RhYmxlKCZncGlvX2JhY2ts
aWdodF9sb29rdXApOworCWdwaW9fYmFja2xpZ2h0X2RldmljZSA9IHBsYXRmb3JtX2RldmljZV9y
ZWdpc3Rlcl9mdWxsKAorCQkJCQkmZ3Bpb19iYWNrbGlnaHRfZGV2aWNlX2luZm8pOworCWlmIChJ
U19FUlIoZ3Bpb19iYWNrbGlnaHRfZGV2aWNlKSkKKwkJcmV0dXJuIFBUUl9FUlIoZ3Bpb19iYWNr
bGlnaHRfZGV2aWNlKTsKKwogCXJldHVybiBwbGF0Zm9ybV9hZGRfZGV2aWNlcyhlY292ZWNfZGV2
aWNlcywKIAkJCQkgICAgQVJSQVlfU0laRShlY292ZWNfZGV2aWNlcykpOwogfQotLSAKMi4yMS4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
