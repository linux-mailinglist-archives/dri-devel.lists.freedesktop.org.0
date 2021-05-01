Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0282370611
	for <lists+dri-devel@lfdr.de>; Sat,  1 May 2021 08:58:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76CB66F8A2;
	Sat,  1 May 2021 06:58:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A6086F8A2;
 Sat,  1 May 2021 06:58:22 +0000 (UTC)
IronPort-SDR: x30WoqBl6apu99QWLIMaDjAfisBqhN9d7XvkVQe7N+vjuTuKQVbQObQoq6PaRicBCpkhr/f32d
 zxYiifVWERaw==
X-IronPort-AV: E=McAfee;i="6200,9189,9970"; a="176924004"
X-IronPort-AV: E=Sophos;i="5.82,264,1613462400"; d="scan'208";a="176924004"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2021 23:58:21 -0700
IronPort-SDR: nbBNtXxD7rKWYUnGXi2U8OXi9w7IvHtBqUOWbkiYVsaGz17Ia8cWVivK5kji+Pp9HzgGBdgReY
 dJHBR8B3Xzhw==
X-IronPort-AV: E=Sophos;i="5.82,264,1613462400"; d="scan'208";a="431785959"
Received: from rong2-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.254.36.10])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2021 23:58:21 -0700
Date: Fri, 30 Apr 2021 23:58:15 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/6] drm/i915: Drop duplicate
 WaDisable4x2SubspanOptimization:hsw
Message-ID: <20210501065815.u26fsmotzffckobd@ldmartin-desk2>
References: <20210429091254.855248-1-tvrtko.ursulin@linux.intel.com>
 <20210429091254.855248-2-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210429091254.855248-2-tvrtko.ursulin@linux.intel.com>
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 29, 2021 at 10:12:49AM +0100, Tvrtko Ursulin wrote:
>From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
>Same workaround was listed two times - once under the Gen7 block and once
>under the Haswell section.
>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/i915/gt/intel_workarounds.c | 3 ---
> 1 file changed, 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
>index 5a03a76bb9e2..62cb9ee5bfc3 100644
>--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
>+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
>@@ -1859,9 +1859,6 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
> 			      CACHE_MODE_0_GEN7,
> 			      /* enable HiZ Raw Stall Optimization */
> 			      HIZ_RAW_STALL_OPT_DISABLE);
>-
>-		/* WaDisable4x2SubspanOptimization:hsw */
>-		wa_masked_en(wal, CACHE_MODE_1, PIXEL_SUBSPAN_COLLECT_OPT_DISABLE);
> 	}
>
> 	if (IS_VALLEYVIEW(i915)) {
>-- 
>2.30.2
>
>_______________________________________________
>Intel-gfx mailing list
>Intel-gfx@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
