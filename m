Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B36A288A061
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 13:52:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1951B10E859;
	Mon, 25 Mar 2024 12:52:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Nk2IHwuB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B499010E85E
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 12:52:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CB272CE136F;
 Mon, 25 Mar 2024 12:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5D79C433C7;
 Mon, 25 Mar 2024 12:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711371154;
 bh=xNV/99nE8pMFC8DGwvW9GjM4FQgY1gJBz+wcJX1V/RI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Nk2IHwuBOobtsuH2zrUSr/F0qdb0QVB5pe8K7Kgw4va0C/1CHTtq4vUHwruH9DHDX
 ZUn/PHzgeOuiLbjfgkPb/bikNhmDAZ9B5cpakDZtFCGul+wYtr4XFyLQ9KKZAaare2
 Ud9Vc9XrWGFhHt6z5+qJd6ldIvrQ2StcWZmM1t4+Ql6xMbq28LTR34FH1PR7zWquFN
 vv358+ULG+q9YC0vWmxecSdm/1u/GBJvCkrbU9ZFIcguFZzsbNpDslEkx2lueIglkg
 Jk7B1a7H8FXlqORZIXM6Cd1JZ5bknU82HmPl6s+qh9meMUePWlWrhHxdKjqX6c8+7o
 pyZ8Qbq/RkK/g==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 25 Mar 2024 13:52:08 +0100
Subject: [PATCH 06/12] drm/display: Make all helpers visible and switch to
 depends on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240325-kms-kconfig-helpers-v1-6-bfec6949d9c3@kernel.org>
References: <20240325-kms-kconfig-helpers-v1-0-bfec6949d9c3@kernel.org>
In-Reply-To: <20240325-kms-kconfig-helpers-v1-0-bfec6949d9c3@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3099; i=mripard@kernel.org;
 h=from:subject:message-id; bh=xNV/99nE8pMFC8DGwvW9GjM4FQgY1gJBz+wcJX1V/RI=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGmMxZWuzDP94xPvb53s8j618LywtO61q14Vzx1Wu09db
 Xgib5Z4x1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjI5AeMdToXF3RwXzrhcOP2
 P1kvXrOFz7+KXTnuxnR3nVDb/xS/LoMFMVvlmYst8lp3Kfzn+CJSx1inPHP1FqHCw+sYzRaqf3U
 NXr6Yg+W0PINI/auf8cK/HxssOJLmVPdyIUOAw4Tejmf/P78CAA==
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

All the helpers Kconfig symbols so far have relied on drivers selecting
them, and that's what most drivers did.

However, this creates an issue nowadays when helpers depend on each
other, and select doesn't transitively select a dependency dependencies.

Depends on doesn't have that limitation though, so let's convert those
symbols to be dependable and use depends on between them too.

Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/display/Kconfig | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 864a6488bfdf..c77e7f85bd67 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -1,48 +1,50 @@
 # SPDX-License-Identifier: MIT
 
 config DRM_DISPLAY_HELPER
-	tristate
+	tristate "DRM Display Helpers"
 	depends on DRM
 	help
 	  DRM helpers for display adapters.
 
 config DRM_DISPLAY_DP_AUX_BUS
-	tristate
+	tristate "DRM DisplayPort AUX bus support"
 	depends on DRM
 	depends on OF || COMPILE_TEST
 
 config DRM_DISPLAY_DP_AUX_CEC
 	bool "Enable DisplayPort CEC-Tunneling-over-AUX HDMI support"
-	depends on DRM && DRM_DISPLAY_HELPER
-	select DRM_DISPLAY_DP_HELPER
+	depends on DRM
+	depends on DRM_DISPLAY_HELPER
+	depends on DRM_DISPLAY_DP_HELPER
 	select CEC_CORE
 	help
 	  Choose this option if you want to enable HDMI CEC support for
 	  DisplayPort/USB-C to HDMI adapters.
 
 	  Note: not all adapters support this feature, and even for those
 	  that do support this they often do not hook up the CEC pin.
 
 config DRM_DISPLAY_DP_AUX_CHARDEV
-	bool "DRM DP AUX Interface"
-	depends on DRM && DRM_DISPLAY_HELPER
-	select DRM_DISPLAY_DP_HELPER
+	bool "DRM DisplayPort AUX Interface"
+	depends on DRM
+	depends on DRM_DISPLAY_HELPER
+	depends on DRM_DISPLAY_DP_HELPER
 	help
 	  Choose this option to enable a /dev/drm_dp_auxN node that allows to
 	  read and write values to arbitrary DPCD registers on the DP aux
 	  channel.
 
 config DRM_DISPLAY_DP_HELPER
-	bool
+	bool "DRM DisplayPort Helpers"
 	depends on DRM_DISPLAY_HELPER
 	help
 	  DRM display helpers for DisplayPort.
 
 config DRM_DISPLAY_DP_TUNNEL
-	bool
-	select DRM_DISPLAY_DP_HELPER
+	bool "DRM DisplayPort tunnels support"
+	depends on DRM_DISPLAY_DP_HELPER
 	help
 	  Enable support for DisplayPort tunnels. This allows drivers to use
 	  DP tunnel features like the Bandwidth Allocation mode to maximize the
 	  BW utilization for display streams on Thunderbolt links.
 
@@ -58,15 +60,15 @@ config DRM_DISPLAY_DP_TUNNEL_STATE_DEBUG
 	  streams contained in tunnels.
 
 	  If in doubt, say "N".
 
 config DRM_DISPLAY_HDCP_HELPER
-	bool
+	bool "DRM HDCD Helpers"
 	depends on DRM_DISPLAY_HELPER
 	help
 	  DRM display helpers for HDCP.
 
 config DRM_DISPLAY_HDMI_HELPER
-	bool
+	bool "DRM HDMI Helpers"
 	depends on DRM_DISPLAY_HELPER
 	help
 	  DRM display helpers for HDMI.

-- 
2.44.0

