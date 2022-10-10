Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DD95F9E84
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 14:12:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B5610E707;
	Mon, 10 Oct 2022 12:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F3F10E144;
 Mon, 10 Oct 2022 12:11:44 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id D0D1C2B05E7C;
 Mon, 10 Oct 2022 08:11:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 10 Oct 2022 08:11:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1665403899; x=1665411099; bh=DyBqLlTati
 P71v0xssFNP/ZJW4ZM9ga+yL599aLXAGs=; b=JHBNpla2tKyffYFyXKYvT37Nb6
 n49ayggr3uMwlFYI6CsBtbAHTv60YvtehqJw2FvvfXI43IoEX2leHnUCwaw2pB/U
 G/t5XfYE5EKBZQFZd9dj51IDaED/UKOcRd4YlYpc9XK51K6H7B2N3Og1/bpHJ7J+
 VTrymxbhz7fmcMMo7gCS+CKKTYrv2J19G+T8fT+xlgf8UW31XMyQ2e13oQMGm3L8
 yvyzi3e7f9ZNY2z/m1MkgJCpu0lyPoMClopLWrx9LmH0hMfCwk+tzIXXR0RbdhCG
 iVyXkKwznsZyxeQcZjXgTiTb+zHmGvxDnQCaCoCr1taT9aX4PN6JSycmQ7rQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1665403899; x=1665411099; bh=DyBqLlTatiP71v0xssFNP/ZJW4ZM
 9ga+yL599aLXAGs=; b=EWgIqPFfCd5tKKxSo/vFZa07QQpFj12IHOhsbZS4c1zo
 gjW9xV7rpWeuLyEUuFXrnKzZJVwHie0MZoThjH4RqEkA9Fx/eG113evRQMxZNNSs
 rrGX5HBbteM5HqefpX8SSd2yamYaJaN+ELhq9T/+UDtRTynkRowimbY1tJUmNziF
 7SQ5VOhXYrzigolMvzludZXv69w8+HGBp1P1Jjf/N0lXljiE/Y1xAwyH7tkT9Osu
 Hr/2tBRtgPNbvDeZcWiFZLUCP+rst6BA6mi5KEtxBCwWzEF54vWKNIFc+SL9CxJg
 dK5ZHj4rKtvzJ19iL2uTUr0nEgLHH0tIjfHcFK4Bpg==
X-ME-Sender: <xms:-wtEY5GMlkfAIihLh9XjV0WsIlOe72t7RcK6ya_j_w2dio0cPoc5nw>
 <xme:-wtEY-U7BlkWtIg2Q56h0CKvYoPINkbR8aztvjvZRkm_3CHePezmvBnxY7shPujou
 fmhs5z19RUT93ZaQf0>
X-ME-Received: <xmr:-wtEY7KW80VsAHz3cs7kULZsIdCbpR4Etpx_g1pYM4tdjh__Y-0Zrc6v9plF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejgedggeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejveefheefkeeiffegveelveetgffffeektdefuefhtedtgeejhefggedu
 ffffudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:-wtEY_GBFi9a_rc7g_YFxHOPZu_Oht3vx_VLNJqATdCxCwR1D_wcAg>
 <xmx:-wtEY_Wdw0lk3LNhtDK7NVoTu5MGxddipjj1aJWJ16EVtQPVmB_Wxw>
 <xmx:-wtEY6P79rzWTI3XcjQIsWH8Oe7LxU5NwRwsj1s6n0cNWMcUSXgCaA>
 <xmx:-wtEY21b_rE1izp8uZhxbuu2qR7COe-Hg2eXi8Zd-drs10b1u4HXOj9HkCA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Oct 2022 08:11:38 -0400 (EDT)
Date: Mon, 10 Oct 2022 14:11:23 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v4 00/30] drm: Analog TV Improvements
Message-ID: <20221010121123.sn6rxj3iwubn5tkc@houat>
References: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
 <0db1c833-eeee-cadd-b050-837d79a3d691@tronnes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dlolvdd7kvjkjbu5"
Content-Disposition: inline
In-Reply-To: <0db1c833-eeee-cadd-b050-837d79a3d691@tronnes.org>
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


--dlolvdd7kvjkjbu5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 01, 2022 at 03:12:06PM +0200, Noralf Tr=F8nnes wrote:
>=20
>=20
> Den 29.09.2022 18.30, skrev Maxime Ripard:
> > Hi,
> >=20
> > Here's a series aiming at improving the command line named modes suppor=
t,
> > and more importantly how we deal with all the analog TV variants.
> >=20
> > The named modes support were initially introduced to allow to specify t=
he
> > analog TV mode to be used.
> >=20
> > However, this was causing multiple issues:
> >=20
> >   * The mode name parsed on the command line was passed directly to the
> >     driver, which had to figure out which mode it was suppose to match;
> >=20
> >   * Figuring that out wasn't really easy, since the video=3D argument o=
r what
> >     the userspace might not even have a name in the first place, but
> >     instead could have passed a mode with the same timings;
> >=20
> >   * The fallback to matching on the timings was mostly working as long =
as
> >     we were supporting one 525 lines (most likely NSTC) and one 625 lin=
es
> >     (PAL), but couldn't differentiate between two modes with the same
> >     timings (NTSC vs PAL-M vs NSTC-J for example);
> >=20
> >   * There was also some overlap with the tv mode property registered by
> >     drm_mode_create_tv_properties(), but named modes weren't interacting
> >     with that property at all.
> >=20
> >   * Even though that property was generic, its possible values were
> >     specific to each drivers, which made some generic support difficult.
> >=20
> > Thus, I chose to tackle in multiple steps:
> >=20
> >   * A new TV mode property was introduced, with generic values, each dr=
iver
> >     reporting through a bitmask what standard it supports to the usersp=
ace;
> >=20
> >   * This option was added to the command line parsing code to be able to
> >     specify it on the kernel command line, and new atomic_check and res=
et
> >     helpers were created to integrate properly into atomic KMS;
> >=20
> >   * The named mode parsing code is now creating a proper display mode f=
or
> >     the given named mode, and the TV standard will thus be part of the
> >     connector state;
> >=20
> >   * Two drivers were converted and tested for now (vc4 and sun4i), with
> >     some backward compatibility code to translate the old TV mode to the
> >     new TV mode;
> >=20
> > Unit tests were created along the way.
> >=20
> > One can switch from NTSC to PAL now using (on vc4)
> >=20
> > modetest -M vc4  -s 53:720x480i -w 53:'TV mode':1 # NTSC
> > modetest -M vc4  -s 53:720x576i -w 53:'TV mode':4 # PAL
> >=20
> > Let me know what you think,
> > Maxime
> >=20
>=20
> I suggest that you apply the patches that are reviewed, have merrit on
> their own and are not tied to the TV mode property.
> This will help in keeping this rather big patchset focused and ease the
> task for reviewers.
>=20
> The following seems to be in that group:
>=20
>   drm/tests: Order Kunit tests in Makefile
>   drm/atomic-helper: Rename drm_atomic_helper_connector_tv_reset to
> avoid ambiguity
>   drm/connector: Rename subconnector state variable
>   drm/atomic: Add TV subconnector property to get/set_property
>   drm/modes: Only consider bpp and refresh before options
>   drm/modes: parse_cmdline: Add support for named modes containing dashes
>   drm/vc4: vec: Fix definition of PAL-M mode

Yeah, that was my intention with this series, it's done now, thanks for the=
 reminder :)

Maxime

--dlolvdd7kvjkjbu5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY0QL6wAKCRDj7w1vZxhR
xRDnAQCxLDoVhFPZlORYkrlxoTezGu1S3AQmL4/t11gdtxozgQD/WRdupXy8iNif
MB/QIxtk3f/Wt+CP26Ii1CnsJaRGqA0=
=1Yvq
-----END PGP SIGNATURE-----

--dlolvdd7kvjkjbu5--
