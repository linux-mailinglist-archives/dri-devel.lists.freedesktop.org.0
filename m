Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 956CD1089CB
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 09:08:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E3289F9F;
	Mon, 25 Nov 2019 08:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3FC56F547
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2019 18:18:26 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 202063998;
 Fri, 22 Nov 2019 13:18:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 22 Nov 2019 13:18:24 -0500
X-ME-Sender: <xms:bybYXctraIKC9Ia6PR9cXef2XF9PpJyM8T0BFKZAxq7idoCmZWXoHg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudehgedgudduudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujggfsehgtderredtredvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppe
 eltddrkeelrdeikedrjeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvges
 tggvrhhnohdrthgvtghhnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:bybYXT0v4144JRl8VXwXEAsfBCtRKNtlMwtcy3u9Ny2uO9d4LKcRBg>
 <xmx:bybYXTVsQZGE9Xzi43eQzNvHL1jtTuI4Ax86IGepDtNxqfFmA_Ah1Q>
 <xmx:bybYXZNrjqQYRuZ8AT6NUg6Fd1wrK0F0ac8HxpjrbW-lK7T2tP1Avw>
 <xmx:cCbYXcyRcR-gSTwuJWfp7f70EdyehoT-1yL1cc8P4nYlCYZCWI_jnA>
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 924C580061;
 Fri, 22 Nov 2019 13:18:22 -0500 (EST)
Date: Fri, 22 Nov 2019 19:18:20 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v11 4/7] drm/sun4i: dsi: Handle bus clock explicitly
Message-ID: <20191122181820.GQ4345@gilmour.lan>
References: <20191025175625.8011-1-jagan@amarulasolutions.com>
 <20191025175625.8011-5-jagan@amarulasolutions.com>
 <20191028153427.pc3tnoz2d23filhx@hendrix>
 <CAMty3ZCisTrFGjzHyqSofqFAsKSLV1n2xP5Li3Lonhdi0WUZVA@mail.gmail.com>
 <20191029085401.gvqpwmmpyml75vis@hendrix>
 <CAMty3ZAWPZSHtAZDf_0Dpx588YGGv3pJX1cXMfkZus3+WF94cA@mail.gmail.com>
 <20191103173227.GF7001@gilmour>
 <CAMty3ZD5uxU=xb0z7PWaXzodYbWRJkP9HjGX-HZYFT4bwk0GOg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMty3ZD5uxU=xb0z7PWaXzodYbWRJkP9HjGX-HZYFT4bwk0GOg@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Mon, 25 Nov 2019 08:07:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=9N1i6sM3HCy/tNUXBVN7iRT2F5Y
 r7eksrFzwBiYgpho=; b=nh2sZuFYIt8yPQNDtUg558rh4e2QQvCiHerjNYwzgv4
 LqLpSGFkFJPX5uQKmD6n2pjOVqW/a9WVdtdv6kGEarEceQFrClDpdkuts24xd2Lp
 mdMjaR8heQiRnkjZCAfV3T8HkkV9fkQDUW6J6LxWRI0zGMczNR2/IrEWut/9HSBd
 Nzr5VQUcLWJEtjeWGShw/tASVnXZjrBb9AzRmLdxwFrKNTe7UmQPurP+x+Z4agDP
 bTdiX9sNRiaU3DI+Y4wn1RwsOJOQ0qrZFOQac0B1cAO4OTyqYT/2VuWpBenzeH8J
 QK8k8SLgKkSuRuA1LVysrruQbBx1Sv0x2t/R6j8zBbw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=9N1i6s
 M3HCy/tNUXBVN7iRT2F5Yr7eksrFzwBiYgpho=; b=tUlRfaSe7dnWGjC/4oqkwU
 DnVPoFdhTAooLtwcBlcr9LoDIrmqoc+PXvsEXLvUh3fLsbmVYjgGb4GTd4N78MES
 KHH+QuqWR+8MFDc5lCY5XcMc1JCpn8pWJDAvo4IeL3/VEjUOdOQHKrdDTLBZNzGb
 MD4swZ7Q26NKS0ccl/mk62jqCdpm3zFqQhkEFEIyETMKpTkcOTcxmGJdoN1gKHgP
 jdJkcRQQydp4CvXHIUb5dW2SiG5gaVSAO5/w9c21O4x2IPFvzdxZLtWeCj9Ax0Ga
 rln+OiPE3vNu6fpl5r6R55X/pCRJP5e51QZs5ZEaknCoh8fI5RqtXuizScfQT6CA
 ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Rob Herring <robh+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: multipart/mixed; boundary="===============0561519969=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0561519969==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qerVZHYPvsyvugus"
Content-Disposition: inline


--qerVZHYPvsyvugus
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, Nov 21, 2019 at 05:24:47PM +0530, Jagan Teki wrote:
> On Sun, Nov 3, 2019 at 11:02 PM Maxime Ripard <mripard@kernel.org> wrote:
> >
> > On Fri, Nov 01, 2019 at 07:42:55PM +0530, Jagan Teki wrote:
> > > Hi Maxime,
> > >
> > > On Tue, Oct 29, 2019 at 2:24 PM Maxime Ripard <mripard@kernel.org> wrote:
> > > >
> > > > On Tue, Oct 29, 2019 at 04:03:56AM +0530, Jagan Teki wrote:
> > > > > > > explicit handling of common clock would require since the A64
> > > > > > > doesn't need to mention the clock-names explicitly in dts since it
> > > > > > > support only one bus clock.
> > > > > > >
> > > > > > > Also pass clk_id NULL instead "bus" to regmap clock init function
> > > > > > > since the single clock variants no need to mention clock-names
> > > > > > > explicitly.
> > > > > >
> > > > > > You don't need explicit clock handling. Passing NULL as the argument
> > > > > > in regmap_init_mmio_clk will make it use the first clock, which is the
> > > > > > bus clock.
> > > > >
> > > > > Indeed I tried that, since NULL clk_id wouldn't enable the bus clock
> > > > > during regmap_mmio_gen_context code, passing NULL triggering vblank
> > > > > timeout.
> > > >
> > > > There's a bunch of users of NULL in tree, so finding out why NULL
> > > > doesn't work is the way forward.
> > >
> > > I'd have looked the some of the users before checking the code as
> > > well. As I said passing NULL clk_id to devm_regmap_init_mmio_clk =>
> > > __devm_regmap_init_mmio_clk would return before processing the clock.
> > >
> > > Here is the code snippet on the tree just to make sure I'm on the same
> > > page or not.
> > >
> > > static struct regmap_mmio_context *regmap_mmio_gen_context(struct device *dev,
> > >                                         const char *clk_id,
> > >                                         void __iomem *regs,
> > >                                         const struct regmap_config *config)
> > > {
> > >         -----------------------
> > >         --------------
> > >         if (clk_id == NULL)
> > >                 return ctx;
> > >
> > >         ctx->clk = clk_get(dev, clk_id);
> > >         if (IS_ERR(ctx->clk)) {
> > >                 ret = PTR_ERR(ctx->clk);
> > >                 goto err_free;
> > >         }
> > >
> > >         ret = clk_prepare(ctx->clk);
> > >         if (ret < 0) {
> > >                 clk_put(ctx->clk);
> > >                 goto err_free;
> > >         }
> > >         -------------
> > >         ---------------
> > > }
> > >
> > > Yes, I did check on the driver in the tree before committing explicit
> > > clock handle, which make similar requirements like us in [1]. this
> > > imx2 wdt driver is handling the explicit clock as well. I'm sure this
> > > driver is updated as I have seen few changes related to this driver in
> > > ML.
> >
> > I guess we have two ways to go at this then.
> >
> > Either we remove the return, but it might have a few side-effects, or
> > we call clk_get with NULL or bus depending on the case, and then call
> > regmap_mmio_attach_clk.
>
> Thanks for the inputs.
>
> Please have a look at this snippet, I have used your second
> suggestions. let me know if you have any comments?
>
> diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> index 8fa90cfc2ac8..91c95e56d870 100644
> --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> @@ -1109,24 +1109,36 @@ static int sun6i_dsi_probe(struct platform_device *pdev)
>          return PTR_ERR(dsi->regulator);
>      }
>
> -    dsi->regs = devm_regmap_init_mmio_clk(dev, "bus", base,
> -                          &sun6i_dsi_regmap_config);
> -    if (IS_ERR(dsi->regs)) {
> -        dev_err(dev, "Couldn't create the DSI encoder regmap\n");
> -        return PTR_ERR(dsi->regs);
> -    }
> -
>      dsi->reset = devm_reset_control_get_shared(dev, NULL);
>      if (IS_ERR(dsi->reset)) {
>          dev_err(dev, "Couldn't get our reset line\n");
>          return PTR_ERR(dsi->reset);
>      }
>
> +    dsi->regs = regmap_init_mmio(dev, base, &sun6i_dsi_regmap_config);

You should use the devm variant here

> +    if (IS_ERR(dsi->regs)) {
> +        dev_err(dev, "Couldn't init regmap\n");
> +        return PTR_ERR(dsi->regs);
> +    }
> +
> +    dsi->bus_clk = devm_clk_get(dev, NULL);

I guess you still need to pass 'bus' here?

> +    if (IS_ERR(dsi->bus_clk)) {
> +        dev_err(dev, "Couldn't get the DSI bus clock\n");
> +        ret = PTR_ERR(dsi->bus_clk);
> +        goto err_regmap;
> +    } else {
> +        printk("Jagan.. Got the BUS clock\n");
> +        ret = regmap_mmio_attach_clk(dsi->regs, dsi->bus_clk);
> +        if (ret)
> +            goto err_bus_clk;
> +    }
> +
>      if (dsi->variant->has_mod_clk) {
>          dsi->mod_clk = devm_clk_get(dev, "mod");
>          if (IS_ERR(dsi->mod_clk)) {
>              dev_err(dev, "Couldn't get the DSI mod clock\n");
> -            return PTR_ERR(dsi->mod_clk);
> +            ret = PTR_ERR(dsi->mod_clk);
> +            goto err_attach_clk;
>          }
>      }
>
> @@ -1167,6 +1179,14 @@ static int sun6i_dsi_probe(struct platform_device *pdev)
>  err_unprotect_clk:
>      if (dsi->variant->has_mod_clk)
>          clk_rate_exclusive_put(dsi->mod_clk);
> +err_attach_clk:
> +    if (!IS_ERR(dsi->bus_clk))
> +        regmap_mmio_detach_clk(dsi->regs);
> +err_bus_clk:
> +    if (!IS_ERR(dsi->bus_clk))
> +        clk_put(dsi->bus_clk);
> +err_regmap:
> +    regmap_exit(dsi->regs);
>      return ret;
>  }
>
> @@ -1181,6 +1201,13 @@ static int sun6i_dsi_remove(struct platform_device *pdev)
>      if (dsi->variant->has_mod_clk)
>          clk_rate_exclusive_put(dsi->mod_clk);
>
> +    if (!IS_ERR(dsi->bus_clk)) {
> +        regmap_mmio_detach_clk(dsi->regs);
> +        clk_put(dsi->bus_clk);

This will trigger a warning, you put down the reference twice

Maxime

--qerVZHYPvsyvugus
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXdgmbAAKCRDj7w1vZxhR
xXAPAQCiQx8necDbZpLfsv/R7X/EGLZepkaO/cE23lMNJwmGIAD9FSP48+7pcnm3
HhzifgMtZzRSaH/EgCQpjsJg+5eqUwc=
=GeTa
-----END PGP SIGNATURE-----

--qerVZHYPvsyvugus--

--===============0561519969==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0561519969==--
