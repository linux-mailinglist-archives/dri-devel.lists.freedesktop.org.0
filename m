Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E971B3AC6F
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2019 00:33:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A5389319;
	Sun,  9 Jun 2019 22:32:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C16289319
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jun 2019 22:32:56 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 207so1824286wma.1
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Jun 2019 15:32:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oHE6k7rliyU4lSZOynfN3gs/shA7RjC/rZvOf2sbHwA=;
 b=Qvk9XLtzuduv+BOTtncnN2iA1jcIo4jfB47HpxZWbRFDcpbCAMsHXYF7hZ7NNvZ0bF
 /I72AnD6McvK/pBlZ6eUGnNhNDkSx9i4rYOm3sSbnT6jxiitHsfy/K6vs4LaxGS0WzhM
 6Tz08hD6WJwp11dRb4FChU4X+l6mSMhWaIFTSly/BY/H7hVyaE7DlSMllPEmf8FgO4Wa
 q7N7L6ZmDMJIwoWJ23z+v7UiDse5qEwPQpDRLRt3HRDl6LrVHyu/7SL/I1Vvp97KB3BP
 nDb9rIEUizP8dO1Xmm05SH+tdl5PkpKQvykzREYrO7Qb/YfWAROHeLcRWz9wSScecs9y
 3ffg==
X-Gm-Message-State: APjAAAULa+RneIpmDeTbRSKsKxHgWjx6M3RN5Ag0kcv/9xdkcoJ0sQ/d
 XlqfMSz+9PecFa315kLORTcghg==
X-Google-Smtp-Source: APXvYqxzQXxDdV3LROHl3OIHY9KuXw9ZjJUgjMNOjk/iPCclVgNhdfPYVhQ4C+dyPKMW3XOlcDT1mw==
X-Received: by 2002:a1c:7ec8:: with SMTP id z191mr10988905wmc.66.1560119575208; 
 Sun, 09 Jun 2019 15:32:55 -0700 (PDT)
Received: from localhost.localdomain (catv-89-135-96-219.catv.broadband.hu.
 [89.135.96.219])
 by smtp.gmail.com with ESMTPSA id j16sm18122868wre.94.2019.06.09.15.32.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 09 Jun 2019 15:32:54 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH] drm/bridge: analogix-anx78xx: Drop of_gpio.h include
Date: Mon, 10 Jun 2019 00:32:54 +0200
Message-Id: <20190609223254.8523-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oHE6k7rliyU4lSZOynfN3gs/shA7RjC/rZvOf2sbHwA=;
 b=W25BKxDAY7xYOWZ4DBfqCpktYYXQyu+OO6gycdFXjJjssGXRcoc9mz2uynLd4qwSpQ
 iLIFSJk3H3LfdfR+9KfdkuiTjfeFgloamiAGoS2dtkXcY6uHajPiGa669wMdYcQxhF+r
 LJ5n+ZrAH+v2e/Ro6wz+3u3gUM6Gm6jbt41PmTyKtoqYuUOHQTPyd8sFukZpD+jquAj3
 +xDtRAAAiDKwwfxFOzdl7eVl7qlcwIQZ8t4HDlrll7U0aw9ita3TJOYmojBPT4eFi2dg
 yTHlf5ciwrJJU2D3LezIGTIlv2VqQn5l5HRqO0xZwDRtYUw6h7ciMcWODfcSVYuKs7RB
 SPXg==
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
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpbmNsdWRlIGlzIG9ubHkgdXNlZCBmb3Igc29tZSBncGlvIGRyaXZlcnMgYW5kIGNvbnN1
bWVycwp0aGF0IGxvb2sgdXAgR1BJTyBudW1iZXJzIGRpcmVjdGx5IGZyb20gdGhlIGRldmljZSB0
cmVlLgpUaGlzIGRyaXZlciBkb2VzIG5vdCB1c2UgaXQgYW5kIG9ubHkgbmVlZHMgPGxpbnV4L2dw
aW8vY29uc3VtZXIuaD4uCkRlbGV0ZSB0aGUgdW51c2VkIGluY2x1ZGUuCgpDYzogRW5yaWMgQmFs
bGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFib3JhLmNvbT4KQ2M6IEpvc2UgQWJy
ZXUgPEpvc2UuQWJyZXVAc3lub3BzeXMuY29tPgpTaWduZWQtb2ZmLWJ5OiBMaW51cyBXYWxsZWlq
IDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9h
bmFsb2dpeC1hbng3OHh4LmMgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC1hbng3OHh4LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4LWFueDc4eHguYwppbmRleCBjMDlhYWY5M2Fl
MWIuLjYxYjUxMjJlNWE1MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFs
b2dpeC1hbng3OHh4LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC1hbng3
OHh4LmMKQEAgLTIwLDcgKzIwLDYgQEAKICNpbmNsdWRlIDxsaW51eC9pMmMuaD4KICNpbmNsdWRl
IDxsaW51eC9rZXJuZWwuaD4KICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KLSNpbmNsdWRlIDxs
aW51eC9vZl9ncGlvLmg+CiAjaW5jbHVkZSA8bGludXgvb2ZfaXJxLmg+CiAjaW5jbHVkZSA8bGlu
dXgvb2ZfcGxhdGZvcm0uaD4KICNpbmNsdWRlIDxsaW51eC9yZWdtYXAuaD4KLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
