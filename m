Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52335673835
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 13:19:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D932710E0D3;
	Thu, 19 Jan 2023 12:19:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2092210E0B6;
 Thu, 19 Jan 2023 12:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674130782; x=1705666782;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=VNdGee2pz5NtHTxuWKcsblST0AFS4yI4IhzTBoWwJ48=;
 b=l/TInPNo0yoIYx0jxMPgQLvblI9Lo9j/ae5hxJ2hGJ6/pDkUzywGAPlL
 q0kqUEFHFQZN8Lyc6JWEv+RQ4dH5HB6HOla8SM+H5Z5Rdsjpvq+WJeYaw
 6yj3AiMelegwMjb6feiYJTEecoUjpJq7zW19ZMJnbNkLwa2m9y2GcABEH
 I+kWEQG1bHnya60VxU7IYyyxh3cylT0PeqiFUAubcZLyi4rhqA9cMAZF4
 AtYTG4v13l09T/7UlMbUY4jRL23Hj8efMM8n4GXBeGFVSf3PR2VXmCJy4
 QCuVpZRBYyBwlGXqHVYl0Q1xCLq9RlVuSSr9kt4LFDsKi2XLHZH5YSgKR w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="389768841"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="389768841"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 04:19:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="723476354"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="723476354"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by fmsmga008.fm.intel.com with SMTP; 19 Jan 2023 04:19:28 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 19 Jan 2023 14:19:26 +0200
Date: Thu, 19 Jan 2023 14:19:26 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v7 16/22] drm/edid: refactor _drm_edid_connector_update()
 and rename
Message-ID: <Y8k1TqdK0YtZBccQ@intel.com>
References: <cover.1672826282.git.jani.nikula@intel.com>
 <b0ab3e9fc5836e94a3ea8914d45c5084becb9a14.1672826282.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b0ab3e9fc5836e94a3ea8914d45c5084becb9a14.1672826282.git.jani.nikula@intel.com>
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

On Wed, Jan 04, 2023 at 12:05:31PM +0200, Jani Nikula wrote:
> By moving update_display_info() out of _drm_edid_connector_update() we
> make the function purely about adding modes. Rename accordingly.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 25 ++++++++++++-------------
>  1 file changed, 12 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 5881df5bddb9..95c383220afc 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6663,19 +6663,12 @@ static int add_displayid_detailed_modes(struct drm_connector *connector,
>  	return num_modes;
>  }
>  
> -static int _drm_edid_connector_update(struct drm_connector *connector,
> -				      const struct drm_edid *drm_edid)
> +static int _drm_edid_connector_add_modes(struct drm_connector *connector,
> +					 const struct drm_edid *drm_edid)
>  {
>  	const struct drm_display_info *info = &connector->display_info;
>  	int num_modes = 0;
>  
> -	/*
> -	 * CEA-861-F adds ycbcr capability map block, for HDMI 2.0 sinks.
> -	 * To avoid multiple parsing of same block, lets parse that map
> -	 * from sink info, before parsing CEA modes.
> -	 */
> -	update_display_info(connector, drm_edid);
> -
>  	if (!drm_edid)
>  		return 0;
>  
> @@ -6780,7 +6773,9 @@ int drm_edid_connector_update(struct drm_connector *connector,
>  {
>  	int count;
>  
> -	count = _drm_edid_connector_update(connector, drm_edid);
> +	update_display_info(connector, drm_edid);
> +
> +	count = _drm_edid_connector_add_modes(connector, drm_edid);
>  
>  	_drm_update_tile_info(connector, drm_edid);
>  
> @@ -6850,7 +6845,8 @@ EXPORT_SYMBOL(drm_connector_update_edid_property);
>   */
>  int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid)
>  {
> -	struct drm_edid drm_edid;
> +	struct drm_edid _drm_edid;
> +	const struct drm_edid *drm_edid;
>  
>  	if (edid && !drm_edid_is_valid(edid)) {
>  		drm_warn(connector->dev, "[CONNECTOR:%d:%s] EDID invalid.\n",
> @@ -6858,8 +6854,11 @@ int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid)
>  		edid = NULL;
>  	}
>  
> -	return _drm_edid_connector_update(connector,
> -					  drm_edid_legacy_init(&drm_edid, edid));
> +	drm_edid = drm_edid_legacy_init(&_drm_edid, edid);
> +
> +	update_display_info(connector, drm_edid);
> +
> +	return _drm_edid_connector_add_modes(connector, drm_edid);
>  }
>  EXPORT_SYMBOL(drm_add_edid_modes);
>  
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
