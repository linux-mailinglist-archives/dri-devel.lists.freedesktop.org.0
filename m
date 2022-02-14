Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B322C4B4FC5
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 13:13:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA6B510E12A;
	Mon, 14 Feb 2022 12:12:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F7B10E138;
 Mon, 14 Feb 2022 12:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644840771; x=1676376771;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=/Bu4KOweNQGoBPbCgK6zUFcRkFzJe0NMscsE3+j7lc8=;
 b=MWXL63/50bpBVEt+GqH9y0GK8sN//GhV2nsWE7fm4PVbnYFjv0AJnkgl
 dW4+rRxhTBsm73GTWbf6vJCVEO3ThX5JRjE4B/WpnLlHfVwjrVnH65CbC
 AVVliDMBR8aJ1RYtYnNmJpSDlBNeqRY2ECCGiHPjZQTAIDBh0iTh7xA6S
 1TCtB7wfar2A3LM9SXPzVffoK+uXX6cH9uVTTSzT+B1YVXVOwzL0SgdR7
 ewkiLut2wB3kP1ttBg7FmqSvbpG1GfxJsaB90FzxZ7U25V6cmn1LLvGbf
 QnSAqpqUK2kjYifdcBDFuTUlgmS+hQnoQvIvNnA2GEdU5j9qRiNXoP6HR g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="249825351"
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="249825351"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 04:12:51 -0800
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="635136813"
Received: from unknown (HELO localhost) ([10.252.13.38])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 04:12:43 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Yaroslav Bolyukin <iam@lach.pw>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH 1/2] edid: parse DRM VESA dsc bpp target
In-Reply-To: <20220213133128.5833-1-iam@lach.pw>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220213133128.5833-1-iam@lach.pw>
Date: Mon, 14 Feb 2022 14:12:41 +0200
Message-ID: <877d9x7ikm.fsf@intel.com>
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
Cc: Yaroslav Bolyukin <iam@lach.pw>, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Subject prefix should be drm/edid.

On Sun, 13 Feb 2022, Yaroslav Bolyukin <iam@lach.pw> wrote:
> As per DisplayID v2.0 Errata E9 spec

Please be more elaborate about the changes.

You also need to update drm_reset_display_info().

BR,
Jani.

> Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
> ---
>  drivers/gpu/drm/drm_edid.c  | 31 ++++++++++++++++++++-----------
>  include/drm/drm_connector.h |  6 ++++++
>  include/drm/drm_displayid.h |  4 ++++
>  3 files changed, 30 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index a7663f9a1..83ee685c8 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -5270,7 +5270,7 @@ static void drm_parse_vesa_mso_data(struct drm_connector *connector,
>  	if (oui(vesa->oui[0], vesa->oui[1], vesa->oui[2]) != VESA_IEEE_OUI)
>  		return;
>  
> -	if (sizeof(*vesa) != sizeof(*block) + block->num_bytes) {
> +	if (block->num_bytes < 5) {
>  		drm_dbg_kms(connector->dev, "Unexpected VESA vendor block size\n");
>  		return;
>  	}
> @@ -5290,20 +5290,29 @@ static void drm_parse_vesa_mso_data(struct drm_connector *connector,
>  		break;
>  	}
>  
> -	if (!info->mso_stream_count) {
> -		info->mso_pixel_overlap = 0;
> -		return;
> +	info->mso_pixel_overlap = 0;
> +
> +	if (info->mso_stream_count) {
> +		info->mso_pixel_overlap = FIELD_GET(DISPLAYID_VESA_MSO_OVERLAP, vesa->mso);
> +		if (info->mso_pixel_overlap > 8) {
> +			drm_dbg_kms(connector->dev, "Reserved MSO pixel overlap value %u\n",
> +				info->mso_pixel_overlap);
> +			info->mso_pixel_overlap = 8;
> +		}
> +
> +		drm_dbg_kms(connector->dev, "MSO stream count %u, pixel overlap %u\n",
> +			info->mso_stream_count, info->mso_pixel_overlap);
>  	}
>  
> -	info->mso_pixel_overlap = FIELD_GET(DISPLAYID_VESA_MSO_OVERLAP, vesa->mso);
> -	if (info->mso_pixel_overlap > 8) {
> -		drm_dbg_kms(connector->dev, "Reserved MSO pixel overlap value %u\n",
> -			    info->mso_pixel_overlap);
> -		info->mso_pixel_overlap = 8;
> +	if (block->num_bytes < 7) {
> +		/* DSC bpp is optional */
> +		return;
>  	}
>  
> -	drm_dbg_kms(connector->dev, "MSO stream count %u, pixel overlap %u\n",
> -		    info->mso_stream_count, info->mso_pixel_overlap);
> +	info->dp_dsc_bpp = FIELD_GET(DISPLAYID_VESA_DSC_BPP_INT, vesa->dsc_bpp_int) * 16 +
> +		FIELD_GET(DISPLAYID_VESA_DSC_BPP_FRACT, vesa->dsc_bpp_fract);
> +
> +	drm_dbg_kms(connector->dev, "DSC bits per pixel %u\n", info->dp_dsc_bpp);
>  }
>  
>  static void drm_update_mso(struct drm_connector *connector, const struct edid *edid)
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 5e36eb3df..04ef0e995 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -634,6 +634,12 @@ struct drm_display_info {
>  	 * @mso_pixel_overlap: eDP MSO segment pixel overlap, 0-8 pixels.
>  	 */
>  	u8 mso_pixel_overlap;
> +
> +	/**
> +	 * @dp_dsc_bpp: DP Display-Stream-Compression (DSC) timing's target
> +	 * DST bits per pixel in 6.4 fixed point format. 0 means undefined
> +	 */
> +	u16 dp_dsc_bpp;
>  };
>  
>  int drm_display_info_set_bus_formats(struct drm_display_info *info,
> diff --git a/include/drm/drm_displayid.h b/include/drm/drm_displayid.h
> index 7ffbd9f7b..1be6deddc 100644
> --- a/include/drm/drm_displayid.h
> +++ b/include/drm/drm_displayid.h
> @@ -131,12 +131,16 @@ struct displayid_detailed_timing_block {
>  
>  #define DISPLAYID_VESA_MSO_OVERLAP	GENMASK(3, 0)
>  #define DISPLAYID_VESA_MSO_MODE		GENMASK(6, 5)
> +#define DISPLAYID_VESA_DSC_BPP_INT	GENMASK(5, 0)
> +#define DISPLAYID_VESA_DSC_BPP_FRACT GENMASK(3, 0)
>  
>  struct displayid_vesa_vendor_specific_block {
>  	struct displayid_block base;
>  	u8 oui[3];
>  	u8 data_structure_type;
>  	u8 mso;
> +	u8 dsc_bpp_int;
> +	u8 dsc_bpp_fract;
>  } __packed;
>  
>  /* DisplayID iteration */
>
> base-commit: 1528038385c0a706aac9ac165eeb24044fef6825

-- 
Jani Nikula, Intel Open Source Graphics Center
