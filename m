Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 731D1659B6B
	for <lists+dri-devel@lfdr.de>; Fri, 30 Dec 2022 19:35:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 713B910E47C;
	Fri, 30 Dec 2022 18:35:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B010010E478;
 Fri, 30 Dec 2022 18:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672425309; x=1703961309;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=K3g9Djv+OdCbE5nnOKI8AcxynoI/piYMCtrawMXeqlQ=;
 b=aLcd63dePzhDpFmmHHal0hVfYUEHAGM/dVHcQrwH2kB3LnrlE+vFWg1d
 kCeY0PgWOIdIQzWqZQg+UUKJD1Zi5Fxi1lPMSRCd45O9zpmUICR4GBUzy
 6ZuHT2H3/IsATCIaGzJBLeu2BSfzI9gf3ZIBcrTEZS70cwqcB8dHplNyw
 gqL7/g4CK5YQb3T1hbvPpAJ1X1vkOzI0GOv5CSWwXblm78AImAAHpJ2tE
 c+j6I/jcJa0XGkT5qlnSpGLX6T81eHc2M55qLDmxCwVCiMaUoRbfYFXqn
 VEcRDwnACqE2119zHKSeCYQ97TO441fBBdi1pSGo6E4IIQanh1JfUzd/x Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10576"; a="323227795"
X-IronPort-AV: E=Sophos;i="5.96,288,1665471600"; d="scan'208";a="323227795"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2022 10:35:09 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10576"; a="686320429"
X-IronPort-AV: E=Sophos;i="5.96,288,1665471600"; d="scan'208";a="686320429"
Received: from nirmoyda-desk.igk.intel.com ([10.102.13.19])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2022 10:35:06 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Use "%zu" to format size_t
Date: Fri, 30 Dec 2022 19:35:00 +0100
Message-Id: <20221230183500.20553-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
Cc: kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, andrzej.hajda@intel.com, rodrigo.vivi@intel.com,
 mchehab@kernel.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Switch to %zu for printing size_t which will
fix compilation warning for 32-bit build.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index e767791e40e0..114443096841 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -238,7 +238,7 @@ static int shmem_get_pages(struct drm_i915_gem_object *obj)
 			goto rebuild_st;
 		} else {
 			dev_warn(i915->drm.dev,
-				 "Failed to DMA remap %lu pages\n",
+				 "Failed to DMA remap %zu pages\n",
 				 obj->base.size >> PAGE_SHIFT);
 			goto err_pages;
 		}
-- 
2.38.0

