Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E15179A76E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 12:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F87710E290;
	Mon, 11 Sep 2023 10:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F9110E290
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 10:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694429380; x=1725965380;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=W0ihdI1gpYeZrR0lNJXdqr/RfBzKCoLICTIE6FOERxI=;
 b=D9qikMI7zsbtJoAe3acdBk36/P/clEcBAojXrOa5VlJAj26Sc6IDeRvv
 OKqudA+FgWHL1dcFB9RG39fI0EZVqt0q1YIY0zDe9/mvTylJNHnbcJCnq
 xyrQBZ2FC98JrTKlv477V9xQrdY1dpbFfpPLlVSpYhI9rDUgCnrkNI3QD
 7b/gN6cTSukAibWtqxcWGHkNREZ/7Y/PGL0SwE6unfmFIaKpIsXU4dB8S
 absQV22hrAWf+LLCyRkU6M7Z0LY20+oxcCGZEllYA+1D/TMRBixW5ia3F
 4j9XMGa95ZdhxbgWRYVc0ucU59ObOHjxbwxlcX6QeUOHkm79sIZt8BgSs g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="464423591"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; d="scan'208";a="464423591"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 03:49:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="1074097706"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; d="scan'208";a="1074097706"
Received: from kschuele-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.119])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 03:49:37 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/5] drm/ttm: Update Makefile for KUnit
In-Reply-To: <3782fd55e8479296daab7041430fe7b0848bf621.1694422112.git.karolina.stolarek@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1694422112.git.karolina.stolarek@intel.com>
 <3782fd55e8479296daab7041430fe7b0848bf621.1694422112.git.karolina.stolarek@intel.com>
Date: Mon, 11 Sep 2023 13:49:34 +0300
Message-ID: <87fs3lf0ht.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
 Karolina Stolarek <karolina.stolarek@intel.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 11 Sep 2023, Karolina Stolarek <karolina.stolarek@intel.com> wrote:
> Update Makefile so it can produce a module that consists of TTM tests.
> This will allow us to test non-exported functions when KUnit tests
> are built as a module. Remove the tests' Makefile.

I'm asking questions instead of making assertions, because I'm not 100%
confident, but I don't feel like this Makefile could work right.

>
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202309010358.50gYLkmw-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202309011134.bwvpuyOj-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202309011935.bBpezbUQ-lkp@intel.com/
> ---
>  drivers/gpu/drm/ttm/Makefile       | 18 +++++++++++++-----
>  drivers/gpu/drm/ttm/tests/Makefile |  6 ------
>  2 files changed, 13 insertions(+), 11 deletions(-)
>  delete mode 100644 drivers/gpu/drm/ttm/tests/Makefile
>
> diff --git a/drivers/gpu/drm/ttm/Makefile b/drivers/gpu/drm/ttm/Makefile
> index dad298127226..6322a33e65ed 100644
> --- a/drivers/gpu/drm/ttm/Makefile
> +++ b/drivers/gpu/drm/ttm/Makefile
> @@ -2,10 +2,18 @@
>  #
>  # Makefile for the drm device driver.  This driver provides support for the
>  
> -ttm-y := ttm_tt.o ttm_bo.o ttm_bo_util.o ttm_bo_vm.o ttm_module.o \
> -	ttm_execbuf_util.o ttm_range_manager.o ttm_resource.o ttm_pool.o \
> -	ttm_device.o ttm_sys_manager.o
> +ttm := ttm_tt.o ttm_bo.o ttm_bo_util.o ttm_bo_vm.o ttm_module.o \
> +       ttm_execbuf_util.o ttm_range_manager.o ttm_resource.o ttm_pool.o \
> +       ttm_device.o ttm_sys_manager.o
> +obj-$(CONFIG_DRM_TTM) += $(ttm)

Does that not lead to each object in $(ttm) becoming its own module?

>  ttm-$(CONFIG_AGP) += ttm_agp_backend.o

Does this not create a ttm.o with just one object, depending on
CONFIG_AGP?

>  
> -obj-$(CONFIG_DRM_TTM) += ttm.o
> -obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += tests/
> +ttm-tests := tests/ttm_kunit_helpers.o tests/ttm_device_test.o \
> +             tests/ttm_pool_test.o

I'd preserve the one object per line syntax. It's nicer for the diffs in
subsequent updates.

> +
> +ifeq ($(CONFIG_DRM_TTM_KUNIT_TEST),m)
> +    ttm-test-objs := $(ttm) $(ttm-tests)

Isn't the -objs syntax for host/userspace programs? And if not, doesn't
it lead to objects with exported symbols being present in two places?

Confused.

BR,
Jani.

> +    obj-m := ttm-test.o
> +else
> +    obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += $(ttm-tests)
> +endif
> diff --git a/drivers/gpu/drm/ttm/tests/Makefile b/drivers/gpu/drm/ttm/tests/Makefile
> deleted file mode 100644
> index ec87c4fc1ad5..000000000000
> --- a/drivers/gpu/drm/ttm/tests/Makefile
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0 AND MIT
> -
> -obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += \
> -        ttm_device_test.o \
> -        ttm_pool_test.o \
> -        ttm_kunit_helpers.o

-- 
Jani Nikula, Intel Open Source Graphics Center
