Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABEF366839
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 11:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF326E1B8;
	Wed, 21 Apr 2021 09:38:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4B46E1B8
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 09:38:38 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 39DAD5804E5;
 Wed, 21 Apr 2021 05:38:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 21 Apr 2021 05:38:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=2W4/VcQCLi4nwEha4WtXFo3m7AG
 hU4mE3p+qqZ+mIH8=; b=RNB22NM4KqSYsruQVebhTNePV+vBSXppIKlDmqegRxP
 feSOay/4xkYBKwLDIAszWAOnEWg4q++1gPFRQyHnBtKu8+qYYRHm12jjc3CE/5vL
 o6UHy45R2xnKu4IbEgNzOSNJseHua9ZFMm8YidKC96j942VcNUEeKD6JseULRaEV
 sqO5s7pU/fqnEWnVJUzG95LqCAsIYtEtbOQJwubB142xMO50wZX/LQXHNEkcuaRF
 qha+swk20WXOZKpt1klmMOUZI1EYSm6P5C8nvycJoxcEPz+Ov9bp+/bDdz/0jX5k
 upIt7sMI9R6BF8Dy+Du8WI+NKj4v6/wwpmRzwF7e99Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=2W4/Vc
 QCLi4nwEha4WtXFo3m7AGhU4mE3p+qqZ+mIH8=; b=up9+FJsAHI/C47dO4CaNUM
 4EH3sAPhfa0B2aKdfL/8G3bX6/akrKd+4WzkZXxmLDgVvHAaMxldntmAObi1jSCs
 g9KSRh5i3BiT7XvbMmxq8fLaJqS4DUb0byMl2xmLUCClYL62E158zrAG7xS+OQHA
 vjOY05NHBPhXUumaCV/5UXhtpnA31h8YNyuqZIXjxh61nH/3c/tROrQRgJQQHjx8
 mg8UqbTqm4W3JnIrPhgtR6LQj4nnAaBcw2iIDfj/oKDE5ucPrho6rMBngPWpDuKx
 qxVoKIHMST9/2kMVWqBTP/GNObNsEMFspdd6EouyQZVgC+o4Uir8H3swJybRTC9A
 ==
X-ME-Sender: <xms:m_J_YJ-7KJRFENAIRSuqrPbpP2RvsmT5e1AZW0fL5GKGorFKF3eg_g>
 <xme:m_J_YNvYcs5O0oFXzbhN64QHUR3unzCdYUt1g17J_pQSgHqLKWZQbMFfLL284DqJm
 wwrjdM7Hzl1sflv1zU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtkedgudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhephfeiteehhfeuudeluedtieeuteegveevkefgkeeitdetvdeftdevtdffgeei
 uedvnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghdpsghoohhtlhhinhdrtg
 homhdpkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvg
 hrnhhordhtvggthh
X-ME-Proxy: <xmx:m_J_YHBv_-BnTWHXQ2pZr8sdzR0tuLoxaS1PbEvwH65zy--zUKeE0Q>
 <xmx:m_J_YNd-BGv3PXgAze6lgTX-UlHP6KdSD1ythy8pfF6g3FKo18MIHQ>
 <xmx:m_J_YOPvVjcErpgp1_faOm4y31pZdXWTXuKujEnmLL101eFL4Gv1Bg>
 <xmx:nvJ_YFoDo2sQp0Ct8uOzqz2VAbkDCi72Q4dpkugyF26BtAo805wTrw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8F3EB1080068;
 Wed, 21 Apr 2021 05:38:35 -0400 (EDT)
Date: Wed, 21 Apr 2021 11:38:33 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Kevin Tang <kevin3.tang@gmail.com>
Subject: Re: [PATCH v4 5/6] dt-bindings: display: add Unisoc's mipi dsi
 controller bindings
Message-ID: <20210421093833.dhnkf2265hrtwkzr@gilmour>
References: <20210222132822.7830-1-kevin3.tang@gmail.com>
 <20210222132822.7830-6-kevin3.tang@gmail.com>
 <20210324111316.ggo5deacaoecu27q@gilmour>
 <CAFPSGXah3gKKHXhukRAPT=RjQZTnvDznG+619+8tah-hfFrUzA@mail.gmail.com>
 <20210407104653.l4xwfl3qshaimat3@gilmour>
 <CAFPSGXaQKeKMKC7MGXhxQErB_yh_eE8khk1hOrjHnuOH20Gg4Q@mail.gmail.com>
 <20210415084230.moqxuy3caym3kupk@gilmour>
 <CAFPSGXYujpe=C64f=MJAUmqGwoP6t=NE+nNqezmKUTcyrxt+=g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFPSGXYujpe=C64f=MJAUmqGwoP6t=NE+nNqezmKUTcyrxt+=g@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Chunyan Zhang <zhang.lyra@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============0946118429=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0946118429==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rpyo6ffe5bipimwd"
Content-Disposition: inline


--rpyo6ffe5bipimwd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Apr 19, 2021 at 12:33:42AM +0800, Kevin Tang wrote:
> Maxime Ripard <maxime@cerno.tech> =E4=BA=8E2021=E5=B9=B44=E6=9C=8815=E6=
=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=884:42=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Fri, Apr 09, 2021 at 08:23:19AM +0800, Kevin Tang wrote:
> > > Maxime Ripard <maxime@cerno.tech> =E4=BA=8E2021=E5=B9=B44=E6=9C=887=
=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=886:46=E5=86=99=E9=81=93=EF=BC=
=9A
> > >
> > > > On Wed, Mar 31, 2021 at 09:49:14AM +0800, Kevin Tang wrote:
> > > > > Hi Maxime,
> > > > >
> > > > > Maxime Ripard <maxime@cerno.tech> =E4=BA=8E2021=E5=B9=B43=E6=9C=
=8824=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=887:13=E5=86=99=E9=81=93=
=EF=BC=9A
> > > > >
> > > > > > On Mon, Feb 22, 2021 at 09:28:21PM +0800, Kevin Tang wrote:
> > > > > > > From: Kevin Tang <kevin.tang@unisoc.com>
> > > > > > >
> > > > > > > Adds MIPI DSI Controller
> > > > > > > support for Unisoc's display subsystem.
> > > > > > >
> > > > > > > Cc: Orson Zhai <orsonzhai@gmail.com>
> > > > > > > Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> > > > > > > Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
> > > > > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > > > > > ---
> > > > > > >  .../display/sprd/sprd,sharkl3-dsi-host.yaml   | 102
> > > > ++++++++++++++++++
> > > > > > >  1 file changed, 102 insertions(+)
> > > > > > >  create mode 100644
> > > > > >
> > > > Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-hos=
t.yaml
> > > > > > >
> > > > > > > diff --git
> > > > > >
> > > > a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-h=
ost.yaml
> > > > > >
> > > > b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-h=
ost.yaml
> > > > > > > new file mode 100644
> > > > > > > index 000000000..d439f688f
> > > > > > > --- /dev/null
> > > > > > > +++
> > > > > >
> > > > b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-h=
ost.yaml
> > > > > > > @@ -0,0 +1,102 @@
> > > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > > +%YAML 1.2
> > > > > > > +---
> > > > > > > +$id:
> > > > > > http://devicetree.org/schemas/display/sprd/sprd,sharkl3-dsi-hos=
t.yaml#
> > > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > > +
> > > > > > > +title: Unisoc MIPI DSI Controller
> > > > > > > +
> > > > > > > +maintainers:
> > > > > > > +  - Kevin Tang <kevin.tang@unisoc.com>
> > > > > > > +
> > > > > > > +properties:
> > > > > > > +  compatible:
> > > > > > > +    const: sprd,sharkl3-dsi-host
> > > > > > > +
> > > > > > > +  reg:
> > > > > > > +    maxItems: 1
> > > > > > > +
> > > > > > > +  interrupts:
> > > > > > > +    maxItems: 2
> > > > > > > +
> > > > > > > +  clocks:
> > > > > > > +    minItems: 1
> > > > > > > +
> > > > > > > +  clock-names:
> > > > > > > +    items:
> > > > > > > +      - const: clk_src_96m
> > > > > > > +
> > > > > > > +  power-domains:
> > > > > > > +    maxItems: 1
> > > > > > > +
> > > > > > > +  ports:
> > > > > > > +    type: object
> > > > > > > +
> > > > > > > +    properties:
> > > > > > > +      "#address-cells":
> > > > > > > +        const: 1
> > > > > > > +
> > > > > > > +      "#size-cells":
> > > > > > > +        const: 0
> > > > > > > +
> > > > > > > +      port@0:
> > > > > > > +        type: object
> > > > > > > +        description:
> > > > > > > +          A port node with endpoint definitions as defined in
> > > > > > > +
> > > > Documentation/devicetree/bindings/media/video-interfaces.txt.
> > > > > > > +          That port should be the input endpoint, usually co=
ming
> > > > from
> > > > > > > +          the associated DPU.
> > > > > > > +      port@1:
> > > > > > > +        type: object
> > > > > > > +        description:
> > > > > > > +          A port node with endpoint definitions as defined in
> > > > > > > +
> > > > Documentation/devicetree/bindings/media/video-interfaces.txt.
> > > > > > > +          That port should be the output endpoint, usually o=
utput to
> > > > > > > +          the associated panel.
> > > > > >
> > > > > > The DSI generic binding asks that peripherals that are controll=
ed
> > > > > > through a DCS be a subnode of the MIPI-DSI bus, not through a p=
ort
> > > > > > endpoint.
> > > > > >
> > > > >  Our DSI controller don't support DCS now...
> > > >
> > > > I'm not sure I follow you, you mentionned in the patch 4 that you w=
ere
> > > > testing for a device to be in command mode, how would that work wit=
hout
> > > > DCS support?
> > > >
> > > Sorry, I see DCS as DSC, pls ignore my previous comments.
> > >
> > > dsi input node is display controller and dsi output node is panel,
> > > I still don't understand what it has to do with dcs? and it seems that
> > > other vendors also like this.
> > >
> > > can you help provide some cases?
> >
> > So the device tree is a tree organized through which bus controls which
> > device: Your DSI controller is accessed through a memory-mapped region
> > and is thus a child node of the main bus (I guess?) and then, since the
> > DSI panel is going to be controlled through the DSI controller and
> > MIPI-DCS, it needs to be a child of the display controller.
> Yeah, access DSI controller registers is through AHB bus.
>=20
> I'm a little confused, DSI panel node should be a child of the display
> controller?

If they are controlled through DSI, yes.

> I found a lot of cases are organized like this, we also do like it.
> https://elixir.bootlin.com/linux/v5.11.15/source/arch/arm/boot/dts/tegra1=
14-dalmore.dts#L48
>=20
> >
> > This is exactly what is being described here:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/devicetree/bindings/display/mipi-dsi-bus.txt#n42
> >
> > The second port is thus not needed at all
> Yeah, dsi_out port is no need, should be detele.
> Besides, I also have a question, if out dsi-phy is separate driver(eg,
> dphy have it's own bus)
> dsi_out port should be "dphy_in"?

You could argue both, but phys are usually represented through the phys pro=
perty.

Maxime

--rpyo6ffe5bipimwd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYH/ymQAKCRDj7w1vZxhR
xT1aAQCFJmJwubW5uuEih1MMXtaGdOWmBlYyTp0PjzRuH48wVAD/YnauZ0hvub2Q
gTr8Pxphr82Txyym/aDFSxH2AeubEQs=
=9LY+
-----END PGP SIGNATURE-----

--rpyo6ffe5bipimwd--

--===============0946118429==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0946118429==--
