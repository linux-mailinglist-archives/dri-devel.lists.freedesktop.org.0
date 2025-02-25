Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A64A43439
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 05:42:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DEFC10E546;
	Tue, 25 Feb 2025 04:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mIetbtDM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5064610E539;
 Tue, 25 Feb 2025 04:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740458531; x=1771994531;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MsViuX+51i/De6atBeq7IfrhyBnHjJDq61ETBvPCxNc=;
 b=mIetbtDMMReEevCvHT08eoEsWVI5wGxeD1WCeHh0ZSxwuCW/p3jpzXVu
 lL1d1GZBufdIFSMZotuVvHUspyP9BQRi9BFG5pZGiZbRkvW5GBWubfUiB
 yg7c6nsVzx2I+BdFgdgnnhglpx3HMBCb1bV3Bhk0MVGzvnxk7JBtzIIkw
 7GLA1AsraxOikK1X2VU6FFFOkt5XKcYDpjnJyC9r2WUBb3Gmrd/vbWv7P
 0IyvuRW2t6IRd+nT4ckcy+/ENLZo0wggue/FKIvpt2hWy55MFdrGetDh+
 5LHbQHwbB0TedGMC9nI4KdN87jsgt8k6g3I3BPU+iQe+hvzFlF0YzcEv0 Q==;
X-CSE-ConnectionGUID: nVJGnATLQSGy/QhPOTh8tg==
X-CSE-MsgGUID: NLworAqtQkKps8pbh3JBqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51884943"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="51884943"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 20:42:11 -0800
X-CSE-ConnectionGUID: ezqUrH8ZSbqCGI0H0uJwWA==
X-CSE-MsgGUID: 2yprTJMzSnWNxj5VZeKwvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="116290265"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 20:42:10 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v6 07/32] drm/xe: Select DRM_GPUSVM Kconfig
Date: Mon, 24 Feb 2025 20:42:46 -0800
Message-Id: <20250225044311.3178695-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250225044311.3178695-1-matthew.brost@intel.com>
References: <20250225044311.3178695-1-matthew.brost@intel.com>
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

Xe depends on DRM_GPUSVM for SVM implementation, select it in Kconfig.

v6:
 - Don't select DRM_GPUSVM if UML (CI)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 99219c16e8aa..d3a1571db497 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -39,6 +39,7 @@ config DRM_XE
 	select DRM_TTM_HELPER
 	select DRM_EXEC
 	select DRM_GPUVM
+	select DRM_GPUSVM if !UML
 	select DRM_SCHED
 	select MMU_NOTIFIER
 	select WANT_DEV_COREDUMP
-- 
2.34.1

