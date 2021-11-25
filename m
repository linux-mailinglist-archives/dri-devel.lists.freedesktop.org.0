Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C7145DE5C
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 17:10:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B6C6E9E3;
	Thu, 25 Nov 2021 16:10:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED3D06E9E3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 16:10:33 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id BB5E43200754;
 Thu, 25 Nov 2021 11:10:29 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 25 Nov 2021 11:10:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=qrCtJxJR5WIwa2WuW7TF/dNfFjv
 sa8tvz0KLp1fKY80=; b=J51OyH9eLgMKsBgNveiOGYOu9M85Idv5JQTPsdPipMv
 VHjqGe4x3rAn+nRkyH4UlRNEY1VOs8u1mmQEPAMzHCErtnNMxaOlAaWa9q6WyCZB
 upVD8My1qrc9nuLjBnhSG6Bh4qf62GhUVM63+pZoGb+ChPcC6tPM9lPqn0YxvAGZ
 4CtgDjmcNiiuXD0G1uS/FehAiKWXKFEZqlMc8MnvI5nFje/ikXFxAc7BdQViSTmM
 I2Mjej9XgrAZ+OubDnCcZ6YTegjTI6k1B+vQiVvou64+Fz4SSYxzOV+2xpke4oSw
 NEJ57oEZTTwSz2shmemroqwZSJI24wxJnwUHh0OV7yA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=qrCtJx
 JR5WIwa2WuW7TF/dNfFjvsa8tvz0KLp1fKY80=; b=LWWDYKd+2ONdKdAojdv1lq
 7f/aV9R1Y8+AjHICPfDIZ7SkLJQBHA9SQZX9VAh53fZDYvE72WQviatU+IHuUm7M
 j0fwuqsDUARiuRpwSexhPQvQ2dPRntHC47nPa1PPHiR1X6mOO4A2Up5ufROtDDB1
 F2/qQuJKYvvN0ddjYv6A6kmVrLVLPv1mJOLO9USNe8HTU15J0Rk/kqENFTVNM6K9
 7qPQEWxvaiF8MEBX7Xl/YNkEBVPgq9Od0LIMWEyuevISu99M0FApfzCez+8n7/L+
 9EMqXSTbxYj9f9zR4whKFarEr0Sl/B0fp8/3/RF/y09gz73fqNZTQQgIqI3YAL5w
 ==
X-ME-Sender: <xms:dLWfYYDRDUZdfwJKjBuEWcRAHW68MbDgjz8rBnnPNXoO4-elwpPcXw>
 <xme:dLWfYahPEahJhcLtvrgKadDbEuHF-lijBQ9Z51BsyR8iMjsfpjqIxIxKoTdWBLb5X
 KOBfPY0j-o0GupInN8>
X-ME-Received: <xmr:dLWfYbkyMDOpPN_fyAd30QcGV-7gQ1B3gxL-Gf89EgHHMVT8zowXuQvwxogicFGSEHPD7nYxyhgThdrSTt9S866EytAeNukcn_o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrhedtgdekhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeevveefffduveeitdegtefhhfetueffteefffdvheevvdehteethedvleffgfej
 vdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:dLWfYew6h45CSdT_mkzQk22IToyH3mulcSGjpAtr1e1kbphZNEG24A>
 <xmx:dLWfYdTiV2R7zNFbwBPsjQsPCZeTMKrD82_6Nm-2IqkgpngGAqGlWw>
 <xmx:dLWfYZaojCOzlX6v0oCjhrUQRxblTerO0JyofAImN5lb9spWq7GMlw>
 <xmx:dLWfYYE7JfM1Rqt3beCE15kgdd6e_GUT4qabUV0SwZztTyIBmKgbGA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Nov 2021 11:10:27 -0500 (EST)
Date: Thu, 25 Nov 2021 17:10:26 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v5 3/7] drm: sun4i: dsi: Convert to bridge driver
Message-ID: <20211125161026.ndfygaa6c4nnst4i@gilmour>
References: <20211122065223.88059-1-jagan@amarulasolutions.com>
 <20211122065223.88059-4-jagan@amarulasolutions.com>
 <20211122100712.dls4eqsu6o5gcc5k@gilmour>
 <CAMty3ZDkUSfW_+PosjgY_GQB3wSvNRaCjwq_nOwWHo-RGQUVFw@mail.gmail.com>
 <20211122140457.jm7cwpp2h3fkf2nd@gilmour>
 <CAMty3ZByw=ZjN3z2UsKj5X5kvrpwCFNUohAnO=O1d29jLPR1Yw@mail.gmail.com>
 <CAMty3ZBizr0uw6VrKBQ9AEYe48_QJKb0QC=pGEcA3OGK_CfQkw@mail.gmail.com>
 <20211125141516.oymscgs3xcjqmgce@gilmour>
 <CAMty3ZC0KOUxr2rComOCfC70wGS_aSXzjFGS4f=pEB6MQHRGFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dvfrxmcscyl5dcr2"
Content-Disposition: inline
In-Reply-To: <CAMty3ZC0KOUxr2rComOCfC70wGS_aSXzjFGS4f=pEB6MQHRGFw@mail.gmail.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, linux-sunxi@googlegroups.com,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--dvfrxmcscyl5dcr2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 25, 2021 at 07:55:41PM +0530, Jagan Teki wrote:
> Hi,
>=20
> On Thu, Nov 25, 2021 at 7:45 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > On Wed, Nov 24, 2021 at 12:02:47AM +0530, Jagan Teki wrote:
> > > > > > > > +     dsi->panel =3D of_drm_find_panel(remote);
> > > > > > > > +     if (IS_ERR(dsi->panel)) {
> > > > > > > > +             dsi->panel =3D NULL;
> > > > > > > > +
> > > > > > > > +             dsi->next_bridge =3D of_drm_find_bridge(remot=
e);
> > > > > > > > +             if (IS_ERR(dsi->next_bridge)) {
> > > > > > > > +                     dev_err(dsi->dev, "failed to find bri=
dge\n");
> > > > > > > > +                     return PTR_ERR(dsi->next_bridge);
> > > > > > > > +             }
> > > > > > > > +     } else {
> > > > > > > > +             dsi->next_bridge =3D NULL;
> > > > > > > > +     }
> > > > > > > > +
> > > > > > > > +     of_node_put(remote);
> > > > > > >
> > > > > > > Using devm_drm_of_get_bridge would greatly simplify the driver
> > > > > >
> > > > > > I'm aware of this and this would break the existing sunxi dsi b=
inding,
> > > > > > we are not using ports based pipeline in dsi node. Of-course yo=
u have
> > > > > > pointed the same before, please check below
> > > > > > https://patchwork.kernel.org/project/dri-devel/patch/2021032214=
0152.101709-2-jagan@amarulasolutions.com/
> > > > >
> > > > > Then drm_of_find_panel_or_bridge needs to be adjusted to handle t=
he DSI
> > > > > bindings and look for a panel or bridge not only through the OF g=
raph,
> > > > > but also on the child nodes
> > > >
> > > > Okay. I need to check this.
> > >
> > > devm_drm_of_get_bridge is not working with legacy binding like the one
> > > used in sun6i dsi
> >
> > There's nothing legacy about it.
>=20
> What I'm mean legacy here with current binding used in sun6i-dsi like thi=
s.
>=20
> &dsi {
>           vcc-dsi-supply =3D <&reg_dcdc1>; /* VCC-DSI */
>           status =3D "okay";
>=20
>          panel@0 {
>                    compatible =3D "bananapi,s070wv20-ct16-icn6211";
>                    reg =3D <0>;
>                    reset-gpios =3D <&r_pio 0 5 GPIO_ACTIVE_HIGH>; /*
> LCD-RST: PL5 */
>                   enable-gpios =3D <&pio 1 7 GPIO_ACTIVE_HIGH>; /*
> LCD-PWR-EN: PB7 */
>                   backlight =3D <&backlight>;
>         };
> };

Yes, I know, it's the generic DSI binding. It's still not legacy.

> devm_drm_of_get_bridge cannot find the device with above binding and
> able to find the device with below binding.
>=20
> &dsi {
>        vcc-dsi-supply =3D <&reg_dcdc1>; /* VCC-DSI */
>        status =3D "okay";
>=20
>       ports {
>             #address-cells =3D <1>;
>             #size-cells =3D <0>;
>=20
>            dsi_out: port@0 {
>                    reg =3D <0>;
>=20
>                   dsi_out_bridge: endpoint {
>                             remote-endpoint =3D <&bridge_out_dsi>;
>                   };
>            };
>       };
>=20
>       panel@0 {
>              compatible =3D "bananapi,s070wv20-ct16-icn6211";
>              reg =3D <0>;
>              reset-gpios =3D <&r_pio 0 5 GPIO_ACTIVE_HIGH>; /* LCD-RST: P=
L5 */
>              enable-gpios =3D <&pio 1 7 GPIO_ACTIVE_HIGH>; /* LCD-PWR-EN:=
 PB7 */
>              backlight =3D <&backlight>;
>=20
>               port {
>                         bridge_out_dsi: endpoint {
>                                 remote-endpoint =3D <&dsi_out_bridge>;
>                         };
>                 };
>        };
> };

Yes, I know, and that's because ...

> >
> > > https://patchwork.kernel.org/project/dri-devel/patch/20211122065223.8=
8059-6-jagan@amarulasolutions.com/
> > >
> > > dsi->next_bridge =3D devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_no=
de, 0, 0);
> > > if (IS_ERR(dsi->next_bridge))
> > >            return PTR_ERR(dsi->next_bridge);
> > >
> > > It is only working if we have ports on the pipeline, something like t=
his
> > > https://patchwork.kernel.org/project/dri-devel/patch/20210214194102.1=
26146-8-jagan@amarulasolutions.com/
> > >
> > > Please have a look and let me know if I miss anything?
> >
> > Yes, you're missing the answer you quoted earlier:
>=20
> Yes, I'm trying to resolve the comment one after another. Will get back.

=2E.. You've ignored that comment.

Maxime

--dvfrxmcscyl5dcr2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYZ+1cgAKCRDj7w1vZxhR
xcFFAQCrE+CHBQrflqNEmkhboP5G0jZBn2vmKJZFooK+hSSCHAEA1r/wJl7eBOM5
81/gYSFBHPof4jSCzbMsJYgiIy1b3gE=
=DTBT
-----END PGP SIGNATURE-----

--dvfrxmcscyl5dcr2--
