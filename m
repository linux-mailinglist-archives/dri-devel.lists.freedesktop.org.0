Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6064B48D6
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 11:01:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE31510E318;
	Mon, 14 Feb 2022 10:01:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D911D10E30F;
 Mon, 14 Feb 2022 10:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644832890; x=1676368890;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6ki3B4SKMeAIMpeJIvZP+6K8tc+2XPgGgemO1vx5zbg=;
 b=M6dvmS59od6s9wViTZeLFcXsgVZEKwBY7pu4OMMBZV8kBBLz9cvBaG+s
 H4Jx2uBvgWLLje25DDtLSl++qqGMmyelpYfi8DjtQrBmxOe6TR9FKJBYz
 JpAh1+2zM4pBwN77Nw/XDjQwhs9JA2xSjp0HfFGmtmZ8t5It7ovGanovh
 rwyiiG7FxsMyVeGKVjHjOAGLuTOC+PkVG+dteEd/BsFSSyhFTgcn10D0r
 CGVSZ7Ld7uyMHD3yekpIOUmFVCiOpePRI1AGFgLkSjDiYyxXPb1qoyLTs
 ccASKxSMJmPzjzyTuWHECITmga9WtOfLCZD0VzLUe1GiXSh9r2nGeQwsb A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="274628589"
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="274628589"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 02:01:30 -0800
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="543383384"
Received: from unknown (HELO vandita-Z390-AORUS-ULTRA.iind.intel.com)
 ([10.190.238.8])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 02:01:28 -0800
From: Vandita Kulkarni <vandita.kulkarni@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC v2 5/5] drm/hdmi21: Add frl_dfm_helper to Makefile
Date: Mon, 14 Feb 2022 07:33:57 +0530
Message-Id: <20220214020357.10063-6-vandita.kulkarni@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214020357.10063-1-vandita.kulkarni@intel.com>
References: <20220214020357.10063-1-vandita.kulkarni@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 Vandita Kulkarni <vandita.kulkarni@intel.com>, uma.shankar@intel.com,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the new frl_dfm_helper file to drm Makefile

Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
---
 drivers/gpu/drm/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 8675c2af7ae1..81fe3df8bfda 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -57,7 +57,9 @@ drm_kms_helper-y := drm_bridge_connector.o drm_crtc_helper.o \
 		drm_scdc_helper.o drm_gem_atomic_helper.o \
 		drm_gem_framebuffer_helper.o \
 		drm_atomic_state_helper.o drm_damage_helper.o \
-		drm_format_helper.o drm_self_refresh_helper.o drm_rect.o
+		drm_format_helper.o drm_self_refresh_helper.o drm_rect.o \
+		drm_frl_dfm_helper.o
+
 drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
 drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fb_helper.o
 
-- 
2.32.0

