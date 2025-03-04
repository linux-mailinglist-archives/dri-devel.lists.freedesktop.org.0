Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67386A4DAA5
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 11:33:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10BE510E573;
	Tue,  4 Mar 2025 10:33:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c+2nzYLm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A25E10E567;
 Tue,  4 Mar 2025 10:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741084414; x=1772620414;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hb5c4GPydiymsPtEiI0otTPREpEET9yBwgK3A5XXrvg=;
 b=c+2nzYLmzLiOiVtFTPnUYCmulBdUt/Ydk/b79Ma4RxOTWJrNrIp0mt2R
 tLPhJgn4JnWkGCDgwh6Ux+rmNLkLnbN2+iqTM3Wpj931GNOxG/SsA6kvK
 0//Sq4ED+brFXFA6q8DAqn4eTDlV+F8iieQffKU+dsxspdj7EOAfyAUE0
 SdCQj6eJRJpAghNvQWy6/uL5oRp6ihmb4KoFBlDc7W12e1YChbM+htWZs
 k/rR62UJ5BOWrJYHGnsYFkrb+M3kJkz4qS0l/mePZ7r9R6cIBXyoPm+D3
 FJVeINw5GjN4rQBcmPUm/e+b3zmPK7PzCLcyM8MPB6udnh8UIJJSXcDse A==;
X-CSE-ConnectionGUID: hMOfbZjVR4+Ax0KqTecsGQ==
X-CSE-MsgGUID: s6Q8cP22T3ulOIXQRknrxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="29584069"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="29584069"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 02:33:33 -0800
X-CSE-ConnectionGUID: fmQRCKsZS3WFy+VCz+ApmQ==
X-CSE-MsgGUID: 4bz5/2qrSuGDtry0xGVyyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="118063964"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa009.jf.intel.com with ESMTP; 04 Mar 2025 02:33:27 -0800
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 02/10] drm/i915/display: Introduce HAS_CASF macro
Date: Tue,  4 Mar 2025 15:58:49 +0530
Message-Id: <20250304102857.326544-3-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250304102857.326544-1-nemesa.garg@intel.com>
References: <20250304102857.326544-1-nemesa.garg@intel.com>
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

Add the macro for casf HAS_CASF.

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_device.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
index 717286981687..238488c4c3aa 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.h
+++ b/drivers/gpu/drm/i915/display/intel_display_device.h
@@ -191,6 +191,7 @@ struct intel_display_platforms {
 #define HAS_VRR(__display)		(DISPLAY_VER(__display) >= 11)
 #define HAS_AS_SDP(__display)		(DISPLAY_VER(__display) >= 13)
 #define HAS_CMRR(__display)		(DISPLAY_VER(__display) >= 20)
+#define HAS_CASF(__display)		(DISPLAY_VER(__display) >= 20)
 #define INTEL_NUM_PIPES(__display)	(hweight8(DISPLAY_RUNTIME_INFO(__display)->pipe_mask))
 #define I915_HAS_HOTPLUG(__display)	(DISPLAY_INFO(__display)->has_hotplug)
 #define OVERLAY_NEEDS_PHYSICAL(__display)	(DISPLAY_INFO(__display)->overlay_needs_physical)
-- 
2.25.1

