Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E27A3EC19
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 06:08:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14B1B10EA1E;
	Fri, 21 Feb 2025 05:08:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XfaWaGZk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A3B110EA1E
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 05:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740114510; x=1771650510;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TVYoOTVKyEAencSjBAyeJyQSl8CPe1x13zL0NhN2xus=;
 b=XfaWaGZkfPX7fniWO1cypJH3WSOHMk/H7yEdLSaz/QnWuHuA+JXA/DXB
 0AI0qDJUe1+8jPvpFjqjPsf4uf9m4O0rBmi2wcWanOkSsjW58Yh7bnzqg
 anZx5hedkP59zGWgf4yrr6cLQoZQp+Znk+vdnI4euwH9h0tK5WtEzsap6
 wuvwX+G0VHGSqMGUiwK3nGzew8m+Jz/ONTrqn96eL5oOEdDbSZrZcC0jl
 aWzLFOhrQqOFQVu2NBx0b83HIc1ymLJJzFOdu3HyYXZUeKR5mxwYPmFZ6
 ei6ENdnqNiDoZ/Z/CvQWUkRKfsg6h8MdfTvifZX6pKgxQwDemqWw0yl1i Q==;
X-CSE-ConnectionGUID: qX5CNetVQpuDPd/FqdTWeA==
X-CSE-MsgGUID: d0+mH74fQt63dQJ/OfuFWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="28518732"
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="28518732"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 21:08:29 -0800
X-CSE-ConnectionGUID: +w0BIQlaQHaI+AIUSMhEyg==
X-CSE-MsgGUID: I4ZCIjD+TxeYCAuuxxPisg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="115459304"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa008.fm.intel.com with ESMTP; 20 Feb 2025 21:08:27 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: arnd@arndb.de, gregkh@linuxfoundation.org,
 andriy.shevchenko@linux.intel.com, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 2/2] drm/draw: include bug.h
Date: Fri, 21 Feb 2025 10:38:04 +0530
Message-Id: <20250221050804.2764553-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221050804.2764553-1-raag.jadav@intel.com>
References: <20250221050804.2764553-1-raag.jadav@intel.com>
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

Directly include bug.h for WARN() helpers instead of relying on
intermediate headers.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/drm_draw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_draw.c b/drivers/gpu/drm/drm_draw.c
index cb2ad12bce57..0a0e1eebf481 100644
--- a/drivers/gpu/drm/drm_draw.c
+++ b/drivers/gpu/drm/drm_draw.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/bits.h>
+#include <linux/bug.h>
 #include <linux/iosys-map.h>
 #include <linux/types.h>
 
-- 
2.34.1

