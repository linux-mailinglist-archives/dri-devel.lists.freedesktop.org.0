Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC82326383
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 14:49:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC726EDEA;
	Fri, 26 Feb 2021 13:48:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8236EDEF
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 13:48:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 92D79AE07;
 Fri, 26 Feb 2021 13:48:54 +0000 (UTC)
Subject: Re: [PATCH] drm/arcpgu: Really delete file
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210226133647.1403642-1-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <b056430b-be29-2a33-08f9-822e718131dc@suse.de>
Date: Fri, 26 Feb 2021 14:48:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210226133647.1403642-1-daniel.vetter@ffwll.ch>
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
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============0694213387=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0694213387==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="QYPbD6vrF2D5powXec0Eb1LuI1lCRvf7a"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--QYPbD6vrF2D5powXec0Eb1LuI1lCRvf7a
Content-Type: multipart/mixed; boundary="6DO8qEMMfWzD2I5LMs2jRZ3Fa7TUU5zA6";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Alexey Brodkin <abrodkin@synopsys.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Message-ID: <b056430b-be29-2a33-08f9-822e718131dc@suse.de>
Subject: Re: [PATCH] drm/arcpgu: Really delete file
References: <20210226133647.1403642-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20210226133647.1403642-1-daniel.vetter@ffwll.ch>

--6DO8qEMMfWzD2I5LMs2jRZ3Fa7TUU5zA6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 26.02.21 um 14:36 schrieb Daniel Vetter:
> Somehow this got forgotten when I applied the patch in
>=20
> commit e2c406ea0b0d398a4afda5702957064cc74f8c25
> Author: Daniel Vetter <daniel.vetter@ffwll.ch>
> Date:   Tue Jan 12 09:43:54 2021 +0100
>=20
>      drm/arc: Inline arcpgu_crtc.c
>=20
> Fixes: e2c406ea0b0d ("drm/arc: Inline arcpgu_crtc.c")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/arc/arcpgu_crtc.c | 161 -----------------------------=
-
>   1 file changed, 161 deletions(-)
>   delete mode 100644 drivers/gpu/drm/arc/arcpgu_crtc.c
>=20
> diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/ar=
cpgu_crtc.c
> deleted file mode 100644
> index bfd892a9fa3d..000000000000
> --- a/drivers/gpu/drm/arc/arcpgu_crtc.c
> +++ /dev/null
> @@ -1,161 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * ARC PGU DRM driver.
> - *
> - * Copyright (C) 2016 Synopsys, Inc. (www.synopsys.com)
> - */
> -
> -#include <drm/drm_atomic.h>
> -#include <drm/drm_atomic_helper.h>
> -#include <drm/drm_device.h>
> -#include <drm/drm_fb_cma_helper.h>
> -#include <drm/drm_gem_cma_helper.h>
> -#include <drm/drm_plane_helper.h>
> -#include <drm/drm_probe_helper.h>
> -#include <linux/clk.h>
> -#include <linux/platform_data/simplefb.h>
> -
> -#include "arcpgu.h"
> -#include "arcpgu_regs.h"
> -
> -#define ENCODE_PGU_XY(x, y)	((((x) - 1) << 16) | ((y) - 1))
> -
> -static const u32 arc_pgu_supported_formats[] =3D {
> -	DRM_FORMAT_RGB565,
> -	DRM_FORMAT_XRGB8888,
> -	DRM_FORMAT_ARGB8888,
> -};
> -
> -static void arc_pgu_set_pxl_fmt(struct arcpgu_drm_private *arcpgu)
> -{
> -	const struct drm_framebuffer *fb =3D arcpgu->pipe.plane.state->fb;
> -	uint32_t pixel_format =3D fb->format->format;
> -	u32 format =3D DRM_FORMAT_INVALID;
> -	int i;
> -	u32 reg_ctrl;
> -
> -	for (i =3D 0; i < ARRAY_SIZE(arc_pgu_supported_formats); i++) {
> -		if (arc_pgu_supported_formats[i] =3D=3D pixel_format)
> -			format =3D arc_pgu_supported_formats[i];
> -	}
> -
> -	if (WARN_ON(format =3D=3D DRM_FORMAT_INVALID))
> -		return;
> -
> -	reg_ctrl =3D arc_pgu_read(arcpgu, ARCPGU_REG_CTRL);
> -	if (format =3D=3D DRM_FORMAT_RGB565)
> -		reg_ctrl &=3D ~ARCPGU_MODE_XRGB8888;
> -	else
> -		reg_ctrl |=3D ARCPGU_MODE_XRGB8888;
> -	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL, reg_ctrl);
> -}
> -
> -static enum drm_mode_status arc_pgu_mode_valid(struct drm_simple_displ=
ay_pipe *pipe,
> -					       const struct drm_display_mode *mode)
> -{
> -	struct arcpgu_drm_private *arcpgu =3D pipe_to_arcpgu_priv(pipe);
> -	long rate, clk_rate =3D mode->clock * 1000;
> -	long diff =3D clk_rate / 200; /* +-0.5% allowed by HDMI spec */
> -
> -	rate =3D clk_round_rate(arcpgu->clk, clk_rate);
> -	if ((max(rate, clk_rate) - min(rate, clk_rate) < diff) && (rate > 0))=

> -		return MODE_OK;
> -
> -	return MODE_NOCLOCK;
> -}
> -
> -static void arc_pgu_mode_set(struct arcpgu_drm_private *arcpgu)
> -{
> -	struct drm_display_mode *m =3D &arcpgu->pipe.crtc.state->adjusted_mod=
e;
> -	u32 val;
> -
> -	arc_pgu_write(arcpgu, ARCPGU_REG_FMT,
> -		      ENCODE_PGU_XY(m->crtc_htotal, m->crtc_vtotal));
> -
> -	arc_pgu_write(arcpgu, ARCPGU_REG_HSYNC,
> -		      ENCODE_PGU_XY(m->crtc_hsync_start - m->crtc_hdisplay,
> -				    m->crtc_hsync_end - m->crtc_hdisplay));
> -
> -	arc_pgu_write(arcpgu, ARCPGU_REG_VSYNC,
> -		      ENCODE_PGU_XY(m->crtc_vsync_start - m->crtc_vdisplay,
> -				    m->crtc_vsync_end - m->crtc_vdisplay));
> -
> -	arc_pgu_write(arcpgu, ARCPGU_REG_ACTIVE,
> -		      ENCODE_PGU_XY(m->crtc_hblank_end - m->crtc_hblank_start,
> -				    m->crtc_vblank_end - m->crtc_vblank_start));
> -
> -	val =3D arc_pgu_read(arcpgu, ARCPGU_REG_CTRL);
> -
> -	if (m->flags & DRM_MODE_FLAG_PVSYNC)
> -		val |=3D ARCPGU_CTRL_VS_POL_MASK << ARCPGU_CTRL_VS_POL_OFST;
> -	else
> -		val &=3D ~(ARCPGU_CTRL_VS_POL_MASK << ARCPGU_CTRL_VS_POL_OFST);
> -
> -	if (m->flags & DRM_MODE_FLAG_PHSYNC)
> -		val |=3D ARCPGU_CTRL_HS_POL_MASK << ARCPGU_CTRL_HS_POL_OFST;
> -	else
> -		val &=3D ~(ARCPGU_CTRL_HS_POL_MASK << ARCPGU_CTRL_HS_POL_OFST);
> -
> -	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL, val);
> -	arc_pgu_write(arcpgu, ARCPGU_REG_STRIDE, 0);
> -	arc_pgu_write(arcpgu, ARCPGU_REG_START_SET, 1);
> -
> -	arc_pgu_set_pxl_fmt(arcpgu);
> -
> -	clk_set_rate(arcpgu->clk, m->crtc_clock * 1000);
> -}
> -
> -static void arc_pgu_enable(struct drm_simple_display_pipe *pipe,
> -			   struct drm_crtc_state *crtc_state,
> -			   struct drm_plane_state *plane_state)
> -{
> -	struct arcpgu_drm_private *arcpgu =3D pipe_to_arcpgu_priv(pipe);
> -
> -	arc_pgu_mode_set(arcpgu);
> -
> -	clk_prepare_enable(arcpgu->clk);
> -	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL,
> -		      arc_pgu_read(arcpgu, ARCPGU_REG_CTRL) |
> -		      ARCPGU_CTRL_ENABLE_MASK);
> -}
> -
> -static void arc_pgu_disable(struct drm_simple_display_pipe *pipe)
> -{
> -	struct arcpgu_drm_private *arcpgu =3D pipe_to_arcpgu_priv(pipe);
> -
> -	clk_disable_unprepare(arcpgu->clk);
> -	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL,
> -			      arc_pgu_read(arcpgu, ARCPGU_REG_CTRL) &
> -			      ~ARCPGU_CTRL_ENABLE_MASK);
> -}
> -
> -static void arc_pgu_update(struct drm_simple_display_pipe *pipe,
> -			   struct drm_plane_state *state)
> -{
> -	struct arcpgu_drm_private *arcpgu;
> -	struct drm_gem_cma_object *gem;
> -
> -	if (!pipe->plane.state->fb)
> -		return;
> -
> -	arcpgu =3D pipe_to_arcpgu_priv(pipe);
> -	gem =3D drm_fb_cma_get_gem_obj(pipe->plane.state->fb, 0);
> -	arc_pgu_write(arcpgu, ARCPGU_REG_BUF0_ADDR, gem->paddr);
> -}
> -
> -static const struct drm_simple_display_pipe_funcs arc_pgu_pipe_funcs =3D=
 {
> -	.update =3D arc_pgu_update,
> -	.mode_valid =3D arc_pgu_mode_valid,
> -	.enable	=3D arc_pgu_enable,
> -	.disable =3D arc_pgu_disable,
> -};
> -
> -int arc_pgu_setup_pipe(struct drm_device *drm)
> -{
> -	struct arcpgu_drm_private *arcpgu =3D dev_to_arcpgu(drm);
> -
> -	return drm_simple_display_pipe_init(drm, &arcpgu->pipe, &arc_pgu_pipe=
_funcs,
> -					    arc_pgu_supported_formats,
> -					    ARRAY_SIZE(arc_pgu_supported_formats),
> -					    NULL, NULL);
> -}
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--6DO8qEMMfWzD2I5LMs2jRZ3Fa7TUU5zA6--

--QYPbD6vrF2D5powXec0Eb1LuI1lCRvf7a
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmA4/EUFAwAAAAAACgkQlh/E3EQov+Ap
Nw/+K5bia+9JFC2jblr9SOd1wqYlrnp4xpXK0DfFA3GqKD8Mfa1jcLEC8h+NkI1pVReKnvK/ICiq
cTqbg2QCV+Zx2OA/Y6N09YgwbLcqd83O9FigEs+uIO+C9zH9Zt3B0VuJ4KuJIyeCVw10OD6UhTs3
su8UyyP1DEosPNt3k5W8KMkIdx4xrN6WXhX27F2eqI7iCWzTMraD3nSc4SKkIna+GJv5Hj8bvORf
1QGEOFDWcJO4UThAK+vNCvDvNpAv1Tf2O/NkwH+TdbHpgOTBC0hPRaPHGFlMl3Lip1cmomFKM5b9
RnBBRbxtSCTQQilTcoH6Tg1M6mzSNp4c0/UrsBHwXv5DEcUvWeljmwCk5M4Qe3AnjYEW6ZwI4tIS
pufIs3xXgB6RUlnBDjrt3xHFXJRellwmIgIKb5m6O/zKFEPMjc3h2QGwjRwEgo9SC0lKTZ6jFgZ3
WJTxoujItYbq1NixNOAvjbeJHuI/e08ppxuO0PxixvMDk9l+VJyF21HPkM1h94yMi2v4wMx0EpHA
GEMY3kzyHu2lGiSYrwajgifcEl2RNdsbCpz5I7bLVu8byFr33SmqiKwWox9zeKn13KxsFP9hC8GO
QxlC78t1ODtNdsJRVXsPibkTeNNOerFzjavZwtN8WCAkhaUzXMzbVEIhZ74PWkD1qK+HDcHTfQs0
tOQ=
=P2Qr
-----END PGP SIGNATURE-----

--QYPbD6vrF2D5powXec0Eb1LuI1lCRvf7a--

--===============0694213387==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0694213387==--
