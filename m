Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA05500FCE
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 15:59:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9396C10FDC9;
	Thu, 14 Apr 2022 13:59:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD36610FDC9;
 Thu, 14 Apr 2022 13:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649944759; x=1681480759;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GDZXdZIyeMCAJpASuXEC2rLdsvUK9DibPgDtDpIJulQ=;
 b=VmhhqJv0pU3nPSaHmEwLWDlfA5WFnfjT1K7rlHjt0a4LhEAPJetOPo9k
 TlQmtNtkLGYrdVz8Eox0WEQKZnNyQAUWZTB++9X2RcFJ2Bt6mR7jNF93N
 r0ACbiw4khaxx4jhDRfz6+dvz8rUhtByx8b1jZuM2ywQCZCiIQpUl9PCW
 LhCaGlhfLuf6KQpkZCbGd0MiFNpQH4WaJ2aFsaNRy6itQyrj7AGICalFT
 6OJ5NwF9VRLJlmJMroRfuh3+IA88xtljBCX7Qn+HkiE97TCtx8+JlqBO7
 vtjBjBThRSp27dcTatN12xKjsGKUIFL1kuqI4FSveBd/o8GmqIdl0SW9d g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="263110889"
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="263110889"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 06:59:19 -0700
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="661383991"
Received: from aviljane-mobl.ger.corp.intel.com (HELO [10.249.254.86])
 ([10.249.254.86])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 06:59:15 -0700
Message-ID: <955ad2c80d540ba9eee884d6a1f15b4d1604e306.camel@linux.intel.com>
Subject: Re: [PATCH v2 2/5] drm/i915: sanitize mem_flags for stolen buffers
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Robert Beckett <bob.beckett@collabora.com>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Jani
 Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 14 Apr 2022 15:58:53 +0200
In-Reply-To: <20220412151838.1298956-3-bob.beckett@collabora.com>
References: <20220412151838.1298956-1-bob.beckett@collabora.com>
 <20220412151838.1298956-3-bob.beckett@collabora.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-3.fc34) 
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
Cc: Matthew Auld <matthew.auld@intel.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-04-12 at 15:18 +0000, Robert Beckett wrote:
> stolen regions are not page backed or considered iomem.

thus...

A little more elaborate commit message please.


> 
> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> index 358f8a1a30ce..9fe8132de3b2 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> @@ -122,8 +122,9 @@ void i915_ttm_adjust_gem_after_move(struct
> drm_i915_gem_object *obj)
>  
>         obj->mem_flags &= ~(I915_BO_FLAG_STRUCT_PAGE |
> I915_BO_FLAG_IOMEM);
>  
> -       obj->mem_flags |= i915_ttm_cpu_maps_iomem(bo->resource) ?
> I915_BO_FLAG_IOMEM :
> -               I915_BO_FLAG_STRUCT_PAGE;
> +       if (obj->mm.region->id != INTEL_REGION_STOLEN_SMEM)
> +               obj->mem_flags |= i915_ttm_cpu_maps_iomem(bo-
> >resource) ? I915_BO_FLAG_IOMEM :
> +                       I915_BO_FLAG_STRUCT_PAGE;
>  
>         cache_level = i915_ttm_cache_level(to_i915(bo->base.dev), bo-
> >resource,
>                                            bo->ttm);


