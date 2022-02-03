Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B774A8581
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 14:48:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14DF210F922;
	Thu,  3 Feb 2022 13:47:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9863510F91E;
 Thu,  3 Feb 2022 13:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643896075; x=1675432075;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PsXtUpr4mALkwmby27Q4ehFCjMX9PohjMiBUXogwyNA=;
 b=gTKu35fxRCMV8oU3EMRakRBKOsoxYynY5KnUp/KqQy09Dq92JYW/Wfud
 4SmT1zmyKBA0m48f4U6zi0pfU/ZUY4XeQLDP1IYNT65ug2DBugun97eh0
 JNeb/tb+pFJk0tFgOVRBVvyHP4zpUsk4DKYkJV8BFFmbgEfvDeHnG2O5z
 pwMVGlZpQVMMOnbDhBRcw5GQsnfGJSTiggd2qttmEC9CRF+Ghgrr+2xW/
 wEC9AXpsGjswJ0ymT+zbLebV9kgsKSLMm14KMTd5hV6k4BmUV5O/VmhQO
 PTiDc0UjK1kaPNnkwnKnDgCnYWrskXEooammzrxXlGPkzBaNSXs9ikv6/ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="308872295"
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="308872295"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 05:47:40 -0800
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="583793094"
Received: from unknown (HELO vandita-Z390-AORUS-ULTRA.iind.intel.com)
 ([10.190.238.8])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 05:47:38 -0800
From: Vandita Kulkarni <vandita.kulkarni@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 5/5] drm/hdmi21: Add frl_dfm_helper to Makefile
Date: Thu,  3 Feb 2022 11:20:12 +0530
Message-Id: <20220203055012.14568-6-vandita.kulkarni@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220203055012.14568-1-vandita.kulkarni@intel.com>
References: <20220203055012.14568-1-vandita.kulkarni@intel.com>
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
Cc: jani.nikula@intel.com, Vandita Kulkarni <vandita.kulkarni@intel.com>,
 intel-gfx@lists.freedesktop.org, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the new frl_dfm_helper file to drm Makefile

Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
---
 drivers/gpu/drm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 8675c2af7ae1..4fa9b48995c8 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -17,7 +17,7 @@ drm-y       :=	drm_aperture.o drm_auth.o drm_cache.o \
 		drm_dumb_buffers.o drm_mode_config.o drm_vblank.o \
 		drm_syncobj.o drm_lease.o drm_writeback.o drm_client.o \
 		drm_client_modeset.o drm_atomic_uapi.o \
-		drm_managed.o drm_vblank_work.o
+		drm_managed.o drm_vblank_work.o drm_frl_dfm_helper.o
 
 drm-$(CONFIG_DRM_LEGACY) += drm_agpsupport.o drm_bufs.o drm_context.o drm_dma.o \
 			    drm_hashtab.o drm_irq.o drm_legacy_misc.o drm_lock.o \
-- 
2.32.0

