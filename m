Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A07551588
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 12:13:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A9611326D;
	Mon, 20 Jun 2022 10:13:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4255811326D;
 Mon, 20 Jun 2022 10:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655719982; x=1687255982;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Fzmu7C7+l4xuTEjVvRkgXFZwD/Iy08cHcIwmXQAaB/8=;
 b=jLUORwFHswBlsZvcBddegdD8/3IknzXMCcklaMzDotZICkSG/+HpLLJ3
 HFMWkx+kkZPIWpcAbkde7MUyuuiD5VvRfo7gopgIkghCbdlfUM9HXm7dJ
 TYBoLjAIQYfJg0X+yi96qE7fmb4CRK1uyHnBIjpog7tGHnvExxzUulIx4
 /HW0A8HnGlyrROC4FWq1ICgUSgbyUPHiTilvqy4exIn0vMj4sI3RA9MS/
 IFdYwG5bjD5QRoPW87uUnDALsA7njRo5ET+0GCIBmIhjHBkiYqqLBnA/j
 OY5OMveDU2M1H3KRjUdl10nScvMR99eGrw+5cmRG9ECJCTldavVmnLnBe w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="305293687"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="305293687"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 03:13:01 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="643048954"
Received: from hkanchar-mobl.gar.corp.intel.com (HELO localhost)
 ([10.252.36.6])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 03:12:57 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: zys.zljxml@gmail.com, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: Re: [PATCH] drm/i915/gem: remove unused assignments
In-Reply-To: <20220620100216.1791284-1-zys.zljxml@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220620100216.1791284-1-zys.zljxml@gmail.com>
Date: Mon, 20 Jun 2022 13:12:55 +0300
Message-ID: <878rprtzh4.fsf@intel.com>
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
Cc: bob.beckett@collabora.com, thomas.hellstrom@linux.intel.com,
 katrinzhou <katrinzhou@tencent.com>, linux-kernel@vger.kernel.org,
 matthew.auld@intel.com, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 20 Jun 2022, zys.zljxml@gmail.com wrote:
> From: katrinzhou <katrinzhou@tencent.com>
>
> The variable ret is reassigned and the value EINVAL is never used.
> Thus, remove the unused assignments.

It's obviously a bug, but it's not obvious just throwing the code away
is the fix. Maybe there's a missing "else" instead.

BR,
Jani.


>
> Addresses-Coverity: ("Unused value")
> Fixes: d4433c7600f7 ("drm/i915/gem: Use the proto-context to handle create parameters (v5)")
> Signed-off-by: katrinzhou <katrinzhou@tencent.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index ab4c5ab28e4d..d5ef5243673a 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -931,8 +931,6 @@ static int set_proto_ctx_param(struct drm_i915_file_private *fpriv,
>  		break;
>  
>  	case I915_CONTEXT_PARAM_PERSISTENCE:
> -		if (args->size)
> -			ret = -EINVAL;
>  		ret = proto_context_set_persistence(fpriv->dev_priv, pc,
>  						    args->value);
>  		break;

-- 
Jani Nikula, Intel Open Source Graphics Center
