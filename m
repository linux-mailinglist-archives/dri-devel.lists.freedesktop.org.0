Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E440D896D6C
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 12:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A511129E8;
	Wed,  3 Apr 2024 10:56:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZWvey2PS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C924D1129E8
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 10:56:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0635061381;
 Wed,  3 Apr 2024 10:56:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D0CBC433F1;
 Wed,  3 Apr 2024 10:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712141804;
 bh=hRxoDD7imaiqAmKZbABuwgl5WPO11LSbd7ASYZ2xG8A=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ZWvey2PS5ardF8Uf6eJfXZSAUKEvMRHlEd63RgpHRSe9y/HTcUp8jOh5lFzG7yJ6g
 3aJ/Uu8CTn5ku83kDi0TRujQV4J/QNaH93g7xLdO/mHIKhJMD5K+C+cgfIlQM9EK8L
 G5cLLLINCIKNJ2x17X4++/UcXB6aXZwcZ82+c4JjJIjxupEQ7O2frpttqe0wC3wVWu
 22E06IyYxe30ej+7WamD7X4v0z1bmAwGw8MnYDodtRPVMdI1JJEGD+hm+bVq1d4Rex
 FQCdUWKkMnh27D8DgQYfCF3CyG2KdztOgFVpsDzxQAcuykOLW2ZAAeHj5vXJmF1L2y
 7eeaZIeTLMwSw==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 03 Apr 2024 12:56:22 +0200
Subject: [PATCH 4/7] ARM: configs: multi_v7: Enable DRM_DW_HDMI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-fix-dw-hdmi-kconfig-v1-4-afbc4a835c38@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1162; i=mripard@kernel.org;
 h=from:subject:message-id; bh=hRxoDD7imaiqAmKZbABuwgl5WPO11LSbd7ASYZ2xG8A=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGm8plc/n5sqKlU0//Mhv5vebyzu6O1iZNLfyflv89SrP
 9rycr44d0xlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJnGJlrK/cqMFmtGflLu0b
 j/6cMru2584PQYuV62S/XAhQ1zl4lcnIPG/hTRtPNVV1pYk20T83LmKsT4h/fDi2/PELhzLBOtu
 7ZvEzyvXmMr5ivMyT+TLVYRtzgs4MFs76/s0um14VbZ+YnvELAA==
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
module") turned the DRM_DW_HDMI dependency of DRM_IMX_HDMI,
and ROCKCHIP_DW_HDMI into a depends on which ended up disabling the
drivers in the defconfig. Make sure it's still enabled.

Fixes: 4fc8cb47fcfd ("drm/display: Move HDMI helpers into display-helper module")
Reported-by: Mark Brown <broonie@kernel.org>
Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 86bf057ac366..9aac9610dd86 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -756,10 +756,11 @@ CONFIG_DRM_TOSHIBA_TC358764=m
 CONFIG_DRM_TOSHIBA_TC358768=m
 CONFIG_DRM_TI_TFP410=m
 CONFIG_DRM_TI_TPD12S015=m
 CONFIG_DRM_I2C_ADV7511=m
 CONFIG_DRM_I2C_ADV7511_AUDIO=y
+CONFIG_DRM_DW_HDMI=m
 CONFIG_DRM_STI=m
 CONFIG_DRM_IMX=m
 CONFIG_DRM_IMX_PARALLEL_DISPLAY=m
 CONFIG_DRM_IMX_TVE=m
 CONFIG_DRM_IMX_LDB=m

-- 
2.44.0

