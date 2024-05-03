Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AB38BB12D
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 18:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3BA311316E;
	Fri,  3 May 2024 16:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qWErinrA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E705113169
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 16:45:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 15835CE1870;
 Fri,  3 May 2024 16:45:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DC64C4AF1B;
 Fri,  3 May 2024 16:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714754751;
 bh=vsZuJtE5RGT667IHPY/tz9/wy6NQgx5LKgSSROUkDps=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qWErinrARu9gq/beFo4aJATTpl6SurxgGw/4MRM7iH629nDeRtt8drkMJmAH+RDBa
 Kkn1caeXiYr7BfU27hiui52fBBdUBvSez1mvpAVA9OnA+blZSfoJHrGqNaT2bvAHZV
 iddS04wrO6neD6XOv2U6EHOnDnwbTgcYMj6aNRYNcLYOAi0WQj/JV7gJdpaUVUBhO7
 xw35DmsopLc7pYjIg/MJtxu7/Y1l9G6Q77+F1iA/e1f6jkjDeDHJo/9vp1ZuONgvju
 zwBwH8J+dn+c/Rmo03WQqWh4252rxtpY5iAaO/hSDVTU4UdzfhlNCzQHOJ58zejxwq
 nn+LKZpGEKmsA==
Date: Fri, 3 May 2024 17:45:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Xin Ji <xji@analogixsemi.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: anx7625: Add a perporty to
 change TDM setting
Message-ID: <20240503-footrest-gladly-c0ed7d92d816@spud>
References: <20240502-anx-tdm-v1-0-894a9f634f44@chromium.org>
 <20240502-anx-tdm-v1-1-894a9f634f44@chromium.org>
 <20240502-sheath-share-eac9afc24da9@spud>
 <CAHc4DN+mCbBuB3D9kB2x8HYj9iaX7t6Q4Qjj7hotH3u=eAHJSg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OIMQ9YJ2fz4azP4P"
Content-Disposition: inline
In-Reply-To: <CAHc4DN+mCbBuB3D9kB2x8HYj9iaX7t6Q4Qjj7hotH3u=eAHJSg@mail.gmail.com>
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


--OIMQ9YJ2fz4azP4P
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 03, 2024 at 02:58:16PM +0800, Hsin-Te Yuan wrote:
> On Thu, May 2, 2024 at 10:47=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Thu, May 02, 2024 at 09:03:31AM +0000, Hsin-Te Yuan wrote:
> > > Add a perporty to indicate whether anx7625 should shift the first aud=
io
> > > data bit. The default TDM setting is to shift the first audio data bi=
t.
> > >
> > > Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> > > ---
> > >  .../devicetree/bindings/display/bridge/analogix,anx7625.yaml        =
  | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/analogi=
x,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,=
anx7625.yaml
> > > index a1ed1004651b9..915d5d54a2160 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx76=
25.yaml
> > > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx76=
25.yaml
> > > @@ -82,6 +82,10 @@ properties:
> > >      type: boolean
> > >      description: let the driver enable audio HDMI codec function or =
not.
> > >
> > > +  no-shift-audio-data:
> > > +    type: boolean
> > > +    description: Disable the first audio data bit shift in the TDM s=
ettings.
> >
> > This just looks like software policy, since there's no mention in the
> > commit message or description as to what property of the hardware causes
> > this to be required. Can you please explain why this property is needed?
> >
> > You're also missing a vendor prefix.
>=20
> Sorry, I found this feature in the datasheet originally, but after
> deeper investigation, it seems that this feature should be used to
> support i2s dsp mode b instead of being used this way. Note that the
> difference between i2s dsp mode a and b is whether or not to shift the
> audio data by 1 clock cycle.

Are you trying to say that this patch is not needed? I'm not really
sure.

--OIMQ9YJ2fz4azP4P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjUUuQAKCRB4tDGHoIJi
0s+mAP9xrZEuq+pdJoaqDYfIjbY9yCD7iBiC5GCSfYGFAvVblQEAmEnup6FVQQnj
FEOeiYDFL8Lbl43MM89934A9LqjnDww=
=MuBv
-----END PGP SIGNATURE-----

--OIMQ9YJ2fz4azP4P--
