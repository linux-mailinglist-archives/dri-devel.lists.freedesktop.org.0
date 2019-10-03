Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 555ECC9DAC
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 13:46:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D78D6E9A8;
	Thu,  3 Oct 2019 11:46:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6C156E9A8
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 11:46:39 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 219D02070B;
 Thu,  3 Oct 2019 11:46:38 +0000 (UTC)
Date: Thu, 3 Oct 2019 13:46:37 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v11 5/7] drm/sun4i: sun6i_mipi_dsi: Add VCC-DSI regulator
 support
Message-ID: <20191003114637.qd723p4jviwbns26@gilmour>
References: <20191003064527.15128-1-jagan@amarulasolutions.com>
 <20191003064527.15128-6-jagan@amarulasolutions.com>
 <CAGb2v64RJeHXSDknPvH3RrDLqPzSvR-p2k2vA73Zt1xsOd5TSw@mail.gmail.com>
 <CAMty3ZBmY+wZ4MZD1ipjnfhVy3gBRCqsAXGqF79mo+eaX=L2fA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMty3ZBmY+wZ4MZD1ipjnfhVy3gBRCqsAXGqF79mo+eaX=L2fA@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570103199;
 bh=rZXyTCe8Ve7vHC9DAOD50UwJrWsPWN27OLElnsbF2ak=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fk9TfOQdKkrfXA+BV72LZAo2ee2u/I18By1yu0xrL3XqvxyZjSzev1gLHO9UUztUu
 6NIe7cp3hszcjq6mMOIgl4++kDKGi7oJEcY1Iy7Fx2FawPbfs9RVn3LDu2TFYf1Ky8
 j0SbtjERUcdTGZg6ppk9VV0F1amb0UDG6Ku7c2RQ=
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
Cc: devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: multipart/mixed; boundary="===============1550559876=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1550559876==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sioambykdk554e5i"
Content-Disposition: inline


--sioambykdk554e5i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 03, 2019 at 12:31:31PM +0530, Jagan Teki wrote:
> On Thu, Oct 3, 2019 at 12:26 PM Chen-Yu Tsai <wens@csie.org> wrote:
> >
> > On Thu, Oct 3, 2019 at 2:46 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > >
> > > Allwinner MIPI DSI controllers are supplied with SoC
> > > DSI power rails via VCC-DSI pin.
> > >
> > > Add support for this supply pin by adding voltage
> > > regulator handling code to MIPI DSI driver.
> > >
> > > Tested-by: Merlijn Wajer <merlijn@wizzup.org>
> > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > ---
> > >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 14 ++++++++++++++
> > >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |  2 ++
> > >  2 files changed, 16 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > > index 446dc56cc44b..fe9a3667f3a1 100644
> > > --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > > +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > > @@ -1110,6 +1110,12 @@ static int sun6i_dsi_probe(struct platform_device *pdev)
> > >                 return PTR_ERR(base);
> > >         }
> > >
> > > +       dsi->regulator = devm_regulator_get(dev, "vcc-dsi");
> > > +       if (IS_ERR(dsi->regulator)) {
> > > +               dev_err(dev, "Couldn't get VCC-DSI supply\n");
> > > +               return PTR_ERR(dsi->regulator);
> > > +       }
> > > +
> > >         dsi->regs = devm_regmap_init_mmio_clk(dev, "bus", base,
> > >                                               &sun6i_dsi_regmap_config);
> > >         if (IS_ERR(dsi->regs)) {
> > > @@ -1183,6 +1189,13 @@ static int sun6i_dsi_remove(struct platform_device *pdev)
> > >  static int __maybe_unused sun6i_dsi_runtime_resume(struct device *dev)
> > >  {
> > >         struct sun6i_dsi *dsi = dev_get_drvdata(dev);
> > > +       int err;
> > > +
> > > +       err = regulator_enable(dsi->regulator);
> > > +       if (err) {
> > > +               dev_err(dsi->dev, "failed to enable VCC-DSI supply: %d\n", err);
> > > +               return err;
> > > +       }
> > >
> > >         reset_control_deassert(dsi->reset);
> > >         clk_prepare_enable(dsi->mod_clk);
> > > @@ -1215,6 +1228,7 @@ static int __maybe_unused sun6i_dsi_runtime_suspend(struct device *dev)
> > >
> > >         clk_disable_unprepare(dsi->mod_clk);
> > >         reset_control_assert(dsi->reset);
> > > +       regulator_disable(dsi->regulator);
> > >
> > >         return 0;
> > >  }
> > > diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> > > index 5c3ad5be0690..a01d44e9e461 100644
> > > --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> > > +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> > > @@ -12,6 +12,7 @@
> > >  #include <drm/drm_connector.h>
> > >  #include <drm/drm_encoder.h>
> > >  #include <drm/drm_mipi_dsi.h>
> > > +#include <linux/regulator/consumer.h>
> >
> > You don't need to include the header file since you are only
> > including a pointer to the struct, and nothing else.
>
> Yes, make sense. I will drop it.
>
> >
> > Otherwise,
> >
> > Reviewed-by: Chen-Yu Tsai <wens@csie.org>
>
> thanks.

I've moved the include to the driver that was lacking it while
applying, thanks!

Maxime

--sioambykdk554e5i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXZXfnQAKCRDj7w1vZxhR
xdo1AP9qbRxlDAMsATrfD1TcpRGv8AL/+bvjh0JOK0bF9TnEsAD/cPQeOM7j0eND
SGuUJnDS/wwejedPPPjCzS3+gawyeQo=
=fbpL
-----END PGP SIGNATURE-----

--sioambykdk554e5i--

--===============1550559876==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1550559876==--
