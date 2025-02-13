Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E21A33536
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 03:10:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A8F810E9CD;
	Thu, 13 Feb 2025 02:10:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NJvL3uPG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2127610E24D;
 Thu, 13 Feb 2025 02:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739412616; x=1770948616;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ez8RQb16t/vIgeaFu10KqEbt7srveDlPGHxeet0G8bo=;
 b=NJvL3uPG3N8U+NNMFMq19CHKcYSbOwjdyZE9hSUy7xpHBz72hyMosukJ
 IP+b4CSmWV0m1k6tlQlByafZuGRIBsxsB+OaIrNouPZZ3a4cSxSESns59
 UZrIosGJGhORDZMYQhQEIqBXIBHnknsRgULefVa1iqhAsvcs2efZzbZEU
 pzp2GF2GpWNwf5bBQ1eXjXSBDZbp/J6vzbTpXNIsTx9hptWo5as+qjf0A
 rUGRCWvBAs0Z3WVXd1eXodbrSGe41/fiZiHeI9mTFhOdQDhrfa8XypOGc
 T+Wl46hX2ySSo3v8KTjtNrHk6Hr35g7WeYupXr9DlOpAEdfSLCUnRQCDy w==;
X-CSE-ConnectionGUID: JfOd+VEUSUa5uxmTOL6Q7A==
X-CSE-MsgGUID: EQKn1c6OS4WEJFpUaPvYSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="65455924"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="65455924"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:10:15 -0800
X-CSE-ConnectionGUID: XYugKiNySPKGGcwir8RFmg==
X-CSE-MsgGUID: 3LcxTcZATB2imkiXpNTWJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="117945054"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:10:15 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v5 07/32] drm/xe: Select DRM_GPUSVM Kconfig
Date: Wed, 12 Feb 2025 18:10:47 -0800
Message-Id: <20250213021112.1228481-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250213021112.1228481-1-matthew.brost@intel.com>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
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

