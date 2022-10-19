Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CEB603C8A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 10:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F3910F1A0;
	Wed, 19 Oct 2022 08:48:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7747A10F19E;
 Wed, 19 Oct 2022 08:48:37 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 6B4202B066A9;
 Wed, 19 Oct 2022 04:48:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 19 Oct 2022 04:48:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1666169312; x=1666176512; bh=Ym8zZTCcZM
 zDkoxIUNvTcvnh7J9PJfm+nGlRN8I2SxQ=; b=KdU04RhNsUNkm2Ekd02vnAdG07
 tgQJvehh/pQMoaC2BYJaJhqOndgA0RVVs60zjvklb5ud//6MAh+5cEf/3N1ZCTms
 w70cg+INzGALjJjKpj8Q3N+eWAHkdxAQDwTKePnpNWVwDc9fMrq2Kwyept6NgNYi
 LMZAzdvRAsr4EC4UEIDxxUC5def1KJzPo8LDRRdC7nGkysExG0s+2vMVd94rdjtH
 ntzi+f0ogMuhMJ4bAsaTiTa74vGZPiIV7enMqt8VvAcX0l+wAUJ7xbHW7ehELAVW
 FpD/Rqyi+keHr5MKIkKcP/8rZ6tFlnadvyjTwX2lPxpemWdw7UUCBYHt3G0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1666169312; x=1666176512; bh=Ym8zZTCcZMzDkoxIUNvTcvnh7J9P
 Jfm+nGlRN8I2SxQ=; b=oMiOuzOTzEKTCBLSUX9G9jAuJ0oL9iSUbS0lBpkLluDO
 G25DWW7P+vlVfWITSXdNkEtBSEnhkOpnaNoUFtpi/zZz+xIotzCh3TVrqT2FpXZM
 n5Mlbj7qJFM14/mzcVR/8aZkVO60RRhZLIs2fmkaWe+bzxZjacEtcl2trlxT/91Z
 yOF5QuG9hZ485rh/IixlOViOF7eiTRwA93qRKMoxLPlb8VXxt62uFGKrLwBpjsT5
 DtDW96WCgcE4pUVgCFaUgFBMc8jNMlCIjPSovYoNKQp61X71CpvNnTljSfWYeCoX
 1xiPn5gsYzNLl0twj72w+AvbFkPh7ZLwTxhd6mvBIA==
X-ME-Sender: <xms:37lPY10L48qsNQf8cigEXMCh63T-4Qrauz6OrSAwbMkDgJsotu0oQw>
 <xme:37lPY8GAk8Yrn9nhkbcJ0fuH5dvV7lMQxS0XIfF6IqxWqHAAY5NNXE0k22YiesOOe
 3Qw5-oLoV6fr1TbBSA>
X-ME-Received: <xmr:37lPY16Qxxm2kamca44NGJWysw8YaFUYrXRunOl1iLmbqx0K7sdSzvIEEbKO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelgedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejveefheefkeeiffegveelveetgffffeektdefuefhtedtgeejhefggedu
 ffffudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:37lPYy1YOCVMKTWiKtOyaLSIl6-tuTDy6T01UTzY8sXuJv2DDezlig>
 <xmx:37lPY4G99QMwBes8dy5IOJq0uoHoxPvnEURw3tdELseUPQQDOIv5iQ>
 <xmx:37lPYz8ytonyL8GI2KznAKP92qjUaGiEBsAUYid98vJDAQ4KrXlPdw>
 <xmx:4LlPYzmGtI1pqyp6Nsfm5F54pl7efHZUWVsLW-ZfN3r7vgZ88GeH6cYD9uc>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Oct 2022 04:48:30 -0400 (EDT)
Date: Wed, 19 Oct 2022 10:48:28 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v5 12/22] drm/connector: Add a function to lookup a TV
 mode by its name
Message-ID: <20221019084828.muy46td63bkyewxk@houat>
References: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
 <20220728-rpi-analog-tv-properties-v5-12-d841cc64fe4b@cerno.tech>
 <7dcf479c-8ac7-ed47-8587-30268684373c@tronnes.org>
 <20221018093353.pt4vset6o2ldxrbs@houat>
 <e3b98674-5a9e-16f3-4741-ffea43e05cc8@tronnes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="g2rjpzd2ixg3ehrv"
Content-Disposition: inline
In-Reply-To: <e3b98674-5a9e-16f3-4741-ffea43e05cc8@tronnes.org>
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--g2rjpzd2ixg3ehrv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2022 at 02:29:00PM +0200, Noralf Tr=F8nnes wrote:
>=20
>=20
> Den 18.10.2022 11.33, skrev Maxime Ripard:
> > On Mon, Oct 17, 2022 at 12:44:45PM +0200, Noralf Tr=F8nnes wrote:
> >> Den 13.10.2022 15.18, skrev Maxime Ripard:
> >>> As part of the command line parsing rework coming in the next patches,
> >>> we'll need to lookup drm_connector_tv_mode values by their name, alre=
ady
> >>> defined in drm_tv_mode_enum_list.
> >>>
> >>> In order to avoid any code duplication, let's do a function that will
> >>> perform a lookup of a TV mode name and return its value.
> >>>
> >>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >>> ---
> >>>  drivers/gpu/drm/drm_connector.c | 24 ++++++++++++++++++++++++
> >>>  include/drm/drm_connector.h     |  2 ++
> >>>  2 files changed, 26 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_co=
nnector.c
> >>> index 820f4c730b38..30611c616435 100644
> >>> --- a/drivers/gpu/drm/drm_connector.c
> >>> +++ b/drivers/gpu/drm/drm_connector.c
> >>> @@ -991,6 +991,30 @@ static const struct drm_prop_enum_list drm_tv_mo=
de_enum_list[] =3D {
> >>>  };
> >>>  DRM_ENUM_NAME_FN(drm_get_tv_mode_name, drm_tv_mode_enum_list)
> >>> =20
> >>> +/**
> >>> + * drm_get_tv_mode_from_name - Translates a TV mode name into its en=
um value
> >>> + * @name: TV Mode name we want to convert
> >>> + * @len: Length of @name
> >>> + *
> >>> + * Translates @name into an enum drm_connector_tv_mode.
> >>> + *
> >>> + * Returns: the enum value on success, a negative errno otherwise.
> >>> + */
> >>> +int drm_get_tv_mode_from_name(const char *name, size_t len)
> >>
> >> Do we really need to pass in length here? item->name has to always be
> >> NUL terminated otherwise things would break elsewhere, so it shouldn't
> >> be necessary AFAICS.
> >=20
> > The only user so far is the command-line parsing code, and we might very
> > well have an option after the tv_mode, something like
> > 720x480i,tv_mode=3DNTSC,rotate=3D180
> >=20
> > In this case, we won't get a NULL-terminated name.
>
> My point is that item->name will always be NUL terminated so strcmp()
> will never look past that.

Right, but we don't have the guarantee that strlen(item->name) <
strlen(name), and we could thus just access after the end of our name

Maxime

--g2rjpzd2ixg3ehrv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY0+53AAKCRDj7w1vZxhR
xUn4AQD1YdJVV8PGLA4yBe9MrG2aLgZBCDneKyxSLZYf8GnuFgD9Ge0Zu9QrzbOB
RiI/MSBbWywUR77Xoz/dlZ4jRTTDKAc=
=L35j
-----END PGP SIGNATURE-----

--g2rjpzd2ixg3ehrv--
