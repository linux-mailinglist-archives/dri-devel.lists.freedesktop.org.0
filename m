Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C94E5AA9E5
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 10:24:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F04410E7AF;
	Fri,  2 Sep 2022 08:24:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C4110E7AF
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 08:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662107056; x=1693643056;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Omf6Bt9yIpzl/KvsyXiiDF7MSmQ2JQdb+IyJVLiWHSY=;
 b=DLVSo9yzHbph2nJu8pSfZXUbyJKoQMzLekFGjTbQn9YbwPVICcRwJAHU
 r1htSJ0B0r0UrKCxv+pdCn7Fkr7lR1tJPuQ/ZTcy5VlZoV41kqu5/+lMD
 gX2JNKwQxIEhqmf8tSXDWiVcCrPlRRLqFrQ+xnfHeym0CFvc1SIBOGiD0
 tEogs8JnT9PwXOWvn+E3W5o3jJNdE3mdvGmU+sSQum0LRl/t6hazr+Eq1
 wJfKWBp+wR3Cf1eOmgzFKjY+pfiGXOgswraZIKWgInh9QjZkIvSl46m5K
 R6YGtTk7Cgv5pKWByZTJ6B6CpkmF+/Yr+lkLUmIyhZyHlnUbczfcSWpgf A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="278949116"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="278949116"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 01:24:15 -0700
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="589992462"
Received: from svandene-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.245])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 01:24:12 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: cgel.zte@gmail.com, airlied@linux.ie
Subject: Re: [PATCH linux-next] drm/dp_helper: Remove the unneeded result
 variable
In-Reply-To: <20220902081203.320165-1-zhang.songyi@zte.com.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220902081203.320165-1-zhang.songyi@zte.com.cn>
Date: Fri, 02 Sep 2022 11:24:01 +0300
Message-ID: <877d2mfala.fsf@intel.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, Zeal Robot <zealci@zte.com.cn>,
 zhang songyi <zhang.songyi@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 02 Sep 2022, cgel.zte@gmail.com wrote:
> From: zhang songyi <zhang.songyi@zte.com.cn>
>
> Return the drm_dp_dpcd_writeb() directly instead of storing it in another
> redundant variable.

Please just *stop* sending changes like this. See for example [1].

What's most offending to me is that I've replied to a lot of patches
from you, but I've *never* *even* *once* received a reply back on my
reviews.

If you want to participate in creating a better kernel, then please
*participate*. Just throwing random cleanup patches in our general
direction with one-way communication is not helping.

I'm seriously considering just ignoring *all* patches from you.


BR,
Jani.



[1] https://lore.kernel.org/r/8735dcepcv.fsf@intel.com

>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: zhang songyi <zhang.songyi@zte.com.cn>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index 92990a3d577a..09b282b704fa 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -2925,16 +2925,13 @@ EXPORT_SYMBOL(drm_dp_get_pcon_max_frl_bw);
>   */
>  int drm_dp_pcon_frl_prepare(struct drm_dp_aux *aux, bool enable_frl_ready_hpd)
>  {
> -	int ret;
>  	u8 buf = DP_PCON_ENABLE_SOURCE_CTL_MODE |
>  		 DP_PCON_ENABLE_LINK_FRL_MODE;
>  
>  	if (enable_frl_ready_hpd)
>  		buf |= DP_PCON_ENABLE_HPD_READY;
>  
> -	ret = drm_dp_dpcd_writeb(aux, DP_PCON_HDMI_LINK_CONFIG_1, buf);
> -
> -	return ret;
> +	return drm_dp_dpcd_writeb(aux, DP_PCON_HDMI_LINK_CONFIG_1, buf);
>  }
>  EXPORT_SYMBOL(drm_dp_pcon_frl_prepare);

-- 
Jani Nikula, Intel Open Source Graphics Center
