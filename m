Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DA9AEDA49
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 12:52:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB0610E215;
	Mon, 30 Jun 2025 10:52:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ecgrLFsX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D12B210E215
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 10:52:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 176A2A53208;
 Mon, 30 Jun 2025 10:52:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67264C4CEE3;
 Mon, 30 Jun 2025 10:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751280770;
 bh=q1KZr0/MIJZ8BsWYHDkbrBS3lhf5eDtx+xoZZVvacOU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ecgrLFsXHv0STRWJRz3rjgLu6kC+84OjZyTK1M0XU+VV/KKLSJY8iVk0z07rGAGIC
 KqMHfdnDu0i+XTUpzBL4Qr6niVls6FpN+2mp1ifhAQhSiG9CbOD4thykXFUKZqfCfu
 /xJagnZanADmRgv/M/JyWxDSkme+rjDfUlsdJ8eeBucWSWK2XGEz2hmLrRE9WiQzDz
 97lHo+RItUwfJzNhw0os/KYbbPg8VrCbY8/NuRXBUVLa7tcruYfoncbXoIs8S8nN+u
 i31YDGGmI4ZaLFUVM12wiHeBsOt20QVNPTp/349ad86D3N7LTb3eCQj1MlVO6GTUtR
 VP61RBZsxBIKg==
Date: Mon, 30 Jun 2025 12:52:48 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mike Looijmans <mike.looijmans@topic.nl>, 
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Michal Simek <michal.simek@amd.com>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888
Message-ID: <20250630-delicate-stirring-sawfly-dd81be@houat>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.fb98a918-329e-4536-a0a5-a99b22ba0120@emailsignatures365.codetwo.com>
 <20250627145058.6880-1-mike.looijmans@topic.nl>
 <20250627181911.GF24912@pendragon.ideasonboard.com>
 <42af6260-c8af-42e1-a9bb-adfaaabf0190@topic.nl>
 <20250630-psychedelic-tested-smilodon-adcbb3@houat>
 <20250630091156.GE24861@pendragon.ideasonboard.com>
 <20250630-phenomenal-taipan-of-imagination-59b300@houat>
 <20250630093335.GC20333@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="7zpx456z6zatiarb"
Content-Disposition: inline
In-Reply-To: <20250630093335.GC20333@pendragon.ideasonboard.com>
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


--7zpx456z6zatiarb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888
MIME-Version: 1.0

On Mon, Jun 30, 2025 at 12:33:35PM +0300, Laurent Pinchart wrote:
> On Mon, Jun 30, 2025 at 11:29:08AM +0200, Maxime Ripard wrote:
> > On Mon, Jun 30, 2025 at 12:11:56PM +0300, Laurent Pinchart wrote:
> > > On Mon, Jun 30, 2025 at 10:27:55AM +0200, Maxime Ripard wrote:
> > > > On Mon, Jun 30, 2025 at 10:03:16AM +0200, Mike Looijmans wrote:
> > > > > On 27-06-2025 20:19, Laurent Pinchart wrote:
> > > > > > On Fri, Jun 27, 2025 at 04:50:46PM +0200, Mike Looijmans wrote:
> > > > > > > XRGB8888 is the default mode that Xorg will want to use. Add =
support
> > > > > > > for this to the Zynqmp DisplayPort driver, so that applicatio=
ns can use
> > > > > > > 32-bit framebuffers. This solves that the X server would fail=
 to start
> > > > > > > unless one provided an xorg.conf that sets DefaultDepth to 16.
> > > > > > >=20
> > > > > > > Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> > > > > > > ---
> > > > > > >=20
> > > > > > >   drivers/gpu/drm/xlnx/zynqmp_disp.c | 5 +++++
> > > > > > >   1 file changed, 5 insertions(+)
> > > > > > >=20
> > > > > > > diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu=
/drm/xlnx/zynqmp_disp.c
> > > > > > > index 80d1e499a18d..501428437000 100644
> > > > > > > --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > > > > > > +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > > > > > > @@ -312,6 +312,11 @@ static const struct zynqmp_disp_format a=
vbuf_gfx_fmts[] =3D {
> > > > > > >   		.buf_fmt	=3D ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA8888,
> > > > > > >   		.swap		=3D true,
> > > > > > >   		.sf		=3D scaling_factors_888,
> > > > > > > +	}, {
> > > > > > > +		.drm_fmt	=3D DRM_FORMAT_XRGB8888,
> > > > > > > +		.buf_fmt	=3D ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA8888,
> > > > > > > +		.swap		=3D true,
> > > > > > > +		.sf		=3D scaling_factors_888,
> > > > > >=20
> > > > > > I'm afraid that's not enough. There's a crucial difference betw=
een
> > > > > > DRM_FORMAT_ARGB8888 (already supported by this driver) and
> > > > > > DRM_FORMAT_XRGB8888: for the latter, the 'X' component must be =
ignored.
> > > > > > The graphics layer is blended on top of the video layer, and th=
e blender
> > > > > > uses both a global alpha parameter and the alpha channel of the=
 graphics
> > > > > > layer for 32-bit RGB formats. This will lead to incorrect opera=
tion when
> > > > > > the 'X' component is not set to full opacity.
> > > > >=20
> > > > > I spent a few hours digging in the source code and what I could f=
ind in the
> > > > > TRM and register maps, but there's not enough information in ther=
e to
> > > > > explain how the blender works. The obvious "XRGB" implementation =
would be to
> > > > > just disable the blender.
> > > > >=20
> > > > > What I got from experimenting so far is that the alpha component =
is ignored
> > > > > anyway while the video path isn't active. So as long as one isn't=
 using the
> > > > > video blending path, the ARGB and XRGB modes are identical.
> > > > >=20
> > > > > Guess I'll need assistance from AMD/Xilinx to completely implemen=
t the XRGB
> > > > > modes.
> > > > >=20
> > > > > (For our application, this patch is sufficient as it solves the i=
ssues like
> > > > > X11 not starting up, OpenGL not working and horrendously slow sca=
ling
> > > > > performance)
> > > >=20
> > > > Given that we consider XRGB8888 mandatory,
> > >=20
> > > How about platforms that can't support it at all ?
> >=20
> > We emulate it.
>=20
> Does that imply a full memcpy of the frame buffer in the kernel driver,
> or is it emulated in userspace ?

Neither :)

The kernel deals with it through drm_fb_xrgb8888_to_* helpers, but only
on the parts of the framebuffer that were modified through the damage
API.

Maxime

--7zpx456z6zatiarb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaGJsfwAKCRAnX84Zoj2+
dny7AYDd0xgmlPJq48l6j6ITd1NQBpubs0QOV0cxbuBfCQk6LucgA/OSNsNH1XvL
jJupuxEBgOUIy+PG4bk0zviI7u3lVVeR0byLR4tjhiTMfJaV1ZaeFUJewKnbJQoj
eN0/o9upwQ==
=WNY/
-----END PGP SIGNATURE-----

--7zpx456z6zatiarb--
