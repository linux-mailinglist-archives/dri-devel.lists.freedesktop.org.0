Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A777595D9E
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 15:47:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C59379BE4B;
	Tue, 16 Aug 2022 13:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CAA4A9276
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 13:46:28 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id CF7A85803B8;
 Tue, 16 Aug 2022 09:46:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 16 Aug 2022 09:46:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1660657587; x=1660664787; bh=gHbL+MytjJ
 sZvOVGVzDN1GM9hKYjC7rxGk40WyTKaIo=; b=g5XU3Y09Fp0m6twECmjiDPgoD8
 SlSF+LAfJbkef44m7fWMWdW6HV2pS8Rl6yMS4aqsH+reDeg0xYhJpkyl06HlSiGS
 NhkqwOPuDcU5X5mmwbKdFkJSLfL3xMUbf1VSrJij1t1lgyNtXf4d3JaAEK1djaHV
 955s/W/wAZCpzb/9Dma0gBHmULtU7/xrZL49O6Sp0gQcze1wdeHTgqmhWEurWo86
 CHU43FOJBFSeXSfJftsTiUJx+aHQm5s1GJSuQYoE43+LVuQnW1WzOkmmGyBSOTmm
 FdcDkO+sLNBuPxXgd1oHCa0Z01GatPcRdW5mlyldKfx9mnTSDbuvYIWrZYwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1660657587; x=1660664787; bh=gHbL+MytjJsZvOVGVzDN1GM9hKYj
 C7rxGk40WyTKaIo=; b=kmAgyWxk9CRWsdlOPMowrQ81I+xu32+X9sXWngkrs64D
 SpOvcWAlxbw4Z7Ks4uXYyMx5fSC0RmtNSYud9WV7FPvtPCdlXlRCwWUXW8mJVN1G
 RmUrd8KXTue9ZVbBDHQXUwylRMHzD4wm0u60mUJ+imY8cTogoOd734xD19lkT/LJ
 KX8tO6ikVBnZSRUERu3BcC7LJ6/Ux9czDptrE4aGzhssG7V3TWFjaeufH9waKDyN
 SeXuuL4AGKV2dr03uawgCjnZL6ltWaXMrMs1StJtc5ATl112Gbz+Hth1PAp4J3pl
 8r+eaBxJ3JQvPIuuyo2otHLpBAhF80CIdzeSgYQiLA==
X-ME-Sender: <xms:s5_7YqzzZQoAWUgz1kfH2ymHepyDm213uAckzgqFSzuMaMENVi6OvA>
 <xme:s5_7YmRk2xhRYIKNBPL4rKPaaDGM-WL0mlsQMugX_AJhMl-ZzxSU2uvV2BgqwcnOJ
 NyWuvY05qtQfyjYOzg>
X-ME-Received: <xmr:s5_7YsXuK-3JVFMmyMVM2XGYJzmQJN3e8iWhTp0eTeEZkQ8npxP1GXZaUoU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedtleekjeeiudefvdfhieffteelhfeivdeliefgieeugffhvdelieffjeei
 geetjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:s5_7YggUuaxFesnjbcsrU2LUladhr5kLaWWzL5KaGVvRylgv9wHsYg>
 <xmx:s5_7YsB7cHZfSR07JuLU_cnuM3OwfsClKgn7QiX8wWN4CQE6hYD60w>
 <xmx:s5_7YhLN-ZJinuVFhhhltyU-kp6lbX_ruN80INBF1QvhJvew5W1rVQ>
 <xmx:s5_7YuxTmg5yDXXc4a6DbirShoBajE24XWu7p0WiFGAumrChOuVWbg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 09:46:26 -0400 (EDT)
Date: Tue, 16 Aug 2022 15:46:24 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v1 09/35] drm/modes: Move named modes parsing to a
 separate function
Message-ID: <20220816134624.cmb5s6i6pkdhu3qj@houat>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-9-3d53ae722097@cerno.tech>
 <CAMuHMdUiMEybnhgxgBXh1Cbv6syVe9iVU=sb17zHM72R8A2Dew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xbotrfh2f6jawwvu"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUiMEybnhgxgBXh1Cbv6syVe9iVU=sb17zHM72R8A2Dew@mail.gmail.com>
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


--xbotrfh2f6jawwvu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 12, 2022 at 03:27:17PM +0200, Geert Uytterhoeven wrote:
> Hi Maxime,
>=20
> On Fri, Jul 29, 2022 at 6:36 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > The current construction of the named mode parsing doesn't allow to ext=
end
> > it easily. Let's move it to a separate function so we can add more
> > parameters and modes.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> Thanks for your patch, which looks similar to my "[PATCH v2 2/5]
> drm/modes: Extract drm_mode_parse_cmdline_named_mode()"
> (https://lore.kernel.org/dri-devel/1371554419ae63cb54c2a377db0c1016fcf200=
bb.1657788997.git.geert@linux-m68k.org
> ;-)

Indeed, I forgot about that one, sorry :/

I think I'd still prefer to have the check for refresh + named mode
outside of the function, since I see them as an "integration" issue, not
a parsing one.

It's not the named mode parsing that fails, but the fact that we both
have a valid refresh and a valid named mode.

>=20
> > --- a/drivers/gpu/drm/drm_modes.c
> > +++ b/drivers/gpu/drm/drm_modes.c
> > @@ -1773,6 +1773,28 @@ static const char * const drm_named_modes_whitel=
ist[] =3D {
> >         "PAL",
> >  };
> >
> > +static bool drm_mode_parse_cmdline_named_mode(const char *name,
> > +                                             unsigned int name_end,
> > +                                             struct drm_cmdline_mode *=
cmdline_mode)
> > +{
> > +       unsigned int i;
> > +
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
> > +               return true;
> > +       }
> > +
> > +       return false;
>=20
> What's the point in returning a value, if it is never checked?
> Just make this function return void?

Yeah, it's something I went back and forth to between the dev, and it's
an artifact.

I'll drop that patch, take your version and move the refresh check to
drm_mode_parse_command_line_for_connector if that's alright for you?

Maxime

--xbotrfh2f6jawwvu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYvufsAAKCRDj7w1vZxhR
xRvYAP9DR7LzVwd0ITVjjsOrO+BQ9andM/0A4P6qCsx/ywFipQEA+bV9F+NyoFUN
oNXdDnnG7g+hOqMsx28nmzB45wcO6w0=
=uJzR
-----END PGP SIGNATURE-----

--xbotrfh2f6jawwvu--
