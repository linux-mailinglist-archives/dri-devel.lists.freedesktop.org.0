Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C248708A9
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 18:52:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE211123EB;
	Mon,  4 Mar 2024 17:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HLwQyqWu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9E31123EA;
 Mon,  4 Mar 2024 17:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709574719; x=1741110719;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4DfBSXNJM2nONjEhv8h2o0Di7f5jtcMwhU0s7F1/xz0=;
 b=HLwQyqWuq6bfxlg3QlgRmt/mir+4hIMZ/hMZquoDVrew4b1nvn6Qvfbs
 v297J8itc9Z2z6rFsJCkAH3CHfMqkjQGOz20hCZVlO4DcsS5pon2lpug3
 GZ1yUmO7n3SQOp1ZmRSkisBPfiUfLWYF7qsjC8BzH8vFtO0MVR4wVi2em
 /UDXXLDROo0Cw+BZbMaQO3TkgcfTorYVuca41oLHgkrEYpa4Ifs0F0aHm
 +NxLvyvmmvlBn0QJuTJO1Hlc5pOnIxV012mLc2zJtlFfLEw1dqZnzRUhq
 NY/ZbEX5HK4MihrH08mNtdv+6mKL8aGuecd9yfCwPES5X9ARX5S/XjSYS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4209805"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="4209805"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 09:51:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="937040905"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; d="scan'208";a="937040905"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga001.fm.intel.com with ESMTP; 04 Mar 2024 09:51:55 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 42E2915C; Mon,  4 Mar 2024 19:51:53 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] drm/msm/hdmi: Replace of_gpio.h by proper one
Date: Mon,  4 Mar 2024 19:51:52 +0200
Message-ID: <20240304175152.1199270-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

of_gpio.h is deprecated and subject to remove.
The driver doesn't use it directly, replace it
with what is really being used.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index c8ebd75176bb..24abcb7254cc 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -5,8 +5,8 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include <linux/gpio/consumer.h>
 #include <linux/of_irq.h>
-#include <linux/of_gpio.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 
-- 
2.43.0.rc1.1.gbec44491f096

