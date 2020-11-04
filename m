Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3DD2A78D0
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:20:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3169F6E9BE;
	Thu,  5 Nov 2020 08:20:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F436ED05
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 12:43:12 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 647E65801DA;
 Wed,  4 Nov 2020 07:43:10 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 04 Nov 2020 07:43:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=78us+UUk6CoTQ5X7xHTMBAyQcMb
 Qj2fZdOq2ZTDXDpY=; b=CZNLwHr9AhKYEnHR9t31QQ8i1RaRhgEQIdpd2hCbg9Z
 4/pnVucDq400XCUFdjX4yWuFZUN8BVMpJs/qij3McBEEjiY/aFHrTdialvQdLt5v
 ipALxcyYiZGwO/Zz6aixnh7IZUZyWTBnz/1eT3tNkO/QLYqDmQ6SbruYWdH4NVrb
 NQ9ODZlz33xoQAXbSdppzraAsb0+p2smSx03nVImAlaniewi+Lpn0G+bcQFHb3Ay
 SuyeW+toydHV9y8MtRyYc7I6YMKvN/pexLrD/Y/aGUN8LHNvv81PqfxN013Rb/PY
 L4Wmigc7pmJij8LnJ9D/UbKtmbXZahecN264S/gDt5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=78us+U
 Uk6CoTQ5X7xHTMBAyQcMbQj2fZdOq2ZTDXDpY=; b=Sm6nVNrtTGHwIAW+nghCkj
 r2SOmU8vnF5fX/jCYQ9aD7VEn9KOyzsp428iKtj0QcUPtCybAKMQQzP7EywZpypB
 r41kiRLODFyFy8sVVvgrLEGi9Khm6xdAjPuBPGEbLT0w32rt410RpAOFaLkCllOd
 f2DuhDi4p3NFGFSMP2i3x/iWvNgyuHFqJftBUUvSBtjaoQfmSLfJ35t6ywwp5jjP
 2A4U5U7C6lwugnuvm1oSc22WumrjRaYYaC1ZLfkmEbGsunH/IsPCUgW0uy+n07dN
 AUuhbk2GT6LWjehXmys199ah5ZrH/2Pou7wh8eLfNfHajfiqrP7UVeJEy7+V/NpQ
 ==
X-ME-Sender: <xms:3KGiX0RhVlYcUA_MON-70AweRLRUn9_drusdN9rVY4FlIEx9vEbndg>
 <xme:3KGiXxye0Egu6ktFP_-mLb1B1zzcxdnR_u6KotVrT3vNw42eH0djyBrzcD3NP9YmB
 2kx7QwQNHas9mLR63E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddthedggeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:3KGiXx3SEHC1svEduB3AoUiCdYqGEeKYPIX1nSfLYCQnCyrs2PuI9Q>
 <xmx:3KGiX4DwjvHSkbarYcediCJRObamjLT8IQ1soBqbSrP2BrPVClfEfQ>
 <xmx:3KGiX9gqMzjhsMaTcflcNeyeefsEAbYT7Ekid9AByeFjzpxhd_APnQ>
 <xmx:3qGiX-V7vOKh6yQaqPRF_3vWnvBTyMT_0FDfo6z_quJFCtoI1vjXag>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 086473280390;
 Wed,  4 Nov 2020 07:43:07 -0500 (EST)
Date: Wed, 4 Nov 2020 13:43:06 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: use of dma_direct_set_offset in (allwinner) drivers
Message-ID: <20201104124306.65nfvmr3ceggug4z@gilmour.lan>
References: <20201103095538.GA19136@lst.de>
 <20201104081411.bnt5kixgunaczbzj@gilmour.lan>
 <9623c346-c86c-e3ce-332b-95492576a859@arm.com>
MIME-Version: 1.0
In-Reply-To: <9623c346-c86c-e3ce-332b-95492576a859@arm.com>
X-Mailman-Approved-At: Thu, 05 Nov 2020 08:20:02 +0000
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
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, iommu@lists.linux-foundation.org,
 Yong Deng <yong.deng@magewell.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1629156707=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1629156707==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zhorkoablbmsvz4w"
Content-Disposition: inline


--zhorkoablbmsvz4w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2020 at 10:15:49AM +0000, Robin Murphy wrote:
> On 2020-11-04 08:14, Maxime Ripard wrote:
> > Hi Christoph,
> >=20
> > On Tue, Nov 03, 2020 at 10:55:38AM +0100, Christoph Hellwig wrote:
> > > Linux 5.10-rc1 switched from having a single dma offset in struct dev=
ice
> > > to a set of DMA ranges, and introduced a new helper to set them,
> > > dma_direct_set_offset.
> > >=20
> > > This in fact surfaced that a bunch of drivers that violate our layeri=
ng
> > > and set the offset from drivers, which meant we had to reluctantly
> > > export the symbol to set up the DMA range.
> > >=20
> > > The drivers are:
> > >=20
> > > drivers/gpu/drm/sun4i/sun4i_backend.c
> > >=20
> > >    This just use dma_direct_set_offset as a fallback.  Is there any g=
ood
> > >    reason to not just kill off the fallback?
> > >=20
> > > drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> > >=20
> > >    Same as above.
> >=20
> > So, the history of this is:
> >=20
> >    - We initially introduced the support for those two controllers
> >      assuming that there was a direct mapping between the physical and
> >      DMA addresses. It turns out it didn't and the DMA accesses were
> >      going through a secondary, dedicated, bus that didn't have the same
> >      mapping of the RAM than the CPU.
> >=20
> >      4690803b09c6 ("drm/sun4i: backend: Offset layer buffer address by =
DRAM starting address")
> >=20
> >    - This dedicated bus is undocumented and barely used in the vendor
> >      kernel so this was overlooked, and it's fairly hard to get infos on
> >      it for all the SoCs we support. We added the DT support for it
> >      though on some SoCs we had enough infos to do so:
> >=20
> >      c43a4469402f ("dt-bindings: interconnect: Add a dma interconnect n=
ame")
> >      22f88e311399 ("ARM: dts: sun5i: Add the MBUS controller")
> >=20
> >      This explains the check on the interconnect property
> >=20
> >    - However, due to the stable DT rule, we still need to operate witho=
ut
> >      regressions on older DTs that wouldn't have that property (and for
> >      SoCs we haven't figured out). Hence the fallback.
>=20
> How about having something in the platform code that keys off the top-lev=
el
> SoC compatible and uses a bus notifier to create offsets for the relevant
> devices if an MBUS description is missing? At least that way the workarou=
nd
> could be confined to a single dedicated place and look somewhat similar to
> other special cases like sta2x11, rather than being duplicated all over t=
he
> place.

I'll give it a try, thanks for the suggestion :)

Maxime

--zhorkoablbmsvz4w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX6Kh2gAKCRDj7w1vZxhR
xXUBAQCk9nFoP5/0upXw2XdZcSkENhaqLEYjyqa2eDCp2Rmb8QEApdDUSCwIotfs
OBET+OLoM/9OhyjnL3e/+1Kb+EGvqA4=
=D3ug
-----END PGP SIGNATURE-----

--zhorkoablbmsvz4w--

--===============1629156707==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1629156707==--
