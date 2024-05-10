Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BC48C295C
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 19:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9525C10E04F;
	Fri, 10 May 2024 17:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GhnvRgec";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B070410E04F
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 17:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715362443; x=1746898443;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vVNot2fRq0qaH/vP6kjvNsMMVYB/yF36sQ12ZO02JD0=;
 b=GhnvRgecRRjJ9yv2RMEeTA1P+nDWkUEUUge5vKbEOIebz5Ys2d1dC6xr
 ZR+n2bBGsyC9bHSIUe0yerA0LDM30I9SfQecpmQemu6ShJ2K/DLaafbub
 Yaen0SFzV/YDcDqJpaxyeD9dPnHXPSvxf7lv2sUPYJPx5Hge+ygmIPmWz
 c61xMqkuFJ3vkJEnuNgGTBGugFMWIT93d+Hsod2DdXaqe+siyQCuESmIc
 UuEfdqDwV6oZtNK7mRFdTKacEw5IGYI2naBWpvVJ348eke6VNHZc7e8R5
 2JP5+KFoNlnx3K24b/qwJw4r76txxLErdIgmos2gqKCI1VuBbyBSppENg w==;
X-CSE-ConnectionGUID: ry3DyYc8SbKQxoEwTWkX/w==
X-CSE-MsgGUID: BVWY0yQEQKuGLPLeuC48ow==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="28840126"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="28840126"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 10:34:03 -0700
X-CSE-ConnectionGUID: nyjX1GNQTj2/TkYjgg152A==
X-CSE-MsgGUID: WecmZfnKQgqXqXsNLDBH+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="29633252"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 10 May 2024 10:34:00 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 10 May 2024 20:33:59 +0300
Date: Fri, 10 May 2024 20:33:59 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] drm: use "0" instead of "" for deprecated driver date
Message-ID: <Zj5ah06WvSb0XP6l@intel.com>
References: <20240510090951.3398882-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240510090951.3398882-1-jani.nikula@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 10, 2024 at 12:09:51PM +0300, Jani Nikula wrote:
> libdrm does not like the empty string for driver date. Use "0" instead,
> which has been used by virtio previously.
> 
> Reported-by: Steven Price <steven.price@arm.com>
> Closes: https://lore.kernel.org/r/9d0cff47-308e-4b11-a9f3-4157dc26b6fa@arm.com
> Fixes: 7fb8af6798e8 ("drm: deprecate driver date")
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_ioctl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index 89feb7306e47..51f39912866f 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -530,9 +530,9 @@ int drm_version(struct drm_device *dev, void *data,
>  	err = drm_copy_field(version->name, &version->name_len,
>  			dev->driver->name);
>  
> -	/* Driver date is deprecated. Return the empty string. */
> +	/* Driver date is deprecated. Userspace expects a non-empty string. */
>  	if (!err)
> -		err = drm_copy_field(version->date, &version->date_len, "");
> +		err = drm_copy_field(version->date, &version->date_len, "0");

Does this also fix igt/core_getversion which is on fire now?

>  	if (!err)
>  		err = drm_copy_field(version->desc, &version->desc_len,
>  				dev->driver->desc);
> -- 
> 2.39.2

-- 
Ville Syrjälä
Intel
