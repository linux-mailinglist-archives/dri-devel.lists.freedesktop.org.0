Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B5D2F2981
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 08:58:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 248226E102;
	Tue, 12 Jan 2021 07:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5DB89BC2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 17:20:58 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 71C3A580A41;
 Mon, 11 Jan 2021 12:20:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 11 Jan 2021 12:20:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=i4XX+K3NCCasnwy3kE4LR14yrBS
 4sQC0N/rn+i2cx68=; b=IrCHguv7glVthg8oI16lnZnbCbUmaIJLZ9GA79NVBSG
 T5YyE6d8aUflCJTw0rx4QIM4TTxfIjwPKYlF7iPeW4RHnbJnexiebCU+MFeoCNSG
 xcGfpNA/ftklD1QzSBdpGYdLb1ybMxumWp5OUpXAczDCtgbhdXTl//9Xn4Jn6toR
 qqX0A0cRGMQDReac9p/o5Rg6cpCw3pGdFChY5E48KDnxluVdao/9GyOaKum5GVKn
 0RvTlagymJiAF+l5qkuek9eG+PvlWHaZhCW8Yb8n6x6dFn9HUD6RkYLyH1L7Um4Y
 3962VAc8aQ4A/3AuT4UETklA5E5LAl5toFZjI3qKoBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=i4XX+K
 3NCCasnwy3kE4LR14yrBS4sQC0N/rn+i2cx68=; b=DZwUysumJVUtYuArJn0xWc
 J2A2iv8lI4Xp8q/giLNeQAEkSgkYYPGFK1ltJYitiYJcSJq7dSbrGU40OEsSbk10
 SPjwMB9XD6nf4i7RJtqLprGkvnMSfT+LM8P9Z+xhSOBEs88Cosikt/uwPLGUPJ1M
 +LffB1oC3s/q6okKOkcSxQqXZwkppNkgwg7C4C5cawI9k50zGrRCCvaAb3nD1w+P
 +k7cTDkF4Z3JRiPmBgrk7cl5y3SklvXt1Msq/Dsi29mQac/0mB75yPe4DmODEURr
 qzqlU1ajTd+gBHpoWW2ObQGcBnWvwYtcB6GsAgVxOifODOzkQNX3wJjFZmc0qZ8A
 ==
X-ME-Sender: <xms:9oj8X43ijKqRGe16eCpKjv5cu2qdTX77joql3F7_BsRtZ7PuY87ATA>
 <xme:9oj8X8vWFy2HCXid3WcsYA3ECctdq0g8H2-X8nkStSYRB3zAa8YQ5yYjC7NtqMKCq
 H-BN56P97yDRaMziHo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehuddguddttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduvdduhfekkeehgffftefflefgffdtheffudffgeevteffheeuiedvvdej
 vdfgveenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:94j8Xw7OFl0a7PKynZEkKfbX8uslVapxoqh6O1UiKjdGLrHBSsKM6A>
 <xmx:94j8X1JYPG23AGc1i7tju9463_pwmS61uh5Qvw9ebquomltIye2XTQ>
 <xmx:94j8X47KbSpUSQFebjg4jYaHeUSmb-IbChBV_WqbuiD0Yt6-8XZ9Dw>
 <xmx:-Ij8X3UPpv2zkz7nGbGZNQ8jD3fRyIo91GQRDVtkvN9IVMtvoKtUMw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id BFDD524005A;
 Mon, 11 Jan 2021 12:20:54 -0500 (EST)
Date: Mon, 11 Jan 2021 18:20:52 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: Re: [PATCH v2 2/2] drm/sun4i: tcon: improve DCLK polarity handling
Message-ID: <20210111172052.7v522xam74xkq6se@gilmour>
References: <3685133.SLcexNTYsu@kista>
 <20210107023032.560182-1-giulio.benetti@benettiengineering.com>
 <20210107023032.560182-3-giulio.benetti@benettiengineering.com>
 <20210108092355.7p5uakxt7lpdu3bn@gilmour>
 <35622307-5e88-a2ed-bdf9-fca6554efefc@benettiengineering.com>
MIME-Version: 1.0
In-Reply-To: <35622307-5e88-a2ed-bdf9-fca6554efefc@benettiengineering.com>
X-Mailman-Approved-At: Tue, 12 Jan 2021 07:57:10 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, treding@nvidia.com,
 Giulio Benetti <giulio.benetti@micronovasrl.com>,
 Marjan Pascolo <marjan.pascolo@trexom.it>
Content-Type: multipart/mixed; boundary="===============1886865796=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1886865796==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dwnwa7aczjwiyrub"
Content-Disposition: inline


--dwnwa7aczjwiyrub
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 08, 2021 at 03:34:52PM +0100, Giulio Benetti wrote:
> Hi,
>=20
> On 1/8/21 10:23 AM, Maxime Ripard wrote:
> > Hi,
> >=20
> > Thanks for those patches
> >=20
> > On Thu, Jan 07, 2021 at 03:30:32AM +0100, Giulio Benetti wrote:
> > > From: Giulio Benetti <giulio.benetti@micronovasrl.com>
> > >=20
> > > It turned out(Maxime suggestion) that bit 26 of SUN4I_TCON0_IO_POL_RE=
G is
> > > dedicated to invert DCLK polarity and this makes thing really easier =
than
> > > before. So let's handle DCLK polarity by adding
> > > SUN4I_TCON0_IO_POL_DCLK_POSITIVE as bit 26 and activating according to
> > > bus_flags the same way is done for all the other signals.
> > >=20
> > > Cc: Maxime Ripard <maxime@cerno.tech>
> >=20
> > Suggested-by would be nice here :)
>=20
> Ok, didn't know about this tag
>=20
> > > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> > > ---
> > >   drivers/gpu/drm/sun4i/sun4i_tcon.c | 20 +-------------------
> > >   drivers/gpu/drm/sun4i/sun4i_tcon.h |  1 +
> > >   2 files changed, 2 insertions(+), 19 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun=
4i/sun4i_tcon.c
> > > index 52598bb0fb0b..30171ccd87e5 100644
> > > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > @@ -569,26 +569,8 @@ static void sun4i_tcon0_mode_set_rgb(struct sun4=
i_tcon *tcon,
> > >   	if (info->bus_flags & DRM_BUS_FLAG_DE_LOW)
> > >   		val |=3D SUN4I_TCON0_IO_POL_DE_NEGATIVE;
> > > -	/*
> > > -	 * On A20 and similar SoCs, the only way to achieve Positive Edge
> > > -	 * (Rising Edge), is setting dclk clock phase to 2/3(240=B0).
> > > -	 * By default TCON works in Negative Edge(Falling Edge),
> > > -	 * this is why phase is set to 0 in that case.
> > > -	 * Unfortunately there's no way to logically invert dclk through
> > > -	 * IO_POL register.
> > > -	 * The only acceptable way to work, triple checked with scope,
> > > -	 * is using clock phase set to 0=B0 for Negative Edge and set to 24=
0=B0
> > > -	 * for Positive Edge.
> > > -	 * On A33 and similar SoCs there would be a 90=B0 phase option,
> > > -	 * but it divides also dclk by 2.
> > > -	 * Following code is a way to avoid quirks all around TCON
> > > -	 * and DOTCLOCK drivers.
> > > -	 */
> > >   	if (info->bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE)
> > > -		clk_set_phase(tcon->dclk, 0);
> > > -
> > > -	if (info->bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
> > > -		clk_set_phase(tcon->dclk, 240);
> > > +		val |=3D SUN4I_TCON0_IO_POL_DCLK_POSITIVE;
> >=20
> > I'm not really sure why we need the first patch of this series here?
>=20
> The idea was to have 2 for testing, 1st one is already applicable, while =
the
> other must be tested, but I can send only one with no problem.
>=20
> > That patch only seem to undo what you did in patch 1
>=20
> No, it doesn't, the 2nd one change the way it achieve the same thing,
> because the 1st swap DCLK phase, while the 2nd uses the IO_POL bit to set=
 IO
> polarity according to bus_flags.

It makes sense for testing, but I'm not sure we want to carry it into
the history. Can you squash them both into the same patch?

Thanks!
Maxime

--dwnwa7aczjwiyrub
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX/yI9AAKCRDj7w1vZxhR
xR/2AP9kLTtexnMjE/Qc9M6rou7TFet4B43BNcl8buWCDksPIwD/YuPWjrzXk1ea
ecUkdN8mM/sZ5S935kS2xTTNa0sGMAU=
=1raS
-----END PGP SIGNATURE-----

--dwnwa7aczjwiyrub--

--===============1886865796==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1886865796==--
