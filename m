Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BC310F049
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 20:33:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 576196E2E2;
	Mon,  2 Dec 2019 19:33:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A15D6E2E2
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 19:33:35 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id r14so786945lfm.5
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 11:33:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mwTbXFs73rhfB3XHykRb+0twTubxbVTCKbes8vP1eoM=;
 b=S5QuyUm86y8c+yawruRYq7gSN4quvqyGftNVs4i7XQxPJFDGfnFIuBHW0gsYxv1GA+
 mxnsbtzDTlrGKgVL189bZSzYP4pqbkqsCFX6SOWujBOpY0R9VvCjnlBu1Bj84bx22xLm
 +A0nZwjKDulPPdH9rgmzRpbzw1Imi1ZH+Aj0nQ/Gnd5Ch24tE5zbdX20AwrJkMrNf3Yb
 Ysh7+KYTiW0C4e5QiNRG9GEAjlRRTowx6cNZqi2F0E10nijE8oKoWGMjkiJMG408F7zD
 XFN9irl53qpp0eT6E9KjkAd5ZwuxuUh0Yz4BIjSi12Kx3QPibsiTpn9GiheZGsGEmADl
 513A==
X-Gm-Message-State: APjAAAUoOtEq3o7mvRyMSAmLUU0p8oyyvIOX4twP/3mIshd+yDbhUYh5
 ppiD3M/VSEfBrwMi8IkjbFBYMSIiB1xwrQ==
X-Google-Smtp-Source: APXvYqxzH31f+2bGhDcEEDLD8E4lagqqgmHLv3NkKQxX8k5tVEOx+63XjFDyGaJYh0xM4o22P4hcLw==
X-Received: by 2002:ac2:5a1a:: with SMTP id q26mr431452lfn.33.1575315213309;
 Mon, 02 Dec 2019 11:33:33 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 g13sm79482lfb.74.2019.12.02.11.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 11:33:32 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 15/26] drm/panel: osd-osd101t2587-53ts: use drm_panel
 backlight support
Date: Mon,  2 Dec 2019 20:32:19 +0100
Message-Id: <20191202193230.21310-16-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mwTbXFs73rhfB3XHykRb+0twTubxbVTCKbes8vP1eoM=;
 b=fWsZc6pxE2cR74tH1x5bcK85tMs5P3XVQy6wY8Dzsei7SXL9iuN8fSp5lSWf7pMIdC
 xa4gKaBfW9GQl0tsJcMEulN2LTZ1dFp27MuO1x3ucEfaXHh9k03NMnT8pnU6IY5gCxpY
 8kA6ToWIuyco+mlNtxdfOniENQxwNYP7VK8XAJSeokDRcbVtY0rN/Vsyg4bJBVWLT3gI
 W4lYkw+KLbAeuKXj6iVyrITCefWtK7oUSk1KodcyX+U7pkfYxsD190Gy9r+bVtOrtIq+
 AHb1cVc40/4a1zUiR1PFruWHBNmyVb28/b76FXir/cJ/Zsd30ak1i5gzL2R8sNvMdh7l
 S3Wg==
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jitao Shi <jitao.shi@mediatek.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-mediatek@lists.infradead.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 linux-tegra@vger.kernel.org, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Purism Kernel Team <kernel@puri.sm>,
 linux-renesas-soc@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIHRoZSBiYWNrbGlnaHQgc3VwcG9ydCBpbiBkcm1fcGFuZWwgdG8gc2ltcGxpZnkgdGhlIGRy
aXZlcgoKU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzog
VGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KQ2M6IFNhbSBSYXZuYm9y
ZyA8c2FtQHJhdm5ib3JnLm9yZz4KLS0tCiAuLi4vZHJtL3BhbmVsL3BhbmVsLW9zZC1vc2QxMDF0
MjU4Ny01M3RzLmMgICAgfCAyNCArKysrKysrLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vcGFuZWwvcGFuZWwtb3NkLW9zZDEwMXQyNTg3LTUzdHMuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5lbC9wYW5lbC1vc2Qtb3NkMTAxdDI1ODctNTN0cy5jCmluZGV4IDI3MzRiNDgzNWRmYS4u
M2EwMjI5ZDYwMDk1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtb3Nk
LW9zZDEwMXQyNTg3LTUzdHMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtb3Nk
LW9zZDEwMXQyNTg3LTUzdHMuYwpAQCAtNCw3ICs0LDYgQEAKICAqICBBdXRob3I6IFBldGVyIFVq
ZmFsdXNpIDxwZXRlci51amZhbHVzaUB0aS5jb20+CiAgKi8KIAotI2luY2x1ZGUgPGxpbnV4L2Jh
Y2tsaWdodC5oPgogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgogI2luY2x1ZGUgPGxpbnV4L29m
Lmg+CiAjaW5jbHVkZSA8bGludXgvcmVndWxhdG9yL2NvbnN1bWVyLmg+CkBAIC0yMCw3ICsxOSw2
IEBAIHN0cnVjdCBvc2QxMDF0MjU4N19wYW5lbCB7CiAJc3RydWN0IGRybV9wYW5lbCBiYXNlOwog
CXN0cnVjdCBtaXBpX2RzaV9kZXZpY2UgKmRzaTsKIAotCXN0cnVjdCBiYWNrbGlnaHRfZGV2aWNl
ICpiYWNrbGlnaHQ7CiAJc3RydWN0IHJlZ3VsYXRvciAqc3VwcGx5OwogCiAJYm9vbCBwcmVwYXJl
ZDsKQEAgLTQyLDggKzQwLDYgQEAgc3RhdGljIGludCBvc2QxMDF0MjU4N19wYW5lbF9kaXNhYmxl
KHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQogCWlmICghb3NkMTAxdDI1ODctPmVuYWJsZWQpCiAJ
CXJldHVybiAwOwogCi0JYmFja2xpZ2h0X2Rpc2FibGUob3NkMTAxdDI1ODctPmJhY2tsaWdodCk7
Ci0KIAlyZXQgPSBtaXBpX2RzaV9zaHV0ZG93bl9wZXJpcGhlcmFsKG9zZDEwMXQyNTg3LT5kc2kp
OwogCiAJb3NkMTAxdDI1ODctPmVuYWJsZWQgPSBmYWxzZTsKQEAgLTkxLDggKzg3LDYgQEAgc3Rh
dGljIGludCBvc2QxMDF0MjU4N19wYW5lbF9lbmFibGUoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwp
CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAotCWJhY2tsaWdodF9lbmFibGUob3NkMTAxdDI1
ODctPmJhY2tsaWdodCk7Ci0KIAlvc2QxMDF0MjU4Ny0+ZW5hYmxlZCA9IHRydWU7CiAKIAlyZXR1
cm4gcmV0OwpAQCAtMTU4LDE4ICsxNTIsMTkgQEAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgb3Nk
MTAxdDI1ODdfb2ZfbWF0Y2gpOwogc3RhdGljIGludCBvc2QxMDF0MjU4N19wYW5lbF9hZGQoc3Ry
dWN0IG9zZDEwMXQyNTg3X3BhbmVsICpvc2QxMDF0MjU4NykKIHsKIAlzdHJ1Y3QgZGV2aWNlICpk
ZXYgPSAmb3NkMTAxdDI1ODctPmRzaS0+ZGV2OworCWludCByZXQ7CiAKIAlvc2QxMDF0MjU4Ny0+
c3VwcGx5ID0gZGV2bV9yZWd1bGF0b3JfZ2V0KGRldiwgInBvd2VyIik7CiAJaWYgKElTX0VSUihv
c2QxMDF0MjU4Ny0+c3VwcGx5KSkKIAkJcmV0dXJuIFBUUl9FUlIob3NkMTAxdDI1ODctPnN1cHBs
eSk7CiAKLQlvc2QxMDF0MjU4Ny0+YmFja2xpZ2h0ID0gZGV2bV9vZl9maW5kX2JhY2tsaWdodChk
ZXYpOwotCWlmIChJU19FUlIob3NkMTAxdDI1ODctPmJhY2tsaWdodCkpCi0JCXJldHVybiBQVFJf
RVJSKG9zZDEwMXQyNTg3LT5iYWNrbGlnaHQpOwotCiAJZHJtX3BhbmVsX2luaXQoJm9zZDEwMXQy
NTg3LT5iYXNlLCAmb3NkMTAxdDI1ODctPmRzaS0+ZGV2LAogCQkgICAgICAgJm9zZDEwMXQyNTg3
X3BhbmVsX2Z1bmNzLCBEUk1fTU9ERV9DT05ORUNUT1JfRFNJKTsKIAorCXJldCA9IGRybV9wYW5l
bF9vZl9iYWNrbGlnaHQoJm9zZDEwMXQyNTg3LT5iYXNlKTsKKwlpZiAocmV0KQorCQlyZXR1cm4g
cmV0OworCiAJcmV0dXJuIGRybV9wYW5lbF9hZGQoJm9zZDEwMXQyNTg3LT5iYXNlKTsKIH0KIApA
QCAtMjE1LDEyICsyMTAsMTEgQEAgc3RhdGljIGludCBvc2QxMDF0MjU4N19wYW5lbF9yZW1vdmUo
c3RydWN0IG1pcGlfZHNpX2RldmljZSAqZHNpKQogCXN0cnVjdCBvc2QxMDF0MjU4N19wYW5lbCAq
b3NkMTAxdDI1ODcgPSBtaXBpX2RzaV9nZXRfZHJ2ZGF0YShkc2kpOwogCWludCByZXQ7CiAKLQly
ZXQgPSBvc2QxMDF0MjU4N19wYW5lbF9kaXNhYmxlKCZvc2QxMDF0MjU4Ny0+YmFzZSk7CisJcmV0
ID0gZHJtX3BhbmVsX2Rpc2FibGUoJm9zZDEwMXQyNTg3LT5iYXNlKTsKIAlpZiAocmV0IDwgMCkK
IAkJZGV2X3dhcm4oJmRzaS0+ZGV2LCAiZmFpbGVkIHRvIGRpc2FibGUgcGFuZWw6ICVkXG4iLCBy
ZXQpOwogCi0Jb3NkMTAxdDI1ODdfcGFuZWxfdW5wcmVwYXJlKCZvc2QxMDF0MjU4Ny0+YmFzZSk7
Ci0KKwlkcm1fcGFuZWxfdW5wcmVwYXJlKCZvc2QxMDF0MjU4Ny0+YmFzZSk7CiAJZHJtX3BhbmVs
X3JlbW92ZSgmb3NkMTAxdDI1ODctPmJhc2UpOwogCiAJcmV0ID0gbWlwaV9kc2lfZGV0YWNoKGRz
aSk7CkBAIC0yMzQsOCArMjI4LDggQEAgc3RhdGljIHZvaWQgb3NkMTAxdDI1ODdfcGFuZWxfc2h1
dGRvd24oc3RydWN0IG1pcGlfZHNpX2RldmljZSAqZHNpKQogewogCXN0cnVjdCBvc2QxMDF0MjU4
N19wYW5lbCAqb3NkMTAxdDI1ODcgPSBtaXBpX2RzaV9nZXRfZHJ2ZGF0YShkc2kpOwogCi0Jb3Nk
MTAxdDI1ODdfcGFuZWxfZGlzYWJsZSgmb3NkMTAxdDI1ODctPmJhc2UpOwotCW9zZDEwMXQyNTg3
X3BhbmVsX3VucHJlcGFyZSgmb3NkMTAxdDI1ODctPmJhc2UpOworCWRybV9wYW5lbF9kaXNhYmxl
KCZvc2QxMDF0MjU4Ny0+YmFzZSk7CisJZHJtX3BhbmVsX3VucHJlcGFyZSgmb3NkMTAxdDI1ODct
PmJhc2UpOwogfQogCiBzdGF0aWMgc3RydWN0IG1pcGlfZHNpX2RyaXZlciBvc2QxMDF0MjU4N19w
YW5lbF9kcml2ZXIgPSB7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
