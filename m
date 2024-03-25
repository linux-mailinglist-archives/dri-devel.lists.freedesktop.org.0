Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F9488A05E
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 13:52:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E7810E855;
	Mon, 25 Mar 2024 12:52:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JQh3+YZu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EFAC10E896
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 12:52:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A7BAD60F7C;
 Mon, 25 Mar 2024 12:52:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A87C433F1;
 Mon, 25 Mar 2024 12:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711371151;
 bh=sTH2XSwIJSfe7hImv0bl4k4ADm8g+MWlFdoH7Q+/ei8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=JQh3+YZuVLu+f+aIloF+yIP+2jgzMpfmp+URZftLb2RHCMzO9oVUikJ2jNdt1AMv0
 pbSsUSoSE2PLaj/3kAJgDMlbJuxRSN4/IA7yJpWdc3yBnWWYrf1Z9JD742L+yytqdZ
 FlJzLpT2TGbGPWSqufIBCOLvgmiUCY0ZhOFVCKDv0WVyN/8jy6wxAoR3+NpB/ojd2s
 3ZsQBVq0ycx2sbM33ksI0vmH1asq8x36uPoHZR+ULo4H+iBE4+UmW+OOJRU0JTZWv0
 0deqolcls4OaYNtlwBmiHqjJHPdfBso9iiceM9+dN2MX1B53xttWm1oMDQLpcG5pYg
 oojCRyO/IXzyA==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 25 Mar 2024 13:52:07 +0100
Subject: [PATCH 05/12] drm/display: Reorder Kconfig symbols
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240325-kms-kconfig-helpers-v1-5-bfec6949d9c3@kernel.org>
References: <20240325-kms-kconfig-helpers-v1-0-bfec6949d9c3@kernel.org>
In-Reply-To: <20240325-kms-kconfig-helpers-v1-0-bfec6949d9c3@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2688; i=mripard@kernel.org;
 h=from:subject:message-id; bh=sTH2XSwIJSfe7hImv0bl4k4ADm8g+MWlFdoH7Q+/ei8=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGmMxRX28b+jEuNc8jTiXDcvqZPljn+y50Tj+ibLFr8XD
 8Ua31/umMrCIMzJICumyPJEJuz08vbFVQ72K3/AzGFlAhnCwMUpABP5vomx4XxBmOJyb4bXp/bL
 WQq/uP6N6a+nTB6DaZDA+uOiRqHlS9JcC1X1PYKD1Xm4726OulnL2LDYNi7PXMXA9W6e/3r+1CW
 droyz2n7u0ssv4MpeIrv6SZnSxmVX3OSb/4uXsDwJaV7dCAA=
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

The display kconfig helpers are not organized in any particular order,
so let's move them around to create an alphabetical order.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/display/Kconfig | 52 ++++++++++++++++++++---------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 35cb68db0bfd..864a6488bfdf 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -1,18 +1,39 @@
 # SPDX-License-Identifier: MIT
 
-config DRM_DISPLAY_DP_AUX_BUS
-	tristate
-	depends on DRM
-	depends on OF || COMPILE_TEST
-
 config DRM_DISPLAY_HELPER
 	tristate
 	depends on DRM
 	help
 	  DRM helpers for display adapters.
 
+config DRM_DISPLAY_DP_AUX_BUS
+	tristate
+	depends on DRM
+	depends on OF || COMPILE_TEST
+
+config DRM_DISPLAY_DP_AUX_CEC
+	bool "Enable DisplayPort CEC-Tunneling-over-AUX HDMI support"
+	depends on DRM && DRM_DISPLAY_HELPER
+	select DRM_DISPLAY_DP_HELPER
+	select CEC_CORE
+	help
+	  Choose this option if you want to enable HDMI CEC support for
+	  DisplayPort/USB-C to HDMI adapters.
+
+	  Note: not all adapters support this feature, and even for those
+	  that do support this they often do not hook up the CEC pin.
+
+config DRM_DISPLAY_DP_AUX_CHARDEV
+	bool "DRM DP AUX Interface"
+	depends on DRM && DRM_DISPLAY_HELPER
+	select DRM_DISPLAY_DP_HELPER
+	help
+	  Choose this option to enable a /dev/drm_dp_auxN node that allows to
+	  read and write values to arbitrary DPCD registers on the DP aux
+	  channel.
+
 config DRM_DISPLAY_DP_HELPER
 	bool
 	depends on DRM_DISPLAY_HELPER
 	help
 	  DRM display helpers for DisplayPort.
@@ -47,26 +68,5 @@ config DRM_DISPLAY_HDCP_HELPER
 config DRM_DISPLAY_HDMI_HELPER
 	bool
 	depends on DRM_DISPLAY_HELPER
 	help
 	  DRM display helpers for HDMI.
-
-config DRM_DISPLAY_DP_AUX_CHARDEV
-	bool "DRM DP AUX Interface"
-	depends on DRM && DRM_DISPLAY_HELPER
-	select DRM_DISPLAY_DP_HELPER
-	help
-	  Choose this option to enable a /dev/drm_dp_auxN node that allows to
-	  read and write values to arbitrary DPCD registers on the DP aux
-	  channel.
-
-config DRM_DISPLAY_DP_AUX_CEC
-	bool "Enable DisplayPort CEC-Tunneling-over-AUX HDMI support"
-	depends on DRM && DRM_DISPLAY_HELPER
-	select DRM_DISPLAY_DP_HELPER
-	select CEC_CORE
-	help
-	  Choose this option if you want to enable HDMI CEC support for
-	  DisplayPort/USB-C to HDMI adapters.
-
-	  Note: not all adapters support this feature, and even for those
-	  that do support this they often do not hook up the CEC pin.

-- 
2.44.0

