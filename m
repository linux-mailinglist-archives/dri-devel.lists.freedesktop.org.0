Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28342824979
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 21:16:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D093010E52D;
	Thu,  4 Jan 2024 20:16:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29DC510E52D;
 Thu,  4 Jan 2024 20:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704399409; x=1735935409;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tqG7RlWWHEOqpFbVm7rODWXXUAke7WBv1FJJrOLhXWo=;
 b=OJ/8KJc7rG9yEh8KJJxBus7+0Eo7KeJrYVSVRDl+t0nAdRl7rpifA1U1
 U4jpV0TG7ZxcJ/49exwoi1iszEgN4Ru74V5e2q//7HubHqfDLCOQdz2uO
 hYgyzoXnPyLN5zoWHEOYfJF5RQu/UpEc7domGjZnjoaMQPkHskoee6P26
 kGdCKR944g5ruYEm8FiKAROM25Cv62W+G4D9mqnwjhE5RgtYpJeDcaacb
 m/3t8MX1PS2ZHwFZctDCS2+fDmNLw81VQkr3pTrzXGfC0PXj9BxCeQFNs
 ua22APXJtv1fBh0tMfQOQ83uDjDwmNFusrwD4CHnaXKxNMwjODgmpsOSk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="15976684"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; d="scan'208";a="15976684"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 12:16:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="871037878"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; d="scan'208";a="871037878"
Received: from pdelarag-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.36.32])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 12:16:43 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/3] drm/hisilicon: include drm/drm_edid.h only where needed
Date: Thu,  4 Jan 2024 22:16:31 +0200
Message-Id: <20240104201632.1100753-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240104201632.1100753-1-jani.nikula@intel.com>
References: <20240104201632.1100753-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, John Stultz <jstultz@google.com>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Yongqin Liu <yongqin.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reduce the need for rebuilds when drm_edid.h is modified by including it
only where needed.

Cc: Xinliang Liu <xinliang.liu@linaro.org>
Cc: Tian Tao  <tiantao6@hisilicon.com>
Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Yongqin Liu <yongqin.liu@linaro.org>
Cc: John Stultz <jstultz@google.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h  | 1 -
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
index f957552c6c50..207aa3f660b0 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
@@ -18,7 +18,6 @@
 #include <linux/i2c-algo-bit.h>
 #include <linux/i2c.h>
 
-#include <drm/drm_edid.h>
 #include <drm/drm_framebuffer.h>
 
 struct hibmc_connector {
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
index 8c6d2ea2a472..94e2c573a7af 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
@@ -14,6 +14,7 @@
 #include <linux/io.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_simple_kms_helper.h>
-- 
2.39.2

