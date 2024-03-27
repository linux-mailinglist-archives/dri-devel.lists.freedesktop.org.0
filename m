Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FD488DBAB
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 11:57:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E963610F9F9;
	Wed, 27 Mar 2024 10:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EKkBXbOR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889EE10F9F6
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 10:57:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 925DFCE2610;
 Wed, 27 Mar 2024 10:57:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B84BC43394;
 Wed, 27 Mar 2024 10:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711537050;
 bh=fr1FnFsvAk3ZUDUnS5roqAxJFXoZcoZ13KdZ1J1be1Y=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=EKkBXbORsqblBRnw2KMU4UmosuEzyL8wGNNSy1vQFDgDfy3MYD7USTiYdpOsXTCp+
 pl/qh3sF9KI4CQLiYWLQekll3+sjqMPZXVOj6CFc1b+mR5KtN4P+PsecJi/hq0ra5e
 4sJy0ECyBW4YeBN2wuq3t9U5Hm0X+Am5HcGwrcF35uqg9gAacJ5RB1mL29kiIYCEnc
 ko9oYVdOirZzPyjt5tgzQLqov5ZcZwWYt1jwny0lZVWyG/NBrIgrFzQoaQDrR+Pk6F
 FyouGCrKeJofII9eGj9V+Xb6zxc/mkIAyDcGDvTvDKLWHeL/MaR9yl8mfk7cWZehJA
 8DQB35jdRilPw==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 27 Mar 2024 11:57:01 +0100
Subject: [PATCH v3 06/13] drm/display: Make all helpers visible and switch
 to depends on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-kms-kconfig-helpers-v3-6-eafee11b84b3@kernel.org>
References: <20240327-kms-kconfig-helpers-v3-0-eafee11b84b3@kernel.org>
In-Reply-To: <20240327-kms-kconfig-helpers-v3-0-eafee11b84b3@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3149; i=mripard@kernel.org;
 h=from:subject:message-id; bh=fr1FnFsvAk3ZUDUnS5roqAxJFXoZcoZ13KdZ1J1be1Y=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGnMv5uu1DdJuvTeWP9rYwDXaXcjw6ztsy4+Ff99Iotbs
 cRv0W6WjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRomuMDW1rlDdMe7K2+5OP
 9WL1b2lX9+70+DRrbvovdx5W1dtMDmsqBLuLdk+YcHGjJe+8z7bnshgbjjP/8dLhXxXzMLT31hF
 /9jXpW0vb3kbqadmGzHX2bBPLeOn51ipXd+lexsltxvoNv/4BAA==
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

