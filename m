Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3269A47650
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 08:08:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D3B10E247;
	Thu, 27 Feb 2025 07:08:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hr92AC/d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE3F10E152
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 07:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740640107; x=1772176107;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ITwkKu7/jE4M2GGDC8Gq0PXRGW8IylfszRaf/ug78Vw=;
 b=Hr92AC/dZ4qcG6fJdM+yDt1M0lEzeEzKB864RMV/C90a/6m6oqAm26dk
 VUL666gGz+Scs44Vwio4Io+zbqW4MsPD3by3IBKgCbBqn9ZFsNyb5YaTW
 7xfYawRIVExoOYRBmxz1W+Zlr/SKJdF2RnLj/3vBseKeSp5D4OXQ2nI9D
 7wPEpfJKIIsNt9ncsxjV4A+EB/jXkOvSOPnXmbdWXoVPY6wayBPkKIYW1
 c0E17+GbeRdzhW8Xge0XOGxcripAzoPLotQF3kgPdjqpu2cFlu9X2ivf/
 A37JJ3lje/qCBy+OZlCqHyafQoTFzTAsA64lBD7A0XnPTauBU5MoK0aNG g==;
X-CSE-ConnectionGUID: sZ3TxP4xSS+FwLmyNh1wzA==
X-CSE-MsgGUID: C3ulWaODQuKP9WIBkr6uKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="52505370"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="52505370"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 23:08:27 -0800
X-CSE-ConnectionGUID: 4oh7oMzAQzyc0T0iOEV00Q==
X-CSE-MsgGUID: y/LQkAcrQ2G+eeVi0tTkoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="154125499"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa001.jf.intel.com with ESMTP; 26 Feb 2025 23:08:24 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: arnd@arndb.de, gregkh@linuxfoundation.org,
 andriy.shevchenko@linux.intel.com, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Raag Jadav <raag.jadav@intel.com>, Simona Vetter <simona.vetter@ffwll.ch>
Subject: [PATCH v3 1/2] drm/draw: include missing headers
Date: Thu, 27 Feb 2025 12:37:46 +0530
Message-Id: <20250227070747.3105451-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250227070747.3105451-1-raag.jadav@intel.com>
References: <20250227070747.3105451-1-raag.jadav@intel.com>
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

Include headers for the symbols directly used in this file instead of
relying on intermediate headers.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Acked-by: Simona Vetter <simona.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_draw.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_draw.c b/drivers/gpu/drm/drm_draw.c
index cb2ad12bce57..385eb5e10047 100644
--- a/drivers/gpu/drm/drm_draw.c
+++ b/drivers/gpu/drm/drm_draw.c
@@ -5,6 +5,8 @@
  */
 
 #include <linux/bits.h>
+#include <linux/bug.h>
+#include <linux/export.h>
 #include <linux/iosys-map.h>
 #include <linux/types.h>
 
-- 
2.34.1

