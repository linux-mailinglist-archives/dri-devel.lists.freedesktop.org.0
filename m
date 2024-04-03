Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A35F4896D71
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 12:57:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6CC71129E4;
	Wed,  3 Apr 2024 10:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="A4xftENI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE7AB1129E4
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 10:56:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C2F72CE22FE;
 Wed,  3 Apr 2024 10:56:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDCA7C43394;
 Wed,  3 Apr 2024 10:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712141815;
 bh=SGsUNMWowNJVbrfZv6AOe09LHkFqvTweIgTUuBYCsJE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=A4xftENIOoscnAgfTZoApvO8L2PFXxc8nSOoDeDb5sxsz5zwhH/YrbLh1YAClg3D6
 HgNWTrQcY29V+MQvNlDotXunlXHrAt/H3ZTZolnURy7AWqbiPWBCzTlJNFwPkSeVUq
 7SzffOcmwUT31ZtWdg4GGfQtT2lT/uLHIcdD7BaPPZC4dpNXDt7fDXE4u7RsvS87U+
 ieWeDe4SDfn6/3PQXfdCWkNRxUkO4UwULfPvQBH7NYMPD8q/tUt6fwLvL22mld+mdN
 3IbhhxHp7Kxn4DU6cXi3qNS2CvnAkgmwZDXuRVf7CV4pTMX3kWyppvPi+gvVR0bNZ0
 HRv5TfCRIbzkQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 03 Apr 2024 12:56:25 +0200
Subject: [PATCH 7/7] mips: configs: ci20: Enable DRM_DW_HDMI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-fix-dw-hdmi-kconfig-v1-7-afbc4a835c38@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1108; i=mripard@kernel.org;
 h=from:subject:message-id; bh=SGsUNMWowNJVbrfZv6AOe09LHkFqvTweIgTUuBYCsJE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGm8ptePGe5esHmVmdK2uDnPvWsKRR09o/JWP50e0+ESY
 r9W6Pm/jqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRvMWMDft8lfbn5+hf3v7k
 2TbXX7O/yXvdSjxaMHXe0h+hStuXPFsy//K9GyJfT7zYZXHfztjN5iBjfe6R40Yelxy/5k2dxfT
 8qc4cr+mXXojfOb37huvGKK43UwMD9dS/SzMaxG9fwfz9RSPvUgA=
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
module") turned the DRM_DW_HDMI dependency of DRM_INGENIC_DW_HDMI into a
depends on which ended up disabling the drivers in the defconfig. Make
sure it's still enabled.

Fixes: 4fc8cb47fcfd ("drm/display: Move HDMI helpers into display-helper module")
Reported-by: Mark Brown <broonie@kernel.org>
Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 arch/mips/configs/ci20_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index cdf2a782dee1..0b1c17a650e4 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -120,10 +120,11 @@ CONFIG_RC_DEVICES=y
 CONFIG_IR_GPIO_CIR=m
 CONFIG_IR_GPIO_TX=m
 CONFIG_MEDIA_SUPPORT=m
 CONFIG_DRM=m
 CONFIG_DRM_DISPLAY_CONNECTOR=m
+CONFIG_DRM_DW_HDMI=m
 CONFIG_DRM_INGENIC=m
 CONFIG_DRM_INGENIC_DW_HDMI=m
 CONFIG_FB=y
 # CONFIG_VGA_CONSOLE is not set
 CONFIG_FRAMEBUFFER_CONSOLE=y

-- 
2.44.0

