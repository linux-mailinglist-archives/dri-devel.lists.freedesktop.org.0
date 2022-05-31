Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 203C25393C0
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 17:16:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE6110FE81;
	Tue, 31 May 2022 15:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AFFB10FE81
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 15:16:46 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 824375C08D3;
 Tue, 31 May 2022 11:16:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 31 May 2022 11:16:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1654010204; x=
 1654096604; bh=ulNAQ1pcXqswmEceuSuobLoT1dHK6KJ4SW3DfbzzGUY=; b=B
 H2E1JaI1iWt9XB94fqwKNbQIyCGNujQn7s3wjr+KqygI88F6Bhsq71tCuDVZiw8z
 6agTebYezaPRkIJ3tL2LyYd6kZdvimN8B2h6hZd6PN/1YkzFvcfEbdnBM2dGGe10
 rGxCZixgYmP5TloGmatV9mWmnULu9Z2ZN1NBd+Kb5XjfC0RuTx7bwjUshFlBnnXv
 ppdkdvgy6pIAQi4qySCdN7pMTmYx41br5IP8661Op3GEJPb392clk5vXAl5n9hVy
 0H4tW5O9RWtBmM8m+/ZyusnS4QRJjW+9LXVfRdk4iqlX1BIV5/skdPAfQPDyiZx/
 c9N9yTx+4kqdQCPsjvKRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1654010204; x=
 1654096604; bh=ulNAQ1pcXqswmEceuSuobLoT1dHK6KJ4SW3DfbzzGUY=; b=R
 v4Mq8lEWXMRg1AgCgs2ukEf1JMq/M1rAaLX3Ll68u85m8MmIVMW3z79ky8WAS8S5
 /AniW47OaB00dgNouonWeQLGvGvDxUtqNhDodNC7foW+rh2BuLAR7wOq0gtJv6yn
 KCIq72lwWrmMnar9/KUoqOSNP5YhxtctB2jpoZrUbunyB3VxeeZNgXwwHhJznUCV
 4vLy6iqmS4TohTEfaVfoLrVbAiyKRT8ItXJmFUc7IcMXmQkSR7H1IUGz/ATsSkWs
 CFborkc25htZ5pvOl/+Vuo1VAa1xmlXAdMyQrpCk235sKu4+ZVWqLBrLtm7UrYHg
 pPbd9bWr4OoNdic0C3wKg==
X-ME-Sender: <xms:WzGWYlB7i-PKi_iagBwL7U31m2e0qq4liLbHvqza-u6K4XcEaicf8Q>
 <xme:WzGWYjh944iPbklfRLXQlXpugQdGA4yGTjU_fUA52s8a2wEcgU5fJoskl0XMj0rPE
 f-0LaRcF0lp97IlouE>
X-ME-Received: <xmr:WzGWYgn5XKJ69Z7RNUKL7-troe-LNx70PKYeNV4X-44OrMtLnYfOHr3Rug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrkeekgdekhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetgfelgefggeekkefggfeludeiudffjeffgeevveekjedukedtudeuteef
 teefgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:WzGWYvyKg1BSSG-E0uiFRPSzlwQCRlOIhYo1XpAxU2jmUI2cdmgSLw>
 <xmx:WzGWYqRZdFvV65tVakHGqTNCiPXA_Tkan_x-EW1k8xnQ9tIxQ7NPUg>
 <xmx:WzGWYiYfKtX8Tbqx9793b8aKFeeBwJ01-84BTg0DoXtcoue72yThWA>
 <xmx:XDGWYtE1UGORWGbbWPGSs4xczsNB2clPshOmEyia3a1r8NPSGDm1sQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 May 2022 11:16:42 -0400 (EDT)
Date: Tue, 31 May 2022 17:16:41 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 3/6] drm/sun4i: sun8i-hdmi-phy: Used device-managed
 clocks/resets
Message-ID: <20220531151641.ua6jzr2pmnuarcfv@penduick>
References: <20220412043512.49364-1-samuel@sholland.org>
 <20220412043512.49364-4-samuel@sholland.org>
 <20220412132325.bq2c3g2fskckfgpz@houat>
 <4b3b2515-d180-fee4-6095-c2e197a3f195@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4b3b2515-d180-fee4-6095-c2e197a3f195@sholland.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Samuel,

Sorry for the (very) late answer

On Tue, Apr 12, 2022 at 06:34:40PM -0500, Samuel Holland wrote:
> On 4/12/22 8:23 AM, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Mon, Apr 11, 2022 at 11:35:08PM -0500, Samuel Holland wrote:
> >> Now that the HDMI PHY is using a platform driver, it can use device-
> >> managed resources. Use these, as well as the dev_err_probe helper, to
> >> simplify the probe function and get rid of the remove function.
> >>
> >> Signed-off-by: Samuel Holland <samuel@sholland.org>
> >> ---
> >>
> >>  drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 100 ++++++++-----------------
> >>  1 file changed, 30 insertions(+), 70 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/=
sun4i/sun8i_hdmi_phy.c
> >> index 1effa30bfe62..1351e633d485 100644
> >> --- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
> >> +++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
> >> @@ -673,10 +673,8 @@ int sun8i_hdmi_phy_get(struct sun8i_dw_hdmi *hdmi=
, struct device_node *node)
> >>  static int sun8i_hdmi_phy_probe(struct platform_device *pdev)
> >>  {
> >>  	struct device *dev =3D &pdev->dev;
> >> -	struct device_node *node =3D dev->of_node;
> >>  	struct sun8i_hdmi_phy *phy;
> >>  	void __iomem *regs;
> >> -	int ret;
> >> =20
> >>  	phy =3D devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
> >>  	if (!phy)
> >> @@ -686,88 +684,50 @@ static int sun8i_hdmi_phy_probe(struct platform_=
device *pdev)
> >>  	phy->dev =3D dev;
> >> =20
> >>  	regs =3D devm_platform_ioremap_resource(pdev, 0);
> >> -	if (IS_ERR(regs)) {
> >> -		dev_err(dev, "Couldn't map the HDMI PHY registers\n");
> >> -		return PTR_ERR(regs);
> >> -	}
> >> +	if (IS_ERR(regs))
> >> +		return dev_err_probe(dev, PTR_ERR(regs),
> >> +				     "Couldn't map the HDMI PHY registers\n");
> >> =20
> >>  	phy->regs =3D devm_regmap_init_mmio(dev, regs,
> >>  					  &sun8i_hdmi_phy_regmap_config);
> >> -	if (IS_ERR(phy->regs)) {
> >> -		dev_err(dev, "Couldn't create the HDMI PHY regmap\n");
> >> -		return PTR_ERR(phy->regs);
> >> -	}
> >> +	if (IS_ERR(phy->regs))
> >> +		return dev_err_probe(dev, PTR_ERR(phy->regs),
> >> +				     "Couldn't create the HDMI PHY regmap\n");
> >> =20
> >> -	phy->clk_bus =3D of_clk_get_by_name(node, "bus");
> >> -	if (IS_ERR(phy->clk_bus)) {
> >> -		dev_err(dev, "Could not get bus clock\n");
> >> -		return PTR_ERR(phy->clk_bus);
> >> -	}
> >> -
> >> -	phy->clk_mod =3D of_clk_get_by_name(node, "mod");
> >> -	if (IS_ERR(phy->clk_mod)) {
> >> -		dev_err(dev, "Could not get mod clock\n");
> >> -		ret =3D PTR_ERR(phy->clk_mod);
> >> -		goto err_put_clk_bus;
> >> -	}
> >> +	phy->clk_bus =3D devm_clk_get(dev, "bus");
> >> +	if (IS_ERR(phy->clk_bus))
> >> +		return dev_err_probe(dev, PTR_ERR(phy->clk_bus),
> >> +				     "Could not get bus clock\n");
> >> =20
> >> -	if (phy->variant->has_phy_clk) {
> >> -		phy->clk_pll0 =3D of_clk_get_by_name(node, "pll-0");
> >> -		if (IS_ERR(phy->clk_pll0)) {
> >> -			dev_err(dev, "Could not get pll-0 clock\n");
> >> -			ret =3D PTR_ERR(phy->clk_pll0);
> >> -			goto err_put_clk_mod;
> >> -		}
> >> -
> >> -		if (phy->variant->has_second_pll) {
> >> -			phy->clk_pll1 =3D of_clk_get_by_name(node, "pll-1");
> >> -			if (IS_ERR(phy->clk_pll1)) {
> >> -				dev_err(dev, "Could not get pll-1 clock\n");
> >> -				ret =3D PTR_ERR(phy->clk_pll1);
> >> -				goto err_put_clk_pll0;
> >> -			}
> >> -		}
> >> -	}
> >> +	phy->clk_mod =3D devm_clk_get(dev, "mod");
> >> +	if (IS_ERR(phy->clk_mod))
> >> +		return dev_err_probe(dev, PTR_ERR(phy->clk_mod),
> >> +				     "Could not get mod clock\n");
> >> =20
> >> -	phy->rst_phy =3D of_reset_control_get_shared(node, "phy");
> >> -	if (IS_ERR(phy->rst_phy)) {
> >> -		dev_err(dev, "Could not get phy reset control\n");
> >> -		ret =3D PTR_ERR(phy->rst_phy);
> >> -		goto err_put_clk_pll1;
> >> -	}
> >> +	if (phy->variant->has_phy_clk)
> >> +		phy->clk_pll0 =3D devm_clk_get(dev, "pll-0");
> >> +	if (IS_ERR(phy->clk_pll0))
> >> +		return dev_err_probe(dev, PTR_ERR(phy->clk_pll0),
> >> +				     "Could not get pll-0 clock\n");
> >> +
> >> +	if (phy->variant->has_second_pll)
> >> +		phy->clk_pll1 =3D devm_clk_get(dev, "pll-1");
> >> +	if (IS_ERR(phy->clk_pll1))
> >> +		return dev_err_probe(dev, PTR_ERR(phy->clk_pll1),
> >> +				     "Could not get pll-1 clock\n");
> >> +
> >> +	phy->rst_phy =3D devm_reset_control_get_shared(dev, "phy");
> >> +	if (IS_ERR(phy->rst_phy))
> >> +		return dev_err_probe(dev, PTR_ERR(phy->rst_phy),
> >> +				     "Could not get phy reset control\n");
> >=20
> > I find the old construct clearer with the imbricated blocks.
>=20
> I'm not sure what you mean here. Are you suggesting braces around the
> dev_err_probe statements? Or do you want me to put the error handling for
> variant-specific resources inside the variant checks? Please clarify.

I meant that we went, for example, from:

if (phy->variant->has_phy_clk) {
	phy->clk_pll0 =3D devm_clk_get(dev, "pll-0");
	if (IS_ERR(phy->clk_pll0)) {
		...
	}
}

to

if (phy->variant->has_phy_clk)
	phy->clk_pll0 =3D devm_clk_get(dev, "pll-0");
if (IS_ERR(phy->clk_pll0)) {
		...
}

Which relies on the fact that phy->clk_pll0 is initialized to !IS_ERR(...),=
 which we never
explicitly enforced. I find the first and original code clearer for that as=
pect (since we only use
that value if it was set), and less fragile.

Maxime
