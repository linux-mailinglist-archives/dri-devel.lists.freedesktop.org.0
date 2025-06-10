Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AACF2AD471E
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 01:58:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D733F10E327;
	Tue, 10 Jun 2025 23:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MevNihO4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F18AC10E32D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 23:58:28 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-74865da80c4so653242b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 16:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749599908; x=1750204708; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=9cXko/sdujaNHPqqtbo6n7ThRGJuEz6vJP9Co7yw2sQ=;
 b=MevNihO4zgeo6N2OFC5exoZiiasrKbdzqwiSdA1h+PkkHAjK8zVUvUB8njVFkXT00k
 ilTswsqLouM447H9Evb48iIgQHgcYNJIUV82ZGJRgeu36Lw2O1IX2P7fv62VQDKLHd/q
 uYr1w1JNLqSXRokKQvLZINlBUfYzsap6Kr5qY/u6d9b3UC6k+YrxwE/eolE0ItVl9UBu
 W7IPOrLS20WZwjXJh1OUfe0gv20laUPBjodsZSARd6hCzcoDQi/UH4uz81SrpGSiBUNI
 w9jak7gBBU8sFlzXe1t7b2W+QfJUnvTj7R6cELyT/tcYrkwQ2d0Go9prdtrf5ksjbNRJ
 NhkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749599908; x=1750204708;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9cXko/sdujaNHPqqtbo6n7ThRGJuEz6vJP9Co7yw2sQ=;
 b=VllxrTpITeCxFeoiz99W+VOGRMTTkf7obUtq47Z+Qu9qRZKmS4lN+IMqh0RA/1mdpb
 cJu4qSWHvTQTnlzyZTJiYKSq+awCMNwmZDHnhZKQZ5t3Ia3QN4jAC0OXZcN5vbpa6AhK
 UQsgWkiLIP5ZX46ra7pO/OptyyoEACs0K8/ZwqyVVXxHQCnchSv/4koTMikGa7XacyR4
 7PN500ajXmB0WT3+0QLd7QNQxppBT5E5zAr59ANP6tn2ac1aaTqmJ+2PUFGVhzZTRmUa
 RKkOSICFWhTcLg0gEquxJLD5EgR5iO/+1JHdL4yj/lxGdBHXWZ6VGfOF2axYzzIdlWDv
 yAsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKGBnprz4RJ8AIqpIjnQfrv1p1kV9diof+6SWwazZvmJA4nBWbTf2faC2kLSlRjR2y+jbfMVTTl6k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxbhhk/kMptiuxAuSlVAc+ChrEuos+70IVbxq0OCxENBgn5FMd1
 BatM2/wZ5TWycOAmLs8GCEw8mkxGSNvAi5gLQ8rsRnDRKjHQAidoO5cC
X-Gm-Gg: ASbGncvPsJykRPJHpllxDNYYRTlCuQe8cIEtCRNp7usxCqqZtrhj/0WcVln5OLbotO7
 JhDDKY8N7Rd9wCUXLyNd17p9pmNHeQTUz3KW1/ZFz6yx+wM/ir9AUv1M4ziugmf4kyCouUDa/QD
 47P9/cHQkGIlHI3vWTSAl3hN2kPZSKuF0+4GFpMcsV+uZqacI7OoS1YITnlZ70rehGgdLp7bv1P
 EONSZUNUfDhnY5Nm5ZCG5JeFxJi+xdzOXnwC7+c8+1uLd/6YTT1aIcTL+jS7hJr+OXUQmkPS1PB
 bKER/5dxIRTw8BitXGikJPrAfY5bZ2FjCrd1rprBpfPFlzt9IC4oNzFHV/zuP48y3RphCqiQoxE
 /M/RgyezYSODmOGjHR1Ya
X-Google-Smtp-Source: AGHT+IGYM5Kl6WKqhIqALVLprCyTEopQXxMxhhdVBrARzMbQ5DfzetECYmMWcG2U9HrikhyHctmf/w==
X-Received: by 2002:a05:6a00:a95:b0:740:afda:a742 with SMTP id
 d2e1a72fcca58-7486ca6d606mr1734842b3a.0.1749599908382; 
 Tue, 10 Jun 2025 16:58:28 -0700 (PDT)
Received: from localhost (21.203.125.34.bc.googleusercontent.com.
 [34.125.203.21]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-7482af38569sm7939263b3a.5.2025.06.10.16.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 16:58:28 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: it6505: select REGMAP_I2C
Date: Tue, 10 Jun 2025 16:58:25 -0700
Message-ID: <20250610235825.3113075-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix

  aarch64-linux-gnu-ld: drivers/gpu/drm/bridge/ite-it6505.o: in function `it6505_i2c_probe':
  ite-it6505.c:(.text+0x754): undefined reference to `__devm_regmap_init_i2c'

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/bridge/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index b9e0ca85226a6..a6d6e62071a0e 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -122,6 +122,7 @@ config DRM_ITE_IT6505
 	select EXTCON
 	select CRYPTO
 	select CRYPTO_HASH
+	select REGMAP_I2C
 	help
 	  ITE IT6505 DisplayPort bridge chip driver.
 
-- 
2.50.0.rc0.642.g800a2b2222-goog

