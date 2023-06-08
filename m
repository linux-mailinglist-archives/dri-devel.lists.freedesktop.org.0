Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9445B727CB5
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 12:24:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D62A10E414;
	Thu,  8 Jun 2023 10:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1630E10E410;
 Thu,  8 Jun 2023 10:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686219870; x=1717755870;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=0kSBNlHK2bsytGA9aO1JMLSbfCDZkZdpa9AQY9EE1gA=;
 b=mh5fSYyqHeJVeUlqeFP8Qyt615icAgtmorFpXbOeCuaxApmUjov2I2xQ
 d5MjA9FtyM21lni0y5SW5BV24ssMVuENx5QX4mKIw9wwDQyTQFMspf9yP
 wQGHISu/Ur/fxl0BFRxRewHr0ZEjDKoUWHd9/J9eqtXdzdTHAjstidecY
 S5drux9AOv1OiqIipJql4mSiaIrmqQTzly2sS9Nxmp4GUIU0r/NVDsrJY
 pTQp/XCiyeDQb+rh4I/KHUELk0+kWMyzPQeLtLuG3xJCAtU/9KwN0ZQ0I
 2D8l3NN/YAcE5Gt03XOWbmMkUC8tX5wHQXwZFXhWxhsFQjpeVpLbzCKm4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="443637479"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="443637479"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 03:24:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="713068553"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="713068553"
Received: from unknown (HELO localhost) ([10.237.66.162])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 03:24:26 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Colin Ian King <colin.i.king@gmail.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Gustavo Sousa
 <gustavo.sousa@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH][next] drm/i915/mtl: Fix spelling mistake "initate" ->
 "initiate"
In-Reply-To: <20230608100722.1148771-1-colin.i.king@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230608100722.1148771-1-colin.i.king@gmail.com>
Date: Thu, 08 Jun 2023 13:24:23 +0300
Message-ID: <87h6ris148.fsf@intel.com>
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 08 Jun 2023, Colin Ian King <colin.i.king@gmail.com> wrote:
> There is a spelling mistake in a drm_dbg_kms message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_pmdemand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_pmdemand.c b/drivers/gpu/drm/i915/display/intel_pmdemand.c
> index f7608d363634..f59e1e962e3d 100644
> --- a/drivers/gpu/drm/i915/display/intel_pmdemand.c
> +++ b/drivers/gpu/drm/i915/display/intel_pmdemand.c
> @@ -555,7 +555,7 @@ intel_pmdemand_program_params(struct drm_i915_private *i915,
>  		goto unlock;
>  
>  	drm_dbg_kms(&i915->drm,
> -		    "initate pmdemand request values: (0x%x 0x%x)\n",
> +		    "initiate pmdemand request values: (0x%x 0x%x)\n",
>  		    mod_reg1, mod_reg2);
>  
>  	intel_de_rmw(i915, XELPDP_INITIATE_PMDEMAND_REQUEST(1), 0,

-- 
Jani Nikula, Intel Open Source Graphics Center
