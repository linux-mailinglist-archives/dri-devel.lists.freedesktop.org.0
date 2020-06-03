Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 911EF1EDDB9
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 09:12:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826DE6E265;
	Thu,  4 Jun 2020 07:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCFED89A35
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 09:43:49 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5337B5C00E8;
 Wed,  3 Jun 2020 05:43:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 03 Jun 2020 05:43:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=/ZRtaUlz4PlaZqSMUd3N2FgMnKs
 n8HhEgU7Tp69UW18=; b=E8hZCBPlOVM6zLvOJoUSHEwlSgWCpO9ACGcIS5aNLG9
 /gtndLVUDUV4275Lsyod8d6l2IsBXSEI+K+WPObDVPlPjq8A+CRMCub/3zHvLwrK
 dPJ41hMxKArfkw+4/cyfS0/rXLYwkuMfsMgKpTUL8Ezyrk7u4q6EHE+o4NRZHIWB
 CKGeqVajWdw95jJptBaUp81rzIsNKM2xI1TAqoPCGqJHVCZPUUWIbyqxxMpa8lO1
 xq4IEAOr70FZt51l24SJcUZU00TP3dbBAkSmsljgbmn19ucBD0R7RkdcGhAbCTSB
 C488QEmVfKnjp8Z02W/3OzlPHFeUuc/V3ltOBkBzr8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=/ZRtaU
 lz4PlaZqSMUd3N2FgMnKsn8HhEgU7Tp69UW18=; b=SINOAoT4JazfhbsKagJ+zM
 d6URX6ZQpUZXzvGcmyqXfxZMAigbP+Yt1qyuPAFD+OB3SaMViqCgkC708lkLxz87
 2lo5D2YVxOsH1ljgm0+REEuQQ2Y2qVnFBcKFX+1XhVfMt0mffA3KkFw+JK9qczQJ
 s4CoV6cyFtWXj8NcfuursB0TVb/OYE8MWIJKhNScpOQ5d8vSOFBilFGrN8JLRGTQ
 Rj795VyzyVoJvEGapA5l84sMzwHdxx/zC0b19mR+9p+1dka43RVxbaJ7KAbmT2SN
 7gZuBubGFwRCiLWRx6Nw4AJmXXwp+liM9rgJLKUFtrWX4AVQ4xlXNoTpFHErMNvA
 ==
X-ME-Sender: <xms:0XDXXsprLaI-R2cY4HNKV7UqEr457KLah4HqP0C1nx_DOPpHIjOU9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudefledgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:0XDXXip9XK6gOgtuK7SGr-IOLDmyaBc1EesBZyAoE4ltObPibRzu5Q>
 <xmx:0XDXXhNf7RsYEgS74MemgPswjemOUnRB2c8inF8Vla1_A_mWBrqyfw>
 <xmx:0XDXXj7544uB7aWwYDG9e-8-uRVrXD71GoGSJft06o_3Tiz8h87aEA>
 <xmx:0nDXXotXVcuFG2slJmfXNfn18LF27JAd5RhvwS88RjsrhDj4GbWV_A>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 38CBD328005D;
 Wed,  3 Jun 2020 05:43:45 -0400 (EDT)
Date: Wed, 3 Jun 2020 11:43:43 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v3 055/105] drm/vc4: hvs: Introduce a function to get the
 assigned FIFO
Message-ID: <20200603094343.p3exkblfmse5mmcn@gilmour>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
 <f1b1737fe0665e7191c3d2a3cd9bfafb831866be.1590594512.git-series.maxime@cerno.tech>
 <CADaigPUpH4DuK_FSVGmq-ZPPCtvxOcdq881h9h3NE1_ODJ6tuA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADaigPUpH4DuK_FSVGmq-ZPPCtvxOcdq881h9h3NE1_ODJ6tuA@mail.gmail.com>
X-Mailman-Approved-At: Thu, 04 Jun 2020 07:11:42 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1404310432=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1404310432==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5n2cnfauefut5xjz"
Content-Disposition: inline


--5n2cnfauefut5xjz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Eric,

On Wed, May 27, 2020 at 12:40:02PM -0700, Eric Anholt wrote:
> On Wed, May 27, 2020 at 8:50 AM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > At boot time, if we detect that a pixelvalve has been enabled, we need =
to
> > be able to retrieve the HVS channel it has been assigned to so that we =
can
> > disable that channel too. Let's create that function that returns the F=
IFO
> > or an error from a given output.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
>=20
> > +int vc4_hvs_get_fifo_from_output(struct drm_device *dev, unsigned int =
output)
> > +{
> > +       struct vc4_dev *vc4 =3D to_vc4_dev(dev);
> > +       u32 reg;
> > +       int ret;
> > +
> > +       switch (output) {
> > +       case 0:
> > +               return 0;
> > +
> > +       case 1:
> > +               return 1;
> > +
> > +       case 2:
> > +               reg =3D HVS_READ(SCALER_DISPECTRL);
> > +               ret =3D FIELD_GET(SCALER_DISPECTRL_DSP2_MUX_MASK, reg);
> > +               if (ret =3D=3D 0)
> > +                       return 2;
> > +
> > +               return 0;
> > +
> > +       case 3:
> > +               reg =3D HVS_READ(SCALER_DISPCTRL);
> > +               ret =3D FIELD_GET(SCALER_DISPCTRL_DSP3_MUX_MASK, reg);
> > +               if (ret =3D=3D 3)
> > +                       return -EPIPE;
> > +
> > +               return ret;
> > +
> > +       case 4:
> > +               reg =3D HVS_READ(SCALER_DISPEOLN);
> > +               ret =3D FIELD_GET(SCALER_DISPEOLN_DSP4_MUX_MASK, reg);
> > +               if (ret =3D=3D 3)
> > +                       return -EPIPE;
> > +
> > +               return ret;
> > +
> > +       case 5:
> > +               reg =3D HVS_READ(SCALER_DISPDITHER);
> > +               ret =3D FIELD_GET(SCALER_DISPDITHER_DSP5_MUX_MASK, reg);
> > +               if (ret =3D=3D 3)
> > +                       return -EPIPE;
>=20
> Oh, FIELD_GET is new to me.  Looks like we should replace
> VC4_GET_FIELD usage with just using that header, and also
> VC4_SET_FIELD with WARN_ON(!FIELD_FIT()); FIELD_PREP.
>
> Could you follow up with that?

I will :)

> Other than that, 54-67 r-b.

Thanks!
Maxime

--5n2cnfauefut5xjz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXtdwzwAKCRDj7w1vZxhR
xSigAP9SVbehxfj1alttR069S1VUOyKC5fYaX83YpNFbUoAeiwD9HUSzu+1SMdx5
MFPJEKUFVFrMkPNpooUcet+mJufu5g0=
=QbRd
-----END PGP SIGNATURE-----

--5n2cnfauefut5xjz--

--===============1404310432==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1404310432==--
