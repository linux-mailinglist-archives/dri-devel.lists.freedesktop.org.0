Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0B49F5A62
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 00:33:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D3110E64E;
	Tue, 17 Dec 2024 23:33:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z4q4q5Uq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D09210E41B;
 Tue, 17 Dec 2024 23:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734478389; x=1766014389;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iwX0eipER2lX/plSJH/5FlCnY8J5v2QV4BC06zKxeiw=;
 b=Z4q4q5UqrKwX2aYlvYWZ+Z1kAzLWLuNZI7CTC7QYQhhYTpWk7lJH4W75
 P7QsZK4CNLgftaSf0n8624XaEz03emh/HsghpQKWt4VsFephzDI3CdBLZ
 E7TfkR68M3Q2GfDCR9rxVPIt8RXxHI5BXxs/vuWFlOFDMHnZHilDK0lMk
 nss5HE+56fAZcyXUIs6pMviIVNct0sI/MiJM6RCDQfGXkjcR9oLMgzvYH
 /INpx3sdXHwuS338cpahhlYynTQVsvHCnQ0m6EVcPqOd1/R6QaROZ3Wu+
 GitITRedBK1QYaMNd6hoYiTPIEA3JpewYydUo6Z6SZ1a8dQv60E4BRyv1 w==;
X-CSE-ConnectionGUID: ZjPSKdOIRRaC4RHTLnKHhQ==
X-CSE-MsgGUID: 2Jgd/mUfQDOXAjbF+0A85Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="22517361"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="22517361"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:33:08 -0800
X-CSE-ConnectionGUID: 7/lmRPctSLOEkaXeg0c09Q==
X-CSE-MsgGUID: C3XwpzROSPK8ZZPKsULtHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102273428"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:33:08 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v3 06/30] drm/xe: Select DRM_GPUSVM Kconfig
Date: Tue, 17 Dec 2024 15:33:24 -0800
Message-Id: <20241217233348.3519726-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217233348.3519726-1-matthew.brost@intel.com>
References: <20241217233348.3519726-1-matthew.brost@intel.com>
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

Xe depends on DRM_GPUSVM for SVM implementation, select it in Kconfig.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index b51a2bde73e2..3a08e16bfada 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -39,6 +39,7 @@ config DRM_XE
 	select DRM_TTM_HELPER
 	select DRM_EXEC
 	select DRM_GPUVM
+	select DRM_GPUSVM
 	select DRM_SCHED
 	select MMU_NOTIFIER
 	select WANT_DEV_COREDUMP
-- 
2.34.1

