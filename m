Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80957454485
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 11:01:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E7D89CBC;
	Wed, 17 Nov 2021 10:01:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF66989CBC
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 10:01:07 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 431BF580558;
 Wed, 17 Nov 2021 05:01:07 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 17 Nov 2021 05:01:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=Z4rc62NXo9sALoDI2kXA+PvCVrE
 DdbeQgnJhg+J93hQ=; b=fdZGAPPHuLrcjbKFoJmhsru+A5BHIjEYVdrUGRo6dCS
 MBc5TiBDcU9j/lUj5BDAkdK3kFUm6L8uBvN5G+3tar5k18LbogiaSVlu9pTzkgim
 jD0f7/VP32nvuuDyJUn/QRx6tpz4iJgCX5Vod0gxzy/pOjxJwN7UfSDK+wxF9tDe
 XcGTgCVcv8166pyegIaxY8Z92zOge+b61OamriKHwQIKd6YZoMHqUlpVSJtP1/y5
 UCxBw9fCKwjdBOyzXEvzUlkEJ4o2VjgUHfPRyHLRe0vL23RQBJpTaSbeN/0uqNBe
 2rW+QIgijT8D4fIduKjA6gbmeVAN6jYdkMkBJViPW6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Z4rc62
 NXo9sALoDI2kXA+PvCVrEDdbeQgnJhg+J93hQ=; b=WvJc5SAqzGihaVtfI1vTqX
 5DHyUzf1gGOXMgG81qrXOiLtBw1EYYlkgceqCMMRPBeudxu7KwLu03xBlFZDW+sJ
 Wj/hPS3417conBlB61vGOLUueo1niC5Ezqfo2+gGvIUq3ncT29/xQhCww3UhMj2r
 bMB9mw/3K7uQ1KKeAfsvqqE0zB0zBNh+/ray/AdM2zQfpDXyNJJ+VDbHuPOFxE/b
 2/FB7y3RdVyRLosM6uQ5N7SimRKyr7ApH8++jR1lkiFFagyHau1bNczgg0Cbc1/z
 xS+o6ZHIHy22Xvafd8Ztf7pUdsJuPntH3tEkqCADLYJwtEYwPNeqPjPrR1Q9FGyg
 ==
X-ME-Sender: <xms:4dKUYbvlYs-fjnnCpLQDrdKd1o0QRJo_DYWA-uYMr4qUb70I287Ppw>
 <xme:4dKUYcfu22EGVC3bsLl3StqHbxLvrzIkgsDXfixTbRFcgXXY98yj1IQGGOWXt1Rt3
 frUwezgdokHOJtQwYs>
X-ME-Received: <xmr:4dKUYezM_-vdJPwmA112RAM6H_DCDB7NeAf6guvjX3pyHnP9O-eiCfEWMXtP_ATe6sZqT5gvv0zSTX3UyQ-hSyUm9hnglMAFiwKqM0GItnc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeggddthecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeduvdduhfekkeehgffftefflefgffdtheffudffgeevteffheeuiedvvdejvdfg
 veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:4dKUYaO0eSSbsEntUHXLjO-3-Dj5a-nlW6YIsg333Do8qlN71oRphw>
 <xmx:4dKUYb8fpPwb5rZrOAKdZsapBqu7GXHCLFox8DhgGPFElVgDoef1Yg>
 <xmx:4dKUYaW6YW2IneBy0MsqJ4W0uKAHTxh8BNvrpnTGixuGssOocmd3wg>
 <xmx:49KUYeXH_xPF0yuCtyFyj7ukBD3VIbrTOk7mObwMMpL87dn3ekHADQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Nov 2021 05:01:05 -0500 (EST)
Date: Wed, 17 Nov 2021 11:01:03 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 02/13] drm/connector: Add helper to check if a mode
 requires scrambling
Message-ID: <20211117100103.xouysycl5lmrescx@gilmour>
References: <20211102145944.259181-1-maxime@cerno.tech>
 <20211102145944.259181-3-maxime@cerno.tech>
 <YYP+MX9gxZVafhKk@intel.com> <YYVxtp9PZiR3ZOjp@phenom.ffwll.local>
 <YYV0bArjRbvYJ2K2@intel.com>
 <20211108155834.6zz236ll75bxwcrk@gilmour>
 <YYlkdHzW4ir07Gtk@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="thlviocxszlf7zcl"
Content-Disposition: inline
In-Reply-To: <YYlkdHzW4ir07Gtk@intel.com>
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
Cc: Emma Anholt <emma@anholt.net>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--thlviocxszlf7zcl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 08, 2021 at 07:55:00PM +0200, Ville Syrj=E4l=E4 wrote:
> On Mon, Nov 08, 2021 at 04:58:34PM +0100, Maxime Ripard wrote:
> > On Fri, Nov 05, 2021 at 08:14:04PM +0200, Ville Syrj=E4l=E4 wrote:
> > > On Fri, Nov 05, 2021 at 07:02:30PM +0100, Daniel Vetter wrote:
> > > > On Thu, Nov 04, 2021 at 05:37:21PM +0200, Ville Syrj=E4l=E4 wrote:
> > > > > On Tue, Nov 02, 2021 at 03:59:33PM +0100, Maxime Ripard wrote:
> > > > > > --- a/include/drm/drm_modes.h
> > > > > > +++ b/include/drm/drm_modes.h
> > > > > > @@ -424,6 +424,21 @@ static inline bool drm_mode_is_stereo(cons=
t struct drm_display_mode *mode)
> > > > > >  	return mode->flags & DRM_MODE_FLAG_3D_MASK;
> > > > > >  }
> > > > > > =20
> > > > > > +/**
> > > > > > + * drm_mode_hdmi_requires_scrambling - Checks if a mode requir=
es HDMI Scrambling
> > > > > > + * @mode: DRM display mode
> > > > > > + *
> > > > > > + * Checks if a given display mode requires the scrambling to b=
e enabled.
> > > > > > + *
> > > > > > + * Returns:
> > > > > > + * A boolean stating whether it's required or not.
> > > > > > + */
> > > > > > +static inline bool
> > > > > > +drm_mode_hdmi_requires_scrambling(const struct drm_display_mod=
e *mode)
> > > > > > +{
> > > > > > +	return mode->clock > DRM_HDMI_14_MAX_TMDS_CLK_KHZ;
> > > > > > +}
> > > > >=20
> > > > > That's only correct for 8bpc. The actual limit is on the TMDS clo=
ck (or
> > > > > rather TMDS character rate as HDMI 2.0 calls it due to the 1/1 vs=
=2E 1/4
> > > > > magic for the actually transmitted TMDS clock).
> > > >=20
> > > > Yeah we might need to add the bus format for the cable here too, to=
 make
> > > > this complete.
> > >=20
> > > I don't think we have a usable thing for that on the drm level, so
> > > would need to invent something. Oh, and the mode->clock vs.=20
> > > mode->crtc_clock funny business also limits the usability of this
> > > approach. So probably just easiest to pass in the the driver calculat=
ed
> > > TMDS clock instead.
> >=20
> > If we look at all (I think?) the existing users of scrambling in KMS as
> > of 5.15, only i915 seems to use crtc_clock (which, in retrospect, seems
> > to be the right thing to do), and only i915 and dw-hdmi use an output
> > format, i915 rolling its own, and dw-hdmi using the mbus formats.
> >=20
> > I think using the mbus format here makes the most sense: i915 already is
> > rolling a whole bunch of other code, and we use the mbus defines for the
> > bridge format enumeration as well which is probably going to have some
> > interaction.
> >=20
> > I'm not quite sure what to do next though. The whole point of that
> > series is to streamline as much as possible the scrambling and TMDS
> > ratio setup to avoid the duplication we already have in the drivers that
> > support it, every one using the mostly-the-same-but-slightly-different
> > logic to configure it.
> >=20
> > The mode is fortunately stored in generic structures so it's easy to
> > make that decision. Having to take into account the output format
> > however makes it mandatory to move the bus format in the
> > drm_connector_state(?) structure too.
>=20
> I think involving state objects and the like is just going to make
> it harder to share code between all drivers, if that is the goal.
> Just a few tiny helpers I think is what would allow the broadest=20
> reuse. I guess you could build additional midlayer on top of those
> for some drivers if you wish.
>=20
> As for the bus_format stuff, that looks at the same time overkill,
> and insufficiently documented. I guess its main purpose is to exactly
> defines how some digtal bus works, which makes sense when you're
> chaining a bunch of random chips together. But looks overly complicated
> to me for defining what to output from a HDMI encoder. Looking at the
> defines I wouldn't even know what to use for HDMI actually. All we
> really want is RGB 4:4:4 vs. YCbCr 4:4:4 vs. YCbCr 4:2:2 vs. YCbCr 4:2:0.
> Beyond that level of detail we don't care how each bit gets transferred
> etc. Hence enum intel_output_format in i915.

I was thinking about this some more, can we leverage struct
hdmi_colorspace for this? Chances are it's already used by any driver
that supports YCbCr output to setup the infoframes.

Maxime

--thlviocxszlf7zcl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYZTS3wAKCRDj7w1vZxhR
xTmyAQD6f7bBcSo7FKPBzGh+09zx0lQRcHlA3U6Ps1zDXHCc0AEAyejjdg07Q99k
DauwTfAn9yIIyOSYSnlh6rWuq4HXsgw=
=gjjc
-----END PGP SIGNATURE-----

--thlviocxszlf7zcl--
