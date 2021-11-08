Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8E24498CA
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 16:58:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F1996E1A7;
	Mon,  8 Nov 2021 15:58:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B248A6E1A7
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 15:58:38 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id D491D58079C;
 Mon,  8 Nov 2021 10:58:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 08 Nov 2021 10:58:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=GDGBKLqsXucgJZv4oQj5QE89wMt
 W+wTyGvv0GI+MQ18=; b=cNFW3T8QTDTcwFKSUJTTabtY0ynmIQFuznxeO1WXlFV
 nwtPMasTYLWRFRVlJqyFWfZRrzDJk7w3RtuuB+j4Gq/RYABSOHML+zhivtpTO3Q7
 kW/K9lNHDghyFsz/KUQTpb3/rfWc6GKJ5XFv+SIDxSowgh6xsimRhLXyZaqW8bMd
 tzV+dRUfFTeWA8Lcl3Whsh1PN2sqHauADBzuFw0B5vDZe33z9hVrsvW68GKzjHH7
 /7X1yWRBgRw/wcU71wWmw3UIusw1ia7V0FK5B59IMy8IM3+ietGBZUcXttviUmfs
 v81JI9vciRT3ExjD4OzWnJsIANGD0FwbBMplTlXt5RQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=GDGBKL
 qsXucgJZv4oQj5QE89wMtW+wTyGvv0GI+MQ18=; b=NkeqNIi7j8NIhjl56GOWHP
 jOu7vHwsYsRPOApzDR8DD56iq1wS4MmKa6YMpV18KW+9sm7ApIh3Gj10BFmj0kUP
 oHEkNjv5rEDxQYmkkm9a9Pk/kSWWWkZmVLuMAO+M34iibt6+72e05I8uXFUXH/NJ
 srjJn6hNW6MT7DkHTpgfBorpvS2+OKc1avge2NbiMurjUOiMkDTlQ6IHlseE3hZY
 iVwITwt/S9VYkwvgZK+bUI52HuF4H2EMRPB27UsVcWxaM10wZiZ2bRtbOW6yGrYr
 gHSg5IXLX+IFLvt/mvWiarjSHGpLkBGBuUu0AB6JtvHrnPA+NKRzrfoBChtWLA4A
 ==
X-ME-Sender: <xms:LUmJYUXuRsgqG5Q-UGyYKpYye25-8Bb0ZSoToh2V_LanPdIpo-Hu4g>
 <xme:LUmJYYmN18XSYXuZPtHLfApgACvrCLqhv4Hlu_deuVtReao6w2FO6r38gzDq1Ok-u
 SD1GRmhDIPjb70km2g>
X-ME-Received: <xmr:LUmJYYaxnCWgVUAFhRvHx-SzbmwxUkg8dYt-QsneG8Acfu-j-x6Rj5eTChezj1JuQcXa5lcTEXDrOKYDqCtbYDQxkGfp0yHA0k7ZOoG_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddruddvgdekudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeduvdduhfekkeehgffftefflefgffdtheffudffgeevteffheeuiedvvdejvdfg
 veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:LUmJYTVmoetK1Ep2e8AbUi-HO_HuoMhnsNL8vsV23x23E4Vp85iu-Q>
 <xmx:LUmJYenmq8BkTfW_t_4kkojdCnEQ7DHuYC4ra6a2-m25_x797VkQkA>
 <xmx:LUmJYYdDWegTkDFdMBGrYc-e4q-xKjD5I8X4Awjz3g1gPhrUd0D1yw>
 <xmx:LUmJYZ-evYnevbPchgf_HML44I9PSPX5agZpKUBuPre6hI3YdKF--A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 Nov 2021 10:58:36 -0500 (EST)
Date: Mon, 8 Nov 2021 16:58:34 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 02/13] drm/connector: Add helper to check if a mode
 requires scrambling
Message-ID: <20211108155834.6zz236ll75bxwcrk@gilmour>
References: <20211102145944.259181-1-maxime@cerno.tech>
 <20211102145944.259181-3-maxime@cerno.tech>
 <YYP+MX9gxZVafhKk@intel.com> <YYVxtp9PZiR3ZOjp@phenom.ffwll.local>
 <YYV0bArjRbvYJ2K2@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xgtaknx57htu4h3l"
Content-Disposition: inline
In-Reply-To: <YYV0bArjRbvYJ2K2@intel.com>
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


--xgtaknx57htu4h3l
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 05, 2021 at 08:14:04PM +0200, Ville Syrj=E4l=E4 wrote:
> On Fri, Nov 05, 2021 at 07:02:30PM +0100, Daniel Vetter wrote:
> > On Thu, Nov 04, 2021 at 05:37:21PM +0200, Ville Syrj=E4l=E4 wrote:
> > > On Tue, Nov 02, 2021 at 03:59:33PM +0100, Maxime Ripard wrote:
> > > > --- a/include/drm/drm_modes.h
> > > > +++ b/include/drm/drm_modes.h
> > > > @@ -424,6 +424,21 @@ static inline bool drm_mode_is_stereo(const st=
ruct drm_display_mode *mode)
> > > >  	return mode->flags & DRM_MODE_FLAG_3D_MASK;
> > > >  }
> > > > =20
> > > > +/**
> > > > + * drm_mode_hdmi_requires_scrambling - Checks if a mode requires H=
DMI Scrambling
> > > > + * @mode: DRM display mode
> > > > + *
> > > > + * Checks if a given display mode requires the scrambling to be en=
abled.
> > > > + *
> > > > + * Returns:
> > > > + * A boolean stating whether it's required or not.
> > > > + */
> > > > +static inline bool
> > > > +drm_mode_hdmi_requires_scrambling(const struct drm_display_mode *m=
ode)
> > > > +{
> > > > +	return mode->clock > DRM_HDMI_14_MAX_TMDS_CLK_KHZ;
> > > > +}
> > >=20
> > > That's only correct for 8bpc. The actual limit is on the TMDS clock (=
or
> > > rather TMDS character rate as HDMI 2.0 calls it due to the 1/1 vs. 1/4
> > > magic for the actually transmitted TMDS clock).
> >=20
> > Yeah we might need to add the bus format for the cable here too, to make
> > this complete.
>=20
> I don't think we have a usable thing for that on the drm level, so
> would need to invent something. Oh, and the mode->clock vs.=20
> mode->crtc_clock funny business also limits the usability of this
> approach. So probably just easiest to pass in the the driver calculated
> TMDS clock instead.

If we look at all (I think?) the existing users of scrambling in KMS as
of 5.15, only i915 seems to use crtc_clock (which, in retrospect, seems
to be the right thing to do), and only i915 and dw-hdmi use an output
format, i915 rolling its own, and dw-hdmi using the mbus formats.

I think using the mbus format here makes the most sense: i915 already is
rolling a whole bunch of other code, and we use the mbus defines for the
bridge format enumeration as well which is probably going to have some
interaction.

I'm not quite sure what to do next though. The whole point of that
series is to streamline as much as possible the scrambling and TMDS
ratio setup to avoid the duplication we already have in the drivers that
support it, every one using the mostly-the-same-but-slightly-different
logic to configure it.

The mode is fortunately stored in generic structures so it's easy to
make that decision. Having to take into account the output format
however makes it mandatory to move the bus format in the
drm_connector_state(?) structure too.

It's already in the bridge_state though, so should we take the final
bridge format as the cable format if it's tied to a bridge?

Maxime

--xgtaknx57htu4h3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYYlJKgAKCRDj7w1vZxhR
xdTmAQCYyR6ooj+GVU69Oh06Ug442R0aK7g89ZBZBwxfGLt8SgEA3fw21eNOtPUv
orlcPTbMxfPcjs2s5i12xUsUgWY+vww=
=bsEq
-----END PGP SIGNATURE-----

--xgtaknx57htu4h3l--
