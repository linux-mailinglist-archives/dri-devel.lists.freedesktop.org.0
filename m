Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F07623EA4
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 10:31:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07BB310E6A8;
	Thu, 10 Nov 2022 09:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4264B10E6A3;
 Thu, 10 Nov 2022 09:31:25 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 619335808B1;
 Thu, 10 Nov 2022 04:31:24 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 10 Nov 2022 04:31:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1668072684; x=1668079884; bh=zo574ahzKe
 u9Q28ZxFGvxFgTU3pvWe1Hlis4aMVeXeM=; b=KQ+fTudgcZW84HJJx3pYZjH6tt
 uUQyF2KdNGYGmzcVKLjgNT1FFbuCUeXNgNV7nH4suH3fHjhIiDa8HgZud7+Amwrr
 tPBR8eIF89Nra1y0g8nb6DVDuNr/ymTg1UJPG8rwKa1toduJYYJZy77KwZFcd4AC
 eYH2Plh0zTNErDTBuAZ/oWRi94L9OOh5Wz0iB20ebBlWXXbTAbUw3a85ZQiXPwAp
 42Ni4ltiv2qrPLlgC52lMFp+NyqJIYpPqPj08dwR3bPQnepWVOV7wNQqdwfJjqdh
 mpCpeC50Mie+sGDRqUH/qHzeF7YBJMk/cZ7uP0gWJ7l8lz3EL7atfB5oE0mg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1668072684; x=1668079884; bh=zo574ahzKeu9Q28ZxFGvxFgTU3pv
 We1Hlis4aMVeXeM=; b=GusWAN9JhPa20ia1ZdZ5HcEY2lXQvjg6xUw3qGQINIZn
 DkE5/aHfXGSNTXKhC8azwQLlMqAjKj1+dkh6OeJq6oT0CoZFp9SVIFqT2yn/SUPj
 O14rzuMqfMYxFm8wYzTDQsmAHI2H7iBJ9Vbh6t3wLFnz95c0dSy6eeRTwj7ab7AN
 mH17j225Q2ynprMxAVxkvwG0WFMWfplx9z2gIbHdThgHKpuvMwA/7JrNa1FkOYxG
 2YSAgPUuVitdbimMq8B9Eq6MVI2O7quhKnNvk2ulaSZETvOKZNSJheGqErBL0rRF
 /unRGPariOiO/nz540NT07bvtBqHPeTucJ+AfMfdiQ==
X-ME-Sender: <xms:68RsYyJcgTRmtWb-WtinAgFLtYlPCFF-Reemycwz_8GM48TX8jU7yQ>
 <xme:68RsY6LiKEdqzRptOx6mkQFmHVrypfcPuYhkEKPNKV9PhOmiKxcxZBhKMQOh-Sm9f
 vy9mV4GrbBIiXMAnrg>
X-ME-Received: <xmr:68RsYytjvmh5AhEk6FzoGAKAvoL4O6D6t_-ij2tliUW06tD0Jlqdzxfcxu4awC0icfOT999HhcprzUYvWZxogWcBWmeam_pUWEevFaGsT88lYg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeeggddtgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeevfeehfeekieffgeevleevtefgffefkedtfeeuhfettdegjeehgfegudff
 ffdunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:68RsY3ZHsKBDeMnN6Tq2rfIR2Hkt0nOKAGJdXtmX5BJ49oN6fMHhCg>
 <xmx:68RsY5Y1Tjxlu6fJVCQ6Kb8zOIisXGb0g_mJyy2LA4iDg4H6C6cbUQ>
 <xmx:68RsYzAxoOxTLfO4tVvEFis9rgxU91ju_xMaq0fexnQmMMYRZ86tdA>
 <xmx:7MRsY_6jaWOLDIo0li1lpKavJBZVv1VUqIhq_nB-9bfGOsI4OT8icA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Nov 2022 04:31:22 -0500 (EST)
Date: Thu, 10 Nov 2022 10:31:20 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v7 14/23] drm/modes: Properly generate a drm_display_mode
 from a named mode
Message-ID: <20221110093120.udcpeer5paqbhxzn@houat>
References: <20220728-rpi-analog-tv-properties-v7-0-7072a478c6b3@cerno.tech>
 <20220728-rpi-analog-tv-properties-v7-14-7072a478c6b3@cerno.tech>
 <9e9a8a48-89f2-35d4-b26f-afa7cc44f2f6@tronnes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oex33cdauyqtfxdp"
Content-Disposition: inline
In-Reply-To: <9e9a8a48-89f2-35d4-b26f-afa7cc44f2f6@tronnes.org>
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


--oex33cdauyqtfxdp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 07, 2022 at 06:49:57PM +0100, Noralf Tr=F8nnes wrote:
> Den 07.11.2022 15.16, skrev Maxime Ripard:
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
> > Changes in v7:
> > - Use tv_mode_specified in drm_mode_parse_command_line_for_connector
> >=20
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
> > index dc037f7ceb37..49441cabdd9d 100644
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
> > +		if (!cmd->tv_mode_specified)
> > +			continue;
>=20
> Only a named mode will set cmd->name, so is this check necessary?

Yeah, but (and even though it's not the case at the moment) there's no
implication that a named mode will be about TV. We could use it for
VGA/XGA/etc just as well, in which case we wouldn't have
tv_mode_specified.

Maxime

--oex33cdauyqtfxdp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY2zE6AAKCRDj7w1vZxhR
xa+3AQD3Cls+D1gczkUFXyeSrQvhKBS9sNlty/tRYGKYZr7sZwEAoGi/xB5TzWa4
ZI9NnObyBqJX+FGvepRGg1OcTXOypw0=
=6eNg
-----END PGP SIGNATURE-----

--oex33cdauyqtfxdp--
