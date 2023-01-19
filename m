Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3B9673848
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 13:23:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A585110E0B6;
	Thu, 19 Jan 2023 12:23:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08FEF10E0B6;
 Thu, 19 Jan 2023 12:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674131023; x=1705667023;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=8xISEwGDFrbmtnm+Q1hhBiJ22kkm+vjGB7sb6mTVTvk=;
 b=kUo0KxQbxO5T676Y31FFCSvQaog9jl1DcXS3cZOLneWw/sPPZnKr8wSR
 i21uFH8aF/W6L6D0tZR5rBXZqoK8dzUAoTSDM23j/ElFyUBoQEyTQ1UXy
 k/ycXxZYifzFZ6tNkIgjg44k9j1LDsCD1eLnTZmDLfHik6nYJxQlfZdZE
 68cA2XFvf0xz+RKmvJKjWCJGVoTd6VEWMBW6QAkhSgl3LYpKPCCcuv0ir
 FShBB0qrRTkmA+z5Vli4DN9xSPrgCVfsHgfbGQzlb21v9HyYj+Ccov3C4
 baDtUdk+SX/YIVmOy4AwONZDosgiH6Z4BZ710NisF2EMcCWRioLRDHqTs A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="389770023"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="389770023"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 04:23:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="723478911"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="723478911"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by fmsmga008.fm.intel.com with SMTP; 19 Jan 2023 04:23:39 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 19 Jan 2023 14:23:38 +0200
Date: Thu, 19 Jan 2023 14:23:38 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v7 18/22] drm/edid: remove redundant
 _drm_connector_update_edid_property()
Message-ID: <Y8k2SvV0kFl7CFJv@intel.com>
References: <cover.1672826282.git.jani.nikula@intel.com>
 <8a3bd5efa7faab2f4d00e8e00cd8d1b680443a2e.1672826282.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8a3bd5efa7faab2f4d00e8e00cd8d1b680443a2e.1672826282.git.jani.nikula@intel.com>
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

On Wed, Jan 04, 2023 at 12:05:33PM +0200, Jani Nikula wrote:
> Realize that drm_edid_connector_update() and
> _drm_connector_update_edid_property() are now the same thing. Drop the
> latter.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 21 +--------------------
>  1 file changed, 1 insertion(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index a64c0807e97f..ae50f533fea3 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6810,24 +6810,6 @@ int drm_edid_connector_add_modes(struct drm_connector *connector)
>  }
>  EXPORT_SYMBOL(drm_edid_connector_add_modes);
>  
> -static int _drm_connector_update_edid_property(struct drm_connector *connector,
> -					       const struct drm_edid *drm_edid)
> -{
> -	/*
> -	 * Set the display info, using edid if available, otherwise resetting
> -	 * the values to defaults. This duplicates the work done in
> -	 * drm_add_edid_modes, but that function is not consistently called
> -	 * before this one in all drivers and the computation is cheap enough
> -	 * that it seems better to duplicate it rather than attempt to ensure
> -	 * some arbitrary ordering of calls.
> -	 */
> -	update_display_info(connector, drm_edid);
> -
> -	_drm_update_tile_info(connector, drm_edid);
> -
> -	return _drm_edid_connector_property_update(connector, drm_edid);
> -}
> -
>  /**
>   * drm_connector_update_edid_property - update the edid property of a connector
>   * @connector: drm connector
> @@ -6849,8 +6831,7 @@ int drm_connector_update_edid_property(struct drm_connector *connector,
>  {
>  	struct drm_edid drm_edid;
>  
> -	return _drm_connector_update_edid_property(connector,
> -						   drm_edid_legacy_init(&drm_edid, edid));
> +	return drm_edid_connector_update(connector, drm_edid_legacy_init(&drm_edid, edid));
>  }
>  EXPORT_SYMBOL(drm_connector_update_edid_property);
>  
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
