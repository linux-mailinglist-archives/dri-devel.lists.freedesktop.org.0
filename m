Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4652278F1CE
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 19:23:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B1E310E0BD;
	Thu, 31 Aug 2023 17:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A18C10E0BD;
 Thu, 31 Aug 2023 17:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693502590; x=1725038590;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gqXllUO7AW7U7mF5qM7UcsJloq8/qYCwjrZUmWnRqkY=;
 b=AXf/oguueK7bBO9yzsQWr4LR3bdHtp/xB4u/zjOw7oQiQRvakXu3fwcQ
 0K5yJ9ZL8ijVwEimzIXFnCFxz4dPbre6r/4MQ9zS/sn5s5JUWbpNueDuy
 zLJCnWcxIGkB5vzIez2Yq9csIQV+RSUn1g28ppQzT70BfbM1iNQS+fYhN
 VKD5702N4T/uk3ta1/K0JjZltIc8FK9zrXZTWx51JtR1DGeCo2rNo2yoC
 WDUYAVmXNCSqshcBLPRI7l5D1i69PDfPRDKoNTLjWXXDD9Vn8gxecoS0Z
 PhGFtEEl9OZSBW9XREGpkFTy1vWbheyO/Jeb19EruxkrgTQv0sW3dtGDv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="379802112"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="379802112"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 10:23:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="733191930"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="733191930"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by orsmga007.jf.intel.com with SMTP; 31 Aug 2023 10:23:06 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 31 Aug 2023 20:23:05 +0300
Date: Thu, 31 Aug 2023 20:23:05 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 1/6] drm/edid: add drm_edid_is_digital()
Message-ID: <ZPDMefxfuX6SiE9n@intel.com>
References: <cover.1692884619.git.jani.nikula@intel.com>
 <4bdb407bf189fd922be022eb2f9564692377c81d.1692884619.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4bdb407bf189fd922be022eb2f9564692377c81d.1692884619.git.jani.nikula@intel.com>
X-Patchwork-Hint: comment
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
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 24, 2023 at 04:46:02PM +0300, Jani Nikula wrote:
> Checking edid->input & DRM_EDID_INPUT_DIGITAL is common enough to
> deserve a helper that also lets us abstract the raw EDID a bit better.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 17 +++++++++++++++--
>  include/drm/drm_edid.h     |  1 +
>  2 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 340da8257b51..1dbb15439468 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -3110,7 +3110,7 @@ drm_monitor_supports_rb(const struct drm_edid *drm_edid)
>  		return ret;
>  	}
>  
> -	return ((drm_edid->edid->input & DRM_EDID_INPUT_DIGITAL) != 0);
> +	return drm_edid_is_digital(drm_edid);
>  }
>  
>  static void
> @@ -6519,7 +6519,7 @@ static void update_display_info(struct drm_connector *connector,
>  	if (edid->revision < 3)
>  		goto out;
>  
> -	if (!(edid->input & DRM_EDID_INPUT_DIGITAL))
> +	if (!drm_edid_is_digital(drm_edid))
>  		goto out;
>  
>  	info->color_formats |= DRM_COLOR_FORMAT_RGB444;
> @@ -7335,3 +7335,16 @@ static void _drm_update_tile_info(struct drm_connector *connector,
>  		connector->tile_group = NULL;
>  	}
>  }
> +
> +/**
> + * drm_edid_is_digital - is digital?
> + * @drm_edid: The EDID
> + *
> + * Return true if input is digital.
> + */
> +bool drm_edid_is_digital(const struct drm_edid *drm_edid)
> +{
> +	return drm_edid && drm_edid->edid &&
> +		drm_edid->edid->input & DRM_EDID_INPUT_DIGITAL;
> +}
> +EXPORT_SYMBOL(drm_edid_is_digital);
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 48e93f909ef6..882d2638708e 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -612,6 +612,7 @@ const struct drm_edid *drm_edid_read_switcheroo(struct drm_connector *connector,
>  int drm_edid_connector_update(struct drm_connector *connector,
>  			      const struct drm_edid *edid);
>  int drm_edid_connector_add_modes(struct drm_connector *connector);
> +bool drm_edid_is_digital(const struct drm_edid *drm_edid);
>  
>  const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
>  				  int ext_id, int *ext_index);
> -- 
> 2.39.2

-- 
Ville Syrjälä
Intel
