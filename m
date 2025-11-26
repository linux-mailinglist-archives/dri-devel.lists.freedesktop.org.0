Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21688C88D46
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 10:05:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7BB510E2BA;
	Wed, 26 Nov 2025 09:05:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JjDveZ2P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5222210E542;
 Wed, 26 Nov 2025 09:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764147919; x=1795683919;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=bIoirJ6GrlBNOWOjQzqkfMzye4twPzrefCtRHbsL3s4=;
 b=JjDveZ2PXMiEmfffZ8U+1LFhXKX/En30yYLLFDZnEFajmf2ryaVxqnIc
 V4vabSEeKY7bAnyZagaE9hGPhN7zVbAM9TjoCBWzxwsM0wHovpCorK6bE
 rr6zMB1XlQXNWdcWAwu+JVNR0sgnkJTYfzlBVJfPapIABBQemjt/GC/l+
 RhaPrpiNsWa4TrzlvSWiEjiU9ZPf1lJeq3ciwI2KxdNE/dNBJyMWj0yTi
 h5eyzAyCru4pg/lsGvASPxqFEp9ws4GwrKyKIlH/TysWLycfOJIeSd93J
 SgsJlVlv5c5AKDrZyHhf30p9hZYoT+B/UFFJn9SP2ylBjl8dKvuKC1kb0 A==;
X-CSE-ConnectionGUID: 0SXtllAVRhqY1lwFhrMjGw==
X-CSE-MsgGUID: DtveueLMSXWe4iUDs8lGGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="83572847"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="83572847"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 01:05:19 -0800
X-CSE-ConnectionGUID: scmo+jyISm2UUmELTaaZSA==
X-CSE-MsgGUID: ywaAQmJiQBWrPlR0xV4rug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="192675951"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.1])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 01:05:13 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Yaroslav Bolyukin <iam@lach.pw>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Yaroslav
 Bolyukin <iam@lach.pw>
Subject: Re: [PATCH v6 1/7] drm/edid: rename VESA block parsing functions to
 more generic name
In-Reply-To: <20251126065126.54016-2-iam@lach.pw>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251126065126.54016-1-iam@lach.pw>
 <20251126065126.54016-2-iam@lach.pw>
Date: Wed, 26 Nov 2025 11:05:10 +0200
Message-ID: <90f21df4689df0683b8dc7bdd4f9415773e2e4b7@intel.com>
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

On Wed, 26 Nov 2025, Yaroslav Bolyukin <iam@lach.pw> wrote:
> Those functions would also parse DSC Bits Per Pixel value in the future
> commits.
>
> Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 26bb7710a462..64f7a94dd9e4 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6527,8 +6527,8 @@ static void drm_get_monitor_range(struct drm_connector *connector,
>  		    info->monitor_range.min_vfreq, info->monitor_range.max_vfreq);
>  }
>  
> -static void drm_parse_vesa_mso_data(struct drm_connector *connector,
> -				    const struct displayid_block *block)
> +static void drm_parse_vesa_specific_block(struct drm_connector *connector,
> +					  const struct displayid_block *block)
>  {
>  	struct displayid_vesa_vendor_specific_block *vesa =
>  		(struct displayid_vesa_vendor_specific_block *)block;
> @@ -6587,8 +6587,8 @@ static void drm_parse_vesa_mso_data(struct drm_connector *connector,
>  		    info->mso_stream_count, info->mso_pixel_overlap);
>  }
>  
> -static void drm_update_mso(struct drm_connector *connector,
> -			   const struct drm_edid *drm_edid)
> +static void drm_update_vesa_specific_block(struct drm_connector *connector,
> +					   const struct drm_edid *drm_edid)
>  {
>  	const struct displayid_block *block;
>  	struct displayid_iter iter;
> @@ -6596,7 +6596,7 @@ static void drm_update_mso(struct drm_connector *connector,
>  	displayid_iter_edid_begin(drm_edid, &iter);
>  	displayid_iter_for_each(block, &iter) {
>  		if (block->tag == DATA_BLOCK_2_VENDOR_SPECIFIC)
> -			drm_parse_vesa_mso_data(connector, block);
> +			drm_parse_vesa_specific_block(connector, block);
>  	}
>  	displayid_iter_end(&iter);
>  }
> @@ -6756,7 +6756,7 @@ static void update_display_info(struct drm_connector *connector,
>  	if (edid->features & DRM_EDID_FEATURE_RGB_YCRCB422)
>  		info->color_formats |= DRM_COLOR_FORMAT_YCBCR422;
>  
> -	drm_update_mso(connector, drm_edid);
> +	drm_update_vesa_specific_block(connector, drm_edid);
>  
>  out:
>  	if (drm_edid_has_internal_quirk(connector, EDID_QUIRK_NON_DESKTOP)) {

-- 
Jani Nikula, Intel
