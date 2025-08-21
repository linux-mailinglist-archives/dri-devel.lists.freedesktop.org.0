Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42956B30705
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 22:52:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A3010EA2C;
	Thu, 21 Aug 2025 20:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hYKGSRyo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 869A510EA2C
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 20:52:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 40B545C6327;
 Thu, 21 Aug 2025 20:52:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6163C4CEEB;
 Thu, 21 Aug 2025 20:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755809555;
 bh=ZXq0cWBSStXhb51kKFQC4dUe61b5u6QYn/AgF5xIQvc=;
 h=From:Date:Subject:To:Cc:From;
 b=hYKGSRyo38KznToUG3pZaYfEu/90Vgbx8Am+nboT2XPHB6fpULYqfdku0F4hYJZh4
 Q1KgZitH5ykWBAgUUhNlb19mzG9TsGef9XczuzKVO8+o9NKyhnZTyGJFNuWyU4qHKS
 yhix1ZWQEg/+wGtB0DyrQlEWpnIF3whzkPDielcjXMUjt8+n+/vyZDp6SQrbFg3z8Y
 7QHs97uMDxAJ49VA5EGWW4LUfg/CI6hHq2lgPm6IKpzb0mbQBogO/SPYV4F4MY5ytc
 DD7M8X7/KcOiVXnkDJ9zyiHrYN/LsKX5YHUwHtLmhNXxMldkkZPg/56kxHIvPQ0228
 7wEIPenbNU+NA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 21 Aug 2025 13:52:12 -0700
Subject: [PATCH] drm/bridge: cdns-dsi: Select VIDEOMODE_HELPERS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-cdns-videohelpers-v1-1-853e021908cf@kernel.org>
X-B4-Tracking: v=1; b=H4sIAPuGp2gC/x3MTQqAIBBA4avErBMa6Ue6SrQwnXIgVByIILp70
 vJbvPeAUGESmJsHCl0snGIFtg24YONBin016E4PndGonI+iLvaUAp2ZiqgJ0Wg7Yj9sDmqXC+1
 8/89lfd8PGSK/JWMAAAA=
X-Change-ID: 20250821-cdns-videohelpers-71182a6145bc
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: dri-devel@lists.freedesktop.org, patches@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1202; i=nathan@kernel.org;
 h=from:subject:message-id; bh=ZXq0cWBSStXhb51kKFQC4dUe61b5u6QYn/AgF5xIQvc=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBnL2wUu/Ava5Wd5b7uH9R49VZHLAaf4Xh893hX9/mI8T
 8e8D7vlO0pZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBEvnkzMvxbl1w0p8jm3vum
 e/XFvwP69KM2e3c8yOlRPxdZxdy9Zysjw7fjOeF/PbqNpHzt5JbMFrSvf3eQvyPBLfCveOiqJUZ
 +bAA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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

When no other driver selects CONFIG_VIDEOMODE_HELPERS but
CONFIG_DRM_CDNS_DSI is enabled, there is a linker or modpost error:

  ERROR: modpost: "drm_display_mode_to_videomode" [drivers/gpu/drm/bridge/cadence/cdns-dsi.ko] undefined!

Select VIDEOMODE_HELPERS to ensure that this helper function is
available to the driver.

Fixes: ce4bc5ca7c1d ("drm/bridge: cdns-dsi: Use video mode and clean up cdns_dsi_mode2cfg()")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/bridge/cadence/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig b/drivers/gpu/drm/bridge/cadence/Kconfig
index cced81633ddc..f1d8a8a151d8 100644
--- a/drivers/gpu/drm/bridge/cadence/Kconfig
+++ b/drivers/gpu/drm/bridge/cadence/Kconfig
@@ -6,6 +6,7 @@ config DRM_CDNS_DSI
 	select DRM_PANEL_BRIDGE
 	select GENERIC_PHY
 	select GENERIC_PHY_MIPI_DPHY
+	select VIDEOMODE_HELPERS
 	depends on OF
 	help
 	  Support Cadence DPI to DSI bridge. This is an internal

---
base-commit: 3f13bcc886fc034113cb75cb32b8d9db1216b846
change-id: 20250821-cdns-videohelpers-71182a6145bc

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>

