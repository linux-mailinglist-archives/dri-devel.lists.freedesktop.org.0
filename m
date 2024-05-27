Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E9A8CFC60
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 11:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB62E10F993;
	Mon, 27 May 2024 09:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TRMPiNiI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC21910F993
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 09:02:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 81B04CE0B26;
 Mon, 27 May 2024 09:02:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A944C2BBFC;
 Mon, 27 May 2024 09:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716800536;
 bh=uYAFBgtM5vXI9g7/LeVQ+pczQ1yooR+keQpxvhcuA8k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TRMPiNiIHap5cUpLkC3niSfLnS5r5ay/7/AKD7dAXmxw4VtzFUte71pZ8s4wYxN6C
 5N7gB4+obnBGFvTNNxSuXzK/U5TbAzL9ZplGMilaZr1KdblJ6LczlqxIQ8GuuBy7nc
 9i1Xee/2KLe/dEp3NpfRWXYMXpQGjWGZRqeXwpsjJf83/GO2GxAql5Y4nbHCV2YGjz
 rYh02qQutduLCSqGeaeXpUEYU9uSWnlHpo/iwn2FqW2k+BzSyYmty//oZ6FRorGIBN
 +xcOBIRc0ZuQyvFii3U1AO5zNKn47fmXCnneBR7Hq+ycIaKg4tSKiWLgwSvWA5gvkB
 +hbDCAwtJxCnQ==
Date: Mon, 27 May 2024 11:02:13 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Wick <sebastian.wick@redhat.com>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH v14 17/28] drm/connector: hdmi: Add Broadcast RGB property
Message-ID: <20240527-adamant-just-spaniel-ebed4e@houat>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-17-51950db4fedb@kernel.org>
 <4n55dbl2h275z5ubebigri4xjtjsvt44w62n656srdgndcav2j@rrq5haucqx5u>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="wqcwbvnihqwt2l7e"
Content-Disposition: inline
In-Reply-To: <4n55dbl2h275z5ubebigri4xjtjsvt44w62n656srdgndcav2j@rrq5haucqx5u>
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


--wqcwbvnihqwt2l7e
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks again for that thorough review :)

On Thu, May 23, 2024 at 01:22:56PM GMT, Dmitry Baryshkov wrote:
> On Tue, May 21, 2024 at 12:13:50PM +0200, Maxime Ripard wrote:
> > The i915 driver has a property to force the RGB range of an HDMI output.
> > The vc4 driver then implemented the same property with the same
> > semantics. KWin has support for it, and a PR for mutter is also there to
> > support it.
> >=20
> > Both drivers implementing the same property with the same semantics,
> > plus the userspace having support for it, is proof enough that it's
> > pretty much a de-facto standard now and we can provide helpers for it.
> >=20
> > Let's plumb it into the newly created HDMI connector.
> >=20
> > Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  Documentation/gpu/kms-properties.csv            |  1 -
> >  drivers/gpu/drm/display/drm_hdmi_state_helper.c |  4 +-
> >  drivers/gpu/drm/drm_atomic.c                    |  2 +
> >  drivers/gpu/drm/drm_atomic_uapi.c               |  4 ++
> >  drivers/gpu/drm/drm_connector.c                 | 88 +++++++++++++++++=
++++++++
> >  include/drm/drm_connector.h                     | 36 ++++++++++
> >  6 files changed, 133 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/Documentation/gpu/kms-properties.csv b/Documentation/gpu/k=
ms-properties.csv
> > index 0f9590834829..caef14c532d4 100644
> > --- a/Documentation/gpu/kms-properties.csv
> > +++ b/Documentation/gpu/kms-properties.csv
> > @@ -15,11 +15,10 @@ Owner Module/Drivers,Group,Property Name,Type,Prope=
rty Values,Object attached,De
> >  ,,=E2=80=9Csaturation=E2=80=9D,RANGE,"Min=3D0, Max=3D100",Connector,TBD
> >  ,,=E2=80=9Chue=E2=80=9D,RANGE,"Min=3D0, Max=3D100",Connector,TBD
> >  ,Virtual GPU,=E2=80=9Csuggested X=E2=80=9D,RANGE,"Min=3D0, Max=3D0xfff=
fffff",Connector,property to suggest an X offset for a connector
> >  ,,=E2=80=9Csuggested Y=E2=80=9D,RANGE,"Min=3D0, Max=3D0xffffffff",Conn=
ector,property to suggest an Y offset for a connector
> >  ,Optional,"""aspect ratio""",ENUM,"{ ""None"", ""4:3"", ""16:9"" }",Co=
nnector,TDB
> > -i915,Generic,"""Broadcast RGB""",ENUM,"{ ""Automatic"", ""Full"", ""Li=
mited 16:235"" }",Connector,"When this property is set to Limited 16:235 an=
d CTM is set, the hardware will be programmed with the result of the multip=
lication of CTM by the limited range matrix to ensure the pixels normally i=
n the range 0..1.0 are remapped to the range 16/255..235/255."
>=20
> Should it still be defined as a generic property?

I'm not sure what you mean here, sorry. It's being documented as a
connector property now, so it's very much still listed as a generic
property?

Maxime

--wqcwbvnihqwt2l7e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZlRMEAAKCRAnX84Zoj2+
dhGAAYDS1llqP+ICZyWXx+g6L1EiXrG7OIB0z7t7KF3yJW5Y1zN4+dIvVNhFS6LU
gAXKTp4BgKUepq65FIlFjrRN3gyXTVxmbiIMJd5mPgjySS4scgX65VNBO5cc0Qvt
qThCHUrQ2A==
=K55A
-----END PGP SIGNATURE-----

--wqcwbvnihqwt2l7e--
