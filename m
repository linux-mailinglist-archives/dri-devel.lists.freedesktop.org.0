Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B59747E2C4
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 12:57:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 492EA10E334;
	Thu, 23 Dec 2021 11:57:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6801B10E334;
 Thu, 23 Dec 2021 11:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640260622; x=1671796622;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=l7/Ec1k8g+Fuqc+4+s0zclAcRcBVVg9oTnf/81Ddgz8=;
 b=kYc3sNibFvI+YB1x1ukeZUl8W29DH/QdJbCOecGr02Q7EdxTHm7h0cU0
 BE1KQp1pYgg9j2meS62cnO2f5Tio7fngBLC3i70N88bjc5QfA0+rwliIh
 qCBZ/yK24fOXIha9bpOzcSbJVLXZ5aFrGfblWJFvYjKZknfW65fxhwHMh
 1i7kpK+p1PGkIgXPueCa3c4TCvk4FW3V5s4BpxduA7Qs2Dx4aNOnftnn9
 2mtqOvk64GwwR4wSpZMM29vXG12c76onjergnNWfa0B0uNK+swa+mcbnI
 6jdPJTgiodCPoYrdvgh4cDhKDe5PZYv6thsnW25kqljYE1vuDp6J2rN1s w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="220822599"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="220822599"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:57:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="607735683"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.147])
 by FMSMGA003.fm.intel.com with SMTP; 23 Dec 2021 03:56:55 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 23 Dec 2021 13:56:55 +0200
Date: Thu, 23 Dec 2021 13:56:55 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Subject: Re: [PATCH v2 1/6] =?iso-8859-1?Q?drm=2Fpl?=
 =?iso-8859-1?Q?ane=3A_Make_format=5Fmod=5Fsupported_truly=A0optional?=
Message-ID: <YcRkB7uWyt4EbcZm@intel.com>
References: <20211222090552.25972-1-jose.exposito89@gmail.com>
 <20211222090552.25972-2-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211222090552.25972-2-jose.exposito89@gmail.com>
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
Cc: marex@denx.de, mcoquelin.stm32@gmail.com, kernel@pengutronix.de,
 s.hauer@pengutronix.de, tzimmermann@suse.de, airlied@linux.ie,
 intel-gfx@lists.freedesktop.org, alexandre.torgue@foss.st.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 yannick.fertre@foss.st.com, linux-imx@nxp.com, benjamin.gaignard@linaro.org,
 rodrigo.vivi@intel.com, dmitry.baryshkov@linaro.org, shawnguo@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 philippe.cornu@foss.st.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 22, 2021 at 10:05:47AM +0100, José Expósito wrote:
> The documentation for "drm_plane_funcs.format_mod_supported" reads:
> 
>   This *optional* hook is used for the DRM to determine if the given
>   format/modifier combination is valid for the plane. This allows the
>   DRM to generate the correct format bitmask (which formats apply to
>   which modifier), and to validate modifiers at atomic_check time.
> 
>   *If not present*, then any modifier in the plane's modifier
>   list is allowed with any of the plane's formats.
> 
> However, where the function is not present, an invalid IN_FORMATS blob
> property with modifiers but no formats is exposed to user-space.
> 
> This breaks the latest Weston [1]. For testing purposes, I extracted the
> affected code to a standalone program [2].
> 
> Make "create_in_format_blob" behave as documented.
> 
> [1] https://gitlab.freedesktop.org/wayland/weston/-/blob/9.0/libweston/backend-drm/kms.c#L431
> [2] https://github.com/JoseExposito/drm-sandbox/blob/main/in_formats.c
> 
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> ---
>  drivers/gpu/drm/drm_plane.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 82afb854141b..c1186b7215ee 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -202,17 +202,13 @@ static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane
>  
>  	memcpy(formats_ptr(blob_data), plane->format_types, formats_size);
>  
> -	/* If we can't determine support, just bail */
> -	if (!plane->funcs->format_mod_supported)
> -		goto done;
> -
>  	mod = modifiers_ptr(blob_data);
>  	for (i = 0; i < plane->modifier_count; i++) {
>  		for (j = 0; j < plane->format_count; j++) {
> -			if (plane->funcs->format_mod_supported(plane,
> +			if (!plane->funcs->format_mod_supported ||
> +			    plane->funcs->format_mod_supported(plane,
>  							       plane->format_types[j],
>  							       plane->modifiers[i])) {

So instead of skipping the whole loop you just skip doing anything
inside the loop? Can't see how that achieves anything at all.

https://patchwork.freedesktop.org/series/83018/
is what I had in mind earlier but no one reviewed it and 
the discussion veered off track IIRC.

-- 
Ville Syrjälä
Intel
