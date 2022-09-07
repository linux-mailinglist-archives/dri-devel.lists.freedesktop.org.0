Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4D65B03A9
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 14:11:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AAC210E73D;
	Wed,  7 Sep 2022 12:11:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B8B10E73D;
 Wed,  7 Sep 2022 12:11:27 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 11B2E5802B9;
 Wed,  7 Sep 2022 08:11:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 07 Sep 2022 08:11:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1662552687; x=1662559887; bh=zDA579AoIY
 dDNR4aP7II6WOb5N9Vc2GJf+UG4mhMuI8=; b=xh83Sji/S5fGlHvvO0M89p4G7z
 yG9qqosL/cAMPjQTYP5c1hRx1uW8yt0ygT6kAvWkZkOEW1VNLR4R3bqktiOB8J2X
 8rntACPKJHtPlw6gpkg488CmWrvp4PVFIIy0fDtjy7BDQGLMcQeLF4CM1kBNsF3r
 DvKvkwlEqhmyXyF7Njw/mV/MND8XaIeQojBIXmzhrdwNpFiS3MHAbsB1HjCw+luf
 mOhaCose89yP0EzYqLBzlHb5rF68sqojmq7+wuCSuwSTNJLsXxAYzkPkStIyC7lw
 gRSE9ILnQWIeS5E22BNrIKUAEo1pYsDVYfAUxhUvDJHsThVFjnA1ecDQW8wQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1662552687; x=1662559887; bh=zDA579AoIYdDNR4aP7II6WOb5N9V
 c2GJf+UG4mhMuI8=; b=XWKXdivSs5OwDPMC03jM59LWg7OoVGgkfw1rpP4G1+wj
 CvJA+0a/K6XnT1+OfeuMnI17fkt9iogRzJo9+3bs3KsaAE1RqrdjzQ/VZll8Ndo2
 ENsLeYX3OSQTgV/E9UzvY0BFyp8h0Qjw+slxi6pjCz1waqDhOO7cDt2IGQmFUfmY
 rNz/9vsDDHVqxl7Uo6YhDKkqEu3qcNp4UZq2U5QJgYxaU2XDvVDMCsbhwz8JjGWm
 oC6klcFem4SP63dlTJfTio9soptONAMrqJptc5VyKKwuOF025lJrUJ5l4MtLjnaG
 bVl0r5BmThoza/j3xGHDlklJdyhZqQd6xFQ/Xr3qLQ==
X-ME-Sender: <xms:booYY7dJ7yBzajhFMtzryKFMxL-OIGY_JF2pLc-8u8r--HnYDY8IGA>
 <xme:booYYxPpxvCF8ayHSogxvXBBIH3zoIb98cDJBMSWTU7FuAK6YXDOcW7MyoaqFW4NC
 qQ7N7O6OGxU9KXZycY>
X-ME-Received: <xmr:booYY0in_Ih4XWleTLyHUyosOGDjEgIEV34Cp_mENm1sEnF-H7vYMEzVuw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedttddggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:booYY89VIT0sfe1JmDAaiGrD-5W8xJMEW06_9y7sLRI55IOF2lY6Ow>
 <xmx:booYY3tHYdMP2Ikq69ajiY1kRzD__mju6J0w8X_oB-FoJ4bE4XendQ>
 <xmx:booYY7GN7nZ8v7joHwkVmpB0hxr0n1xZXUEnhUYjF5G9lIVhjbvCeA>
 <xmx:b4oYY_dm5jryjGI9aYWnwWzUP3b5YHJM27gV33h2zOrTVnVQ9N-3Vg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Sep 2022 08:11:26 -0400 (EDT)
Date: Wed, 7 Sep 2022 14:11:24 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 09/41] drm/connector: Add TV standard property
Message-ID: <20220907121124.kda7wi33b5cmwhcr@houat>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-9-459522d653a7@cerno.tech>
 <30a9d7cd-d9ff-3177-ac6c-e7c1f966d89a@gmail.com>
 <CAMuHMdU_yfr1ybNM9Dyk6n34Cqv5WJv1wZxQ_ZGJ_T8JCOeB2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zkn4o5drgepunzyl"
Content-Disposition: inline
In-Reply-To: <CAMuHMdU_yfr1ybNM9Dyk6n34Cqv5WJv1wZxQ_ZGJ_T8JCOeB2g@mail.gmail.com>
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
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Phil Elwell <phil@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Ben Skeggs <bskeggs@redhat.com>, linux-sunxi@lists.linux.dev,
 Mateusz Kwiatkowski <kfyatek@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--zkn4o5drgepunzyl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 02, 2022 at 09:35:20AM +0200, Geert Uytterhoeven wrote:
> On Fri, Sep 2, 2022 at 12:00 AM Mateusz Kwiatkowski <kfyatek@gmail.com> w=
rote:
> > W dniu 29.08.2022 o 15:11, Maxime Ripard pisze:
> > > The TV mode property has been around for a while now to select and ge=
t the
> > > current TV mode output on an analog TV connector.
> > >
> > > Despite that property name being generic, its content isn't and has b=
een
> > > driver-specific which makes it hard to build any generic behaviour on=
 top
> > > of it, both in kernel and user-space.
> > >
> > > Let's create a new bitmask tv norm property, that can contain any of =
the
> > > analog TV standards currently supported by kernel drivers. Each drive=
r can
> > > then pass in a bitmask of the modes it supports.
> >
> > This is not a bitmask property anymore, you've just changed it to an en=
um.
> > The commit message is now misleading.
> >
> > > +static const struct drm_prop_enum_list drm_tv_mode_enum_list[] =3D {
> > > +    { DRM_MODE_TV_MODE_NTSC_443, "NTSC-443" },
> > > +    { DRM_MODE_TV_MODE_NTSC_J, "NTSC-J" },
> > > +    { DRM_MODE_TV_MODE_NTSC_M, "NTSC-M" },
> > > +    { DRM_MODE_TV_MODE_PAL_60, "PAL-60" },
> > > +    { DRM_MODE_TV_MODE_PAL_B, "PAL-B" },
> > > +    { DRM_MODE_TV_MODE_PAL_D, "PAL-D" },
> > > +    { DRM_MODE_TV_MODE_PAL_G, "PAL-G" },
> > > +    { DRM_MODE_TV_MODE_PAL_H, "PAL-H" },
> > > +    { DRM_MODE_TV_MODE_PAL_I, "PAL-I" },
> > > +    { DRM_MODE_TV_MODE_PAL_M, "PAL-M" },
> > > +    { DRM_MODE_TV_MODE_PAL_N, "PAL-N" },
> > > +    { DRM_MODE_TV_MODE_PAL_NC, "PAL-Nc" },
> > > +    { DRM_MODE_TV_MODE_SECAM_60, "SECAM-60" },
> > > +    { DRM_MODE_TV_MODE_SECAM_B, "SECAM-B" },
> > > +    { DRM_MODE_TV_MODE_SECAM_D, "SECAM-D" },
> > > +    { DRM_MODE_TV_MODE_SECAM_G, "SECAM-G" },
> > > +    { DRM_MODE_TV_MODE_SECAM_K, "SECAM-K" },
> > > +    { DRM_MODE_TV_MODE_SECAM_K1, "SECAM-K1" },
> > > +    { DRM_MODE_TV_MODE_SECAM_L, "SECAM-L" },
> > > +};
> >
> > I did not comment on it the last time, but this list looks a little bit=
 random.
> >
> > Compared to the standards defined by V4L2, you also define SECAM-60 (a =
good
> > thing to define, because why not), but don't define PAL-B1, PAL-D1, PAL=
-K,
> > SECAM-H, SECAM-LC (whatever that is - probably just another name for SE=
CAM-L,
> > see my comment about PAL-Nc below), or NTSC-M-KR (a Korean variant of N=
TSC).
> >
> > Like I mentioned previously, I'm personally not a fan of including all =
those
> > CCIR/ITU system variants, as they don't mean any difference to the outp=
ut unless
> > there is an RF modulator involved. But I get it that they have already =
been used
> > and regressing probably wouldn't be a very good idea. But in that case =
keeping
> > it consistent with the set of values used by V4L2 would be wise, I thin=
k.
>=20
> Exactly. Anything outputting RGB (e.g. through a SCART or VGA connector)
> doesn't care about the color subcarrier or modulator parts.  Likewise,
> anything outputting CVBS doesn't care about the modulator part.
>=20
> Perhaps "generic" variants of NSTC and PAL/SECAM should be added, which
> would really just mean 525/60 resp. 625/50.
>=20
> Alternatively, the tv_mode field could be split in two parts (either
> two separate fields, or bitwise), to maintain a clear separation between
> lines/fields versus color encoding and RF modulation (with zero for the
> latter meaning a generic version)? That would also keep the door open
> for TV_MODE_405_50, TV_MODE_819_50, TV_MODE_750_50, TV_MODE_750_60, ...

Again, that property is only about color encoding and RF modulation. The
lines numbers and whether it's interlaced or not is encoded in the mode,
not here. So what you suggest is totally doable today.

Maxime

--zkn4o5drgepunzyl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYxiKbAAKCRDj7w1vZxhR
xd9CAP475gMVc9bgPfZRsSpr9ZicWPbCcdtwwB+SIZjyjWZwrgEAipAda0DdLowI
RCIVTz/4+0X5TsSdP1wzG4wph1ePCQY=
=iVLu
-----END PGP SIGNATURE-----

--zkn4o5drgepunzyl--
