Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A22027FB53
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 10:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 091A46E878;
	Thu,  1 Oct 2020 08:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3736E4CD
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 13:03:51 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id DED485803F9;
 Wed, 30 Sep 2020 09:03:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 30 Sep 2020 09:03:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=ZdwfVB/wko7OBSY39TKujsLQ42L
 f41XzWXXZDcYCaXY=; b=VO9NeQD23JEE9EXZQEJGUncwXldLBxYSm5SJiIiQwq0
 wdqXNPeChK9Uq2eZlZXWc5ZZDwWzYK8eSRkFD+HgYFYb7YGGoM8d35OSJRjf0D60
 EeMCLwz0IzBYwH3/I1vyMafm6LUZXy8oQ+1g+pKFK0tYlkbZG57P5cnX6QqzFHx+
 DHPPZwEDIYLLas/bkqSjApFUwnrocXAKYh6aCCdAXV8ywyzuzvl2I7ZB4iIe6GSJ
 oRe2Il3ukk3b4pH5KyjJ8ZwR9jNqFAPwYjoyg1TiTvB+cTshTnVrO1FDWCKwfLNB
 AL3k/Th0tMyBEI/8n1BSHSc0PGJn76FHsJdREfGgYxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ZdwfVB
 /wko7OBSY39TKujsLQ42Lf41XzWXXZDcYCaXY=; b=TQfCC1br38S2KEgs4TkIXx
 TkV4JHmZ7d1/p6sVX+i9nHe3nqs07bkSKmhuhTpVVTtIXAiZ6iLooJk8s+Rkz34U
 Vm1b9WIKhFe0gGV+FVUIizYZWsQOO7PFBtp2KL6eFZrpT8pG/WlA1kK2dpR7DtR9
 WAD04gxivT8peO/1YfPB561BvH9acAiBQ5eetB6UEbKXh2uHXkBVPkj/DY1T46fW
 qdvspx7nvsd1q9/1COJcTJH91W3vTzX/+TtVFrsoG0bSVCbGuTsaT3t38XhBXvqW
 0/HZtP/gQiuoVe0hpSeXacILNHFQILpaTqzN3KUcttwRBnEZfaRQkJCd2rKTz3uQ
 ==
X-ME-Sender: <xms:NIJ0X73_lPIFH_22b2Lp4p5wdvxCkB8KV7AX5AUuSKgCsfN6eUKk6Q>
 <xme:NIJ0X6HNZheRy6Fi2OVWDYxfrFbS6TdeyY-vRumbiTrsSKXg2K7byleqaUkpSfHiI
 R8NHruVsgWQPCA5LTE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfedvgdehiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:NIJ0X76LUHn_lqKjL6cw8hiFDxQnFAOnI32jHpV4G8Zzj7AMDrnZpg>
 <xmx:NIJ0Xw2g4-AdQIY2sKM9U0ua5We66gA2HUpbXDzFpPzEUf14mYb0EA>
 <xmx:NIJ0X-GX9lD4iKnCAafrYRAEMXkdApcRVO9tnuG5KbmJDrNsPIDfbQ>
 <xmx:NoJ0X7f_oEUVuYtqqZasJhVHrlR8ZVrP0q3KdcEZSNPli9Cp_CGG-Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 073D7328005A;
 Wed, 30 Sep 2020 09:03:47 -0400 (EDT)
Date: Wed, 30 Sep 2020 15:03:45 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/2] drm/vc4: hdmi: Disable Wifi Frequencies
Message-ID: <20200930130345.qhtes5wv5sf42kuu@gilmour.lan>
References: <20200925130744.575725-1-maxime@cerno.tech>
 <CAKMK7uG8=depCjWACjFxSph6o4rrPu1Ng28F7om_CYaiMj_HQQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKMK7uG8=depCjWACjFxSph6o4rrPu1Ng28F7om_CYaiMj_HQQ@mail.gmail.com>
X-Mailman-Approved-At: Thu, 01 Oct 2020 08:15:43 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============1432252427=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1432252427==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5vzqhdw2glpkay7g"
Content-Disposition: inline


--5vzqhdw2glpkay7g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Mon, Sep 28, 2020 at 11:02:11AM +0200, Daniel Vetter wrote:
> On Mon, Sep 28, 2020 at 9:06 AM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > There's cross-talk on the RPi4 between the 2.4GHz channels used by the =
WiFi
> > chip and some resolutions, most notably 1440p at 60Hz.
> >
> > In such a case, we can either reject entirely the mode, or lower slight=
ly
> > the pixel frequency to remove the overlap. Let's go for the latter.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  .../bindings/display/brcm,bcm2711-hdmi.yaml        |  6 ++++++
> >  drivers/gpu/drm/vc4/vc4_hdmi.c                     | 14 +++++++++++++-
> >  drivers/gpu/drm/vc4/vc4_hdmi.h                     |  8 ++++++++
> >  3 files changed, 27 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdm=
i.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> > index 03a76729d26c..63e7fe999c0a 100644
> > --- a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> > +++ b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> > @@ -76,6 +76,12 @@ properties:
> >    resets:
> >      maxItems: 1
> >
> > +  raspberrypi,disable-wifi-frequencies:
> > +    type: boolean
> > +    description: >
> > +      Should the pixel frequencies in the WiFi frequencies range be
> > +      avoided?
> > +
> >  required:
> >    - compatible
> >    - reg
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_h=
dmi.c
> > index acfb4e235214..74da7c00ecd0 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -877,13 +877,22 @@ static int vc4_hdmi_encoder_atomic_check(struct d=
rm_encoder *encoder,
> >         struct vc4_hdmi_connector_state *vc4_state =3D conn_state_to_vc=
4_hdmi_conn_state(conn_state);
> >         struct drm_display_mode *mode =3D &crtc_state->adjusted_mode;
> >         struct vc4_hdmi *vc4_hdmi =3D encoder_to_vc4_hdmi(encoder);
> > -       unsigned long long pixel_rate =3D mode->clock * 1000;
> > +       unsigned long long pixel_rate;
> >
> >         if (vc4_hdmi->variant->broken_odd_h_timings &&
> >             ((mode->hdisplay % 2) || (mode->hsync_start % 2) ||
> >              (mode->hsync_end % 2) || (mode->htotal % 2)))
> >                 return -EINVAL;
> >
> > +       /*
> > +        * The 1440p@60 pixel rate is in the same range than the WiFi
> > +        * channels. Slightly lower the frequency to bring it out of the
> > +        * WiFi range.
> > +        */
> > +       if (vc4_hdmi->disable_wifi_frequencies && mode->clock =3D=3D 24=
1500)
> > +               mode->clock =3D 238560;
>=20
> Don't you want to map for a (narrow) range of frequencies here? Just
> for that infamous 60p vs 59.99p thing and similar. And I think that
> would still be in that band you want to avoid.

Testing for a range seems better indeed, I'll send a new version

Thanks!
Maxime

--5vzqhdw2glpkay7g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX3SCMQAKCRDj7w1vZxhR
xQ4hAQDcedgF2zlIz4vzP9fEomlvxK0kFn7Ms84BXyT4kqqMpAD+MoaAiUAVnaeg
tX0rXNjAZz+PapFraeoqXptISd+dpQs=
=wLNY
-----END PGP SIGNATURE-----

--5vzqhdw2glpkay7g--

--===============1432252427==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1432252427==--
