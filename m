Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE796C0F38
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 11:39:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E107A10E335;
	Mon, 20 Mar 2023 10:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7388810E335;
 Mon, 20 Mar 2023 10:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679308792; x=1710844792;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=FypxD+G9f5MyAPl6y48QwCXFpUI3OCR1S6VPGnEZ+9A=;
 b=UbThV+ROA2RGwhX5RKcy0dREFNHUEtr0I0vqo6kUp0UbVN/PK0F9yDxA
 ARynhv+EZCmBH3GwCo2SmdVE7lWQsE4pPhCEZrwqP+si0fdk/Tj4ostgV
 tW33+bURiomr0JfxgMWuZanY+tTiDTaD2RZVhwIaBQwoxgeUX+znPhMFK
 hih+1pBd7ou9nnN995zuK+F7jivH7Jpz11MKv8yHdhWtg/7RG3ZndWbMh
 M77g0MJ7LTJia2gAV/HqOHOSLQuHaXujqyI4aZ3voOCp0dWC+XyZijCVS
 oszengikvv7Tr7VYd84794DlFqf5YmgB5cdvE3vhdrEPv1mOUWllT3lsM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="319028449"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="319028449"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 03:39:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="658303350"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="658303350"
Received: from mseifert-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.61.180])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 03:39:48 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/3] drm/i915/display: Add helper func to get
 intel_fbdev from drm_fb_helper
In-Reply-To: <20230320100903.23588-2-nirmoy.das@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230320100903.23588-1-nirmoy.das@intel.com>
 <20230320100903.23588-2-nirmoy.das@intel.com>
Date: Mon, 20 Mar 2023 12:39:41 +0200
Message-ID: <875yavaeqa.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: dri-devel@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 20 Mar 2023, Nirmoy Das <nirmoy.das@intel.com> wrote:
> Add a helper function to retrieve struct intel_fbdev from
> struct drm_fb_helper.
>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_fbdev.c | 23 ++++++++++------------
>  1 file changed, 10 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm=
/i915/display/intel_fbdev.c
> index 673bcdfb7ff6..8c3b3c3fd0e0 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -67,6 +67,11 @@ struct intel_fbdev {
>  	struct mutex hpd_lock;
>  };
>=20=20
> +static struct intel_fbdev *to_intel_fbdev(struct drm_fb_helper *fb_helpe=
r)
> +{
> +	return container_of(fb_helper, struct intel_fbdev, helper);
> +}
> +
>  static struct intel_frontbuffer *to_frontbuffer(struct intel_fbdev *ifbd=
ev)
>  {
>  	return ifbdev->fb->frontbuffer;
> @@ -79,9 +84,7 @@ static void intel_fbdev_invalidate(struct intel_fbdev *=
ifbdev)
>=20=20
>  static int intel_fbdev_set_par(struct fb_info *info)
>  {
> -	struct drm_fb_helper *fb_helper =3D info->par;
> -	struct intel_fbdev *ifbdev =3D
> -		container_of(fb_helper, struct intel_fbdev, helper);
> +	struct intel_fbdev *ifbdev =3D to_intel_fbdev(info->par);
>  	int ret;
>=20=20
>  	ret =3D drm_fb_helper_set_par(info);
> @@ -93,9 +96,7 @@ static int intel_fbdev_set_par(struct fb_info *info)
>=20=20
>  static int intel_fbdev_blank(int blank, struct fb_info *info)
>  {
> -	struct drm_fb_helper *fb_helper =3D info->par;
> -	struct intel_fbdev *ifbdev =3D
> -		container_of(fb_helper, struct intel_fbdev, helper);
> +	struct intel_fbdev *ifbdev =3D to_intel_fbdev(info->par);
>  	int ret;
>=20=20
>  	ret =3D drm_fb_helper_blank(blank, info);
> @@ -108,9 +109,7 @@ static int intel_fbdev_blank(int blank, struct fb_inf=
o *info)
>  static int intel_fbdev_pan_display(struct fb_var_screeninfo *var,
>  				   struct fb_info *info)
>  {
> -	struct drm_fb_helper *fb_helper =3D info->par;
> -	struct intel_fbdev *ifbdev =3D
> -		container_of(fb_helper, struct intel_fbdev, helper);
> +	struct intel_fbdev *ifbdev =3D to_intel_fbdev(info->par);
>  	int ret;
>=20=20
>  	ret =3D drm_fb_helper_pan_display(var, info);
> @@ -136,8 +135,7 @@ static const struct fb_ops intelfb_ops =3D {
>  static int intelfb_alloc(struct drm_fb_helper *helper,
>  			 struct drm_fb_helper_surface_size *sizes)
>  {
> -	struct intel_fbdev *ifbdev =3D
> -		container_of(helper, struct intel_fbdev, helper);
> +	struct intel_fbdev *ifbdev =3D to_intel_fbdev(helper);
>  	struct drm_framebuffer *fb;
>  	struct drm_device *dev =3D helper->dev;
>  	struct drm_i915_private *dev_priv =3D to_i915(dev);
> @@ -193,8 +191,7 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
>  static int intelfb_create(struct drm_fb_helper *helper,
>  			  struct drm_fb_helper_surface_size *sizes)
>  {
> -	struct intel_fbdev *ifbdev =3D
> -		container_of(helper, struct intel_fbdev, helper);
> +	struct intel_fbdev *ifbdev =3D to_intel_fbdev(helper);
>  	struct intel_framebuffer *intel_fb =3D ifbdev->fb;
>  	struct drm_device *dev =3D helper->dev;
>  	struct drm_i915_private *dev_priv =3D to_i915(dev);

--=20
Jani Nikula, Intel Open Source Graphics Center
