Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AD6BAE0F
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 08:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C10E76E0F5;
	Mon, 23 Sep 2019 06:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F808977A;
 Sat, 21 Sep 2019 10:04:47 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id m18so4491290wmc.1;
 Sat, 21 Sep 2019 03:04:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XFvYO/QeVSK7xJEhN7BDjaA/PqF/h3aDS+4+gIYeg2s=;
 b=VTvcNbeMc0kx/Su8XxwsbIyrSL0g+mZgjPq1FZlR+cPChta7cDNpNEuxk14Y3k764B
 1yQsHwMrVV4zbyxl5zuWXq3U6J+OZVYHIdwv3sf6pVnjaz7HNnfxeQpJ1wTfrBstRf6W
 r2XslavAs479/AbgaPfIIAc/zpPG7rTgjJ2NbYdGU5lsX87U9qPcweib1Rq/Gxb3Nos1
 52DZPUoTJgJzj1xi9fLakDaNfuqioaK/wyYQc1auQqqQsdthj79devI7ZFmzB3ggSeUS
 yI+ko0hTwD8CvrPYOmmD4uRMYOu5xwZ7MCy21QjVzcKpzhuchGuRIfeomuh7GQ4LqFeH
 h4kw==
X-Gm-Message-State: APjAAAXkgPS7dXPOA4jG0gL4XnT/N+2hg/f4a1IaOr7UWAeZRBOcy4Ou
 +UZNUrixoDye5ReYnNRJtd4=
X-Google-Smtp-Source: APXvYqwMJovp3jiOl0eSPqwlE/xSLDsA5D0arohOs70uT8p01Cg6m96qjZqxI5uMJrSx6jrVSvSDZg==
X-Received: by 2002:a7b:c7c9:: with SMTP id z9mr6076363wmk.61.1569060286286;
 Sat, 21 Sep 2019 03:04:46 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
 by smtp.gmail.com with ESMTPSA id g1sm3963575wrv.68.2019.09.21.03.04.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 21 Sep 2019 03:04:45 -0700 (PDT)
From: kholk11@gmail.com
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH 3/5] drm/msm/dsi: Add configuration for 28nm PLL on family B
Date: Sat, 21 Sep 2019 12:04:37 +0200
Message-Id: <20190921100439.64402-4-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190921100439.64402-1-kholk11@gmail.com>
References: <20190921100439.64402-1-kholk11@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 23 Sep 2019 06:55:22 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XFvYO/QeVSK7xJEhN7BDjaA/PqF/h3aDS+4+gIYeg2s=;
 b=DIEAaixRbNEzw7U1WcaD3iFxJO76nAtOdHLofhG7o8d7Vvoiz8cOUaJPcVUCkOi2cA
 kHv8IiAxsHd3bQ9aVzt/pz+ExvuTfhxRM2NeV5LBluyuFm41KiKKs68o+ru0F/EI/Tde
 dlUhKJuK+5Xnipr7PVwF8aTtJbM8HcB1M0cb2V5p7W7OiZyspstcitVmft+7zaMiQJlm
 Y4GVxl0IjOAadUl6r1SYuRki9Nl2tYEy1MoM5IH4yVZqzFtpw3pvZeCsdSzgiGfHrb8I
 t81JokygWmqXjKAMbu2vd1K4wuMaBGkmT7bGYdDY3hpHMAuKtiw/V35Q+pcBzbU+D6N4
 58Aw==
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
Cc: mark.rutland@arm.com, freedreno@lists.freedesktop.org, marijns95@gmail.com,
 jonathan@marek.ca, airlied@linux.ie, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, tglx@linutronix.de, kholk11@gmail.com, sean@poorly.run,
 georgi.djakov@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogIkFuZ2VsbyBHLiBEZWwgUmVnbm8iIDxraG9sazExQGdtYWlsLmNvbT4KClRoZSAyOG5t
IFBMTCBoYXMgYSBkaWZmZXJlbnQgaW9zcGFjZSBvbiBNU00vQVBRIGZhbWlseSBCIFNvQ3M6CmFk
ZCBhIG5ldyBjb25maWd1cmF0aW9uIGFuZCB1c2UgaXQgd2hlbiB0aGUgRFQgcmVwb3J0cyB0aGUK
InFjb20sZHNpLXBoeS0yOG5tLWhwbS1mYW0tYiIgY29tcGF0aWJsZS4KClNpZ25lZC1vZmYtYnk6
IEFuZ2VsbyBHLiBEZWwgUmVnbm8gPGtob2xrMTFAZ21haWwuY29tPgotLS0KIC4uLi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL2RzaS50eHQgICAgfCAgMSArCiBkcml2ZXJzL2dwdS9k
cm0vbXNtL2RzaS9waHkvZHNpX3BoeS5jICAgICAgICAgIHwgIDIgKysKIGRyaXZlcnMvZ3B1L2Ry
bS9tc20vZHNpL3BoeS9kc2lfcGh5LmggICAgICAgICAgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0v
bXNtL2RzaS9waHkvZHNpX3BoeV8yOG5tLmMgICAgIHwgMTggKysrKysrKysrKysrKysrKysrCiA0
IGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZHNpLnR4dCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9kc2kudHh0CmluZGV4IGFmOTU1ODZj
ODk4Zi4uZDNiYTllZTIyZjM4IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9tc20vZHNpLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZHNpLnR4dApAQCAtODMsNiArODMsNyBAQCBEU0kgUEhZ
OgogUmVxdWlyZWQgcHJvcGVydGllczoKIC0gY29tcGF0aWJsZTogQ291bGQgYmUgdGhlIGZvbGxv
d2luZwogICAqICJxY29tLGRzaS1waHktMjhubS1ocG0iCisgICogInFjb20sZHNpLXBoeS0yOG5t
LWhwbS1mYW0tYiIKICAgKiAicWNvbSxkc2ktcGh5LTI4bm0tbHAiCiAgICogInFjb20sZHNpLXBo
eS0yMG5tIgogICAqICJxY29tLGRzaS1waHktMjhubS04OTYwIgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21zbS9kc2kvcGh5L2RzaV9waHkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNp
L3BoeS9kc2lfcGh5LmMKaW5kZXggNDA5N2VjYTFiM2VmLi41MDdjMDE0NmEzMDUgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5LmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL21zbS9kc2kvcGh5L2RzaV9waHkuYwpAQCAtNDgxLDYgKzQ4MSw4IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGRzaV9waHlfZHRfbWF0Y2hbXSA9IHsKICNpZmRlZiBD
T05GSUdfRFJNX01TTV9EU0lfMjhOTV9QSFkKIAl7IC5jb21wYXRpYmxlID0gInFjb20sZHNpLXBo
eS0yOG5tLWhwbSIsCiAJICAuZGF0YSA9ICZkc2lfcGh5XzI4bm1faHBtX2NmZ3MgfSwKKwl7IC5j
b21wYXRpYmxlID0gInFjb20sZHNpLXBoeS0yOG5tLWhwbS1mYW0tYiIsCisJICAuZGF0YSA9ICZk
c2lfcGh5XzI4bm1faHBtX2ZhbWJfY2ZncyB9LAogCXsgLmNvbXBhdGlibGUgPSAicWNvbSxkc2kt
cGh5LTI4bm0tbHAiLAogCSAgLmRhdGEgPSAmZHNpX3BoeV8yOG5tX2xwX2NmZ3MgfSwKICNlbmRp
ZgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGh5L2RzaV9waHkuaCBiL2Ry
aXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5LmgKaW5kZXggYzQwNjljZTZhZmU2Li4y
NGIyOTRlZDMwNTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lf
cGh5LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGh5L2RzaV9waHkuaApAQCAtNDAs
NiArNDAsNyBAQCBzdHJ1Y3QgbXNtX2RzaV9waHlfY2ZnIHsKIH07CiAKIGV4dGVybiBjb25zdCBz
dHJ1Y3QgbXNtX2RzaV9waHlfY2ZnIGRzaV9waHlfMjhubV9ocG1fY2ZnczsKK2V4dGVybiBjb25z
dCBzdHJ1Y3QgbXNtX2RzaV9waHlfY2ZnIGRzaV9waHlfMjhubV9ocG1fZmFtYl9jZmdzOwogZXh0
ZXJuIGNvbnN0IHN0cnVjdCBtc21fZHNpX3BoeV9jZmcgZHNpX3BoeV8yOG5tX2xwX2NmZ3M7CiBl
eHRlcm4gY29uc3Qgc3RydWN0IG1zbV9kc2lfcGh5X2NmZyBkc2lfcGh5XzIwbm1fY2ZnczsKIGV4
dGVybiBjb25zdCBzdHJ1Y3QgbXNtX2RzaV9waHlfY2ZnIGRzaV9waHlfMjhubV84OTYwX2NmZ3M7
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9waHkvZHNpX3BoeV8yOG5tLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9waHkvZHNpX3BoeV8yOG5tLmMKaW5kZXggYjNmNjc4
ZjZjMmFhLi4zYjkzMDA1NDVlMTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNp
L3BoeS9kc2lfcGh5XzI4bm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9waHkvZHNp
X3BoeV8yOG5tLmMKQEAgLTE0Miw2ICsxNDIsMjQgQEAgY29uc3Qgc3RydWN0IG1zbV9kc2lfcGh5
X2NmZyBkc2lfcGh5XzI4bm1faHBtX2NmZ3MgPSB7CiAJLm51bV9kc2lfcGh5ID0gMiwKIH07CiAK
K2NvbnN0IHN0cnVjdCBtc21fZHNpX3BoeV9jZmcgZHNpX3BoeV8yOG5tX2hwbV9mYW1iX2NmZ3Mg
PSB7CisJLnR5cGUgPSBNU01fRFNJX1BIWV8yOE5NX0hQTSwKKwkuc3JjX3BsbF90cnV0aHRhYmxl
ID0geyB7dHJ1ZSwgdHJ1ZX0sIHtmYWxzZSwgdHJ1ZX0gfSwKKwkucmVnX2NmZyA9IHsKKwkJLm51
bSA9IDEsCisJCS5yZWdzID0geworCQkJeyJ2ZGRpbyIsIDEwMDAwMCwgMTAwfSwKKwkJfSwKKwl9
LAorCS5vcHMgPSB7CisJCS5lbmFibGUgPSBkc2lfMjhubV9waHlfZW5hYmxlLAorCQkuZGlzYWJs
ZSA9IGRzaV8yOG5tX3BoeV9kaXNhYmxlLAorCQkuaW5pdCA9IG1zbV9kc2lfcGh5X2luaXRfY29t
bW9uLAorCX0sCisJLmlvX3N0YXJ0ID0geyAweDFhOTQ0MDAsIDB4MWE5NDgwMCB9LAorCS5udW1f
ZHNpX3BoeSA9IDIsCit9OworCiBjb25zdCBzdHJ1Y3QgbXNtX2RzaV9waHlfY2ZnIGRzaV9waHlf
MjhubV9scF9jZmdzID0gewogCS50eXBlID0gTVNNX0RTSV9QSFlfMjhOTV9MUCwKIAkuc3JjX3Bs
bF90cnV0aHRhYmxlID0geyB7dHJ1ZSwgdHJ1ZX0sIHt0cnVlLCB0cnVlfSB9LAotLSAKMi4yMS4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
