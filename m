Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B45C9F1EE9
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2024 14:37:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF4510E4B0;
	Sat, 14 Dec 2024 13:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Kuwa0HXQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 465CB10E4BA
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Dec 2024 13:37:23 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-30229d5b21cso23048031fa.1
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Dec 2024 05:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734183441; x=1734788241; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kfAoBNlarjV9Kr0yPdaLHtIo2MYFINu9J4XNO2CCrRg=;
 b=Kuwa0HXQyqfiXGhCaGhO9sIryw6AAR4vym/3UDiS3ugF+K7ibvYojyzBjdyytBQuPW
 5KfZpdY6LbmQut3yVRv/zQULFamO7YiVAH1RhRp4pzOZp6gOmr0E1GjicGGx9voMrw6p
 AxOcxmIoIYBCeKNK5mqFZ4+gkRnIu27KmRzs1MfMx1rHMvt/nLFugeqCrDWLwMrr5Ohv
 oYMAQyVlscl48VpqXmi0HG8jLzQFPlQIIRoo+zsD9iTLSCL5qIzxismmOYbIKD61SXsA
 mC7toEoKKLffrUCw10LJH0QujU6zUQZusXEE51pTpH+Gqk9zBxzhE2CJpvm2+56q457L
 CtEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734183441; x=1734788241;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kfAoBNlarjV9Kr0yPdaLHtIo2MYFINu9J4XNO2CCrRg=;
 b=GlQM7jdJRs9WJx8EAdvDaYf2+ahVLDvaNv9kx0nNaHA7ls6B9iD7O2xgibAfVpTKSu
 zADuzN1ch/vlwJ741gvbeYHFGE8R3EPbTmAL5BBnDlamvqdBEHEBWJJCActpbGyHw6K5
 NnhpcXt+69uzmh9ttyA/yDrRT72FiARhPH1U3WqhZVdXE0nrTc8/nm54W9lsP2DCZCSa
 UChbJupp15VkUQlE7DL1F5pbI+VOzyQFbQTErLfjq39VfhCb+ytFbHzo9CE59ir4s2Io
 U4nzInisDP+//R6Sn5eELbgd/lt/mm4EEbCSYfmvOX/qprOUbYZuJaFDCapJPf24FJos
 B4Jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJtRmhl5bns45IPIP4JdYE/YNzKuItJeWl0V60sPJu5tMIcQrx/6lLqr/HX5Z4iyfg7bx4JqR0ET8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNU63bgeoyNMkJTm7Wj+RcmlmXSbJPkt8dE89PzJzTxlAf8Y72
 uV8jXHoy/z+5XclmmJJ157jM4ZQusLa47Ql0yKUJN08JstOlfK2MnIMOl/97kpg=
X-Gm-Gg: ASbGncuZ+3qx9cn6mXgNGFWN8PQg9Oj2VYAjwxfKyATvDSrXiofHZ+miiS69AdZLin3
 bUKtOq6XAJAiPV2VP/NuMAK3dz8gtEknVH5FZFDJuC3JMWaHFS4kqkix3SNeDLgsXPBAqFMB6KB
 MT1i7JV8y2Dvr7gMdK+Nz4R6bpqv6xOHoLThfNJwGLyTVQ+jsf8x7VDvanstJkJoqhxcNdMRuEk
 fAQbUPxMhpu374Biz3tV7ZBKlNajFR3PWyno9xECcQ6HSaCf4c+CRKQUTmQyLFk
X-Google-Smtp-Source: AGHT+IFSZO4bNy8AjxBG8Wtyvs2G2G0moKCebZ7Bi6AnMIS81nyzk1n5ZS+J4Ko1Sbkn2pNNU644nw==
X-Received: by 2002:a05:651c:1541:b0:2ff:d2e4:8dd9 with SMTP id
 38308e7fff4ca-302544b11d6mr24876241fa.32.1734183441395; 
 Sat, 14 Dec 2024 05:37:21 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120baa474sm220131e87.90.2024.12.14.05.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Dec 2024 05:37:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 15:37:08 +0200
Subject: [PATCH v2 4/5] drm/connector: make mode_valid_ctx take a const
 struct drm_display_mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-drm-connector-mode-valid-const-v2-4-4f9498a4c822@linaro.org>
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
 Jani Nikula <jani.nikula@intel.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1823;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=fIH1atGQEvkLWi04AIEXYETQz0o/iNjqyQIeIWP3jdk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXYoElMfelOPEJNjs+G1Yj9xgEcdTdcLAHLPa0
 1XczK3Ryz2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ12KBAAKCRCLPIo+Aiko
 1TNjCACQzndFYYYqNzhLedAqKs7VfOsz2ZEbJAu4qQr0caK2HF+hvtR+VUIlYwQ0jcqqWXJmXLM
 +4HlPR43bEtxaoe4QpWwccR/sQYlEGLTcuF7/jlXw42WpNdOY6WhxbDnr23gMEQXuLD2NuXBTyB
 XubcAVl2e73ZHfh1LpZ35luOaheCBIz8zL33f8d5nxxFyCEqHaY5q6zARwkPBAoe852c0K3chfm
 oDoop8CfLRyNhvoGEF/YGoigASSuk7/jucbCfOlAXSz1JpttbSHzvLiZtgMdHVwI2RHxPySD27A
 yiEIP9OceoguE2oL2gaLonv3bIozOrfBbnj0xVgmnNavKUi8
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

The mode_valid() callbacks of drm_encoder, drm_crtc and drm_bridge
take a const struct drm_display_mode argument. Change the mode_valid_ctx
callback of drm_connector to also take a const argument.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 2 +-
 include/drm/drm_modeset_helper_vtables.h    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 123c4ece626883bd2fde997d5752611bb82018ac..87e3e178df6e642da89e81ec92328735e477230a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1445,7 +1445,7 @@ static int mst_connector_get_modes(struct drm_connector *connector)
 
 static int
 mst_connector_mode_valid_ctx(struct drm_connector *connector,
-			     struct drm_display_mode *mode,
+			     const struct drm_display_mode *mode,
 			     struct drm_modeset_acquire_ctx *ctx,
 			     enum drm_mode_status *status)
 {
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index ec59015aec3cf3ba01510031c55df8c0b3e0b382..fa9ee6a128bec0205f501df6f7634757f5fcb9ee 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -1006,7 +1006,7 @@ struct drm_connector_helper_funcs {
 	 *
 	 */
 	int (*mode_valid_ctx)(struct drm_connector *connector,
-			      struct drm_display_mode *mode,
+			      const struct drm_display_mode *mode,
 			      struct drm_modeset_acquire_ctx *ctx,
 			      enum drm_mode_status *status);
 

-- 
2.39.5

