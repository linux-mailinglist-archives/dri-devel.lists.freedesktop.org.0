Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B48C551DE74
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 19:47:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40A110ECB5;
	Fri,  6 May 2022 17:47:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD8210ECB5;
 Fri,  6 May 2022 17:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651859255; x=1683395255;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=yZ+ZeWZSoYpxWfy+n+R1ST5qrKJkKuxZi2UPS5v2Lbk=;
 b=mo7sJ/X01ZZdqrPuqiBZ8ZtwCI1j6SlhlhJ4nxSNxp/+v8FijuBalIV3
 euIh2UDSkL3BGbA6jlbdV/HaGEFyPOt0QNQbDFrKaFYH00SFstCJ+UrSJ
 gPuUjjqCy8MCAPYZPAIXExL2Npk4kw/5FvfXklfi807LhHsFdHlm96NxR
 MiRs9qCperncjTGp/FcNV1/pbKXdN0Sh6knRd09TBgbZcdheznkcz79gU
 jPmi8X60ambLjMndR8ll0uhNrAdkI3xz87T0bkVqPJF8sOZla9C/Mmjig
 YR5NZqDBTsqIeyzGB9tWLvkxjUA7ZzQ2/Z+9gX0xm23O56KkNYgFaTful A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="249065964"
X-IronPort-AV: E=Sophos;i="5.91,205,1647327600"; d="scan'208";a="249065964"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 10:47:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,205,1647327600"; d="scan'208";a="586115496"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.51])
 by orsmga008.jf.intel.com with SMTP; 06 May 2022 10:47:29 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 06 May 2022 20:47:28 +0300
Date: Fri, 6 May 2022 20:47:28 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 01/25] drm/edid: use else-if in CTA extension parsing
Message-ID: <YnVfMDbYy/m9yFzj@intel.com>
References: <cover.1651830938.git.jani.nikula@intel.com>
 <569616c0e79b981092b5ff37f905b6fdc19b231b.1651830938.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <569616c0e79b981092b5ff37f905b6fdc19b231b.1651830938.git.jani.nikula@intel.com>
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

On Fri, May 06, 2022 at 01:10:08PM +0300, Jani Nikula wrote:
> Only one of the conditions can be true.
> 
> Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 47d121e99201..efc1999b9573 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -5473,16 +5473,16 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
>  
>  		if (cea_db_is_hdmi_vsdb(db))
>  			drm_parse_hdmi_vsdb_video(connector, data);
> -		if (cea_db_is_hdmi_forum_vsdb(db) ||
> -		    cea_db_is_hdmi_forum_scdb(db))
> +		else if (cea_db_is_hdmi_forum_vsdb(db) ||
> +			 cea_db_is_hdmi_forum_scdb(db))
>  			drm_parse_hdmi_forum_scds(connector, data);
> -		if (cea_db_is_microsoft_vsdb(db))
> +		else if (cea_db_is_microsoft_vsdb(db))
>  			drm_parse_microsoft_vsdb(connector, data);
> -		if (cea_db_is_y420cmdb(db))
> +		else if (cea_db_is_y420cmdb(db))
>  			drm_parse_y420cmdb_bitmap(connector, data);
> -		if (cea_db_is_vcdb(db))
> +		else if (cea_db_is_vcdb(db))
>  			drm_parse_vcdb(connector, data);
> -		if (cea_db_is_hdmi_hdr_metadata_block(db))
> +		else if (cea_db_is_hdmi_hdr_metadata_block(db))
>  			drm_parse_hdr_metadata_block(connector, data);
>  	}
>  	cea_db_iter_end(&iter);
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
