Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2934C1228ED
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 11:33:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C096E99B;
	Tue, 17 Dec 2019 10:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F7B289711
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 11:14:41 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4F5976688;
 Mon, 16 Dec 2019 06:14:40 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 16 Dec 2019 06:14:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=6wtEAOA9zEAjBqSIrctunRBYYSQ
 b5Glee85EEArhRIg=; b=QQ+dte4fenHJ/naMFXR/2rJBYhoA5yenpYglspuOyZ5
 ZE8Si4su1rjLMlbd79tR2adUzkVlDRdEnpJClo7kbjdSm/YAB47vMVK4JWR21bdU
 kol3RipmAKIqAr63myjA+j4HBg3hOynwLcmJR5aOmvvJyPC4J9ygdsfYdtxX+Mft
 IVXURlXC+RPzzfrMll02epZuDbHIbwuqZBCbg6BWH8ESJ1S3HcFVKdEfwJ3RkoxO
 UdU4wgJG7kzkpGoVgNEPpn+sho9VqV8g/t4368yv9r8epeMH5Q0xOCiR2TEbVlVv
 d8cWK9t48RnrBuve2Z690Z1NkuBUtUW+zj2oogs3i/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=6wtEAO
 A9zEAjBqSIrctunRBYYSQb5Glee85EEArhRIg=; b=D9CpUbS2MR2NrbgEKUpd3r
 3553/A7UXfd8QWqnnjZMUl8WtV7A1bKW0GnFN8ZdKkpT+jDMAufZOtxQIS4GTmHS
 FG924bw4svhU+lkZm72RQLa//k3wPYvwbCAAAf6cjjmFzS2Ea0DVigdHOFVH7s3H
 RVMDgpUTV/2ttrzk4sYdXS+sF4+ZoxbqcagpY/5JSrFt9oW8o3cwzqFHuQGL1jHB
 LMjJMDiq0PrDnysVugV/Ee5z2mlQgKtA5umwcZvKa5Veqhrt/tdmyrFmeyY+o74t
 gRQfZQkqUFCiKGvj8yHcYvaVosoDQfscfC4XTb6k1ppCORShGEGiETbGj9MXCYqg
 ==
X-ME-Sender: <xms:Hmf3XR4U0X52qKZRYc29zdmO7tX8l7uf4MII9BZSnUBdZtOHbFs8OQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddthedgvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggv
 rhhnohdrthgvtghhnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:Hmf3XR-GNZfv0lLZ1VFQD0DMQfuxMnPt3WArhYHR06Abs9EftgFgaw>
 <xmx:Hmf3XTHN-1r0Euo-LbMyBv2L0C2BTkZ1fSJQlbrHCZ2PEUGTF5fCew>
 <xmx:Hmf3XWXbvncf3_-rzz9IlVAb3JkNcFc2xhGidGJpqrF2MkhkTSRN2Q>
 <xmx:IGf3XVOI0leesD0cM5hYoV_V3UHVuNrXFxbcFvZquKkN8sohfa0aTA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id EC21A80061;
 Mon, 16 Dec 2019 06:14:37 -0500 (EST)
Date: Mon, 16 Dec 2019 12:14:36 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 09/12] drm/rockchip: lvds: Add PX30 support
Message-ID: <20191216111436.wzoq33gvt42w6gqj@gilmour.lan>
References: <20191213181051.25983-1-miquel.raynal@bootlin.com>
 <20191213181051.25983-10-miquel.raynal@bootlin.com>
 <20191216105827.rxkfbwemkqw446jx@gilmour.lan>
 <20191216120312.4aa478da@xps13>
MIME-Version: 1.0
In-Reply-To: <20191216120312.4aa478da@xps13>
X-Mailman-Approved-At: Tue, 17 Dec 2019 10:31:56 +0000
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1069213345=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1069213345==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qqehoburp6qkbata"
Content-Disposition: inline


--qqehoburp6qkbata
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 16, 2019 at 12:03:12PM +0100, Miquel Raynal wrote:
> Maxime Ripard <maxime@cerno.tech> wrote on Mon, 16 Dec 2019 11:58:27 +0100:
> > Hi,
> >
> > On Fri, Dec 13, 2019 at 07:10:48PM +0100, Miquel Raynal wrote:
> > > +static int px30_lvds_grf_config(struct drm_encoder *encoder,
> > > +				struct drm_display_mode *mode)
> > > +{
> > > +	struct rockchip_lvds *lvds = encoder_to_lvds(encoder);
> > > +	u8 nhsync = !(mode->flags & DRM_MODE_FLAG_PHSYNC);
> > > +	u8 nvsync = !(mode->flags & DRM_MODE_FLAG_PVSYNC);
> > > +	u8 ndclk = !(mode->flags & DRM_MODE_FLAG_PCSYNC);
> > > +	int ret;
> > > +
> > > +	if (lvds->output != DISPLAY_OUTPUT_LVDS) {
> > > +		DRM_DEV_ERROR(lvds->dev, "Unsupported display output %d\n",
> > > +			      lvds->output);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	if (nhsync ^ nvsync) {
> > > +		DRM_DEV_ERROR(lvds->dev, "Unsupported Hsync/Vsync polarity\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	/* Set format */
> > > +	ret = regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON1,
> > > +				 PX30_LVDS_FORMAT(lvds->format),
> > > +				 PX30_LVDS_FORMAT(lvds->format));
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	/* Control Hsync/Vsync polarity */
> > > +	ret = regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON0,
> > > +				 PX30_LVDS_TIE_CLKS(1),
> > > +				 PX30_LVDS_TIE_CLKS(1));
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	/* Set Hsync/Vsync polarity */
> > > +	ret = regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON0,
> > > +				 PX30_LVDS_INVERT_CLKS(1),
> > > +				 PX30_LVDS_INVERT_CLKS(nhsync));
> > > +	if (ret)
> > > +		return ret;
> >
> > I don't know the hardware but it seems pretty weird to me. hsync and
> > vsync in LVDS are not clocks (or even signals), they're a bit in the
> > payload. Is there any explanation in the datasheet (or even a
> > datasheet in the first place)?
>
> There is no explanation about this in the PX30 TRM part 1 (public). But
> you are right the naming is weird. Could the "tie clocks" thing above
> mean something to you/people knowing the LVDS world?

I have no idea what that could mean :)

Maxime

--qqehoburp6qkbata
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfdnHAAKCRDj7w1vZxhR
xZyOAQDhVHd0nWPr1azNDyQKN7iIgKm2Ki+H9zu+7Qomae56GgD/XQNyQoHH9Lfw
mc376rXeaH4JqVQjDhawWMIIG6U/dAw=
=keFX
-----END PGP SIGNATURE-----

--qqehoburp6qkbata--

--===============1069213345==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1069213345==--
