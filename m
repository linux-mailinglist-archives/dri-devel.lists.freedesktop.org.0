Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D656050F7
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 22:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B6610E035;
	Wed, 19 Oct 2022 20:04:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0100A10E18B;
 Wed, 19 Oct 2022 20:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666209863; x=1697745863;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XbX8zen/dwVhMyMWOeMEHWSEnWgZu1plEqAtXalgCFU=;
 b=QK/Q41gMS1nYPPF4+gWqDUvoyLDgAAJRka9HfL4W9iPaf+jg/J8g0e2Y
 5KMadhUBWZH909oqx97fDQGSGt3IFARauI/OfDdYHz/cSsC2O8oiWOHkz
 eR5+p6+TyzBbi/g53YQUNaWmT8jVxMjPRFq7nzI7uTotVk7D4X3YNyWZp
 M/wHRC6qCJrA1vBOYWZNmLVdNQdNhMOTLdtUnCdjN30zwYRRSW2nMJaS4
 WDgi3Gr2xe05AQUt9EdoJkorKKhqpeB7vOec4FAmvadb81WNsp/UTicTq
 PZkGBY/tu4cTCsfCh3waKMMILR7/BQWHERzJ9RPK3t4nUKnkB2Lxks2SQ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="392820407"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="392820407"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 13:04:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="624288702"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="624288702"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga007.jf.intel.com with SMTP; 19 Oct 2022 13:04:05 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 19 Oct 2022 23:04:04 +0300
Date: Wed, 19 Oct 2022 23:04:04 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 06/15] drm/edid: rename drm_add_override_edid_modes() to
 drm_edid_override_connector_update()
Message-ID: <Y1BYNJQaWqghOi8r@intel.com>
References: <cover.1665496046.git.jani.nikula@intel.com>
 <768e11394c1689f19da20eb55ac2c883d5613428.1665496046.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <768e11394c1689f19da20eb55ac2c883d5613428.1665496046.git.jani.nikula@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 11, 2022 at 04:49:40PM +0300, Jani Nikula wrote:
> Follow the naming of both EDID override functions as well as
> drm_edid_connector_update(). This also matches better what the function
> does; a combination of EDID property update and add modes. Indeed it
> should later be converted to call drm_edid_connector_update().

All the function names around that stuff still make my head spin,
but hopefully it'll clear up eventually when all the cruft has
disappeared.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c         | 6 +++---
>  drivers/gpu/drm/drm_probe_helper.c | 2 +-
>  include/drm/drm_edid.h             | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 1ada36e0d826..8baa46dc2537 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2227,7 +2227,7 @@ int drm_edid_override_reset(struct drm_connector *connector)
>  }
>  
>  /**
> - * drm_add_override_edid_modes - add modes from override/firmware EDID
> + * drm_edid_override_connector_update - add modes from override/firmware EDID
>   * @connector: connector we're probing
>   *
>   * Add modes from the override/firmware EDID, if available. Only to be used from
> @@ -2237,7 +2237,7 @@ int drm_edid_override_reset(struct drm_connector *connector)
>   *
>   * Return: The number of modes added or 0 if we couldn't find any.
>   */
> -int drm_add_override_edid_modes(struct drm_connector *connector)
> +int drm_edid_override_connector_update(struct drm_connector *connector)
>  {
>  	struct edid *override;
>  	int num_modes = 0;
> @@ -2254,7 +2254,7 @@ int drm_add_override_edid_modes(struct drm_connector *connector)
>  
>  	return num_modes;
>  }
> -EXPORT_SYMBOL(drm_add_override_edid_modes);
> +EXPORT_SYMBOL(drm_edid_override_connector_update);
>  
>  typedef int read_block_fn(void *context, u8 *buf, unsigned int block, size_t len);
>  
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index 69b0b2b9cc1c..2fc21df709bc 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -367,7 +367,7 @@ static int drm_helper_probe_get_modes(struct drm_connector *connector)
>  	 * override/firmware EDID.
>  	 */
>  	if (count == 0 && connector->status == connector_status_connected)
> -		count = drm_add_override_edid_modes(connector);
> +		count = drm_edid_override_connector_update(connector);
>  
>  	return count;
>  }
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 429735b91f63..05380681a4fb 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -577,7 +577,7 @@ struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
>  				     struct i2c_adapter *adapter);
>  struct edid *drm_edid_duplicate(const struct edid *edid);
>  int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid);
> -int drm_add_override_edid_modes(struct drm_connector *connector);
> +int drm_edid_override_connector_update(struct drm_connector *connector);
>  
>  u8 drm_match_cea_mode(const struct drm_display_mode *to_match);
>  bool drm_detect_hdmi_monitor(const struct edid *edid);
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
