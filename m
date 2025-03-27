Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F08A72DF7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 11:43:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FCD010E2E2;
	Thu, 27 Mar 2025 10:42:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k5Eq7Zkv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02F210E2DE;
 Thu, 27 Mar 2025 10:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743072177; x=1774608177;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=AXx7+ocQT3E4sMSk2ylEJFxEHzw4nJezAJywxHNNfpk=;
 b=k5Eq7ZkvlXv3pc5wfhQqNK2K41kApphaCCjdtYRH2j1etmM4N77OLz4O
 nPfbm7RrOu1Es7nkAnXNKH7qMj5dZBIadhHGsrltoH3Npcup2grq5A0qO
 sNSpA1FA2AJ3j/SXPHIe3YXK3C3/Dp8ANBTsr+8AlPqPoFF1wk3aPcY4H
 n2+TZe7MS3MWwA/ZBouGl/sdFq/Jdr9bo1cJKg692YTO0Jx4Pm5bfaLCQ
 r4kFCPBN6VZjtPI0zgDEcdpCtPBA2QkhCYCotS1mpK3oGFq+1xDGj6lSl
 b2yl8KS6Ntzov9zarUZ0jHNBUecq40hk8p2a//1rbxOSZT2yP9Vfy0siF w==;
X-CSE-ConnectionGUID: pQDTcZ2/T7Cos9XdXtwqAw==
X-CSE-MsgGUID: Z6vZvC0cSj65maIH8uJGtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55055283"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="55055283"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 03:42:57 -0700
X-CSE-ConnectionGUID: wclLEy5LTAWTrOwdKJsNPQ==
X-CSE-MsgGUID: TTJM3ucGSpGVJqMjJGXK3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="125927707"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.17])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 03:42:54 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
Cc: Arshad Mehmood <arshad.mehmood@intel.com>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>, Andi
 Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v2 1/6] drm/i915: Add the FIRST_CCS() helper
In-Reply-To: <20250326234005.1574688-2-andi.shyti@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250326234005.1574688-1-andi.shyti@linux.intel.com>
 <20250326234005.1574688-2-andi.shyti@linux.intel.com>
Date: Thu, 27 Mar 2025 12:42:50 +0200
Message-ID: <87ldsq69g5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 27 Mar 2025, Andi Shyti <andi.shyti@linux.intel.com> wrote:
> From: Andi Shyti <andi.shyti@intel.com>
>
> Some GPUs, like DG2, can host more than one CCS engine. Some
> workarounds or enablements need to happen only once for all the
> engines in the GT=E2=80=94for example, on the engine with the lowest
> instance.
>
> The FIRST_CCS() helper first checks if the engine is a Compute
> engine, and then whether it's the one with the lowest instance.
>
> Signed-off-by: Andi Shyti <andi.shyti@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_drv.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_=
drv.h
> index 54538b6f85df..5cb501393c4b 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -619,6 +619,9 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>  #define CCS_MASK(gt) \
>  	ENGINE_INSTANCES_MASK(gt, CCS0, I915_MAX_CCS)
>=20=20
> +#define FIRST_CCS(e__) \
> +	(CCS_MASK(e__->gt) && (__ffs(CCS_MASK(e__->gt)) =3D=3D e__->instance))
> +

Could I persuade you to find a more specific header file for this, along
with the CCS_MASK etc.?

BR,
Jani.


>  #define HAS_MEDIA_RATIO_MODE(i915) (INTEL_INFO(i915)->has_media_ratio_mo=
de)
>=20=20
>  /*

--=20
Jani Nikula, Intel
