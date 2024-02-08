Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D8E84DD44
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 10:50:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE2B10E565;
	Thu,  8 Feb 2024 09:50:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="zDpNDfNO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8970810E565
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 09:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VqcN9ycvcXN91vIGfixwynUuGFoqapd48PauLt5pJuQ=; b=zDpNDfNOVI4juyALsVgRWzFBtp
 OIY/ihDcIF3ObWpei1izrEi5Orvp2fWTRaDxsTyCEH98QooW+bMUZ0xmmpW//o4L5UHgm+V8/tvhH
 A36mhyqvBpQN6bt7pFi2nL3m8oELEAZzKQ53jPDonBxh+nO2B1MlukNi0pUiiGBNvkYEUCxiuii4t
 05LY3Fy6yztELYNTK9hF4EfF7XqWZ0S8SX1ZX56W7oeIRjye9+4rBNr+ObrmE/kETVkCWNYkIDvi2
 8jlSrJOzCjdF78NxOh8iVlx3MYot0t1TAD7Tj8YtRYpzT6imMDWJQjXKQkbMxCZ6BnZXTBdjRJhzo
 9j2EHhFg==;
Received: from [194.136.85.206] (port=57114 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1rY13U-0007Y3-2E;
 Thu, 08 Feb 2024 11:50:52 +0200
Date: Thu, 8 Feb 2024 11:50:50 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: Arthur Grillo <arthurgrillo@riseup.net>
Cc: dri-devel@lists.freedesktop.org, igt-dev@lists.freedesktop.org, Petri
 Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, Kamil
 Konieczny <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>, Rodrigo Siqueira
 <rodrigosiqueiramelo@gmail.com>, Melissa Wen <melissa.srw@gmail.com>,
 =?UTF-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>, Haneen Mohammed
 <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH i-g-t] benchmarks: Add VKMS benchmark
Message-ID: <20240208115050.73d04796@eldfell>
In-Reply-To: <20240207-bench-v1-1-7135ad426860@riseup.net>
References: <20240207-bench-v1-1-7135ad426860@riseup.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Kc9+P6gqpTPXh=giOl0SRyb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - whm50.louhi.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - haloniitty.fi
X-Get-Message-Sender-Via: whm50.louhi.net: authenticated_id:
 pekka.paalanen@haloniitty.fi
X-Authenticated-Sender: whm50.louhi.net: pekka.paalanen@haloniitty.fi
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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

--Sig_/Kc9+P6gqpTPXh=giOl0SRyb
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 07 Feb 2024 17:17:15 -0300
Arthur Grillo <arthurgrillo@riseup.net> wrote:

> Create a benchmark for the VKMS driver. Use a KMS layout with deliberate
> odd sizes to try to avoid alignment accidents and run it for FRAME_COUNT
> frames flipping framebuffers in each plane.
>=20
> Link: https://lore.kernel.org/all/20240202214527.1d97c881@ferris.localdom=
ain/
> Suggested-by: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
> This benchmark was suggested by Pekka Paalanen on [1] to better analyse
> possible performance regression on the Virtual Kernel Modesetting(VKMS)
> driver.
>=20
> With this benchmark I was able to determine two performance regression:
>=20
> - 322d716a3e8a ("drm/vkms: isolate pixel conversion functionality")
> - cc4fd2934d41 ("drm/vkms: Isolate writeback pixel conversion functions")
>=20
> [1]: https://lore.kernel.org/all/20240202214527.1d97c881@ferris.localdoma=
in/
> ---
>  benchmarks/meson.build   |   1 +
>  benchmarks/vkms_stress.c | 203 +++++++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 204 insertions(+)
>=20
> diff --git a/benchmarks/meson.build b/benchmarks/meson.build
> index c451268bc44f..3aa66d6dffe2 100644
> --- a/benchmarks/meson.build
> +++ b/benchmarks/meson.build
> @@ -20,6 +20,7 @@ benchmark_progs =3D [
>  	'kms_vblank',
>  	'prime_lookup',
>  	'vgem_mmap',
> +	'vkms_stress',
>  ]
> =20
>  benchmarksdir =3D join_paths(libexecdir, 'benchmarks')
> diff --git a/benchmarks/vkms_stress.c b/benchmarks/vkms_stress.c
> new file mode 100644
> index 000000000000..b9128c208861
> --- /dev/null
> +++ b/benchmarks/vkms_stress.c
> @@ -0,0 +1,203 @@
> +/*
> + * Copyright =C2=A9 2024 Arthur Grillo
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the =
next
> + * paragraph) shall be included in all copies or substantial portions of=
 the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER D=
EALINGS
> + * IN THE SOFTWARE.
> + *
> + * Authors:
> + *    Arthur Grillo <arthurgrillo@riseup.net>
> + *
> + */
> +
> +#include "igt.h"
> +
> +#define FRAME_COUNT 100
> +
> +struct rect_t {
> +	int x, y;
> +	int width, height;
> +};
> +
> +struct plane_t {
> +	igt_plane_t *base;
> +	struct rect_t rect;
> +	uint32_t format;
> +	struct igt_fb fbs[2];
> +};
> +
> +struct kms_t {
> +	struct plane_t primary;
> +	struct plane_t overlay_a;
> +	struct plane_t overlay_b;
> +	struct plane_t writeback;
> +};
> +
> +struct data_t {
> +	int fd;
> +	igt_display_t display;
> +	igt_output_t *wb_output;
> +	drmModeModeInfo *mode;
> +	struct kms_t kms;
> +};
> +
> +static void plane_create_fb(struct plane_t *plane, int fd, size_t index)
> +{
> +	igt_create_fb(fd, plane->rect.width, plane->rect.height,
> +			plane->format, DRM_FORMAT_MOD_LINEAR,
> +			&plane->fbs[index]);
> +}
> +
> +static void plane_create_color_fb(struct plane_t *plane, int fd, size_t =
index, double r, double g,
> +				   double b)
> +{
> +	igt_create_color_fb(fd, plane->rect.width, plane->rect.height,
> +			plane->format, DRM_FORMAT_MOD_LINEAR,
> +			r, g, b,
> +			&plane->fbs[index]);
> +}
> +
> +static void plane_setup(struct plane_t *plane, int index)
> +{
> +	igt_plane_set_size(plane->base, plane->rect.width, plane->rect.height);
> +	igt_plane_set_position(plane->base, plane->rect.x, plane->rect.y);
> +	igt_plane_set_fb(plane->base, &plane->fbs[index]);
> +}
> +
> +static void gen_fbs(struct data_t *data)
> +{
> +	struct kms_t *kms =3D &data->kms;
> +	drmModeModeInfo *mode =3D igt_output_get_mode(data->wb_output);
> +
> +	for (int i =3D 0; i < 2; i++) {
> +		plane_create_color_fb(&kms->primary, data->fd, i, !i, i, i);
> +
> +		plane_create_color_fb(&kms->overlay_a, data->fd, i, i, !i, i);
> +
> +		plane_create_color_fb(&kms->overlay_b, data->fd, i, i, i, !i);
> +
> +		kms->writeback.rect.width =3D mode->hdisplay;
> +		kms->writeback.rect.height =3D mode->vdisplay;
> +		plane_create_fb(&kms->writeback, data->fd, i);
> +	}
> +}
> +
> +static igt_output_t *find_wb_output(struct data_t *data)
> +{
> +	for (int i =3D 0; i < data->display.n_outputs; i++) {
> +		igt_output_t *output =3D &data->display.outputs[i];
> +
> +		if (output->config.connector->connector_type !=3D DRM_MODE_CONNECTOR_W=
RITEBACK)
> +			continue;
> +
> +		return output;
> +
> +	}
> +
> +	return NULL;
> +}
> +
> +static struct kms_t default_kms =3D {
> +	.primary =3D {
> +		.rect =3D {
> +			.x =3D 101, .y =3D 0,
> +			.width =3D 3639, .height =3D 2161,
> +		},
> +		.format =3D DRM_FORMAT_XRGB8888,
> +	},
> +	.overlay_a =3D {
> +		.rect =3D {
> +			.x =3D 201, .y =3D 199,
> +			.width =3D 3033, .height =3D 1777,
> +		},
> +		.format =3D DRM_FORMAT_XRGB16161616,
> +	},
> +	.overlay_b =3D {
> +		.rect =3D {
> +			.x =3D 1800, .y =3D 250,
> +			.width =3D 1507, .height =3D 1400,
> +		},
> +		.format =3D DRM_FORMAT_ARGB8888,
> +	},
> +	.writeback =3D {
> +		.rect =3D {
> +			.x =3D 0, .y =3D 0,
> +			// Size is to be determined at runtime
> +		},
> +		.format =3D DRM_FORMAT_XRGB8888,
> +	},
> +};
> +
> +
> +igt_simple_main
> +{
> +	struct data_t data;
> +	enum pipe pipe =3D PIPE_NONE;
> +
> +	data.kms =3D default_kms;
> +

Hi Arthur,

all the above looks really good!

Some things below look strange to me, but I don't know the igt API.

> +	data.fd =3D drm_open_driver_master(DRIVER_ANY);
> +
> +	igt_display_require(&data.display, data.fd);
> +
> +	kmstest_set_vt_graphics_mode();
> +
> +	igt_display_require(&data.display, data.fd);

Are you supposed to call igt_display_require twice?

> +	igt_require(data.display.is_atomic);
> +
> +	igt_display_require_output(&data.display);
> +
> +	igt_require(data.wb_output);
> +	igt_display_reset(&data.display);
> +
> +	data.wb_output =3D find_wb_output(&data);

Should igt_require(data.wb_output) be after find_wb_output?

> +
> +	for_each_pipe(&data.display, pipe) {
> +		igt_debug("Selecting pipe %s to %s\n",
> +			  kmstest_pipe_name(pipe),
> +			  igt_output_name(data.wb_output));
> +		igt_output_set_pipe(data.wb_output, pipe);

Isn't this strange if there are multiple pipes?

> +	}
> +
> +	igt_display_commit_atomic(&data.display, DRM_MODE_ATOMIC_ALLOW_MODESET,=
 NULL);

What's this commit needed for?

> +
> +	gen_fbs(&data);
> +
> +	data.kms.primary.base =3D igt_output_get_plane_type(data.wb_output, DRM=
_PLANE_TYPE_PRIMARY);
> +	data.kms.overlay_a.base =3D igt_output_get_plane_type_index(data.wb_out=
put,
> +								  DRM_PLANE_TYPE_OVERLAY, 0);
> +	data.kms.overlay_b.base =3D igt_output_get_plane_type_index(data.wb_out=
put,
> +								  DRM_PLANE_TYPE_OVERLAY, 1);
> +
> +	for (int i =3D 0; i < FRAME_COUNT; i++) {
> +		int fb_index =3D i % 2;
> +
> +		plane_setup(&data.kms.primary, fb_index);
> +
> +		plane_setup(&data.kms.overlay_a, fb_index);
> +
> +		plane_setup(&data.kms.overlay_b, fb_index);
> +
> +		igt_output_set_writeback_fb(data.wb_output, &data.kms.writeback.fbs[fb=
_index]);
> +
> +		igt_display_commit2(&data.display, COMMIT_ATOMIC);
> +	}
> +
> +	igt_display_fini(&data.display);
> +	drm_close_driver(data.fd);
> +}

Aside those questions, I'm already happy giving a

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/Kc9+P6gqpTPXh=giOl0SRyb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXEo/oACgkQI1/ltBGq
qqfAMw//cs81C60eeabpnTE/Tm7zyrBG2wJ+h574XFR6QFuQsCv4+lGGH49DswaP
5PnQub2npqYWljQr30aicB5xF8YpAL7NxlSwqZd0I32sdbaJFv0CtbfirsAisAj7
t25QQ7scaWhxLD0xyZJtz9mQEiMEWqO5sPXihY7of+HOUINjpZdxUm1yrqWX1nWy
rwv22VZwwhA/O8Nzh7seYUL76o0mUzmMkxZn/dv/VxSlLrbPvfJ7gg2c8Ksx0i3y
ZwhCzx9/fLt+QjyuGONLkm5y8fEzcYq0lmzaNcAfSHs3Yy/NFJe0O0+K+L72vxuh
gO8f31DUwIA1B18DUQrifDdLwrPuQx/UE2dVZZH/3h/TpmyOduviNNpMICaGFxBY
derr18e5+tJMI2BA4rxEjAxRb1+cyhPRWbb50/hb+kHqHLSgFFHDwKJsfNOIuuDT
g02zpY8P6YhuS0iatRf5vw3VtUjPLUis7TuhMvc8jnsgTneJ4xi9HWZfwFFNvPqr
u3kl+yNVWX2JEUrSbXE6k9SGFX7vbcKNEAE6EgZJLRfng1rk15vIyJdBR9/7s2Of
QbQepcjHsSiWssiMIFYEHVyNFLW1G1y5Rhp36zn+IPWa92XLUv0LAsRa0DzDARvN
2cVmjun9pa4PeaAK1Og90DPTO23ddjGSU/Y9NtyRwfCmT/4vD3U=
=f/cA
-----END PGP SIGNATURE-----

--Sig_/Kc9+P6gqpTPXh=giOl0SRyb--
