Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C06822EC8
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 14:43:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A622710E2B6;
	Wed,  3 Jan 2024 13:42:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 595 seconds by postgrey-1.36 at gabe;
 Wed, 03 Jan 2024 13:42:57 UTC
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E5010E0B9;
 Wed,  3 Jan 2024 13:42:57 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id BEC715808A1;
 Wed,  3 Jan 2024 08:32:59 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 03 Jan 2024 08:32:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm2; t=1704288779; x=1704295979; bh=lSNz+cag97
 6BVkFJyl4rbDI/K8SwKymldw/ZNdyJeoI=; b=n66XsJIiq4xTHK1giEc049QD3i
 THuYcfi+cG6Yq92F7dvg2WTsHfLkRSBqaJwMDiwSaTUh6PQcDIe5af7HlDtjPv/U
 nnP3sCPql8lxFWQRdyLlJ/IpY7a+9XO7H6iFNiETedX0UIzuGwlIehMwrBeLAYY7
 In775MWHpeNFNnrICeOgTk+D3eOJor78ddWpWb8yELehvgpQ3rAvNtB56SqOwfRR
 Pe39/AhfG9KdgDbyrTYHRYSc3m97U/sxceAZVn1+5JiNm9lN9C0VXfQnlZq3VlH7
 33au69hk57uiwqOvOOg2e42NfSX3z7WEzNOCb1/PbgGnLkNRRu1eQK/TNg2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1704288779; x=1704295979; bh=lSNz+cag976BVkFJyl4rbDI/K8Sw
 Kymldw/ZNdyJeoI=; b=hqCSeiUhxPeMTGFrfndPMouRqMISwT4NPpAXGs9eqdJz
 X6jd3CHs4ZOs7zOj3sSE2ERHMcPiS5U6bYtIyY5ursHK4NxgwhW0eHTC9MemO7MB
 7lzQ3tsiEgfF1XhQ2pE5aI7qSHGqrP3StOuuCjbU4dvTBBo8vdsdh+38P2pmi3LY
 MdCd6JSHxH4xHPnIsv/nNZnf8k4diM/F3LsLyvT6TcyIbeDS2+jp0mLpVs4ylmB1
 RNFWDdQMqCR3HxjqtTdWp5VoJOerj9WaleTB30/WQmX5jcUoL8f8IPVNWNopWOD4
 LO5jgNcHH4E7Bn7G8clDZjCcQrkITGdqbk6UCPoqmg==
X-ME-Sender: <xms:CmKVZfyC9BXFuiY3eQkUq4MlEjGVh0m71bLfhZlMGg9lQFdGw7zQhw>
 <xme:CmKVZXRJEJcVmxvfu3uxL1gx69ff2JvAOo2NoDZHy9tDSIOjzLjjcVFENiqAc4Euw
 61Jrdof5uAMCqCjIGA>
X-ME-Received: <xmr:CmKVZZXWPTr8WFS116I12QAAw-ALohPRk4xr4kMScWzNnxR7TZtXJsI-TNvOGf8Zq8oIJ6h_p2E5t83tbTRCPw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdeghedgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtsfertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeefjeeiueeiheevtddvgfeluedufeeigeeijefhveelfeevueefieehuefg
 ffetteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:CmKVZZinXadbR7dbScyh4QbX8HmWpfqiOUtQHQzOFJxKPY5FWN7oqQ>
 <xmx:CmKVZRCw1vMihxG5ec8dfPeBOkhDW5pqzsgLS92A9vup52H7Ja8D2g>
 <xmx:CmKVZSLzPWS_lEGqJwebo8OwzwX7iyl1FEWMBcmuNP6u7Gzevb3d0g>
 <xmx:C2KVZYbZYO12tFTq-6EXplNHVlujmqlUzlw4XG3SvfBhlndSszR23Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jan 2024 08:32:57 -0500 (EST)
Date: Wed, 3 Jan 2024 14:32:55 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v9 09/25] drm/modes: Move named modes parsing to a
 separate function
Message-ID: <z5mywwtyboycdoqhayfuqjobr53jajgaft5ikfdkt77tnm7bhg@d4gjmlqpnnrt>
References: <20220728-rpi-analog-tv-properties-v9-0-24b168e5bcd5@cerno.tech>
 <20220728-rpi-analog-tv-properties-v9-9-24b168e5bcd5@cerno.tech>
 <CAPY8ntD4oz9A1H7Ek1YSLRicLprz1ev5YeAqP2Ah=DMPk84KRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bbzmiqvrip6kri3q"
Content-Disposition: inline
In-Reply-To: <CAPY8ntD4oz9A1H7Ek1YSLRicLprz1ev5YeAqP2Ah=DMPk84KRQ@mail.gmail.com>
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
 Phil Elwell <phil@raspberrypi.com>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--bbzmiqvrip6kri3q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Happy new year :)

On Tue, Jan 02, 2024 at 03:12:26PM +0000, Dave Stevenson wrote:
> Hi Maxime
>=20
> On Mon, 14 Nov 2022 at 13:00, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > The current construction of the named mode parsing doesn't allow to ext=
end
> > it easily. Let's move it to a separate function so we can add more
> > parameters and modes.
> >
> > In order for the tests to still pass, some extra checks are needed, so
> > it's not a 1:1 move.
> >
> > Reviewed-by: Noralf Tr=F8nnes <noralf@tronnes.org>
> > Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >
> > ---
> > Changes in v7:
> > - Add Noralf Reviewed-by
> >
> > Changes in v6:
> > - Simplify the test for connection status extras
> > - Simplify the code path to call drm_mode_parse_cmdline_named_mode
> >
> > Changes in v4:
> > - Fold down all the named mode patches that were split into a single
> >   patch again to maintain bisectability
> > ---
> >  drivers/gpu/drm/drm_modes.c | 70 +++++++++++++++++++++++++++++++++++++=
--------
> >  1 file changed, 58 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> > index 71c050c3ee6b..37542612912b 100644
> > --- a/drivers/gpu/drm/drm_modes.c
> > +++ b/drivers/gpu/drm/drm_modes.c
> > @@ -2229,6 +2229,51 @@ static const char * const drm_named_modes_whitel=
ist[] =3D {
> >         "PAL",
> >  };
> >
> > +static int drm_mode_parse_cmdline_named_mode(const char *name,
> > +                                            unsigned int name_end,
> > +                                            struct drm_cmdline_mode *c=
mdline_mode)
> > +{
> > +       unsigned int i;
> > +
> > +       if (!name_end)
> > +               return 0;
> > +
> > +       /* If the name starts with a digit, it's not a named mode */
> > +       if (isdigit(name[0]))
> > +               return 0;
> > +
> > +       /*
> > +        * If there's an equal sign in the name, the command-line
> > +        * contains only an option and no mode.
> > +        */
> > +       if (strnchr(name, name_end, '=3D'))
> > +               return 0;
> > +
> > +       /* The connection status extras can be set without a mode. */
> > +       if (name_end =3D=3D 1 &&
> > +           (name[0] =3D=3D 'd' || name[0] =3D=3D 'D' || name[0] =3D=3D=
 'e'))
> > +               return 0;
> > +
> > +       /*
> > +        * We're sure we're a named mode at this point, iterate over the
> > +        * list of modes we're aware of.
> > +        */
> > +       for (i =3D 0; i < ARRAY_SIZE(drm_named_modes_whitelist); i++) {
> > +               int ret;
> > +
> > +               ret =3D str_has_prefix(name, drm_named_modes_whitelist[=
i]);
> > +               if (ret !=3D name_end)
> > +                       continue;
> > +
> > +               strcpy(cmdline_mode->name, drm_named_modes_whitelist[i]=
);
> > +               cmdline_mode->specified =3D true;
> > +
> > +               return 1;
> > +       }
> > +
> > +       return -EINVAL;
> > +}
> > +
> >  /**
> >   * drm_mode_parse_command_line_for_connector - parse command line mode=
line for connector
> >   * @mode_option: optional per connector mode option
> > @@ -2265,7 +2310,7 @@ bool drm_mode_parse_command_line_for_connector(co=
nst char *mode_option,
> >         const char *bpp_ptr =3D NULL, *refresh_ptr =3D NULL, *extra_ptr=
 =3D NULL;
> >         const char *options_ptr =3D NULL;
> >         char *bpp_end_ptr =3D NULL, *refresh_end_ptr =3D NULL;
> > -       int i, len, ret;
> > +       int len, ret;
> >
> >         memset(mode, 0, sizeof(*mode));
> >         mode->panel_orientation =3D DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
> > @@ -2306,18 +2351,19 @@ bool drm_mode_parse_command_line_for_connector(=
const char *mode_option,
> >                 parse_extras =3D true;
> >         }
> >
> > -       /* First check for a named mode */
> > -       for (i =3D 0; i < ARRAY_SIZE(drm_named_modes_whitelist); i++) {
> > -               ret =3D str_has_prefix(name, drm_named_modes_whitelist[=
i]);
> > -               if (ret =3D=3D mode_end) {
> > -                       if (refresh_ptr)
> > -                               return false; /* named + refresh is inv=
alid */
> > +       if (!mode_end)
> > +               return false;
>=20
> I'm chasing down a change in behaviour between 6.1 and 6.6, and this
> patch seems to be at least part of the cause.
>=20
> Since [1] we've had the emulated framebuffer on Pi being 16bpp to save
> memory. All good.
>=20
> It used to be possible to use "video=3DHDMI-A-1:-32" on the kernel
> command line to set it back to 32bpp.
>=20
> After this patch that is no longer possible. "mode_end =3D bpp_off", and
> "bpp_off =3D bpp_ptr - name", so with bpp_ptr =3D name we get mode_end
> being 0. That fails this conditional.
> drm_mode_parse_cmdline_named_mode already aborts early but with no
> error if name_end / mode_end is 0, so this "if" clause seems
> redundant, and is a change in behaviour.
>=20
> We do then get a second parsing failure due to the check if (bpp_ptr
> || refresh_ptr) at [2].
> Prior to this patch my video=3D line would get mode->specified set via
> "if (ret =3D=3D mode_end)" removed above, as ret =3D mode_end =3D 0. We
> therefore didn't evaluate the conditional that now fails.
>=20
> So I guess my question is whether my command line is valid or not, and
> therefore is this a regression?

It's a mess :)

Documentation/fb/modedb.rst defines the video parameter syntax as:

<xres>x<yres>[M][R][-<bpp>][@<refresh>][i][m][eDd]

And thus mandates the x and y resolution. I guess that's what I use as a
base, and thus -bpp alone would be invalid.

But then it contradicts itself some time later by documenting that
video=3DHDMI-1:D is ok.

I guess what you experienced was just an oversight: it was not
documented anywhere that it was valid, so we didn't really tested it
either. We should add a unit test for it and fix it.

Maxime

--bbzmiqvrip6kri3q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZZViBgAKCRDj7w1vZxhR
xTYWAQCUb3KaVDhAS7wxuMsRwXkOqvxhOGKP81OSxe57kENIDwD/dIdm/nF8XPS2
0G7NiyX5FLRK+nfDL3J+gTzL8SuKEQY=
=OUKf
-----END PGP SIGNATURE-----

--bbzmiqvrip6kri3q--
