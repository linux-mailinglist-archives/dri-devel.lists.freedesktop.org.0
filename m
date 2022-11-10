Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59214623FF9
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 11:36:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D1110E6C2;
	Thu, 10 Nov 2022 10:36:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5235610E6C2;
 Thu, 10 Nov 2022 10:36:43 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 825145801D6;
 Thu, 10 Nov 2022 05:36:41 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 10 Nov 2022 05:36:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1668076601; x=1668083801; bh=nBoJDFkJJq
 zsBQfR1N/+xj7J+//0xyFLrenyQ7PXUlg=; b=oS3gBOWS2Jkxc08ZKEglsrYDk5
 cKoSW3lOwR6hOscSLcWtdwQdkOlP/wOOKMY+spb9ZfuuQxsfXbQ1HhSN79htTXhd
 gS97dwGs07oLsfaMhUFMz7aVgBhFe1+uifQi5lXcJcJPFGnTO5J/JoKOqR87PvLo
 50emMP6yDTes462ANMJ+jEROiS06NdWYY+3+70hms29SUSidQ+ppw5e8MmI8K7bH
 MyTi3ywT0GYM7EdM5ErS2y5ME132kO3OiU22dmLY6kKpcO2BUxuO0PcnMw8gehxJ
 h3MTY+oFW4kFlpGpP0EIGlJL/o4pUFMmGjTBJElA2g2gdpclJ9IYHyWZZCUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1668076601; x=1668083801; bh=nBoJDFkJJqzsBQfR1N/+xj7J+//0
 xyFLrenyQ7PXUlg=; b=HApQSeuYUcYuSJ5s8TN27XYvDD3b8GZIL/aFBgp9/frU
 PLhgMsdr02IUSU519noG8jNCnvfSoaM7OMQcFD2X83pKnQtCYz16GdWF1BGCVtow
 JIdleYVFscWIjOad1aPMUUC84Nq0z+lIqehuim76Nz6g6c0xtbDPF5DDVfSpZ9x1
 PZ2751Lz+PxzSln/cqRQjQ40TZAbfqLiwGDKYcYesmDuVX6OTzmtZsqbv3qT6vTt
 NrGTvMQ9cvL3maIfr/HQpL3ArYL2ULFi00QfSr2oIb979KPqXWDTNgTpbDgwPBtL
 5haKOaiVhWZM2LfUzJ8VvtpjM2Dkdn9AFU6GIh99qw==
X-ME-Sender: <xms:ONRsY_eJtZFzx-Nz7276dwsiuVyMAlDW7p8a3v1KrTWLazd0m7cVKA>
 <xme:ONRsY1PE6c2FKT89ERYgqpRBuIYe51wPO5rgXq5ko-BrZvnPr0JmIuEeyFHxFyvbx
 vt_mOrpsnSpjBm9_i8>
X-ME-Received: <xmr:ONRsY4iBz6D4m6IRMrixdAQC397qCye1w9VSqZyfA8iVYVKm7dmImFl1jqqBkIOp5rxf7dAWposWqH1KC8FdaZMapboDg2HMgbi8HWYxHirLKA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeeggddujecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeevfeehfeekieffgeevleevtefgffefkedtfeeuhfettdegjeehgfegudff
 ffdunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ONRsYw_D_YTVxteD8Lb3YrJ7VwdVKQ3TFJpbpqxq-NOpe1SQZE4s1g>
 <xmx:ONRsY7tLY61OyW8sGbGg0QtQF4A8ELk41e1KjztvpSV5iGMyj-bl7A>
 <xmx:ONRsY_Hcm4R050ci6hMzwKlvzRkYRYEHr2i4pSLaRxjtVJPxYVIvLQ>
 <xmx:OdRsY9MuQDK0TzCBdeZlntmdJgeqWP-Ddzhb7k8-vZXhPgQSWVVZhw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Nov 2022 05:36:40 -0500 (EST)
Date: Thu, 10 Nov 2022 11:36:38 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v7 14/23] drm/modes: Properly generate a drm_display_mode
 from a named mode
Message-ID: <20221110103638.o3bomslhvb2sj43d@houat>
References: <20220728-rpi-analog-tv-properties-v7-0-7072a478c6b3@cerno.tech>
 <20220728-rpi-analog-tv-properties-v7-14-7072a478c6b3@cerno.tech>
 <9e9a8a48-89f2-35d4-b26f-afa7cc44f2f6@tronnes.org>
 <85a607b4-2645-68c7-0898-08f7c6d064b9@tronnes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5srbqddj7e3dz2xw"
Content-Disposition: inline
In-Reply-To: <85a607b4-2645-68c7-0898-08f7c6d064b9@tronnes.org>
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


--5srbqddj7e3dz2xw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 08, 2022 at 10:40:07AM +0100, Noralf Tr=F8nnes wrote:
>=20
>=20
> Den 07.11.2022 18.49, skrev Noralf Tr=F8nnes:
> >=20
> >=20
> > Den 07.11.2022 15.16, skrev Maxime Ripard:
> >> The framework will get the drm_display_mode from the drm_cmdline_mode =
it
> >> got by parsing the video command line argument by calling
> >> drm_connector_pick_cmdline_mode().
> >>
> >> The heavy lifting will then be done by the drm_mode_create_from_cmdlin=
e_mode()
> >> function.
> >>
> >> In the case of the named modes though, there's no real code to make th=
at
> >> translation and we rely on the drivers to guess which actual display m=
ode
> >> we meant.
> >>
> >> Let's modify drm_mode_create_from_cmdline_mode() to properly generate =
the
> >> drm_display_mode we mean when passing a named mode.
> >>
> >> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >>
> >> ---
> >> Changes in v7:
> >> - Use tv_mode_specified in drm_mode_parse_command_line_for_connector
> >>
> >> Changes in v6:
> >> - Fix get_modes to return 0 instead of an error code
> >> - Rename the tests to follow the DRM test naming convention
> >>
> >> Changes in v5:
> >> - Switched to KUNIT_ASSERT_NOT_NULL
> >> ---
> >>  drivers/gpu/drm/drm_modes.c                     | 34 ++++++++++-
> >>  drivers/gpu/drm/tests/drm_client_modeset_test.c | 77 ++++++++++++++++=
++++++++-
> >>  2 files changed, 109 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> >> index dc037f7ceb37..49441cabdd9d 100644
> >> --- a/drivers/gpu/drm/drm_modes.c
> >> +++ b/drivers/gpu/drm/drm_modes.c
> >> @@ -2497,6 +2497,36 @@ bool drm_mode_parse_command_line_for_connector(=
const char *mode_option,
> >>  }
> >>  EXPORT_SYMBOL(drm_mode_parse_command_line_for_connector);
> >> =20
> >> +static struct drm_display_mode *drm_named_mode(struct drm_device *dev,
> >> +					       struct drm_cmdline_mode *cmd)
> >> +{
> >> +	struct drm_display_mode *mode;
> >> +	unsigned int i;
> >> +
> >> +	for (i =3D 0; i < ARRAY_SIZE(drm_named_modes); i++) {
> >> +		const struct drm_named_mode *named_mode =3D &drm_named_modes[i];
> >> +
> >> +		if (strcmp(cmd->name, named_mode->name))
> >> +			continue;
> >> +
> >> +		if (!cmd->tv_mode_specified)
> >> +			continue;
> >=20
> > Only a named mode will set cmd->name, so is this check necessary?
> >=20
> >> +
> >> +		mode =3D drm_analog_tv_mode(dev,
> >> +					  named_mode->tv_mode,
> >> +					  named_mode->pixel_clock_khz * 1000,
> >> +					  named_mode->xres,
> >> +					  named_mode->yres,
> >> +					  named_mode->flags & DRM_MODE_FLAG_INTERLACE);
> >> +		if (!mode)
> >> +			return NULL;
> >> +
> >> +		return mode;
> >=20
> > You can just return the result from drm_analog_tv_mode() directly.
> >=20
> > With those considered:
> >=20
> > Reviewed-by: Noralf Tr=F8nnes <noralf@tronnes.org>
> >=20
>=20
> I forgot one thing, shouldn't the named mode test in
> drm_connector_pick_cmdline_mode() be removed now that we have proper mode=
s?

Good catch, I've fixed it

Thanks!
Maxime

--5srbqddj7e3dz2xw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY2zUNgAKCRDj7w1vZxhR
xc5tAQDufFWQT96Lb6iVY5J8Lt2HGBq1P51c1tAQgPlz+FoRAQD+K3ZwbAaLO5em
tFADsUq+cdoZA5xWmbM0RCAIK2hDkg4=
=cS0b
-----END PGP SIGNATURE-----

--5srbqddj7e3dz2xw--
