Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E87757E2057
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 12:48:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0619410E2D1;
	Mon,  6 Nov 2023 11:48:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8694910E2D1;
 Mon,  6 Nov 2023 11:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699271332; x=1730807332;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PDVSGA6kVd3bXyFswngOPT/uKSGr5hw3HAvYsU0Ow3U=;
 b=nVzRPKsjXR6AzpuVlu7eV+1yZAgr77KpaPRm00ujQROl+0yHrdXK1WIe
 jkhUndHjUqeufWpitdNMPXaPo5F4Qdh02qUsLB0fBQM1Iu1oB6MPGxrgq
 LHQxZxs8y2wKkx8VL7kuIWHfua6t6dWrf51qRJ6XG6gS+5C1RujLJ67uQ
 uMivBFz/J8LGbvIwmS/G360boPqeZVa3+7CiInnc1Z0nzSuqAkwzLo3Ly
 5cHoghFsTkbGaBMXC5Y5SvAOP2fF3dsWezsxGkLFlgkeTcbSA/1Bre+uM
 LTkrpbWtPC/bo3ItyfFpLF8d/ohmYW4T4oLMnNV3Jpu/H+Y9V1BQf18x6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="475493828"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="475493828"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:48:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="832697693"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="832697693"
Received: from lapeders-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.193])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:48:49 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/gpuvm: Fix deprecated license identifier
Date: Mon,  6 Nov 2023 12:48:27 +0100
Message-ID: <20231106114827.62492-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Danilo Krummrich <dakr@redhat.com>, David Edelsohn <dje.gcc@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"GPL-2.0-only" in the license header was incorrectly changed to the
now deprecated "GPL-2.0". Fix.

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Danilo Krummrich <dakr@redhat.com>
Reported-by: David Edelsohn <dje.gcc@gmail.com>
Closes: https://lore.kernel.org/dri-devel/5lfrhdpkwhpgzipgngojs3tyqfqbesifzu5nf4l5q3nhfdhcf2@25nmiq7tfrew/T/#m5c356d68815711eea30dd94cc6f7ea8cd4344fe3
Fixes: f7749a549b4f ("drm/gpuvm: Dual-licence the drm_gpuvm code GPL-2.0 OR MIT")
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 2 +-
 include/drm/drm_gpuvm.h     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 08c088319652..b80d4e1cc9b7 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0 OR MIT
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
 /*
  * Copyright (c) 2022 Red Hat.
  *
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index bdfafc4a7705..c7a0594bdab1 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
 
 #ifndef __DRM_GPUVM_H__
 #define __DRM_GPUVM_H__
-- 
2.41.0

