Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E7660510C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 22:10:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5637710E085;
	Wed, 19 Oct 2022 20:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38CA110E18B;
 Wed, 19 Oct 2022 20:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666210216; x=1697746216;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=VCm4tXQv2JWGoEn+MlSasxigMhbXYJehBJ8zdANV9+g=;
 b=drHki5K4bsuW2K1NYqifDeVRD3TIevgpS96nMIeuujOhHKWzAwxsFpCy
 +GmZJh6l2q1vTd392cGP0xc3I6emiDHzo4CY9BAgbB6UK4fjbEljr2MXZ
 nCfrCcgYl40ZtNo5rBMblTC3Q3VGl2sjx/3cqDMqS0r34BPZyBh7giiX0
 176QOJ4XTkN2iYthNQmKA5RMPg4Y5agaUpNvFr+1PkO9bascJA4VH228K
 /HVMGqj/e+F6rpd0liNBMsMCYVMSzMA3isx7b8uCaz9wSFkwmLj32CWZH
 h5DuEjxu7tF97ohRFa1nGCAlEjbjK1gq+46R3DqcrtV9b+ukq7yD870rG Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="306509449"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="306509449"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 13:10:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="629420980"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="629420980"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga002.jf.intel.com with SMTP; 19 Oct 2022 13:10:11 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 19 Oct 2022 23:10:11 +0300
Date: Wed, 19 Oct 2022 23:10:11 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 14/15] drm/edid/firmware: convert to drm device specific
 logging
Message-ID: <Y1BZo4lGvE4esMfm@intel.com>
References: <cover.1665496046.git.jani.nikula@intel.com>
 <2305a76e064f6ffc0794406472a5ebd0630e5702.1665496046.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2305a76e064f6ffc0794406472a5ebd0630e5702.1665496046.git.jani.nikula@intel.com>
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

On Tue, Oct 11, 2022 at 04:49:48PM +0300, Jani Nikula wrote:
> Conform to device specific logging.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid_load.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid_load.c b/drivers/gpu/drm/drm_edid_load.c
> index 882caaa6e663..dd472c66cb3c 100644
> --- a/drivers/gpu/drm/drm_edid_load.c
> +++ b/drivers/gpu/drm/drm_edid_load.c
> @@ -177,16 +177,18 @@ static const struct drm_edid *edid_load(struct drm_connector *connector, const c
>  
>  		pdev = platform_device_register_simple(connector->name, -1, NULL, 0);
>  		if (IS_ERR(pdev)) {
> -			DRM_ERROR("Failed to register EDID firmware platform device "
> -				  "for connector \"%s\"\n", connector->name);
> +			drm_err(connector->dev,
> +				"Failed to register EDID firmware platform device for connector \"%s\"\n",
> +				connector->name);

Can go for the full [CONNECTOR:...] thing?

>  			return ERR_CAST(pdev);
>  		}
>  
>  		err = request_firmware(&fw, name, &pdev->dev);
>  		platform_device_unregister(pdev);
>  		if (err) {
> -			DRM_ERROR("Requesting EDID firmware \"%s\" failed (err=%d)\n",
> -				  name, err);
> +			drm_err(connector->dev,
> +				"Requesting EDID firmware \"%s\" failed (err=%d)\n",
> +				name, err);
>  			return ERR_PTR(err);
>  		}
>  
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
