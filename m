Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9605634847
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 21:37:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76B310E463;
	Tue, 22 Nov 2022 20:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38ACF10E177;
 Tue, 22 Nov 2022 20:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669149408; x=1700685408;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=awQ2n/Ud7CtZyl2Lym+ycmv+VNKC5OMB2RlaX2/DgEQ=;
 b=mPy+3C4nAmpIR/ufrzBhxqgUmRqp16zELAZD3Uz1ukzfVhkKNcih3YWI
 idHYzyDHEjuvln5Ncn9Llud1Dy8rB+PO4BO6GIEbmp/GJtK+vaTTQMphr
 StqM3KD5AYu2EGrmmufxfswUKKDbnIOm+DVkSShj0htZwU/TGyY03qUxK
 oTohBX3jnHYvbmUNEjX5TTv3Bx9nqVQIsLthZI/Qt16Q3MZHl0Yq2NLhV
 zxL6PpoGqS8FkQI4ZeX8ej68kQBerXhgF6EGx9OB7SfOFCX2nNj72AxSt
 az9YMoXTTei8uGZ1eBJhF9dhRvqJHJqA5nW6xs26K6FQFH0x2thifk+dj g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="294298884"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="294298884"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 12:34:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="730535759"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="730535759"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 12:34:12 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/4] drm/i915/gt: Correct kerneldoc for
 intel_gt_mcr_wait_for_reg()
Date: Tue, 22 Nov 2022 12:33:58 -0800
Message-Id: <20221122203401.3172897-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122203401.3172897-1-matthew.d.roper@intel.com>
References: <20221122203401.3172897-1-matthew.d.roper@intel.com>
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
Cc: kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The kerneldoc function name was not updated when this function was
converted to a non-fw form.

Fixes: 192bb40f030a ("drm/i915/gt: Manage uncore->lock while waiting on MCR register")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
index d9a8ff9e5e57..ea86c1ab5dc5 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
@@ -702,7 +702,7 @@ void intel_gt_mcr_get_ss_steering(struct intel_gt *gt, unsigned int dss,
 }
 
 /**
- * intel_gt_mcr_wait_for_reg_fw - wait until MCR register matches expected state
+ * intel_gt_mcr_wait_for_reg - wait until MCR register matches expected state
  * @gt: GT structure
  * @reg: the register to read
  * @mask: mask to apply to register value
-- 
2.38.1

