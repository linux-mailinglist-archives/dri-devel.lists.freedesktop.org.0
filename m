Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5947B1228D7
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 11:32:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A21B6E9AE;
	Tue, 17 Dec 2019 10:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F5D6E50E
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 13:06:23 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 6A61222095;
 Mon, 16 Dec 2019 08:06:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 16 Dec 2019 08:06:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=NMZStGRZCjWyP0MeSjpsZhM7eSL
 tD64n+DEF5CJ+3aw=; b=dPpfLEEGwA17HQY8X+c9n83+gnAbLdMCvWpM08ltrzz
 85QV53+G8MkSKdj+UyjeJLLdlBDhXWgBdnxfYmI5L0gPsZhvJVAG91ZoDAbpToHU
 Bx+tSfE4Rs0F+rsyEgG2HcowkSYIC1T00r8yqD6lEEEDcuc9/R5s25oeF4luMFqq
 qBWuSZsMoGYt46JwmUFseOR2djDu45G9Zq+lWsZ4UGKL5kz7kqls16fdaCDAPa1Y
 /xqF+KTOhKYPgNGrf7x3crrjv7OCUPFsI+2MfjDMd8MnpIjuwA9/fPYasuWAYv6C
 kiVaDjiGk2O/nJ5Wp077yrrCCvTLa+6J0f2Ra0i9tkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=NMZStG
 RZCjWyP0MeSjpsZhM7eSLtD64n+DEF5CJ+3aw=; b=rd57ec0gOjvMgdT5C4B7zT
 62TtKAGgb1ycHMlVwr2m7u6yyYPo5P7JLAAdwS/EiNG0LxnijtVUvzPqi3s/Eob0
 o3r+dS9ayL+V1hoz1a98BmlR7ab38o9mNR64Ck3V5Cq/fDV8zvT52PfDZUvBO+91
 ypyVCoHwzNlomSSyoCiVeQcyTy1HtVbNG6nFmCAzLth/mWRBqije8dsnwjdt+qG2
 LE/YVNZZy+ekWtlwux0/Quir8iTLp8k1IVcsd4bHe/HwI5iv7V+VV/QF0ZmUQTRQ
 r0nuN44X7ashISQeRVpbtCw1t1Qiyc3sxrGb4H6jd7s/8yFhD+9VI+w6TNdxWhcg
 ==
X-ME-Sender: <xms:SYH3XZrs_iVzqQJrZlD4Pha_NOgaychwvHZ0bNK6UTS9IHDgdvc6WA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddthedggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggv
 rhhnohdrthgvtghhnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:SYH3XaxUoKh7Lc9S1rjZOcf7MtTGjRzA6cOvEjP7ye19g19ZYRP0_g>
 <xmx:SYH3XbOnZAnGSnEnKTA1GgOTR5YABwHAY4fha0N5Ne6S6AwnKhUBVg>
 <xmx:SYH3XUdMjtu5h0URY60q-mrV5ngfIJ1tXDPxp4-qK-JRJFSu7zb51w>
 <xmx:SoH3XXX-3nbVZErRu8qcs-qIJOTFh_My3nclPWKa-HdHsBgHL6Futw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9205480064;
 Mon, 16 Dec 2019 08:06:16 -0500 (EST)
Date: Mon, 16 Dec 2019 14:06:15 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] drm/panel: simple: Support reset GPIOs
Message-ID: <20191216130615.qs6ub7bwqofwvhr7@gilmour.lan>
References: <20191213181325.26228-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20191213181325.26228-1-miquel.raynal@bootlin.com>
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============1697397715=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1697397715==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ldeuyceeyd3l6v6w"
Content-Disposition: inline


--ldeuyceeyd3l6v6w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Fri, Dec 13, 2019 at 07:13:25PM +0100, Miquel Raynal wrote:
> The panel common bindings provide a gpios-reset property which is
> active low by default. Let's support it in the simple driver.
>
> De-asserting the reset pin implies a physical high, which in turns is
> a logic low.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

The GPIOd API asks for a logical state, so it doesn't really matter
what the polarity of the GPIO, OUT_LOW will always mean that the reset
is deasserted (and thus, it will work even if the reset pin is active
high).

> ---
>  drivers/gpu/drm/panel/panel-simple.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 5d487686d25c..15dd495c347d 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -110,6 +110,7 @@ struct panel_simple {
>  	struct i2c_adapter *ddc;
>
>  	struct gpio_desc *enable_gpio;
> +	struct gpio_desc *reset_gpio;
>
>  	struct drm_display_mode override_mode;
>  };
> @@ -433,12 +434,21 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>  	if (IS_ERR(panel->supply))
>  		return PTR_ERR(panel->supply);
>
> +	panel->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> +						    GPIOD_OUT_LOW);
> +	if (IS_ERR(panel->reset_gpio)) {
> +		err = PTR_ERR(panel->reset_gpio);
> +		if (err != -EPROBE_DEFER)
> +			dev_err(dev, "failed to request reset pin: %d\n", err);
> +		return err;
> +	}
> +

However, I'm wondering if it wouldn't be better to just have the
device maintained in reset at probe (so OUT_HIGH) and moved out of
reset during either the prepare or enable callbacks.

This is pretty much what is happening with the enable-gpios already.

Also, panels usually need to wait for a minimum time after you
deassert the reset line. How is that dealt with?

I guess a good way to do that would be to add that duration to the
panel description, since this is pretty much device specific.

Thanks!
Maxime

--ldeuyceeyd3l6v6w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfeBRwAKCRDj7w1vZxhR
xUyrAQCxDBISeuwG0Hd9mE8A6cHdq7RlzWA4XYPeebic7OuEsAD9FPpgs1cdb8Sj
vpa5jfHamjvrKF2+oxkeD52MZj+4CAk=
=Risq
-----END PGP SIGNATURE-----

--ldeuyceeyd3l6v6w--

--===============1697397715==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1697397715==--
