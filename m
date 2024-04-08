Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C8089CA44
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 19:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4FAE112854;
	Mon,  8 Apr 2024 17:04:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dO70qWml";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77EAB1128BA
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 17:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712595879; x=1744131879;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZaCTBd/1TL7KAoIcF9erYCmKy2gtKxxtl552hklsHXU=;
 b=dO70qWmlCqP6apF2NglRMQjsaMYOwzWJyoVaoshCOjBUXjau9f7hkyif
 /6WIS8e5jyEaM3VTfiG+yYwA4YnYOcpofcq0RnIV/pOPhbB3q6aMGWwTl
 URgfv+YGWzr20xdimKPUUQzR9MJR9s1967gQw5oGrSX4lnYuf7DQl5VpA
 KRO9PngaFG8BglAmQoqiZeOvzP8WYBqok5PaujMkFk3vVTgHAdsmbNWNv
 XAJQLCVg4tEDrZ3PA5lrvS/rnJUVTyLG/z1ky9/h6XU1IsjU1P3eJ1K6S
 xY0Oq+ZcYEbTKllvYNga6b5jd4eSE8k163V9psj2mVE5guVqQpbsgjV+O A==;
X-CSE-ConnectionGUID: Of4mlWehQ1SJTLCv8TK/4Q==
X-CSE-MsgGUID: d2NFMFyURDOPzwy/EJX4Kw==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7793353"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="7793353"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:04:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="827792327"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="827792327"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 08 Apr 2024 10:04:36 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Apr 2024 20:04:35 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Russell King <linux@armlinux.org.uk>
Subject: [PATCH 03/21] drm/armada: Allow build with COMPILE_TEST=y
Date: Mon,  8 Apr 2024 20:04:08 +0300
Message-ID: <20240408170426.9285-4-ville.syrjala@linux.intel.com>
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

Allow armada to be built with COMPILE_TEST=y for greater
coverage. Builds fine on x86/x86_64 at least.

Cc: Russell King <linux@armlinux.org.uk>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/armada/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/armada/Kconfig b/drivers/gpu/drm/armada/Kconfig
index e5597d7c9ae1..043ca103ab3f 100644
--- a/drivers/gpu/drm/armada/Kconfig
+++ b/drivers/gpu/drm/armada/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_ARMADA
 	tristate "DRM support for Marvell Armada SoCs"
-	depends on DRM && HAVE_CLK && ARM && MMU
+	depends on DRM && HAVE_CLK && MMU && (ARM || COMPILE_TEST)
 	select DRM_KMS_HELPER
 	select FB_IOMEM_HELPERS if DRM_FBDEV_EMULATION
 	help
-- 
2.43.2

