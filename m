Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB1925F473
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 09:57:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD8D26E2D3;
	Mon,  7 Sep 2020 07:57:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7E96E2D3
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 07:57:20 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id s13so13388452wmh.4
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 00:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=+rjjPCHYlTF/NZT9oY7eJi0tfq04Fr6TYzNkChk06Ak=;
 b=Didogix5e5IC5mOLgQmO3UxJ+1/jdCHsjBvoYiHPl/y+4tI27WUwXawD+Pvzc5jpA9
 G9nZLAy1/mkAZl9nibcrS2OURouM8f1AIJj0VQIg3FXhCaIdUrlEh/aswYHmsTI4M13H
 2LDHAOgLbuJxFgarJaX0klsVFphdD0Sivkdtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=+rjjPCHYlTF/NZT9oY7eJi0tfq04Fr6TYzNkChk06Ak=;
 b=DsOF4eiE2pBX2gmDMnLi+mUSzafeewRY6uCuRwZ0nofbgJyr5mvmd7Pff5ZLBdtlMg
 /e6QCplVP31bfmAJymDOSJO7EddylN8A6M25HYYSfinQtbPUBQ2P5UIxn5vbGwceKRhc
 85NzgO2t5VTaS4pfrPQbsBkRJOwmIJ4fW4w6vyiARHGob2XDjj/02gxJYWJxRiRzQnAv
 cfFvKwIwApkaYTNIjNi+HYaj2p66kd862fW2F4fG862oZYpxt5NwpB2L9FBcs2wQrF/B
 U8vZRpkC+s1FkdOnV3ereE712+qmSSb5vGP8P30ZV+UkdFM7ps3nY0aZ9Tie7JFmP0sP
 /rgg==
X-Gm-Message-State: AOAM533jjz8x3XkikMcjKXvhZY1el6B9F0aa+4rniQrHrU7O20PuI+3r
 fShE+wtIkobmsF5amrihki9RrhbU5kiLt5YE
X-Google-Smtp-Source: ABdhPJwYj9d+C9Bl2UBlwnKJe8hT10sTZ7Te1knv5Na18mFtcxX4c+2tiYSTI/DSy38GiApxu+a+dw==
X-Received: by 2002:a7b:c4d9:: with SMTP id g25mr19137732wmk.15.1599465439345; 
 Mon, 07 Sep 2020 00:57:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p11sm24446705wma.11.2020.09.07.00.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 00:57:18 -0700 (PDT)
Date: Mon, 7 Sep 2020 09:57:16 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH v2] drm/amdgpu/dc: Require primary plane to be enabled
 whenever the CRTC is
Message-ID: <20200907075716.GO2352366@phenom.ffwll.local>
References: <20200821165758.1106210-1-michel@daenzer.net>
 <20200904104304.41246-1-michel@daenzer.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200904104304.41246-1-michel@daenzer.net>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Leo Li <sunpeng.li@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 04, 2020 at 12:43:04PM +0200, Michel D=E4nzer wrote:
> From: Michel D=E4nzer <mdaenzer@redhat.com>
> =

> Don't check drm_crtc_state::active for this either, per its
> documentation in include/drm/drm_crtc.h:
> =

>  * Hence drivers must not consult @active in their various
>  * &drm_mode_config_funcs.atomic_check callback to reject an atomic
>  * commit.
> =

> atomic_remove_fb disables the CRTC as needed for disabling the primary
> plane.
> =

> This prevents at least the following problems if the primary plane gets
> disabled (e.g. due to destroying the FB assigned to the primary plane,
> as happens e.g. with mutter in Wayland mode):
> =

> * The legacy cursor ioctl returned EINVAL for a non-0 cursor FB ID
>   (which enables the cursor plane).
> * If the cursor plane was enabled, changing the legacy DPMS property
>   value from off to on returned EINVAL.
> =

> v2:
> * Minor changes to code comment and commit log, per review feedback.
> =

> GitLab: https://gitlab.gnome.org/GNOME/mutter/-/issues/1108
> GitLab: https://gitlab.gnome.org/GNOME/mutter/-/issues/1165
> GitLab: https://gitlab.gnome.org/GNOME/mutter/-/issues/1344
> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Michel D=E4nzer <mdaenzer@redhat.com>

Commit message agrees with my understand of this maze now, so:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 32 ++++++-------------
>  1 file changed, 10 insertions(+), 22 deletions(-)
> =

> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 45f5f4b7024d..c5f9452490d6 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -5269,19 +5269,6 @@ static void dm_crtc_helper_disable(struct drm_crtc=
 *crtc)
>  {
>  }
>  =

> -static bool does_crtc_have_active_cursor(struct drm_crtc_state *new_crtc=
_state)
> -{
> -	struct drm_device *dev =3D new_crtc_state->crtc->dev;
> -	struct drm_plane *plane;
> -
> -	drm_for_each_plane_mask(plane, dev, new_crtc_state->plane_mask) {
> -		if (plane->type =3D=3D DRM_PLANE_TYPE_CURSOR)
> -			return true;
> -	}
> -
> -	return false;
> -}
> -
>  static int count_crtc_active_planes(struct drm_crtc_state *new_crtc_stat=
e)
>  {
>  	struct drm_atomic_state *state =3D new_crtc_state->state;
> @@ -5345,19 +5332,20 @@ static int dm_crtc_helper_atomic_check(struct drm=
_crtc *crtc,
>  		return ret;
>  	}
>  =

> -	/* In some use cases, like reset, no stream is attached */
> -	if (!dm_crtc_state->stream)
> -		return 0;
> -
>  	/*
> -	 * We want at least one hardware plane enabled to use
> -	 * the stream with a cursor enabled.
> +	 * We require the primary plane to be enabled whenever the CRTC is, oth=
erwise
> +	 * drm_mode_cursor_universal may end up trying to enable the cursor pla=
ne while all other
> +	 * planes are disabled, which is not supported by the hardware. And the=
re is legacy
> +	 * userspace which stops using the HW cursor altogether in response to =
the resulting EINVAL.
>  	 */
> -	if (state->enable && state->active &&
> -	    does_crtc_have_active_cursor(state) &&
> -	    dm_crtc_state->active_planes =3D=3D 0)
> +	if (state->enable &&
> +	    !(state->plane_mask & drm_plane_mask(crtc->primary)))
>  		return -EINVAL;
>  =

> +	/* In some use cases, like reset, no stream is attached */
> +	if (!dm_crtc_state->stream)
> +		return 0;
> +
>  	if (dc_validate_stream(dc, dm_crtc_state->stream) =3D=3D DC_OK)
>  		return 0;
>  =

> -- =

> 2.28.0
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
