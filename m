Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0101621BA
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 08:55:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D6A16E155;
	Tue, 18 Feb 2020 07:55:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 064946E06B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 17:51:42 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id DF5D1568;
 Mon, 17 Feb 2020 12:51:41 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 17 Feb 2020 12:51:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=3rFDvViY+O0Mipl0dXMR73dL45T
 ZFzCvzq7yeICJE7A=; b=md0FuuyIBy0rAJO2YFMDjsB6epTw+dAekyG2bcDuw2g
 OhpNQnqQ/bnm4Z4Xy0MC/YGOJCDtm6f02a82LLaF3EUaHck8I7VjnzOhitk1NDDw
 3v1NEPyOQY+NzLhJuc+gu8H/X3PLd7jWvdwXzsxYQ6pe6KfRFMzRtKp+rPk4z39n
 hx4fhfy1b8gGQEwUBswEj2Gz6JPqLyKG8wWebmN2dnaT0G4+VyaNf3b1KSuXCWQR
 Mp6emmwgH1xHJBI7atHLiw1NdXUgfdkIkJQJHoEU7vJHOIYgQhkjG2KXttKZOekz
 zTXl6c4SyOjWRz+cr132HMtVXqxB0Sm0ZtOVIdNazpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=3rFDvV
 iY+O0Mipl0dXMR73dL45TZFzCvzq7yeICJE7A=; b=KSNQQPta7i9YEHQ6fJvrrZ
 bFgV+bvq6puf7alg8hSEr6KrKtOVP1KBgpKiq9TsBaGifdW4TS+8I88oxxGqUpO5
 /qJwRloRWE5QLoicRbRXvD0k+4hBIgl7tIxRmy2Llm6WI06wO71MfPTddCNCUpAA
 INng8qCXE5BSgO276au115lcWFFnsNSekYGLPrxn5uyEp58w3hyz7niE+4bcLmBO
 VjykR6BJ9wPzi9f4ffnj91P68bDP1RmvRCwnYcpl65WRlpU7D/UEel0zeRyEs39O
 68CgZA9VDE8rDnuxn+wsGMlQnDkEr6iNhxyG6ljplHMmcNVua6qZgMhhUkd0F8WA
 ==
X-ME-Sender: <xms:qdJKXox1MobeNvBVQs5JQyh5PmZ7XuF-hC0KjYHeK1K4Kc1B0WTweg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeeigddutdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:qdJKXgCaiCFVClHRdB0QvtrVubYcoI-O-x0UuhQpJaBysFAYYQFW4A>
 <xmx:qdJKXjOezd7dCbgLcUy-v20s1HT-DRcM_ikyL0v1L33AeIg-U03Prg>
 <xmx:qdJKXuqUqdmVwvP6gxXbBYW_SI3rcBrclRf6gz7odQSVztly4BLOiw>
 <xmx:rdJKXrGpAJvMOcWqV5KsUf42WkUrNpPJJOzwrJc7L0Hog1QvhXkMWw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A9C573060EF2;
 Mon, 17 Feb 2020 12:51:37 -0500 (EST)
Date: Mon, 17 Feb 2020 18:51:35 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Andrey Lebedev <andrey.lebedev@gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: sun7i: dts: Add LVDS panel support on A20
Message-ID: <20200217175135.ldtqji4mrwz2wbn5@gilmour.lan>
References: <20200210195633.GA21832@kedthinkpad>
 <20200212222355.17141-2-andrey.lebedev@gmail.com>
 <20200213094304.hf3glhgmquypxpyf@gilmour.lan>
 <20200213200823.GA28336@kedthinkpad>
 <20200214075218.huxdhmd4qfoakat2@gilmour.lan>
 <20200214084358.GA25266@kedthinkpad>
 <20200214085351.2whnfyulrmyex2va@gilmour.lan>
 <20200214213231.GA6583@kedthinkpad>
MIME-Version: 1.0
In-Reply-To: <20200214213231.GA6583@kedthinkpad>
X-Mailman-Approved-At: Tue, 18 Feb 2020 07:55:25 +0000
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
Cc: airlied@linux.ie, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrey Lebedev <andrey@lebedev.lt>, wens@csie.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0127743196=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0127743196==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="y2rcdgs6xbzt4vvp"
Content-Disposition: inline


--y2rcdgs6xbzt4vvp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrey,

On Fri, Feb 14, 2020 at 11:32:31PM +0200, Andrey Lebedev wrote:
> On Fri, Feb 14, 2020 at 09:53:51AM +0100, Maxime Ripard wrote:
> > On Fri, Feb 14, 2020 at 10:43:58AM +0200, Andrey Lebedev wrote:
> > > On Fri, Feb 14, 2020 at 08:52:18AM +0100, Maxime Ripard wrote:
> > > > > > This will create a spurious warning message for TCON1, since we
> > > > > > adjusted the driver to tell it supports LVDS, but there's no LVDS
> > > > > > reset line, so we need to make it finer grained.
> > > > >
> > > > > Yes, I can attribute two of the messages in my dmesg log [1] to this
> > > > > ("Missing LVDS properties" and "LVDS output disabled". "sun4i-tcon
> > > > > 1c0d000.lcd-controller" is indeed tcon1). And yes, I can see how they
> > > > > can be confusing to someone.
> > > > >
> > > > > I'd need some pointers on how to deal with that though (if we want to do
> > > > > it in this scope).
> > > >
> > > > Like I was mentionning, you could introduce a new compatible for each
> > > > TCON (tcon0 and tcon1) and only set the support_lvds flag for tcon0
> > >
> > > Can you give me an idea how that compatible might look like?
> > >
> > > 		tcon0: lcd-controller@1c0c000 {
> > > 			compatible = "allwinner,sun7i-a20-tcon", "allwinner,lvds";
> > >
> > > or
> > >
> > > 		tcon0: lcd-controller@1c0c000 {
> > > 			compatible = "allwinner,sun7i-a20-tcon", "allwinner,tcon0";
> > >
> > > ? Or something completely different?
> >
> > Something like
> >
> > &tcon0 {
> >     compatible = "allwinner,sun7i-a20-tcon0", "allwinner,sun7i-a20-tcon";
> > };
> >
> > &tcon1 {
> >     compatible = "allwinner,sun7i-a20-tcon1", "allwinner,sun7i-a20-tcon";
> > };
> >
>
> Hi Maxime, here is what I came up with, please take a look. If the
> approach is right, I'll split it up and include into the patch set.
>
> From f3e45c958a9551a52ac26435785bdb572e54d8db Mon Sep 17 00:00:00 2001
> From: Andrey Lebedev <andrey@lebedev.lt>
> Date: Fri, 14 Feb 2020 23:21:59 +0200
> Subject: [PATCH] Mark tcon0 to be the only tcon capable of LVDS on sun7i-a20
>
> This allows to avoid warnings about reset line not provided for tcon1.
>
> Signed-off-by: Andrey Lebedev <andrey@lebedev.lt>
> ---
>  arch/arm/boot/dts/sun7i-a20.dtsi   |  2 +-
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 22 +++++++++++++++++++++-
>  drivers/gpu/drm/sun4i/sun4i_tcon.h |  2 ++
>  3 files changed, 24 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
> index 3b3c366a2bee..bab59fc4d9b1 100644
> --- a/arch/arm/boot/dts/sun7i-a20.dtsi
> +++ b/arch/arm/boot/dts/sun7i-a20.dtsi
> @@ -405,7 +405,7 @@
>  		};
>
>  		tcon0: lcd-controller@1c0c000 {
> -			compatible = "allwinner,sun7i-a20-tcon";
> +			compatible = "allwinner,sun7i-a20-tcon0", "allwinner,sun7i-a20-tcon";

That's correct

>  			reg = <0x01c0c000 0x1000>;
>  			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
>  			resets = <&ccu RST_TCON0>, <&ccu RST_LVDS>;
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> index 800a9bd86112..cb2040aec436 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -1107,6 +1107,25 @@ static struct sunxi_engine *sun4i_tcon_find_engine(struct sun4i_drv *drv,
>  	return sun4i_tcon_find_engine_traverse(drv, node, 0);
>  }
>
> +/*
> + * Check if given tcon supports LVDS
> + *
> + * Some of the sunxi SoC variants contain several timing controllers, but only
> + * one of them can be used to drive LVDS screen. In this case such tcon is
> + * identified in respective quirks struct: lvds_compatible_tcon property will
> + * hold "compatible" string of the tcon, that supports LVDS.
> + *
> + * If lvds_compatible_tcon is not set, all tcons are considered capable of
> + * driving LVDS.
> + */
> +static bool sun4i_tcon_lvds_compat(struct device *dev, struct sun4i_tcon *tcon)
> +{
> +	if (tcon->quirks->lvds_compatible_tcon == NULL)
> +		return true;
> +	return of_device_is_compatible(dev->of_node,
> +	                               tcon->quirks->lvds_compatible_tcon);
> +}
> +
>  static int sun4i_tcon_bind(struct device *dev, struct device *master,
>  			   void *data)
>  {
> @@ -1161,7 +1180,7 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
>  		return ret;
>  	}
>
> -	if (tcon->quirks->supports_lvds) {
> +	if (tcon->quirks->supports_lvds && sun4i_tcon_lvds_compat(dev, tcon)) {
>  		/*
>  		 * This can only be made optional since we've had DT
>  		 * nodes without the LVDS reset properties.
> @@ -1481,6 +1500,7 @@ static const struct sun4i_tcon_quirks sun6i_a31s_quirks = {
>
>  static const struct sun4i_tcon_quirks sun7i_a20_quirks = {
>  	.supports_lvds		= true,
> +	.lvds_compatible_tcon	= "allwinner,sun7i-a20-tcon0",
>  	.has_channel_0		= true,
>  	.has_channel_1		= true,
>  	.dclk_min_div		= 4,
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.h b/drivers/gpu/drm/sun4i/sun4i_tcon.h
> index cfbf4e6c1679..bc87d28ee341 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.h
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.h
> @@ -235,6 +235,8 @@ struct sun4i_tcon_quirks {
>  	bool	needs_de_be_mux; /* sun6i needs mux to select backend */
>  	bool    needs_edp_reset; /* a80 edp reset needed for tcon0 access */
>  	bool	supports_lvds;   /* Does the TCON support an LVDS output? */
> +	/* "compatible" string of TCON that exclusively supports LVDS */
> +	const char *lvds_compatible_tcon;

However this is far more complicated than needed, you can simply add a
new quirks structure associated to the tcon0 compatible in
sun4i_tcon_of_table, and that will do

Maxime

--y2rcdgs6xbzt4vvp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXkrSpwAKCRDj7w1vZxhR
xdwfAQD7pudDUJX6HqY3G7NyOLWJjTgZsxHVOwRS5d0a3dhn1QD/RfVHYhbkkxhP
4PQVmxzPdewoSbq1VP9knAH9m/XKcAg=
=ghuQ
-----END PGP SIGNATURE-----

--y2rcdgs6xbzt4vvp--

--===============0127743196==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0127743196==--
