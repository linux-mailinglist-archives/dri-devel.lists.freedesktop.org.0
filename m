Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8919BAF9933
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 18:46:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C0810E365;
	Fri,  4 Jul 2025 16:46:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BA4S3YQ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 119E710E36B;
 Fri,  4 Jul 2025 16:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751647605; x=1783183605;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/UhG+PrAWuDRKhnrnXNOPvjeJ896dmbS6DO0ehBJdK0=;
 b=BA4S3YQ5jj6vYkeGTrjpcSP5OnzqxCipTXWErutVanSi11c8Mm0t5p3O
 oveEuT9Bcrna1JgarVrEc53hNPBoKNTnEo3IRFMhSQwmHHgNwJNuny6sJ
 MuKJO5bmMqX78X2/RPtHOyMNjf0u7otIqZHZOp6dQN4pZPDdqNi5xocNe
 1HBazqICWVLdXzVxXuFCwudgyQT1S84hopSbfVqIyyomHKHX8PaIH1y91
 ab9U5wNxNW+QXIS8vO9n1CDxJgMknYHJaYUmm6mFlLnjUDNSFDTZlsBKW
 CmUQO1v4FSPowb4EOJ5hxqU9S/uHCzfEUXZAYdb7OSsBX6II4cub+l8u3 g==;
X-CSE-ConnectionGUID: 5m248vjrQ+mh4tFeaAg3Nw==
X-CSE-MsgGUID: OU8wC5ZPRpOk7tzTGoZYDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="57755831"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="57755831"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 09:46:45 -0700
X-CSE-ConnectionGUID: NseANNQ9TjCwt2C3UgXdKw==
X-CSE-MsgGUID: a4w/rHn/TEGGKxh6xCVT2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="154424747"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 09:46:43 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com
Subject: [PATCH v7 10/10] drm/xe/xe_late_bind_fw: Select INTEL_MEI_LATE_BIND
 for CI
Date: Fri,  4 Jul 2025 22:20:38 +0530
Message-Id: <20250704165038.1464460-11-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704165038.1464460-1-badal.nilawar@intel.com>
References: <20250704165038.1464460-1-badal.nilawar@intel.com>
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

