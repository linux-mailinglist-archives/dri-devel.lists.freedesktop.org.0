Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D50E81516C1
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 09:08:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B16F26EDD3;
	Tue,  4 Feb 2020 08:08:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5648B6E323
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2020 12:23:34 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 5C70677F;
 Mon,  3 Feb 2020 07:23:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 03 Feb 2020 07:23:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=mK5GRvMA6OUDoG2czNoAx6gpqcM
 IiYNtIFDTy+GwdtA=; b=krt68/O4eS+hXbPUoQNMUGLZE0YG23MSyhZrBmCY8YH
 k+ut/AKHHKapO6RMewDROM9/XDqTjEsA9rCdtw+NRkMXVRR5iXMVj7R1r/2OZETh
 1ggYYGMpjo/LvgByLYJQmuoAOdqSRiisZk0nnHSZZvFh4NI9HkOdSm6Lbu2aZY2t
 Q9sK/V+QPbx0Vfk2K+MDPmAGKwy016w2i1i9gFne7l0fdUS6sz1NTlYWJGNnc51Z
 D4X+SmikI92MewdExBbPGZJXzYSQNQ5bbPDh3iE3Pf/slRIyHCTI4SlQfMeUapLq
 YAhIkF5obLki6wO/OHzdOg3DsLqOEbytLQhMLtPgNRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=mK5GRv
 MA6OUDoG2czNoAx6gpqcMIiYNtIFDTy+GwdtA=; b=tXTcfqdNu5grN+uQaNB053
 DOK96ZgPPwapBCsP82XtlqVoIGkhB1KQRhpzXKX0fgLN9fEjWb7FBtiuF4i+GfIb
 WrqFo5gAWpWdW3D3g149oJPA5UOqcFWdilwrGkGcz29ud3jz327gw6HQhu6/u0Ww
 3M+5lT0wBJdSU1WyphxQ/UGK+/qjf/dc9TePaWOIhQPupkil3OaZTtxe4OFOI1p8
 b4mmlj20Se0G/NjFb/gDUlMQRLSNMOxfU50AmsBM6lMU/DLznm6ntb2fQd4ZLbEm
 /ENpshOWwCagb8SrOnElNnCXDoHzQXEGf4+Hd23zPTRGAJteSZLkye4AclUFc2DQ
 ==
X-ME-Sender: <xms:wRA4Xt27TgAGyDexAd-cK8HZF69HRne4pP5OInIOYFAEDuk3GacaQA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrgeejgdefkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucffohhmrghinh
 epsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrieekrdejieenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrh
 hnohdrthgvtghh
X-ME-Proxy: <xmx:wRA4XujZSucYxluqlAxtlUQeR4R-dWzAIQAUl8bQC5-f9brEBuZNYw>
 <xmx:wRA4XuVlru235DfEwyWpXyi4rwSgz7vcgoCxbH1U1oODHoCDzx-Tcw>
 <xmx:wRA4XtDaMZza1bdRRFSwwXQ2cx7WHjCOVl13HBqcr65LJGJ6IghKew>
 <xmx:wxA4XtCUfrxeJgghef7tzHaq9ZspKYVKe-5GpWdfGk8oZDtyvN_TwQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3087D3280060;
 Mon,  3 Feb 2020 07:23:29 -0500 (EST)
Date: Mon, 3 Feb 2020 13:23:27 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Mavrodiev <stefan@olimex.com>
Subject: Re: [PATCH v3 1/1] drm: sun4i: hdmi: Add support for sun4i HDMI
 encoder audio
Message-ID: <20200203122327.fviddfbkfn2bgycn@gilmour.lan>
References: <20200128140642.8404-1-stefan@olimex.com>
 <20200128140642.8404-2-stefan@olimex.com>
 <20200129164321.34mornbi3xvx5dys@gilmour.lan>
 <64676a4b-e149-146c-81b4-7fd5e792efc5@olimex.com>
MIME-Version: 1.0
In-Reply-To: <64676a4b-e149-146c-81b4-7fd5e792efc5@olimex.com>
X-Mailman-Approved-At: Tue, 04 Feb 2020 08:08:21 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-sunxi@googlegroups.com,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 Chen-Yu Tsai <wens@csie.org>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============1179253038=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1179253038==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="us6nvolmdwutyb6n"
Content-Disposition: inline


--us6nvolmdwutyb6n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, Jan 30, 2020 at 08:20:55AM +0200, Stefan Mavrodiev wrote:
> On 1/29/20 6:43 PM, Maxime Ripard wrote:
> > On Tue, Jan 28, 2020 at 04:06:42PM +0200, Stefan Mavrodiev wrote:
> > > diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> > > index 68d4644ac2dc..4cd35c97c503 100644
> > > --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> > > +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> > > @@ -23,6 +23,8 @@
> > >   #include <drm/drm_print.h>
> > >   #include <drm/drm_probe_helper.h>
> > >
> > > +#include <sound/soc.h>
> > > +
> > >   #include "sun4i_backend.h"
> > >   #include "sun4i_crtc.h"
> > >   #include "sun4i_drv.h"
> > > @@ -87,6 +89,10 @@ static void sun4i_hdmi_disable(struct drm_encoder *encoder)
> > >
> > >   	DRM_DEBUG_DRIVER("Disabling the HDMI Output\n");
> > >
> > > +#ifdef CONFIG_DRM_SUN4I_HDMI_AUDIO
> > > +	sun4i_hdmi_audio_destroy(hdmi);
> > > +#endif
> > > +
> > >   	val = readl(hdmi->base + SUN4I_HDMI_VID_CTRL_REG);
> > >   	val &= ~SUN4I_HDMI_VID_CTRL_ENABLE;
> > >   	writel(val, hdmi->base + SUN4I_HDMI_VID_CTRL_REG);
> > > @@ -114,6 +120,11 @@ static void sun4i_hdmi_enable(struct drm_encoder *encoder)
> > >   		val |= SUN4I_HDMI_VID_CTRL_HDMI_MODE;
> > >
> > >   	writel(val, hdmi->base + SUN4I_HDMI_VID_CTRL_REG);
> > > +
> > > +#ifdef CONFIG_DRM_SUN4I_HDMI_AUDIO
> > > +	if (hdmi->hdmi_audio && sun4i_hdmi_audio_create(hdmi))
> > > +		DRM_ERROR("Couldn't create the HDMI audio adapter\n");
> > > +#endif
> > I really don't think we should be creating / removing the audio card
> > at enable / disable time.
>
> For me it's unnatural to have sound card all the time, even when the HDMI
> is not plugged-in.

It's also a matter of being consistent: pretty much everyone else is
doing it:
  * vc4 (RaspberryPi)
    https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/vc4/vc4_hdmi.c#L1437

  * omap
    https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/omapdrm/dss/hdmi4.c#L620

  * sti
    https://elixir.bootlin.com/linux/v5.5.1/source/drivers/gpu/drm/sti/sti_hdmi.c#L1310

  * msm
    https://elixir.bootlin.com/linux/v5.5.1/source/drivers/gpu/drm/msm/hdmi/hdmi.c#L597

etc...

If we were to think about this at a more theorical level though, it's
pretty much the same case than having a sound card but no headphone
attached, or having a display engine but no display attached. In both
case, you register the driver before having a sink, you just let the
userspace know that there's nothing connected on the other end.

Maxime

--us6nvolmdwutyb6n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXjgQvwAKCRDj7w1vZxhR
xdqwAP90ShOJxBbtMrBiG8v3E0faJeHq3afqOhYkhGvBsaMulgEAiXnhh/hbOEYk
AIT/bNNWkq+0/C1clN/tSxpR02pJMwI=
=ubu/
-----END PGP SIGNATURE-----

--us6nvolmdwutyb6n--

--===============1179253038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1179253038==--
