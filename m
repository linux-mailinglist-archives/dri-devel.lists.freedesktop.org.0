Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B309D896D6B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 12:56:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3AAC1129E5;
	Wed,  3 Apr 2024 10:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SzzHbB+E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B9A1129E5
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 10:56:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7F46A6137C;
 Wed,  3 Apr 2024 10:56:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95F2DC433F1;
 Wed,  3 Apr 2024 10:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712141801;
 bh=9plj7YiU9auK+f7YjWOK8gl9mw2KJr5+ajBQVrjClN0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=SzzHbB+Elcy7Y9N22oiH7igCNRW5Q7aQHnuXxvy6mMhh4MXbEOIUa6lJmg51ONcev
 n/2oT2gKtVnDylM+wf+wdTcSzuRq6gp1cptAaNpMci32Bp+g3UcFpuyzqtv2WBg6gU
 lCcVmrdfPdaDozt3epPfOAwtuPUUGrYbpSjR2T4zYaf1AjtnQZYfzP5YMh4OVWMjP5
 n9hjznxyLgLo09XTR/AGt+WwUOeNARdccGoVjAYJkK9t7OV1s2wJm96c1wdCAJlIMC
 5v0sjKcpriuqgSxQ7/clA8WSKnRxjXcASfwQXK5r2S1Go+HgE8qmvf42/UgMiXwufI
 wVIC7/6JvDWaQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 03 Apr 2024 12:56:21 +0200
Subject: [PATCH 3/7] ARM: configs: imx_v6_v7: Enable DRM_DW_HDMI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-fix-dw-hdmi-kconfig-v1-3-afbc4a835c38@kernel.org>
References: <20240403-fix-dw-hdmi-kconfig-v1-0-afbc4a835c38@kernel.org>
In-Reply-To: <20240403-fix-dw-hdmi-kconfig-v1-0-afbc4a835c38@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Mark Brown <broonie@kernel.org>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-mips@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1143; i=mripard@kernel.org;
 h=from:subject:message-id; bh=9plj7YiU9auK+f7YjWOK8gl9mw2KJr5+ajBQVrjClN0=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGm8plffP9u6RKTZt6VqZ4VJcOGOt1MK7h2NujgrXOh5a
 n8zQydbx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZgI13zGKuZNRbE3JitqHWG8
 8TL9iQLbCZU1PKVXaz/KsVnqfg89xr7pc8/hgoIdSeuvHroS21Nhy1hn/fC12Wv2zsoz7K1vTsu
 9D3lp0v1t7u5tv51OxO3o8PV1TZ4UZ9C4s9Zx1SJNE8e+8AMA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

Commit 4fc8cb47fcfd ("drm/display: Move HDMI helpers into display-helper
module") turned the DRM_DW_HDMI dependency of DRM_IMX_HDMI into a
depends on which ended up disabling the driver in the defconfig. Make
sure it's still enabled.

Fixes: 4fc8cb47fcfd ("drm/display: Move HDMI helpers into display-helper module")
Reported-by: Mark Brown <broonie@kernel.org>
Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 7327fce87808..294c0c3df370 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -281,10 +281,11 @@ CONFIG_DRM_MSM=y
 CONFIG_DRM_PANEL_LVDS=y
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_PANEL_EDP=y
 CONFIG_DRM_PANEL_SEIKO_43WVF1G=y
 CONFIG_DRM_TI_TFP410=y
+CONFIG_DRM_DW_HDMI=y
 CONFIG_DRM_DW_HDMI_AHB_AUDIO=m
 CONFIG_DRM_DW_HDMI_CEC=y
 CONFIG_DRM_IMX=y
 CONFIG_DRM_IMX_PARALLEL_DISPLAY=y
 CONFIG_DRM_IMX_TVE=y

-- 
2.44.0

