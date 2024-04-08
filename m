Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5ECC89CA4A
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 19:05:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F610112897;
	Mon,  8 Apr 2024 17:04:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ckeyop7M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC2B112824
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 17:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712595885; x=1744131885;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B0wdy471L3tYInisOmGi+kXWczML1ad1MX/cN06o66Q=;
 b=Ckeyop7MVZ4sisuYNF+C3930fkClT/8VIVUFUN1yzYV5YzDf8WvRa7Th
 keHln986Sd7k3JiOEK9k30JggPfS/xsalJ6Nt9SHKnYWqa2SKnh1j5/ub
 b+WJDwm1DgC6pRMunFjqNv22yMjvS1vFDmXvh40j2dhWkM9nTFJLV8047
 krLYx66FFjXHKyoCl+kb8Ge44Et/o5F9uN4eblS8Ko89GbMVrwCOImXUk
 yQbPbbqLKEp7ATwC7RybLfCiilndl3vLMabooOLmBEc4UrOl/GxEts76N
 VCI6kdaJxJTDaemsQIL1AIVNvA9c4YdDmisDGzwpfy3yVCLjN4r1UUfMx g==;
X-CSE-ConnectionGUID: 8g4rUJNASjylvoVLxhh92w==
X-CSE-MsgGUID: xOIEYCX5SkmswdR3DzKqzw==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7793367"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="7793367"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:04:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="827792329"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="827792329"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 08 Apr 2024 10:04:42 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Apr 2024 20:04:41 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH 05/21] drm/imx/dcss: Allow build with COMPILE_TEST=y
Date: Mon,  8 Apr 2024 20:04:10 +0300
Message-ID: <20240408170426.9285-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240408170426.9285-1-ville.syrjala@linux.intel.com>
References: <20240408170426.9285-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Allow imx/dcss to be built with COMPILE_TEST=y for greater
coverage. Builds fine on x86/x86_64 at least.

Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
 	dpiormw.cocci
---
 drivers/gpu/drm/imx/dcss/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/dcss/Kconfig b/drivers/gpu/drm/imx/dcss/Kconfig
index 3ffc061d392b..502612747007 100644
--- a/drivers/gpu/drm/imx/dcss/Kconfig
+++ b/drivers/gpu/drm/imx/dcss/Kconfig
@@ -4,7 +4,7 @@ config DRM_IMX_DCSS
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
 	select VIDEOMODE_HELPERS
-	depends on DRM && ARCH_MXC && ARM64
+	depends on DRM && ((ARCH_MXC && ARM64) || COMPILE_TEST)
 	help
 	  Choose this if you have a NXP i.MX8MQ based system and want to use the
 	  Display Controller Subsystem. This option enables DCSS support.
-- 
2.43.2

