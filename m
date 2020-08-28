Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9992625665B
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 11:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1688E6EC16;
	Sat, 29 Aug 2020 09:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 405E86E154
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 15:25:18 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8B4075805D7;
 Fri, 28 Aug 2020 11:25:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 28 Aug 2020 11:25:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=RqoAt0RuSE5IFRqbcpkPtQM/Iij
 1LwOiF/6zqK5n/V4=; b=grW6SQeML44qSyhis9PDrPnAgY0BosM51+qqBluKJkg
 4hJdkFWyY8ROrnQtrzlBaVX8vYaZ3PAsVWDZLAjinbVJYHaocwAsEzONs++z9qra
 pL9BO5UqwQ0qXyhKiyrIKSvzk/qNEVC6FDI5OEcpMfsMVaCgfz+tnnT+qRi6tXvy
 es475fouKEHevXZDmYVnM1vJLhiGXkti84i9IwpqsXjRJXJz2LtWoQBHT6Hq7jt7
 z2uvy6mHrfDDbYZAHrMZ690YqoVUHO5cj+RNQAi5Rcvg10X5SSMWPKOPiUB/VFqO
 YnJJHYnnlpXeYugCN/xutDZgk2UtZcJBCUFJMx0Hhog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=RqoAt0
 RuSE5IFRqbcpkPtQM/Iij1LwOiF/6zqK5n/V4=; b=CgyIiWZgzOuuXVB7crnSc8
 DybFnI+rNTJtoh5O0IVfLV0q/R71u1bd3M/2W4QP65cWJ7YenWAOJvPR+RSwfFBO
 cw9lBctzKeK0FCBMH4OMZI7duwGwltoQKGxTrtB4fA28dfYY+RCppO2Brnh1yh7D
 OIkR7ymyF28V4G2uS6Gfa/B+TgaAqA23/PajBmCJXW4ZkeByRAox1hqr++Gghufi
 wWLRpHsJ6gw/3niZasAvy/JYVyzApt4n7toZ/aWL2g/8XElF4TYcfq04SbdHNYZY
 QYp9iW8LbpCUVmPF6y+cbNFTOlQQlBS+dX9pMNNqTfVPSRzVk2LynPiTlPoq8fBQ
 ==
X-ME-Sender: <xms:2SFJX7ig3Pqndk1fkGnOPVrNFAT9PWjYWKvBP8ZzhQrlr8OCthdQdw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvkedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepudefgffhkedvheelhfejjeffffefgffhgfeggeegudfgvdfhkeefgeejtdel
 fedtnecuffhomhgrihhnpeihrghmlhdrhihouhdphigrmhhlrdhmhienucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:2SFJX4Da6wkHr1JyMXJ3-jMAigO-s7brWa0CK-Pg9ZUCh1OdIxj2Uw>
 <xmx:2SFJX7FgG4VXLlPZFHUukVdpGWMHHKfZdEM4rTiX_CBofCqg5oEX7g>
 <xmx:2SFJX4SdliuCeyFUb8gtOks3ff7JZ66dHf1-dKjlDM8t6r-mT9Ayng>
 <xmx:3CFJX9KxT-d2pGhe4ZIJwNRkEta63rk4cfGQclJ_NDaxn49drWm2jg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1B50A3280059;
 Fri, 28 Aug 2020 11:25:13 -0400 (EDT)
Date: Fri, 28 Aug 2020 17:25:10 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH 3/3] drm/vc4: hdmi: Add pixel bvb clock control
Message-ID: <20200828152510.jhhqvka6fmouozff@gilmour.lan>
References: <20200821071045.24501-1-hoegeun.kwon@samsung.com>
 <CGME20200821071122epcas1p3d00dda4665f94192ac5e9ee829d0557d@epcas1p3.samsung.com>
 <20200821071045.24501-4-hoegeun.kwon@samsung.com>
 <61c199bf-852f-82d3-089a-a0a435343acf@i2se.com>
 <80749dcd-d4b2-68a1-f3ca-c19a120f6f7b@samsung.com>
 <84c423e8-25a6-8f23-cc80-7a17ce03fd1d@i2se.com>
 <a19de8d5-2b01-cb62-38a2-b0732068025c@samsung.com>
 <a3231281-3bd0-e7c9-1bb0-f05848621e82@i2se.com>
MIME-Version: 1.0
In-Reply-To: <a3231281-3bd0-e7c9-1bb0-f05848621e82@i2se.com>
X-Mailman-Approved-At: Sat, 29 Aug 2020 09:21:18 +0000
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 tim.gover@raspberrypi.com, kdasu.kdev@gmail.com, sboyd@kernel.org,
 mturquette@baylibre.com, dave.stevenson@raspberrypi.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, phil@raspberrypi.com, robh+dt@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, nsaenzjulienne@suse.de
Content-Type: multipart/mixed; boundary="===============0837223745=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0837223745==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ix4evhq5byu57ys6"
Content-Disposition: inline


--ix4evhq5byu57ys6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Aug 28, 2020 at 02:45:49PM +0200, Stefan Wahren wrote:
> Am 28.08.20 um 08:30 schrieb Hoegeun Kwon:
> > On 8/27/20 6:49 PM, Stefan Wahren wrote:
> >> Am 27.08.20 um 06:35 schrieb Hoegeun Kwon:
> >>> Hi Stefan,
> >>>
> >>> Thank you for your review.
> >>>
> >>>
> >>> On 8/26/20 7:04 PM, Stefan Wahren wrote:
> >>>> Hi Hoeguen,
> >>>>
> >>>> Am 21.08.20 um 09:10 schrieb Hoegeun Kwon:
> >>>>> There is a problem that the output does not work at a resolution
> >>>>> exceeding FHD. To solve this, we need to adjust the bvb clock at a
> >>>>> resolution exceeding FHD.
> >>>> this patch introduces a mandatory clock, please update
> >>>> brcm,bcm2835-hdmi.yaml first.
> >>>>
> >>>> Is this clock physically available on BCM283x or only on BCM2711?
> >>> As far as I know, BCM2711 raspberry pi 4 supports 4k,
> >>>
> >>> don't supported on pi 3 and pi 3+.
> >>>
> >>> Since 4k is not supported in versions prior to Raspberry Pi 4,
> >>>
> >>> I don't think we need to modify the bvb clock.
> >>>
> >>>
> >>> So I think it is better to update 'brcm,bcm2711-hdmi.yaml'
> >>>
> >>> instead of 'brcm,bcm2835-hdmi.yaml'.
> >> You are correct please update only brcm,bcm2711-hdmi.yaml.
> >>
> >> My concern was that the function vc4_hdmi_encoder_pre_crtc_configure()
> >> is called on a non-bcm2711 platform or on a Raspberry Pi 4 with an old=
er
> >> DTB. So making the BVB clock optional might be better?
> > You are right, if use old dtb, we have a problem with the hdmi driver.
> >
> > So how about modifying it like this?
> >
> > @@ -1614,8 +1614,8 @@ static int vc5_hdmi_init_resources(struct vc4_hdm=
i=20
> > *vc4_hdmi)
> >
> >  =A0=A0=A0=A0=A0=A0=A0 vc4_hdmi->pixel_bvb_clock =3D devm_clk_get(dev, =
"bvb");
> >  =A0=A0=A0=A0=A0=A0=A0 if (IS_ERR(vc4_hdmi->pixel_bvb_clock)) {
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 DRM_ERROR("Failed to get pi=
xel bvb clock\n");
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return PTR_ERR(vc4_hdmi->pi=
xel_bvb_clock);
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 DRM_WARN("Failed to get pix=
el bvb clock\n");
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 vc4_hdmi->pixel_bvb_clock =
=3D NULL;
> >  =A0=A0=A0=A0=A0=A0=A0 }
>=20
> i think the better solution would be devm_clk_get_optional(), which
> return NULL in case the clock doesn't exist.

It's not really optional though. BCM2711 will require it in order to run
properly (as Hoegeun experienced), and the previous SoCs won't.

If we use clk_get_optional and that the DT is missing the clock on the
BCM2711, we will silently ignore it which doesn't sound great.

Maxime

--ix4evhq5byu57ys6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX0kh1gAKCRDj7w1vZxhR
xazQAQCSvVaDf3qmDFvhw1r1oJ8a32YED7NWtNS1A3o11Be4HAEAkpKQVp8yK7ux
G+EKAf+v6chTEQybgsmOJD6baC36/Qs=
=1z+V
-----END PGP SIGNATURE-----

--ix4evhq5byu57ys6--

--===============0837223745==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0837223745==--
