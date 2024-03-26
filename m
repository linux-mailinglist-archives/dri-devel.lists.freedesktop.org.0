Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A08CA88BFFF
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 11:57:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B754410EE59;
	Tue, 26 Mar 2024 10:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="beF8WRFl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C46110EE67
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 10:57:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 78053CE1EF1;
 Tue, 26 Mar 2024 10:57:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE998C43390;
 Tue, 26 Mar 2024 10:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711450621;
 bh=RgXTYjenZlb2gm3MqpLGeXNi/9tzYzVu7kMQHNa8PvY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=beF8WRFll8Y3+Mpq7x36y5PlhZiNRNm0uRcS9NQMNFlz0RW8jQ6tC00PryVFlsInZ
 Yv9iefJeemtK4C509HVPgZkW4XP3Zq3ClUjBAhljIorHZGjjKzlXcg2I2KH3yginMn
 F2Ngjt1ZoJEWEM3ZIKsT7EslE4aKoEUlR8dSzZeEh89Czu+fjz0f/VXQR2esnnxqMM
 l8OTL6+omycT/I37fWO5Q1OOplrtk3VgwT6pXGidXLfp3cQeyLHIIwrsUythxR/5CP
 MsU6rXOj1o9SkCF5+1my3dOMw2CmjRc1iqVba53lPOhxxCU5DSSfb7Ti9cDXh+wX8H
 a1Zs4RXQsjtow==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 26 Mar 2024 11:56:18 +0100
Subject: [PATCH v2 05/12] drm/display: Reorder Kconfig symbols
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240326-kms-kconfig-helpers-v2-5-3b0aeee32217@kernel.org>
References: <20240326-kms-kconfig-helpers-v2-0-3b0aeee32217@kernel.org>
In-Reply-To: <20240326-kms-kconfig-helpers-v2-0-3b0aeee32217@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Jani Nikula <jani.nikula@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2795; i=mripard@kernel.org;
 h=from:subject:message-id; bh=RgXTYjenZlb2gm3MqpLGeXNi/9tzYzVu7kMQHNa8PvY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGlMK6+HLDmklL1BhXtKC6uE11snx19MCWv3tpxO01L+H
 LCuPfVqx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZgIcw9jw/wP232iDisxrFCy
 OT8ry/qPcmj0sQN3/rAtktuzTmeBmtYR4/VHflfpnKs5vJVXRJm/hLFO78zv7pSjRQwxk1wezLK
 P/VP7fsu0MzsXJj6OvFZ8bauM3reZzbHaZRM8Ay8+bXrH0MEPAA==
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

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
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

