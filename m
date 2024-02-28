Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AD386AC75
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 12:02:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F2310E408;
	Wed, 28 Feb 2024 11:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mYifyglH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9380510E330;
 Wed, 28 Feb 2024 11:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709118155; x=1740654155;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=6qUCxmFbflDlJlXRfbHoHUwRdpCmzb5lDTHq3HFZwtU=;
 b=mYifyglH1Olp1V5IhE8SolIWM959Hd/pEteIYOKlNndxugEDrxVhZov1
 hfMGVsfjhGSDxAXvX4YSDYp3TZM2wUM3QnROSxlCUqDYTBQG24+0TYc2n
 qIAOoiNYGJnx5bwbI3LCZtaj+lOVSCw09bPQqAYzkIkuM4TbyGOs18wxO
 2e+IgbuCgf3ZEgBHG45FkNoEfPpBoNWJie+k21h+dOc3cLvL9rU1rcYiA
 nQTIp8iZnNcK3WUSYmMIFzKBTSYBJrsAnyR7SgrdMjvP4kob0Xt8GVony
 eJBQg70HVawZ86JH11WV6N+GSDT9Q0avYKKURDhk4mVeMw6QSOHuHhUaH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="25976973"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="25976973"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 03:02:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7336043"
Received: from tmelzer-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.32.33])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 03:02:29 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Colin Ian King <colin.i.king@gmail.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/i915/dp: Fix spelling mistake "redect" ->
 "reject"
In-Reply-To: <20240228092042.4125617-1-colin.i.king@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240228092042.4125617-1-colin.i.king@gmail.com>
Date: Wed, 28 Feb 2024 13:02:26 +0200
Message-ID: <87bk80am2l.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 28 Feb 2024, Colin Ian King <colin.i.king@gmail.com> wrote:
> There is a spelling mistake in a drm_dbg_kms message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Pushed to drm-intel-next, thanks for the patch.

BR,
Jani.

> ---
>  drivers/gpu/drm/i915/display/intel_dp_tunnel.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_tunnel.c b/drivers/gpu/drm/i915/display/intel_dp_tunnel.c
> index 75d76f91ecbd..6503abdc2b98 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_tunnel.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_tunnel.c
> @@ -348,7 +348,7 @@ void intel_dp_tunnel_resume(struct intel_dp *intel_dp,
>  
>  out_err:
>  	drm_dbg_kms(&i915->drm,
> -		    "[DPTUN %s][CONNECTOR:%d:%s][ENCODER:%d:%s] Tunnel can't be resumed, will drop and redect it (err %pe)\n",
> +		    "[DPTUN %s][CONNECTOR:%d:%s][ENCODER:%d:%s] Tunnel can't be resumed, will drop and reject it (err %pe)\n",
>  		    drm_dp_tunnel_name(intel_dp->tunnel),
>  		    connector->base.base.id, connector->base.name,
>  		    encoder->base.base.id, encoder->base.name,

-- 
Jani Nikula, Intel
