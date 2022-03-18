Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 055864DDFB3
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 18:16:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A84210E061;
	Fri, 18 Mar 2022 17:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABAD510E061
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 17:16:47 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id E83073201D51;
 Fri, 18 Mar 2022 13:16:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 18 Mar 2022 13:16:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=UR5lKdDJD4xPktfE81C0B9XZaO6cT5KORMHCLP
 BEGNw=; b=fDOut3WGmrc6i/YnmTD8TVUy0ODj0+u1VQ23WZDaI/kOvn+PqqWoCL
 RWOukjXSfu87AukdGzohFYN7VYLG7K1D4SxV/Ea6clf+MQy9aFQixFwndOL4vr4c
 JuCwjIlpPsc4uylXue/3+fxCI5Cr0B5z/ZPO2YV1EVyo2n2Evo0j9+l4gbiUippy
 +qt6sK/MSGjSlOcqDYvrXwINu3gonGqb0vSnjcEIy1BwMudi/Foq97kaee3OIhgk
 f0wKNkzQuwQBtiimeio7AsU9t2MY+eeKzotNREc2ZhFjbgG1TfpOHuvQbkDyNiFl
 3++3Ya3W4Lq4XFtM0bXDTJoDRpar780A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=UR5lKdDJD4xPktfE8
 1C0B9XZaO6cT5KORMHCLPBEGNw=; b=lfqUZJe//qZh1YcU5usasQ/7Rg+ldqFSi
 nNQJTaGBGbn1RpCW7KCXUCMMUNace/mAVIZq5ADFbXJRC1+HhIWC7ZjeEab9nRke
 ZXZvwBwzbaA2nV/YHhgy1VMFjG4DT51m4RTov3QM2Lc1hhE/L8RYZB3WQgkw97xA
 MmxVVf8ixQ9y68tSp56gYZ4swtyZWzLJK/3HOPiBIq++h/xme3xl7CrxWWn02qh3
 qRRoZ53fUKAtH80tUjNlDtfk1LTiyjAkCO6EEFnkLqQBSnSjlBzlBNj4e+lSfzUm
 604KM9cKBaAsdzR+wBikpa6ypqMm/nYuNTCVRAPQEXjE3+XsiTn8g==
X-ME-Sender: <xms:fL40YkUAQcepQLJy_DgaSz56L9qy2i9sC1t6UzR7f2UGE-GIdNgkfQ>
 <xme:fL40Yok3fZqyylmE5ZPCJC7T9Ew7CcfVxTKaDVV91pS3i2O5-mYa6kCbQYHLvRlQh
 T5zwHyyqHP2vSXJmRE>
X-ME-Received: <xmr:fL40YoYT4j68NzT-vh_dQt7SCUU9Bz1uNe3EUiact8U6DZPTtZPljuAkiWpCHXsmV4oW6gyyfZ6beU0KyJtFlTXSOgcz6FokknLv6iY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudefiedguddttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevveefffduveeitdegtefhhfetueffteefffdvheevvdehteethedvleff
 gfejvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:fL40YjUgOFwK-HsQNKNWOExeF41CqWUAV5OiJYfVKkfXXu3bI_y28Q>
 <xmx:fL40YukY9ZOaLm7Ob2Tt1jM4A4rlKyse8ueooGLpHh8BaMMoc1WFng>
 <xmx:fL40YoeNb7mWDId1vASda20XzqRmJRBPBTrACrsPoMhsMWtqjZM21g>
 <xmx:fb40Ykm5BwWz6A8nc40NsQuP11905jKRD7hgSDwaYRopo7lmM2MHnQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Mar 2022 13:16:44 -0400 (EDT)
Date: Fri, 18 Mar 2022 18:16:42 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [RFC PATCH] drm/panel: simple: panel-dpi: use bus-format to set
 bpc and bus_format
Message-ID: <20220318171642.y72eqf5qbmuu2ln2@houat>
References: <20220222084723.14310-1-max.krummenacher@toradex.com>
 <20220223134154.oo7xhf37bgtvm3ai@houat>
 <b5f471f4-0712-b798-efb8-b5b481cdb898@denx.de>
 <CAEHkU3Womyq09Lz62SJohix5JywfKvBRvuWedqF1D7gvb+T2tQ@mail.gmail.com>
 <20220302142142.zroy464l5etide2g@houat>
 <9c9a10ca-e6a1-c310-c0a5-37d4fed6efd6@denx.de>
 <CAEHkU3We_odwtWBXHdcwu+_9yEUo0mudC5sVjr0or0C6nbw+vw@mail.gmail.com>
 <20220318163549.5a5v3lex4btnnvgb@houat>
 <CAPY8ntDgWwXyWXDWVouzhdC2wsyjbRgfrvWGU=MRG_2sAquHyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="n3b6x6roybijdytx"
Content-Disposition: inline
In-Reply-To: <CAPY8ntDgWwXyWXDWVouzhdC2wsyjbRgfrvWGU=MRG_2sAquHyQ@mail.gmail.com>
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
 Max Krummenacher <max.oss.09@gmail.com>, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 DenysDrozdov <denys.drozdov@toradex.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--n3b6x6roybijdytx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 18, 2022 at 05:05:11PM +0000, Dave Stevenson wrote:
> Hi Maxime
>=20
> On Fri, 18 Mar 2022 at 16:35, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > On Mon, Mar 07, 2022 at 04:26:56PM +0100, Max Krummenacher wrote:
> > > On Wed, Mar 2, 2022 at 5:22 PM Marek Vasut <marex@denx.de> wrote:
> > > >
> > > > On 3/2/22 15:21, Maxime Ripard wrote:
> > > > > Hi,
> > > >
> > > > Hi,
> > > >
> > > > > Please try to avoid top posting
> > > Sorry.
> > >
> > > > >
> > > > > On Wed, Feb 23, 2022 at 04:25:19PM +0100, Max Krummenacher wrote:
> > > > >> The goal here is to set the element bus_format in the struct
> > > > >> panel_desc. This is an enum with the possible values defined in
> > > > >> include/uapi/linux/media-bus-format.h.
> > > > >>
> > > > >> The enum values are not constructed in a way that you could calc=
ulate
> > > > >> the value from color channel width/shift/mapping/whatever. You r=
ather
> > > > >> would have to check if the combination of color channel
> > > > >> width/shift/mapping/whatever maps to an existing value and other=
wise
> > > > >> EINVAL out.
> > > > >>
> > > > >> I don't see the value in having yet another way of how this
> > > > >> information can be specified and then having to write a more
> > > > >> complicated parser which maps the dt data to bus_format.
> > > > >
> > > > > Generally speaking, sending an RFC without explicitly stating wha=
t you
> > > > > want a comment on isn't very efficient.
> > > >
> > > > Isn't that what RFC stands for -- Request For Comment ?
> > >
> > > I hoped that the link to the original discussion was enough.
> > >
> > > panel-simple used to have a finite number of hardcoded panels selected
> > > by their compatible.
> > > The following patchsets added a compatible 'panel-dpi' which should
> > > allow to specify the panel in the device tree with timing etc.
> > >   https://patchwork.kernel.org/project/dri-devel/patch/20200216181513=
=2E28109-6-sam@ravnborg.org/
> > > In the same release cycle part of it got reverted:
> > >   https://patchwork.kernel.org/project/dri-devel/patch/20200314153047=
=2E2486-3-sam@ravnborg.org/
> > > With this it is no longer possible to set bus_format.
> > >
> > > The explanation what makes the use of a property "data-mapping" not a
> > > suitable way in that revert
> > > is a bit vague.
> >
> > Indeed, but I can only guess. BGR666 in itself doesn't mean much for
> > example. Chances are the DPI interface will use a 24 bit bus, so where
> > is the padding?
> >
> > I think that's what Sam and Laurent were talking about: there wasn't
> > enough information encoded in that property to properly describe the
> > format, hence the revert.
>=20
> MEDIA_BUS_FMT_RGB666_1X18 defines an 18bit bus, therefore there is no
> padding. "bgr666" was selecting that media bus code (I won't ask about
> the rgb/bgr swap).
>=20
> If there is padding on a 24 bit bus, then you'd use (for example)
> MEDIA_BUS_FMT_RGB666_1X24_CPADHI to denote that the top 2 bits of each
> colour are the padding. Define and use a PADLO variant if the padding
> is the low bits.

Yeah, that's kind of my point actually :)

Just having a rgb666 string won't allow to differentiate between
MEDIA_BUS_FMT_RGB666_1X18 and MEDIA_BUS_FMT_RGB666_1X24_CPADHI: both are
RGB666 formats. Or we could say that it's MEDIA_BUS_FMT_RGB666_1X18 and
then when we'll need MEDIA_BUS_FMT_RGB666_1X24_CPADHI we'll add a new
string but that usually leads to inconsistent or weird names, so this
isn't ideal.

> The string matching would need to be extended to have some string to
> select those codes ("lvds666" is a weird choice from the original
> patch).
>=20
> Taking those media bus codes and handling them appropriately is
> already done in vc4_dpi [1], and the vendor tree has gained
> BGR666_1X18 and BGR666_1X24_CPADHI [2] as they aren't defined in
> mainline.
>=20
> Now this does potentially balloon out the number of MEDIA_BUS_FMT_xxx
> defines needed, but that's the downside of having defines for all
> formats.
>=20
> (I will admit to having a similar change in the Pi vendor tree that
> allows the media bus code to be selected explicitly by hex value).

I think having an integer value is indeed better: it doesn't change much
in the device tree if we're using a header, it makes the driver simpler
since we don't have to parse a string, and we can easily extend it or
rename the define, it won't change the ABI.

I'm not sure using the raw media bus format value is ideal though, since
that value could then be used by any OS, and it would effectively force
the mbus stuff down their throat.

Maxime

--n3b6x6roybijdytx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYjS+egAKCRDj7w1vZxhR
xSbUAQDpVghkbbILVe5yUtytrGtIDB7TQ2ByyBaSl56fa30ECAD/Zo9zFZDJkyur
W41jaB83ZOnsQVyryb+BGnxP6KloCQM=
=dKBR
-----END PGP SIGNATURE-----

--n3b6x6roybijdytx--
