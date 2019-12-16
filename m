Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C52581228CD
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 11:32:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC1636E982;
	Tue, 17 Dec 2019 10:31:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05106E528
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 13:27:35 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 2C7A321F76;
 Mon, 16 Dec 2019 08:27:35 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 16 Dec 2019 08:27:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=vv0cBvBFoRPLnCCmbGbJAznLlTZ
 rJGyQV/I/P2ovABc=; b=Njzon8JXRBIj4mJFvWZZ1LZMp/8CZ/GKrV2hbB1sv6g
 Ch0qkBschFcqnAGW/vdpoLkbMbXtnqxOTZO9qiNh7W4wwSnG5KVeIfXcJL8RQcWz
 cQdS0tVhD1GcNMiwN0ve6Pe0iu8GW8mLzKduRlYM6CF3aDd6GgdxhH6Vh+b5Fv+v
 81KCQz776Psa1lrv8g2m6fhlC6V3km2D23c52TlVTGZ9BzKk+eu61Y4ur5mSPsFD
 9HdATwrDXdarj3WMbDz2QP56VO2SDiD9PtatnErNedhfggyDwvBdgzY5cI5qDHGC
 AxWrQTyXijvYoaMZO8VinMhWElLOtP950oYo9ZseUBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=vv0cBv
 BFoRPLnCCmbGbJAznLlTZrJGyQV/I/P2ovABc=; b=mfopSM1409l1jfEpQlhpgd
 dqsZsbd/xJb1BNLTmLO/HNID0IhXZsOAdrSUFUotahmdINhbOlHoa8nIbPU1ARHz
 Z3qLVTZs+GVl1VNIOeMcGILdhSdimVWto1hneDhvKSxxHOKmnf2GZvDJUlY6SaQO
 ETPow+yOrh4BtsokEXgkOjtKTHzgNiPRDSVOX//e8Q1y3QvzUSNAmNdj4G7Wievn
 73iPLbE/aM4XMecBXKogWIJ0VrcswMXtExoxlJgGHCHpAJCk8cTsjZF6qUkj+KuG
 ZESoPr98QZIQmx+mrv+L7xa0oOyHZPml/AhEcEi4fVGFHwLD9M6yXZR+au5po+uw
 ==
X-ME-Sender: <xms:Rob3Xby5SjtAWxjuHXWlkfVtVLFDuBJv6E3SJNlDbYZF1MjsrI4wKQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddthedgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggv
 rhhnohdrthgvtghhnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:Rob3XcCTfYF7whwcdpJwhlKqgGZjwajisi9VOGFLU43ZU_rRPvpIIw>
 <xmx:Rob3XaxpgRkGwly2W9FtLi6iwlg4KJYiD87ZCKv8TzM84uKAFNABrw>
 <xmx:Rob3XZMOg88EFAtYB35ctA6BLaRcLSZZjsWK1EJR0SJ6h-pIFyKf8w>
 <xmx:R4b3XcPpwnn0KG-ryDxEBObllEKfx4VI5TpRnIE5XUPJ5ZAVpuKQMw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D37438005A;
 Mon, 16 Dec 2019 08:27:33 -0500 (EST)
Date: Mon, 16 Dec 2019 14:27:32 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] drm/panel: simple: Support reset GPIOs
Message-ID: <20191216132732.mmqivmpnq4mio6oo@gilmour.lan>
References: <20191213181325.26228-1-miquel.raynal@bootlin.com>
 <20191216130615.qs6ub7bwqofwvhr7@gilmour.lan>
 <20191216141036.24c22899@xps13>
MIME-Version: 1.0
In-Reply-To: <20191216141036.24c22899@xps13>
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
Content-Type: multipart/mixed; boundary="===============1920337747=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1920337747==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kwxfyowjuyfgppel"
Content-Disposition: inline


--kwxfyowjuyfgppel
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2019 at 02:10:36PM +0100, Miquel Raynal wrote:
> > >  drivers/gpu/drm/panel/panel-simple.c | 12 +++++++++++-
> > >  1 file changed, 11 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/p=
anel/panel-simple.c
> > > index 5d487686d25c..15dd495c347d 100644
> > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > @@ -110,6 +110,7 @@ struct panel_simple {
> > >  	struct i2c_adapter *ddc;
> > >
> > >  	struct gpio_desc *enable_gpio;
> > > +	struct gpio_desc *reset_gpio;
> > >
> > >  	struct drm_display_mode override_mode;
> > >  };
> > > @@ -433,12 +434,21 @@ static int panel_simple_probe(struct device *de=
v, const struct panel_desc *desc)
> > >  	if (IS_ERR(panel->supply))
> > >  		return PTR_ERR(panel->supply);
> > >
> > > +	panel->reset_gpio =3D devm_gpiod_get_optional(dev, "reset",
> > > +						    GPIOD_OUT_LOW);
> > > +	if (IS_ERR(panel->reset_gpio)) {
> > > +		err =3D PTR_ERR(panel->reset_gpio);
> > > +		if (err !=3D -EPROBE_DEFER)
> > > +			dev_err(dev, "failed to request reset pin: %d\n", err);
> > > +		return err;
> > > +	}
> > > +
> >
> > However, I'm wondering if it wouldn't be better to just have the
> > device maintained in reset at probe (so OUT_HIGH) and moved out of
> > reset during either the prepare or enable callbacks.
> >
> > This is pretty much what is happening with the enable-gpios already.
> >
> > Also, panels usually need to wait for a minimum time after you
> > deassert the reset line. How is that dealt with?
> >
> > I guess a good way to do that would be to add that duration to the
> > panel description, since this is pretty much device specific.
>
> What about the case were your Bootloader displays something and you
> don't want the panel to blink ?

The Bootloader to Linux transition will make the panel blink already,
since the display engine is going to be reset / reconfigured during
the transition.

The only way to implement this would be to implement properly the
reset callbacks in all you display drivers to recreate the DRM state
=66rom the hardware state, and then you'll be able to just switch to the
new buffer.

Only Intel does this at the time though, and that's way outside of the
scope of this patch...

> Right now I am just forcing the reset to be deasserted.

=2E.. Especially since the very next line after your patch forces the
panel to be disabled.

Maxime

--kwxfyowjuyfgppel
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfeGRAAKCRDj7w1vZxhR
xSGDAP4og9czlx+KWRZm3+mSCvRv4xrvLPiX2B4xLVW2HkgTTwEAvW2mbTSnZSUw
A5bWKJIjtq3ceuEXGJEqpiEr8ZJerwk=
=G0Ls
-----END PGP SIGNATURE-----

--kwxfyowjuyfgppel--

--===============1920337747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1920337747==--
