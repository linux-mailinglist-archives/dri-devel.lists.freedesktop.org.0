Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A2760B004
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 18:00:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D624510E8B8;
	Mon, 24 Oct 2022 16:00:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B8C10E8AB;
 Mon, 24 Oct 2022 16:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666627240; x=1698163240;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=u5UhLu1/g4v6ehLrmy52Vob9lKHZiWt4amNCzdYDA9c=;
 b=RHCmXo1vM7s9vEJ4c0hBpKGBSEFtKm6IgOynw0JNG9N+uiGgF+SKbIHB
 A829iY3nOsdYlkWN/4I/7CUiZSND6R3CDH81JmfNFWf/bxr3MLdGGaGcY
 fYejVszh41DGFQWq1F3aejcMh/qRVTen/kG9G+kOu5Nj9TCiEvDD2UzXy
 lRWkKiU4oCw0gIivVVe88zarDey878c/Mi39nIyr8G4u0deNhJ4VY65YK
 Te9pdVX3tcysEuU7C5SAUlKd+LTRml6NHqJ7en62Hxx4otY5fqrVt8uRd
 fAuuOcTiaPvk1x4YIjSWPDPKFlYM/Af1zwT2kFIjahILAsEWmBLLXHORb Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="306187689"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="306187689"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 09:00:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="773870026"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="773870026"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga001.fm.intel.com with SMTP; 24 Oct 2022 09:00:38 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 24 Oct 2022 19:00:37 +0300
Date: Mon, 24 Oct 2022 19:00:37 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 14/16] drm/edid/firmware: convert to drm device
 specific logging
Message-ID: <Y1a2pdOaI/jxZzTc@intel.com>
References: <cover.1666614699.git.jani.nikula@intel.com>
 <14f3a1e55729c9157aae93fc45320d05cc4cc7bc.1666614699.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14f3a1e55729c9157aae93fc45320d05cc4cc7bc.1666614699.git.jani.nikula@intel.com>
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

On Mon, Oct 24, 2022 at 03:33:42PM +0300, Jani Nikula wrote:
> Conform to device specific logging.
> 
> v2: Include [CONNECTOR:%d:%s] (Ville)
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid_load.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid_load.c b/drivers/gpu/drm/drm_edid_load.c
> index 882caaa6e663..ef4ab59d6935 100644
> --- a/drivers/gpu/drm/drm_edid_load.c
> +++ b/drivers/gpu/drm/drm_edid_load.c
> @@ -177,16 +177,20 @@ static const struct drm_edid *edid_load(struct drm_connector *connector, const c
>  
>  		pdev = platform_device_register_simple(connector->name, -1, NULL, 0);
>  		if (IS_ERR(pdev)) {
> -			DRM_ERROR("Failed to register EDID firmware platform device "
> -				  "for connector \"%s\"\n", connector->name);
> +			drm_err(connector->dev,
> +				"[CONNECTOR:%d:%s] Failed to register EDID firmware platform device for connector \"%s\"\n",
> +				connector->base.id, connector->name,
> +				connector->name);
>  			return ERR_CAST(pdev);
>  		}
>  
>  		err = request_firmware(&fw, name, &pdev->dev);
>  		platform_device_unregister(pdev);
>  		if (err) {
> -			DRM_ERROR("Requesting EDID firmware \"%s\" failed (err=%d)\n",
> -				  name, err);
> +			drm_err(connector->dev,
> +				"[CONNECTOR:%d:%s] Requesting EDID firmware \"%s\" failed (err=%d)\n",
> +				connector->base.id, connector->name,
> +				name, err);
>  			return ERR_PTR(err);
>  		}
>  
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
