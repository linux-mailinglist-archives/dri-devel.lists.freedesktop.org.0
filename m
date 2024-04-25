Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDB78B220B
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 14:56:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5EFB11A42F;
	Thu, 25 Apr 2024 12:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JNot6EmC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F42011A42F
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 12:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714049791; x=1745585791;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PNoj1MIfk8TeZSxThxuQAL8m73MC3/EFgmLZCQqIs/M=;
 b=JNot6EmCUXv9RoRQeKf/cV5qrE+rrAkMgAYS5ARlQjuGXBDOPArMOguw
 Z4/m7l+tMI6uMawkTeoZXwztpIzOQD2TSUJSFakphMwW6etiL4cgigq7L
 gNi8gTH19QmMXnVCkp78y4ZVH2Vs2zrRelPEo3AziQ3UTb6HQ+tbNWw0W
 SI+Va26+1ZRfUZfRdYc62gR2i0UgfA2NZVQFI1ba5R32QCfbpEzdmiONx
 Rc++V3mNW7S7s+3eIA+nVa5Y/ZKqsAHAP6J+EpTf9VysNOzXnTpvb26J5
 Qf3kMZd0wjaSLzO5AMyC9T20vqUwrCZl0u2Xif+MEmMJWpsCUBk1kn2Dn g==;
X-CSE-ConnectionGUID: TzUnJk9eS+eW3g3qvWuqoQ==
X-CSE-MsgGUID: nesqZojrSni+5aakGnZDYw==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9843309"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="9843309"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 05:56:31 -0700
X-CSE-ConnectionGUID: YX+4DFKDRyCnSFndfN4pCQ==
X-CSE-MsgGUID: RdalsdeoRf+p/FneSHnwRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="25127583"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa008.fm.intel.com with ESMTP; 25 Apr 2024 05:56:29 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id C7DC4586; Thu, 25 Apr 2024 15:56:27 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] drm/mipi-dbi: Add missing MODULE_DESCRIPTION()
Date: Thu, 25 Apr 2024 15:56:26 +0300
Message-ID: <20240425125627.2275559-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
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

The modpost script is not happy

  WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/drm_mipi_dbi.o

because there is a missing module description.

Add it to the module.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/drm_mipi_dbi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index daac649aabdb..ee6fa8185b13 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -1475,4 +1475,5 @@ EXPORT_SYMBOL(mipi_dbi_debugfs_init);
 
 #endif
 
+MODULE_DESCRIPTION("MIPI Display Bus Interface (DBI) LCD controller support");
 MODULE_LICENSE("GPL");
-- 
2.43.0.rc1.1336.g36b5255a03ac

