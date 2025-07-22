Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B414B0D6C1
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 12:04:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F052610E28D;
	Tue, 22 Jul 2025 10:04:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MXOaafsc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E1E10E28D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 10:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753178674; x=1784714674;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9u7YXSMqXgwEJA3MP5jCiJu6R8QpV+612aT7/Wz7sRQ=;
 b=MXOaafscYqu58HIC8R4dfHW5L9KqvGNQRJ1FGQiIUy2zazQFKCtaljcU
 OUXk2E6nJm1McAhM1SKbvXwPAQ0gAT3LezvXwBS3ztW92aoryo1RFiYgE
 tWIF1T6s5DhN7Cct72C2zlMXdvTvOcItrL0k8pbkRsdzkfp2O+54NYUX6
 CQZZK2KhxwvM5yivPWOsIvUi440lDiPWwL4fVBp0/I7cgFwk/Dy2hYPgb
 4fivlcGkYXXyfj3tDPuMSsXcW3jwXOM3C79cdiRgJ5BQ9g2YhF3pZY3CX
 FyXbVaI6FXe839zxTzTkhTNLIKy4e7SgMcOe5ZAauKTnZS2rqQcoIthH+ g==;
X-CSE-ConnectionGUID: XphYgbLeRe2DBcawCobqKQ==
X-CSE-MsgGUID: Aw+X1LLWQKyZlzTCg9fPbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="55265640"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="55265640"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 03:04:31 -0700
X-CSE-ConnectionGUID: rYgAIWQDRv2SUOtYs7LeDg==
X-CSE-MsgGUID: h7jRy9CJQPCC9KcXmrlnOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="159416282"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 03:04:30 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jeff.hugo@oss.qualcomm.com, lizhi.hou@amd.com,
 karol.wachowski@linux.intel.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH] MAINTAINERS: Add new intel_vpu maintainer
Date: Tue, 22 Jul 2025 12:04:21 +0200
Message-ID: <20250722100421.500984-1-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
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

Add Karol as a new intel_vpu maintainer.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7e7515a412e9d..22dc118f43d89 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7386,6 +7386,7 @@ F:	include/linux/power/smartreflex.h
 DRM ACCEL DRIVERS FOR INTEL VPU
 M:	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
 M:	Maciej Falkowski <maciej.falkowski@linux.intel.com>
+M:	Karol Wachowski <karol.wachowski@linux.intel.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
-- 
2.45.1

