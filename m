Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF3F61F46C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 14:34:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E56510E312;
	Mon,  7 Nov 2022 13:34:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA0C10E312;
 Mon,  7 Nov 2022 13:34:32 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 2E60E2B06702;
 Mon,  7 Nov 2022 08:34:27 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 07 Nov 2022 08:34:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1667828066; x=1667835266; bh=euMdwanfMk
 OYDEpc4wB0uixBbNEYF5sJFd9/UJyNdCY=; b=bkw76/u5ZYZbQahAvsPYoo8IQG
 LcHGuGHIXi8HCjhw4OYcAWT30Ol0Wn+jYP1l44qbVRmgLwmDnhosZ3uA6uNjhQjL
 ioJEgtTKYzh1M+2NZq1JoCcj1onDGF0TH5WP7U+0cjtS0kzx+hvVlia8GUf72U0x
 RvMmk31Q77Uivz75wkgFhyZZj7ohYiKbQZ2hREYhZrAck2nWG1zN5Ru1+EVS5g97
 LxqEj6CfzUGm3f65dYFQx/JwcNnpdTNQpi+AWw7niXI7QyVGf6ZY38U7zb6EHj4G
 GBx5vTA5xL45elayXVZ1ZMvRHECSvQwahmDrw23tM/fPWMNrMQsB2AzMrs4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1667828066; x=1667835266; bh=euMdwanfMkOYDEpc4wB0uixBbNEY
 F5sJFd9/UJyNdCY=; b=kid7A/lFEMRYdSlRHUAbP10h3b5B6GqzIFwJ7s6gbB0t
 WpjUg1oMTN9uu/L46ufdrj+GmDdd9IqH4CvLqUeljmmEBdP+YJhMQVxPUCS2BnpI
 v4Ru9CamYJCnCPTr3hMquRyY/NJTD+xAHKkQ2W2WFuBatXgmHRCkSTLKmFSd75/2
 k01ShiWOfm0j3nYPSCuBrawztOfFU2j0A7YozMiucrP1nq/04sJkP45VwqUc5QZW
 ukdMDjH1cPbLpZpr2mHDntcosTrtF9zvvVRlx/Jj+JmdokRLh6qtGk+yhakRF9C7
 8zrz3V0g8NseHrHsKPA6rjSIGYDr71WT7ky/u694rw==
X-ME-Sender: <xms:YQlpYzqUzcKBEZzDOlDuLDr1DtGvw8gQ6k2wBZQG4mY0RJSCFXjmig>
 <xme:YQlpY9pUIt5pX-eq0nd61vIYEpSEv-wNJQ9HDG6RxL-38WBzL56eDiEg6sTkGoL8J
 lrNqgHoGVz4ZpM4DBI>
X-ME-Received: <xmr:YQlpYwNVMqmNz1TWP4KnWosubFEZ-Wv8n0D8GKRH0ewQ4tv7UFVq1Tuer4U-V06PR9eq0ZCrqJr-1jp6BWsgR42ROjxVwck-2o6zob05dYpVBA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdekgdehfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepieehffffvefgiedthfeiieeutdfgffekhfehgfehgfeiuddutdfftdekffeh
 heevnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:YQlpY25QdoDReJ-2Q7rlTZUBzKtioyIRdY2alrAOs5RtHY-uXcXXrQ>
 <xmx:YQlpYy7XTsQ1rEuGWv1PveGlsKDveYqIBrsoZZ4e7mQOpHFCDDCx0g>
 <xmx:YQlpY-iOMy6q641PnxcV3EM-5ZPmsncNh2HiEz8AB4cNLJ4aPLcVbQ>
 <xmx:YglpYxa0h_DI8UuAJa5L-oZODorTkrwsRbenBhcQSAdI8QJ9V2n0aTLaY2g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Nov 2022 08:34:25 -0500 (EST)
Date: Mon, 7 Nov 2022 14:34:23 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v6 14/23] drm/modes: Properly generate a drm_display_mode
 from a named mode
Message-ID: <20221107133423.o344y4cb5zxpyrm4@houat>
References: <20220728-rpi-analog-tv-properties-v6-0-e7792734108f@cerno.tech>
 <20220728-rpi-analog-tv-properties-v6-14-e7792734108f@cerno.tech>
 <0a748a39-a387-5bdb-ffc8-6cc6593b56e7@tronnes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="skctp4fj6rxepcpb"
Content-Disposition: inline
In-Reply-To: <0a748a39-a387-5bdb-ffc8-6cc6593b56e7@tronnes.org>
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
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


--skctp4fj6rxepcpb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 05, 2022 at 06:50:30PM +0100, Noralf Tr=F8nnes wrote:
> Den 26.10.2022 17.33, skrev maxime@cerno.tech:
> > The framework will get the drm_display_mode from the drm_cmdline_mode it
> > got by parsing the video command line argument by calling
> > drm_connector_pick_cmdline_mode().
> >=20
> > The heavy lifting will then be done by the drm_mode_create_from_cmdline=
_mode()
> > function.
> >=20
> > In the case of the named modes though, there's no real code to make that
> > translation and we rely on the drivers to guess which actual display mo=
de
> > we meant.
> >=20
> > Let's modify drm_mode_create_from_cmdline_mode() to properly generate t=
he
> > drm_display_mode we mean when passing a named mode.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >=20
> > ---
> > Changes in v6:
> > - Fix get_modes to return 0 instead of an error code
> > - Rename the tests to follow the DRM test naming convention
> >=20
> > Changes in v5:
> > - Switched to KUNIT_ASSERT_NOT_NULL
> > ---
> >  drivers/gpu/drm/drm_modes.c                     | 34 ++++++++++-
> >  drivers/gpu/drm/tests/drm_client_modeset_test.c | 77 +++++++++++++++++=
+++++++-
> >  2 files changed, 109 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> > index dc037f7ceb37..85aa9898c229 100644
> > --- a/drivers/gpu/drm/drm_modes.c
> > +++ b/drivers/gpu/drm/drm_modes.c
> > @@ -2497,6 +2497,36 @@ bool drm_mode_parse_command_line_for_connector(c=
onst char *mode_option,
> >  }
> >  EXPORT_SYMBOL(drm_mode_parse_command_line_for_connector);
> > =20
> > +static struct drm_display_mode *drm_named_mode(struct drm_device *dev,
> > +					       struct drm_cmdline_mode *cmd)
> > +{
> > +	struct drm_display_mode *mode;
> > +	unsigned int i;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(drm_named_modes); i++) {
> > +		const struct drm_named_mode *named_mode =3D &drm_named_modes[i];
> > +
> > +		if (strcmp(cmd->name, named_mode->name))
> > +			continue;
> > +
> > +		if (!named_mode->tv_mode)
> > +			continue;
> > +
> > +		mode =3D drm_analog_tv_mode(dev,
> > +					  named_mode->tv_mode,
> > +					  named_mode->pixel_clock_khz * 1000,
> > +					  named_mode->xres,
> > +					  named_mode->yres,
> > +					  named_mode->flags & DRM_MODE_FLAG_INTERLACE);
> > +		if (!mode)
> > +			return NULL;
> > +
> > +		return mode;
> > +	}
> > +
> > +	return NULL;
> > +}
> > +
> >  /**
> >   * drm_mode_create_from_cmdline_mode - convert a command line modeline=
 into a DRM display mode
> >   * @dev: DRM device to create the new mode for
> > @@ -2514,7 +2544,9 @@ drm_mode_create_from_cmdline_mode(struct drm_devi=
ce *dev,
> >  	if (cmd->xres =3D=3D 0 || cmd->yres =3D=3D 0)
> >  		return NULL;
> > =20
> > -	if (cmd->cvt)
> > +	if (strlen(cmd->name))
> > +		mode =3D drm_named_mode(dev, cmd);
>=20
> I'm trying to track how this generated mode fits into to it all and
> AFAICS if the connector already supports a mode with the same xres/yres
> as the named mode, the named mode will never be created because of the
> check at the beginning of drm_helper_probe_add_cmdline_mode(). It will
> just mark the existing mode with USERDEF and return.

Yep, you're right

> If the connector doesn't already support a mode with such a resolution
> it will be created, but should we do that? If the driver supported such
> a mode it would certainly already have added it to the mode list,
> wouldn't it? After all it's just 2 variants NTSC and PAL.

I wasn't so sure about this part. I think it's still benefitial because
some users (Geert at least has expressed that need) might want a smaller
mode than 480i/576i, whereas the driver is realistically only going to
register those two.

So creating that mode if it isn't declared seems to have value to some.

> We have this in drm_client_modeset.c:drm_connector_pick_cmdline_mode():
>=20
> 	list_for_each_entry(mode, &connector->modes, head) {
> 		/* Check (optional) mode name first */
> 		if (!strcmp(mode->name, cmdline_mode->name))
> 			return mode;
>=20
> Here it looks like the named mode thing is a way to choose a mode, not
> to add one.
>=20
> I couldn't find any documentation on how named modes is supposed to
> work, have you seen any?

Eh, I guess I'm to blame for that :)

Named modes are really only about the command-line name. The way it was
initially introduced was pretty much to only pass down the name to
drivers for them to figure it out, like we've been doing in sun4i:

https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/sun4i/sun4i_=
tv.c#L292

It wasn't really working, especially because the userspace pretty much
ignores it. One of the point of this series is to create a proper mode
(and state, really) from the name passed on the command line so that
drivers don't have to behave any different from usual, and userspace can
be involved there too.

Maxime

--skctp4fj6rxepcpb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY2kJXwAKCRDj7w1vZxhR
xXK+AQDbZjS2J5WC2ceGRjMPlRP+aZSBzWDC5fwiCGIaR3oGigEA5D4seApvXZv1
QLznHu/XaZfYUQXUOM6K43F6nknfDQI=
=HyxE
-----END PGP SIGNATURE-----

--skctp4fj6rxepcpb--
