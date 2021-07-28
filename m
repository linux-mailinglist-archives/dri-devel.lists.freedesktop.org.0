Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EC43D9236
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 17:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48AB06E9A8;
	Wed, 28 Jul 2021 15:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 285476E16F
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 15:37:52 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 019916EE;
 Wed, 28 Jul 2021 17:37:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1627486670;
 bh=OmvNtp66srLQ+NcTX76l0rVt3aHK+j/AM4pQKPBXyKo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Dw57NOaCBW/OJRl0MF4yWoEvgfoLUU1G1bX9sKKMKPNB/APnUpvBHoYF+k5c/3Eu+
 E5lpxW30W/T+J0MyPoVdVQd1aP+Im6nE6MJ/DLwFyyIH6R8XOc+nn0fV/bfyicYz8Q
 +XRseqy/1xx0SkKye8Yt4mXEtLU+vynPDQKcHz50=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/7] drm/omap: Enable COMPILE_TEST on all ARM and ARM64
 platforms
Date: Wed, 28 Jul 2021 18:37:33 +0300
Message-Id: <20210728153736.15240-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728153736.15240-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210728153736.15240-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Tomi Valkeinen <tomba@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Jyri Sarha <jyri.sarha@iki.fi>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-renesas-soc@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-imx@nxp.com, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 linux-tegra@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To extend test coverage, relax the dependency on ARCH_OMAP2PLUS or
ARCH_MULTIPLATFORM to also enable compilation on ARM or ARM4 when
COMPILE_TEST is selected.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/Kconfig b/drivers/gpu/drm/omapdrm/Kconfig
index e7281da5bc6a..fd5ef00444c1 100644
--- a/drivers/gpu/drm/omapdrm/Kconfig
+++ b/drivers/gpu/drm/omapdrm/Kconfig
@@ -2,7 +2,7 @@
 config DRM_OMAP
 	tristate "OMAP DRM"
 	depends on DRM
-	depends on ARCH_OMAP2PLUS || ARCH_MULTIPLATFORM
+	depends on ARCH_OMAP2PLUS || ARCH_MULTIPLATFORM || ((ARM || ARM64) && COMPILE_TEST)
 	select OMAP2_DSS
 	select DRM_KMS_HELPER
 	select VIDEOMODE_HELPERS
-- 
Regards,

Laurent Pinchart

