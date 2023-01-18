Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 532C76720FD
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 16:19:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567D210E771;
	Wed, 18 Jan 2023 15:19:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8270710E76E;
 Wed, 18 Jan 2023 15:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674055161; x=1705591161;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ojGkGv0nGoPV3gkZhbgrgOXt+8Hag4bt1hxYMZi7H8Q=;
 b=hQx6jp9OS6NR9bNcbbZ1lDbSApmFneySDd99zTjXusBL0mTspxX97tiF
 UugYOkTQwDt7bQTLA4dZUx0Qht5EyEOyR7PCYgfGdgVjmTYpvz3NXAIQx
 kAsaZhU6k9us0O1nbz1T+6RasDjRY0tp0gRgwjdAyImX15CDzSpIvDePl
 Z6s0kxqvFRe5aRaEKliez6FLvzlvFebgKL9mFKI/tmUzKxB8Um8f0/WdZ
 ZhHC2fPYNLY4A9NKFrjll0Xz6Jp+wj/RUc9oUuo5NeHKzQnvaXWcPozPY
 cmxTdZ8nCfCf+TM0GuEClI7VUbs2FOCqLL7gdkOq45XWxq2H9Ul7tWdqo w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="387353381"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="387353381"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 07:19:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="690227056"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="690227056"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by orsmga008.jf.intel.com with SMTP; 18 Jan 2023 07:19:18 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 18 Jan 2023 17:19:17 +0200
Date: Wed, 18 Jan 2023 17:19:17 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v7 06/22] drm/edid: rename struct drm_display_info
 *display to *info
Message-ID: <Y8gN9bsaWR9wznV+@intel.com>
References: <cover.1672826282.git.jani.nikula@intel.com>
 <d35a50c714e21869afcabfafd5c5e590936b791a.1672826282.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d35a50c714e21869afcabfafd5c5e590936b791a.1672826282.git.jani.nikula@intel.com>
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

On Wed, Jan 04, 2023 at 12:05:21PM +0200, Jani Nikula wrote:
> Rename the local variable to info for consistency.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 3dfcd6450f10..4e9108e9fc96 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6011,14 +6011,14 @@ static void drm_parse_dsc_info(struct drm_hdmi_dsc_cap *hdmi_dsc,
>  static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
>  				      const u8 *hf_scds)
>  {
> -	struct drm_display_info *display = &connector->display_info;
> -	struct drm_hdmi_info *hdmi = &display->hdmi;
> +	struct drm_display_info *info = &connector->display_info;
> +	struct drm_hdmi_info *hdmi = &info->hdmi;
>  	struct drm_hdmi_dsc_cap *hdmi_dsc = &hdmi->dsc_cap;
>  	int max_tmds_clock = 0;
>  	u8 max_frl_rate = 0;
>  	bool dsc_support = false;
>  
> -	display->has_hdmi_infoframe = true;
> +	info->has_hdmi_infoframe = true;
>  
>  	if (hf_scds[6] & 0x80) {
>  		hdmi->scdc.supported = true;
> @@ -6042,7 +6042,7 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
>  		max_tmds_clock = hf_scds[5] * 5000;
>  
>  		if (max_tmds_clock > 340000) {
> -			display->max_tmds_clock = max_tmds_clock;
> +			info->max_tmds_clock = max_tmds_clock;
>  		}
>  
>  		if (scdc->supported) {
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
