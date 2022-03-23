Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55ABF4E55CB
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 16:58:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6414110E733;
	Wed, 23 Mar 2022 15:58:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E5010E733
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 15:58:21 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 44AEE3201DB9;
 Wed, 23 Mar 2022 11:58:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 23 Mar 2022 11:58:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=dwi9X2Xm2WeckTStHnk4GJWLq9tynSwb7GGqOE
 4Tk10=; b=iezCiuRZP4pEhXiDQd/oxlAUn+ec32LM4DopXZ2GB1SaZa9i8rOD7I
 iLTA9HJkT0T+B7+OkUegeeyiv8XborC7mUT+a2Kw5BIKUW34wOk/HdfrwQUGDYBY
 5H7CGxXwoNmG889dg/wMPifS0g4pQzAbtAFch3Tto+gL933QfZLcdm4CGHySvr8e
 wFBPMkmvmaA7Hs9aTPtROWAVeI+r1IFHk8T8CaPDmAPYkPrjMme+LPIlGnCf2hSW
 J7erwTkBE3SEKdEHwpi5KG3Wv+2wFtl8OE6EfAw2q8nDEqBOEHnCWYMErCSYurEj
 yezVhwP9O1nGAOARMKzw2hHknQsWc1rw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=dwi9X2Xm2WeckTStH
 nk4GJWLq9tynSwb7GGqOE4Tk10=; b=WjUAgr+rOoT5S1yHopnzGglVfz9l3EGAa
 MC3GeVSItAhCNQhdwucAYOlYdynExDWLFC2+3j5hV0GrysahgTWypdxleO7gfjmm
 +rcTy0GgP1IDNrgjOYqTHJXeUlow+0G6PYwiH30tg4grNxb1RtaNlMdhDXhiXtxO
 DRc063Vrldv2X4YLReWA4jB4cxJ9LXZb/xNlb67Gc3RRiSFlV0mf0XwDGV7PLztZ
 hdl0dbSnjvhyDF7nNwnyYW+BiKsCHKK/GxGR93KT02TnpKzXmfXjXqVt8CuTUubn
 3BnVeS0K1jcc/56W2ZV3L5p8FV/s9NYFMbz7wlSKkXBFgvLluSyWw==
X-ME-Sender: <xms:mkM7YhKAEkYA7SQwPsd3Syt4PPvmbZv-eohpOXfEKT7PiulClekcFA>
 <xme:mkM7YtLPfmlEzggDNYmqxVxuTbWlv8DQts7f9ymLGg5SzbIzf2iay2zfANX16g4GL
 qxweccUFmLJgFMkGns>
X-ME-Received: <xmr:mkM7YpuArYKxf8p8im0J8IdaHA8xl7oxNG5Zwh8nEXYgN8viIn9O9Sm8N9Dx_yMfV6Kk68sZBmPPRax-MEZzjDDLmBzjkjMFCm5nySA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudegjedgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepveevfeffudeviedtgeethffhteeuffetfeffvdehvedvheetteehvdelfffg
 jedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:mkM7YiZwMsM4xrvJ1M3jssaUuECDC_dSuriIG_zzPD3OcJCEWlYcVw>
 <xmx:mkM7YoaohwArYqB2djJvSecpTmAFCd9xF_dB8kl4D-PP1lYymzafZA>
 <xmx:mkM7YmDBmStH1HaaJEADod8zkZrcRrN1ypcbROSeOHSeZS22iRhyEw>
 <xmx:m0M7Yor5HBUmReREEYHbZjDq_swj2uBCR9xUjhtMlym21mDdTbPi8w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Mar 2022 11:58:18 -0400 (EDT)
Date: Wed, 23 Mar 2022 16:58:17 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: max.krummenacher@gmx.de
Subject: Re: [RFC PATCH] drm/panel: simple: panel-dpi: use bus-format to set
 bpc and bus_format
Message-ID: <20220323155817.xcsqxothziot7ba3@houat>
References: <b5f471f4-0712-b798-efb8-b5b481cdb898@denx.de>
 <CAEHkU3Womyq09Lz62SJohix5JywfKvBRvuWedqF1D7gvb+T2tQ@mail.gmail.com>
 <20220302142142.zroy464l5etide2g@houat>
 <9c9a10ca-e6a1-c310-c0a5-37d4fed6efd6@denx.de>
 <CAEHkU3We_odwtWBXHdcwu+_9yEUo0mudC5sVjr0or0C6nbw+vw@mail.gmail.com>
 <20220318163549.5a5v3lex4btnnvgb@houat>
 <CAPY8ntDgWwXyWXDWVouzhdC2wsyjbRgfrvWGU=MRG_2sAquHyQ@mail.gmail.com>
 <20220318171642.y72eqf5qbmuu2ln2@houat>
 <CAPY8ntAjnmAyr=6sdAJWbmiEODHM3=Q3c5UnBCTNgyZqBsWBzQ@mail.gmail.com>
 <5ae44b7cd1f7577c98f316a7d288aa4cf423da2d.camel@active.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oto3uixman4x7lhu"
Content-Disposition: inline
In-Reply-To: <5ae44b7cd1f7577c98f316a7d288aa4cf423da2d.camel@active.ch>
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 DenysDrozdov <denys.drozdov@toradex.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--oto3uixman4x7lhu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 23, 2022 at 09:42:11AM +0100, Max Krummenacher wrote:
> Am Freitag, den 18.03.2022, 17:53 +0000 schrieb Dave Stevenson:
> > On Fri, 18 Mar 2022 at 17:16, Maxime Ripard <maxime@cerno.tech> wrote:
> > > On Fri, Mar 18, 2022 at 05:05:11PM +0000, Dave Stevenson wrote:
> > > > Hi Maxime
> > > >=20
> > > > On Fri, 18 Mar 2022 at 16:35, Maxime Ripard <maxime@cerno.tech> wro=
te:
> > > > > On Mon, Mar 07, 2022 at 04:26:56PM +0100, Max Krummenacher wrote:
> > > > > > On Wed, Mar 2, 2022 at 5:22 PM Marek Vasut <marex@denx.de> wrot=
e:
> > > > > > > On 3/2/22 15:21, Maxime Ripard wrote:
> > > > > > > > Hi,
> > > > > > >=20
> > > > > > > Hi,
> > > > > > >=20
> > > > > > > > Please try to avoid top posting
> > > > > > Sorry.
> > > > > >=20
> > > > > > > > On Wed, Feb 23, 2022 at 04:25:19PM +0100, Max Krummenacher =
wrote:
> > > > > > > > > The goal here is to set the element bus_format in the str=
uct
> > > > > > > > > panel_desc. This is an enum with the possible values defi=
ned in
> > > > > > > > > include/uapi/linux/media-bus-format.h.
> > > > > > > > >=20
> > > > > > > > > The enum values are not constructed in a way that you cou=
ld calculate
> > > > > > > > > the value from color channel width/shift/mapping/whatever=
=2E You rather
> > > > > > > > > would have to check if the combination of color channel
> > > > > > > > > width/shift/mapping/whatever maps to an existing value an=
d otherwise
> > > > > > > > > EINVAL out.
> > > > > > > > >=20
> > > > > > > > > I don't see the value in having yet another way of how th=
is
> > > > > > > > > information can be specified and then having to write a m=
ore
> > > > > > > > > complicated parser which maps the dt data to bus_format.
> > > > > > > >=20
> > > > > > > > Generally speaking, sending an RFC without explicitly stati=
ng what you
> > > > > > > > want a comment on isn't very efficient.
> > > > > > >=20
> > > > > > > Isn't that what RFC stands for -- Request For Comment ?
> > > > > >=20
> > > > > > I hoped that the link to the original discussion was enough.
> > > > > >=20
> > > > > > panel-simple used to have a finite number of hardcoded panels s=
elected
> > > > > > by their compatible.
> > > > > > The following patchsets added a compatible 'panel-dpi' which sh=
ould
> > > > > > allow to specify the panel in the device tree with timing etc.
> > > > > >  =20
> > > > > > https://patchwork.kernel.org/project/dri-devel/patch/2020021618=
1513.28109-6-sam@ravnborg.org/
> > > > > > In the same release cycle part of it got reverted:
> > > > > >  =20
> > > > > > https://patchwork.kernel.org/project/dri-devel/patch/2020031415=
3047.2486-3-sam@ravnborg.org/
> > > > > > With this it is no longer possible to set bus_format.
> > > > > >=20
> > > > > > The explanation what makes the use of a property "data-mapping"=
 not a
> > > > > > suitable way in that revert
> > > > > > is a bit vague.
> > > > >=20
> > > > > Indeed, but I can only guess. BGR666 in itself doesn't mean much =
for
> > > > > example. Chances are the DPI interface will use a 24 bit bus, so =
where
> > > > > is the padding?
> > > > >=20
> > > > > I think that's what Sam and Laurent were talking about: there was=
n't
> > > > > enough information encoded in that property to properly describe =
the
> > > > > format, hence the revert.
>=20
> I agree that the strings used to set "data-mapping" weren't self explaini=
ng.
> However, as there was a
> clear 1:1 relation to the bus_format value the meaning
> wasn't ambiguous at all.
>=20
> > > >=20
> > > > MEDIA_BUS_FMT_RGB666_1X18 defines an 18bit bus, therefore there is =
no
> > > > padding. "bgr666" was selecting that media bus code (I won't ask ab=
out
> > > > the rgb/bgr swap).
> > > >=20
> > > > If there is padding on a 24 bit bus, then you'd use (for example)
> > > > MEDIA_BUS_FMT_RGB666_1X24_CPADHI to denote that the top 2 bits of e=
ach
> > > > colour are the padding. Define and use a PADLO variant if the paddi=
ng
> > > > is the low bits.
> > >=20
> > > Yeah, that's kind of my point actually :)
> >=20
> > Ah, OK :)
> >=20
> > > Just having a rgb666 string won't allow to differentiate between
> > > MEDIA_BUS_FMT_RGB666_1X18 and MEDIA_BUS_FMT_RGB666_1X24_CPADHI: both =
are
> > > RGB666 formats. Or we could say that it's MEDIA_BUS_FMT_RGB666_1X18 a=
nd
> > > then when we'll need MEDIA_BUS_FMT_RGB666_1X24_CPADHI we'll add a new
> > > string but that usually leads to inconsistent or weird names, so this
> > > isn't ideal.
>=20
> We're on the same page that the strings that were used aren't self
> explaining and do not follow a pattern which would make it easy to
> extend. However that is something I addressed in my RFC proposal, not?
>=20
> > >=20
> > > > The string matching would need to be extended to have some string to
> > > > select those codes ("lvds666" is a weird choice from the original
> > > > patch).
> > > >=20
> > > > Taking those media bus codes and handling them appropriately is
> > > > already done in vc4_dpi [1], and the vendor tree has gained
> > > > BGR666_1X18 and BGR666_1X24_CPADHI [2] as they aren't defined in
> > > > mainline.
> > > >=20
> > > > Now this does potentially balloon out the number of MEDIA_BUS_FMT_x=
xx
> > > > defines needed, but that's the downside of having defines for all
> > > > formats.
> > > >=20
> > > > (I will admit to having a similar change in the Pi vendor tree that
> > > > allows the media bus code to be selected explicitly by hex value).
> > >=20
> > > I think having an integer value is indeed better: it doesn't change m=
uch
> > > in the device tree if we're using a header, it makes the driver simpl=
er
> > > since we don't have to parse a string, and we can easily extend it or
> > > rename the define, it won't change the ABI.
>=20
> Fine with me.
>=20
> > >=20
> > > I'm not sure using the raw media bus format value is ideal though, si=
nce
> > > that value could then be used by any OS, and it would effectively for=
ce
> > > the mbus stuff down their throat.
>=20
> I disagree here, this forces us to use code to map the device tree enum
> to the kernel enum for Linux, i.e. adds complexity and maintenance work
> if additional bus_formats are needed.
> Assuming there is another OS which uses the device tree it would not
> make a difference, that OS would still need to map the device tree enum
> to the corresponding representation in their kernel.

So, you don't want to do something in Linux, but would expect someone
else to be completely ok with that?

> I would copy the definitions of media-bus-format.h into a header in
> include/dt-bindings similarly as it is done for
> include/dt-bindings/display/sdtv-standards.h for TV standards.

That might not be an option: that header is licensed under the GPL,
device trees are usually licensed under GPL+MIT, and we don't have any
requirements on the license for other projects using a DT (hence the
dual license).

Maxime

--oto3uixman4x7lhu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYjtDmQAKCRDj7w1vZxhR
xVvgAP46o9tHgfUnrlsA2sWXayXp+nWRUbhdROv4DrBryTGw5QEA14DuKNGCjWqz
yKKal32xr9RzTgfR31Zln5sLMLbAEQ8=
=up+M
-----END PGP SIGNATURE-----

--oto3uixman4x7lhu--
