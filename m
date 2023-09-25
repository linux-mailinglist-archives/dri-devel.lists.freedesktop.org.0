Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 739887ADA3D
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 16:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2963110E167;
	Mon, 25 Sep 2023 14:47:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7131710E167;
 Mon, 25 Sep 2023 14:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695653225; x=1727189225;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NdkTznkaJL5bRVNSpikOYSCFuwaf/DHQhhr9SSuILhI=;
 b=OeEgcmlzFW0j389kUKauAma5+APyqLluFZy6SdZ7oLeWteJZ6IXhSFQ8
 B6JZ/EYMl/iIwDnzpbV9hhxNzZv3e4zpWqKr81qckRpU/lg++F2UT+KCf
 U4cjrY02gsUhedIXM03MFDSAAm50o0eDXf/dbbJu4IiSJw5G3wu3MjT04
 soS/c7r5gnORi2upz+cJGe6w7xigdOs+tDqDnOMzpCzBU7qN+agLNLNKw
 PIDoRuP8Ls0kp6E4tOsjeZ/fskMwxv9i7SIFurCsww0fLWIaC1C9V0X+0
 5KePegfR6DVWPgt12i0jUCUUi8kckFDbwZy8M/oT62QD8RfmIrsr+2/ul A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="385102722"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="385102722"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 07:47:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="697997431"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="697997431"
Received: from nurqayrx-mobl2.gar.corp.intel.com (HELO intel.com)
 ([10.213.34.118])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 07:47:00 -0700
Date: Mon, 25 Sep 2023 16:46:54 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH] drm/i915/gem: Make i915_gem_shrinker multi-gt aware
Message-ID: <ZRGdXq1WOWpx271q@ashyti-mobl2.lan>
References: <20230925134938.12043-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925134938.12043-1-nirmoy.das@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, andi.shyti@linux.intel.com,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy,

you forgot the v2 here.

On Mon, Sep 25, 2023 at 03:49:38PM +0200, Nirmoy Das wrote:
> From: Jonathan Cavitt <jonathan.cavitt@intel.com>
> 
> Where applicable, use for_each_gt instead of to_gt in the
> i915_gem_shrinker functions to make them apply to more than just the
> primary GT.  Specifically, this ensure i915_gem_shrink_all retires all
> requests across all GTs, and this makes i915_gem_shrinker_vmap unmap
> VMAs from all GTs.
> 
> v2: Pass correct GT to intel_gt_retire_requests(Andrzej).
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

[...]

> -	if (shrink & I915_SHRINK_ACTIVE)
> -		/* Retire requests to unpin all idle contexts */
> -		intel_gt_retire_requests(to_gt(i915));
> +	if (shrink & I915_SHRINK_ACTIVE) {
> +		for_each_gt(gt, i915, i)
> +			/* Retire requests to unpin all idle contexts */
> +			intel_gt_retire_requests(gt);
> +	}

These two brackets are not needed.

>  
>  	/*
>  	 * As we may completely rewrite the (un)bound list whilst unbinding
> @@ -389,6 +393,8 @@ i915_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr
>  	struct i915_vma *vma, *next;
>  	unsigned long freed_pages = 0;
>  	intel_wakeref_t wakeref;
> +	struct intel_gt *gt;
> +	int i;

the trend is to use 'unsigned int' here and I've seen it
reviewed. Personally, if I really have to express a preference, I
prefer 'int' because it's a bit safer, generally I don't really
mind :)

The rest looks good.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
