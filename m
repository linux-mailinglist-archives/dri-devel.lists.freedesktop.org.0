Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B655F359EE6
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 14:36:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB8E16EC1B;
	Fri,  9 Apr 2021 12:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF826EC17
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 12:36:05 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3710058081B;
 Fri,  9 Apr 2021 08:36:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 09 Apr 2021 08:36:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=AxKg28k+Bhno+lHlmUgJgZy6Ery
 s0s4jciFtZr4IS78=; b=Di7+1EhuuEF57Qbvez+PQQAMIleMlw+o1nYu56zW2I3
 6Va/JrQ261ACPyBPcM2f0uWs092SoLTyyYCraLCbcIXaDHq2QOYSE36/f68oNJXu
 C5ldpQZc4fXVO97d2R2hPRjisSKAiCWSeiNNEioWHE1YUTRj7FH+OlUkdAKiJMUH
 Tk6RFGSadhhWwhzkFARkNbbXB63oIBtVtmVbdD0OUZIfY63Tx5SaQvL2+j/tZ3oP
 z0wf0jt6lebuc11SeXh9C3R5Vz8fC2yVJtEJqEgL3VqszoJKkAg9PMCKZqP5VVQM
 Ao+BGoRogsnDcAEhYxqAx2q+BXFWjHoBK/IywrcRjTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=AxKg28
 k+Bhno+lHlmUgJgZy6Erys0s4jciFtZr4IS78=; b=au1YDea7GBsWs7Ea5hFyvF
 bwMbJYoYvxFpOPQefXkHM9zR7y0jr+AVqsU7Jiw1CZpSmJ73KT5Qvz1AXyqlWKs9
 XddRO4uBuQpWJ/oFMm1ltKIFPe28odtR1fz3d7KaztuC4pa4NYGwnwa6WlCWza9E
 QSylgEe9TkWRaABVxv0VTglcqeZ6I7p6ai1JeV+u9z6QYzliCx6ca1wh3wc5hcqB
 0BdYYyYRd5rQsbdypBsnx+RDyQ89dEj/oXv0V7AKiz7iSo0LlA8jjAnLlTiXvoT0
 rIuXsxIg86ctdrKDzMGVmmyEEeGE4Xlo5583jrF5jwWPqiAz78ouXBXzSlqKX5mQ
 ==
X-ME-Sender: <xms:MEpwYJQsD3_iVEyIv2a2SebCVl3RnVW2CBIUPOwQCcFyEnnAfWxefg>
 <xme:MEpwYCwP6XNLEJ7zcK-yH9o__FQf7rG_W3yfggqKu3tRpCok0pZwJs-UJQd29qByz
 yn7f3alDeVvFcgprwE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekuddgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:MEpwYO1VzdlTPBdScaNNLo5RhyCrXN6xL0-e5sYTSrAbs24Zo-l0pQ>
 <xmx:MEpwYBDw_zixXc2bQtkHTkB5OTbpXaHa645f58OB08O3FqjtDoZk7w>
 <xmx:MEpwYChbq6E4HLa_fFFPsI_rK3acf-nLRiNdF66Dg0a5lNdjwySV1g>
 <xmx:MkpwYLWT4e4gw8smBSXcQKo50PNL3IREoNcb8RyCZeg6muqPmzUBLg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 736A01080054;
 Fri,  9 Apr 2021 08:36:00 -0400 (EDT)
Date: Fri, 9 Apr 2021 14:35:57 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 4/5] drm/vc4: hdmi: Enable the scrambler
Message-ID: <20210409123557.jjntmcuyfadjnv7g@gilmour>
References: <20210318092917.831995-1-maxime@cerno.tech>
 <20210318092917.831995-5-maxime@cerno.tech>
 <CAPY8ntBNr6kTRJkaMNmZ+Z9St9oZ=M9qEAKovtKrCCB=wzBZLw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPY8ntBNr6kTRJkaMNmZ+Z9St9oZ=M9qEAKovtKrCCB=wzBZLw@mail.gmail.com>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: multipart/mixed; boundary="===============1120865597=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1120865597==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="p5kdmielrydh3wjk"
Content-Disposition: inline


--p5kdmielrydh3wjk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Thu, Apr 01, 2021 at 12:30:45PM +0100, Dave Stevenson wrote:
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  drivers/gpu/drm/vc4/vc4_hdmi.c      | 56 +++++++++++++++++++++++++++++
> >  drivers/gpu/drm/vc4/vc4_hdmi_regs.h |  3 ++
> >  2 files changed, 59 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_h=
dmi.c
> > index 0924a1b9e186..530c83097b1a 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -35,6 +35,7 @@
> >  #include <drm/drm_edid.h>
> >  #include <drm/drm_probe_helper.h>
> >  #include <drm/drm_simple_kms_helper.h>
> > +#include <drm/drm_scdc_helper.h>
> >  #include <linux/clk.h>
> >  #include <linux/component.h>
> >  #include <linux/i2c.h>
> > @@ -76,6 +77,8 @@
> >  #define VC5_HDMI_VERTB_VSPO_SHIFT              16
> >  #define VC5_HDMI_VERTB_VSPO_MASK               VC4_MASK(29, 16)
> >
> > +#define VC5_HDMI_SCRAMBLER_CTL_ENABLE          BIT(0)
> > +
> >  #define VC5_HDMI_DEEP_COLOR_CONFIG_1_INIT_PACK_PHASE_SHIFT     8
> >  #define VC5_HDMI_DEEP_COLOR_CONFIG_1_INIT_PACK_PHASE_MASK      VC4_MAS=
K(10, 8)
> >
> > @@ -457,6 +460,56 @@ static void vc4_hdmi_set_infoframes(struct drm_enc=
oder *encoder)
> >                 vc4_hdmi_set_audio_infoframe(encoder);
> >  }
> >
> > +static bool vc4_hdmi_supports_scrambling(struct drm_encoder *encoder,
> > +                                        struct drm_display_mode *mode)
> > +{
> > +       struct vc4_hdmi_encoder *vc4_encoder =3D to_vc4_hdmi_encoder(en=
coder);
> > +       struct vc4_hdmi *vc4_hdmi =3D encoder_to_vc4_hdmi(encoder);
> > +       struct drm_display_info *display =3D &vc4_hdmi->connector.displ=
ay_info;
> > +
> > +       if (!vc4_encoder->hdmi_monitor)
> > +               return false;
> > +
> > +       if (!display->hdmi.scdc.supported ||
> > +           !display->hdmi.scdc.scrambling.supported)
> > +               return false;
> > +
>=20
> I think I made this comment last time, but possibly not very clearly.

I must have missed it then, sorry :/

> Up to this point in the function is whether the display/hdmi interface
> *supports* scrambling. The bit after is whether it is *required* to be
> enabled by the mode.

Thomas made a suggestion to move the mode clock check to a helper, so
we'll end up with essentially a helper about whether we support
scrambling or not and if the mode requires it.

> At the moment, if the display/interface supports scrambling but the
> mode doesn't need it, then the scrambling setup is never touched. That
> makes a few assumptions about the default settings.
> Boot with the firmware selecting 4k60 (ie scrambling on), but
> video=3DHDMI-1:1920x1080 in the kernel command line and you'll have a
> mess with scrambling enabled but not signalled.
>=20
> I'd be happier if the display/interface says scrambling is supported
> then we always call drm_scdc_set_high_tmds_clock_ratio,
> drm_scdc_set_scrambling and set the VC5_HDMI_SCRAMBLER_CTL_ENABLE
> register bit appropriately for the mode. Feel free to disagree with me
> though.

I think part of it is due to our custom helpers never being called
currently during the boot process. Once that is fixed, the disable
helpers will be called and will disable the scrambling so we should be
good there.

This creates another issue though. That function takes the mode as the
argument and at boot time the mode pointer will be null. I think we can
work around it by assuming that we need to disable it at boot all the
time (and thus ignore the test if our pointer is null).

Would that work for you?

Maxime

--p5kdmielrydh3wjk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYHBKLQAKCRDj7w1vZxhR
xSzmAP9PefViBjhClPsKihqsziXF4zQs1JRxZevinaun/3GD5wEAx4l+PPNhuhei
hOuzD0GT8qnD4c8qzre1syC3bkLl6g0=
=OaFr
-----END PGP SIGNATURE-----

--p5kdmielrydh3wjk--

--===============1120865597==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1120865597==--
