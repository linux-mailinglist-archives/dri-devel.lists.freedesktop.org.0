Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF034DDF28
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 17:35:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7506010E035;
	Fri, 18 Mar 2022 16:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF3810E035
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 16:35:54 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 3CEF932003C0;
 Fri, 18 Mar 2022 12:35:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 18 Mar 2022 12:35:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=Lkir1zse4kqeDzUeV3bPm0yeNpW0sGfYaTwEzB
 NrcOI=; b=aXY9sk3erwxTrvmERqB3UPyYTS+vAg6ZAUdx/BBA7r6LqFGh5uQv+X
 zwax3XfwE2Ud2a/nhV5O4tcsqqolvqBlVmyJIu5oft67cn8Vlb8bvIwKCV5D3mnW
 6T0gTvB8icrLNwaMY+C3MjcbPvgihFEchcGBnARiNmIILzRYuqypEXGuJ1numm2U
 Yd8hLo1np+YtYQaXUREE5ToX0ufb0/jXZNTb3fVNYfXwtWi+lC9ATRhg5BdbSiWK
 lStAFDT4dEtkQtZZyLOsoDW7bacJjc7uTozoq4OJuRsDB7Ch4jp7IHxBXbThQHq7
 5TbXG1z7UTb++U6M58ih28v4AvhhBJfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Lkir1zse4kqeDzUeV
 3bPm0yeNpW0sGfYaTwEzBNrcOI=; b=SHpuTAvv9k451GxRACDUEdiaUeVKKyeCW
 cBa6VOhjqdMZim7a5gbn5m9fQFl5TqH+zSStBoD4sP19tmKAsgbFuMkaD9fyYiJx
 CsyucB5NxdmIAPWBRx4f+57VMBuubyf+YEcRnytuLqx0tTDaJqoX7kiQHPkWM7rG
 6q11lTvW+3203LUx5akNj68nl2U55VtS+V+R7xiSKsH0NW1PtitAbr3FPd7Gkkus
 7AWByXqj6xVxtVLsQu/cI1eTASLnLLAt4vadTulQNpjsxkK0/EKwiIlhX75d/gxl
 gNec/VQDnjykAugJKKkoB698N9KWorwV3zNq4KSr714ylfc8X0awg==
X-ME-Sender: <xms:5rQ0Yo-AotLDx9wal34qj57DWFP37SwK6OCZ3V0T-N2wPH83i7havw>
 <xme:5rQ0YgtTe3xuxMqbQgv7vr-Vjvk-ukagYXOefZuld-1WoZBXO0fKAn6Gq-07gPBMO
 cUPjEzM4IR_RN9zsCA>
X-ME-Received: <xmr:5rQ0YuCVotxEPAGTpUOuIt-5yoRC1dvUUrMv_-h4-nMnSB4vpeo8_G9zaiLaWCEQSW02etD6yoj2Tmb0V46kTBdL_AuzrR1_r4Dpas8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudefiedgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepveevfeffudeviedtgeethffhteeuffetfeffvdehvedvheetteehvdelfffg
 jedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:57Q0Yod8RLPLb1rOE0DMFjvnoP6yLazPyoouTCzvIiIg-EPClDF52w>
 <xmx:57Q0YtMTwvZo8XXGFMEOUNt9RXh18kNcI7oiRUa5JtPzUSnCuiBhWg>
 <xmx:57Q0Yimf3C9lVwRDGt4rbKg-z9-9Npn6QyoxljYyj9jM6P9Kmww8ag>
 <xmx:57Q0YuvbwZagz3f4BPHWHIT0_QCb1aUS5MgPHrWQwaU8TK_SrrEhrQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Mar 2022 12:35:50 -0400 (EDT)
Date: Fri, 18 Mar 2022 17:35:49 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Max Krummenacher <max.oss.09@gmail.com>
Subject: Re: [RFC PATCH] drm/panel: simple: panel-dpi: use bus-format to set
 bpc and bus_format
Message-ID: <20220318163549.5a5v3lex4btnnvgb@houat>
References: <20220222084723.14310-1-max.krummenacher@toradex.com>
 <20220223134154.oo7xhf37bgtvm3ai@houat>
 <b5f471f4-0712-b798-efb8-b5b481cdb898@denx.de>
 <CAEHkU3Womyq09Lz62SJohix5JywfKvBRvuWedqF1D7gvb+T2tQ@mail.gmail.com>
 <20220302142142.zroy464l5etide2g@houat>
 <9c9a10ca-e6a1-c310-c0a5-37d4fed6efd6@denx.de>
 <CAEHkU3We_odwtWBXHdcwu+_9yEUo0mudC5sVjr0or0C6nbw+vw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wtrkjvqibu6qw3m4"
Content-Disposition: inline
In-Reply-To: <CAEHkU3We_odwtWBXHdcwu+_9yEUo0mudC5sVjr0or0C6nbw+vw@mail.gmail.com>
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
Cc: Marek Vasut <marex@denx.de>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 DenysDrozdov <denys.drozdov@toradex.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--wtrkjvqibu6qw3m4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 07, 2022 at 04:26:56PM +0100, Max Krummenacher wrote:
> On Wed, Mar 2, 2022 at 5:22 PM Marek Vasut <marex@denx.de> wrote:
> >
> > On 3/2/22 15:21, Maxime Ripard wrote:
> > > Hi,
> >
> > Hi,
> >
> > > Please try to avoid top posting
> Sorry.
>=20
> > >
> > > On Wed, Feb 23, 2022 at 04:25:19PM +0100, Max Krummenacher wrote:
> > >> The goal here is to set the element bus_format in the struct
> > >> panel_desc. This is an enum with the possible values defined in
> > >> include/uapi/linux/media-bus-format.h.
> > >>
> > >> The enum values are not constructed in a way that you could calculate
> > >> the value from color channel width/shift/mapping/whatever. You rather
> > >> would have to check if the combination of color channel
> > >> width/shift/mapping/whatever maps to an existing value and otherwise
> > >> EINVAL out.
> > >>
> > >> I don't see the value in having yet another way of how this
> > >> information can be specified and then having to write a more
> > >> complicated parser which maps the dt data to bus_format.
> > >
> > > Generally speaking, sending an RFC without explicitly stating what you
> > > want a comment on isn't very efficient.
> >
> > Isn't that what RFC stands for -- Request For Comment ?
>=20
> I hoped that the link to the original discussion was enough.
>=20
> panel-simple used to have a finite number of hardcoded panels selected
> by their compatible.
> The following patchsets added a compatible 'panel-dpi' which should
> allow to specify the panel in the device tree with timing etc.
>   https://patchwork.kernel.org/project/dri-devel/patch/20200216181513.281=
09-6-sam@ravnborg.org/
> In the same release cycle part of it got reverted:
>   https://patchwork.kernel.org/project/dri-devel/patch/20200314153047.248=
6-3-sam@ravnborg.org/
> With this it is no longer possible to set bus_format.
>
> The explanation what makes the use of a property "data-mapping" not a
> suitable way in that revert
> is a bit vague.

Indeed, but I can only guess. BGR666 in itself doesn't mean much for
example. Chances are the DPI interface will use a 24 bit bus, so where
is the padding?

I think that's what Sam and Laurent were talking about: there wasn't
enough information encoded in that property to properly describe the
format, hence the revert.

> The RFC revert of the revert
>   https://patchwork.kernel.org/project/dri-devel/patch/20220201110717.358=
5-1-cniedermaier@dh-electronics.com/
> tried to get feedback what would be a way forward. This RFC tries the
> same by giving a possible solution should
> the property name and/or the a bit short strings of the original be
> the reason why it is not suitable.
>=20
> So the requested comments would be about what was not good enough with
> 'data-mapping' and what would be a way forward.
>=20
> Especially since in my limited view it is not clear why in panel-lvds
> 'data-mapping' is used to state how the bits representing colour are
> mapped to the 21 or 28 possible bit position in the LVDS lanes vs.
> here where we want to say how the bits representing colour are mapped
> to the 16/18/24 lines of the parallel interface would need a different
> binding pattern.

There's only a few data format in LVDS, so it's ok. A DPI interface is
much more free-form, so you need to be a bit more accurate than what is
done for LVDS.

Maxime

--wtrkjvqibu6qw3m4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYjS05QAKCRDj7w1vZxhR
xfSvAQD6BoX/ZM1XxmLViA2wxXFC6UTgdG2lltDF7pSrIqNQngEA5uq/6+jaqyjd
KPbDzm34EvO9ki73CwnPA5DucStmgAg=
=giWM
-----END PGP SIGNATURE-----

--wtrkjvqibu6qw3m4--
