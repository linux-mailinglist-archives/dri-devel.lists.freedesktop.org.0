Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE243DC26E
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jul 2021 03:40:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B69436F4E7;
	Sat, 31 Jul 2021 01:40:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135766E517
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jul 2021 01:40:14 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 00076101E;
 Sat, 31 Jul 2021 03:40:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1627695612;
 bh=KIyx+uCB1qljlR/SNtBb+Q8rmQEAc28AsrRRYXDOInY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FHYVVR90u1cmwg5d1rWVJU6a3dKn3ldp8NugbaxfNMUQZ0aUglxTNndwItygLfNiN
 mwbukPuZ6Y5iRZd1dRodpMctAnbxjjgnu8FVhJS3CjN2GGOERVwQEimDdfz3mm03wC
 dGhqTQxvNnpbXxYmr3Guo9jz0PBtBmAOHibtHA9o=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Tomi Valkeinen <tomba@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Jyri Sarha <jyri.sarha@iki.fi>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-renesas-soc@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-imx@nxp.com,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-tegra@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>,
 Alain VOLMAT-SCND-01 <alain.volmat@foss.st.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2 4/9] drm/imx/dcss: Enable COMPILE_TEST on all architectures
Date: Sat, 31 Jul 2021 04:39:49 +0300
Message-Id: <20210731013954.11926-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210731013954.11926-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210731013954.11926-1-laurent.pinchart+renesas@ideasonboard.com>
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

To extend test coverage, relax the dependency on ARCH_MXC and ARM64 to
also enable compilation when COMPILE_TEST is selected.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Enable COMPILE_TEST on all architectures
---
 drivers/gpu/drm/imx/dcss/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/dcss/Kconfig b/drivers/gpu/drm/imx/dcss/Kconfig
index 2b17a964ff05..451ed05321cc 100644
--- a/drivers/gpu/drm/imx/dcss/Kconfig
+++ b/drivers/gpu/drm/imx/dcss/Kconfig
@@ -3,7 +3,8 @@ config DRM_IMX_DCSS
 	select IMX_IRQSTEER
 	select DRM_KMS_CMA_HELPER
 	select VIDEOMODE_HELPERS
-	depends on DRM && ARCH_MXC && ARM64
+	depends on DRM
+	depends on (ARCH_MXC && ARM64) || COMPILE_TEST
 	help
 	  Choose this if you have a NXP i.MX8MQ based system and want to use the
 	  Display Controller Subsystem. This option enables DCSS support.
-- 
Regards,

Laurent Pinchart

