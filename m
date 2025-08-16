Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E07A2B28E4C
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 15:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D7210E36F;
	Sat, 16 Aug 2025 13:55:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.b="AJW8g2gf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic308-54.consmr.mail.gq1.yahoo.com
 (sonic308-54.consmr.mail.gq1.yahoo.com [98.137.68.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BFAA10E36F
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 13:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1755352529; bh=HjlkzkMXPM1wdqlmGdMidt6sUkslgSVRtRzKowGu2vM=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=AJW8g2gfIgSomJj/lvlnxERWKNZQgPKNm1fJ0jLRG0Qk82EWESGb4nkuacmnyg686L76XB7ATZQnFcnXHqrtq3IZ/bjnYI0rgVT/b9YTBRSRSbyYJzdsE8B6k7l1lpHK36b8v3xFcqY+czsAdptiBFL3Z2b1CmREdcOUzyroEaPde/8dgdjZFxefFjwl6gWdmqkc28OHPISR40M1+1I3BoXpqwfrA97FYu1lKCDWo2OO0z4s8C702mx40GgtikxifTY7PbzhMJIzZTwyJONr/yRriReiqzly0Qa7JIOjC6N/zAtC+IqUxnf+REXJgZNMFn10/wCZMad3uavnGceTXQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1755352529; bh=las2hNrLYw16Sp8KpRjLie3RRh8mnOXqVM1cVLFaZs3=;
 h=X-Sonic-MF:Subject:From:To:Date:From:Subject;
 b=LGV9eG37OCEfe+N0gv4fIqqHTZkh9sTqkVtnocMKnThsoTNz0o6PTUh+XRLk/c9REDqcDUfisV5CI0bYRWV6/LQtfEBFZd/TcRFApatpJD9Ig08YQ+aYxkZYwSwFz/2YfXUdDynWm0W6WXbvuO26cnumCxJIHUbAUf7R8jbK+0XGda9s5zhIufrRFMMCOt2gMvDAwvTncCrKaQ+xDLxUpRsCWS5bqQP8Nz28eYmWWlfHi13MCfkfxQdNkS7y+8xIs29fDZuQRXKMEzajtTgFSRzn9VVJWogph/ANyis9wRDUzmS3iOE95Wnh124g5+oY3YOjeIrcDRScL1RSR5Q+Ng==
X-YMail-OSG: M2LDFtIVM1k_4CHPrGVaP2ou0ma6LIW8dF7MC6rjmcrHU28WhS1yQXNiA4LAu1y
 aablqBG1iFXHnwOnyJ464rS_5JOUoQirYSF4QMAs4yyzBNZ3hxBL1CPPu1qYFswKwDt1_hvc8UNQ
 POf93VNJzY9SIKfY0hrAnHpufHfwNvFhJEvCWMuuipQAKlQqstwep38ctT79z.t2EpdQMQB3ar67
 ioICQ7dGzUVUwr_eKdy0FZnKqR8yb_at088eYwRJUjpoBZ2Y3GDryy3PuslMvcWthw0cGo_If93U
 eAzFu3AgQM0OCKdnGRkU73._Cruw9iiYHFqWlmG86k3gKgAUqjWSEK9ut9mt8w9Ljl0MdmpdtgOg
 0GlfeNNeLOdq3dD6dUic93l8fxWhwmd6XOc58Xi1fqIknMm6A6ZROrjHVTiRN2UppGqufgroPMMn
 mRVi0ylj8YF8l2KzAjtNsiMVmJpWZodZvw9_PUlsEekbSX.KITqVs2f6q9ilGQogjYoN1BOp6dUs
 FrpPKrbgijAwui_jfxlSMejd1.KPKJebGIVr394HznWRX7nuuN.QFNmTCtdlOYKiGqarTbMLiXPe
 FhZmbX1dhpmr7YSiDtg0B6_jqROyOdMIOuMF56T.L1bOGngpuoBdJwXR16kk3BVZLVtnX8E5J1sa
 iauUE1GlOJXeqle579kKEk9uUm_axF.O_aZAZmPOVhLKooB6yrIpgJdEFY8w64Ui.MRRB6PwWNWb
 xc6dnlFMdYO7DyE_z4B0uoN0u1BwJRMBVnBnUkww7hLngtjibl4rEF3PGX6jFMWvLq40_opiuKpU
 1MGW6RTDhCLu086r3_xp7HrtwhMB3gn8lO4pYVUz.G2Aaetr3bU8A.HxxdvKxodhZVRXON4Gtxpk
 MluEpGpdTwjXTlyRYF2SF4.oWIMgCf0y3o9ZtZzcbi_DWLDgMbYOJbguNQ38DzhNiT0EQ82X0T_J
 xEsxQbnNSGyy.pPQMV_cFfir9hMllwV9isqpL6550kt_3dadsKXkgghOB._6iVK6xBc8qlTXMkIw
 D4ops7QY1s1Y95__Dy6ZmV5tLINUEyz7rQ5hKB11Ucjp2114ddgnIPgtTxGzqLqisSr.NOHImtgm
 pwL2X.BveiH2aG04AK4DnSOOEaXSZBaaC7FK3cCV_PLLiSsAFAnyNA9UO1VH0ORWF927XgCVvuC7
 8pKjpAt7YO5u7iG38Mrjps.4CH6pXRWhuEhaGRnUnepo5hV0Xdw0Fr92wMgCVX1faNshvEh9vQGE
 zif5olTr.huXnN9yFMJ0HPon0ee2oiymhbxvPJxorBjWX6BnkkyR8rIBin5UsXn2QnozOxCJFfX2
 1eQTbI9I0C_UP2ymfUOQs8vn9toM6PsV.VQUFvI9A4QdbmBvcmEpVhJdR8lySbydyKzdOQtNlunk
 Tj1a1vyvmlG8tz6tTbMEraeVYT2N7FQczs90JRGJudrQaa8fp_7J10JZly0F3dLYzVt4aSacDBqk
 j7wVStFt_TI3jI9qsQuxtBBXTL95_ggHPfjybTADN3eMUTpKzrSB61hdx5gQHOVQsP2oazp04Zfp
 9IlmXdB2ynMdtfrZ_53leoMOutJdAuAu9XLEA8.o3cyI39WC8V4pmucUISTPMcD5D8OtiAA5iDQM
 ij_xdH.fLD4g.gpTNFPXZas8QBg0X39pOPViAexBUqaI_QbkIk9Wu15XEhKWSxvHb8vSxQlGPkAf
 0zPxeGbDFp9MpaLBv3LvKKD5IXcHIWvLtbfA4No3_p2oULQSybIMM4QQnkFcu1jR7koiaYTILoNF
 RR1JbuYvrjTzRcrMMELIyZqq9nVSka9HaU1LLmRDieClejfg_Ne9xy5hzIAy3fvD_qwFgs0MXaj4
 NvQO7BKMH10f9WaQJ1N8HootkWueBjaYrszZinBSiXCO_aPaojRA6LNYZUGlOsSUSS0FHgq8tQ9h
 5qxuz.1bfsOERsqSajE0WWrHAoEewbA.kNZ5awsGFYq7uHHP.ipgn9x4u_5rgaFiMrQm4xn2pvgC
 _HVbXZhtVSzmHSSQqyvovrXHH8o_Gd3gq7vBRP7B_vCQ4L4t1Xcum6GysKcxlCWjzNaQyT3u2qHO
 dBXnTJaypu9Rocg.Wrfgdn9voNhueNaEVAxg94iz2odZWIKxhBBNDKL_.8dZVxaWwx8xnYT7fb5t
 zhWwIO1GcsfC3EqrwbqD_HHw8tUWFbelVofal2WSrRylmV.irWffTPsgEqk3HkLgdg8mKCCkxv4j
 o96zq_.feefHQ6pH9SRD.951frRdr7ucTGuH11l3f0FUJjmbxI25_vBVHRXmJt9QsHpYo
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: 778ddf55-3f3c-4879-8919-3359cca9252c
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.gq1.yahoo.com with HTTP; Sat, 16 Aug 2025 13:55:29 +0000
Received: by hermes--production-ir2-858bd4ff7b-p7k8x (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID af34cbe6df9302f5ba9e57eff90f013d; 
 Sat, 16 Aug 2025 13:55:24 +0000 (UTC)
Message-ID: <1428d7bff3fb755c5bce8f50d725ae0e2b2438de.camel@aol.com>
Subject: Re: [PATCH v2] drm/gud: Replace simple display pipe with DRM atomic
 helpers
From: Ruben Wauters <rubenru09@aol.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard	
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Ingo Molnar	
 <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jani Nikula	
 <jani.nikula@intel.com>, Jocelyn Falempe <jfalempe@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Sat, 16 Aug 2025 14:55:22 +0100
In-Reply-To: <20250816100223.5588-1-rubenru09@aol.com>
References: <20250816100223.5588-1-rubenru09.ref@aol.com>
 <20250816100223.5588-1-rubenru09@aol.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
MIME-Version: 1.0
X-Mailer: WebService/1.1.24338
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
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

On Sat, 2025-08-16 at 10:57 +0100, Ruben Wauters wrote:
> The simple display pipe is obsolete and the atomic helpers allow for
> more control over the rendering process. As such, this patch replaces
> the old simple display pipe system with the newer atomic helpers.
>=20
> As the code is mainly the same, merely replaced with the new atomic
> system, there should be no change in functionality.
>=20
> Signed-off-by: Ruben Wauters <rubenru09@aol.com>
> ---
> I have been able to test this now, having obtained the hardware, and
> it
> works fine, though some other unrelated issues have popped up, which
> I
> shall try and debug and address in other patches.
>=20
> v2 changes:
> - address review comments by reorganising gud_probe()
> ---
> =C2=A0drivers/gpu/drm/gud/gud_connector.c | 24 +++++-----
> =C2=A0drivers/gpu/drm/gud/gud_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
 52 +++++++++++++++++-----
> =C2=A0drivers/gpu/drm/gud/gud_internal.h=C2=A0 | 13 +++---
> =C2=A0drivers/gpu/drm/gud/gud_pipe.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 69 +=
+++++++++++++++++++-------
> --
> =C2=A04 files changed, 108 insertions(+), 50 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/gud/gud_connector.c
> b/drivers/gpu/drm/gud/gud_connector.c
> index 0f07d77c5d52..75f404ec08b4 100644
> --- a/drivers/gpu/drm/gud/gud_connector.c
> +++ b/drivers/gpu/drm/gud/gud_connector.c
> @@ -607,13 +607,16 @@ int gud_connector_fill_properties(struct
> drm_connector_state *connector_state,
> =C2=A0	return gconn->num_properties;
> =C2=A0}
> =C2=A0
> +static const struct drm_encoder_funcs
> gud_drm_simple_encoder_funcs_cleanup =3D {
> +	.destroy =3D drm_encoder_cleanup,
> +};
> +
> =C2=A0static int gud_connector_create(struct gud_device *gdrm, unsigned
> int index,
> =C2=A0				struct gud_connector_descriptor_req
> *desc)
> =C2=A0{
> =C2=A0	struct drm_device *drm =3D &gdrm->drm;
> =C2=A0	struct gud_connector *gconn;
> =C2=A0	struct drm_connector *connector;
> -	struct drm_encoder *encoder;
> =C2=A0	int ret, connector_type;
> =C2=A0	u32 flags;
> =C2=A0
> @@ -681,20 +684,13 @@ static int gud_connector_create(struct
> gud_device *gdrm, unsigned int index,
> =C2=A0		return ret;
> =C2=A0	}
> =C2=A0
> -	/* The first connector is attached to the existing simple
> pipe encoder */
> -	if (!connector->index) {
> -		encoder =3D &gdrm->pipe.encoder;
> -	} else {
> -		encoder =3D &gconn->encoder;
> -
> -		ret =3D drm_simple_encoder_init(drm, encoder,
> DRM_MODE_ENCODER_NONE);
> -		if (ret)
> -			return ret;
> -
> -		encoder->possible_crtcs =3D 1;
> -	}
> +	gdrm->encoder.possible_crtcs =3D drm_crtc_mask(&gdrm->crtc);
> +	ret =3D drm_encoder_init(drm, &gdrm->encoder,
> &gud_drm_simple_encoder_funcs_cleanup,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_MODE_ENCODER_NONE, NULL);
> +	if (ret)
> +		return ret;
> =C2=A0
> -	return drm_connector_attach_encoder(connector, encoder);
> +	return drm_connector_attach_encoder(connector, &gdrm-
> >encoder);
> =C2=A0}
> =C2=A0
> =C2=A0int gud_get_connectors(struct gud_device *gdrm)
> diff --git a/drivers/gpu/drm/gud/gud_drv.c
> b/drivers/gpu/drm/gud/gud_drv.c
> index 5385a2126e45..65c3a83c4037 100644
> --- a/drivers/gpu/drm/gud/gud_drv.c
> +++ b/drivers/gpu/drm/gud/gud_drv.c
> @@ -16,6 +16,7 @@
> =C2=A0#include <drm/clients/drm_client_setup.h>
> =C2=A0#include <drm/drm_atomic_helper.h>
> =C2=A0#include <drm/drm_blend.h>
> +#include <drm/drm_crtc_helper.h>
> =C2=A0#include <drm/drm_damage_helper.h>
> =C2=A0#include <drm/drm_debugfs.h>
> =C2=A0#include <drm/drm_drv.h>
> @@ -289,7 +290,7 @@ static int gud_get_properties(struct gud_device
> *gdrm)
> =C2=A0			 * but mask out any additions on future
> devices.
> =C2=A0			 */
> =C2=A0			val &=3D GUD_ROTATION_MASK;
> -			ret =3D
> drm_plane_create_rotation_property(&gdrm->pipe.plane,
> +			ret =3D
> drm_plane_create_rotation_property(&gdrm->plane,
> =C2=A0							=09
> DRM_MODE_ROTATE_0, val);
> =C2=A0			break;
> =C2=A0		default:
> @@ -338,10 +339,30 @@ static int gud_stats_debugfs(struct seq_file
> *m, void *data)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> -static const struct drm_simple_display_pipe_funcs gud_pipe_funcs =3D {
> -	.check=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D gud_pipe_check,
> -	.update	=C2=A0=C2=A0=C2=A0 =3D gud_pipe_update,
> -	DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS
> +static const struct drm_crtc_helper_funcs gud_crtc_helper_funcs =3D {
> +	.atomic_check =3D drm_crtc_helper_atomic_check
> +};
> +
> +static const struct drm_crtc_funcs gud_crtc_funcs =3D {
> +	.reset =3D drm_atomic_helper_crtc_reset,
> +	.destroy =3D drm_crtc_cleanup,
> +	.set_config =3D drm_atomic_helper_set_config,
> +	.page_flip =3D drm_atomic_helper_page_flip,
> +	.atomic_duplicate_state =3D
> drm_atomic_helper_crtc_duplicate_state,
> +	.atomic_destroy_state =3D
> drm_atomic_helper_crtc_destroy_state,
> +};
> +
> +static const struct drm_plane_helper_funcs gud_plane_helper_funcs =3D
> {
> +	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> +	.atomic_check =3D gud_plane_atomic_check,
> +	.atomic_update =3D gud_plane_atomic_update,
> +};
> +
> +static const struct drm_plane_funcs gud_plane_funcs =3D {
> +	.update_plane =3D drm_atomic_helper_update_plane,
> +	.disable_plane =3D drm_atomic_helper_disable_plane,
> +	.destroy =3D drm_plane_cleanup,
> +	DRM_GEM_SHADOW_PLANE_FUNCS,
> =C2=A0};
> =C2=A0
> =C2=A0static const struct drm_mode_config_funcs gud_mode_config_funcs =3D=
 {
> @@ -350,7 +371,7 @@ static const struct drm_mode_config_funcs
> gud_mode_config_funcs =3D {
> =C2=A0	.atomic_commit =3D drm_atomic_helper_commit,
> =C2=A0};
> =C2=A0
> -static const u64 gud_pipe_modifiers[] =3D {
> +static const u64 gud_plane_modifiers[] =3D {
> =C2=A0	DRM_FORMAT_MOD_LINEAR,
> =C2=A0	DRM_FORMAT_MOD_INVALID
> =C2=A0};
> @@ -567,12 +588,17 @@ static int gud_probe(struct usb_interface
> *intf, const struct usb_device_id *id)
> =C2=A0			return -ENOMEM;
> =C2=A0	}
> =C2=A0
> -	ret =3D drm_simple_display_pipe_init(drm, &gdrm->pipe,
> &gud_pipe_funcs,
> -					=C2=A0=C2=A0 formats, num_formats,
> -					=C2=A0=C2=A0 gud_pipe_modifiers,
> NULL);
> +	ret =3D drm_universal_plane_init(drm, &gdrm->plane, 0,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gud_plane_funcs,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 formats, num_formats,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gud_plane_modifiers,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_PLANE_TYPE_PRIMARY,
> NULL);
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
> +	drm_plane_helper_add(&gdrm->plane, &gud_plane_helper_funcs);
> +	drm_plane_enable_fb_damage_clips(&gdrm->plane);
> +
> =C2=A0	devm_kfree(dev, formats);
> =C2=A0	devm_kfree(dev, formats_dev);
> =C2=A0
> @@ -582,7 +608,13 @@ static int gud_probe(struct usb_interface *intf,
> const struct usb_device_id *id)
> =C2=A0		return ret;
> =C2=A0	}
> =C2=A0
> -	drm_plane_enable_fb_damage_clips(&gdrm->pipe.plane);
> +	ret =3D drm_crtc_init_with_planes(drm, &gdrm->crtc, &gdrm-
> >plane, NULL,
> +					&gud_crtc_funcs, NULL);
> +
> +	if (ret)
> +		return ret;
> +
> +	drm_crtc_helper_add(&gdrm->crtc, &gud_crtc_helper_funcs);
> =C2=A0
> =C2=A0	ret =3D gud_get_connectors(gdrm);
> =C2=A0	if (ret) {
> diff --git a/drivers/gpu/drm/gud/gud_internal.h
> b/drivers/gpu/drm/gud/gud_internal.h
> index d6fb25388722..6152a9b5da43 100644
> --- a/drivers/gpu/drm/gud/gud_internal.h
> +++ b/drivers/gpu/drm/gud/gud_internal.h
> @@ -15,7 +15,9 @@
> =C2=A0
> =C2=A0struct gud_device {
> =C2=A0	struct drm_device drm;
> -	struct drm_simple_display_pipe pipe;
> +	struct drm_plane plane;
> +	struct drm_crtc crtc;
> +	struct drm_encoder encoder;
> =C2=A0	struct work_struct work;
> =C2=A0	u32 flags;
> =C2=A0	const struct drm_format_info *xrgb8888_emulation_format;
> @@ -62,11 +64,10 @@ int gud_usb_set_u8(struct gud_device *gdrm, u8
> request, u8 val);
> =C2=A0
> =C2=A0void gud_clear_damage(struct gud_device *gdrm);
> =C2=A0void gud_flush_work(struct work_struct *work);
> -int gud_pipe_check(struct drm_simple_display_pipe *pipe,
> -		=C2=A0=C2=A0 struct drm_plane_state *new_plane_state,
> -		=C2=A0=C2=A0 struct drm_crtc_state *new_crtc_state);
> -void gud_pipe_update(struct drm_simple_display_pipe *pipe,
> -		=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_plane_state *old_state);
> +int gud_plane_atomic_check(struct drm_plane *plane,
> +			=C2=A0=C2=A0 struct drm_atomic_state *state);
> +void gud_plane_atomic_update(struct drm_plane *plane,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_atomic_state *atomic_state);
> =C2=A0int gud_connector_fill_properties(struct drm_connector_state
> *connector_state,
> =C2=A0				=C2=A0 struct gud_property_req
> *properties);
> =C2=A0int gud_get_connectors(struct gud_device *gdrm);
> diff --git a/drivers/gpu/drm/gud/gud_pipe.c
> b/drivers/gpu/drm/gud/gud_pipe.c
> index 8d548d08f127..6a0e6234224a 100644
> --- a/drivers/gpu/drm/gud/gud_pipe.c
> +++ b/drivers/gpu/drm/gud/gud_pipe.c
> @@ -451,14 +451,15 @@ static void gud_fb_handle_damage(struct
> gud_device *gdrm, struct drm_framebuffer
> =C2=A0	gud_flush_damage(gdrm, fb, src, !fb->obj[0]->import_attach,
> damage);
> =C2=A0}
> =C2=A0
> -int gud_pipe_check(struct drm_simple_display_pipe *pipe,
> -		=C2=A0=C2=A0 struct drm_plane_state *new_plane_state,
> -		=C2=A0=C2=A0 struct drm_crtc_state *new_crtc_state)
> +int gud_plane_atomic_check(struct drm_plane *plane,
> +			=C2=A0=C2=A0 struct drm_atomic_state *state)
> =C2=A0{
> -	struct gud_device *gdrm =3D to_gud_device(pipe->crtc.dev);
> -	struct drm_plane_state *old_plane_state =3D pipe->plane.state;
> -	const struct drm_display_mode *mode =3D &new_crtc_state->mode;
> -	struct drm_atomic_state *state =3D new_plane_state->state;
> +	struct gud_device *gdrm =3D to_gud_device(plane->dev);
> +	struct drm_plane_state *old_plane_state =3D
> drm_atomic_get_old_plane_state(state, plane);
> +	struct drm_plane_state *new_plane_state =3D
> drm_atomic_get_new_plane_state(state, plane);
> +	struct drm_crtc *crtc =3D new_plane_state->crtc;
> +	struct drm_crtc_state *crtc_state;
> +	const struct drm_display_mode *mode;
> =C2=A0	struct drm_framebuffer *old_fb =3D old_plane_state->fb;
> =C2=A0	struct drm_connector_state *connector_state =3D NULL;
> =C2=A0	struct drm_framebuffer *fb =3D new_plane_state->fb;
> @@ -472,17 +473,35 @@ int gud_pipe_check(struct
> drm_simple_display_pipe *pipe,
> =C2=A0	if (WARN_ON_ONCE(!fb))
> =C2=A0		return -EINVAL;
> =C2=A0
> +	if (WARN_ON_ONCE(!crtc))
> +		return -EINVAL;
> +
> +	crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
> +
> +	mode =3D &crtc_state->mode;
> +
> +	ret =3D drm_atomic_helper_check_plane_state(new_plane_state,
> crtc_state,
> +						=C2=A0
> DRM_PLANE_NO_SCALING,
> +						=C2=A0
> DRM_PLANE_NO_SCALING,
> +						=C2=A0 false, false);
> +
> +	if (ret)
> +		return ret;
> +
> +	if (!new_plane_state->visible)
> +		return 0;
> +
> =C2=A0	if (old_plane_state->rotation !=3D new_plane_state->rotation)
> -		new_crtc_state->mode_changed =3D true;
> +		crtc_state->mode_changed =3D true;
> =C2=A0
> =C2=A0	if (old_fb && old_fb->format !=3D format)
> -		new_crtc_state->mode_changed =3D true;
> +		crtc_state->mode_changed =3D true;
> =C2=A0
> -	if (!new_crtc_state->mode_changed && !new_crtc_state-
> >connectors_changed)
> +	if (!crtc_state->mode_changed && !crtc_state-
> >connectors_changed)
> =C2=A0		return 0;
> =C2=A0
> =C2=A0	/* Only one connector is supported */
> -	if (hweight32(new_crtc_state->connector_mask) !=3D 1)
> +	if (hweight32(crtc_state->connector_mask) !=3D 1)
> =C2=A0		return -EINVAL;
> =C2=A0
> =C2=A0	if (format->format =3D=3D DRM_FORMAT_XRGB8888 && gdrm-
> >xrgb8888_emulation_format)
> @@ -500,7 +519,7 @@ int gud_pipe_check(struct drm_simple_display_pipe
> *pipe,
> =C2=A0	if (!connector_state) {
> =C2=A0		struct drm_connector_list_iter conn_iter;
> =C2=A0
> -		drm_connector_list_iter_begin(pipe->crtc.dev,
> &conn_iter);
> +		drm_connector_list_iter_begin(plane->dev,
> &conn_iter);
> =C2=A0		drm_for_each_connector_iter(connector, &conn_iter) {
> =C2=A0			if (connector->state->crtc) {
> =C2=A0				connector_state =3D connector->state;
> @@ -567,16 +586,19 @@ int gud_pipe_check(struct
> drm_simple_display_pipe *pipe,
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> -void gud_pipe_update(struct drm_simple_display_pipe *pipe,
> -		=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_plane_state *old_state)
> +void gud_plane_atomic_update(struct drm_plane *plane,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_atomic_state *atomic_state)
> =C2=A0{
> -	struct drm_device *drm =3D pipe->crtc.dev;
> +	struct drm_device *drm =3D plane->dev;
> =C2=A0	struct gud_device *gdrm =3D to_gud_device(drm);
> -	struct drm_plane_state *state =3D pipe->plane.state;
> -	struct drm_shadow_plane_state *shadow_plane_state =3D
> to_drm_shadow_plane_state(state);
> -	struct drm_framebuffer *fb =3D state->fb;
> -	struct drm_crtc *crtc =3D &pipe->crtc;
> +	struct drm_plane_state *old_state =3D
> drm_atomic_get_old_plane_state(atomic_state, plane);
> +	struct drm_plane_state *new_state =3D
> drm_atomic_get_new_plane_state(atomic_state, plane);
> +	struct drm_shadow_plane_state *shadow_plane_state =3D
> to_drm_shadow_plane_state(new_state);
> +	struct drm_framebuffer *fb =3D new_state->fb;
> +	struct drm_crtc *crtc =3D new_state->crtc;
> =C2=A0	struct drm_rect damage;
> +	struct drm_rect dst_clip;
> +	struct drm_atomic_helper_damage_iter iter;
> =C2=A0	int ret, idx;
> =C2=A0
> =C2=A0	if (crtc->state->mode_changed || !crtc->state->enable) {
> @@ -611,8 +633,15 @@ void gud_pipe_update(struct
> drm_simple_display_pipe *pipe,
> =C2=A0	if (ret)
> =C2=A0		goto ctrl_disable;
> =C2=A0
> -	if (drm_atomic_helper_damage_merged(old_state, state,
> &damage))
> +	drm_atomic_helper_damage_iter_init(&iter, old_state,
> new_state);
> +	drm_atomic_for_each_plane_damage(&iter, &damage) {
> +		dst_clip =3D new_state->dst;
> +
> +		if (!drm_rect_intersect(&dst_clip, &damage))
> +			continue;
> +
> =C2=A0		gud_fb_handle_damage(gdrm, fb, &shadow_plane_state-
> >data[0], &damage);
> +	}
> =C2=A0
> =C2=A0	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
> =C2=A0
My apologies, I appear to have typo'd the mailing list, I am replying
to ensure that it is included here

Ruben
