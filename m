Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7838E40731C
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 23:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6AD6EAC3;
	Fri, 10 Sep 2021 21:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0360D6EAC2;
 Fri, 10 Sep 2021 21:52:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10103"; a="306748700"
X-IronPort-AV: E=Sophos;i="5.85,284,1624345200"; d="scan'208";a="306748700"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 14:52:15 -0700
X-IronPort-AV: E=Sophos;i="5.85,284,1624345200"; d="scan'208";a="695169449"
Received: from saitejra-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.128.112])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 14:52:14 -0700
Date: Fri, 10 Sep 2021 14:52:14 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Yokoyama, Caz" <caz.yokoyama@intel.com>
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "Shyti, Andi" <andi.shyti@intel.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH 3/4] drm/i915: rename debugfs_gt_pm files
Message-ID: <20210910215214.rl5zccqxkj4id7bh@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20210909004941.379035-1-lucas.demarchi@intel.com>
 <20210909004941.379035-3-lucas.demarchi@intel.com>
 <20210910175257.oo3wbqnwx2inbcr3@ldmartin-desk2>
 <43256f639e37c2a4a862d42add314fcda48b99fb.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <43256f639e37c2a4a862d42add314fcda48b99fb.camel@intel.com>
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

On Fri, Sep 10, 2021 at 09:14:37PM +0000, Yokoyama, Caz wrote:
>On Fri, 2021-09-10 at 10:52 -0700, Lucas De Marchi wrote:
>> On Wed, Sep 08, 2021 at 05:49:40PM -0700, Lucas De Marchi wrote:
>> > We shouldn't be using debugfs_ namespace for this functionality.
>> > Rename
>> > debugfs_gt_pm.[ch] to intel_gt_pm_debugfs.[ch] and then make
>> > functions, defines and structs follow suit.
>> >
>> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> > ---
>> > drivers/gpu/drm/i915/Makefile                      |  2 +-
>> > drivers/gpu/drm/i915/gt/debugfs_gt_pm.h            | 14 ---------
>> > -----
>> > drivers/gpu/drm/i915/gt/intel_gt_debugfs.c         |  4 ++--
>> > .../gt/{debugfs_gt_pm.c => intel_gt_pm_debugfs.c}  |  4 ++--
>> > drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h      | 14
>> > ++++++++++++++
>> > 5 files changed, 19 insertions(+), 19 deletions(-)
>> > delete mode 100644 drivers/gpu/drm/i915/gt/debugfs_gt_pm.h
>> > rename drivers/gpu/drm/i915/gt/{debugfs_gt_pm.c =>
>> > intel_gt_pm_debugfs.c} (99%)
>> > create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h
>> >
>> > diff --git a/drivers/gpu/drm/i915/Makefile
>> > b/drivers/gpu/drm/i915/Makefile
>> > index 232c9673a2e5..dd656f2d7721 100644
>> > --- a/drivers/gpu/drm/i915/Makefile
>> > +++ b/drivers/gpu/drm/i915/Makefile
>> > @@ -79,7 +79,6 @@ i915-$(CONFIG_PERF_EVENTS) += i915_pmu.o
>> >
>> > # "Graphics Technology" (aka we talk to the gpu)
>> > gt-y += \
>> > -	gt/debugfs_gt_pm.o \
>> > 	gt/gen2_engine_cs.o \
>> > 	gt/gen6_engine_cs.o \
>> > 	gt/gen6_ppgtt.o \
>> > @@ -103,6 +102,7 @@ gt-y += \
>> > 	gt/intel_gt_engines_debugfs.o \
>> > 	gt/intel_gt_irq.o \
>> > 	gt/intel_gt_pm.o \
>> > +	gt/intel_gt_pm_debugfs.o \
>> > 	gt/intel_gt_pm_irq.o \
>> > 	gt/intel_gt_requests.o \
>> > 	gt/intel_gtt.o \
>> > diff --git a/drivers/gpu/drm/i915/gt/debugfs_gt_pm.h
>> > b/drivers/gpu/drm/i915/gt/debugfs_gt_pm.h
>> > deleted file mode 100644
>> > index 4cf5f5c9da7d..000000000000
>> > --- a/drivers/gpu/drm/i915/gt/debugfs_gt_pm.h
>> > +++ /dev/null
>> > @@ -1,14 +0,0 @@
>> > -/* SPDX-License-Identifier: MIT */
>> > -/*
>> > - * Copyright © 2019 Intel Corporation
>> > - */
>> > -
>> > -#ifndef DEBUGFS_GT_PM_H
>> > -#define DEBUGFS_GT_PM_H
>> > -
>> > -struct intel_gt;
>> > -struct dentry;
>> > -
>> > -void debugfs_gt_pm_register(struct intel_gt *gt, struct dentry
>> > *root);
>> > -
>> > -#endif /* DEBUGFS_GT_PM_H */
>> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
>> > b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
>> > index e5d173c235a3..4096ee893b69 100644
>> > --- a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
>> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
>> > @@ -5,10 +5,10 @@
>> >
>> > #include <linux/debugfs.h>
>> >
>> > -#include "debugfs_gt_pm.h"
>> > #include "i915_drv.h"
>> > #include "intel_gt_debugfs.h"
>> > #include "intel_gt_engines_debugfs.h"
>> > +#include "intel_gt_pm_debugfs.h"
>Why locate here? Why not just replace debugfs_gt_pm.h? Compile error?

are you asking why I moved the include? Because sorting them
alphabetically avoid big messes in these includes

Lucas De Marchi

>-caz
>
>> > #include "intel_sseu_debugfs.h"
>> > #include "uc/intel_uc_debugfs.h"
>> >
>> > @@ -24,7 +24,7 @@ void intel_gt_register_debugfs(struct intel_gt
>> > *gt)
>> > 		return;
>> >
>> > 	intel_gt_engines_register_debugfs(gt, root);
>> > -	debugfs_gt_pm_register(gt, root);
>> > +	intel_gt_pm_register_debugfs(gt, root);
>>
>> This is one case I usually don't know what convention to follow since
>> it
>> changes in different places.
>>
>> I did it like xxxx_register_debugfs because of calls like
>> intel_gt_init_scratch(), xxx_init_hw, etc. However here I see that
>> just
>> below we have intel_sseu_debugfs_register(), so maybe I should
>> consider
>> debugfs as part of the namespace?
>>
>> Lucas De Marchi
