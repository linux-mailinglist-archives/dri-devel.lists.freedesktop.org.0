Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D931A224BC
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 20:51:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8501610E89E;
	Wed, 29 Jan 2025 19:51:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OFUZQaDB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 368A110E177;
 Wed, 29 Jan 2025 19:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738180282; x=1769716282;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1FygonD18OamaEhjLZU5Q2+StXuwgbIB1KH1HiHD1u8=;
 b=OFUZQaDBzs8srz0SlMZBkL0/03AfOC5Yp60MvygW/bK8R7GYfyPcmq8L
 g7NZNIsnZKICs7rD0FUjGPXdKA+HHatcEOtpISY31dO6DqkQGwRtHyftm
 4Ac7h7nlobvJSxtfwTOBCCTKUpdcsQdUVZnzPpW41WpoMppoh7P2UJ+lu
 Yvo11kaw0HWn9E+vTHgXJOd5Vygp3uzFUrLCqvCuDVcOVy4LwP1O3Dwo5
 MPh/uZT1DRm+M72VDEo26SoMYwjb+JLhQx6byzXnOFJX3dC9SshbHg4sx
 zFN3/NA8raeAZxFB12eQHFiJ10rv7ST2VZnVsh1wDXt81a7GDhWG8TPDM g==;
X-CSE-ConnectionGUID: n3oHFTnDTjSGBW49IZtHqQ==
X-CSE-MsgGUID: 8wF/FCNzTu6uGMMzrqB68w==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50132752"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50132752"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:51:21 -0800
X-CSE-ConnectionGUID: AUC67cH8RBmOJMiFgpwmjw==
X-CSE-MsgGUID: SPkPL2GSQbikaV0tDXmqZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="132392122"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:51:21 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v4 07/33] drm/xe: Select DRM_GPUSVM Kconfig
Date: Wed, 29 Jan 2025 11:51:46 -0800
Message-Id: <20250129195212.745731-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250129195212.745731-1-matthew.brost@intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
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
index 99219c16e8aa..60b922f75001 100644
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

