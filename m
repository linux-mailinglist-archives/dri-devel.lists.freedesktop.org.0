Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA9E5088FC
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 15:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD6C89AB7;
	Wed, 20 Apr 2022 13:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E85A10F0A2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 13:13:19 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id h27so2661382lfj.13
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 06:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=q0lpKuWdV/0rNmkF6iHx7jf0H4SMXS2T4Ut18564m6s=;
 b=l5CKYoN8D+SfqI/CmP5kCyde3IuP9ktGbhFbyajCJ1JNIhAmPrn5/TXFmmn1BQ0MrU
 KYgE3gidqa7uG+egsMrg4lXfnFwM3/qRX6K04f8DcSxfKKNlqZXb76U05IdeXNT4IoEq
 K39tjq0MmFlOxKkyJCvOnbOviaTC+dHqeJqK8gcsW2SgUiSMyZMMnzRIfPEE+9p6nuLE
 v7sfEI7Yshzf16DWuRIEjyhIpJFL8xpmUlyK+jk1IdcneBjsNeVjFeWB7KAKXxDQuncL
 iLBm1ASm9DQ8VeMYAqvmnd8W5UZNmhhyamcyYWib+P9Oq3TegqYoFCQKCu/VAJo9FoOw
 ScMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=q0lpKuWdV/0rNmkF6iHx7jf0H4SMXS2T4Ut18564m6s=;
 b=uaJe2/WDZtuH0W0EjWnS9mSyptRoQ/nPZmxAklQWAjXWPsVbqKfIFQY/kMc6fVEi4h
 VRUzgtLpAwlHoJ02Q/i9aO9FvSxZ6eRtoN4I//RvhbYuwPgB4qiNvN/LyUBYkwPuU5Gf
 A9rUeihV8r6RN6PvN8iblQKJOmOwwLrhKP1b69kW/UfVp5dvMqxsPQazkLNcAxwyF/oG
 AbZcKOls5gIE7vzEbabVu67u+97eweTaGWEYN2rJwbpNjeJfHcW4xARw4AVwrD8cmQUn
 MMGdk8vrQaCBMcUBrHi3F7No9Q9q3S2hFGe2i3BArD35+mm8khzcwQHFWRdb3ETGjrfh
 P2Iw==
X-Gm-Message-State: AOAM53318HF43As1QRb77u2Hxq3N0LBG62CwLB/60mFSAHYUP2WubfR9
 n2/e77OmJAufAxpEF7t+3o4=
X-Google-Smtp-Source: ABdhPJwDm8vggDBy0f32Q00soZ0+G8Lrm1j3AyRSvXS6Qc9K/9Wa1cVHi+1wegBkEvw8H/My2jTIJQ==
X-Received: by 2002:ac2:4bd0:0:b0:46b:c3ea:ea04 with SMTP id
 o16-20020ac24bd0000000b0046bc3eaea04mr14635533lfq.537.1650460397633; 
 Wed, 20 Apr 2022 06:13:17 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 q20-20020a05651232b400b00470010b25c3sm1459219lfe.206.2022.04.20.06.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 06:13:17 -0700 (PDT)
Date: Wed, 20 Apr 2022 16:13:05 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Igor Torrente <igormtorrente@gmail.com>
Subject: Re: [PATCH v5 7/9] drm: vkms: Supports to the case where primary
 plane doesn't match the CRTC
Message-ID: <20220420161305.5802a678@eldfell>
In-Reply-To: <20220404204515.42144-8-igormtorrente@gmail.com>
References: <20220404204515.42144-1-igormtorrente@gmail.com>
 <20220404204515.42144-8-igormtorrente@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ma4WOJ+JeclaAk_WcivFAqh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: hamohammed.sa@gmail.com, tzimmermann@suse.de, rodrigosiqueiramelo@gmail.com,
 airlied@linux.ie, leandro.ribeiro@collabora.com, melissa.srw@gmail.com,
 dri-devel@lists.freedesktop.org, tales.aparecida@gmail.com,
 ~lkcamp/patches@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Ma4WOJ+JeclaAk_WcivFAqh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon,  4 Apr 2022 17:45:13 -0300
Igor Torrente <igormtorrente@gmail.com> wrote:

> We will break the current assumption that the primary plane has the

Hi,

I'd say "remove" rather than "break". Breaking sounds bad but this is
good. :-)

> same size and position as CRTC.

...and that the primary plane is the bottom-most in zpos order, or is
even enabled. At least as far as the blending machinery is concerned.

>=20
> For that we will add CRTC dimension information to `vkms_crtc_state`
> and add a opaque black backgound color.
>=20
> Because now we need to fill the background, we had a loss in
> performance with this change. Results running the IGT[1] test
> `igt@kms_cursor_crc@pipe-a-cursor-512x512-onscreen` ten times:
>=20
> |                  Frametime                   |
> |:--------------------------------------------:|
> |  Implementation |  Previous |   This commit  |
> |:---------------:|:---------:|:--------------:|
> | frametime range |  5~18 ms  |     10~22 ms   |
> |     Average     |  8.47 ms  |     12.32 ms   |
>=20
> [1] IGT commit id: bc3f6833a12221a46659535dac06ebb312490eb4
>=20
> Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
> ---
>  Documentation/gpu/vkms.rst           |  3 +--
>  drivers/gpu/drm/vkms/vkms_composer.c | 32 +++++++++++++++++++---------
>  drivers/gpu/drm/vkms/vkms_crtc.c     |  4 ++++
>  drivers/gpu/drm/vkms/vkms_drv.h      |  2 ++
>  4 files changed, 29 insertions(+), 12 deletions(-)
>=20
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index a49e4ae92653..49db221c0f52 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -121,8 +121,7 @@ There's lots of plane features we could add support f=
or:
>  - ARGB format on primary plane: blend the primary plane into background =
with
>    translucent alpha.
> =20
> -- Support when the primary plane isn't exactly matching the output size:=
 blend
> -  the primary plane into the black background.
> +- Add background color KMS property[Good to get started].
> =20
>  - Full alpha blending on all planes.
> =20
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index cf24015bf90f..f80842227669 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -61,6 +61,15 @@ static bool check_y_limit(struct vkms_frame_info *fram=
e_info, int y)
>  	return false;
>  }
> =20
> +static void fill_background(struct pixel_argb_u16 *backgroud_color,

Hi,

this could be const struct pixel_argb_u16 *. Also a typo: missing n in
backgroud_color.

> +			    struct line_buffer *output_buffer)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < output_buffer->n_pixels; i++)
> +		output_buffer->pixels[i] =3D *backgroud_color;
> +}
> +
>  /**
>   * @wb_frame_info: The writeback frame buffer metadata
>   * @crtc_state: The crtc state
> @@ -78,22 +87,23 @@ static void blend(struct vkms_writeback_job *wb,
>  		  struct line_buffer *output_buffer, s64 row_size)
>  {
>  	struct vkms_plane_state **plane =3D crtc_state->active_planes;
> -	struct vkms_frame_info *primary_plane_info =3D plane[0]->frame_info;
>  	u32 n_active_planes =3D crtc_state->num_active_planes;
> =20
> -	int y_dst =3D primary_plane_info->dst.y1;
> -	int h_dst =3D drm_rect_height(&primary_plane_info->dst);
> -	int y_limit =3D y_dst + h_dst;
> +	struct pixel_argb_u16 background_color =3D (struct pixel_argb_u16) {
> +		.a =3D 0xffff
> +	};

Could be const and shorter, if that fits the kernel style:

	const struct pixel_arb_u16 background_color =3D { .a =3D 0xffff };

> +
> +	int crtc_y_limit =3D crtc_state->crtc_height;
>  	int y, i;
> =20
> -	for (y =3D y_dst; y < y_limit; y++) {
> -		plane[0]->format_func(output_buffer, primary_plane_info, y);
> +	for (y =3D 0; y < crtc_y_limit; y++) {
> +		fill_background(&background_color, output_buffer);
> =20
>  		/* If there are other planes besides primary, we consider the active
>  		 * planes should be in z-order and compose them associatively:

Is "associatively" the right word here?

>  		 * ((primary <- overlay) <- cursor)

The example (primary <- overlay) is not generally true with real hardware.

Maybe what you are trying to say is: The active planes are composed in
z-order.

>  		 */
> -		for (i =3D 1; i < n_active_planes; i++) {
> +		for (i =3D 0; i < n_active_planes; i++) {
>  			if (!check_y_limit(plane[i]->frame_info, y))
>  				continue;
> =20
> @@ -154,7 +164,7 @@ static int compose_active_planes(struct vkms_writebac=
k_job *active_wb,

As I mentioned on the previous patch, I think the finding of primary
plane (which was generally incorrect) should be removed here.

>  	if (WARN_ON(check_format_funcs(crtc_state, active_wb)))
>  		return -EINVAL;
> =20
> -	line_width =3D drm_rect_width(&primary_plane_info->dst);
> +	line_width =3D crtc_state->crtc_width;
>  	stage_buffer.n_pixels =3D line_width;
>  	output_buffer.n_pixels =3D line_width;
> =20
> @@ -175,8 +185,10 @@ static int compose_active_planes(struct vkms_writeba=
ck_job *active_wb,
>  		struct vkms_frame_info *wb_frame_info =3D &active_wb->frame_info;
> =20
>  		wb_format =3D wb_frame_info->fb->format->format;
> -		wb_frame_info->src =3D primary_plane_info->src;
> -		wb_frame_info->dst =3D primary_plane_info->dst;
> +		drm_rect_init(&wb_frame_info->src, 0, 0, crtc_state->crtc_width,
> +			      crtc_state->crtc_height);
> +		drm_rect_init(&wb_frame_info->dst, 0, 0, crtc_state->crtc_width,
> +			      crtc_state->crtc_height);

Why are these not set when the active_wb->frame_info is created? Can
the CRTC (video mode) be smaller than the wb buffer?

Somewhere you must have a check that wb buffer size can fit the crtc
size, or maybe they must be exactly the same size. At least setting
destination rectangle bigger than the buffer dimensions must be
impossible.

>  	}
> =20
>  	blend(active_wb, crtc_state, crc32, &stage_buffer,
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms=
_crtc.c
> index 57bbd32e9beb..4a37e243c2d7 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -248,7 +248,9 @@ static void vkms_crtc_atomic_begin(struct drm_crtc *c=
rtc,
>  static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
>  				   struct drm_atomic_state *state)
>  {
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(sta=
te, crtc);
>  	struct vkms_output *vkms_output =3D drm_crtc_to_vkms_output(crtc);
> +	struct drm_display_mode *mode =3D &crtc_state->mode;
> =20
>  	if (crtc->state->event) {
>  		spin_lock(&crtc->dev->event_lock);
> @@ -264,6 +266,8 @@ static void vkms_crtc_atomic_flush(struct drm_crtc *c=
rtc,
>  	}
> =20
>  	vkms_output->composer_state =3D to_vkms_crtc_state(crtc->state);
> +	vkms_output->composer_state->crtc_width =3D mode->hdisplay;
> +	vkms_output->composer_state->crtc_height =3D mode->vdisplay;

Is the crtc not keeping track of the current mode, do you really need
your own crtc_width and crtc_height?


Thanks,
pq

> =20
>  	spin_unlock_irq(&vkms_output->lock);
>  }
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index 2704cfb6904b..ab92d9f7b701 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -90,6 +90,8 @@ struct vkms_crtc_state {
>  	bool wb_pending;
>  	u64 frame_start;
>  	u64 frame_end;
> +	u16 crtc_width;
> +	u16 crtc_height;
>  };
> =20
>  struct vkms_output {


--Sig_/Ma4WOJ+JeclaAk_WcivFAqh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmJgBuEACgkQI1/ltBGq
qqdvwQ/8DEKbaBMDc+akJsAyqqcjjEwKgsQAZVEx1yqVgFzRGMnA/oyzpLi+zCdv
E4WHdLZJCvipPTnWmxLd3jf4nt52QWvkkUFxU0EFOE3SsMGb9ZOalCVdCg5PryWI
wcXRF74kFVgDAeBKPehmOox8xRxUIfrhFQzsAY25z6qBPxHFbUoPL6q9vjKAOBRm
7t8B3158lBv2zPFrX63Ih1gjjqJ/jYYVffDLCfVyUiUbBk36324+lrwVIf6eHkKu
Y13Xh7A+qTAhrzwuYr47a0pDiIx5xL/shFtJIlQthCJ0UPHDlf6EHEilQJB4tNYj
r83q5DbfmBXSOjHdbZvKCn6TfG329vaWyNwJMnBzY5riArqZSI4RvXGRCz6F+oqm
13/lThgWCLQsEv05YtYB4WJl0RmfjKZ1LafKrC5FlqfH+8w0jUvs1lqnWjmlvPTG
9cIvhXq4DSEI53Fpp+YUSPbEEtVc1W7zHcuM/NFZZrid5E1jsd8tTneTNBy7XG2K
VWuIFaeF57VceifjMh5ae/WDc2Cluthn1cCg432WjYqc+UMxc0MlrgLqZv3O/wma
PqmeLd+bgXAdXs+lok4vYqLNhP/jOv62CRIn5hEh6+x+m0ir+aTr37Bx72rHqSvh
iizcy+NH1F1DHq17GRoVPgvTlUmx++jzdGgzZfuklAdtlcJhV+4=
=ysyR
-----END PGP SIGNATURE-----

--Sig_/Ma4WOJ+JeclaAk_WcivFAqh--
