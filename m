Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8ABC0030
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 09:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8131F6EE8E;
	Fri, 27 Sep 2019 07:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D26796ED0D;
 Thu, 26 Sep 2019 10:53:24 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 3so2076198wmi.3;
 Thu, 26 Sep 2019 03:53:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XFvYO/QeVSK7xJEhN7BDjaA/PqF/h3aDS+4+gIYeg2s=;
 b=q9rPnlbyHaf2ibbEtikfsRyNmNZZV01AaP8WmQMS3UXBAZNUF5JRBz2vTxioWCkrzB
 5iOo/SFP6alwV/LtmU4acEjHI0qu6cF4BKwcFBzZnHy/1PmIJ7EpC1tYZmo8fKOA5cRC
 C2b0gjVu4RsKDgeLT4aUVDmCuHIiKsYeP9BiLhGNy5U9FVE0Ljbwdlx+hjDTHzWtzY8P
 Gax4gmcrgzF0qBq4mtm/6UkHr+yh2VYrJELF4VGSIbg7lWVoXolaWIxnuHi5fiweda/q
 hrE9U4gVfRU0r+C9IJPWB1mdOiMWJdYa3V2+ugjtRiSnu4+dfFImPssFkM6RDk0W+oVj
 kgNw==
X-Gm-Message-State: APjAAAUjp4X6WlY+eJasz/Vkwyo62ZSBx8a7hMu0/2304wXgmTAfIA5+
 amYNO0mY3gK0muwt2wOgxZk=
X-Google-Smtp-Source: APXvYqxxecMIjSJwWtKFYSllKwbN+U+DWL86UX2aYpK8pajJqV85kYsnZIyEiPREH2SsKUnyc4C+xQ==
X-Received: by 2002:a7b:c935:: with SMTP id h21mr2351546wml.97.1569495203299; 
 Thu, 26 Sep 2019 03:53:23 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
 by smtp.gmail.com with ESMTPSA id d9sm3468412wrc.44.2019.09.26.03.53.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 Sep 2019 03:53:22 -0700 (PDT)
From: kholk11@gmail.com
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 3/5] drm/msm/dsi: Add configuration for 28nm PLL on family B
Date: Thu, 26 Sep 2019 12:52:54 +0200
Message-Id: <20190926105256.61412-4-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190926105256.61412-1-kholk11@gmail.com>
References: <20190926105256.61412-1-kholk11@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Sep 2019 07:40:57 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XFvYO/QeVSK7xJEhN7BDjaA/PqF/h3aDS+4+gIYeg2s=;
 b=fPTOr2cxjZeU5ZYyG2FBmfsYKLYXWrQSqF4vQp35kaJESz98iUZGMoJ1dvmMkQOQr2
 KPsxrXbNJs/Ur5gapboE5QXxP3EKdOkhqEKPDr6Wskjno0QhD2j4TYQsdnenMjK1JOyk
 CD74r5MpdMQbIRAd32SoDa8W4coVd6xm8ebjFzua7PbQoSWLarpqNbCnRvGb5QktAndF
 MpDcR3QkciYbFzH1IU11EFblmzZdVhm3ieNRY/NSV/2KQyUW2UC/IexuIVYaQi0lB+yi
 vS48lYcN40N9JvxCjpftD+Vo8f3Xo0U/I0rb443+vxwoM1La/XYO4oZqb9nCm/C8Xbfh
 NstQ==
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
