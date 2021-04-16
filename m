Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AED936228D
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 16:38:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E0366EC04;
	Fri, 16 Apr 2021 14:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 660F26EC11
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 14:37:47 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id m3so32536504edv.5
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 07:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eTcc77PaUiGKf9phoAd/vzPQm0tz3YbgYP/6lveIZh4=;
 b=pJ3u5NeO+xtFEt59222VQTddT/mVwYGlZ19Sl0O7F7DINA7n1E962WyomgkEmnrQ7/
 hIU7DbIsLL4BN80rKA9uaowzRvR6SlQWVOeLKReBBI1565aqLRmKeNlVP5fjx++m/hGc
 PF7VZPyPXpfuSxbctS+snGwSo3I/Hn64La6iq7sZrUG/ECQVI2Muerd5DEPoJJdu5+8p
 I8KCYaVf2itm0KiGo9Yc76L1jroFIhOs4DWjpz3AzRUl3nNog4E7azTwpv6WNaI3lJ61
 gRZG8stGP4QeA2/H7ZDZoYKEaubn4R3GVxmw4SX0U614PYQHe27IrKjcIaMkM+UZgYeh
 umOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eTcc77PaUiGKf9phoAd/vzPQm0tz3YbgYP/6lveIZh4=;
 b=Wka0tNSyVYQhu1+WfAQUDgVBYCuDxY2h+BUxtWcAUih6Y2WojZSYK70Bvi6Fy2x8+D
 LhEtAkqOTM+kgiCA81cGG0LyNyix1tdsE4KUWKgrtGySLAf+GIY38gGoMqm9ibTPpXvJ
 /U7R2CWkzkhOYK7YLGcrq0nsY+cYdOCf5Xa3H7D4vawCFVz5o7o7D/XmshDRAofKOtaZ
 ASmoV5UYxehfFeJS5FDeCnY4uhfbSu+CdiuZqGUtGKTida++PuA+IzHU7n3HDJpZUimt
 5bTcBztQslq6mNlFWYFGOwPJLjK17hLEjEU0/P8Ljfm0/EWM20umzaB+PJbrM5fNTym0
 Rpug==
X-Gm-Message-State: AOAM532Gc4hyXrjB7RF6ojpKn5VMCb8VwODBrXcGBOKs/0fE2sh4x0mD
 ijdYJe/gx43P5oyeIf9TReAQRA==
X-Google-Smtp-Source: ABdhPJx07Zgv0qDznKDBpZsVR/FFZFAFeuV94FUsRu2Cf+yVIRkOF78fjqEYjThf8qLZYTJf52edwQ==
X-Received: by 2002:aa7:ca04:: with SMTP id y4mr10173077eds.72.1618583866128; 
 Fri, 16 Apr 2021 07:37:46 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:37:45 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 15/40] drm/nouveau/nouveau_svm: Remove unused variable 'ret'
 from void function
Date: Fri, 16 Apr 2021 15:37:00 +0100
Message-Id: <20210416143725.2769053-16-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0uYzogSW4gZnVuY3Rpb24g4oCYbm91dmVhdV9w
Zm5zX21hcOKAmToKIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmM6ODEwOjY6
IHdhcm5pbmc6IHZhcmlhYmxlIOKAmHJldOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1i
dXQtc2V0LXZhcmlhYmxlXQoKQ2M6IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4KQ2M6
IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmll
bEBmZndsbC5jaD4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IG5vdXZl
YXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpv
bmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0u
YyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0uYyBi
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMKaW5kZXggMWMzZjg5MDM3N2Qy
Yy4uMjZhZjZlZTkxNTM2OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91
dmVhdV9zdm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jCkBA
IC04MTEsNyArODExLDYgQEAgbm91dmVhdV9wZm5zX21hcChzdHJ1Y3Qgbm91dmVhdV9zdm1tICpz
dm1tLCBzdHJ1Y3QgbW1fc3RydWN0ICptbSwKIAkJIHVuc2lnbmVkIGxvbmcgYWRkciwgdTY0ICpw
Zm5zLCB1bnNpZ25lZCBsb25nIG5wYWdlcykKIHsKIAlzdHJ1Y3Qgbm91dmVhdV9wZm5tYXBfYXJn
cyAqYXJncyA9IG5vdXZlYXVfcGZuc190b19hcmdzKHBmbnMpOwotCWludCByZXQ7CiAKIAlhcmdz
LT5wLmFkZHIgPSBhZGRyOwogCWFyZ3MtPnAuc2l6ZSA9IG5wYWdlcyA8PCBQQUdFX1NISUZUOwpA
QCAtODE5LDggKzgxOCw4IEBAIG5vdXZlYXVfcGZuc19tYXAoc3RydWN0IG5vdXZlYXVfc3ZtbSAq
c3ZtbSwgc3RydWN0IG1tX3N0cnVjdCAqbW0sCiAJbXV0ZXhfbG9jaygmc3ZtbS0+bXV0ZXgpOwog
CiAJc3ZtbS0+dm1tLT52bW0ub2JqZWN0LmNsaWVudC0+c3VwZXIgPSB0cnVlOwotCXJldCA9IG52
aWZfb2JqZWN0X2lvY3RsKCZzdm1tLT52bW0tPnZtbS5vYmplY3QsIGFyZ3MsIHNpemVvZigqYXJn
cykgKwotCQkJCW5wYWdlcyAqIHNpemVvZihhcmdzLT5wLnBoeXNbMF0pLCBOVUxMKTsKKwludmlm
X29iamVjdF9pb2N0bCgmc3ZtbS0+dm1tLT52bW0ub2JqZWN0LCBhcmdzLCBzaXplb2YoKmFyZ3Mp
ICsKKwkJCSAgbnBhZ2VzICogc2l6ZW9mKGFyZ3MtPnAucGh5c1swXSksIE5VTEwpOwogCXN2bW0t
PnZtbS0+dm1tLm9iamVjdC5jbGllbnQtPnN1cGVyID0gZmFsc2U7CiAKIAltdXRleF91bmxvY2so
JnN2bW0tPm11dGV4KTsKLS0gCjIuMjcuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
