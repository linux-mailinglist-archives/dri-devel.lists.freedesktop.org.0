Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6686430054
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2019 18:46:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E4C96E3B7;
	Thu, 30 May 2019 16:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E97466E162;
 Thu, 30 May 2019 16:00:41 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id go2so2728360plb.9;
 Thu, 30 May 2019 09:00:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=nFuE48SxjxGD42uWCm67in47wWXCmv1XAERqUz8MYR0=;
 b=cOujDq96+5VJ+YJ7tqpT8JWmEnMrzvYwvttiJu4HvHqx5S62ETO8XFhi5mqIskt0XI
 hEWfSmsbf+0UDCb/Rifut/Q4350orS5ZeQNA2NxlqFQbYTiZrBQ3BdIdwNJ8eFFPPu4f
 bVg+hmxIhlTOWO/ISh/S5DIKqDTcGAYpS1e5IWJadIyFl9yif+yl41sgf1xl/Tt6r6zu
 PmetAjbb9DiP6Gj0R2/FsDFytXc5x97C9mA/mrymG5OmQF455NH1hi++CJq6ZBVabv5q
 xHYfeM/kiO0cBNMyq/Ix/tsUMemgg1DJKhi3K824kKWebZkjMG6PpdfbDn4G1uHAFBgn
 npSg==
X-Gm-Message-State: APjAAAV5iFoERJqnOIOlEh0CysoVH9Gnczk8w5b1qA5MSfq3F+w46qi2
 f8/lysiZETVBgKu3HoCdyB4=
X-Google-Smtp-Source: APXvYqwixR7q3Osx9ui3862owtX4fZY1r/HG70N3K2IuvZ685K6K5Bn6WbQSGj8CEqm/zetPpXfNjw==
X-Received: by 2002:a17:902:8d94:: with SMTP id
 v20mr4034604plo.99.1559232041637; 
 Thu, 30 May 2019 09:00:41 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id k36sm3278390pjb.14.2019.05.30.09.00.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 May 2019 09:00:41 -0700 (PDT)
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 2/4] drm/msm/dsi: Add support for MSM8998 10nm dsi phy
Date: Thu, 30 May 2019 09:00:39 -0700
Message-Id: <20190530160039.2824-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190530155909.2718-1-jeffrey.l.hugo@gmail.com>
References: <20190530155909.2718-1-jeffrey.l.hugo@gmail.com>
X-Mailman-Approved-At: Thu, 30 May 2019 16:46:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=nFuE48SxjxGD42uWCm67in47wWXCmv1XAERqUz8MYR0=;
 b=NnAw8ZFx9RxpVuQ9/KhIc8M8EEHTxQnD5/6j/xJ2aXuv0QpAy6dUtA82UM3hxcgniX
 QUcDqNHDD+zUkApJfHw7H0ZCONI0dToj6nUo9A+2dQZo0J5MKMRy+frfVBDFVbQ7INfV
 dY71wg646IhT5wgSMxvdRRfVMn84bzCLOEL/eRGsD2T6c62qS1nFq/FjQ2oOeNYcPCoR
 Br7euxPfOFiKg0qZgBnPKgqq9S5g+A6JJsXTrmN+wzuDakO6ke7qs5yxSCCcHbyY/GyQ
 SgVK5ZysV9mGwcLT/OPV9WR+6xc6tVE4lCqvIpQ6QQnpTqeUi9DS8TTVnpDOtWL2VSOH
 ED2Q==
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, marc.w.gonzalez@free.fr,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
 sibis@codeaurora.org, freedreno@lists.freedesktop.org, chandanu@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIE1TTTg5OTggZHNpIHBoeSBpcyAxMG5tIHYzLjAuMCBsaWtlIFNETTg0NSwgaG93ZXZlciB0
aGVyZSBhcHBlYXIgdG8KYmUgbWlub3IgZGlmZmVyZW5jZXMgc3VjaCBhcyB0aGUgYWRkcmVzcyBz
cGFjZSBsb2NhdGlvbi4KClNpZ25lZC1vZmYtYnk6IEplZmZyZXkgSHVnbyA8amVmZnJleS5sLmh1
Z29AZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5LmMg
ICAgICB8ICAyICsrCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9waHkvZHNpX3BoeS5oICAgICAg
fCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9waHkvZHNpX3BoeV8xMG5tLmMgfCAxOCAr
KysrKysrKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5LmMgYi9kcml2ZXJz
L2dwdS9kcm0vbXNtL2RzaS9waHkvZHNpX3BoeS5jCmluZGV4IDE3NjA0ODNiMjQ3ZS4uZmRhNzM3
NDlmY2MwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9waHkvZHNpX3BoeS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5LmMKQEAgLTUwNyw2ICs1
MDcsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBkc2lfcGh5X2R0X21hdGNo
W10gPSB7CiAjaWZkZWYgQ09ORklHX0RSTV9NU01fRFNJXzEwTk1fUEhZCiAJeyAuY29tcGF0aWJs
ZSA9ICJxY29tLGRzaS1waHktMTBubSIsCiAJICAuZGF0YSA9ICZkc2lfcGh5XzEwbm1fY2ZncyB9
LAorCXsgLmNvbXBhdGlibGUgPSAicWNvbSxkc2ktcGh5LTEwbm0tODk5OCIsCisJICAuZGF0YSA9
ICZkc2lfcGh5XzEwbm1fODk5OF9jZmdzIH0sCiAjZW5kaWYKIAl7fQogfTsKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5LmggYi9kcml2ZXJzL2dwdS9kcm0v
bXNtL2RzaS9waHkvZHNpX3BoeS5oCmluZGV4IGEyNGFiODA5OTRhMy4uNzE2MWJlYjIzYjAzIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9waHkvZHNpX3BoeS5oCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5LmgKQEAgLTQ5LDYgKzQ5LDcgQEAgZXh0
ZXJuIGNvbnN0IHN0cnVjdCBtc21fZHNpX3BoeV9jZmcgZHNpX3BoeV8yMG5tX2NmZ3M7CiBleHRl
cm4gY29uc3Qgc3RydWN0IG1zbV9kc2lfcGh5X2NmZyBkc2lfcGh5XzI4bm1fODk2MF9jZmdzOwog
ZXh0ZXJuIGNvbnN0IHN0cnVjdCBtc21fZHNpX3BoeV9jZmcgZHNpX3BoeV8xNG5tX2NmZ3M7CiBl
eHRlcm4gY29uc3Qgc3RydWN0IG1zbV9kc2lfcGh5X2NmZyBkc2lfcGh5XzEwbm1fY2ZnczsKK2V4
dGVybiBjb25zdCBzdHJ1Y3QgbXNtX2RzaV9waHlfY2ZnIGRzaV9waHlfMTBubV84OTk4X2NmZ3M7
CiAKIHN0cnVjdCBtc21fZHNpX2RwaHlfdGltaW5nIHsKIAl1MzIgY2xrX3ByZTsKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5XzEwbm0uYyBiL2RyaXZlcnMv
Z3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5XzEwbm0uYwppbmRleCA0NDk1OWU3OWNlMjguLmIx
ZTdkYmM2OWZhNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGh5L2RzaV9w
aHlfMTBubS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5XzEwbm0u
YwpAQCAtMjIxLDMgKzIyMSwyMSBAQCBjb25zdCBzdHJ1Y3QgbXNtX2RzaV9waHlfY2ZnIGRzaV9w
aHlfMTBubV9jZmdzID0gewogCS5pb19zdGFydCA9IHsgMHhhZTk0NDAwLCAweGFlOTY0MDAgfSwK
IAkubnVtX2RzaV9waHkgPSAyLAogfTsKKworY29uc3Qgc3RydWN0IG1zbV9kc2lfcGh5X2NmZyBk
c2lfcGh5XzEwbm1fODk5OF9jZmdzID0geworCS50eXBlID0gTVNNX0RTSV9QSFlfMTBOTSwKKwku
c3JjX3BsbF90cnV0aHRhYmxlID0geyB7ZmFsc2UsIGZhbHNlfSwge3RydWUsIGZhbHNlfSB9LAor
CS5yZWdfY2ZnID0geworCQkubnVtID0gMSwKKwkJLnJlZ3MgPSB7CisJCQl7InZkZHMiLCAzNjAw
MCwgMzJ9LAorCQl9LAorCX0sCisJLm9wcyA9IHsKKwkJLmVuYWJsZSA9IGRzaV8xMG5tX3BoeV9l
bmFibGUsCisJCS5kaXNhYmxlID0gZHNpXzEwbm1fcGh5X2Rpc2FibGUsCisJCS5pbml0ID0gZHNp
XzEwbm1fcGh5X2luaXQsCisJfSwKKwkuaW9fc3RhcnQgPSB7IDB4Yzk5NDQwMCwgMHhjOTk2NDAw
IH0sCisJLm51bV9kc2lfcGh5ID0gMiwKK307Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
