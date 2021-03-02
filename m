Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38385329FB0
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 14:02:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91AC06E946;
	Tue,  2 Mar 2021 13:02:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492686E946
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 13:02:03 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 5D13C1567;
 Tue,  2 Mar 2021 08:01:59 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 02 Mar 2021 08:02:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=ajDOHIs7PrsnoOxDSoNdPYVxAY+
 jGqYKSXGZSoMAoRM=; b=r8jcLXVDyx/+/6LiwyQgTxxjTq0oJkkTzirgS68iMg9
 gsrYMUCJJaGrM5akndwR938myEUx+Xkon6uPwHSJ96c+mSqyWI/4GzjstU9mcEIW
 xDTqmE7etct+XEFzhV7WkkSJsbCQE/m/EU9NrkPa2/UVkGJKoVQOftSonhLTF/iN
 YOIr9avODjpx4o+cV7ViDDyYX9LkEI/uO+35gdYwCgi15YJJs3z3bc9VI296sYGL
 LuiuxrE7Uo6ZndAlMlWZsovPlME1ZbdTuUmAZycYiaGxxGi94iOP+aYnMGlBkr2P
 aDk3SAj0RdCLtEMNRQVB4gDWhi9yQBN2jxf3e4ZQsvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ajDOHI
 s7PrsnoOxDSoNdPYVxAY+jGqYKSXGZSoMAoRM=; b=cwPU1gclDgj/CDz8VOE+mm
 gomqjZoPYg4xzDh0W9IUrqPIO9K4LWUjzSJQ1HhiSotbv4XQyhDuBQdXYIWgEymt
 dCU+r9QkGH2OTPCDFkN+7hJqSBsuZH1SZZ1IwT+cgCQ2ith4RnkFNju/qC02phuw
 TPraM0oOL6RBwbXFNtCvD0JJdbpyjRT7B1Qo0NovhL51o0jEUWAE1k7+fBCVjCaD
 JMjUQ90+QCQsioK6m9pTAJ8FfycsQLKsig0RIsx2wwU/QMV1nYqCXJ5nfqwfjhvn
 Xc3xdu+HKDK5Tiz7iJaD25mPFXTp3ga5UsofYO3sX3YcXhSQOUSNuM3fcIISJaXg
 ==
X-ME-Sender: <xms:RTc-YA0jcz6mMAJFvqwMTkPp1lAWKTYOUVz9l5GIQ0_Bu7uNcuokbA>
 <xme:RTc-YPaFFzxNAWdx341D28NdGxpOrdDa2JEgABHFQX7dF1u3OkLyVXKwrLFQVSnoC
 IbnwUSwu6NHXdGKedQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddttddggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:RTc-YIDAu2bSMXZfpSRBjAxXb3Ts_uR4j4rv0is9GXjYAcVMFJRNdQ>
 <xmx:RTc-YB_utZTy1PX4cU5cVmpG_zJuG87UcWxKhrnYcqdWASCTOerXhA>
 <xmx:RTc-YI9FeGAfBbrO6yNmrtKhPeLZQBHW17OZ4bR1Yw3Jna9QmHlMaA>
 <xmx:Rjc-YJQgJYgjtSeXPIRycB9m_YUgGjQ8l7xoFuMSo2TucfKDqxyjk4B-U7A>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1B7E5108005F;
 Tue,  2 Mar 2021 08:01:57 -0500 (EST)
Date: Tue, 2 Mar 2021 14:01:54 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 4/8] drm/vc4: hdmi: Check and warn if we can't reach
 4kp60 frequencies
Message-ID: <20210302130154.o4ljnzqjr3gfsvpn@gilmour>
References: <20210225155909.1853812-1-maxime@cerno.tech>
 <20210225155909.1853812-5-maxime@cerno.tech>
 <CAPY8ntDwQG1Ax8wgc2zZMKZgXk2+efBtFFiu7YF=_RX4Y4YUiA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPY8ntDwQG1Ax8wgc2zZMKZgXk2+efBtFFiu7YF=_RX4Y4YUiA@mail.gmail.com>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, Stephen Boyd <sboyd@kernel.org>,
 Mike Turquette <mturquette@baylibre.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Phil Elwell <phil@raspberrypi.com>, David Airlie <airlied@linux.ie>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-clk@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: multipart/mixed; boundary="===============0381541491=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0381541491==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pfy2jknigh37joze"
Content-Disposition: inline


--pfy2jknigh37joze
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Thanks for your review

On Thu, Feb 25, 2021 at 04:38:37PM +0000, Dave Stevenson wrote:
> On Thu, 25 Feb 2021 at 15:59, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > In order to reach the frequencies needed to output at 594MHz, the
> > firmware needs to be configured with the appropriate parameters in the
> > config.txt file (enable_hdmi_4kp60 and force_turbo).
>=20
> force_turbo isn't the right way to go about this as it permanently
> bumps all the clocks up, even if running the display at VGA.

so enable_hdmi_4kp60 is enough?=20

> > Let's detect it at bind time, warn the user if we can't, and filter out
> > the relevant modes.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  drivers/gpu/drm/vc4/vc4_hdmi.c | 17 +++++++++++++++++
> >  drivers/gpu/drm/vc4/vc4_hdmi.h |  8 ++++++++
> >  2 files changed, 25 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_h=
dmi.c
> > index b5bc742993a4..f05f6da286f7 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -953,6 +953,9 @@ static int vc4_hdmi_encoder_atomic_check(struct drm=
_encoder *encoder,
> >         if (pixel_rate > vc4_hdmi->variant->max_pixel_clock)
> >                 return -EINVAL;
> >
> > +       if (vc4_hdmi->disable_4kp60 && (pixel_rate > HDMI_14_MAX_TMDS_C=
LK))
> > +               return -EINVAL;
> > +
> >         vc4_state->pixel_rate =3D pixel_rate;
> >
> >         return 0;
> > @@ -972,6 +975,9 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *enc=
oder,
> >         if ((mode->clock * 1000) > vc4_hdmi->variant->max_pixel_clock)
> >                 return MODE_CLOCK_HIGH;
> >
> > +       if (vc4_hdmi->disable_4kp60 && ((mode->clock * 1000) > HDMI_14_=
MAX_TMDS_CLK))
> > +               return MODE_CLOCK_HIGH;
> > +
> >         return MODE_OK;
> >  }
> >
> > @@ -1986,6 +1992,17 @@ static int vc4_hdmi_bind(struct device *dev, str=
uct device *master, void *data)
> >         vc4_hdmi->disable_wifi_frequencies =3D
> >                 of_property_read_bool(dev->of_node, "wifi-2.4ghz-coexis=
tence");
> >
> > +       if (variant->max_pixel_clock =3D=3D 600000000) {
> > +               struct vc4_dev *vc4 =3D to_vc4_dev(drm);
> > +               long max_rate =3D clk_get_max_rate(vc4->hvs->core_clk);
> > +
> > +               if (max_rate < 550000000) {
> > +                       drm_warn(drm, "The core clock cannot reach freq=
uencies high enough to support 4k @ 60Hz.");
> > +                       drm_warn(drm, "Please change your config.txt fi=
le to add hdmi_enable_4kp60 and force_turbo");
>=20
> Do we really want to warn in bind? Again you could have a VGA
> resolution monitor attached but that would trigger this warning.
> Can we warn (once) on processing the mode list and filtering out a clk
> > HDMI_14_MAX_TMDS_CLK mode instead?

That's a good idea indeed, I'll rework the patch to do that

Thanks!
Maxime

--pfy2jknigh37joze
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYD43PgAKCRDj7w1vZxhR
xTtWAP9LTHGG7mo4fggf8SM/6+jsgVXJgR7cCKemv7ULWQ3vsgD7BaullL1UcINv
aZAFP1OVZefQVOPQymGXoSnlMzK3mAI=
=vbIl
-----END PGP SIGNATURE-----

--pfy2jknigh37joze--

--===============0381541491==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0381541491==--
