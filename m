Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3165F82907E
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 00:07:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4FFF10E53C;
	Tue,  9 Jan 2024 23:07:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9BB610E53C
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 23:07:11 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40d4f5d902dso37459525e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 15:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704841630; x=1705446430; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SB32//xbcW4q0bnp0pdqAtTjcsxtx9ia49ME4uFhsuI=;
 b=GUHXJP09wf8WUTEvBidzBz+UQG1r39bt8LRE5QqR84pY47Ig/Lu+vK1R+9fGjCqBYR
 GKwIkuYRzHBcEFMDS/qMqRsrbXf2m1AD9TW+iro3iuADgOQnICNgFh9XCI1GpaD71LxV
 uJmgWbWlnSIuRfdz0tM02Earxpj/S1AzL5osqDzUxjo+6tIMScqOMuC/3EwYSDmwRCUs
 7TP0tZvEsIVJJ8I6urt4PX8kid7M/BiWvepNysxW4PMKydJxI9+51uJOO2nHd+N6lK3s
 ez5BYP91EMQarAFY4PETOX2Y+tzQgdL6EYkuT7eF/FkDZfwex1WRZuQ9NYShMjgBiLT4
 LE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704841630; x=1705446430;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SB32//xbcW4q0bnp0pdqAtTjcsxtx9ia49ME4uFhsuI=;
 b=BbvdfrAtMG5xuh0nivdDc4iMlZHcndoqFjN1nNKM8YDSnF+DbQyyRxrjGNjPg0bgkd
 vbqhSZhOlpqQ2njjeVipFP8oTPnlODNduV3793FaimOJ5hooGO7nfnensE2pVbnHl95L
 pK8Br8PBMSlG44vqmyoeiWAZUVZyOygoOu8F9g/CZnYAN6wD555EW4PzDMevi4Mvh1Sk
 O06x3afNnbPINWhGbpMzUE80vsUHia04079aHHRgT4APRfXhQQl4WAKpyTjDikHF0/+L
 AO77nju7tFi1pcOd+Vd7qhy4ezLigfGBRSIA6Rq4gGRZWoUIWTp6cbk5kL+pRWwivM+O
 Mx2A==
X-Gm-Message-State: AOJu0Yxd0n9Mv38QUvoBAZGtP3VPtpwkZ58pUXW6pR/F/e2W+6MiSKjc
 rsnF3kCioQZz/pCc+IpA4dI=
X-Google-Smtp-Source: AGHT+IE2PVEJT8mDhWzJ6iSvWvAbhYiuY5i/hdgn30vebpKJwshevCMFqAjmPMAfHgMekvj9Muzm+A==
X-Received: by 2002:a05:600c:3c8b:b0:40e:53f4:f979 with SMTP id
 bg11-20020a05600c3c8b00b0040e53f4f979mr22910wmb.164.1704841629893; 
 Tue, 09 Jan 2024 15:07:09 -0800 (PST)
Received: from toolbox.. ([87.200.95.144]) by smtp.gmail.com with ESMTPSA id
 z10-20020a05600c0a0a00b0040e486bc0dfsm54021wmp.27.2024.01.09.15.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 15:07:09 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/meson: vclk: fix calculation of 59.94 fractional rates
Date: Tue,  9 Jan 2024 23:07:04 +0000
Message-Id: <20240109230704.4120561-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Playing 4K media with 59.94 fractional rate (typically VP9) causes the screen to lose
sync with the following error reported in the system log:

[   89.610280] Fatal Error, invalid HDMI vclk freq 593406

Modetest shows the following:

3840x2160 59.94 3840 4016 4104 4400 2160 2168 2178 2250 593407 flags: xxxx, xxxx,
drm calculated value -------------------------------------^

Change the fractional rate calculation to stop DIV_ROUND_CLOSEST rounding down which
results in vclk freq failing to match correctly.

Fixes: e5fab2ec9ca4 ("drm/meson: vclk: add support for YUV420 setup")
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
I'm unable to give a better mathematical description of the fix as I can barely read
code. The change was inspired by [0] which I chanced upon while looking at how other
dw-hdmi drivers handle fractional rates.

[0] https://github.com/torvalds/linux/commit/4f510aa10468954b1da4e94689c38ac6ea8d3627

 drivers/gpu/drm/meson/meson_vclk.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
index 2a82119eb58e..2a942dc6a6dc 100644
--- a/drivers/gpu/drm/meson/meson_vclk.c
+++ b/drivers/gpu/drm/meson/meson_vclk.c
@@ -790,13 +790,13 @@ meson_vclk_vic_supported_freq(struct meson_drm *priv, unsigned int phy_freq,
 				 FREQ_1000_1001(params[i].pixel_freq));
 		DRM_DEBUG_DRIVER("i = %d phy_freq = %d alt = %d\n",
 				 i, params[i].phy_freq,
-				 FREQ_1000_1001(params[i].phy_freq/10)*10);
+				 FREQ_1000_1001(params[i].phy_freq/1000)*1000);
 		/* Match strict frequency */
 		if (phy_freq == params[i].phy_freq &&
 		    vclk_freq == params[i].vclk_freq)
 			return MODE_OK;
 		/* Match 1000/1001 variant */
-		if (phy_freq == (FREQ_1000_1001(params[i].phy_freq/10)*10) &&
+		if (phy_freq == (FREQ_1000_1001(params[i].phy_freq/1000)*1000) &&
 		    vclk_freq == FREQ_1000_1001(params[i].vclk_freq))
 			return MODE_OK;
 	}
@@ -1070,7 +1070,7 @@ void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
 
 	for (freq = 0 ; params[freq].pixel_freq ; ++freq) {
 		if ((phy_freq == params[freq].phy_freq ||
-		     phy_freq == FREQ_1000_1001(params[freq].phy_freq/10)*10) &&
+		     phy_freq == FREQ_1000_1001(params[freq].phy_freq/1000)*1000) &&
 		    (vclk_freq == params[freq].vclk_freq ||
 		     vclk_freq == FREQ_1000_1001(params[freq].vclk_freq))) {
 			if (vclk_freq != params[freq].vclk_freq)
-- 
2.34.1

