Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9482E5B5272
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 03:25:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2171110E0E2;
	Mon, 12 Sep 2022 01:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38AD910E0E2;
 Mon, 12 Sep 2022 01:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662945929; x=1694481929;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ecU4kyT9//WudYGodoYB0OtJ/Rmk8S4MnM/86WtnIxo=;
 b=hW+93mKtXceH/dli6FM4eeEq6Wp0pfPPGO4Kf1ouzTP4CFryeTxBn4OH
 HDrcBB2+wZGuabLmfNZXrouRBmJctiA7tK6kuanPtwAKFfMVx9Mf59zdX
 vk31UVlsAE0aYLL+PNgQMQv7A2NktYI7h54Pz9l6TWax6tl7HYwY9hzIE
 WSYjwD2T3ygubfoKx/uDGNjH1oOKAheVHuqlgGLmPkrCWvBVsYJiwhgQe
 Dc0TtNBZd98Pd8NX1G16FiGPMVaGSHQOEZnxTaZ5lSMY9A9b2PrU6iwwu
 C37F/GioXtsUU1ud2DdmSasCY7edVzCCA36acZ3ff1kG1GG+SYwj73U3j A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10467"; a="361719054"
X-IronPort-AV: E=Sophos;i="5.93,308,1654585200"; d="scan'208";a="361719054"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2022 18:25:28 -0700
X-IronPort-AV: E=Sophos;i="5.93,308,1654585200"; d="scan'208";a="646261125"
Received: from dasegal-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.249.46.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2022 18:25:24 -0700
Date: Mon, 12 Sep 2022 03:25:21 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v3 33/37] drm/i915 i915_gem_object_types.h: document
 struct i915_lut_handle
Message-ID: <Yx6KgVcgyB2i2dYG@alfio.lan>
References: <cover.1662708705.git.mchehab@kernel.org>
 <0da7c28a377a1fac9db524dbc8462731d922b39c.1662708705.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0da7c28a377a1fac9db524dbc8462731d922b39c.1662708705.git.mchehab@kernel.org>
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
Cc: Thomas =?iso-8859-15?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chris Wilson <chris.p.wilson@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mauro,

On Fri, Sep 09, 2022 at 09:34:40AM +0200, Mauro Carvalho Chehab wrote:
> commit d1b48c1e7184 ("drm/i915: Replace execbuf vma ht with an idr")
> added a rbtree list to allow searching for obj/ctx.
> 
> Document it.
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v3 00/37] at: https://lore.kernel.org/all/cover.1662708705.git.mchehab@kernel.org/
> 
>  drivers/gpu/drm/i915/gem/i915_gem_object_types.h | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> index 9f6b14ec189a..35746cf268ea 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> @@ -21,9 +21,15 @@ struct drm_i915_gem_object;
>  struct intel_fronbuffer;
>  struct intel_memory_region;
>  
> -/*
> - * struct i915_lut_handle tracks the fast lookups from handle to vma used
> - * for execbuf. Although we use a radixtree for that mapping, in order to
> +/**
> + * struct i915_lut_handle - tracks the fast lookups from handle to vma used
> + * for execbuf.
> + *

just to be picky: do we or don't we want this extra space here? I
think that besides our personal taste it's important to have a
coherent style.

I would r-b it anyway if I didn't look the next patch.

Andi

> + * @obj_link: link to the object associated with the @handle.
> + * @ctx: context associated with the @handle.
> + * @handle: a rbtree handle to lookup context for specific obj/vma.
> + *
> + * Although we use a radixtree for that mapping, in order to
>   * remove them as the object or context is closed, we need a secondary list
>   * and a translation entry (i915_lut_handle).
>   */
> -- 
> 2.37.3
