Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBC794126D
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 14:50:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28E5310E239;
	Tue, 30 Jul 2024 12:50:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="2UQiYWoS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E876210E22B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 12:50:37 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4280bca3960so27056315e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 05:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722343836; x=1722948636;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KCAbjMiMPWRMzpCKATzPFm7RQ4gOtOLIXraRazPtH00=;
 b=2UQiYWoSgtZrZN/1rTxGYhnkvFtAbRx6EE1FnPY0dqaJnV1Z9vvdWivjtGkXFxK9qk
 wWQf6iUnVjTxPjDGJNb6t0k5hJ1oess21F6HNmZxB6vg0s3ylO3dtqA2FKKB7Pt9IbSJ
 pYkbzwNRwu8hBihyz8UjTTr2b1sX5RcrorMTzlPF9EkHrZBd2fOhnw7VZVUU42f3xe/1
 fBGmEWv8Z5bZamZG1X3uBeG0V0aI5Fe8rbCzFmHP6mj5LtJ6gK/f279I5o1yD1uUkGhs
 BqTK0avcJ1zv6KFzTb2JWlD7MB+Ch+ftrWPG2t5/uKM9KCGF6JWwQmR+R4TGLpj5J21K
 Wyrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722343836; x=1722948636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KCAbjMiMPWRMzpCKATzPFm7RQ4gOtOLIXraRazPtH00=;
 b=Kj7LV7D8Ady9+it7E+cOOpBf3vbnMXGGSrbrCnEPtUFdyLXTTSsPqqzKIQYshaXqtq
 bbo+qryrEj/wwyu7mKY+WoSXNvbIQVWHB2WtQjpp2MW2JtXuP0m5hY5eqW/QSntTZzUp
 5IYsTqJeIyZjvTlpyHSua9U9wP1sfFvk7hNShNWBlqf0sbKgeI9TwaxTDOkIZkx92wEw
 0LYBTbtQ570HHhhpKW6PBSiR4bne4HehJffcS+w28pTTkIjolm0oAk7f3/rYji0Waqzo
 2Mtg+nOZfCAxiug559pC7C+YXhOc7YlSAXglvRHdU/9WPkYvbwsBTW07xpRqPvR5zD7P
 1DUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSGPgpeVtJv/3qH0xtOgdypp2xgffciPqhQATRQSXN/cntPyYsH87GptVTsQFHNIgSwRRxrwfzD+KUCQcAlUtSRMSLhIkQRIEzotm3cuUz
X-Gm-Message-State: AOJu0YypKY4j3h38svFRAbKkJbl+zS+tFHX/RHNaChsu/+AyrejKL8Jn
 DltOSX2nqNMqG3DyEhicoraoG47E3GzENeI3x9IneM7rjoKDnGMSL63R+1Dxonw=
X-Google-Smtp-Source: AGHT+IFrBziZT/58Vb7K/FmVwcAvFVRM7tFnePkyMs/HqsXtRR+PlZ++CrVSk74QOczD1bWAn9/67Q==
X-Received: by 2002:a05:6000:11c7:b0:367:8a9e:6bed with SMTP id
 ffacd0b85a97d-36b5d0baf47mr7921610f8f.61.1722343836141; 
 Tue, 30 Jul 2024 05:50:36 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:291e:4a48:358e:6f49])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42805730e68sm216521405e9.9.2024.07.30.05.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 05:50:35 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/9] drm/meson: vclk: drop hdmi system clock setup
Date: Tue, 30 Jul 2024 14:50:12 +0200
Message-ID: <20240730125023.710237-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730125023.710237-1-jbrunet@baylibre.com>
References: <20240730125023.710237-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
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

Poking the HHI syscon is a way to setup clocks behind CCF's back.
Also, 2 drm code paths, the encoder and the hdmi-phy, are racing to do the
same setup of the HDMI system clock.

This clock is used is used by the HDMI phy and should not be set by the
encoder, so drop those HHI pokes from vclk.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/gpu/drm/meson/meson_vclk.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
index 2a942dc6a6dc..bf5cc5d92346 100644
--- a/drivers/gpu/drm/meson/meson_vclk.c
+++ b/drivers/gpu/drm/meson/meson_vclk.c
@@ -813,14 +813,6 @@ static void meson_vclk_set(struct meson_drm *priv, unsigned int pll_base_freq,
 {
 	unsigned int m = 0, frac = 0;
 
-	/* Set HDMI-TX sys clock */
-	regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL,
-			   CTS_HDMI_SYS_SEL_MASK, 0);
-	regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL,
-			   CTS_HDMI_SYS_DIV_MASK, 0);
-	regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL,
-			   CTS_HDMI_SYS_EN, CTS_HDMI_SYS_EN);
-
 	/* Set HDMI PLL rate */
 	if (!od1 && !od2 && !od3) {
 		meson_hdmi_pll_generic_set(priv, pll_base_freq);
-- 
2.43.0

