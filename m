Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3575B7259FE
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 11:20:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F8B10E492;
	Wed,  7 Jun 2023 09:20:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8172010E492
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 09:20:33 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f004cc54f4so8857880e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 02:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686129631; x=1688721631;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=exqfc/jRMTKPt7g8amXPumcIHWOEiZA1InvKpSbxkng=;
 b=L3yJ9i5o6RbiwbmMzEwKRKKlSRSDUD9SKQE1N8SP4NJ/9w1ACYrUdNN3bLtXejXO8k
 Yxygujd/9VOsou2Uepak0K7xnokczHXlK55i2nUw1WPQccNOtmhLaubPeXVSc8lxBEIa
 URRJLWXz2HRLFxoDcHTizvFen9zU/VgrV4Xo/75FlUBCj0bc3KWFFIHPB53Zl3Dn9TYv
 jOw7zbAHoijUoitfU026m3pit6Tx2tuESK8OPd/V5i3LD+ssC82mY0qdJS+zWiaZF9wh
 PEiqwKWttS7DMteSPCF8y9CimJT/0dAJsz2+ipc4iBliCxTqsHOReh/wnVTQsNnFVIXe
 84Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686129631; x=1688721631;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=exqfc/jRMTKPt7g8amXPumcIHWOEiZA1InvKpSbxkng=;
 b=W461OGWFveMZzgRldctnOyunHzGnd+SCnEnKzNvGxHZLrIOnnIdJl8XZJEQogweKuY
 TxCKR8TRX3ZSQ0Vb923O84KhN8prs8rKP+lNbfIYYumd/phfN+Q+U+K7gjY2Ec9MoGl7
 QtYyyMK9c7MlxFXLutgqoWvgzI7WrYwJOQBo2lwpVUzLwVu30GgeF3RNrrDYmp+8L9jA
 Zr4ehHdZTj4qgAXj12SpCGEAFEPF4qxbQvo5oy19ytpY+T98XhTd29BI5OcCaEDDHIRJ
 IWvdXS4Oq6Hyurtz05nR9heOliAClpKTW6JvtKrMPe/YWL/JGM7ItTl8+YKNyBQAhhBg
 tJ9g==
X-Gm-Message-State: AC+VfDxTEdJdf0FRokYgo0rIKeBbGBQ2UKTA0aEdvxmfQXrTpmKYlnrO
 mfEcYdSF2MEbh/eV54Ft2I4=
X-Google-Smtp-Source: ACHHUZ6WXVjjx2iy2xrQZcubcG9vXAMFseXPq4KIv5usdjlC0v6PjnL2D8Om+SJR2jCP/pm7RK6I6Q==
X-Received: by 2002:a05:6512:930:b0:4ec:7b87:931a with SMTP id
 f16-20020a056512093000b004ec7b87931amr1812508lft.13.1686129630544; 
 Wed, 07 Jun 2023 02:20:30 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 x11-20020ac2488b000000b004f6461ab35asm27888lfc.65.2023.06.07.02.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 02:20:30 -0700 (PDT)
Date: Wed, 7 Jun 2023 12:20:26 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Arthur Grillo <arthurgrillo@riseup.net>
Subject: Re: [PATCH v2] drm/vkms: Add support to 1D gamma LUT
Message-ID: <20230607122026.2fe3f376@eldfell>
In-Reply-To: <20230606205351.1288556-1-arthurgrillo@riseup.net>
References: <20230606205351.1288556-1-arthurgrillo@riseup.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.24; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vLLQeN.by1BUkB8Bd3H=EaO";
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
Cc: hamohammed.sa@gmail.com, aleixpol@kde.org, rodrigosiqueiramelo@gmail.com,
 xaver.hugl@gmail.com, mdaenzer@redhat.com, dri-devel@lists.freedesktop.org,
 victoria@system76.com, mwen@igalia.com, mairacanal@riseup.net,
 jadahl@redhat.com, uma.shankar@intel.com, sebastian.wick@redhat.com,
 joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/vLLQeN.by1BUkB8Bd3H=EaO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue,  6 Jun 2023 17:53:52 -0300
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
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 97 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_crtc.c     |  3 +
>  drivers/gpu/drm/vkms/vkms_drv.c      | 20 +++++-
>  drivers/gpu/drm/vkms/vkms_drv.h      |  2 +
>  4 files changed, 121 insertions(+), 1 deletion(-)
>=20

Hi,

here are some casual suggestions that I hope are helpful, nothing more.

> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index 906d3df40cdb..24bffd98ba49 100644
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
> @@ -89,6 +90,100 @@ static void fill_background(const struct pixel_argb_u=
16 *background_color,
>  		output_buffer->pixels[i] =3D *background_color;
>  }
> =20
> +// lerp(a, b, t) =3D a + (b - a) * t
> +static u16 lerp_u16(u16 a, u16 b, s64 t)
> +{
> +	s64 a_fp =3D drm_int2fixp(a);
> +	s64 b_fp =3D drm_int2fixp(b);
> +
> +	s64 ratio =3D drm_fixp_mul(b_fp - a_fp,  t);

This is more like a delta than a ratio. A ratio would be a unitless
x/y, but delta has the same units as a_fp.

> +
> +	return drm_fixp2int(a_fp + ratio);
> +}
> +
> +static s64 get_lut_index(u16 color_channel, size_t lut_length)
> +{
> +	const s64 max_lut_index_fp =3D drm_int2fixp(lut_length  - 1);
> +	const s64 u16_max_fp =3D drm_int2fixp(0xffff);
> +
> +	s64 ratio =3D drm_fixp_div(max_lut_index_fp, u16_max_fp);

This division is a constant for a specific LUT. Are you sure it won't
be calculated repeatedly for every transformed pixel component?

> +
> +	s64 color_channel_fp =3D drm_int2fixp(color_channel);
> +
> +	return drm_fixp_mul(color_channel_fp, ratio);

First this multiplication looked really strange, because "color
channel" is one of R, G or B, so likely 0, 1, or 2. But it's not color
channel, it is channel value.

> +}
> +
> +enum lut_area {
> +	LUT_RED,
> +	LUT_GREEN,
> +	LUT_BLUE,
> +	LUT_RESERVED
> +};
> +
> +static void apply_lut_to_color_channel(u16 *color_channel, enum lut_area=
 area,
> +				       struct drm_color_lut *lut, size_t lut_length)

"u16 *color_channel" sounds like it is a pointer to a whole row of a
specific component of many pixels. I got confused, because I think
everything around here uses packed and not planar pixel layout, so it
looked really weird.

If you have nothing to return from a function otherwise, return the
computation result. In this case, pass the input value by-value, since
the indirection is not necessary. That makes the function easier to
read. Ideally the compiler will inline it anyway - a real function call
in innermost loop would be costly.

I suspect struct drm_color_lut and lut_length should be stored together
in a struct, so that you can also pre-compute and store 'ratio' in it.

> +{
> +	s64 ratio;
> +
> +	s64 lut_index =3D get_lut_index(*color_channel, lut_length);
> +
> +	size_t floor_index =3D drm_fixp2int(lut_index);
> +	size_t ceil_index =3D drm_fixp2int_ceil(lut_index);
> +
> +	struct drm_color_lut floor_lut_value =3D lut[floor_index];
> +	struct drm_color_lut ceil_lut_value =3D lut[ceil_index];
> +
> +	u16 floor_color_channel;
> +	u16 ceil_color_channel;
> +
> +	switch (area) {

Is it a good idea from performance perspective to do a switch like this
three times per pixel? I cannot guess what the compiler would do.

It would be possible to reinterpret drm_color_lut as a __u16[4], so you
could simply index into it instead of using 'if'. Or maybe the compiler
already does that, or something even smarter? Only benchmarking would
tell which form is better.

The reason I'm paying so much attention to performance here is that
while VKMS is expected to be a slow software implementation, it could
still be smarter instead of even slower than necessary. That usually
translates to structuring code such that the innermost loops will do
only the absolute minimum required work, and everything possible is
pre-computed. I don't think it would make the code too complicated,
either.


Thanks,
pq

> +	case LUT_RED:
> +		floor_color_channel =3D floor_lut_value.red;
> +		ceil_color_channel =3D ceil_lut_value.red;
> +		break;
> +	case LUT_GREEN:
> +		floor_color_channel =3D floor_lut_value.green;
> +		ceil_color_channel =3D ceil_lut_value.green;
> +		break;
> +	case LUT_BLUE:
> +		floor_color_channel =3D floor_lut_value.blue;
> +		ceil_color_channel =3D ceil_lut_value.blue;
> +		break;
> +	case LUT_RESERVED:
> +		floor_color_channel =3D floor_lut_value.reserved;
> +		ceil_color_channel =3D ceil_lut_value.reserved;
> +		break;
> +	}
> +
> +	ratio =3D lut_index - drm_int2fixp(floor_index);
> +
> +	*color_channel =3D lerp_u16(floor_color_channel, ceil_color_channel, ra=
tio);
> +}
> +
> +static void apply_lut(const struct vkms_crtc_state *crtc_state, struct l=
ine_buffer *output_buffer)
> +{
> +	struct drm_color_lut *lut;
> +	size_t lut_length;
> +
> +	if (!crtc_state->base.gamma_lut)
> +		return;
> +
> +	lut =3D (struct drm_color_lut *)crtc_state->base.gamma_lut->data;
> +
> +	lut_length =3D crtc_state->base.gamma_lut->length / sizeof(*lut);
> +
> +	if (!lut_length)
> +		return;
> +
> +	for (size_t x =3D 0; x < output_buffer->n_pixels; x++) {
> +		struct pixel_argb_u16 *pixel =3D &output_buffer->pixels[x];
> +
> +		apply_lut_to_color_channel(&pixel->r, LUT_RED, lut, lut_length);
> +		apply_lut_to_color_channel(&pixel->g, LUT_GREEN, lut, lut_length);
> +		apply_lut_to_color_channel(&pixel->b, LUT_BLUE, lut, lut_length);
> +	}
> +}
> +
>  /**
>   * @wb_frame_info: The writeback frame buffer metadata
>   * @crtc_state: The crtc state
> @@ -128,6 +223,8 @@ static void blend(struct vkms_writeback_job *wb,
>  					    output_buffer);
>  		}
> =20
> +		apply_lut(crtc_state, output_buffer);
> +
>  		*crc32 =3D crc32_le(*crc32, (void *)output_buffer->pixels, row_size);
> =20
>  		if (wb)
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms=
_crtc.c
> index 515f6772b866..61e500b8c9da 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -290,6 +290,9 @@ int vkms_crtc_init(struct drm_device *dev, struct drm=
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
> index 5f1a0a44a78c..a3b7025c1b9a 100644
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


--Sig_/vLLQeN.by1BUkB8Bd3H=EaO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmSAS9oACgkQI1/ltBGq
qqexYg/9FuxfyyW8iqul3RdcjPNPcU6u75zookrVbRqv4x1mSbB05eHgo85dMzX7
X2yIX+bEb9aGLcHuSzrVshZm6wxc1pXRLIhXKnSr2jvzvfRtEhGt+/uWB78s2VDq
gdUUHlnBnutqPjwbRzXT0EwG3hEdXQJQbZwFaexcY6eneTXNu22sAAetx+3XEkgr
nTw14G+BRWrt9AQ2GipQLwkzL4am7/zxAWp0ZK3M4mW2zwOpevVVpBqFg731k/2K
TRemxkFXm5uSVJ/LjUc22f6YEQR1jE9p28Ddwiku1cfo+Nt6eMIKhLq4srQlvXpR
ZuhwKczFfAVnS1Yi78eZC+nYupuJKe4H5dRAuUzzH3c8lRIwQwuRFiPhzaxBkrB/
rOZbXhUXlEYC49qvsrimN4DHD7B5ImNemhkE4l2pMKgbiNr79lWNoIxt15NFzWUk
Kel0Ay8usllzai6vyYRyDrBaOqsAKMvlm359uomvc2mpBW6ZF4Ici3/ZJwINgSId
q0R7KJyAguXAq9zfrCuHtezi7+QxbCTe8XCNY1i8bh2kWWUUSu3+j6Zg7vEphBzm
+kx6xucp25pFfZGCfGx8PvZ3KE+r0dTWYtIsIIXPr1H++q6mQogoZEI4WCBzkzNb
jU9kUKov8ziCBI+14L2/BpcI6/wMo0/oiMmfqRdvKMUY2D7EbxE=
=uj0X
-----END PGP SIGNATURE-----

--Sig_/vLLQeN.by1BUkB8Bd3H=EaO--
