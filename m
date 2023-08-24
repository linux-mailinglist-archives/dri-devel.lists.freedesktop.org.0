Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5633786BDA
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 11:30:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0BFB10E512;
	Thu, 24 Aug 2023 09:30:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F4310E512;
 Thu, 24 Aug 2023 09:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692869399; x=1724405399;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FoZxMzR7Zchg2Ic1jUTaJl7PEGyEXQW6/CKO3RR1vhw=;
 b=cz0uhUMPI7BeDQl+xDXhuWhjI8JOhZyqpmhnwzZa6Ak6EWjXMA3XlrqP
 Ye1KytEkiooxqN3ETryRnjiPLOQzgjItC8tsbYVxkWpr32KnTF1mMtnaF
 GxRwlY/HLgsZQEeIA402PvMf5tH/xZhNXLMr0W+ES88kUuPC4M93e+EdK
 m/Alzw8CPvvg7Stcxl3xROpTi5o139OPQJTXoER0UsBT08byHtUAQ5bkW
 Lqy3gnv0G2RG5aD4+wJ5b9rA7/DSLizHuz1VjdPuXiMrG9Bta2ovvL1Hb
 xZqaduviHateH7q0YaNABBC+uclea22OnQNWjwEfFWTKB6Z11X8yXVt0u g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="405396467"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="405396467"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 02:29:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="851419703"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="851419703"
Received: from unknown (HELO intel.com) ([10.237.72.65])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 02:29:56 -0700
Date: Thu, 24 Aug 2023 12:29:48 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] drivers/drm/i915: Honor limits->max_bpp
 while computing DSC max input bpp
Message-ID: <ZOcjDCx3r3TARJNX@intel.com>
References: <20230823115425.715644-1-ankit.k.nautiyal@intel.com>
 <20230823115425.715644-3-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230823115425.715644-3-ankit.k.nautiyal@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 23, 2023 at 05:24:25PM +0530, Ankit Nautiyal wrote:
> Edid specific BPC constraints are stored in limits->max_bpp. Honor these
> limits while computing the input bpp for DSC.
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

That is kind of funny, I can see this patch in my mails but can't
see the other one you had "Default 8 bpc support when DSC is supported",
which is visible from patchwork.
Anyways I give r-b for that one as well.

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 5b48bfe09d0e..2a7f6cfe2832 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2061,9 +2061,11 @@ static int intel_edp_dsc_compute_pipe_bpp(struct intel_dp *intel_dp,
>  	if (forced_bpp) {
>  		pipe_bpp = forced_bpp;
>  	} else {
> +		u8 max_bpc = limits->max_bpp / 3;
> +
>  		/* For eDP use max bpp that can be supported with DSC. */
>  		pipe_bpp = intel_dp_dsc_compute_max_bpp(intel_dp,
> -							conn_state->max_requested_bpc);
> +							min(max_bpc, conn_state->max_requested_bpc));
>  		if (!is_dsc_pipe_bpp_sufficient(i915, conn_state, limits, pipe_bpp)) {
>  			drm_dbg_kms(&i915->drm,
>  				    "Computed BPC is not in DSC BPC limits\n");
> -- 
> 2.40.1
> 
