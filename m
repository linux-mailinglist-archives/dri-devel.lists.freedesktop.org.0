Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC355B569E
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 10:49:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A299A10E325;
	Mon, 12 Sep 2022 08:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18CB510E32B;
 Mon, 12 Sep 2022 08:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662972569; x=1694508569;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1fV6UnyShZFSfMblQKy/IpHFX5MpBvdv2/rYDbvm0wQ=;
 b=ZsDlGdwTPZjN3ErQXJaAa/Xmhja7Hxc0joSIJ5xLysvuozr3gtyNdKYF
 1o1oaZkKLww5ffNf+6GdZ+8/0xVNdW6YLqqkswpQFDC07P+iCrEzZ7o+i
 dCcKk1dfXaJO4VWSkUQwVSxkU3qHzCjTsHpJhUZ3XboVsYTSsuvY7UkX8
 EAstvaTM/6oDiUD7cr8NGLAzSM1RALfgL0YQGyjSi5JZjDv3sAfQCcxcu
 EvvcnTPVK2XIdJXKPsUdpxKKMXc4ftt8f1ol1G5Trub3yiB7HYryFsQsc
 HO1ec/Qr+huwb7iINMD9xlQVxHUTZWTBD0jDVS8w3/QckMJoK3CRkdN85 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10467"; a="295400732"
X-IronPort-AV: E=Sophos;i="5.93,308,1654585200"; d="scan'208";a="295400732"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 01:49:28 -0700
X-IronPort-AV: E=Sophos;i="5.93,308,1654585200"; d="scan'208";a="678001216"
Received: from mwojtowi-mobl.ger.corp.intel.com (HELO [10.213.24.87])
 ([10.213.24.87])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 01:49:27 -0700
Message-ID: <71c9946b-4ef0-4445-830c-bbe7af4fd9b0@intel.com>
Date: Mon, 12 Sep 2022 10:49:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [Intel-gfx] [PATCH v2 1/2] drm/i915/gt: Use MEDIA_VER() when
 handling media fuses
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220909-media-v2-0-6f20f322b4ef@intel.com>
 <20220909-media-v2-1-6f20f322b4ef@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220909-media-v2-1-6f20f322b4ef@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10.09.2022 01:18, Lucas De Marchi wrote:
> Check for media IP version instead of graphics since this is figuring
> out the media engines' configuration. Currently the only platform with
> non-matching graphics/media version is Meteor Lake: update the check in
> gen11_vdbox_has_sfc() so it considers not only version 12, but also any
> later version which then includes that platform.
> 
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 6e0122b3dca2..b6602439224d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -654,13 +654,12 @@ bool gen11_vdbox_has_sfc(struct intel_gt *gt,
>   	 */
>   	if ((gt->info.sfc_mask & BIT(physical_vdbox / 2)) == 0)
>   		return false;
> -	else if (GRAPHICS_VER(i915) == 12)
> +	else if (MEDIA_VER(i915) >= 12)
>   		return (physical_vdbox % 2 == 0) ||
>   			!(BIT(physical_vdbox - 1) & vdbox_mask);
> -	else if (GRAPHICS_VER(i915) == 11)
> +	else if (MEDIA_VER(i915) == 11)
>   		return logical_vdbox % 2 == 0;
>   
> -	MISSING_CASE(GRAPHICS_VER(i915));
>   	return false;
>   }
>   
> @@ -747,14 +746,14 @@ static intel_engine_mask_t init_engine_mask(struct intel_gt *gt)
>   	 * and bits have disable semantices.
>   	 */
>   	media_fuse = intel_uncore_read(uncore, GEN11_GT_VEBOX_VDBOX_DISABLE);
> -	if (GRAPHICS_VER_FULL(i915) < IP_VER(12, 50))
> +	if (MEDIA_VER_FULL(i915) < IP_VER(12, 50))
>   		media_fuse = ~media_fuse;
>   
>   	vdbox_mask = media_fuse & GEN11_GT_VDBOX_DISABLE_MASK;
>   	vebox_mask = (media_fuse & GEN11_GT_VEBOX_DISABLE_MASK) >>
>   		      GEN11_GT_VEBOX_DISABLE_SHIFT;
>   
> -	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
> +	if (MEDIA_VER_FULL(i915) >= IP_VER(12, 50)) {
>   		fuse1 = intel_uncore_read(uncore, HSW_PAVP_FUSE1);
>   		gt->info.sfc_mask = REG_FIELD_GET(XEHP_SFC_ENABLE_MASK, fuse1);
>   	} else {
> 

