Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C75AF5F03
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 18:48:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C5B410E761;
	Wed,  2 Jul 2025 16:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a35HUtyO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C7410E765;
 Wed,  2 Jul 2025 16:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751474903; x=1783010903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/UhG+PrAWuDRKhnrnXNOPvjeJ896dmbS6DO0ehBJdK0=;
 b=a35HUtyOCA0MwSmQ61mLNKwTF8OUv7xC075LY7BanFC2HVDcIU4Y2EuO
 wMm1lqcgXR9Jngl8c9pp/HznhtTLqpbU4Itn84YRGLmCWwYrfXfVtn5vM
 D7VnZG3077bxQhWEKoybm0nwCO8Ply7b2lUrGl6uN1C9pE64u9Lq0HbOP
 09MxotgbzkOLn8spY8N6Dk7WaCZTMpHFPx+NWtOM+vCWs4n8G59Ex95ht
 MQj6IaBLuEv5ZM/WsSjs0P8wQW6woJEFohDQmbcltgx+57knvhjDy7TWv
 CpYNPrYH6aF/OL5EpNSQyOa9RHqqiLbJcEVmfhviC42cWPVzzDCj9r5uq g==;
X-CSE-ConnectionGUID: X1CdRv0eRaK0dsdzv0u3OA==
X-CSE-MsgGUID: Vck5hhn1R06MPnicZRrHMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64380778"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="64380778"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 09:48:23 -0700
X-CSE-ConnectionGUID: HfLPk9H5RgC66SksB7ji/g==
X-CSE-MsgGUID: +3JOh8DWQ96JHGtNuBumYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="153535675"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 09:48:21 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com
Subject: [PATCH v5 10/10] drm/xe/xe_late_bind_fw: Select INTEL_MEI_LATE_BIND
 for CI
Date: Wed,  2 Jul 2025 22:22:16 +0530
Message-Id: <20250702165216.557074-11-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250702165216.557074-1-badal.nilawar@intel.com>
References: <20250702165216.557074-1-badal.nilawar@intel.com>
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

Do not review

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index f66e6d39e319..ef3f4807b0b3 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -45,6 +45,7 @@ config DRM_XE
 	select WANT_DEV_COREDUMP
 	select AUXILIARY_BUS
 	select HMM_MIRROR
+	select INTEL_MEI_LATE_BIND
 	help
 	  Driver for Intel Xe2 series GPUs and later. Experimental support
 	  for Xe series is also available.
-- 
2.34.1

