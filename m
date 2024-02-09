Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB1584F190
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 09:46:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E118010F1E1;
	Fri,  9 Feb 2024 08:46:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="q44hJRG8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7298010F1E1;
 Fri,  9 Feb 2024 08:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FkqmGaxMGxH9gv5ghEQ3ebNjJ6qjlMvZDWDjt6Kcd7I=; b=q44hJRG8mUu6/dobA7WdscZHaP
 F0aC+SPTWDiRCPXIabAyZKpSWXVGUXXtu73PcuWbPY6y4u2IvnJZB1RpdppzQ404m4TGEhG1H7Ikv
 05tfga0DIUIQyr+iX/6w40lMK2dc6j1S6XGIq0WQHDNwqDbvZ6/2aX9CL4gQ6l5me7xaBu0ZtO6Im
 mjIeN1zDernYAAOKosB/QSaP/TlZaBq4JAqVOSaA2r3xs0j0tXqz5nGAeTr+V17Yw747W9QmfRXaW
 z5Knpl2KuvrcxhX01umWKhVsK4C4OzAjXrAFSqQFvqxB38VyyH7/MUknLiafpcHNkfw5Kh/GAEhv9
 Aku4cvTA==;
Received: from [194.136.85.206] (port=45868 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1rYMWb-0006uH-27;
 Fri, 09 Feb 2024 10:46:21 +0200
Date: Fri, 9 Feb 2024 10:46:20 +0200
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
Subject: Re: [PATCH i-g-t v2] benchmarks: Add VKMS benchmark
Message-ID: <20240209104620.36ab7801@eldfell>
In-Reply-To: <20240208-bench-v2-1-1eccee1055ad@riseup.net>
References: <20240208-bench-v2-1-1eccee1055ad@riseup.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JATMOsYZn.a492IlYx=7eyP";
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

--Sig_/JATMOsYZn.a492IlYx=7eyP
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 08 Feb 2024 17:04:52 -0300
Arthur Grillo <arthurgrillo@riseup.net> wrote:

> Create a benchmark for the VKMS driver. Use a KMS layout with deliberate
> odd sizes to try to avoid alignment accidents and run it for FRAME_COUNT
> frames flipping framebuffers in each plane.
>=20
> This benchmark was suggested by Pekka Paalanen to better analyse
> possible performance regression on the Virtual Kernel Modesetting(VKMS)
> driver.
>=20
> With this benchmark I was able to determine two performance regression:
>=20
> - 322d716a3e8a ("drm/vkms: isolate pixel conversion functionality")
> - cc4fd2934d41 ("drm/vkms: Isolate writeback pixel conversion functions")
>=20
> Link: https://lore.kernel.org/all/20240202214527.1d97c881@ferris.localdom=
ain/
> Suggested-by: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
> Changes in v2:
> - Zero initialize data
> - Don't wrap igt_create_* functions (Juha-Pekka Heikkila)
> - Add a `break;` when a pipe is found (Pekka Paalanen)
> - Rename file to kms_fb_stress.c (Kamil Konieczny)
> - Replace 2 by NUM_FBS (Juha-Pekka Heikkila)
> - Replace license text by SPDX License (Kamil Konieczny)
> - Move explanations to commit description (Kamil Konieczny)
> - Require output after find_wb_output() (Pekka Paalanen & Juha-Pekka
>   Heikkila)
> - Remove unnecessary commit (Pekka Paalanen)
> - Link to v1: https://lore.kernel.org/r/20240207-bench-v1-1-7135ad426860@=
riseup.net
> ---
>  benchmarks/kms_fb_stress.c | 176 +++++++++++++++++++++++++++++++++++++++=
++++++
>  benchmarks/meson.build     |   1 +
>  2 files changed, 177 insertions(+)

Looking good, thanks!

How do you choose the video mode, what is the CRTC size? It should be
big. Does IGT API automatically choose an explicit size, or?

It might be confusing if different people manage to run the benchmark
with different CRTC sizes. It would change the proportions of pixels
from each plane, and might also cut plane sizes to some nice round
values.

Of course, something should test planes extending outside of CRTC, but
I'm not sure that's explicitly necessary here.

It would also help people if the program reported the time spent in the

+	for (int i =3D 0; i < FRAME_COUNT; i++) {

loop specifically. Then all setup time will be ignored as it should, and
everyone will report the same measurement, be that kernel CPU time or
real time. Creating and filling the FBs could take time.


Thanks,
pq

>=20
> diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
> new file mode 100644
> index 000000000000..af0014bed672
> --- /dev/null
> +++ b/benchmarks/kms_fb_stress.c
> @@ -0,0 +1,176 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2024 Arthur Grillo
> + */
> +
> +#include "igt.h"
> +
> +#define FRAME_COUNT 100
> +#define NUM_FBS 2
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
> +	struct igt_fb fbs[NUM_FBS];
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
> +	for (int i =3D 0; i < NUM_FBS; i++) {
> +		igt_create_color_fb(data->fd, kms->primary.rect.width, kms->primary.re=
ct.height,
> +				    kms->primary.format, DRM_FORMAT_MOD_LINEAR,
> +				    !i, i, i,
> +				    &kms->primary.fbs[i]);
> +
> +		igt_create_color_fb(data->fd, kms->overlay_a.rect.width, kms->overlay_=
a.rect.height,
> +				    kms->overlay_a.format, DRM_FORMAT_MOD_LINEAR,
> +				    i, !i, i,
> +				    &kms->overlay_a.fbs[i]);
> +
> +		igt_create_color_fb(data->fd, kms->overlay_b.rect.width, kms->overlay_=
b.rect.height,
> +				    kms->overlay_b.format, DRM_FORMAT_MOD_LINEAR,
> +				    i, i, !i,
> +				    &kms->overlay_b.fbs[i]);
> +
> +		kms->writeback.rect.width =3D mode->hdisplay;
> +		kms->writeback.rect.height =3D mode->vdisplay;
> +		igt_create_fb(data->fd, kms->writeback.rect.width, kms->writeback.rect=
.height,
> +			      kms->writeback.format, DRM_FORMAT_MOD_LINEAR,
> +			      &kms->writeback.fbs[i]);
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
> +	struct data_t data =3D {0};
> +	enum pipe pipe =3D PIPE_NONE;
> +
> +	data.kms =3D default_kms;
> +
> +	data.fd =3D drm_open_driver_master(DRIVER_ANY);
> +
> +	igt_display_require(&data.display, data.fd);
> +
> +	kmstest_set_vt_graphics_mode();
> +
> +	igt_display_require(&data.display, data.fd);
> +	igt_require(data.display.is_atomic);
> +
> +	igt_display_require_output(&data.display);
> +
> +	igt_display_reset(&data.display);
> +
> +	data.wb_output =3D find_wb_output(&data);
> +	igt_require(data.wb_output);
> +
> +	for_each_pipe(&data.display, pipe) {
> +		igt_debug("Selecting pipe %s to %s\n",
> +			  kmstest_pipe_name(pipe),
> +			  igt_output_name(data.wb_output));
> +		igt_output_set_pipe(data.wb_output, pipe);
> +		break;
> +	}
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
> +		int fb_index =3D i % NUM_FBS;
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
> diff --git a/benchmarks/meson.build b/benchmarks/meson.build
> index c451268bc44f..e949e6073719 100644
> --- a/benchmarks/meson.build
> +++ b/benchmarks/meson.build
> @@ -20,6 +20,7 @@ benchmark_progs =3D [
>  	'kms_vblank',
>  	'prime_lookup',
>  	'vgem_mmap',
> +	'kms_fb_stress',
>  ]
> =20
>  benchmarksdir =3D join_paths(libexecdir, 'benchmarks')
>=20
> ---
> base-commit: c58c5fb6aa1cb7d3627a15e364816a7a2add9edc
> change-id: 20240207-bench-393789eaba47
>=20
> Best regards,


--Sig_/JATMOsYZn.a492IlYx=7eyP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXF5lwACgkQI1/ltBGq
qqeqsQ//dyf1vsoj8k8GvKYhheUgU5jsEKgtrpNIMlbfsszhb98+UeLPRZmlqFLV
1sfzJXieapivKtzmlNXg6tPCS8g6WpJDDNuVTn4MrNbHwAZHO9kJEprnWNXxsHgW
SeuG+TUHj9zDX/dUJ9/nMcQIxqDmCa8mE+rTSQ8MiwPsWGrNJ2HFRF+DKhe5PQAL
5IKY/BNTZtr4LPBN8M2C+8yUiGYW502OHaH2GZ4qmALSqnMSjbkq8kBacUI8SBkO
fK33qFtMa/ybwHtw3WYaY03+zUYv3po9K8VqgBuLEQfvOvGrgBp3f7/ZZNjYyah2
dfrZdJTga6W662DwPjEN9Bpmm+Q8QDJ0MHHakZmBOvAnRQVCz6ifs7l9fIGe0D4i
MxV0HNiauY/oaYzVPExoysMj/Pbb3hPdK81eaiXfOp7UkZ2tFXiYW4t3K+hU1EVD
SE2O34VGe1BLpGFUKUOonqQ0EQ6iDDZ/cEh0S7gKArqLB0g+Ho1WEua7voQzg5o0
tp5tUYwZ/c5cBjvPcw1GUXoWzlN2avmtg4WMY1K8mIs3xYn1gNYlcgcY20CrP2UT
i15t2MxIO+OR1K9TezZSavaoQf/+HQu5X6Gc8lny/Z80qCQZ6JlMf6G2e13i9SFz
RBAkzpp1365+2w8wYqTgr1ZwmI5LW/dtuhUnktaHJD2C8mE/twA=
=yL8u
-----END PGP SIGNATURE-----

--Sig_/JATMOsYZn.a492IlYx=7eyP--
