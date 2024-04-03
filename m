Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 150FC896D6E
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 12:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9461129EA;
	Wed,  3 Apr 2024 10:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="i6ypBYwb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B7F1129EA
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 10:56:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C7450CE2303;
 Wed,  3 Apr 2024 10:56:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BADA7C433F1;
 Wed,  3 Apr 2024 10:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712141811;
 bh=3mo61FFJAiMGTqfs0FY55xf1PPs2Mh8I95J46M8Htgg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=i6ypBYwbcpKnT87n7vrxGHvkY93+z1IoYb6Mq8ACXtOYTxUfBfwsFiHBR2nCFvJz6
 ZNFwgTBpU1pUWv3la0hWnQSLImiL5hxG7op0HmI1zbpUXhPWqJf8mbblnCDBikBgLY
 VWPGYHAC1TvbUCTcR44KsRvD8y0aI87mtZVsdyBGbiIRFtJtovIw8Z/atCB5NFgcBe
 8eNWk9X8saUnQIQ845mFR2lv4Es9g5RpM2zQK/xRVhBlfxDGWFZgX09BXlM1cFbLjh
 dmUZV7mgTnKCqjmfhsvRHvGws55G934q6NVC+oM1nKMrrj8ZYqhwuQYyMncRCuoenY
 DjtkJUvHWwxpQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 03 Apr 2024 12:56:24 +0200
Subject: [PATCH 6/7] arm64: defconfig: Enable DRM_DW_HDMI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-fix-dw-hdmi-kconfig-v1-6-afbc4a835c38@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1169; i=mripard@kernel.org;
 h=from:subject:message-id; bh=3mo61FFJAiMGTqfs0FY55xf1PPs2Mh8I95J46M8Htgg=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGm8ptcm9HDybe1bfuD1gceyIXVvYtdYfGBUNjzNLOR1s
 C069u6bjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCR3bmMDfNnOvSn7d3O8bRd
 5lldR+a0C56Pzzh1pC5KNVgapKPpIaRhm30g+V50csOehaazMr5tYqwv91V7Yfewb0OlircQ36y
 9t875387rSZRVs9+ZfP5U43fZ1xX2u5ZnxJa4+kabrJRvygUA
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
module") turned the DRM_DW_HDMI dependency of ROCKCHIP_DW_HDMI,
DRM_RCAR_DW_HDMI and DRM_IMX8MP_DW_HDMI_BRIDGE into a depends on which
ended up disabling the drivers in the defconfig. Make sure it's still
enabled.

Fixes: 4fc8cb47fcfd ("drm/display: Move HDMI helpers into display-helper module")
Reported-by: Mark Brown <broonie@kernel.org>
Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 94e677800899..6c223541e4f0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -894,10 +894,11 @@ CONFIG_DRM_TI_SN65DSI86=m
 CONFIG_DRM_ANALOGIX_ANX7625=m
 CONFIG_DRM_I2C_ADV7511=m
 CONFIG_DRM_I2C_ADV7511_AUDIO=y
 CONFIG_DRM_CDNS_MHDP8546=m
 CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE=m
+CONFIG_DRM_DW_HDMI=m
 CONFIG_DRM_DW_HDMI_AHB_AUDIO=m
 CONFIG_DRM_DW_HDMI_CEC=m
 CONFIG_DRM_IMX_DCSS=m
 CONFIG_DRM_V3D=m
 CONFIG_DRM_VC4=m

-- 
2.44.0

