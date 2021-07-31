Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A713DC278
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jul 2021 03:40:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4AC56F4E6;
	Sat, 31 Jul 2021 01:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113F66E517
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jul 2021 01:40:15 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E8F29E86;
 Sat, 31 Jul 2021 03:40:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1627695613;
 bh=ejFb9i9s1Bv7qUAsOTKt3+UHHUKD0qZftz7nXpZfH7A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=htrMq7NgO2+hD6HI53NdgwjgwKI2KI/2HFmoeIYpWzPlCgTP2Fc2TgO9vjEjWXDP0
 OyrPRfcpcvWx8TvCIRj9JCu9FfGHaVr/0MjgHJj2FbAJF1XsTt7ollR/jDpFiYKPmf
 qNR7Uer0J/Ff3burVFUsajOFIRPawqi6ePoQ7ew8=
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
Subject: [PATCH v2 5/9] drm/omap: Enable COMPILE_TEST on all architectures
Date: Sat, 31 Jul 2021 04:39:50 +0300
Message-Id: <20210731013954.11926-6-laurent.pinchart+renesas@ideasonboard.com>
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

To extend test coverage, relax the dependency on ARCH_OMAP2PLUS or
ARCH_MULTIPLATFORM to also enable compilation with COMPILE_TEST.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Enable COMPILE_TEST on all architectures
---
 drivers/gpu/drm/omapdrm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/Kconfig b/drivers/gpu/drm/omapdrm/Kconfig
index e7281da5bc6a..560d0cdd6156 100644
--- a/drivers/gpu/drm/omapdrm/Kconfig
+++ b/drivers/gpu/drm/omapdrm/Kconfig
@@ -2,7 +2,7 @@
 config DRM_OMAP
 	tristate "OMAP DRM"
 	depends on DRM
-	depends on ARCH_OMAP2PLUS || ARCH_MULTIPLATFORM
+	depends on ARCH_OMAP2PLUS || ARCH_MULTIPLATFORM || COMPILE_TEST
 	select OMAP2_DSS
 	select DRM_KMS_HELPER
 	select VIDEOMODE_HELPERS
-- 
Regards,

Laurent Pinchart

