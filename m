Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C41CE73C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 17:19:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C1D46E602;
	Mon,  7 Oct 2019 15:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F7A6E600
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 15:19:23 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id d192so5256790ywa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2019 08:19:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=va7DzYTLDisgPb0Q7LAfg9j6xV96g03+xcPDp+1en2Y=;
 b=BsmfzZiOlzgCuJeMBRJjjMS8aJHebFJVBcXfprWeG72BFQylSd3kNWtQaXIKToD4nA
 F4xUCfPT35v789uwrjFqxNlflo8ASF3pWhWdpDg57Vu+MLPwGDn8G1TBnJI3eyvs/ies
 CrUaf+z+svw1Hp4kxWmrRP3gS47xyx1SZQz4Tx6F55D5H39XMW00SGmaPdp7EJcffCdW
 WnHcUBapivnYH9znF64iJzPz/h5ezNFRPN8xP6I+85t8iAyLgX1KOZCZqMTw7ID00eYx
 RTssk28ObAHAleLbsAjX3JKAkA8rwxoDEwzB87aRI78swzUDlCVHmFGA74WTucrlHN7U
 vDhg==
X-Gm-Message-State: APjAAAXdBe3tMgoArbMNde6FwWxv3fxjZkCvK8mOEWhGbZ7vs9VeUbjb
 DSCSjUQftWKkrLSXsOKcC6iotGAgHwU=
X-Google-Smtp-Source: APXvYqx7eMSr7rGGtkEwZIh/7tK9sJ+V6gRs5t479H+c1U5/HJocHXFLLwn+HbVA3kvrCZ8cgItLpg==
X-Received: by 2002:a0d:e693:: with SMTP id
 p141mr21354576ywe.425.1570461562832; 
 Mon, 07 Oct 2019 08:19:22 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id y67sm4102306ywd.63.2019.10.07.08.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 08:19:22 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] Documentation: Fix warning in drm-kmsc-helpers.rst
Date: Mon,  7 Oct 2019 11:19:01 -0400
Message-Id: <20191007151921.27099-1-sean@poorly.run>
X-Mailer: git-send-email 2.23.0.581.g78d2f28ef7-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=va7DzYTLDisgPb0Q7LAfg9j6xV96g03+xcPDp+1en2Y=;
 b=S3ELl6Nv91EyPBYsO7BiEf2AnAYj1MigM2PswaRsih+xB+6PpLe+SE1a26aduZZ0WJ
 prD8sFCQ8qbB5KfmLwL1Q+6CCGVhJCU34APnIg7qsFtUtEbZXBA/8TRb9GpE+czQVfNS
 Uz8SU3JEZJN8m8sYapKNX0cX1xhoMchgA+BBwsS49YYro5VJSBCTQbjxjCycBOOhpDPP
 nfKq0+Lk78vYxR9JHkwN4zz2mcaA52qjUOjcTLO3pFYtWKHM12NaBqIn9s+CydD5expx
 cvYeOghjmBkjhY3u2VMwW2uFrwxKaSjcGp57I0qzYYK/ZyIhI+LeOCarS+oOnS3HcZm3
 i+xA==
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
Cc: linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpGaXhlcyB0aGUgZm9sbG93
aW5nIHdhcm5pbmc6Ci4uL2luY2x1ZGUvZHJtL2RybV9hdG9taWNfc3RhdGVfaGVscGVyLmg6MTog
d2FybmluZzogbm8gc3RydWN0dXJlZCBjb21tZW50cyBmb3VuZAoKRml4ZXM6IDllZjhhOWRjNGIy
MSAoImRybTogRXh0cmFjdCBkcm1fYXRvbWljX3N0YXRlX2hlbHBlci5baGNdIikKQ2M6IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CkNjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFy
dGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJk
QGtlcm5lbC5vcmc+CkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KQ2M6IERhdmlkIEFp
cmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5j
aD4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogU2Vh
biBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+Ci0tLQogRG9jdW1lbnRhdGlvbi9ncHUvZHJt
LWttcy1oZWxwZXJzLnJzdCB8IDMgLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2dwdS9kcm0ta21zLWhlbHBlcnMucnN0IGIvRG9j
dW1lbnRhdGlvbi9ncHUvZHJtLWttcy1oZWxwZXJzLnJzdAppbmRleCAzODY4MDA4ZGI4YTkuLjk2
NjhhN2ZlMjQwOCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9ncHUvZHJtLWttcy1oZWxwZXJz
LnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL2dwdS9kcm0ta21zLWhlbHBlcnMucnN0CkBAIC03Nyw5
ICs3Nyw2IEBAIEF0b21pYyBTdGF0ZSBSZXNldCBhbmQgSW5pdGlhbGl6YXRpb24KIEF0b21pYyBT
dGF0ZSBIZWxwZXIgUmVmZXJlbmNlCiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogCi0u
LiBrZXJuZWwtZG9jOjogaW5jbHVkZS9kcm0vZHJtX2F0b21pY19zdGF0ZV9oZWxwZXIuaAotICAg
OmludGVybmFsOgotCiAuLiBrZXJuZWwtZG9jOjogZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNf
c3RhdGVfaGVscGVyLmMKICAgIDpleHBvcnQ6CiAKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5n
aW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
