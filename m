Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D9E595DC2
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 15:52:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C5A8ADADE;
	Tue, 16 Aug 2022 13:51:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A849AD948
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 13:51:08 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 419555801CF;
 Tue, 16 Aug 2022 09:51:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 16 Aug 2022 09:51:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1660657868; x=1660665068; bh=yuVLbrrN+N
 1iK12i7DUjM6pGqTkdcihboprTmt6Byjw=; b=odX2548XwGXoGeKNs0MbkWaSSx
 lfpsoLA8A8tZ3+XRhAbG1K21dnqkAYavMxd5ydxZzSSazv9h7PvZWs3oaJqIVzdA
 RfmZLhQ6h0EfZpOr1x+wr6wcBilxBz5VUTfO6oIvSod3iW4DRW9iZAY5JWrBRVWy
 8RbA1h9nm3vFyOx+F+XZ3Oi0Ew0Vp7PsnmwPJmo+2pX+i+6ZJpekDYbdmpGtfVCo
 3VAKjkXEUHf0bOEZYobFiUnvijuSsqOZ7WAeqXo3nvUpCPV8fn3snx0SW0lCtRGR
 3K7tv7ETwiQEhEEeQLinpzolbgJNH5qkXFL+wVcSjhd7ht2J/SWD6yDSAvuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1660657868; x=1660665068; bh=yuVLbrrN+N1iK12i7DUjM6pGqTkd
 cihboprTmt6Byjw=; b=A1Si8qi+Laz5mf39bB95eWK9Z9k4Uwq/ARX10hcF5KoC
 rsCZ4h4myKe7lFZDNiG31Mst8v4bkATp+OYda5/B48kbYWQ2u0KmB9codo9djrHe
 yTOUZjbJZyB8E2j3I25Q+pbwyeqoVuqgfw6Eb/Ta82kHO4XwYxUPaMPA+8XxwcC+
 bTV1VisVVgUolSf0+JPD6hqwLHiiFwPXAG/3ChEFsyvxGYNAfSU1zvmJVn9fuQJm
 kxGz4+rdbVp3wtvdqh8E4B2HCDmNbzxD8l1XRhP9sDDFyjJPZjCwbnP9t0tfssr5
 yfc8ortuZ8OiMn3m0oboGq9/2l0bSlAJDth5K7vXyQ==
X-ME-Sender: <xms:y6D7Yi5dGJhRTsSGZBa9vyukMq9hYKB9U0_RHpfh03QgEetm5byqvg>
 <xme:y6D7Yr4cdbgoEw_0L-SdM11M8wG7DlbMGgv-7R9rQA-mUT5LaO75CFlSi5iBSgWaD
 __y_zatS_jJqtm1Es0>
X-ME-Received: <xmr:y6D7YhdJOPym6auR3F3LbUaT7Gw7xA6ooEFtcT0WCjCINXg2WimtbPEekYY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:y6D7YvI0uY1gs0_NlIylruE9Zs-XXwZlX_P_FEl_My6SPc7HLEwL4A>
 <xmx:y6D7YmK7yKTdmpQmBSGQH2Y4I_GTRd_KRzJGnECTVLhPLnKVUgehWw>
 <xmx:y6D7YgxxEL2lavOAuWvzDdfmduCHGRSf9UhoPNKAuLZ7cRiW3e-2BA>
 <xmx:zKD7Ym6mGad4cGanjPeIgtE-CDNYjoT7Vt1767fMSgxfM1B86VJUWQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 09:51:06 -0400 (EDT)
Date: Tue, 16 Aug 2022 15:51:05 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v1 34/35] drm/modes: Introduce the tv_mode property as a
 command-line option
Message-ID: <20220816135105.goztqjzqqhhigytd@houat>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-34-3d53ae722097@cerno.tech>
 <CAMuHMdXizN9OgXgxwdFc1gpnhZof-SZrCH8PczEiJrtYpB62Ow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oapqvc3fwa7skyps"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXizN9OgXgxwdFc1gpnhZof-SZrCH8PczEiJrtYpB62Ow@mail.gmail.com>
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
Cc: Emma Anholt <emma@anholt.net>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Phil Elwell <phil@raspberrypi.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--oapqvc3fwa7skyps
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 12, 2022 at 03:31:19PM +0200, Geert Uytterhoeven wrote:
> Hi Maxime,
>=20
> On Fri, Jul 29, 2022 at 6:37 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > Our new tv mode option allows to specify the TV mode from a property.
> > However, it can still be useful, for example to avoid any boot time
> > artifact, to set that property directly from the kernel command line.
> >
> > Let's add some code to allow it, and some unit tests to exercise that c=
ode.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> Thanks for your patch!
>=20
> > --- a/drivers/gpu/drm/drm_modes.c
> > +++ b/drivers/gpu/drm/drm_modes.c
> > @@ -1677,6 +1677,80 @@ static int drm_mode_parse_panel_orientation(cons=
t char *delim,
> >         return 0;
> >  }
> >
> > +#define TV_OPTION_EQUAL(value, len, option) \
> > +       ((strlen(option) =3D=3D len) && !strncmp(value, option, len))
> > +
> > +static int drm_mode_parse_tv_mode(const char *delim,
> > +                                 struct drm_cmdline_mode *mode)
> > +{
> > +       const char *value;
> > +       unsigned int len;
> > +
> > +       if (*delim !=3D '=3D')
> > +               return -EINVAL;
> > +
> > +       value =3D delim + 1;
> > +       delim =3D strchr(value, ',');
> > +       if (!delim)
> > +               delim =3D value + strlen(value);
> > +
> > +       len =3D delim - value;
> > +       if (TV_OPTION_EQUAL(value, len, "NTSC-443"))
> > +               mode->tv_mode =3D DRM_MODE_TV_NORM_NTSC_443;
> > +       else if (TV_OPTION_EQUAL(value, len, "NTSC-J"))
> > +               mode->tv_mode =3D DRM_MODE_TV_NORM_NTSC_J;
> > +       else if (TV_OPTION_EQUAL(value, len, "NTSC-M"))
> > +               mode->tv_mode =3D DRM_MODE_TV_NORM_NTSC_M;
>=20
> [...]
>=20
> You already have the array tv_norm_values[] from "[PATCH v1 05/35]
> drm/connector: Add TV standard property". Can't you export that, and
> loop over that array instead?

I'm not sure, the command line doesn't follow the same conventions than
the property names for a number of conventions, but at the same time we
should try to keep it as consistent as possible...

Then again, Jani and Thomas didn't seem too fond about exposing data as
part of the API, so I'm not sure how we could expose that properly.

> > +       else if (TV_OPTION_EQUAL(value, len, "HD480I"))
> > +               mode->tv_mode =3D DRM_MODE_TV_NORM_HD480I;
> > +       else if (TV_OPTION_EQUAL(value, len, "HD480P"))
> > +               mode->tv_mode =3D DRM_MODE_TV_NORM_HD480P;
> > +       else if (TV_OPTION_EQUAL(value, len, "HD576I"))
> > +               mode->tv_mode =3D DRM_MODE_TV_NORM_HD576I;
> > +       else if (TV_OPTION_EQUAL(value, len, "HD576P"))
> > +               mode->tv_mode =3D DRM_MODE_TV_NORM_HD576P;
> > +       else if (TV_OPTION_EQUAL(value, len, "HD720P"))
> > +               mode->tv_mode =3D DRM_MODE_TV_NORM_HD720P;
> > +       else if (TV_OPTION_EQUAL(value, len, "HD1080I"))
> > +               mode->tv_mode =3D DRM_MODE_TV_NORM_HD1080I;
>=20
> The names in tv_norm_values[] use lower-case, while you use upper-case
> here.

Indeed, I'll fix it, thanks!
Maxime

--oapqvc3fwa7skyps
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYvugyAAKCRDj7w1vZxhR
xYVoAQDFAMNuU1dbZgCiVBYUf+Y13tqfHCtlOuPYmSb6Gmh3xgEAgXYxzEcBWNLK
j9bSNzYbE9lp+H3MaLuAPoiaBAXIRQE=
=szbm
-----END PGP SIGNATURE-----

--oapqvc3fwa7skyps--
