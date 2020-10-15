Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D09D28EECF
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 10:53:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A3B6EC41;
	Thu, 15 Oct 2020 08:53:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85FF56EC41;
 Thu, 15 Oct 2020 08:53:09 +0000 (UTC)
IronPort-SDR: HavbmwytOMHOd6IBd8TSsQeHCTO51AuJbuYN7i2XBC6k4ilagp2d6LEodt82dAKMj0TeUQYiC9
 2ye+5cM/sNiQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9774"; a="145612619"
X-IronPort-AV: E=Sophos;i="5.77,378,1596524400"; d="scan'208";a="145612619"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2020 01:53:09 -0700
IronPort-SDR: bdnfNu0T62PzVnBP3VeL77ci3296aetWlFbBqyizTBkfZjC2E4INbFcAXJGbl1iAF331OzFFeB
 Nneijoj8hLDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,378,1596524400"; d="scan'208";a="356920768"
Received: from gtax-ubuntu-2004.fm.intel.com ([10.105.23.61])
 by FMSMGA003.fm.intel.com with ESMTP; 15 Oct 2020 01:53:09 -0700
From: Kamati Srinivas <srinivasx.k@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 james.ausmus@intel.com, matthew.d.roper@intel.com, jose.souza@intel.com,
 rodrigo.vivi@intel.com, hariom.pandey@intel.com,
 tejaskumarx.surendrakumar.upadhyay@intel.com
Subject: [PATCH] drm/i915/jsl: Remove require_force_probe protection
Date: Thu, 15 Oct 2020 08:53:08 +0000
Message-Id: <20201015085308.3492-1-srinivasx.k@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Removing force probe protection from JSL platform. Did
not observe warnings, errors, flickering or any visual
defects while doing ordinary tasks like browsing and
editing documents in a two monitor setup.

Signed-off-by: Kamati Srinivas <srinivasx.k@intel.com>
---
 drivers/gpu/drm/i915/i915_pci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 16d4e72bed09..a61195a1883a 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -849,7 +849,6 @@ static const struct intel_device_info ehl_info = {
 static const struct intel_device_info jsl_info = {
 	GEN11_FEATURES,
 	PLATFORM(INTEL_JASPERLAKE),
-	.require_force_probe = 1,
 	.platform_engine_mask = BIT(RCS0) | BIT(BCS0) | BIT(VCS0) | BIT(VECS0),
 	.ppgtt_size = 36,
 };
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
