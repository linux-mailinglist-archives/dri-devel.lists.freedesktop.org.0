Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A221F9DF1
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 18:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A91B76E4AA;
	Mon, 15 Jun 2020 16:58:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C2F6E4AA
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 16:58:35 +0000 (UTC)
IronPort-SDR: AGoGDIkUEcITLKpQeNdQLm61zVeftgus4TI+7pZvs6DLkqMjMhE9yKmoN1W3QnRINI0vUZkJCG
 3JnkXV2k2vzQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2020 09:58:34 -0700
IronPort-SDR: 7MvvpkDXECoxDtSIqCCutobgh7uUPicxbLQD5/1qPBGdypi6duM5fpiWJmcvbiYitVGVb3e/Mh
 qm4yhvUp+A5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,515,1583222400"; d="scan'208";a="261155586"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 15 Jun 2020 09:58:28 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 15 Jun 2020 19:57:58 +0300
Date: Mon, 15 Jun 2020 19:57:58 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 5/5] =?iso-8859-1?Q?drm=2Fte?=
 =?iso-8859-1?Q?gra=3A_plane=3A_Support_180=B0?= rotation
Message-ID: <20200615165758.GR6112@intel.com>
References: <20200614200121.14147-1-digetx@gmail.com>
 <20200614200121.14147-6-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200614200121.14147-6-digetx@gmail.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Derek Basehore <dbasehore@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 14, 2020 at 11:01:21PM +0300, Dmitry Osipenko wrote:
> Combining horizontal and vertical reflections gives us 180 degrees of
> rotation.
> =

> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/tegra/dc.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index f31bca27cde4..ddd9b88f8fce 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -608,6 +608,7 @@ static int tegra_plane_atomic_check(struct drm_plane =
*plane,
>  {
>  	struct tegra_plane_state *plane_state =3D to_tegra_plane_state(state);
>  	unsigned int rotation =3D DRM_MODE_ROTATE_0 |
> +				DRM_MODE_ROTATE_180 |

Leave this out ...

>  				DRM_MODE_REFLECT_X |
>  				DRM_MODE_REFLECT_Y;
>  	struct tegra_bo_tiling *tiling =3D &plane_state->tiling;
> @@ -659,6 +660,14 @@ static int tegra_plane_atomic_check(struct drm_plane=
 *plane,
>  	else
>  		plane_state->reflect_y =3D false;
>  =

> +	if (tegra_fb_is_bottom_up(state->fb))
> +		plane_state->reflect_y =3D true;
> +
> +	if (rotation & DRM_MODE_ROTATE_180) {
> +		plane_state->reflect_x =3D !plane_state->reflect_x;
> +		plane_state->reflect_y =3D !plane_state->reflect_y;
> +	}

... and drm_rotation_simplify() will do this for you.

Though the bottim_up() thing will need a slightly different tweak I
guess.

I'd write this as somehting like:
rotation =3D state->rotation;
if (bottom_up())
	rotation ^=3D DRM_MODE_REFLECT_Y;
rotation =3D drm_rotation_simplify(rotation,
				 DRM_MODE_ROTATE_0 |
				 DRM_MODE_REFLECT_X |
				 DRM_MODE_REFLECT_Y;

Also note my use of XOR for the bottom_up() handling. I suspect
the current code is already broken if you combine bottom_up()
and REFLECT_Y since it just uses an OR instead of an XOR. That's
assuming my hucnh what bottom_up() is supposed to do is correct.


> +
>  	/*
>  	 * Tegra doesn't support different strides for U and V planes so we
>  	 * error out if the user tries to display a framebuffer with such a
> @@ -720,7 +729,7 @@ static void tegra_plane_atomic_update(struct drm_plan=
e *plane,
>  	window.dst.h =3D drm_rect_height(&plane->state->dst);
>  	window.bits_per_pixel =3D fb->format->cpp[0] * 8;
>  	window.reflect_x =3D state->reflect_x;
> -	window.reflect_y =3D tegra_fb_is_bottom_up(fb) || state->reflect_y;
> +	window.reflect_y =3D state->reflect_y;
>  =

>  	/* copy from state */
>  	window.zpos =3D plane->state->normalized_zpos;
> @@ -806,6 +815,7 @@ static struct drm_plane *tegra_primary_plane_create(s=
truct drm_device *drm,
>  	err =3D drm_plane_create_rotation_property(&plane->base,
>  						 DRM_MODE_ROTATE_0,
>  						 DRM_MODE_ROTATE_0 |
> +						 DRM_MODE_ROTATE_180 |
>  						 DRM_MODE_REFLECT_X |
>  						 DRM_MODE_REFLECT_Y);
>  	if (err < 0)
> @@ -1094,6 +1104,7 @@ static struct drm_plane *tegra_dc_overlay_plane_cre=
ate(struct drm_device *drm,
>  	err =3D drm_plane_create_rotation_property(&plane->base,
>  						 DRM_MODE_ROTATE_0,
>  						 DRM_MODE_ROTATE_0 |
> +						 DRM_MODE_ROTATE_180 |
>  						 DRM_MODE_REFLECT_X |
>  						 DRM_MODE_REFLECT_Y);
>  	if (err < 0)
> -- =

> 2.26.0
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
