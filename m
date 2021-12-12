Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87080471B51
	for <lists+dri-devel@lfdr.de>; Sun, 12 Dec 2021 16:22:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5EF210F5BA;
	Sun, 12 Dec 2021 15:22:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B79710F5BA;
 Sun, 12 Dec 2021 15:22:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10195"; a="238553535"
X-IronPort-AV: E=Sophos;i="5.88,200,1635231600"; d="scan'208";a="238553535"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 07:22:34 -0800
X-IronPort-AV: E=Sophos;i="5.88,200,1635231600"; d="scan'208";a="504602535"
Received: from nipunpan-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.53.91])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 07:22:30 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH RESEND v7 10/12] drm/i915: Rename i915->gt to i915->gt0
Date: Sun, 12 Dec 2021 17:21:15 +0200
Message-Id: <20211212152117.118428-11-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211212152117.118428-1-andi.shyti@linux.intel.com>
References: <20211212152117.118428-1-andi.shyti@linux.intel.com>
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Andi Shyti <andi@etezian.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation of the multitile support, highlight the root GT by
calling it gt0 inside the drm i915 private data.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 902bb89f628f..059642738f6c 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1005,7 +1005,7 @@ struct drm_i915_private {
 	struct i915_perf perf;
 
 	/* Abstract the submission mechanism (legacy ringbuffer or execlists) away */
-	struct intel_gt gt;
+	struct intel_gt gt0;
 
 	struct {
 		struct i915_gem_contexts {
@@ -1079,7 +1079,7 @@ static inline struct drm_i915_private *pdev_to_i915(struct pci_dev *pdev)
 
 static inline struct intel_gt *to_gt(struct drm_i915_private *i915)
 {
-	return &i915->gt;
+	return &i915->gt0;
 }
 
 /* Simple iterator over all initialised engines */
-- 
2.34.1

