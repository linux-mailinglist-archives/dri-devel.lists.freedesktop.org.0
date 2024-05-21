Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C90C18CAF44
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 15:18:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DE1110E044;
	Tue, 21 May 2024 13:18:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JBygUZI6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C4910E044
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 13:18:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 889AA62238;
 Tue, 21 May 2024 13:18:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCF5FC2BD11;
 Tue, 21 May 2024 13:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716297519;
 bh=jPyGMIbDpl3l7dFh6G+NEKdDAZJ/vPGjnYIHZdX+PQk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JBygUZI6h3wiJ1r0fiMhwyPWz/g/VWy4zOKC6sY98d7k11DCB9bEZvrnfhNFgFCI7
 xONxkMque5q41YgEwatCLixrPwAQb+yO1jeqzd6Sxieebr9/gXaK6JDEfs9V5Ae/Wl
 4szb8FD7aIaqmJLvLO7K13LA1J3ce/5ROnaqV39R3yYl+JOU8/d8rMoGoreDS1v+K2
 e/y7kjUDLPdWlN4/NoXfaDBXH6Xl/3VFY8HgLrEVEjvCk4Jh1ZqIKyjd8AyuwmHXSG
 8xpf3GCNszw65mqGxSAzYOIthD8D4TBxcGBMxhK40ZirGTsC0wws5iWkm9XyiWTvCZ
 ADsTbJswppPkg==
Date: Tue, 21 May 2024 15:18:36 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 DRI Development List <dri-devel@lists.freedesktop.org>, 
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <treding@nvidia.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>
Subject: Re: [PATCH 1/7] drm/tidss: Add CRTC mode_fixup
Message-ID: <20240521-lean-dragon-of-perfection-043fad@houat>
References: <20240511153051.1355825-1-a-bhatia1@ti.com>
 <20240511153051.1355825-2-a-bhatia1@ti.com>
 <20240516-tuscan-mamba-of-debate-c4cddf@penduick>
 <1c4f5862-b1a2-4812-a109-987338ec3a72@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="qr4b63zzpq7nl4wu"
Content-Disposition: inline
In-Reply-To: <1c4f5862-b1a2-4812-a109-987338ec3a72@ti.com>
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


--qr4b63zzpq7nl4wu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2024 at 04:33:40PM GMT, Aradhya Bhatia wrote:
> Hi Maxime,
>=20
> Thank you for reviewing the patches.
>=20
> On 16/05/24 13:40, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Sat, May 11, 2024 at 09:00:45PM +0530, Aradhya Bhatia wrote:
> >> Add support for mode_fixup for the tidss CRTC.
> >>
> >> Some bridges like the cdns-dsi consume the crtc_* timing parameters for
> >> programming the blanking values. Allow for the normal timing parameters
> >> to get copied to crtc_* timing params.
> >>
> >> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> >> ---
> >>  drivers/gpu/drm/tidss/tidss_crtc.c | 11 +++++++++++
> >>  1 file changed, 11 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tids=
s/tidss_crtc.c
> >> index 94f8e3178df5..797ef53d9ad2 100644
> >> --- a/drivers/gpu/drm/tidss/tidss_crtc.c
> >> +++ b/drivers/gpu/drm/tidss/tidss_crtc.c
> >> @@ -309,12 +309,23 @@ enum drm_mode_status tidss_crtc_mode_valid(struc=
t drm_crtc *crtc,
> >>  	return dispc_vp_mode_valid(tidss->dispc, tcrtc->hw_videoport, mode);
> >>  }
> >> =20
> >> +static
> >> +bool tidss_crtc_mode_fixup(struct drm_crtc *crtc,
> >> +			   const struct drm_display_mode *mode,
> >> +			   struct drm_display_mode *adjusted_mode)
> >> +{
> >> +	drm_mode_set_crtcinfo(adjusted_mode, 0);
> >> +
> >> +	return true;
> >> +}
> >> +
> >>  static const struct drm_crtc_helper_funcs tidss_crtc_helper_funcs =3D=
 {
> >>  	.atomic_check =3D tidss_crtc_atomic_check,
> >>  	.atomic_flush =3D tidss_crtc_atomic_flush,
> >>  	.atomic_enable =3D tidss_crtc_atomic_enable,
> >>  	.atomic_disable =3D tidss_crtc_atomic_disable,
> >> =20
> >> +	.mode_fixup =3D tidss_crtc_mode_fixup,
> >>  	.mode_valid =3D tidss_crtc_mode_valid,
> >>  };
> >=20
> > mode_fixup is deprecated for atomic drivers, so the solution must be
> > different there.
> >=20
> > It's also not clear to me how it could change anything there:
> > drm_mode_set_crtcinfo with no flags will make crtc_* field exactly
> > identical to their !crtc counterparts.
> >
>=20
> I checked the flag options. There isn't any flag required. The only
> reason to add this call is because cdns-dsi strictly requires the crtc_*
> fields to be populated during the bridge enable.
>=20
> Secondly, if mode_fixup is deprecated, I think the crtc_atomic_check
> would be the next best place to add this call.

That would be better, yes, but we shouldn't even have to do that in the
first place. AFAIK all the path that create a drm_display_mode will call
drm_mode_set_crtcinfo on it to fill those fields. So if they are missing
somewhere, that's what the actual bug is, not something we should work
around of at the driver level.

Maxime

--qr4b63zzpq7nl4wu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZkyfLAAKCRAnX84Zoj2+
dnpoAX4kO2icxTnf/r4NWxn0+BU8veVEni74msZxDWSUcBWceEwWieQmjI55HRcW
IqYQEtsBfAzAcuPszPO3YqPwyNvcfeoWh/YqtgrQ3Ml5B8ucnSi0wrdpq6fDaz93
W2QAo5X+wQ==
=s00g
-----END PGP SIGNATURE-----

--qr4b63zzpq7nl4wu--
