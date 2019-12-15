Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1AE11FAF3
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2019 21:05:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A86389DC2;
	Sun, 15 Dec 2019 20:05:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD9189DC2
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2019 20:05:03 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id s64so2422078pgb.9
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2019 12:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xIgln2CTeNUTcohT4yCRcrSFMvesnt3sC8dwNxQQtUM=;
 b=o2wysAteIijZ8tWGZKG3kD7OLB1HVQ98F+1acPL7apqrId+6bkSJZp4bfeQPcLTcCD
 W5zJdE9b8FfrrxIQq6rg5wWqgxa1Slp9K5vgMHjhOYD3g/FiPj97CRVs4giFDnmA5GRG
 nBEw8JDPILEc6VehgT3fCDIidNQYVDmkTwwKIVhcVWY7GfxqNhk7VtPAsAqJDk5GjSU7
 nHvQB+momWt3yrCoLOHZ1qraHWRt5BDUr3d6ZW5R2GvkYBczxl6ZuBY5Yat4RqDPCm+3
 VbSoSGG2PgXYDLxJj38VD3pwr/8x8Wx1sjMpswhQCx3Dhr0L6y3Y0xiyXOOTOC+fYNSu
 91dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xIgln2CTeNUTcohT4yCRcrSFMvesnt3sC8dwNxQQtUM=;
 b=d78RSKq32j8G5EhaZbFT87VYDKBKa6fb04n2jDKgf2rXlDhlcf/Q363qWlaawRRuSs
 crODvFgtzWm2TNdnDJC0FW3RODsV9JA23D9tqg9ZV0qmAhINcRROKzzAhX8Ii0HcHDUK
 O9OemnJ+GWIbWyGr7OHovVSLftkWqupa14QMUjuE+G0aYMTbeSmEwGK2xOadRUBVHmW5
 KhXi/BDFGwID+zi1fvk2Ken7zECquzuWB8xnoyv/9a+Kxpv50O94oln3i/g7BD5oQGBj
 7XobsO/hYed1Vmx274tM8Z7fkKHGCqYbSZn/TaDvGh/rnFlonbgxcLdZktbVK3bMZI3/
 rr9Q==
X-Gm-Message-State: APjAAAXM2Tt2/ax6w/meRZQskodoxjc9o+TGvIhMG1Xsmwl2BCnAZKhL
 Ok+3P/cc2kLR+ube9dnm6JY=
X-Google-Smtp-Source: APXvYqwhMYzq9LVfNRlgXR0Z/3qbGzkkpOo79arI9v4XBwf4PSol4vSxiffMt0IkLYIKZtwLVmBK6g==
X-Received: by 2002:a63:4f64:: with SMTP id p36mr14378616pgl.271.1576440302589; 
 Sun, 15 Dec 2019 12:05:02 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 c8sm18881075pfj.106.2019.12.15.12.05.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2019 12:05:01 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 1/2] fixup! drm/bridge: ti-sn65dsi86: Train at faster rates if
 slower ones fail
Date: Sun, 15 Dec 2019 12:04:59 -0800
Message-Id: <20191215200459.1018893-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191213154448.8.I251add713bc5c97225200894ab110ea9183434fd@changeid>
References: <20191213154448.8.I251add713bc5c97225200894ab110ea9183434fd@changeid>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKRml4ZXM6CgpJbiBmaWxl
IGluY2x1ZGVkIGZyb20gLi4vZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS1zbjY1ZHNpODYuYzoy
NToKLi4vZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS1zbjY1ZHNpODYuYzogSW4gZnVuY3Rpb24g
4oCYdGlfc25fYnJpZGdlX2VuYWJsZeKAmToKLi4vaW5jbHVkZS9kcm0vZHJtX3ByaW50Lmg6MzM5
OjI6IHdhcm5pbmc6IOKAmGxhc3RfZXJyX3N0cuKAmSBtYXkgYmUgdXNlZCB1bmluaXRpYWxpemVk
IGluIHRoaXMgZnVuY3Rpb24gWy1XbWF5YmUtdW5pbml0aWFsaXplZF0KICAzMzkgfCAgZHJtX2Rl
dl9wcmludGsoZGV2LCBLRVJOX0VSUiwgIipFUlJPUiogIiBmbXQsICMjX19WQV9BUkdTX18pCiAg
ICAgIHwgIF5+fn5+fn5+fn5+fn5+Ci4uL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRz
aTg2LmM6NjUwOjE0OiBub3RlOiDigJhsYXN0X2Vycl9zdHLigJkgd2FzIGRlY2xhcmVkIGhlcmUK
ICA2NTAgfCAgY29uc3QgY2hhciAqbGFzdF9lcnJfc3RyOwogICAgICB8ICAgICAgICAgICAgICBe
fn5+fn5+fn5+fn4KSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4uL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvdGktc242NWRzaTg2LmM6MjU6Ci4uL2luY2x1ZGUvZHJtL2RybV9wcmludC5oOjMzOToyOiB3
YXJuaW5nOiDigJhyZXTigJkgbWF5IGJlIHVzZWQgdW5pbml0aWFsaXplZCBpbiB0aGlzIGZ1bmN0
aW9uIFstV21heWJlLXVuaW5pdGlhbGl6ZWRdCiAgMzM5IHwgIGRybV9kZXZfcHJpbnRrKGRldiwg
S0VSTl9FUlIsICIqRVJST1IqICIgZm10LCAjI19fVkFfQVJHU19fKQogICAgICB8ICBefn5+fn5+
fn5+fn5+fgouLi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jOjY1NDo2OiBu
b3RlOiDigJhyZXTigJkgd2FzIGRlY2xhcmVkIGhlcmUKICA2NTQgfCAgaW50IHJldDsKICAgICAg
fCAgICAgIF5+fgogIEJ1aWxkaW5nIG1vZHVsZXMsIHN0YWdlIDIuCi0tLQogZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS90aS1zbjY1ZHNpODYuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3RpLXNuNjVkc2k4Ni5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS1zbjY1ZHNp
ODYuYwppbmRleCBjYjc3NGVlNTM2Y2QuLjk3NmY5ODk5MWIzZCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS90aS1zbjY1ZHNpODYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3RpLXNuNjVkc2k4Ni5jCkBAIC02MTgsMTEgKzYxOCwxMSBAQCBzdGF0aWMgaW50IHRpX3Nu
X2xpbmtfdHJhaW5pbmcoc3RydWN0IHRpX3NuX2JyaWRnZSAqcGRhdGEsIGludCBkcF9yYXRlX2lk
eCwKIHN0YXRpYyB2b2lkIHRpX3NuX2JyaWRnZV9lbmFibGUoc3RydWN0IGRybV9icmlkZ2UgKmJy
aWRnZSkKIHsKIAlzdHJ1Y3QgdGlfc25fYnJpZGdlICpwZGF0YSA9IGJyaWRnZV90b190aV9zbl9i
cmlkZ2UoYnJpZGdlKTsKLQljb25zdCBjaGFyICpsYXN0X2Vycl9zdHI7CisJY29uc3QgY2hhciAq
bGFzdF9lcnJfc3RyID0gIk5vIHN1cHBvcnRlZCBEUCByYXRlIjsKIAlpbnQgZHBfcmF0ZV9pZHg7
CiAJaW50IG1heF9kcF9yYXRlX2lkeDsKIAl1bnNpZ25lZCBpbnQgdmFsOwotCWludCByZXQ7CisJ
aW50IHJldCA9IC1FSU5WQUw7CiAKIAkvKgogCSAqIFJ1biB3aXRoIHRoZSBtYXhpbXVtIG51bWJl
ciBvZiBsYW5lcyB0aGF0IHRoZSBEUCBzaW5rIHN1cHBvcnRzLgotLSAKMi4yMy4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
