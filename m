Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54166826B5
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 23:17:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F056E180;
	Mon,  5 Aug 2019 21:17:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522F56E180
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 21:17:06 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id n190so5237126pgn.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 14:17:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=btriHWYQu73nHxyRj0uULDI0WFupXKYE8nFpqRhUi5E=;
 b=fHCA3++YYFKQ77ffqCvyP6k2FEIKPIhZcEkAFS1RwmX3zwEFRkfa1Pgj+fgFY91uTo
 l5FG9q23oY1I3H7gS95TlKJpISpk8fD5UHJumPBEp/vl0rFWHpEjy5+zcoh+8QJSSwRk
 d13Vi/Ikqavv6sM6zmkgKtnkfi4jHKetsvPnyFyC+GbfnkOnoCQ5AwVYap7WWRVDD7W3
 olfPKeJ93/4PHhLQWE3TFB8LA5Q+MbsxNY8j5qTLO9t2n2LlVAFqowtj0xw7vHEOyIE2
 2HgPTcgjoUFoHbRAfrhcNEnkjTi1LVTMX3tFb32h7q/PZm+jnFo2xHMwXdvkOmpAzozw
 ZZpw==
X-Gm-Message-State: APjAAAXcKt3cmafsG2ndz+EdN5Vvgff2aFSf0T6P2nOOdyULBn6DYFKn
 7Kb/8nM1Ck0pbW6Q2sN0LAlFjR6Rn/U=
X-Google-Smtp-Source: APXvYqyoYl+h7ZIawCU+3W64OfYJakM+Xfc++m5kBgD7zKEdWhgVKG1NxI4zroBuK4W+iWzBAmRtUg==
X-Received: by 2002:a17:90b:8c8:: with SMTP id
 ds8mr20553606pjb.89.1565039825384; 
 Mon, 05 Aug 2019 14:17:05 -0700 (PDT)
Received: from localhost ([100.118.89.196])
 by smtp.gmail.com with ESMTPSA id j15sm97068547pfe.3.2019.08.05.14.17.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 14:17:04 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm: add cache support for arm64
Date: Mon,  5 Aug 2019 14:14:33 -0700
Message-Id: <20190805211451.20176-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=btriHWYQu73nHxyRj0uULDI0WFupXKYE8nFpqRhUi5E=;
 b=a62gzBHN8zDS50OBhnDV1V4x7nXoRywHSroTQoVByDczAGXV3BipxjPTq01SrkbTub
 agEwfMmn44cmWjaxwPjM6J6JZpjx8WmyJxEXRnDXjNclOKeWLXUkdJVEX/MQCLvJBqtC
 K1ZxpmOSHoJ9dVfT1c362g+35YgZNJ24X+8fEyjxPJRcu8l+xY8PVNESw9BGEXx1nU94
 wqiQun9OUEuGzEM7cth+AU5ej7W/2Q3sElHfUdFCQU068818rs5agvFXmicnwPaMJR6t
 5IAlapgFz9ED0//3XPA1KmOrrKMINrpJTfgOu4sGbvQe4C1K91C5/vchqTWaSGlR7ZtT
 i/gw==
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
Cc: Rob Clark <robdclark@chromium.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Catalin Marinas <catalin.marinas@arm.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKVGhpcyB3aWxsIGxldCBk
cm0vbXNtIHN0b3AgYWJ1c2luZyBETUEgQVBJIGZvciBjYWNoZSBvcHMsIGF0IGxlYXN0IGZvcgph
cm02NC4KClNpZ25lZC1vZmYtYnk6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4K
LS0tCiBhcmNoL2FybTY0L21tL2ZsdXNoLmMgICAgICAgfCAgMiArKwogZHJpdmVycy9ncHUvZHJt
L2RybV9jYWNoZS5jIHwgMjAgKysrKysrKysrKysrKysrKystLS0KIGluY2x1ZGUvZHJtL2RybV9j
YWNoZS5oICAgICB8ICA0ICsrKysKIDMgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L21tL2ZsdXNoLmMgYi9hcmNo
L2FybTY0L21tL2ZsdXNoLmMKaW5kZXggZGMxOTMwMDMwOWQyLi5mMGViNjMyMGM5NzkgMTAwNjQ0
Ci0tLSBhL2FyY2gvYXJtNjQvbW0vZmx1c2guYworKysgYi9hcmNoL2FybTY0L21tL2ZsdXNoLmMK
QEAgLTkzLDMgKzkzLDUgQEAgdm9pZCBhcmNoX2ludmFsaWRhdGVfcG1lbSh2b2lkICphZGRyLCBz
aXplX3Qgc2l6ZSkKIH0KIEVYUE9SVF9TWU1CT0xfR1BMKGFyY2hfaW52YWxpZGF0ZV9wbWVtKTsK
ICNlbmRpZgorCitFWFBPUlRfU1lNQk9MX0dQTChfX2ZsdXNoX2RjYWNoZV9hcmVhKTsKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2FjaGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
Y2FjaGUuYwppbmRleCAzYmQ3NmU5MThiNWQuLjkwMTA1YzYzNzc5NyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2RybV9jYWNoZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2FjaGUu
YwpAQCAtNjksNiArNjksMTQgQEAgc3RhdGljIHZvaWQgZHJtX2NhY2hlX2ZsdXNoX2NsZmx1c2go
c3RydWN0IHBhZ2UgKnBhZ2VzW10sCiB9CiAjZW5kaWYKIAorI2lmIGRlZmluZWQoX19wb3dlcnBj
X18pCitzdGF0aWMgdm9pZCBfX2ZsdXNoX2RjYWNoZV9hcmVhKHZvaWQgKmFkZHIsIHNpemVfdCBs
ZW4pCit7CisJZmx1c2hfZGNhY2hlX3JhbmdlKCh1bnNpZ25lZCBsb25nKWFkZHIsCisJCQkgICAo
dW5zaWduZWQgbG9uZylhZGRyICsgUEFHRV9TSVpFKTsKK30KKyNlbmRpZgorCiAvKioKICAqIGRy
bV9jbGZsdXNoX3BhZ2VzIC0gRmx1c2ggZGNhY2hlIGxpbmVzIG9mIGEgc2V0IG9mIHBhZ2VzLgog
ICogQHBhZ2VzOiBMaXN0IG9mIHBhZ2VzIHRvIGJlIGZsdXNoZWQuCkBAIC05MCw3ICs5OCw3IEBA
IGRybV9jbGZsdXNoX3BhZ2VzKHN0cnVjdCBwYWdlICpwYWdlc1tdLCB1bnNpZ25lZCBsb25nIG51
bV9wYWdlcykKIAlpZiAod2JpbnZkX29uX2FsbF9jcHVzKCkpCiAJCXByX2VycigiVGltZWQgb3V0
IHdhaXRpbmcgZm9yIGNhY2hlIGZsdXNoXG4iKTsKIAotI2VsaWYgZGVmaW5lZChfX3Bvd2VycGNf
XykKKyNlbGlmIGRlZmluZWQoX19wb3dlcnBjX18pIHx8IGRlZmluZWQoQ09ORklHX0FSTTY0KQog
CXVuc2lnbmVkIGxvbmcgaTsKIAlmb3IgKGkgPSAwOyBpIDwgbnVtX3BhZ2VzOyBpKyspIHsKIAkJ
c3RydWN0IHBhZ2UgKnBhZ2UgPSBwYWdlc1tpXTsKQEAgLTEwMCw4ICsxMDgsNyBAQCBkcm1fY2xm
bHVzaF9wYWdlcyhzdHJ1Y3QgcGFnZSAqcGFnZXNbXSwgdW5zaWduZWQgbG9uZyBudW1fcGFnZXMp
CiAJCQljb250aW51ZTsKIAogCQlwYWdlX3ZpcnR1YWwgPSBrbWFwX2F0b21pYyhwYWdlKTsKLQkJ
Zmx1c2hfZGNhY2hlX3JhbmdlKCh1bnNpZ25lZCBsb25nKXBhZ2VfdmlydHVhbCwKLQkJCQkgICAo
dW5zaWduZWQgbG9uZylwYWdlX3ZpcnR1YWwgKyBQQUdFX1NJWkUpOworCQlfX2ZsdXNoX2RjYWNo
ZV9hcmVhKHBhZ2VfdmlydHVhbCwgUEFHRV9TSVpFKTsKIAkJa3VubWFwX2F0b21pYyhwYWdlX3Zp
cnR1YWwpOwogCX0KICNlbHNlCkBAIC0xMzUsNiArMTQyLDEzIEBAIGRybV9jbGZsdXNoX3NnKHN0
cnVjdCBzZ190YWJsZSAqc3QpCiAKIAlpZiAod2JpbnZkX29uX2FsbF9jcHVzKCkpCiAJCXByX2Vy
cigiVGltZWQgb3V0IHdhaXRpbmcgZm9yIGNhY2hlIGZsdXNoXG4iKTsKKyNlbGlmIGRlZmluZWQo
Q09ORklHX0FSTTY0KQorCXN0cnVjdCBzZ19wYWdlX2l0ZXIgc2dfaXRlcjsKKworCWZvcl9lYWNo
X3NnX3BhZ2Uoc3QtPnNnbCwgJnNnX2l0ZXIsIHN0LT5uZW50cywgMCkgeworCQlzdHJ1Y3QgcGFn
ZSAqcCA9IHNnX3BhZ2VfaXRlcl9wYWdlKCZzZ19pdGVyKTsKKwkJZHJtX2NsZmx1c2hfcGFnZXMo
JnAsIDEpOworCX0KICNlbHNlCiAJcHJfZXJyKCJBcmNoaXRlY3R1cmUgaGFzIG5vIGRybV9jYWNo
ZS5jIHN1cHBvcnRcbiIpOwogCVdBUk5fT05fT05DRSgxKTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUv
ZHJtL2RybV9jYWNoZS5oIGIvaW5jbHVkZS9kcm0vZHJtX2NhY2hlLmgKaW5kZXggOTg3ZmYxNmI5
NDIwLi5mOTRlN2JkM2VjYTQgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9jYWNoZS5oCisr
KyBiL2luY2x1ZGUvZHJtL2RybV9jYWNoZS5oCkBAIC00MCw2ICs0MCwxMCBAQCB2b2lkIGRybV9j
bGZsdXNoX3NnKHN0cnVjdCBzZ190YWJsZSAqc3QpOwogdm9pZCBkcm1fY2xmbHVzaF92aXJ0X3Jh
bmdlKHZvaWQgKmFkZHIsIHVuc2lnbmVkIGxvbmcgbGVuZ3RoKTsKIGJvb2wgZHJtX25lZWRfc3dp
b3RsYihpbnQgZG1hX2JpdHMpOwogCisjaWYgZGVmaW5lZChDT05GSUdfWDg2KSB8fCBkZWZpbmVk
KF9fcG93ZXJwY19fKSB8fCBkZWZpbmVkKENPTkZJR19BUk02NCkKKyNkZWZpbmUgSEFTX0RSTV9D
QUNIRSAxCisjZW5kaWYKKwogCiBzdGF0aWMgaW5saW5lIGJvb2wgZHJtX2FyY2hfY2FuX3djX21l
bW9yeSh2b2lkKQogewotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
