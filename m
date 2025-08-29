Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEE4B3C466
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 23:56:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F10810EC39;
	Fri, 29 Aug 2025 21:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.b="sKALfVV/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic310-21.consmr.mail.gq1.yahoo.com
 (sonic310-21.consmr.mail.gq1.yahoo.com [98.137.69.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F6810EC39
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 21:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1756504559; bh=2f6BfIkM46QmDlINovTYFl8rCojhvrz4JFGm7r4wsv4=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=sKALfVV/mrARhZ+mHEwY5w5S1m6/nGuHo7J3p192L0wNFl0Sn5gdCZY6Tp8Ru2izcn/MDUQi+0rF3IbVhLaPys5qhrbreD4xf0v9vUN2ybxx+s3cQSpSg7ZhH/lG+PdvW8AB8T4MyAdHJFOeGpiLR1Vjcw7UGj6MT0RDTFEFvj9892IRLKyCaFLBSy1ojk3HJbcG6OGVHb1HoGCtNB4JFNrgnc5VGlHEWsU7FHJ5B3kPjtEteG4RC8c/Owde2lCpXUGPlcGzdsFuKtOa+U4defgOMhFSZhZUMbxP/dK57zcM+Y/Xki8DKohhtL2Xyti4Icvm9+lLHRKCN7tgetyUqA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1756504559; bh=7j2ObEb7TFuMTJldCgmroioAWucG9cTn7fbtxQk7Odr=;
 h=X-Sonic-MF:Subject:From:To:Date:From:Subject;
 b=V+WjTTKCqeE/o89tWB5rVuOA+ch9Nx3Kx1oFrWaK6yh/PcoiMpFNbIpJcOp5Vo2/PrWRaBBIlcgPgDym2Y+4EN/zc42/kweBEgS8Er0PH9v+NOE+UIe8zEIYlDfj+b09botk++KG6OwW7995u55g1xUpRHO9Tx0vRlfYJILgkbPVpKNTXYGWmB8cnYOrFu2DVCIRJqQvRpG+/TaGo6OVCweQLNIRV7pURuXWnOcnsZwKCtK/vZ4PmuKcByL2TAcGbfuXptHcutncvyPhKYSwGFR8tw9Aey4VPomo6HVK1B2XHW8/Ox610jBq9Gu7l1f9ni9dcFACz4bKA2hrgq5wnw==
X-YMail-OSG: Xbsj_rwVM1l2WLwrBh_IOgpkvYKJ9JxAJCnbzmAEjbpoaol8Iscy8VU4MpbZuYG
 FWCyMn_VK0emN_fxc_U7Nv4_uBuJn.LWKk_ZOu9efO2ISL9ppgAAXWLiLze3U5y_2pFPxtdReTfa
 YqiLP0Qfvqvl9vfL4B2vAWl7MX1QQK0m0k9hIDjXTTfbQ.iUc2X1D_eT96u8ZykgK379z5EoKlYr
 5f27b7K.oF2tf8lehhnLRchwxMpHdLDO6HsoNdC_.h.1cvFGVbfNxRSkSIil0Uslsys6u8PR3VII
 2AqHw1iWyjqpmlgYsBdwc4favwMS2kb1zIeQgb0gpCe5dbXEOCguQpzaJJDVPpp5QGe0ndYJC4yd
 tkcGIQP9q8cmV6.9Q3E9er.arm6LCWELTc9d0QwxouOjSgNpMjI.0CkYyVVsnJ57JAnDOacP5usl
 .r8tS6YdDzF.uUUyrawB6zrXfjgNaO9zoY53Dr7eM22tybQDHfTw1VRU16_1ktY1P16DNjCYLpYz
 a6Zw6i_SA3.mmkWfh12lAlpZI_8AmwtvXA2b7xU.k7252g06RCYgul_wl4uJWI.H.fDx.162Amzi
 P3OKzMmmpJgVK6EZcZfOmqzqfzBb9tX3irZEROh77LksCV2ngyJLVd3BVvQg8A0pNHpZ7j76LzOF
 P933sgUIx9s2elPCMx9FrqvClbDaNY7GyDg80R6DvzndA3jaW_alyekXRc3VhHOI0DvX1YqrpHDj
 bhgmpTJc7bVOROyzd4Epr3iTFt2tQJp3TF960PUCfMGXoJf0CiGx7344XZ0zSvBOt_PkcdJSXb.t
 deg4DLcWD.2FVAq.tQ5mPh9itljxusIQSppNIExUa46RYVnn2rsTGYxYdWqpgMx3N25Y320Jo5Wx
 6a4cH72G9Z1nvkim7UVZDj8Gq_lFhw4KPBY_0XZOkZ9AT_9D6Dkes6v2yvdDGg215KXSlZ8bXG2u
 nxx3ya6BoC_iXWi51_2Kw8B_IpblyslHBqGpUjP15thydGncXoTFqZrdI.o0W87o1AVfSgv4tOk.
 j0XJQWccWJ7eYNyPRC4rU4GjrvnrOd4W02wQkrHsP7GDhgRhZ8ueQkhYa9UFOxrbuFBAcw6rc4Jt
 tPcNGY9Zf82sSPV7Ic5rmdbc21xK7BLvrfa3cXmN_QtBAAx8aEEcCqh5QQ2WMX1wkX2DZJKMejjz
 terkLp5qexoDE_9BPkiV.nWdAtQSwMzsKDPIuT0rMkzoCYNWk0htIGiu4qHFss0lVpdIUk5x2cQH
 AQ2CQ3EaALrQBcesL3bx2_kr0rD8hG2uGWqCUE3baCm1RFb6alxY9jQ5QPluuxIHBar6XUI4ClfF
 mSY25f7I2ZV0veqiJT_6J8mSurKK4XMcz14LcipLiSqCbEk9im4PvTgOCVEOrsBX.q0YdR6yVkLR
 e3uPLrrWg4tMZaTG.tnq6O_zTq20ywdkNsWXV9PQ5rSnMFUKAf9298l7IHgz9pE1gpaoB2lzpQOG
 xDgzt4WjGRW6svO9DVc5rLC2nXQ8DdCQqi27vQMnGztwi9EOt6Nge5u88b5.D7E_t99Z12lGVUjb
 d5VnueK9NlzXgLuE94NYM6GO7eph.LH.INrl6v5Kl358cJ883vsXmgORdHrKTYOKhW6eVYXqajDq
 elGucBv1ZJvW2YIslHfPmp5yyzoSsYjpwCTXEGR1iNu8K50MsIkWSUuBiso1B8XeNQfecVwKWmCV
 gpdZ021rDMZn5wCdY85aLFv_Uff4D_o6TX_ksVyERE29SlccnY3W8Gju1Erbj6JaNdiWG8ys1k9I
 QdsluxmLkQX6bzkb1_Do1vervnGLlZ0F92MF1pEXh27XMqoNOFMB7kTkjOm06nyigSOgT..EbV.W
 rl0XoSxbi0sllXfqFWxFSywsl2hzLLG_LtWU7_ckJUp9RX0locusHzV11_lmxjoUbHdMtO1xCgiH
 6xoguJA137wCh0PWgJTkHuK5SlNkkgo2ITW4G6MxH70Bsc7jCClfvGzVoJOlRFVVdyz5nrdEAZ94
 5fWKVe0F8VkbD7WSeHOX6GU9MeOHOd03MLku7v2erZyrxKqkDoorajX7LQgvRNhPgWIAMjtrazqV
 q8MvzdJSifT0DOW5Z.EsbaYMHApBy.mlpFA0rEF41NEv3Xy4Q0CsVpkjuRelTkrgbuWwbHo3fd5g
 1wMlunFlPbvt3QRFnIcoFo.UezabZnhsPlDlqQ_gg..axw9AaGxbKRDgjnwJcULlWeLxiwcocYpC
 Tpc7TgTPTf0POXgl9PKlQgELyTUkXhtaV.tyQ8frAdkJ6oqH0HQQ_0y67
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: 49948386-4028-4a6a-84cb-25f9ec076e16
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic310.consmr.mail.gq1.yahoo.com with HTTP; Fri, 29 Aug 2025 21:55:59 +0000
Received: by hermes--production-ir2-7d8c9489f-8n4zw (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 66d03f964ec0b6a1a22218baa273b900; 
 Fri, 29 Aug 2025 21:55:56 +0000 (UTC)
Message-ID: <03c1feb8ab27f0ebd9add221fbbedc384deae244.camel@aol.com>
Subject: Re: [PATCH v3] drm/gud: Replace simple display pipe with DRM atomic
 helpers
From: Ruben Wauters <rubenru09@aol.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard	
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Ingo Molnar	
 <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jani Nikula	
 <jani.nikula@intel.com>, Jocelyn Falempe <jfalempe@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Fri, 29 Aug 2025 22:55:54 +0100
In-Reply-To: <20250818193553.2162-1-rubenru09@aol.com>
References: <20250818193553.2162-1-rubenru09.ref@aol.com>
 <20250818193553.2162-1-rubenru09@aol.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
MIME-Version: 1.0
X-Mailer: WebService/1.1.24362
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

On Mon, 2025-08-18 at 20:35 +0100, Ruben Wauters wrote:
> The simple display pipe is obsolete and the atomic helpers allow for
> more control over the rendering process. As such, this patch replaces
> the old simple display pipe system with the newer atomic helpers.
>=20
> As the code is mainly the same, merely replaced with the new atomic
> system, there should be no change in functionality.
>=20
> Signed-off-by: Ruben Wauters <rubenru09@aol.com>

Hello, I was just checking to see if anyone had a chance to review this
patch?

Thank you

Ruben Wauters

> ---
> I noticed as well elsewhere in the driver WARN_ON_ONCE was used
> instead
> of drm_WARN_ON_ONCE(). I have fixed it for the ones I've modified,
> and
> will fix it for the driver as a whole in another patch.
>=20
> v2 changes:
> - address review comments by reorganising gud_probe()
>=20
> v3 changes:
> - fix formatting and spacing
> - remove unnecessary includes
> - convert WARN_ON_ONCE() to drm_WARN_ON_ONCE()
> - remove dst rect intersect check
> - remove encoder from gud_device and switch to gconn->encoder
> ---
> =C2=A0drivers/gpu/drm/gud/gud_connector.c | 25 +++++------
> =C2=A0drivers/gpu/drm/gud/gud_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
 52 ++++++++++++++++++-----
> =C2=A0drivers/gpu/drm/gud/gud_internal.h=C2=A0 | 13 +++---
> =C2=A0drivers/gpu/drm/gud/gud_pipe.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 64 +=
++++++++++++++++++--------
> --
> =C2=A04 files changed, 99 insertions(+), 55 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/gud/gud_connector.c
> b/drivers/gpu/drm/gud/gud_connector.c
> index 0f07d77c5d52..4a15695fa933 100644
> --- a/drivers/gpu/drm/gud/gud_connector.c
> +++ b/drivers/gpu/drm/gud/gud_connector.c
> @@ -16,7 +16,6 @@
> =C2=A0#include <drm/drm_modeset_helper_vtables.h>
> =C2=A0#include <drm/drm_print.h>
> =C2=A0#include <drm/drm_probe_helper.h>
> -#include <drm/drm_simple_kms_helper.h>
> =C2=A0#include <drm/gud.h>
> =C2=A0
> =C2=A0#include "gud_internal.h"
> @@ -607,13 +606,16 @@ int gud_connector_fill_properties(struct
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
> @@ -681,20 +683,13 @@ static int gud_connector_create(struct
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
> +	gconn->encoder.possible_crtcs =3D drm_crtc_mask(&gdrm->crtc);
> +	ret =3D drm_encoder_init(drm, &gconn->encoder,
> &gud_drm_simple_encoder_funcs_cleanup,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_MODE_ENCODER_NONE, NULL);
> +	if (ret)
> +		return ret;
> =C2=A0
> -	return drm_connector_attach_encoder(connector, encoder);
> +	return drm_connector_attach_encoder(connector, &gconn-
> >encoder);
> =C2=A0}
> =C2=A0
> =C2=A0int gud_get_connectors(struct gud_device *gdrm)
> diff --git a/drivers/gpu/drm/gud/gud_drv.c
> b/drivers/gpu/drm/gud/gud_drv.c
> index 5385a2126e45..5f57f841e603 100644
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
> @@ -27,7 +28,6 @@
> =C2=A0#include <drm/drm_managed.h>
> =C2=A0#include <drm/drm_print.h>
> =C2=A0#include <drm/drm_probe_helper.h>
> -#include <drm/drm_simple_kms_helper.h>
> =C2=A0#include <drm/gud.h>
> =C2=A0
> =C2=A0#include "gud_internal.h"
> @@ -289,7 +289,7 @@ static int gud_get_properties(struct gud_device
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
> @@ -338,10 +338,30 @@ static int gud_stats_debugfs(struct seq_file
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
> @@ -350,7 +370,7 @@ static const struct drm_mode_config_funcs
> gud_mode_config_funcs =3D {
> =C2=A0	.atomic_commit =3D drm_atomic_helper_commit,
> =C2=A0};
> =C2=A0
> -static const u64 gud_pipe_modifiers[] =3D {
> +static const u64 gud_plane_modifiers[] =3D {
> =C2=A0	DRM_FORMAT_MOD_LINEAR,
> =C2=A0	DRM_FORMAT_MOD_INVALID
> =C2=A0};
> @@ -567,12 +587,17 @@ static int gud_probe(struct usb_interface
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
> @@ -582,7 +607,12 @@ static int gud_probe(struct usb_interface *intf,
> const struct usb_device_id *id)
> =C2=A0		return ret;
> =C2=A0	}
> =C2=A0
> -	drm_plane_enable_fb_damage_clips(&gdrm->pipe.plane);
> +	ret =3D drm_crtc_init_with_planes(drm, &gdrm->crtc, &gdrm-
> >plane, NULL,
> +					&gud_crtc_funcs, NULL);
> +	if (ret)
> +		return ret;
> +
> +	drm_crtc_helper_add(&gdrm->crtc, &gud_crtc_helper_funcs);
> =C2=A0
> =C2=A0	ret =3D gud_get_connectors(gdrm);
> =C2=A0	if (ret) {
> diff --git a/drivers/gpu/drm/gud/gud_internal.h
> b/drivers/gpu/drm/gud/gud_internal.h
> index d6fb25388722..d27c31648341 100644
> --- a/drivers/gpu/drm/gud/gud_internal.h
> +++ b/drivers/gpu/drm/gud/gud_internal.h
> @@ -11,11 +11,11 @@
> =C2=A0#include <uapi/drm/drm_fourcc.h>
> =C2=A0
> =C2=A0#include <drm/drm_modes.h>
> -#include <drm/drm_simple_kms_helper.h>
> =C2=A0
> =C2=A0struct gud_device {
> =C2=A0	struct drm_device drm;
> -	struct drm_simple_display_pipe pipe;
> +	struct drm_plane plane;
> +	struct drm_crtc crtc;
> =C2=A0	struct work_struct work;
> =C2=A0	u32 flags;
> =C2=A0	const struct drm_format_info *xrgb8888_emulation_format;
> @@ -62,11 +62,10 @@ int gud_usb_set_u8(struct gud_device *gdrm, u8
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
> index 8d548d08f127..54d9aa9998e5 100644
> --- a/drivers/gpu/drm/gud/gud_pipe.c
> +++ b/drivers/gpu/drm/gud/gud_pipe.c
> @@ -20,7 +20,6 @@
> =C2=A0#include <drm/drm_gem_framebuffer_helper.h>
> =C2=A0#include <drm/drm_print.h>
> =C2=A0#include <drm/drm_rect.h>
> -#include <drm/drm_simple_kms_helper.h>
> =C2=A0#include <drm/gud.h>
> =C2=A0
> =C2=A0#include "gud_internal.h"
> @@ -451,14 +450,15 @@ static void gud_fb_handle_damage(struct
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
> @@ -469,20 +469,37 @@ int gud_pipe_check(struct
> drm_simple_display_pipe *pipe,
> =C2=A0	int idx, ret;
> =C2=A0	size_t len;
> =C2=A0
> -	if (WARN_ON_ONCE(!fb))
> +	if (drm_WARN_ON_ONCE(plane->dev, !fb))
> =C2=A0		return -EINVAL;
> =C2=A0
> +	if (drm_WARN_ON_ONCE(plane->dev, !crtc))
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
> @@ -500,7 +517,7 @@ int gud_pipe_check(struct drm_simple_display_pipe
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
> @@ -567,16 +584,18 @@ int gud_pipe_check(struct
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
> +	struct drm_atomic_helper_damage_iter iter;
> =C2=A0	int ret, idx;
> =C2=A0
> =C2=A0	if (crtc->state->mode_changed || !crtc->state->enable) {
> @@ -611,7 +630,8 @@ void gud_pipe_update(struct
> drm_simple_display_pipe *pipe,
> =C2=A0	if (ret)
> =C2=A0		goto ctrl_disable;
> =C2=A0
> -	if (drm_atomic_helper_damage_merged(old_state, state,
> &damage))
> +	drm_atomic_helper_damage_iter_init(&iter, old_state,
> new_state);
> +	drm_atomic_for_each_plane_damage(&iter, &damage)
> =C2=A0		gud_fb_handle_damage(gdrm, fb, &shadow_plane_state-
> >data[0], &damage);
> =C2=A0
> =C2=A0	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
