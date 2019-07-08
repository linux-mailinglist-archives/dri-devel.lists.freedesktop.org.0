Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B593861DCD
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 13:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA67B89CAC;
	Mon,  8 Jul 2019 11:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E63A89CAC
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 11:31:58 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id t28so15499801lje.9
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2019 04:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6TIi+Hc/eqHhbRtd39q1XcMs9DHtyXE8AdtvUQujRxg=;
 b=sR3Xo5J99qMhp9XnYIFdH2VBrRbUjXxV1pK+QlbujYrhftvQqwtxNfWRIExHW/JNRJ
 R924+/Qc5KOXfuWlXKFgGp0Fhx2iiFK4xNgBK/okbKXU8SB3IDAavBUCau4Ar6jSRLxt
 6iBM4t7bXHo/i9dvZ2QC9qimXloFtBLVAdEq1XTcVD/IujTggU/FXOuw2epiQnFp2zdB
 fXhsMZP1g5fDV/A5yt94K/Q3S7iBYS9xi1WBkH48hfijN7ntDBOxODw5A6EtHXNhKker
 GbqxNIApiTQU+xevgumKXKMxxX8ahe/OuniRwWn642hz5zfwQVUqIGJcepk115OqeWpa
 KxDQ==
X-Gm-Message-State: APjAAAWbxl9soGoLbmQeHUL8lfU3PPwDo+a3cCl9ysIACJcs4Cx96bsV
 SfJit6g3OIPbcGyN84ajyMM28w==
X-Google-Smtp-Source: APXvYqwzAcDDYZa1cG0AEjFK0cWeVEepmGmCR3shs1KXxC+/hNVmVfOxTlUg11vzcbg6qgIZU95cIw==
X-Received: by 2002:a2e:91c5:: with SMTP id u5mr10205128ljg.65.1562585517185; 
 Mon, 08 Jul 2019 04:31:57 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id q2sm2695762lfj.25.2019.07.08.04.31.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 08 Jul 2019 04:31:56 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH] drm/bridge/parade: Drop legacy GPIO header
Date: Mon,  8 Jul 2019 13:31:54 +0200
Message-Id: <20190708113154.12985-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6TIi+Hc/eqHhbRtd39q1XcMs9DHtyXE8AdtvUQujRxg=;
 b=u5LjKJb+wcyw89t1GAReFrwqUpSb6vTcsvbrc73oyemUTJLpIKH3MdQsfasm4/umpo
 XFH7iavifkjSziQ2Q9U0P7MhIHz3H5EygLxZxdSxuq4W3nhHxW/S7h/KbPihF3ryj7m0
 FGQGLTSZrvUdgtYBE4fYh85akFaYWIbKllU/ewc2S9ImTYr3SlYFMCderavxtZveO6AT
 YK4J8//xb/Wc8nc0ITgEAU0Jwcs5YXrXi4QmMnYDc8W163zOK5KIjugrCyiK0pBz8jJ/
 cRda9fIO7MzSh5UtfzrLcXCY3bmvYJYsiXfpbWNFlwGdfT4MDfScxp5uny2DpPck6MsG
 +orw==
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

VGhpcyBkcml2ZXIgdXNlcyB0aGUgbmV3IEdQSU8gQVBJIGZyb20gPGxpbnV4L2dwaW8vY29uc3Vt
ZXIuaD4Kc28gZHJvcCB0aGUgaW5jbHVzaW9uIG9mIHRoZSBsZWdhY3kgaGVhZGVyLgoKU2lnbmVk
LW9mZi1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFyYWRlLXBzODYyMi5jIHwgMSAtCiAxIGZpbGUgY2hhbmdl
ZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFy
YWRlLXBzODYyMi5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9wYXJhZGUtcHM4NjIyLmMKaW5k
ZXggNjk5YzhkZmIwZmNiLi5lMjZmNDc1ZWI1MTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvcGFyYWRlLXBzODYyMi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFy
YWRlLXBzODYyMi5jCkBAIC04LDcgKzgsNiBAQAogI2luY2x1ZGUgPGxpbnV4L2JhY2tsaWdodC5o
PgogI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+CiAjaW5jbHVkZSA8bGludXgvZXJyLmg+Ci0jaW5j
bHVkZSA8bGludXgvZ3Bpby5oPgogI2luY2x1ZGUgPGxpbnV4L2dwaW8vY29uc3VtZXIuaD4KICNp
bmNsdWRlIDxsaW51eC9pMmMuaD4KICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KLS0gCjIuMjEu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
