Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 925DD284E78
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 16:56:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A2046E19B;
	Tue,  6 Oct 2020 14:56:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F346E19B;
 Tue,  6 Oct 2020 14:56:48 +0000 (UTC)
IronPort-SDR: IUuO88PnwdSF5VJILnD3RQJiCYzV5FjedkpQRdA6GPUL9wpSyExNLqvuzj2H2gM7euraR/uoTK
 pJjRaRH+jqJA==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="163753279"
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="163753279"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 07:56:37 -0700
IronPort-SDR: V3Lg7fQPr+9PxwU0tChArGqJdln0LxFxYCkUteeVNlaAX2cZ4BqXT9GmtwlSYvcdh/vzyerU+B
 eNfOB0zGIIjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="342318262"
Received: from gtax-ubuntu-2004.fm.intel.com ([10.105.23.104])
 by fmsmga004.fm.intel.com with ESMTP; 06 Oct 2020 07:56:34 -0700
From: Kamati Srinivas <srinivasx.k@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 james.ausmus@intel.com, matthew.d.roper@intel.com,
 tejaskumarx.surendrakumar.upadhyay@intel.com, hariom.pandey@intel.com
Subject: [PATCH] drm/i915/ehl: Remove require_force_probe protection
Date: Tue,  6 Oct 2020 14:56:32 +0000
Message-Id: <20201006145632.117291-1-srinivasx.k@intel.com>
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

Removing force probe protection from EHL platform. Did
not observe warnings, errors, flickering or any visual
defects while doing ordinary tasks like browsing and
editing documents in a two monitor setup.

Signed-off-by: Kamati Srinivas <srinivasx.k@intel.com>
---
 drivers/gpu/drm/i915/i915_pci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 366ddfc8df6b..aa9c17a6851c 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -841,7 +841,6 @@ static const struct intel_device_info icl_info = {
 static const struct intel_device_info ehl_info = {
 	GEN11_FEATURES,
 	PLATFORM(INTEL_ELKHARTLAKE),
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
