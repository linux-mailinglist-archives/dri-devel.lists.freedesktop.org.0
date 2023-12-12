Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AF280EEA1
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 15:25:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46BA310E5E5;
	Tue, 12 Dec 2023 14:25:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD5310E624
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 14:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702391138; x=1733927138;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yo1myB2skQnabggx/oybEwE0xAIl8AZBSbq/eCvFp7E=;
 b=Au3ptiRa6OuX7rbs0T5zPQESt4QtljBQ0lvQfcdtKp0rXKiZV44LLpMr
 rmxOb4S+IBPQ6ib7pZsI0+tpNEkIVK0s383A7TB1EK3KpStwEnmQNEcte
 rzJO5BRPen4RifJkz9NZpiTVZXkKHcDPesIHI7F+PnwMo1+xsT/VSfzlp
 RkPJZo8nkM20pplHqVVkb8nWJZWJ+cqPURPpGF3axqeAIoO2ELR8UsMwJ
 n5XNVroURc0A5FaSEnUjAf3Phxs/sIaoKy/gfFSWuE4z1y6bqV+0b6GmN
 +U0kw4PbKXjHmZcsKTUHUKMalaESYqxMLDt8SwoX3ATbZxC9x+wxLXKkx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="1942678"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="1942678"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 06:25:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; d="scan'208";a="21534258"
Received: from ggilardi-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.252.49.147])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 06:25:35 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/hisilicon: include drm/drm_edid.h only where needed
Date: Tue, 12 Dec 2023 16:25:30 +0200
Message-Id: <20231212142530.3826692-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 jani.nikula@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reduce the need for rebuilds when drm_edid.h is modified by including it
only where needed.

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

