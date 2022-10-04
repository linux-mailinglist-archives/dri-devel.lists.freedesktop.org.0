Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 657225F411C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 12:53:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C99010E544;
	Tue,  4 Oct 2022 10:53:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A0C10E544;
 Tue,  4 Oct 2022 10:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664880802; x=1696416802;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=a2wU+GAVDZgGV4Oab4o3rHrgVN9KNV/Qmq6gBDfLcHY=;
 b=UCM0hiOywgeyM9oSGHWq9Zgrg6bhS+WDAHyQxxlBYTp61OoSNlBIMSCH
 RhlgeZgkVs108JczbNhPqXHcyqTJu/lbGFwQJVCfr7UeGszdIT3dRZ6Yb
 QJdZZCUSiTFPMeg5xGXSj/+/F9hNDixvTp4/hD4P5v/vxGNTFbUP4tsHW
 X5ULzRWJDoQdxbefk4MTr259Fs0DJjJh5zR68KJLDjaagvpL1wF96POBd
 Ir/1TqyO3ilsZIYOVe+Lz1eMIJl/WqoiKkChEvNUyrUQBsKLA7kFt2f7w
 fjkN38QqpjsjgWqgORWyQuOLCwxw1zS+ouARuDCk70TNcZMaITWilUmdM w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="302859158"
X-IronPort-AV: E=Sophos;i="5.93,367,1654585200"; d="scan'208";a="302859158"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2022 03:53:21 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="868958366"
X-IronPort-AV: E=Sophos;i="5.93,367,1654585200"; d="scan'208";a="868958366"
Received: from pvarla-mobl4.gar.corp.intel.com (HELO localhost)
 ([10.252.39.104])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2022 03:53:18 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Subject: Re: [PATCH 2/2] drm/i915: remove circ_buf.h includes
In-Reply-To: <20221004102837.12181-2-jirislaby@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221004102837.12181-1-jirislaby@kernel.org>
 <20221004102837.12181-2-jirislaby@kernel.org>
Date: Tue, 04 Oct 2022 13:53:15 +0300
Message-ID: <87k05fuag4.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 04 Oct 2022, "Jiri Slaby (SUSE)" <jirislaby@kernel.org> wrote:
> The last user of macros from that include was removed in 2018 by the
> commit below.
>
> Fixes: 6cc42152b02b ("drm/i915: Remove support for legacy debugfs crc interface")
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_pipe_crc.c | 1 -
>  drivers/gpu/drm/i915/i915_irq.c               | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_pipe_crc.c b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
> index 8ac263f471be..9070935b0443 100644
> --- a/drivers/gpu/drm/i915/display/intel_pipe_crc.c
> +++ b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
> @@ -24,7 +24,6 @@
>   *
>   */
>  
> -#include <linux/circ_buf.h>
>  #include <linux/ctype.h>
>  #include <linux/debugfs.h>
>  #include <linux/seq_file.h>
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
> index 86a42d9e8041..09d728b34a47 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -28,7 +28,6 @@
>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
> -#include <linux/circ_buf.h>
>  #include <linux/slab.h>
>  #include <linux/sysrq.h>

-- 
Jani Nikula, Intel Open Source Graphics Center
