Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAA845F144
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 17:04:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F24F96E128;
	Fri, 26 Nov 2021 16:04:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F986E128
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 16:04:12 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id AAD293200F6F;
 Fri, 26 Nov 2021 11:04:10 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 26 Nov 2021 11:04:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=WeKoRdhgN2LwHTqUKyoxBMgSKkp
 O+jfUxzPhmlRJtXA=; b=Fc0Rog7TzCGHn7bDhibJLPE9bhZlINhO7PzFx6X3X8e
 lD6xEpKpKeGkWD70KXJrUvk1qiTlDl0hfJz2AS0XrAymNyn3BfmxTI5ntr3V4uNg
 N5u5yQFimKfAWicilkz1RG3cvZ30/YB0f29PpA2vGQeZbf4J7V6whyg8b6jBEYXr
 vuU/EiTTLoG/BE5qSmjsyJYdH4kQskn7ZqTB/SYjRPf8RZjPaBG9FQjFlv1JEWkg
 kHdcGmJhOAmWpdNHhhIXiMf2eyt4IOubpOjDbmLrnldnlBkgkvKQ7UcYUv9v/u/X
 aw+nLqomEzDirY6OPwt+k2kAdGHwyf7Hk4S566PLZyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=WeKoRd
 hgN2LwHTqUKyoxBMgSKkpO+jfUxzPhmlRJtXA=; b=jRDlAjUo4sci9Uyc8vxvyR
 PPXLk2H4aZJXv7A0tljnslBDK9rY6HssPiY6tLhA++UJERREKAgqxVatNYH34OwW
 tWvY0bSAFSIcZUOU7ID34DRO4FqjC8Rohve61qaJDWmXYooVU2SS9CCGtDx2CRgv
 FAHG7FGFq5vjMgGaV/ubiZf7cN5OfCRks+YcOHBN7XQQMmOHWIEXcaudO2fGkwas
 7MCrIA7C4cooCwl9ASCz1cS15smxJQHzfDlPvzS0/aG9j0dKVzu9tLFpdL5MaSx5
 qmdNAO6H2QmG3Vac/WmzeIP2dkZ1tLgScT9Sm/dpUTuZQzq3T1jFO0ywoN5cC1NA
 ==
X-ME-Sender: <xms:eAWhYcyfbSF6XWfN0UWKMIzRgC__yoYSxaFCDx-XYMRket-Cq0u14A>
 <xme:eAWhYQRuRDnjEIuf0yD-Mf61XFQj6b0soBvGaZcyyWUKPcI5Fg0fI9c2PPAD3VJcr
 aRFYrzbLTn0ry2c9lc>
X-ME-Received: <xmr:eAWhYeXHCrgoOkqyKrPrViwiS5hUKNj2vRrkFL-f0r1uAN-1ogpkncYn3XYnazhRAawaVnAhk_KEP6H3E9gHJorayfciDzYkggs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrhedvgdekvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeevveefffduveeitdegtefhhfetueffteefffdvheevvdehteethedvleffgfej
 vdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:eAWhYahGLi7JYEY4n0EFp0DQr7WyenqbW6Lo-WkxbgdlmtaDwhQ0Lw>
 <xmx:eAWhYeDJUkycXOWiCh54nKrHnMvAMQNFTG6ZlFRwV4ERwV5ElHF8fw>
 <xmx:eAWhYbLQBbx-uh2NisN82YI6ylpFTFtu2QG_9Q6pQyevPK-RzJ57nQ>
 <xmx:egWhYa1zv3vL1SnrE1IgWB5uNd7GgNJA7BjcKiWrCn8Ve86RVOsyRQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Nov 2021 11:04:07 -0500 (EST)
Date: Fri, 26 Nov 2021 17:04:06 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v5 3/7] drm: sun4i: dsi: Convert to bridge driver
Message-ID: <20211126160406.5634xkgmzihngotz@houat>
References: <20211122065223.88059-4-jagan@amarulasolutions.com>
 <20211122100712.dls4eqsu6o5gcc5k@gilmour>
 <CAMty3ZDkUSfW_+PosjgY_GQB3wSvNRaCjwq_nOwWHo-RGQUVFw@mail.gmail.com>
 <20211122140457.jm7cwpp2h3fkf2nd@gilmour>
 <CAMty3ZByw=ZjN3z2UsKj5X5kvrpwCFNUohAnO=O1d29jLPR1Yw@mail.gmail.com>
 <CAMty3ZBizr0uw6VrKBQ9AEYe48_QJKb0QC=pGEcA3OGK_CfQkw@mail.gmail.com>
 <20211125141516.oymscgs3xcjqmgce@gilmour>
 <CAMty3ZC0KOUxr2rComOCfC70wGS_aSXzjFGS4f=pEB6MQHRGFw@mail.gmail.com>
 <20211125161026.ndfygaa6c4nnst4i@gilmour>
 <CAMty3ZBT9ZgwUs3g+5kjcp2DcWryA02YADAS_Kt8-EGe85VSZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kvsmesxwtlt4aksb"
Content-Disposition: inline
In-Reply-To: <CAMty3ZBT9ZgwUs3g+5kjcp2DcWryA02YADAS_Kt8-EGe85VSZg@mail.gmail.com>
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


--kvsmesxwtlt4aksb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 25, 2021 at 09:44:14PM +0530, Jagan Teki wrote:
> On Thu, Nov 25, 2021 at 9:40 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > On Thu, Nov 25, 2021 at 07:55:41PM +0530, Jagan Teki wrote:
> > > Hi,
> > >
> > > On Thu, Nov 25, 2021 at 7:45 PM Maxime Ripard <maxime@cerno.tech> wro=
te:
> > > >
> > > > On Wed, Nov 24, 2021 at 12:02:47AM +0530, Jagan Teki wrote:
> > > > > > > > > > +     dsi->panel =3D of_drm_find_panel(remote);
> > > > > > > > > > +     if (IS_ERR(dsi->panel)) {
> > > > > > > > > > +             dsi->panel =3D NULL;
> > > > > > > > > > +
> > > > > > > > > > +             dsi->next_bridge =3D of_drm_find_bridge(r=
emote);
> > > > > > > > > > +             if (IS_ERR(dsi->next_bridge)) {
> > > > > > > > > > +                     dev_err(dsi->dev, "failed to find=
 bridge\n");
> > > > > > > > > > +                     return PTR_ERR(dsi->next_bridge);
> > > > > > > > > > +             }
> > > > > > > > > > +     } else {
> > > > > > > > > > +             dsi->next_bridge =3D NULL;
> > > > > > > > > > +     }
> > > > > > > > > > +
> > > > > > > > > > +     of_node_put(remote);
> > > > > > > > >
> > > > > > > > > Using devm_drm_of_get_bridge would greatly simplify the d=
river
> > > > > > > >
> > > > > > > > I'm aware of this and this would break the existing sunxi d=
si binding,
> > > > > > > > we are not using ports based pipeline in dsi node. Of-cours=
e you have
> > > > > > > > pointed the same before, please check below
> > > > > > > > https://patchwork.kernel.org/project/dri-devel/patch/202103=
22140152.101709-2-jagan@amarulasolutions.com/
> > > > > > >
> > > > > > > Then drm_of_find_panel_or_bridge needs to be adjusted to hand=
le the DSI
> > > > > > > bindings and look for a panel or bridge not only through the =
OF graph,
> > > > > > > but also on the child nodes
> > > > > >
> > > > > > Okay. I need to check this.
> > > > >
> > > > > devm_drm_of_get_bridge is not working with legacy binding like th=
e one
> > > > > used in sun6i dsi
> > > >
> > > > There's nothing legacy about it.
> > >
> > > What I'm mean legacy here with current binding used in sun6i-dsi like=
 this.
> > >
> > > &dsi {
> > >           vcc-dsi-supply =3D <&reg_dcdc1>; /* VCC-DSI */
> > >           status =3D "okay";
> > >
> > >          panel@0 {
> > >                    compatible =3D "bananapi,s070wv20-ct16-icn6211";
> > >                    reg =3D <0>;
> > >                    reset-gpios =3D <&r_pio 0 5 GPIO_ACTIVE_HIGH>; /*
> > > LCD-RST: PL5 */
> > >                   enable-gpios =3D <&pio 1 7 GPIO_ACTIVE_HIGH>; /*
> > > LCD-PWR-EN: PB7 */
> > >                   backlight =3D <&backlight>;
> > >         };
> > > };
> >
> > Yes, I know, it's the generic DSI binding. It's still not legacy.
> >
> > > devm_drm_of_get_bridge cannot find the device with above binding and
> > > able to find the device with below binding.
> > >
> > > &dsi {
> > >        vcc-dsi-supply =3D <&reg_dcdc1>; /* VCC-DSI */
> > >        status =3D "okay";
> > >
> > >       ports {
> > >             #address-cells =3D <1>;
> > >             #size-cells =3D <0>;
> > >
> > >            dsi_out: port@0 {
> > >                    reg =3D <0>;
> > >
> > >                   dsi_out_bridge: endpoint {
> > >                             remote-endpoint =3D <&bridge_out_dsi>;
> > >                   };
> > >            };
> > >       };
> > >
> > >       panel@0 {
> > >              compatible =3D "bananapi,s070wv20-ct16-icn6211";
> > >              reg =3D <0>;
> > >              reset-gpios =3D <&r_pio 0 5 GPIO_ACTIVE_HIGH>; /* LCD-RS=
T: PL5 */
> > >              enable-gpios =3D <&pio 1 7 GPIO_ACTIVE_HIGH>; /* LCD-PWR=
-EN: PB7 */
> > >              backlight =3D <&backlight>;
> > >
> > >               port {
> > >                         bridge_out_dsi: endpoint {
> > >                                 remote-endpoint =3D <&dsi_out_bridge>;
> > >                         };
> > >                 };
> > >        };
> > > };
> >
> > Yes, I know, and that's because ...
>=20
> Okay. I will use find panel and bridge separately instead of
> devm_drm_of_get_bridge in version patches.

That's not been my point, at all?

I mean, that whole discussion has been because you shouldn't do that.

> >
> > > >
> > > > > https://patchwork.kernel.org/project/dri-devel/patch/202111220652=
23.88059-6-jagan@amarulasolutions.com/
> > > > >
> > > > > dsi->next_bridge =3D devm_drm_of_get_bridge(dsi->dev, dsi->dev->o=
f_node, 0, 0);
> > > > > if (IS_ERR(dsi->next_bridge))
> > > > >            return PTR_ERR(dsi->next_bridge);
> > > > >
> > > > > It is only working if we have ports on the pipeline, something li=
ke this
> > > > > https://patchwork.kernel.org/project/dri-devel/patch/202102141941=
02.126146-8-jagan@amarulasolutions.com/
> > > > >
> > > > > Please have a look and let me know if I miss anything?
> > > >
> > > > Yes, you're missing the answer you quoted earlier:
> > >
> > > Yes, I'm trying to resolve the comment one after another. Will get ba=
ck.
> >
> > ... You've ignored that comment.
>=20
> Not understand which comment you mean. There are few about bridge
> conversion details, I will send my comments.

The one that got quoted there and you removed. For reference:

> Then drm_of_find_panel_or_bridge needs to be adjusted to handle the DSI
> bindings and look for a panel or bridge not only through the OF graph,
> but also on the child nodes

devm_drm_of_get_bridge uses drm_of_find_panel_or_bridge under the hood,
so of course it won't find it if drm_of_find_panel_or_bridge doesn't.
You need to modify drm_of_find_panel_or_bridge to also look for child
devices and see if there's a panel or bridge registered for that child
node. Then devm_drm_of_get_bridge will work as you intend it to.

Maxime

--kvsmesxwtlt4aksb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYaEFdgAKCRDj7w1vZxhR
xfhtAQClCB5fjDKDhwBYdSS4w0ucj1H0ykj29MaN6OGnw35/iwEA76u4JrTkH1Lz
MZJBykVEjk07zHQ8MlhpBvzbbpaD2QI=
=M8B4
-----END PGP SIGNATURE-----

--kvsmesxwtlt4aksb--
