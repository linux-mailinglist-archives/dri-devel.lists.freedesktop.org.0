Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 691E43DC279
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jul 2021 03:40:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF7A6F4E9;
	Sat, 31 Jul 2021 01:40:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 063E86F4E9
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jul 2021 01:40:16 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E584A1027;
 Sat, 31 Jul 2021 03:40:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1627695614;
 bh=s8lWldAwCfpDlUn10rnLS7SwtEHK7/qK7+IBJMGKT7k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kgbqgtkMYLNT0CEtO/SKVlzzmo4bwVkRUB2Q315oLbqeE1kTMP7krqmCgg8QWfMPo
 ISDDbIBAaPA5YT4PPIue+Q6IhjRAy9aJv6I2fzg8XEcS1XpYRfqoXVRfPAcQAsytqo
 i3DucdDDH1vfvWblxSzwmNb+w6aI8iCloQIHkEYo=
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
Subject: [PATCH v2 6/9] drm/rcar-du: Enable COMPILE_TEST on all architectures
Date: Sat, 31 Jul 2021 04:39:51 +0300
Message-Id: <20210731013954.11926-7-laurent.pinchart+renesas@ideasonboard.com>
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

To extend test coverage, support COMPILE_TEST on all architectures by
dropping the ARM || ARM64 dependency. The dependency is a no-op when
COMPILE_TEST is not selected as ARCH_RENESAS can only be defined for ARM
or ARM64.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index b47e74421e34..bce3a67f14d3 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -2,7 +2,6 @@
 config DRM_RCAR_DU
 	tristate "DRM Support for R-Car Display Unit"
 	depends on DRM && OF
-	depends on ARM || ARM64
 	depends on ARCH_RENESAS || COMPILE_TEST
 	imply DRM_RCAR_CMM
 	imply DRM_RCAR_LVDS
-- 
Regards,

Laurent Pinchart

