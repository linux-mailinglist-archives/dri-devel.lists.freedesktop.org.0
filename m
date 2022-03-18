Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 045DA4DD30F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 03:25:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA6D10E147;
	Fri, 18 Mar 2022 02:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2107210E147
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 02:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647570328; x=1679106328;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7xFYsxFRcOWx8adm4Xa+fJ59WCwEHcq4x1ykyvRiqik=;
 b=MaUu//4Dr5GgDi1z0Iihk7kaBKakhlyiLaIhz5vm+ildXs9XqK0WceSV
 +wmOX8uCuaqAlmfZKEPyZVjQJ8uZxZ7ehq963ItkrOadH8XN1qCHRWN3W
 Dhiw6n/MZcO5T2ERoRYVZG+uvI/XoKugbatpQ746mfogjOqm4cb+REHDx
 cqVc8YE+hEzZWFUAfNlW8QcbZDVTTrQi2EqE2voZ04ec+DP4FLQAvh1fX
 1xx8miKsLVFfsDfPt42S1eyV1WsrLppr+Hv2mSqaiDw01RPxqSeY1XGEp
 qUI1vcnnyPoKsnGKS/Oh0y0oBtHJkZAYeum3kTrN7UEvdgxsOY4u5/nPp w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="236976111"
X-IronPort-AV: E=Sophos;i="5.90,191,1643702400"; d="scan'208";a="236976111"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 19:25:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,191,1643702400"; d="scan'208";a="499064352"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 17 Mar 2022 19:25:25 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nV2Iu-000ELy-Tk; Fri, 18 Mar 2022 02:25:24 +0000
Date: Fri, 18 Mar 2022 10:25:00 +0800
From: kernel test robot <lkp@intel.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 dri-devel@lists.freedesktop.org
Subject: [RFC PATCH] drm/gma500: gma_crtc_gamma_set() can be static
Message-ID: <20220318022500.GA80961@da9b3b052118>
References: <20220317092555.17882-2-patrik.r.jakobsson@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220317092555.17882-2-patrik.r.jakobsson@gmail.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: daniel.vetter@ffwll.ch, kbuild-all@lists.01.org, tzimmermann@suse.de,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drivers/gpu/drm/gma500/gma_display.c:175:5: warning: symbol 'gma_crtc_gamma_set' was not declared. Should it be static?
drivers/gpu/drm/gma500/gma_display.c:322:5: warning: symbol 'gma_crtc_cursor_set' was not declared. Should it be static?
drivers/gpu/drm/gma500/gma_display.c:440:5: warning: symbol 'gma_crtc_cursor_move' was not declared. Should it be static?

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 drivers/gpu/drm/gma500/gma_display.c |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/gma500/gma_display.c b/drivers/gpu/drm/gma500/gma_display.c
index 832696ccfa9d0..8f6a8502b7756 100644
--- a/drivers/gpu/drm/gma500/gma_display.c
+++ b/drivers/gpu/drm/gma500/gma_display.c
@@ -172,9 +172,9 @@ void gma_crtc_load_lut(struct drm_crtc *crtc)
 	}
 }
 
-int gma_crtc_gamma_set(struct drm_crtc *crtc, u16 *red, u16 *green, u16 *blue,
-		       u32 size,
-		       struct drm_modeset_acquire_ctx *ctx)
+static int gma_crtc_gamma_set(struct drm_crtc *crtc, u16 *red, u16 *green, u16 *blue,
+			      u32 size,
+			      struct drm_modeset_acquire_ctx *ctx)
 {
 	gma_crtc_load_lut(crtc);
 
@@ -319,10 +319,10 @@ void gma_crtc_dpms(struct drm_crtc *crtc, int mode)
 	REG_WRITE(DSPARB, 0x3F3E);
 }
 
-int gma_crtc_cursor_set(struct drm_crtc *crtc,
-			struct drm_file *file_priv,
-			uint32_t handle,
-			uint32_t width, uint32_t height)
+static int gma_crtc_cursor_set(struct drm_crtc *crtc,
+			       struct drm_file *file_priv,
+			       uint32_t handle,
+			       uint32_t width, uint32_t height)
 {
 	struct drm_device *dev = crtc->dev;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
@@ -437,7 +437,7 @@ int gma_crtc_cursor_set(struct drm_crtc *crtc,
 	return ret;
 }
 
-int gma_crtc_cursor_move(struct drm_crtc *crtc, int x, int y)
+static int gma_crtc_cursor_move(struct drm_crtc *crtc, int x, int y)
 {
 	struct drm_device *dev = crtc->dev;
 	struct gma_crtc *gma_crtc = to_gma_crtc(crtc);
