Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F08AED741
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 10:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9338010E3B3;
	Mon, 30 Jun 2025 08:28:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bQ6xH78q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A68F510E3B3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 08:27:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ABC155C5AF5;
 Mon, 30 Jun 2025 08:27:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EF9EC4CEE3;
 Mon, 30 Jun 2025 08:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751272078;
 bh=ExGZ+hp1EMO7sgbPEgeTbzMknTG+/ihzeS1dOJyPhJ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bQ6xH78qLJp+C4tcNHw2W+kht79GTUHVzvgfA6HEiaSjI85fxBdkO2h43U8B99SpA
 sshvE0Sgm02SKHweBo330bCJpiJAere5OZXxznjkT9VZjuSCJ1AIUytKGDGyCw7VCE
 uEbIFIL0UofF3xWZbuniVtEjK15/je81RNWb81BmeXddoN0rp/B0KPviSrJP16SxoH
 pnFqCDTr5znVFoN3zHiLrlg0JNTtWYRg8dofrq39/nSA4vvB4d1QlLyEulrxTphX12
 UfiD7QlMuJuahrbIwk0fBRLnC5KOBX6PJF7DQlfQMHJBQ5YDqbWy6D93CkurMkN7Jr
 fGf640YpNsi3w==
Date: Mon, 30 Jun 2025 10:27:55 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Michal Simek <michal.simek@amd.com>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888
Message-ID: <20250630-psychedelic-tested-smilodon-adcbb3@houat>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.fb98a918-329e-4536-a0a5-a99b22ba0120@emailsignatures365.codetwo.com>
 <20250627145058.6880-1-mike.looijmans@topic.nl>
 <20250627181911.GF24912@pendragon.ideasonboard.com>
 <42af6260-c8af-42e1-a9bb-adfaaabf0190@topic.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="wubb6iu6izzzylya"
Content-Disposition: inline
In-Reply-To: <42af6260-c8af-42e1-a9bb-adfaaabf0190@topic.nl>
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


--wubb6iu6izzzylya
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888
MIME-Version: 1.0

On Mon, Jun 30, 2025 at 10:03:16AM +0200, Mike Looijmans wrote:
> On 27-06-2025 20:19, Laurent Pinchart wrote:
> > Hi Mike,
> >=20
> > Thank you for the patch.
> >=20
> > On Fri, Jun 27, 2025 at 04:50:46PM +0200, Mike Looijmans wrote:
> > > XRGB8888 is the default mode that Xorg will want to use. Add support
> > > for this to the Zynqmp DisplayPort driver, so that applications can u=
se
> > > 32-bit framebuffers. This solves that the X server would fail to start
> > > unless one provided an xorg.conf that sets DefaultDepth to 16.
> > >=20
> > > Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> > > ---
> > >=20
> > >   drivers/gpu/drm/xlnx/zynqmp_disp.c | 5 +++++
> > >   1 file changed, 5 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xln=
x/zynqmp_disp.c
> > > index 80d1e499a18d..501428437000 100644
> > > --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > > +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > > @@ -312,6 +312,11 @@ static const struct zynqmp_disp_format avbuf_gfx=
_fmts[] =3D {
> > >   		.buf_fmt	=3D ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA8888,
> > >   		.swap		=3D true,
> > >   		.sf		=3D scaling_factors_888,
> > > +	}, {
> > > +		.drm_fmt	=3D DRM_FORMAT_XRGB8888,
> > > +		.buf_fmt	=3D ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA8888,
> > > +		.swap		=3D true,
> > > +		.sf		=3D scaling_factors_888,
> > I'm afraid that's not enough. There's a crucial difference between
> > DRM_FORMAT_ARGB8888 (already supported by this driver) and
> > DRM_FORMAT_XRGB8888: for the latter, the 'X' component must be ignored.
> > The graphics layer is blended on top of the video layer, and the blender
> > uses both a global alpha parameter and the alpha channel of the graphics
> > layer for 32-bit RGB formats. This will lead to incorrect operation when
> > the 'X' component is not set to full opacity.
>=20
> I spent a few hours digging in the source code and what I could find in t=
he
> TRM and register maps, but there's not enough information in there to
> explain how the blender works. The obvious "XRGB" implementation would be=
 to
> just disable the blender.
>=20
> What I got from experimenting so far is that the alpha component is ignor=
ed
> anyway while the video path isn't active. So as long as one isn't using t=
he
> video blending path, the ARGB and XRGB modes are identical.
>=20
> Guess I'll need assistance from AMD/Xilinx to completely implement the XR=
GB
> modes.
>=20
> (For our application, this patch is sufficient as it solves the issues li=
ke
> X11 not starting up, OpenGL not working and horrendously slow scaling
> performance)

Given that we consider XRGB8888 mandatory, this patch is a good thing to
have anyway, even if suboptimal, or broken in some scenario we can
always fix later.

Maxime

--wubb6iu6izzzylya
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaGJKiwAKCRAnX84Zoj2+
doZjAYDh8BvtZ4CVCSL3YLa/LXA8KJsca7YWzmy1bXxRsVQNdO7RqPJnh655oKNG
GawAt0kBfR/KxUOlvfUoVhDMGpTxWXOYm2YMcamWeB6hJNTXvgJu3HiRdIKB4BBD
kP7VjQzWVA==
=3bOh
-----END PGP SIGNATURE-----

--wubb6iu6izzzylya--
