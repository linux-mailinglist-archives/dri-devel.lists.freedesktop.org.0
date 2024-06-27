Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA6D91A2B5
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 11:33:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD7A110E1B4;
	Thu, 27 Jun 2024 09:33:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eyGU99Rz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5AB210EA76
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 09:33:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3374660C24;
 Thu, 27 Jun 2024 09:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59961C2BBFC;
 Thu, 27 Jun 2024 09:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719480792;
 bh=RRFrL+J8bhE7m7BCU436iQMZWyX7Gr+S0F7mrYU2u5o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eyGU99RzdVrDe1FAhHf9t7pEtCfIZ+EPr5Q1ZWjPe0JNlBsJ61RLBMmmMu1NoKzm6
 PyCb0hsVRTHd9zzEK23LG2AQ4meIi6rfWRXJYXlrntdEyOI4d6nE7Y4NuUZEQLbsHw
 7dGUzv8mg9giD1srvBdMlGoaNQp1ph2wiDHvgGpEbZL12DqrJj9K1rdTlcn0plQNpv
 hlmZolDLYE05CEfkONilKMji2Pq70h/Jh18JI6XAzDHNW7AnXtBetPWZQIZ9E+p+lJ
 jXAeqo1n77y/WpGXl1JTfs5qZuIL0SD/8hAWsfQGM6ZeYlERzOM2wctJr18T9tpv6H
 ZDpkSL62pyztg==
Date: Thu, 27 Jun 2024 11:33:10 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH RFC 4/5] drm/bridge: connector: add support for HDMI
 codec framework
Message-ID: <20240627-vengeful-glorious-stork-a70480@houat>
References: <20240615-drm-bridge-hdmi-connector-v1-0-d59fc7865ab2@linaro.org>
 <20240615-drm-bridge-hdmi-connector-v1-4-d59fc7865ab2@linaro.org>
 <20240621-polite-ruby-hyrax-c4020e@houat>
 <CAA8EJppryh=LR40_5cBH5+0LZdRP5bsZ9iyqHDBFdBqu_H=1=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="f7enk3sda63umhov"
Content-Disposition: inline
In-Reply-To: <CAA8EJppryh=LR40_5cBH5+0LZdRP5bsZ9iyqHDBFdBqu_H=1=A@mail.gmail.com>
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


--f7enk3sda63umhov
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2024 at 02:10:22PM GMT, Dmitry Baryshkov wrote:
> On Fri, 21 Jun 2024 at 12:30, Maxime Ripard <mripard@kernel.org> wrote:
> >
> > On Sat, Jun 15, 2024 at 08:53:33PM GMT, Dmitry Baryshkov wrote:
> > > Add necessary glue code to be able to use new HDMI codec framework fr=
om
> > > the DRM bridge drivers. The drm_bridge implements a limited set of the
> > > hdmi_codec_ops interface, with the functions accepting both
> > > drm_connector and drm_bridge instead of just a generic void pointer.
> > >
> > > This framework is integrated with the DRM HDMI Connector framework, b=
ut
> > > can also be used for DisplayPort connectors.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  drivers/gpu/drm/drm_bridge_connector.c | 130 +++++++++++++++++++++++=
+++++++++-
> > >  include/drm/drm_bridge.h               |  46 ++++++++++++
> > >  2 files changed, 174 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm=
/drm_bridge_connector.c
> > > index 0869b663f17e..71d6fdc2391f 100644
> > > --- a/drivers/gpu/drm/drm_bridge_connector.c
> > > +++ b/drivers/gpu/drm/drm_bridge_connector.c
> > > @@ -20,6 +20,8 @@
> > >  #include <drm/drm_probe_helper.h>
> > >  #include <drm/display/drm_hdmi_state_helper.h>
> > >
> > > +#include <sound/hdmi-codec.h>
> > > +
> > >  /**
> > >   * DOC: overview
> > >   *
> > > @@ -95,6 +97,14 @@ struct drm_bridge_connector {
> > >        * HDMI connector infrastructure, if any (see &DRM_BRIDGE_OP_HD=
MI).
> > >        */
> > >       struct drm_bridge *bridge_hdmi;
> > > +     /**
> > > +      * @bridge_hdmi_codec:
> > > +      *
> > > +      * The bridge in the chain that implements necessary support fo=
r the
> > > +      * HDMI Audio Codec infrastructure, if any (see
> > > +      * &DRM_BRIDGE_OP_HDMI_CODEC).
> > > +      */
> > > +     struct drm_bridge *bridge_hdmi_codec;
> >
> > Can we have a setup where one bridge would support the video stream and
> > another one the audio?
> >
> > I think for now I'd rather make them both provided by the same bridge,
> > and we can always change that later on if we need to.
>=20
> The same point here (and for your second comment): DisplayPort audio
> support.

Well, yeah, but then we can do the same thing for DisplayPort and share
some code when needed.

And like I said, we can change that later if we need to, but there's no
point in trying to make something super flexible if we're not quite sure
what the requirements are.

Maxime

--f7enk3sda63umhov
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZn0x1QAKCRDj7w1vZxhR
xVJGAQCp2RjFO641IHB+23/Wkr8+mhs/+PlOaAPRI9HS0dwhcwEA17Y3DB2cG1za
4a7vJ4jveja5VWnV4JRHQ7O3zqqaQww=
=809M
-----END PGP SIGNATURE-----

--f7enk3sda63umhov--
