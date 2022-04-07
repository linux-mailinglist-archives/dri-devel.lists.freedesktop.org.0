Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C444F7EAE
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 14:06:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915E810E9F5;
	Thu,  7 Apr 2022 12:06:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B209710E9E7;
 Thu,  7 Apr 2022 12:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649333175; x=1680869175;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=mGaqFKTQXiJuKGE+whZJcOJfR266Ubfu+PbrFF/qsro=;
 b=GQ7BHK3WJigia2rgwz9cdksSX4V37A93wkHoQCmKwjEDaEkJHQ5aGl9+
 tVB2VSHXTqoD3fm2vstRBY+YBb99mw3oZ1h8JZn8Gj/eULKk9msDzCga9
 yjmgY4vQbNtDpfZ7xrEJ1YPFMUjLMMtHwgN/ftFZw6nJ0jnZBpW3QM8zY
 glIjVgkdfYbNUKtyBidvYEUestNLdubfS+VO/cfpqtxFCv+a26Ygmg39y
 nBEAT1bR/3xMYB/zTwLSP7v1qufZ3XtfSH/Ei7bARjScNgyK4CmyJ7Ra7
 RBNkLbX5Q9+4Cq1yjzW/GcgK1R9s0UqBxQZHFaQVOj5s3nDMUt94Ou1HH g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="347745910"
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="347745910"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 05:06:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="571025978"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.51])
 by orsmga008.jf.intel.com with SMTP; 07 Apr 2022 05:06:12 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 07 Apr 2022 15:06:11 +0300
Date: Thu, 7 Apr 2022 15:06:11 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 06/12] drm/edid: add typedef for block read function
Message-ID: <Yk7Ts/ejETyarJSh@intel.com>
References: <cover.1649322799.git.jani.nikula@intel.com>
 <94e414efe8d127f3fd0b4fd7948aafbe7be079a9.1649322799.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <94e414efe8d127f3fd0b4fd7948aafbe7be079a9.1649322799.git.jani.nikula@intel.com>
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

On Thu, Apr 07, 2022 at 12:14:32PM +0300, Jani Nikula wrote:
> Make the callback a bit easier on the eye.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index ba54701f91f6..926ffe5cd97e 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2037,10 +2037,11 @@ int drm_add_override_edid_modes(struct drm_connector *connector)
>  }
>  EXPORT_SYMBOL(drm_add_override_edid_modes);
>  
> +typedef int read_block_fn(void *context, u8 *buf, unsigned int block, size_t len);
> +

The header still has the eyesore. Maybe we want to put the typedef
there?

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

>  static struct edid *drm_do_get_edid_base_block(struct drm_connector *connector,
> -	int (*get_edid_block)(void *data, u8 *buf, unsigned int block,
> -			      size_t len),
> -	void *data)
> +					       read_block_fn read_block,
> +					       void *context)
>  {
>  	int *null_edid_counter = connector ? &connector->null_edid_counter : NULL;
>  	bool *edid_corrupt = connector ? &connector->edid_corrupt : NULL;
> @@ -2053,7 +2054,7 @@ static struct edid *drm_do_get_edid_base_block(struct drm_connector *connector,
>  
>  	/* base block fetch */
>  	for (try = 0; try < 4; try++) {
> -		if (get_edid_block(data, edid, 0, EDID_LENGTH))
> +		if (read_block(context, edid, 0, EDID_LENGTH))
>  			goto out;
>  		if (drm_edid_block_valid(edid, 0, false, edid_corrupt))
>  			break;
> @@ -2097,9 +2098,8 @@ static struct edid *drm_do_get_edid_base_block(struct drm_connector *connector,
>   * Return: Pointer to valid EDID or NULL if we couldn't find any.
>   */
>  struct edid *drm_do_get_edid(struct drm_connector *connector,
> -	int (*get_edid_block)(void *data, u8 *buf, unsigned int block,
> -			      size_t len),
> -	void *data)
> +			     read_block_fn read_block,
> +			     void *context)
>  {
>  	int j, invalid_blocks = 0;
>  	struct edid *edid, *new, *override;
> @@ -2108,7 +2108,7 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
>  	if (override)
>  		return override;
>  
> -	edid = drm_do_get_edid_base_block(connector, get_edid_block, data);
> +	edid = drm_do_get_edid_base_block(connector, read_block, context);
>  	if (!edid)
>  		return NULL;
>  
> @@ -2125,7 +2125,7 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
>  		int try;
>  
>  		for (try = 0; try < 4; try++) {
> -			if (get_edid_block(data, block, j, EDID_LENGTH))
> +			if (read_block(context, block, j, EDID_LENGTH))
>  				goto out;
>  			if (drm_edid_block_valid(block, j, false, NULL))
>  				break;
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
