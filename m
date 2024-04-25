Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0C78B1FCA
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 13:04:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2393710EA0B;
	Thu, 25 Apr 2024 11:04:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Srtvyshk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7FFE10EA0B
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 11:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714043042; x=1745579042;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FDb6y1ucN+9xpvwKmSl9tirQC+Prtbp5seNaPmvjRyI=;
 b=Srtvyshk5H42/Dq7V5UfPgVw7g/8uETWAOvhzF7UkZYtmj6k6V8Ar+gg
 M2h1TAb6h2b9AJoE5fSmANIAY0D8zohLXyVBOvZwOXOzvzm+oW/t+esU1
 Xpxw35/SsX557mI+k2ILbof3C6ojTJcXXkPVLYvuIq6lAUA+5Y7Qy8NyM
 0xWN4fw5RS4XzlqdXeIFq8kRvGu1JQ7JlhB7Vkg2T0zLNxBzCD+PG7A5X
 tjREeh+D0NVP2bX9hEv8o6f59Md2KQIjhT/8Cra8e+9aWJOF+IFk3crC3
 AYeauaZlNliaLyJcomJwm9RY931G1VyhjG2EIQ8slYOumRB9Pm1y+lsSt w==;
X-CSE-ConnectionGUID: 2KM6NV/3RHaAlFVjZIkyXA==
X-CSE-MsgGUID: b8CM3t1FRFSGrkm6PyHU9A==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9937492"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="9937492"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 04:04:01 -0700
X-CSE-ConnectionGUID: eKgz0sB5S1W92TUHpwfksQ==
X-CSE-MsgGUID: oEvrvPwfTyubALCNURiChw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="25521191"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 04:04:00 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Maxime Ripard <mripard@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>
Subject: [PATCH] MAINTAINERS: fix LG sw43408 panel driver drm-misc git URL
Date: Thu, 25 Apr 2024 14:03:52 +0300
Message-Id: <20240425110352.1374729-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

The drm-misc git repo has moved to Gitlab. Fix the URL.

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Caleb Connolly <caleb.connolly@linaro.org>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d6327dc12cb1..23997d2ea91c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6766,7 +6766,7 @@ DRM DRIVER FOR LG SW43408 PANELS
 M:	Sumit Semwal <sumit.semwal@linaro.org>
 M:	Caleb Connolly <caleb.connolly@linaro.org>
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
 F:	drivers/gpu/drm/panel/panel-lg-sw43408.c
 
-- 
2.39.2

