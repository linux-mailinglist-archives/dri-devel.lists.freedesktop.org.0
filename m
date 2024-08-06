Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B2D949559
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 18:14:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D4710E3B1;
	Tue,  6 Aug 2024 16:14:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QmFRYaP2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B481C10E3B1;
 Tue,  6 Aug 2024 16:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722960862; x=1754496862;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mn4bAaKh4OzlNcns15U7R+92M15go6dKF/m0kZ4fJcQ=;
 b=QmFRYaP2cW+DI/ITLIooD7Etq/rLT/nppXY/20oTL56jvLEY8+1WcciI
 xlAAIQKWKFbhNhF/BU3fj+t3GJv7F1VttiGcn+RmNC7tTMwcBUmPyNzz7
 tKwKPp13fTDbgmDB9jcdhsJt2bJT7zNuHZOylaD+jTzWPIc6zG2nT/niZ
 V0q2EUyfNHg2MiS0Yr0e/2CSfgqkvJTHBi5YflBkOOmPlgULse93DuzqH
 JOGvHEfUX6d+sp44kAK06XZtTLREThiEqJLNEMnOz/2YlWr34zCSSDQqk
 BfTO5bfndov0SjEM/zSn7lYrf5PVNP0sWnNoL9AA+yA90qK1lZPG2B/H9 w==;
X-CSE-ConnectionGUID: uA3rJCzgQuqKyOn+AyHHEw==
X-CSE-MsgGUID: 06VdL/yQQo23xNlIGHpaEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="31566800"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="31566800"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 09:14:22 -0700
X-CSE-ConnectionGUID: L+AMiGrRR3SsWknUUVXQcw==
X-CSE-MsgGUID: F8dxAd+vQJ+Qrr/0i/YGwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="87215097"
Received: from johunt-mobl9.ger.corp.intel.com (HELO intel.com)
 ([10.245.244.131])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 09:14:15 -0700
Date: Tue, 6 Aug 2024 17:14:07 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: David Gow <david@davidgow.net>
Cc: Christian =?iso-8859-15?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Thomas =?iso-8859-15?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Gow <david@ingeniumdigital.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Ville =?iso-8859-15?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] drm/i915: Fix ttm small BAR placement handling
Message-ID: <ZrJLz9rZLsZh1nWo@ashyti-mobl2.lan>
References: <20240804091851.122186-1-david@davidgow.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240804091851.122186-1-david@davidgow.net>
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

Hi David,

thanks for the patches and thanks Justin for debugging the issue.

I reviewed and merged it into drm-intel-gt-next.

Thanks,
Andi

On Sun, Aug 04, 2024 at 05:18:46PM +0800, David Gow wrote:
> From: David Gow <david@ingeniumdigital.com>
> 
> As described in [1], there have been a couple of regressions in the TTM
> placement handling for i915, which adversely affect DG2 systems with
> small BAR.  In particular, performance become very poor when eviction
> from the mappable BAR memory is required, as suboptimal placements can
> be preferred, leading to thrashing. This often leads to hangs of >10s,
> during which even the compositor is unusable.
> 
> These regressions were largely introduced during the flag rework in
> commit a78a8da51b36 ("drm/ttm: replace busy placement with flags v6").
> 
> The first patch has already been sent out[2]. I'm resending it as part
> of this series which fixes both known regressions.
> 
> Thanks to Justin Brewer for bisecting the issue.
> 
> Cheers,
> -- David
> 
> [1]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11255
> [2]: https://lore.kernel.org/dri-devel/20240722074540.15295-1-david@davidgow.net/
> 
> ---
> 
> David Gow (2):
>   drm/i915: Allow evicting to use the requested placement
>   drm/i915: Attempt to get pages without eviction first
> 
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> -- 
> 2.46.0
