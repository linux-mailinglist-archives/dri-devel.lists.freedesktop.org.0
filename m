Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B77451C2A0
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 16:32:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFCB410E3AB;
	Thu,  5 May 2022 14:32:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4766910E37F;
 Thu,  5 May 2022 14:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651761164; x=1683297164;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1+9JQdzrsHYQrBsDqJEgyu551lUE2oP9pxLpL0lHNqY=;
 b=WobFeK1pggH/wQgkw/8UqXqyzHJyuYAKGX09CSTQ7AlVKw2CEDIMj76L
 P+ROmZ62l/3I8iKxerhyX+kkyaqQo5hbVjLn684BdvUqat1ADx2m/K7WC
 72xEEf0cKzzdD6VWnQSC3wY/qZfvIWd0O/CCqcqCkzNnQ5C+7MhYeMlq1
 6oUA4ANsRit55jOAgCC8DaIw6KJ+bi1e4nG8mIYhn0OaBDnoXv4+w9Krk
 Sk6rhFpV8DYyFpvecE2N9zbgt5L9TUYmnx2e9AVhP+jfIebUZEZZHEjaf
 aeUpEIB+VYRk6ymwSGU/Fh1T/EhGQGm21ZAcYJLQ7JHHYZUf+qBi+WTfZ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="267723574"
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; d="scan'208";a="267723574"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 07:32:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; d="scan'208";a="664986100"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.51])
 by fmsmga002.fm.intel.com with SMTP; 05 May 2022 07:32:13 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 05 May 2022 17:32:12 +0300
Date: Thu, 5 May 2022 17:32:12 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3] drm/edid: detect color formats and CTA revision in
 all CTA extensions
Message-ID: <YnPf7MGru3oM/+do@intel.com>
References: <a137d2e272ad1eac5b286784008a4baf91bc2799.1651569697.git.jani.nikula@intel.com>
 <20220505105242.1198521-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220505105242.1198521-1-jani.nikula@intel.com>
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

On Thu, May 05, 2022 at 01:52:42PM +0300, Jani Nikula wrote:
> Convert drm_find_cea_extension() to EDID block iterator in color format
> and CTA revision detection. Detect them in all CTA extensions.
> 
> Also parse CTA Data Blocks in DisplayID even if there's no CTA EDID
> extension.
> 
> v2:
> - Don't assume DRM_COLOR_FORMAT_RGB444 support if there's only DisplayID
>   CTA Data Blocks (Ville)
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 3b18a6e501df..8d737322145c 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -5447,26 +5447,31 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
>  			      const struct edid *edid)
>  {
>  	struct drm_display_info *info = &connector->display_info;
> +	struct drm_edid_iter edid_iter;
>  	const struct cea_db *db;
>  	struct cea_db_iter iter;
>  	const u8 *edid_ext;
>  
> -	edid_ext = drm_find_cea_extension(edid);
> -	if (!edid_ext)
> -		return;
> +	drm_edid_iter_begin(edid, &edid_iter);
> +	drm_edid_iter_for_each(edid_ext, &edid_iter) {
> +		if (edid_ext[0] != CEA_EXT)
> +			continue;
>  
> -	info->cea_rev = edid_ext[1];
> +		if (!info->cea_rev)
> +			info->cea_rev = edid_ext[1];
>  
> -	/* The existence of a CEA block should imply RGB support */
> -	info->color_formats = DRM_COLOR_FORMAT_RGB444;
> +		if (info->cea_rev != edid_ext[1])
> +			DRM_DEBUG_KMS("CEA extension version mismatch %u != %u\n",
> +				      info->cea_rev, edid_ext[1]);
>  
> -	/* CTA DisplayID Data Block does not have byte #3 */
> -	if (edid_ext[0] == CEA_EXT) {
> +		/* The existence of a CTA extension should imply RGB support */
> +		info->color_formats = DRM_COLOR_FORMAT_RGB444;
>  		if (edid_ext[3] & EDID_CEA_YCRCB444)
>  			info->color_formats |= DRM_COLOR_FORMAT_YCBCR444;
>  		if (edid_ext[3] & EDID_CEA_YCRCB422)
>  			info->color_formats |= DRM_COLOR_FORMAT_YCBCR422;
>  	}
> +	drm_edid_iter_end(&edid_iter);
>  
>  	cea_db_iter_edid_begin(edid, &iter);
>  	cea_db_iter_for_each(db, &iter) {
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
