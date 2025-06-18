Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4246ADF680
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 20:57:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0364710E91D;
	Wed, 18 Jun 2025 18:57:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VPGDRFxz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DABC10E921;
 Wed, 18 Jun 2025 18:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750273020; x=1781809020;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wBhqdHFT6q92MdaZKb3oeHHxeJu1lqs/E+7CU/KnemU=;
 b=VPGDRFxziDKV2sDWaupmmUN8JNMPaN7LZoYRJvHwAorbT4pkWNkX+ozi
 Cdouf9Q7jI4DwAq3/cMCF/aTb5ByhLkuiOSH9K2tP6uL0YHLwoEsZVwRv
 JHsUvhXpwozZfqTDLkFEJvvOixhLsvEv6J+vpeoDmtM6EYMC9nxaVQ2kU
 tJJ3GsnXE2heQV+sBdlQtfbHfDcaDnuH2g8nGcFQs9jh40Hy9Q9NUL+b0
 2mEywGYFqqJ28Lw4tXdN7JJjrYz5bvHL1f3X8YaISiV/5ZHnM0PefWH2O
 PfKdq5QXprCZBsOmPKgj54o5jeY0N2S3Afn602dDu4QyhEzHDVLJNkwWX g==;
X-CSE-ConnectionGUID: 2UFHhlsJSbimk95hVsJKlA==
X-CSE-MsgGUID: xP03j336TMCPnXAaEZZL1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52210232"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="52210232"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 11:57:00 -0700
X-CSE-ConnectionGUID: YA/pEJfJSCm3aBMB9JG+MQ==
X-CSE-MsgGUID: y8jRlaalRlyeXScKPUB1Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="153952160"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 11:56:57 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com, jgg@nvidia.com
Subject: [PATCH v3 10/10] [CI]drm/xe/xe_late_bind_fw: Select
 INTEL_MEI_LATE_BIND for CI
Date: Thu, 19 Jun 2025 00:30:07 +0530
Message-Id: <20250618190007.2932322-11-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250618190007.2932322-1-badal.nilawar@intel.com>
References: <20250618190007.2932322-1-badal.nilawar@intel.com>
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
index 30ed74ad29ab..b161e1156c73 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -44,6 +44,7 @@ config DRM_XE
 	select WANT_DEV_COREDUMP
 	select AUXILIARY_BUS
 	select HMM_MIRROR
+	select INTEL_MEI_LATE_BIND
 	help
 	  Driver for Intel Xe2 series GPUs and later. Experimental support
 	  for Xe series is also available.
-- 
2.34.1

