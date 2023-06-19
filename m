Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 181F2734CBC
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 09:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C143B10E19B;
	Mon, 19 Jun 2023 07:54:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E008110E19B
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 07:54:39 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f62cf9755eso3869361e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 00:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687161277; x=1689753277;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=FISB+ubitonY+Bg3mf4VS8LTS55df+ezUIj9F3wZhm4=;
 b=j8VnPd6MqJ/OUb3VkPoFDSwzsRbGCL3ofrqCzxCKRk5M72HvG9D9tKqQqo5lYdT84a
 R/zGRdYarl4x3kF8QT8n8i/KZkWeea3LH9gAAxpD2y0KuGIX//A3tXvRoag4fPhU7hUp
 Xe+bSLdmcH+RSbvEXYCrXDQtD5la7Pi7LZn4LynDhezHiT8jNrucBk4gKBrTiuNbC6C6
 EPQGfUf+iK5poqtjaQ7P88o60otAdqYnqGPmZaXfXEli1UyeREC+P/bEZMbYwnNgmugs
 rFsrJbDvgov6TbCqCoarSrY6YKOXgMgJCs59wtKiHSZc3UDWVxZEVXwF2UZS2zMxwklD
 B55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687161277; x=1689753277;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FISB+ubitonY+Bg3mf4VS8LTS55df+ezUIj9F3wZhm4=;
 b=QqMDLBsa0mvK3qEBTSIhtqiUmV6lwOW8diRXiRRz6GVXRanDFUfXgqDbLP8rVrjnYY
 /L+8Qe7qI0nnJnp99o61yG5ndaHg8aRXDYWuI/13saz8tpSGGLdNZSU8vmRKlmBm3wAP
 iMso3R+0v+gEX3KeHDkxDmgwQQRrjPC8PhvjfSKEAbUGDs91zzGSbfcfedZ+UQh+zXMd
 oE/cLGw9my7laOVkptcUm9ArnI+ZgrbKbAHBuZSRwIpxiFmGAK+KVRaNR8K9FRfi/qBv
 8JC5CI1kAJheOa8Gmzc+U4tgEqIh/NiDwasIwsOv0I6G5zZQGNNskZY7IXu0um/bWPiq
 4M1w==
X-Gm-Message-State: AC+VfDyXybZ3vHfVj4VETDY2uofFFDhc3i81l8Y20VmZGYkElj1FS/rl
 XyqiVfnufp4/QhXIpBmecWc=
X-Google-Smtp-Source: ACHHUZ5zUWfvbSANwnq9UM/vmZnJaL/FobST1vT5RFoBxk89CaqUAGRMKInPkxGk0arZ+DwP9sMMTg==
X-Received: by 2002:ac2:504d:0:b0:4f8:5964:ac6d with SMTP id
 a13-20020ac2504d000000b004f85964ac6dmr4301974lfm.36.1687161276464; 
 Mon, 19 Jun 2023 00:54:36 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 j12-20020ac2454c000000b004f86bcd1f02sm601317lfm.258.2023.06.19.00.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 00:54:36 -0700 (PDT)
Date: Mon, 19 Jun 2023 10:54:24 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Arthur Grillo <arthurgrillo@riseup.net>
Subject: Re: [PATCH v3] drm/vkms: Add support to 1D gamma LUT
Message-ID: <20230619105424.3d8f2d11@eldfell>
In-Reply-To: <20230615200157.960630-1-arthurgrillo@riseup.net>
References: <20230615200157.960630-1-arthurgrillo@riseup.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Zk+uZpoqDvm0aB.JBzZfPNb";
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
Cc: hamohammed.sa@gmail.com, aleixpol@kde.org, andrealmeid@riseup.net,
 rodrigosiqueiramelo@gmail.com, xaver.hugl@gmail.com, mdaenzer@redhat.com,
 dri-devel@lists.freedesktop.org, victoria@system76.com, mwen@igalia.com,
 mairacanal@riseup.net, jadahl@redhat.com, uma.shankar@intel.com,
 sebastian.wick@redhat.com, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Zk+uZpoqDvm0aB.JBzZfPNb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 15 Jun 2023 17:01:57 -0300
Arthur Grillo <arthurgrillo@riseup.net> wrote:

> Support a 1D gamma LUT with interpolation for each color channel on the
> VKMS driver. Add a check for the LUT length by creating
> vkms_atomic_check().
>=20
> Tested with:
> igt@kms_color@gamma
> igt@kms_color@legacy-gamma
> igt@kms_color@invalid-gamma-lut-sizes
>=20
> v2:
>     - Add interpolation between the values of the LUT (Simon Ser)
>=20
> v3:
>     - s/ratio/delta (Pekka)
>     - s/color_channel/channel_value (Pekka)
>     - s/lut_area/lut_channel
>     - Store the `drm_color_lut`, `lut_length`, and
>       `channel_value2index_ratio` inside a struct called `vkms_lut`
>       (Pekka)
>     - Pre-compute some constants values used through the LUT procedure
>       (Pekka)
>     - Change the switch statement to a cast to __u16* (Pekka)
>     - Make the apply_lut_to_channel_value return the computation result
>       (Pekka)
>=20
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>

Hi Arthur,

thanks for the changes! All my notes were addressed and I think it looks
better and maybe even simpler now. Looks fine to me, though I don't
know the surrounding code.

The kernel test robot rightfully points out an unused variable. With
that fixed:

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

Maybe there should be a comment with 'enum lut_channel` that the values
depend on the layout of 'struct drm_color_lut'?


Thanks,
pq


> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 82 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_crtc.c     |  5 ++
>  drivers/gpu/drm/vkms/vkms_drv.c      | 20 ++++++-
>  drivers/gpu/drm/vkms/vkms_drv.h      |  9 +++
>  4 files changed, 115 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index 906d3df40cdb..9e735a963b81 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -6,6 +6,7 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_blend.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_fixed.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_vblank.h>
>  #include <linux/minmax.h>
> @@ -89,6 +90,69 @@ static void fill_background(const struct pixel_argb_u1=
6 *background_color,
>  		output_buffer->pixels[i] =3D *background_color;
>  }
> =20
> +// lerp(a, b, t) =3D a + (b - a) * t
> +static u16 lerp_u16(u16 a, u16 b, s64 t)
> +{
> +	s64 a_fp =3D drm_int2fixp(a);
> +	s64 b_fp =3D drm_int2fixp(b);
> +
> +	s64 delta =3D drm_fixp_mul(b_fp - a_fp,  t);
> +
> +	return drm_fixp2int(a_fp + delta);
> +}
> +
> +static s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_v=
alue)
> +{
> +	s64 color_channel_fp =3D drm_int2fixp(channel_value);
> +
> +	return drm_fixp_mul(color_channel_fp, lut->channel_value2index_ratio);
> +}
> +
> +enum lut_channel {
> +	LUT_RED =3D 0,
> +	LUT_GREEN,
> +	LUT_BLUE,
> +	LUT_RESERVED
> +};
> +
> +static u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, =
u16 channel_value,
> +				      enum lut_channel channel)
> +{
> +	s64 lut_index =3D get_lut_index(lut, channel_value);
> +
> +	/*
> +	 * This checks if `struct drm_color_lut` had any gap added by the compi=
ler
> +	 * between the struct fields.
> +	 */
> +	static_assert(sizeof(struct drm_color_lut) =3D=3D sizeof(__u16) * 4);
> +
> +	u16 *floor_lut_value =3D (__u16 *)&lut->base[drm_fixp2int(lut_index)];
> +	u16 *ceil_lut_value =3D (__u16 *)&lut->base[drm_fixp2int_ceil(lut_index=
)];
> +
> +	u16 floor_channel_value =3D floor_lut_value[channel];
> +	u16 ceil_channel_value =3D ceil_lut_value[channel];
> +
> +	return lerp_u16(floor_channel_value, ceil_channel_value,
> +			lut_index & DRM_FIXED_DECIMAL_MASK);
> +}
> +
> +static void apply_lut(const struct vkms_crtc_state *crtc_state, struct l=
ine_buffer *output_buffer)
> +{
> +	if (!crtc_state->gamma_lut.base)
> +		return;
> +
> +	if (!crtc_state->gamma_lut.lut_length)
> +		return;
> +
> +	for (size_t x =3D 0; x < output_buffer->n_pixels; x++) {
> +		struct pixel_argb_u16 *pixel =3D &output_buffer->pixels[x];
> +
> +		pixel->r =3D apply_lut_to_channel_value(&crtc_state->gamma_lut, pixel-=
>r, LUT_RED);
> +		pixel->g =3D apply_lut_to_channel_value(&crtc_state->gamma_lut, pixel-=
>g, LUT_GREEN);
> +		pixel->b =3D apply_lut_to_channel_value(&crtc_state->gamma_lut, pixel-=
>b, LUT_BLUE);
> +	}
> +}
> +
>  /**
>   * @wb_frame_info: The writeback frame buffer metadata
>   * @crtc_state: The crtc state
> @@ -128,6 +192,8 @@ static void blend(struct vkms_writeback_job *wb,
>  					    output_buffer);
>  		}
> =20
> +		apply_lut(crtc_state, output_buffer);
> +
>  		*crc32 =3D crc32_le(*crc32, (void *)output_buffer->pixels, row_size);
> =20
>  		if (wb)
> @@ -242,6 +308,22 @@ void vkms_composer_worker(struct work_struct *work)
>  	crtc_state->frame_start =3D 0;
>  	crtc_state->frame_end =3D 0;
>  	crtc_state->crc_pending =3D false;
> +
> +	if (crtc->state->gamma_lut) {
> +		s64 max_lut_index_fp;
> +		s64 u16_max_fp =3D drm_int2fixp(0xffff);
> +
> +		crtc_state->gamma_lut.base =3D (struct drm_color_lut *)crtc->state->ga=
mma_lut->data;
> +		crtc_state->gamma_lut.lut_length =3D
> +			crtc->state->gamma_lut->length / sizeof(struct drm_color_lut);
> +		max_lut_index_fp =3D drm_int2fixp(crtc_state->gamma_lut.lut_length  - =
1);
> +		crtc_state->gamma_lut.channel_value2index_ratio =3D drm_fixp_div(max_l=
ut_index_fp,
> +									       u16_max_fp);
> +
> +	} else {
> +		crtc_state->gamma_lut.base =3D NULL;
> +	}
> +
>  	spin_unlock_irq(&out->composer_lock);
> =20
>  	/*
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms=
_crtc.c
> index 515f6772b866..4854a390b167 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -248,6 +248,7 @@ static void vkms_crtc_atomic_flush(struct drm_crtc *c=
rtc,
>  				   struct drm_atomic_state *state)
>  {
>  	struct vkms_output *vkms_output =3D drm_crtc_to_vkms_output(crtc);
> +	struct vkms_color_lut *gamma_lut;
> =20
>  	if (crtc->state->event) {
>  		spin_lock(&crtc->dev->event_lock);
> @@ -263,6 +264,7 @@ static void vkms_crtc_atomic_flush(struct drm_crtc *c=
rtc,
>  	}
> =20
>  	vkms_output->composer_state =3D to_vkms_crtc_state(crtc->state);
> +	gamma_lut =3D &vkms_output->composer_state->gamma_lut;
> =20
>  	spin_unlock_irq(&vkms_output->lock);
>  }
> @@ -290,6 +292,9 @@ int vkms_crtc_init(struct drm_device *dev, struct drm=
_crtc *crtc,
> =20
>  	drm_crtc_helper_add(crtc, &vkms_crtc_helper_funcs);
> =20
> +	drm_mode_crtc_set_gamma_size(crtc, VKMS_LUT_SIZE);
> +	drm_crtc_enable_color_mgmt(crtc, 0, false, VKMS_LUT_SIZE);
> +
>  	spin_lock_init(&vkms_out->lock);
>  	spin_lock_init(&vkms_out->composer_lock);
> =20
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_=
drv.c
> index e3c9c9571c8d..dd0af086e7fa 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -120,9 +120,27 @@ static const struct drm_driver vkms_driver =3D {
>  	.minor			=3D DRIVER_MINOR,
>  };
> =20
> +static int vkms_atomic_check(struct drm_device *dev, struct drm_atomic_s=
tate *state)
> +{
> +	struct drm_crtc *crtc;
> +	struct drm_crtc_state *new_crtc_state;
> +	int i;
> +
> +	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
> +		if (!new_crtc_state->gamma_lut || !new_crtc_state->color_mgmt_changed)
> +			continue;
> +
> +		if (new_crtc_state->gamma_lut->length / sizeof(struct drm_color_lut *)
> +		    > VKMS_LUT_SIZE)
> +			return -EINVAL;
> +	}
> +
> +	return drm_atomic_helper_check(dev, state);
> +}
> +
>  static const struct drm_mode_config_funcs vkms_mode_funcs =3D {
>  	.fb_create =3D drm_gem_fb_create,
> -	.atomic_check =3D drm_atomic_helper_check,
> +	.atomic_check =3D vkms_atomic_check,
>  	.atomic_commit =3D drm_atomic_helper_commit,
>  };
> =20
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index 5f1a0a44a78c..f16b5d7b81ef 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -23,6 +23,8 @@
> =20
>  #define NUM_OVERLAY_PLANES 8
> =20
> +#define VKMS_LUT_SIZE 256
> +
>  struct vkms_frame_info {
>  	struct drm_framebuffer *fb;
>  	struct drm_rect src, dst;
> @@ -65,6 +67,12 @@ struct vkms_plane {
>  	struct drm_plane base;
>  };
> =20
> +struct vkms_color_lut {
> +	struct drm_color_lut *base;
> +	size_t lut_length;
> +	s64 channel_value2index_ratio;
> +};
> +
>  /**
>   * vkms_crtc_state - Driver specific CRTC state
>   * @base: base CRTC state
> @@ -80,6 +88,7 @@ struct vkms_crtc_state {
>  	/* stack of active planes for crc computation, should be in z order */
>  	struct vkms_plane_state **active_planes;
>  	struct vkms_writeback_job *active_writeback;
> +	struct vkms_color_lut gamma_lut;
> =20
>  	/* below four are protected by vkms_output.composer_lock */
>  	bool crc_pending;


--Sig_/Zk+uZpoqDvm0aB.JBzZfPNb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmSQCbAACgkQI1/ltBGq
qqe9nRAAhaAdJ5Ma9cOjwtzlrdDi2+0NXluUYi/IJ6bgAl4kAjjs1mRSldZQ7xr2
PKk1Dy1XJdgjw+Cwq8zb1Lhz57RJCP+4cDkXkB6d7HPalGNFgNtYdEKCVsPLZPmr
AXeXkovhfFf9XZn0vzjkTM15AUohBBkiIIoYBS7rorYFCELs978Otl9mjORxjh6W
z1eNUJsHnMiSRIGghzV9omeKicq2/rTPzYP0tahjXHHq3eweI1plFVW/zWlSqwtd
6c5I7xyyjdRymEh9MLiYH9Ih05n5wcS1RKxecZMNZJhobhgajztY+ac/wlu5m12C
1u+GJmbFBqPi93RwgPC0makmMoiOD7jqyLXlbkH8Y5W/tMO7rQJNxYa66amXl/x/
OdbZI6HLoq3kI5KcWOPS90VFCFfsSCDGfNFCjIBga2GIXy/TeDMtTdJnsCCeChLo
M9zhbxsYRpQUA3O5xUj0XrCUxPR3lGszMCBd2/25/G6uCToryINgBjOxY6bVyzPv
we0oP6hvsHt1tpwQ7rGMm3UQpzvgJm4qJEpos6FPB5DO9LKarTsLOTU9kgErEQwj
Y3VX5Mx3nxcHW8h+DcYtlhRvzFstS91Za824zinx93JqntfSPY9mC3V9D9MVvkEL
LJWVU8L95eYUo/gPYRezd+g7R8+P3TgeUwY3JQs3Tk3asziQSm8=
=zNEY
-----END PGP SIGNATURE-----

--Sig_/Zk+uZpoqDvm0aB.JBzZfPNb--
