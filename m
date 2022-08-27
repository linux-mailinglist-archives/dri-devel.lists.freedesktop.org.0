Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 676215A338E
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 03:46:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 600C210EB07;
	Sat, 27 Aug 2022 01:45:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 633C610EB18;
 Sat, 27 Aug 2022 01:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661564739; x=1693100739;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=uMZUNReicrXPnJwSvAxCDuYZMTVe1UFNLZdXsTxIO4w=;
 b=Z8rMlgQ+MUrkHvuw/zM6st+/0q8EZzdxL4NNjDF5y6Xn0Bq1qncEIy2N
 tEPnyb/3mSTJ8gBbaLmLKOsQVXu58GJMtYqNIq3LZRIGjmufzWkO/5JnX
 GYAV3BJadNv8Kaf4HNogmgaUNbsokdM2wsVQvLUXfQXAC8K2hl4JKzm9m
 nSXIkxwjavt2DwiU86QCa1lEm0giHxaBG7yorAd5urln9L1KFS0YOP+i5
 239k9Z3FhQl3aX3plY10s+/0OHtxES6kcup2D75sWNwlOE4k8cpjHr5ad
 Jy/1wYBhcVUv4YU2EXpjaJvHLDSllT83CRgjgGooLVg+a4jB9vnXWzVRI g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="274376890"
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; d="scan'208";a="274376890"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 18:45:38 -0700
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; d="scan'208";a="671686913"
Received: from mdnavare-mobl1.jf.intel.com ([10.165.21.203])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 18:45:38 -0700
Date: Fri, 26 Aug 2022 18:45:17 -0700
From: "Navare, Manasi" <manasi.d.navare@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 02/11] drm/edid: Clarify why we only accept the "range
 limits only" descriptor
Message-ID: <20220827014517.GA107528@mdnavare-mobl1.jf.intel.com>
References: <20220826213501.31490-1-ville.syrjala@linux.intel.com>
 <20220826213501.31490-3-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220826213501.31490-3-ville.syrjala@linux.intel.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, intel-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 27, 2022 at 12:34:52AM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> The current comment fails to clarify why we only accept
> the "range limits only" variant of the range descriptor.
> Reword it to make some actual sense.
>

Thanks Ville for adding this description for monitor_range

Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>

Manasi

> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 4005dab6147d..ac662495635c 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6033,10 +6033,13 @@ void get_monitor_range(const struct detailed_timing *timing, void *c)
>  		return;
>  
>  	/*
> -	 * Check for flag range limits only. If flag == 1 then
> -	 * no additional timing information provided.
> -	 * Default GTF, GTF Secondary curve and CVT are not
> -	 * supported
> +	 * These limits are used to determine the VRR refresh
> +	 * rate range. Only the "range limits only" variant
> +	 * of the range descriptor seems to guarantee that
> +	 * any and all timings are accepted by the sink, as
> +	 * opposed to just timings conforming to the indicated
> +	 * formula (GTF/GTF2/CVT). Thus other variants of the
> +	 * range descriptor are not accepted here.
>  	 */
>  	if (range->flags != DRM_EDID_RANGE_LIMITS_ONLY_FLAG)
>  		return;
> -- 
> 2.35.1
> 
