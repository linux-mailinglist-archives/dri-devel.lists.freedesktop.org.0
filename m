Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EDD35F56A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 15:49:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0950A6E7E6;
	Wed, 14 Apr 2021 13:49:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE306E7E6
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 13:49:08 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 1B41D1558;
 Wed, 14 Apr 2021 09:49:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 14 Apr 2021 09:49:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=2bOuJl6bIsTdlxtszITkUrUsS5l
 Obuwt8Wv4790ZpZc=; b=kh0fGG9DB0tMyUSV5HqLAWFFsMcPbEVwnUKFOrNwMYY
 9bViB0q2HddW5bJe+L195LZOu0pkwhAc4kgycMKh/RgEpqzPm8OPfCvncD7yXGWd
 M1XKHcMxK0uL5l2LTtUUu97u/bJOe40oePxCJCejVY9pr8LcXR5qm7UFYE0e5WCS
 gtkXJdcB4ZLp5py6ywBDiATUtyReOf8wklOIvEQJAAYqM7UoaeKJcZetT1lPKZDc
 NFn1YojJZcIgbjq8JqGxYsvE561rh3gSWXEh6UdSqpbAeOINaxl7KxEXWChO8Man
 9FWW+LMWbbOIdaB4u6EJBpMG7mGaYzliOcTb/bHDoaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=2bOuJl
 6bIsTdlxtszITkUrUsS5lObuwt8Wv4790ZpZc=; b=SCtmM+grA95dwZgiFiqkMv
 B7YLjsb296xxz3Mq74I3ltYMq3yoeS6GDgUO+xqrsaZWx1c+1LpxmpRIg46TBUR/
 xLb4JnhtBQjLPEEvqTouaMlhMkGrjHeHQ+GwF3H+S2prNSZ9QGFRdlvxeLrJAHSa
 MT/Mc6ThPUQl3Auv2rHc7ImEi1qEpUyRF6NMcsEvyQcUkj92PLiDNLaDgmACtwC3
 8NV3lt3iwMsnsf9iC4AC2siRmRmNrWYUIW672ZSVPCHgLOCSQaqF3bkGkOSDdX0A
 LlPVByBf5lIPPrFPUwNpQoff6c/0oPtG3ToySLoW0hgauL2Jnqc1PajK373TJUOA
 ==
X-ME-Sender: <xms:zfJ2YL3gZcf6AhTFqZiarz9KhcDmh0vQ84scw1Y3FEeSmckvuJO6Gw>
 <xme:zfJ2YKGafMqq0DJGQvvmtgvNABpP1Z8bOboomJ-g8h6ks78YrcZ1TKwcFAwngbObM
 6ZR_luDteAf-1WWz9k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeluddgieelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:zfJ2YL7UxktSVn97zTPSpuZo84zEfyqDHbA07Bjdyy7jdYWJte18-Q>
 <xmx:zfJ2YA211g5meWkQLON_LiytvXGAQvUcBYtv7Yp5XY6WNKkjTuNzfQ>
 <xmx:zfJ2YOGIVKJ2RJ71o57pxLmEAoWmHj853bkhlB6O58uII3w_2IRFBw>
 <xmx:0PJ2YFfbYBLA8kGfh4RR_qjWFhfwf-zt0Zy73V19ZuI4vE6OkGeWYORXcNw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 309F21080068;
 Wed, 14 Apr 2021 09:49:01 -0400 (EDT)
Date: Wed, 14 Apr 2021 15:48:59 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 07/18] drm/vc4: hdmi: Add full range RGB helper
Message-ID: <20210414134859.l5v6pfe7rskzijlf@gilmour>
References: <20210317154352.732095-1-maxime@cerno.tech>
 <20210317154352.732095-8-maxime@cerno.tech>
 <316878dc-8661-e111-27e1-ac8ab3bfc13c@suse.de>
MIME-Version: 1.0
In-Reply-To: <316878dc-8661-e111-27e1-ac8ab3bfc13c@suse.de>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 linux-rpi-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0890412085=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0890412085==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mong7n2vfk35mcib"
Content-Disposition: inline


--mong7n2vfk35mcib
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Mon, Apr 12, 2021 at 11:44:05AM +0200, Thomas Zimmermann wrote:
>=20
>=20
> Am 17.03.21 um 16:43 schrieb Maxime Ripard:
> > We're going to need to tell whether we want to run with a full or
> > limited range RGB output in multiple places in the code, so let's create
> > a helper that will return whether we need with full range or not.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> although with a comments
>=20
> > ---
> >   drivers/gpu/drm/vc4/vc4_hdmi.c | 12 ++++++++++--
> >   1 file changed, 10 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_h=
dmi.c
> > index eee9751009c2..fc545072b173 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -95,6 +95,15 @@
> >   #define HDMI_14_MAX_TMDS_CLK   (340 * 1000 * 1000)
> > +static bool vc4_hdmi_is_full_range_rgb(struct vc4_hdmi *vc4_hdmi,
> > +				       const struct drm_display_mode *mode)
> > +{
> > +	struct vc4_hdmi_encoder *vc4_encoder =3D &vc4_hdmi->encoder;
> > +
> > +	return !vc4_encoder->hdmi_monitor ||
>=20
> Is this ever being called from non-HDMI code? If not, I'd put an
> drm_WARN_ONCE around this check.

I'm not sure we need to worry about this, it's a static function in the
HDMI controller driver so it can't be called from anywhere else

Maxime

--mong7n2vfk35mcib
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYHbyywAKCRDj7w1vZxhR
xSB4AQD/0Rb4psPVb9DvB7kI1eqa5a2XI2a6cmPwAwB1Bn1FmgD/U22eUv2R1W/Q
YV2PM72VvqeRa+wDzPcrG3KMDZ2khAc=
=JIKR
-----END PGP SIGNATURE-----

--mong7n2vfk35mcib--

--===============0890412085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0890412085==--
