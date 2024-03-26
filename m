Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D3888C000
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 11:57:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A7B710EE64;
	Tue, 26 Mar 2024 10:57:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gNPfn0Wd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA02210EE64
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 10:57:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 29358601D9;
 Tue, 26 Mar 2024 10:57:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C9A5C433F1;
 Tue, 26 Mar 2024 10:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711450623;
 bh=fr1FnFsvAk3ZUDUnS5roqAxJFXoZcoZ13KdZ1J1be1Y=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=gNPfn0WdC+h2Otpo5I8ctUlX0YZOyt54YzBi8M4x05vI4+3KNdHkfL6yxWPMULqH1
 0OslqziZ8sWQq9xaTxrYFBTYve6ONSagD0LrU9EE80GzPMtiyPJ8pl0q9D1SouaBPn
 B1JrVErX1msxYc30YwUjRSQWE8RWNnFv9qzIN5Kp5ZbOCgt/qOUPtt1SIsoTCCy/Va
 tMZKb0/xlLoZ9E9LM8KZZ0D35fx6zjdRKL+793H27kFAX+HQC0P42mgq86vPNb/Ri2
 1L31KW2TrIUj6iL3hIYCwCwcg5qSmgucv90ISn7am3Sp7yR9VittvfBgXRKaL44/Xi
 mgfomrF1EPrfA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 26 Mar 2024 11:56:19 +0100
Subject: [PATCH v2 06/12] drm/display: Make all helpers visible and switch
 to depends on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240326-kms-kconfig-helpers-v2-6-3b0aeee32217@kernel.org>
References: <20240326-kms-kconfig-helpers-v2-0-3b0aeee32217@kernel.org>
In-Reply-To: <20240326-kms-kconfig-helpers-v2-0-3b0aeee32217@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3149; i=mripard@kernel.org;
 h=from:subject:message-id; bh=fr1FnFsvAk3ZUDUnS5roqAxJFXoZcoZ13KdZ1J1be1Y=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGlMK687d5fKTZz8QdZlhlnxzgte6kcZI28//aO/nUFMl
 2VL2XH5jqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRqy6MDe9nTukpfirssPXR
 4W7L36mK7zfP3niKa47U49cNaZU+H8Nk/RROfa7bM30C95/EPzzF3owNKznXCmpYvMmquXhGnCE
 6RbzGoEOiUCAzaPearqpFvq5OVg5iFocYJv2dutH7uh2/by8A
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
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
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

