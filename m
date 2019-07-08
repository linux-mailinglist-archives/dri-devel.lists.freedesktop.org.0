Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFB861DCA
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 13:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD1689CA2;
	Mon,  8 Jul 2019 11:30:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF80889CA2
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 11:30:14 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id t28so15494298lje.9
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2019 04:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HjNKpQFmIewFx+k3T6jnqse6+88/5lukbwUxFW5eSqs=;
 b=VIO5d5vDssk+sBhO3oAkUz0+kc0IUwmtrK11hsICu9xBlc8QvwOe9ZktGqCrdhphKD
 DDbdOP3J0hZ0d1jMltL2w6l40c9ejIOnRZGURtnDMTEm2fHu8P+9FE6pMyEmtAE6DG8f
 IWBO2xH5pqM+5+E9lJ3iWQXNfi5sOZvhCPLzXERmgSrMzg5ZzrR9hv+2mNRBK+tW9jEz
 mh9iVK0Jp0FjaAYZQ6QJf4eQHNRhSAizrM7Z2cXWW+FB0R3tPV8SUf+NNdQCQwwthg3r
 X7TBpM+KidV6RbE9CtKS1qxEcwN+0ps+eWD8rMrMW9h5G1bn/N6KxCI2XlooWsrNCyre
 Cs9w==
X-Gm-Message-State: APjAAAXIukBNoGCOvC7I9eYju/FN8JGHBbwhsiP+VmmhGBKzqLuVECLw
 86WS8kWLwtuVGHnOV/yrI2IznA==
X-Google-Smtp-Source: APXvYqx9eRIYhT87b5I44AAtJNpXL4O6BA3xIR2Vil2J+GhyJJgq6ZQLS3BwYHz5pT8VNwxLNP6WQQ==
X-Received: by 2002:a2e:b0e6:: with SMTP id h6mr4290833ljl.18.1562585413242;
 Mon, 08 Jul 2019 04:30:13 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id x67sm3596558ljb.13.2019.07.08.04.30.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 08 Jul 2019 04:30:12 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH] drm/bridge/nxp-ptn3460: Drop legacy GPIO headers
Date: Mon,  8 Jul 2019 13:30:09 +0200
Message-Id: <20190708113009.12723-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HjNKpQFmIewFx+k3T6jnqse6+88/5lukbwUxFW5eSqs=;
 b=rZyT/UMbZiUzNPctdDYbWtT1ZnxA9Sj8R9B39PoycBVCj9SFe7hgtRld4OZfg5yqN6
 G3gXHC3mLwOi5yoQgUsb+KeyJca8kV33sqomKuYuEvM3+6ub9wcUaeXaofBdHmdrN3Ma
 49loUCEnLSu536k3s401XNibVgNR2gJ8YvloyFYksgIG8h7wZHbGkHj7V2UZt0SIzMPa
 UYas97n/CdlxA4K4MPuZ5203uCWqQwuTEWwTHRwGuNGUE/nuxTZYwMq3DSaR3+wJured
 cZaYynRkcpljZM6iomE/KeARWmuQuHL5tfWft9d36P3hBYVxIkR7YZEbFJO+tyBJI67u
 I8LQ==
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBkcml2ZXIgdXNlcyBleGNsdXNpdmVseSB0aGUgbmV3IEdQSU8gQVBJIGZyb20KPGxpbnV4
L2dwaW8vY29uc3VtZXIuaD4gc28ganVzdCBkcm9wIHRoZSBvbGQgQVBJIGhlYWRlcnMuCgpTaWdu
ZWQtb2ZmLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9ueHAtcHRuMzQ2MC5jIHwgMiAtLQogMSBmaWxlIGNoYW5n
ZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9u
eHAtcHRuMzQ2MC5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9ueHAtcHRuMzQ2MC5jCmluZGV4
IDlmZDIzMWM1ODg3Zi4uMTlmODQ3YWE1NDk3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL254cC1wdG4zNDYwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9ueHAtcHRu
MzQ2MC5jCkBAIC02LDEyICs2LDEwIEBACiAgKi8KIAogI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+
Ci0jaW5jbHVkZSA8bGludXgvZ3Bpby5oPgogI2luY2x1ZGUgPGxpbnV4L2dwaW8vY29uc3VtZXIu
aD4KICNpbmNsdWRlIDxsaW51eC9pMmMuaD4KICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KICNp
bmNsdWRlIDxsaW51eC9vZi5oPgotI2luY2x1ZGUgPGxpbnV4L29mX2dwaW8uaD4KICNpbmNsdWRl
IDxkcm0vZHJtX2F0b21pY19oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2NydGMuaD4KICNp
bmNsdWRlIDxkcm0vZHJtX2VkaWQuaD4KLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
