Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B11576050CB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 21:53:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C19EF10E07D;
	Wed, 19 Oct 2022 19:52:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C9610E07D;
 Wed, 19 Oct 2022 19:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666209174; x=1697745174;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=kpxanlB9Uxrq8tbul2ZQRdpQ7qiqw6udu52UhKFVkc0=;
 b=dBTtcDCBM7ppHTWunkvMB0HaxndtO//jEIRqpT7e3LKk3cMahmsJxcIs
 AIbEVkH9B7D9PU9q7zOxufX/nck6U/iwHdQn7uL6DlNX7sZ72ZOfMVvQ7
 rlyVK/O+0JXoo5Q69KCrroKWsePXeFlUV960MXBhL45JNEI6710Uftt7N
 MLpiN/WXju1Pa1d4DOrR+/kbE1EEcYH3qpXYCRHoaQq8vvulgRtiRqpEO
 gfROzGqWfzK2DRDstHoSRXa+3KZYIkiExlFHWb23faTdNm4HMAfVahgMe
 IOy/Mi5Q4SKb8CSLyRK3UW1h7NW+W4L5VVymcn02+BWIbJdzxYJEEp0Ux A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="368565150"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="368565150"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 12:52:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="692555732"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="692555732"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga008.fm.intel.com with SMTP; 19 Oct 2022 12:52:51 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 19 Oct 2022 22:52:51 +0300
Date: Wed, 19 Oct 2022 22:52:51 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 10/15] drm/edid/firmware: drop redundant connector_name
 variable/parameter
Message-ID: <Y1BVk/Hcjevbkd/p@intel.com>
References: <cover.1665496046.git.jani.nikula@intel.com>
 <e4580510282e9f88c73ea10bab34ba502dae1bb9.1665496046.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e4580510282e9f88c73ea10bab34ba502dae1bb9.1665496046.git.jani.nikula@intel.com>
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

On Tue, Oct 11, 2022 at 04:49:44PM +0300, Jani Nikula wrote:
> Stop passing around something that's readily available in
> connector->name.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Weird. Did we not have a connector in there at some point or something?
Shrug.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid_load.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid_load.c b/drivers/gpu/drm/drm_edid_load.c
> index 37d8ba3ddb46..13cdbfb991eb 100644
> --- a/drivers/gpu/drm/drm_edid_load.c
> +++ b/drivers/gpu/drm/drm_edid_load.c
> @@ -167,8 +167,7 @@ static int edid_size(const u8 *edid, int data_size)
>  	return (edid[0x7e] + 1) * EDID_LENGTH;
>  }
>  
> -static void *edid_load(struct drm_connector *connector, const char *name,
> -			const char *connector_name)
> +static void *edid_load(struct drm_connector *connector, const char *name)
>  {
>  	const struct firmware *fw = NULL;
>  	const u8 *fwdata;
> @@ -185,10 +184,10 @@ static void *edid_load(struct drm_connector *connector, const char *name,
>  		struct platform_device *pdev;
>  		int err;
>  
> -		pdev = platform_device_register_simple(connector_name, -1, NULL, 0);
> +		pdev = platform_device_register_simple(connector->name, -1, NULL, 0);
>  		if (IS_ERR(pdev)) {
>  			DRM_ERROR("Failed to register EDID firmware platform device "
> -				  "for connector \"%s\"\n", connector_name);
> +				  "for connector \"%s\"\n", connector->name);
>  			return ERR_CAST(pdev);
>  		}
>  
> @@ -244,7 +243,7 @@ static void *edid_load(struct drm_connector *connector, const char *name,
>  		edid[EDID_LENGTH-1] += edid[0x7e] - valid_extensions;
>  		DRM_INFO("Found %d valid extensions instead of %d in EDID data "
>  		    "\"%s\" for connector \"%s\"\n", valid_extensions,
> -		    edid[0x7e], name, connector_name);
> +		    edid[0x7e], name, connector->name);
>  		edid[0x7e] = valid_extensions;
>  
>  		new_edid = krealloc(edid, (valid_extensions + 1) * EDID_LENGTH,
> @@ -256,7 +255,7 @@ static void *edid_load(struct drm_connector *connector, const char *name,
>  	DRM_INFO("Got %s EDID base block and %d extension%s from "
>  	    "\"%s\" for connector \"%s\"\n", (builtin >= 0) ? "built-in" :
>  	    "external", valid_extensions, valid_extensions == 1 ? "" : "s",
> -	    name, connector_name);
> +	    name, connector->name);
>  
>  out:
>  	release_firmware(fw);
> @@ -265,7 +264,6 @@ static void *edid_load(struct drm_connector *connector, const char *name,
>  
>  struct edid *drm_load_edid_firmware(struct drm_connector *connector)
>  {
> -	const char *connector_name = connector->name;
>  	char *edidname, *last, *colon, *fwstr, *edidstr, *fallback = NULL;
>  	struct edid *edid;
>  
> @@ -288,7 +286,7 @@ struct edid *drm_load_edid_firmware(struct drm_connector *connector)
>  	while ((edidname = strsep(&edidstr, ","))) {
>  		colon = strchr(edidname, ':');
>  		if (colon != NULL) {
> -			if (strncmp(connector_name, edidname, colon - edidname))
> +			if (strncmp(connector->name, edidname, colon - edidname))
>  				continue;
>  			edidname = colon + 1;
>  			break;
> @@ -310,7 +308,7 @@ struct edid *drm_load_edid_firmware(struct drm_connector *connector)
>  	if (*last == '\n')
>  		*last = '\0';
>  
> -	edid = edid_load(connector, edidname, connector_name);
> +	edid = edid_load(connector, edidname);
>  	kfree(fwstr);
>  
>  	return edid;
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
