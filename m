Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9443531FBB7
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 16:12:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B4666EB52;
	Fri, 19 Feb 2021 15:12:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6695B6EB52;
 Fri, 19 Feb 2021 15:12:45 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id AD8085801DB;
 Fri, 19 Feb 2021 10:12:42 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 19 Feb 2021 10:12:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=Emd+iGXCpjhCIuGJ6kINzMtdOjP
 Vb1dtj8cLvd3w9uQ=; b=NGfSf1xCTv59Q/62lzFrQUe3OfzHicY7PdlXFseZ+fo
 CXaps5k96MCo/y6dXa/ePCUiVr/+yd+bY0z6zZBYrTTK2YzzxM1J8iqD3y6W62cZ
 rXBdZ7f2+aX04uHfX4St/hRD2mvVDoQ+/wu5mb+Q5x907WZ9caEJ8KHfdT1nr2yD
 JLP64gaaabo7m5fSkBVWV9SDIr/uh0mJgEZZlhBIJuPlE67fksWmT4qsGXSXnPqG
 CKVo2kTnbLrkMB9P1EmlLJdgH0orL2bJxv6jphPeJpe+zESq+2OJKnDQBxs0UL06
 x/1RFeKzSAsBixLgniCd+pZnvp+IstVDQldHmokucVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Emd+iG
 XCpjhCIuGJ6kINzMtdOjPVb1dtj8cLvd3w9uQ=; b=XHY4s+8UfwXqR/mdORv9Po
 /1XBss0CQ+zb9weVPOMHgXllan4j3WpFbVV45/9KrKa8MoIeEvYETWxoJEslqrHX
 dgZiBw3LQr6qqQlGIBwp1fvzIM7wmsmSMRJPN7pcx26eaJLu1vWzJASxkht3qzL3
 37VmmRlkN0y8eQqZLlN/zwcOCVJd/dAR7AO7Ow7IidsN98Kpbi2SAccAvvgtzrBA
 EiUnoHogcZxTVCcrP0XuoyWqE6afFOSiKBq5jnT866hfWHZ0ogtOVppzLv3xFa4D
 ZcfX/iJsRv2yUob032ohIQetrwvo9hbKn/V9+26kTFBw827c/q1tZPTIXDWIjtdw
 ==
X-ME-Sender: <xms:ZtUvYBx0bbDfFxXAdIHbkwjyvuzqdT-sP0wW9H9sCZbunWFhSVeH5A>
 <xme:ZtUvYBS0sQ6QEVz6WG3a70zRD-4BgpSmOJyrrc2EtwoHD16lfAP7faThFVF-v5MpL
 QCvAHvC0jqlMXPKtqg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeigdejfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ZtUvYLX8QzsLvkGEKzfhD1XAcBYkntU7dfwxve0WGgWt7bV-3lf-DA>
 <xmx:ZtUvYDijvIJAeW3OBrs-WZlrOHqA6KeHcimnKMIktl8ihFDtqDEDKg>
 <xmx:ZtUvYDCT2WhDglx11hvthCAHwH62SLuW3JZFEW_w4IwkPoV0cR1NIA>
 <xmx:atUvYNrOPVJ5tO9BLZs9QptUd2msh0xMIaKSYRV9WMfTEsqgsuaOXQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id C72DF1080057;
 Fri, 19 Feb 2021 10:12:37 -0500 (EST)
Date: Fri, 19 Feb 2021 16:12:35 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 02/11] drm: Rename plane atomic_check state names
Message-ID: <20210219151235.dsv4mujqyrzndhsn@gilmour>
References: <20210219120032.260676-1-maxime@cerno.tech>
 <20210219120032.260676-2-maxime@cerno.tech>
 <51bb5aaf-f771-020b-9a48-77d8679de6a2@suse.de>
MIME-Version: 1.0
In-Reply-To: <51bb5aaf-f771-020b-9a48-77d8679de6a2@suse.de>
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>, dri-devel@lists.freedesktop.org,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Michal Simek <michal.simek@xilinx.com>, NXP Linux Team <linux-imx@nxp.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Leo Li <sunpeng.li@amd.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Roland Scheidegger <sroland@vmware.com>, Sean Paul <sean@poorly.run>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, Edmund Dea <edmund.j.dea@intel.com>,
 virtualization@lists.linux-foundation.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>, Yannick Fertre <yannick.fertre@st.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Melissa Wen <melissa.srw@gmail.com>,
 linux-tegra@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, amd-gfx@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Chen Feng <puck.chen@hisilicon.com>, Alison Wang <alison.wang@nxp.com>,
 spice-devel@lists.freedesktop.org, Tomi Valkeinen <tomba@kernel.org>,
 Philippe Cornu <philippe.cornu@st.com>, Vincent Abriou <vincent.abriou@st.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Tian Tao <tiantao6@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Paul Cercueil <paul@crapouillou.net>,
 linux-renesas-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Russell King <linux@armlinux.org.uk>, linux-mediatek@lists.infradead.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, linux-mips@vger.kernel.org,
 Jyri Sarha <jyri.sarha@iki.fi>
Content-Type: multipart/mixed; boundary="===============1661301402=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1661301402==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x6inkztb7pnxs2gu"
Content-Disposition: inline


--x6inkztb7pnxs2gu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

Thanks for your review!

On Fri, Feb 19, 2021 at 03:49:22PM +0100, Thomas Zimmermann wrote:
> > diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ip=
uv3-plane.c
> > index 075508051b5f..1873a155bb26 100644
> > --- a/drivers/gpu/drm/imx/ipuv3-plane.c
> > +++ b/drivers/gpu/drm/imx/ipuv3-plane.c
> > @@ -337,12 +337,12 @@ static const struct drm_plane_funcs ipu_plane_fun=
cs =3D {
> >   };
> >   static int ipu_plane_atomic_check(struct drm_plane *plane,
> > -				  struct drm_plane_state *state)
> > +				  struct drm_plane_state *new_state)
>=20
> This function uses a different naming convention then the others?
>=20
> >   {
> >   	struct drm_plane_state *old_state =3D plane->state;

So, the function already had a variable named old_state, so I was
actually trying to make the drivers consistent here: having one variable
with old_state and new_plane_state felt weird.

The heuristic is thus to use the convention of the driver if one exists
already, and if there's none pick new_plane_state.

It makes it indeed inconsistent across drivers, but it felt more natural
to be consistent within a single driver.

Maxime

--x6inkztb7pnxs2gu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYC/VYwAKCRDj7w1vZxhR
xXb7AP9dLYZ0ol4FnTyS9ndvGPPXpijdNPtrfZDs40BKL//eEgEA8HMiYKjgufNK
Zn4QIsaErGpt9UM9/IC6ZwJ7lvoIrQ0=
=ygPX
-----END PGP SIGNATURE-----

--x6inkztb7pnxs2gu--

--===============1661301402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1661301402==--
