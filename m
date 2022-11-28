Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A0763B5E3
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 00:30:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA7F10E34A;
	Mon, 28 Nov 2022 23:30:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C1510E346;
 Mon, 28 Nov 2022 23:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669678223; x=1701214223;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=awQ2n/Ud7CtZyl2Lym+ycmv+VNKC5OMB2RlaX2/DgEQ=;
 b=TKaJn4ucrZk6JFAFj7HB847tvU6IS6F0gC635CSzB30qB7PHZ9kb4RKI
 hIndaGpmrX8zu6tk9a6t4u+RQOLhBAvO4dMGbrTlq312mU6stJqVUM+dD
 nMKw/VMwUq/tyTvGJ1yaWrabuSM0vKiS06JJsQTaAXKXVE+tt5MSqgrcz
 xJLRDXmTU14klIDx0wRw8l40FptCZ5zG6A2xXvZ22WsAhu/ieAi3pf7MV
 UNM3djdZSMws2wB64I7/UTkFcJ7W3A8QpPugj4FFA/5rz5mu8ujM/yz9i
 7XCR2uFRtUUtMUKPS3nsopD7o/dUPeMhCBkmdjLcZ/nv20s0IbsMQjHuD A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="302556670"
X-IronPort-AV: E=Sophos;i="5.96,201,1665471600"; d="scan'208";a="302556670"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2022 15:30:23 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="706982245"
X-IronPort-AV: E=Sophos;i="5.96,201,1665471600"; d="scan'208";a="706982245"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2022 15:30:23 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/5] drm/i915/gt: Correct kerneldoc for
 intel_gt_mcr_wait_for_reg()
Date: Mon, 28 Nov 2022 15:30:10 -0800
Message-Id: <20221128233014.4000136-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128233014.4000136-1-matthew.d.roper@intel.com>
References: <20221128233014.4000136-1-matthew.d.roper@intel.com>
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

