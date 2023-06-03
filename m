Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C88721156
	for <lists+dri-devel@lfdr.de>; Sat,  3 Jun 2023 19:08:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060C810E101;
	Sat,  3 Jun 2023 17:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3999A10E02A
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Jun 2023 17:08:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 939236103F;
 Sat,  3 Jun 2023 17:08:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF872C433A0;
 Sat,  3 Jun 2023 17:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685812087;
 bh=625V0iT5dcehfVt4qp+4KsunqsvUgaOhEkp64prztuE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mh016dTw6+Ptz8S0odzfu5vqrTwHWrX7gPI3LWg8aJGRF3ES+70ahzjpvreYGtu3L
 3eAM6sA0I2sRRt/jT7wICaR7Fh5/kxX/J7yGOdSc1naXM5ekeQc/3FoYFxj74ekWJ7
 c9N1n1hg2QAuiDvBAyy+6CPGOSMzvZcXNhn848ET64ugNQydaSXi3hofcqIpYCPbH4
 LwAPFg/owy8d6bNbe86ro5BbF4NAeCbsifc55jpi5hhjTwCCNpJ8vKTF/4vQTS+mw+
 W2ICtXxbhYQw9WalBmCDrYXbpLyWzB82vjRrAD08V+sna0hUGiFDYoiL0ZKKsO6YXV
 NOgsweVlQ1kwg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 2/2] drm/bridge: imx: turn imx8{qm,
 qxp}-ldb into single-object modules
Date: Sun,  4 Jun 2023 02:07:47 +0900
Message-Id: <20230603170747.1753842-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230603170747.1753842-1-masahiroy@kernel.org>
References: <20230603170747.1753842-1-masahiroy@kernel.org>
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Liu Ying <victor.liu@nxp.com>, Masahiro Yamada <masahiroy@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the previous fix, these modules are built from a single C file.

Rename the source files so they match the module names.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 drivers/gpu/drm/bridge/imx/Makefile                           | 4 ----
 drivers/gpu/drm/bridge/imx/{imx8qm-ldb-drv.c => imx8qm-ldb.c} | 0
 .../gpu/drm/bridge/imx/{imx8qxp-ldb-drv.c => imx8qxp-ldb.c}   | 0
 3 files changed, 4 deletions(-)
 rename drivers/gpu/drm/bridge/imx/{imx8qm-ldb-drv.c => imx8qm-ldb.c} (100%)
 rename drivers/gpu/drm/bridge/imx/{imx8qxp-ldb-drv.c => imx8qxp-ldb.c} (100%)

diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
index 64b93009376a..c102443f7286 100644
--- a/drivers/gpu/drm/bridge/imx/Makefile
+++ b/drivers/gpu/drm/bridge/imx/Makefile
@@ -1,9 +1,5 @@
-imx8qm-ldb-objs := imx8qm-ldb-drv.o
 obj-$(CONFIG_DRM_IMX8QM_LDB) += imx8qm-ldb.o
-
-imx8qxp-ldb-objs := imx8qxp-ldb-drv.o
 obj-$(CONFIG_DRM_IMX8QXP_LDB) += imx8qxp-ldb.o
-
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-pixel-link.o
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI) += imx8qxp-pxl2dpi.o
diff --git a/drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c b/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
similarity index 100%
rename from drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c
rename to drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
similarity index 100%
rename from drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c
rename to drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
-- 
2.39.2

