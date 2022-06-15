Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB3954CF5B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 19:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8099112429;
	Wed, 15 Jun 2022 17:05:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A0E112478;
 Wed, 15 Jun 2022 17:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655312725; x=1686848725;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1PYnn6PyVpQKqMIrBh21mNOeylsX7mB9wzgN758442Y=;
 b=iq8vOz/e34g3DQCtxlPLO5RPc9T65qNNhtvPO35/j2BEvbD39nvoWOMt
 sXX+uuXemdcwKbLogDorQxB8qN5Qcwl6e8IDGahhv6ydRIEwfHAk1WDCn
 rZdidkR07ZI0+XwroTLiaV4RN8UApTc1ylugsaBBHxYx+GoS3NXGBlfka
 AXrOZK38Pgk4zt5FvWqSDVUScmJ3HiNZig2VOH2jShPbDke8SG60GNW21
 /zCk6EVyK8Fqxbl9XAqplgC6+/qppU7lc0nSDxZC3m7XdFzF7j5/Rd3jJ
 mAGb4Ns4I/plPxtqEHS/crQXdPx/GfjtVycMGBpD+W3Ht67Pul7AxTxC4 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="365386924"
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; d="scan'208";a="365386924"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 10:03:16 -0700
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; d="scan'208";a="727500681"
Received: from orsosgc001.jf.intel.com ([10.165.21.154])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 10:03:16 -0700
Date: Wed, 15 Jun 2022 10:03:15 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [Intel-gfx] [PATCH 2/6] drm/i915/gt: Invalidate TLB of the OA
 unit at TLB invalidations
Message-ID: <20220615170315.GK48807@orsosgc001.jf.intel.com>
References: <cover.1655306128.git.mchehab@kernel.org>
 <653bf9815d562f02c7247c6b66b85b243f3172e7.1655306128.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <653bf9815d562f02c7247c6b66b85b243f3172e7.1655306128.git.mchehab@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 mauro.chehab@linux.intel.com,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 Chris Wilson <chris.p.wilson@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@redhat.com>,
 stable@vger.kernel.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 15, 2022 at 04:27:36PM +0100, Mauro Carvalho Chehab wrote:
>From: Chris Wilson <chris.p.wilson@intel.com>
>
>On gen12 HW, ensure that the TLB of the OA unit is also invalidated
>as just invalidating the TLB of an engine is not enough.
>
>Fixes: 7938d61591d3 ("drm/i915: Flush TLBs before releasing backing store")
>
>Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
>Cc: Fei Yang <fei.yang@intel.com>
>Cc: Andi Shyti <andi.shyti@linux.intel.com>
>Cc: stable@vger.kernel.org
>Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
>---
>
>See [PATCH 0/6] at: https://lore.kernel.org/all/cover.1655306128.git.mchehab@kernel.org/
>
> drivers/gpu/drm/i915/gt/intel_gt.c | 10 ++++++++++
> 1 file changed, 10 insertions(+)
>
>diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
>index d5ed6a6ac67c..61b7ec5118f9 100644
>--- a/drivers/gpu/drm/i915/gt/intel_gt.c
>+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>@@ -10,6 +10,7 @@
> #include "pxp/intel_pxp.h"
>
> #include "i915_drv.h"
>+#include "i915_perf_oa_regs.h"
> #include "intel_context.h"
> #include "intel_engine_pm.h"
> #include "intel_engine_regs.h"
>@@ -1259,6 +1260,15 @@ void intel_gt_invalidate_tlbs(struct intel_gt *gt)
> 		awake |= engine->mask;
> 	}
>
>+	/* Wa_2207587034:tgl,dg1,rkl,adl-s,adl-p */
>+	if (awake &&
>+	    (IS_TIGERLAKE(i915) ||
>+	     IS_DG1(i915) ||
>+	     IS_ROCKETLAKE(i915) ||
>+	     IS_ALDERLAKE_S(i915) ||
>+	     IS_ALDERLAKE_P(i915)))
>+		intel_uncore_write_fw(uncore, GEN12_OA_TLB_INV_CR, 1);
>+

This patch can be dropped since this is being done in i915/i915_perf.c 
-> gen12_oa_disable and is synchronized with OA use cases.

Regards,
Umesh


> 	for_each_engine_masked(engine, gt, awake, tmp) {
> 		struct reg_and_bit rb;
>
>-- 
>2.36.1
>
