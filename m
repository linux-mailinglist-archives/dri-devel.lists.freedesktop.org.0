Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4218B8723B3
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 17:09:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64DA3112BC7;
	Tue,  5 Mar 2024 16:09:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GmvtfzIC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B6A112BC7
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 16:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709654948; x=1741190948;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=l8j9YGwBajGsEYs3O0CBsoybRmGNNuKkvwq0pqLt5YI=;
 b=GmvtfzICdR/+8VXKOhS1NPiECAOICde7UTv6B3uYCHFbvUnnx71MhEW9
 Yr1YW/qb/d+WHTaKpF0vgRv0ij7FIlZROFomE57vUrEQIOI8oW+nbjAKP
 DnnzyyMC6EVc6yIyLx11D2NyL8VHjsCeWE9brPZ0s5NaMo3U2q2WNOWrD
 4ZjIo3+XXx36/D+qLhUy/5O13xAuGfZqx9yc8eVV12xkl4Gt0RbXROT9B
 z+RcBe04l/Q1B/o2YAswLhjVc0IakU0viCoxhad2HiqPZXnpZiR7sub2W
 Af+xF9tM4sVTdDk1o1R3yD3V5mTa0xaeJ7VAIpIpPOXTdZonGZTsjsFI1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4077672"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4077672"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 08:09:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="937042661"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="937042661"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga001.fm.intel.com with ESMTP; 05 Mar 2024 08:09:04 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 8DCA71A6; Tue,  5 Mar 2024 18:09:03 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v1 1/1] drm/gma500: Remove unused intel-mid.h
Date: Tue,  5 Mar 2024 18:09:02 +0200
Message-ID: <20240305160902.1363835-1-andriy.shevchenko@linux.intel.com>
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

intel-mid.h is providing some core parts of the South Complex PM,
which are usually are not used by individual drivers. In particular,
this driver doesn't use it, so simply remove the unused header.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/gma500/oaktrail_lvds.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds.c b/drivers/gpu/drm/gma500/oaktrail_lvds.c
index d974d0c60d2a..72191d6f0d06 100644
--- a/drivers/gpu/drm/gma500/oaktrail_lvds.c
+++ b/drivers/gpu/drm/gma500/oaktrail_lvds.c
@@ -11,8 +11,6 @@
 #include <linux/i2c.h>
 #include <linux/pm_runtime.h>
 
-#include <asm/intel-mid.h>
-
 #include <drm/drm_edid.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_simple_kms_helper.h>
-- 
2.43.0.rc1.1.gbec44491f096

