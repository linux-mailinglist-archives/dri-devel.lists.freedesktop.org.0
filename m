Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D68E851185
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 11:53:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 216FC10EC69;
	Mon, 12 Feb 2024 10:53:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cMVVJw7E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587F010EC69;
 Mon, 12 Feb 2024 10:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707735192; x=1739271192;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=CL5HdaZKoB0vw5DnIoCygRfMvzBUXpegZdJmlYcx8uc=;
 b=cMVVJw7EfYlmKZfrI/6HXxTlnA3cvFEIwcqPV5/aDMxsns2WX4iGuH1C
 YiSMUazszQpigikGJ+63V++OhLeB/jl6X4Kzz1+F7aCAZkdRVO+TkWvvs
 npbGZJbJZy8273A08sywGyFTBdHUPdjMzi7JuH0mpNRIeeKojTvf6jXbE
 2+Ra83ieQ6rYyF/TPyjGQLZNbBC4yGcULPU0pTQ9uzlpdP/Nw3G2imtug
 Jw/flbkEjvOcrn+5upEhlYuAz7OvnL7ZTugbibtVuk7uBEAQUDmVMxAPe
 bFMeP6V+ATGiNFZTsXU1LgEVk6a+fpW94QTIT8WlPkuFczDdx/FokwEv9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="1609454"
X-IronPort-AV: E=Sophos;i="6.05,263,1701158400"; 
   d="scan'208";a="1609454"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 02:53:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,263,1701158400"; 
   d="scan'208";a="2563842"
Received: from belyakov-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.63.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 02:53:10 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Luca Coelho
 <luciano.coelho@intel.com>, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH drm-misc-next] drm/xe: Fix a missing argument to
 drm_err_printer
In-Reply-To: <20240212103833.138263-1-thomas.hellstrom@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240212103833.138263-1-thomas.hellstrom@linux.intel.com>
Date: Mon, 12 Feb 2024 12:53:05 +0200
Message-ID: <87bk8m9coe.fsf@intel.com>
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

On Mon, 12 Feb 2024, Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.co=
m> wrote:
> The indicated commit below added a device argument to the
> function, but there was a call in the xe driver that was
> not properly changed.

Aww, crap. Looks like my drm-misc-next configs don't have xe enabled.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> Fixes: 5e0c04c8c40b ("drm/print: make drm_err_printer() device specific b=
y using drm_err()")
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Luca Coelho <luciano.coelho@intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/dr=
m/xe/xe_gt_tlb_invalidation.c
> index 7eef23a00d77..d42645fdfc02 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -314,7 +314,7 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int=
 seqno)
>  {
>  	struct xe_device *xe =3D gt_to_xe(gt);
>  	struct xe_guc *guc =3D &gt->uc.guc;
> -	struct drm_printer p =3D drm_err_printer(__func__);
> +	struct drm_printer p =3D drm_err_printer(&xe->drm, __func__);
>  	int ret;
>=20=20
>  	/*

--=20
Jani Nikula, Intel
