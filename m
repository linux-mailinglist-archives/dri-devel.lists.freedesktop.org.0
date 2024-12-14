Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BA19F1EE4
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2024 14:37:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEDC610E4AE;
	Sat, 14 Dec 2024 13:37:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ohQYl1JO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5690410E4A4
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Dec 2024 13:37:20 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-53df19bf6a9so3762926e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Dec 2024 05:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734183439; x=1734788239; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6YJ4q6tadgk1hWcoorHO9q9AcqKR3C+KJI1u0hIFBaE=;
 b=ohQYl1JOCp8hqNuGFUHPvu78yG2LyFs1Yr9lIgNqqYv8dSjmM8Ill2Jreh2Tm3v+Gh
 LTZ9mLBCC79+E3XA7p6gurxzYXewq/Mh9KD64/nh6lNB25fPNE+dn4lFOG8+QZn5ise+
 VlRXKzr8JoizrenYtDug0NhGzphREfHVno6D4wQ19KvpyClnFzoGEEqxoIiFcr1eVDwv
 xVeR0N9XiERW7O3Pg4J0yl6GkaWE1iV7VQKAwa8SSkeebEonQTGwIozCgZtd2ql5s+OD
 WyEf1yL0fuLQX5Et7KAkbJwaMm5X3Rm9r5GBFZNb1eidIK3dPx/KvIN50DMkSDCH8Sx8
 gAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734183439; x=1734788239;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6YJ4q6tadgk1hWcoorHO9q9AcqKR3C+KJI1u0hIFBaE=;
 b=jpl6IqhoBIRFET2CPal9xiwnNleNqtOIc5yi8kaxmlQcYEVUhpe0evvdXrfaXy5rdD
 5OHt04nZ8m35RuoalWiFHCWHMIIHgsolmez3sdH/BjePznpgLSHmk5lbMnnor+k3zoiX
 k1NnmI4TUyFfABGn1Lsw8G3zPdRlBSZhZmBACDyIQ2CVtpVyoDzJakpgHG5+/nRW00bS
 h6+tR8Y5aKA++9NTVO6mmlL0Nf3rfzDjBdn/GUgcdudJ27YZuLPPuX9n4342C/MrSuqS
 uyAG34dGSZsP3vraKGw0mZM5To2EXoAQe1al4WOnnGxy4nHn+gsKOxBfgMD1x0YANm5q
 JJpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDs5ePfssldnz2aEgHQlSBRDwH39k2tVgFZqY+rgSnAouXJVe3lpDLpbTiNJLN/e8UqdXxpzJRXj8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywh732cci8ok2IM0aP+ccz2GE+HwGy+/TE1vSMWNLY22gAzV52A
 fQkOlGCRFm4xhWIbLZPNkCdlvdV+gnckuUx8vLRNjqZA1GRN5H36I2LHcIRoRPQ=
X-Gm-Gg: ASbGncvFniigsx3Li3QCIb69EVBEZMmzev4ayP+8xtbJSfUL1M9O9rlMqbSIFSmVoj3
 xNobKdBwfGeQ6p7HRU+jFGFHJJN0rn6E1Vhj+UroUb0jxabvySgsOTx1j+7YBmCaTATY5ISnfgq
 dMK9ObX0z6OV5ar+1WaM4eG2KCNQlZm72ntGGg4cOy0jpNpYBIcx0Wm1BL5Pq91QNwQ8cMZOeNA
 Dm3XMVlRvrn3SfT55LyG1BzXG1lE6NUxuL/P1VnnPF4wRgA6hr2hfWHai1kwxQ7
X-Google-Smtp-Source: AGHT+IFG9LRiCAbslkgJdWcTp68iI2gM9sr2Y/E6t/loWfDlKNLZ1XwCQ4KNA8IB5rjHj0E0zPcgUQ==
X-Received: by 2002:a05:6512:b27:b0:53e:1b34:fed2 with SMTP id
 2adb3069b0e04-54090268d4cmr1991538e87.8.1734183438535; 
 Sat, 14 Dec 2024 05:37:18 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120baa474sm220131e87.90.2024.12.14.05.37.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Dec 2024 05:37:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 15:37:07 +0200
Subject: [PATCH v2 3/5] drm/sti: hda: pass const struct drm_display_mode*
 to hda_get_mode_idx()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-drm-connector-mode-valid-const-v2-3-4f9498a4c822@linaro.org>
References: <20241214-drm-connector-mode-valid-const-v2-0-4f9498a4c822@linaro.org>
In-Reply-To: <20241214-drm-connector-mode-valid-const-v2-0-4f9498a4c822@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Peter Senna Tschudin <peter.senna@gmail.com>, Ian Ray <ian.ray@ge.com>, 
 Martyn Welch <martyn.welch@collabora.co.uk>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, 
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, virtualization@lists.linux.dev, 
 spice-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2281;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=E7JeGNI7sqGcWqcAailaiFOGnnaUQ0FrCYoy+ca8RpM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXYoE85Irlub5li3EqAJENRTB+KxenTAd7iEfb
 h6El8rjAnuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ12KBAAKCRCLPIo+Aiko
 1YUwB/48isvULWH0ldXb5Wl+P18s81zhuaBxagjYhXRzhD89tkMOOIDFKQ5NnpCsrx5cVD0yKjv
 kMohag3LXNjhoSb6V1QEjYKbs8lQb0k42nsTdNs7eAuj6nHqn4wLZtHrpJiY5LKtehsRL1dRH8O
 iK/UZnrOwyGKvuf1mJVxIEU5MCDqbZdSzcv6yfe/JQzyxz9wOMxr7r+/JMucbAHlMS9KNgFDAiB
 zaFXJ8heSm1wtZf1Lk7kysjtHakzIjmO2In9a50drym8tv9jTHOWts9OrYlWCTUVDWQtfxI2NO4
 XH8jKKBoyNjNCIHW2L3fgP2rD2Ch5f0VTLJDze5kmlwAxr8U
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Make hda_get_mode_idx() take a const struct drm_display_mode pointer
instead of just raw struct drm_display_mode. This is a preparation to
converting the mode_valid() callback of drm_connector to take a const
struct drm_display_mode argument.

Acked-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/sti/sti_hda.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_hda.c b/drivers/gpu/drm/sti/sti_hda.c
index b12863bea95559c4f874eb94cea8938609d435d4..57aa260d1e4620a85d10e80a84111be885bd0842 100644
--- a/drivers/gpu/drm/sti/sti_hda.c
+++ b/drivers/gpu/drm/sti/sti_hda.c
@@ -280,12 +280,12 @@ static void hda_write(struct sti_hda *hda, u32 val, int offset)
  *
  * Return true if mode is found
  */
-static bool hda_get_mode_idx(struct drm_display_mode mode, int *idx)
+static bool hda_get_mode_idx(const struct drm_display_mode *mode, int *idx)
 {
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(hda_supported_modes); i++)
-		if (drm_mode_equal(&hda_supported_modes[i].mode, &mode)) {
+		if (drm_mode_equal(&hda_supported_modes[i].mode, mode)) {
 			*idx = i;
 			return true;
 		}
@@ -443,7 +443,7 @@ static void sti_hda_pre_enable(struct drm_bridge *bridge)
 	if (clk_prepare_enable(hda->clk_hddac))
 		DRM_ERROR("Failed to prepare/enable hda_hddac clk\n");
 
-	if (!hda_get_mode_idx(hda->mode, &mode_idx)) {
+	if (!hda_get_mode_idx(&hda->mode, &mode_idx)) {
 		DRM_ERROR("Undefined mode\n");
 		return;
 	}
@@ -526,7 +526,7 @@ static void sti_hda_set_mode(struct drm_bridge *bridge,
 
 	drm_mode_copy(&hda->mode, mode);
 
-	if (!hda_get_mode_idx(hda->mode, &mode_idx)) {
+	if (!hda_get_mode_idx(&hda->mode, &mode_idx)) {
 		DRM_ERROR("Undefined mode\n");
 		return;
 	}
@@ -614,7 +614,7 @@ sti_hda_connector_mode_valid(struct drm_connector *connector,
 		= to_sti_hda_connector(connector);
 	struct sti_hda *hda = hda_connector->hda;
 
-	if (!hda_get_mode_idx(*mode, &idx)) {
+	if (!hda_get_mode_idx(mode, &idx)) {
 		return MODE_BAD;
 	} else {
 		result = clk_round_rate(hda->clk_pix, target);

-- 
2.39.5

