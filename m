Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAA398D250
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 13:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0211E10E6FA;
	Wed,  2 Oct 2024 11:45:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N5hxFosR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A188910E6FA;
 Wed,  2 Oct 2024 11:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727869522; x=1759405522;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vTcIC5iYWIX8kyGe+9VaZ1HriAauQzandHaKzai+F+o=;
 b=N5hxFosRlF3XyABv9iYlWsU69I/epxnfnYwJFUVhAgBn6pkHd8/4BlUH
 hsUX4eTbBLNjl8Ed0wX3Ir6c8U8jyUof0v4x9qMpnzxN9TJBa99k+EvaK
 LWw38DQaupYwTrNlrv4BYJ9fhJxQz3uEoU3CuDQcjZ4WrxUNTkgA8yxBg
 3uYnffrdHsj+TnEgiwHBnwjuaUoJowj+BuIyrao1wkh8mOBNNRW56sXou
 AGN/N81yLAkrH/8F+8J/yum4g1Q0H1PG9AMn7arWY5XuZFDw+tgqq43e1
 FicxzpZZUkAt1E9tPgPIs39t6F/yjuqn38ElgOP7BIUIKNm+qmKnFrZfj A==;
X-CSE-ConnectionGUID: Hg1vpFy7SjWZkryVcRHxJQ==
X-CSE-MsgGUID: CDE0ssGYRiGGyEiJeCCH2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="38388359"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="38388359"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 04:45:21 -0700
X-CSE-ConnectionGUID: 5VVvCXsjTbqrL6m4UF3JtA==
X-CSE-MsgGUID: MJx1Yoh2ROmzs0s9vzeNAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="111446338"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.61])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 04:45:15 -0700
Date: Wed, 2 Oct 2024 13:45:11 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 vegard.nossum@oracle.com, Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] drm/i915: Rename functions in the docs to match code
 changes
Message-ID: <Zv0yRyYbepSGZjFR@ashyti-mobl2.lan>
References: <20241001062555.1908090-1-harshit.m.mogalapalli@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001062555.1908090-1-harshit.m.mogalapalli@oracle.com>
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

Hi Harshit,

On Mon, Sep 30, 2024 at 11:25:54PM -0700, Harshit Mogalapalli wrote:
> make htmldocs is reporting:
> 
> drivers/gpu/drm/i915/i915_irq.c:1: warning: 'intel_runtime_pm_disable_interrupts' not found
> drivers/gpu/drm/i915/i915_irq.c:1: warning: 'intel_runtime_pm_enable_interrupts' not found
> 
> intel_runtime_pm_disable_interrupts() is renamed to intel_irq_suspend(),
> make documentation changes accordingly.
> 
> Fixes: 3de5774cb8c0 ("drm/i915/irq: Rename suspend/resume functions")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/all/20241001134331.7b4d4ca5@canb.auug.org.au/
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>

Thanks for your patch. The functions were indeed renamed here(*)
by Rodrigo.

I'm going to remove the "Fixes:" tag as I don't think
documentation fixes are part of it. Unless someone wants it
strongly.

Without the Fixes tag:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi

(*) 3de5774cb8c0 ("drm/i915/irq: Rename suspend/resume functions")

> ---
> Noticed that Stephen also reported this so added a Closes URL.
> ---
>  Documentation/gpu/i915.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
> index ad59ae579237..7a469df675d8 100644
> --- a/Documentation/gpu/i915.rst
> +++ b/Documentation/gpu/i915.rst
> @@ -35,10 +35,10 @@ Interrupt Handling
>     :functions: intel_irq_init intel_irq_init_hw intel_hpd_init
>  
>  .. kernel-doc:: drivers/gpu/drm/i915/i915_irq.c
> -   :functions: intel_runtime_pm_disable_interrupts
> +   :functions: intel_irq_suspend
>  
>  .. kernel-doc:: drivers/gpu/drm/i915/i915_irq.c
> -   :functions: intel_runtime_pm_enable_interrupts
> +   :functions: intel_irq_resume
>  
>  Intel GVT-g Guest Support(vGPU)
>  -------------------------------
> -- 
> 2.46.0
