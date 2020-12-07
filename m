Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A632D261C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:33:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E8A6E987;
	Tue,  8 Dec 2020 08:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1A689A4A
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 15:44:33 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5AF125C00F4;
 Mon,  7 Dec 2020 10:44:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 07 Dec 2020 10:44:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=ANrgVw61p46aLOYRQc84Vk5I4FX
 qZ6u0kZMVgXKeTtI=; b=vVj/pfCIYrobYmIcvqafsCzsSls8YM1Pd0bBmq/CSAh
 A/oOxfv+vUrQJD77MGFA5+DoekIoN6OFSgseDjB1KoexMBONVH0lY2wA6tP7l9qP
 CJhmkNvObX9ca5sHivevvD8AQ+MBnflb/fKivihnD7yMIkcO8GFc1xFzwcYfYEEG
 VWwBCxmw0ik8XrLNChPV1m3M7PXkuG0stmG843nCTeq8elUcrasOXFDZoqQDzPVh
 tnHubPIrt5sPq4S+pyTC7Svfu4WOPpxAaD/BFDVSBIMhgW3/538ev3njpVPsbzIc
 TNxvfAwhKUAHVDTtbPJFRtvCmhcCPR1S9xhZMPkKc9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ANrgVw
 61p46aLOYRQc84Vk5I4FXqZ6u0kZMVgXKeTtI=; b=n5LOFZayDZxbhPKJfpdtPr
 ecltXnTkMM5JBB2RCzXkh6s69sGiFujrl1j+GGEcUoWfmrG4pcITX46BjQ1pWexf
 Xvm+6Gxr0lEvoywcCicVqDK4ml/FsbQH6SmenWoigPHzoYoI0BzCWvSQ6GZ2jgMk
 hI2KKAysWaWTOJToJKaoJUINvEND8NMZu6Fetitz6HdAFLEDknr6CzuoS86GiLEC
 5qdrNBHFIHiuJDMX3jYkB9Kq+kCIBdhS5pRY+rP8QyR7QimGRaOxiKCm70yXR8NB
 wXz2ONUIFZPV3jiI4Lt+FWsBjQAc/0iKtBMFIo5YWqqoBY6HBNmvzsLNMN5U7/0g
 ==
X-ME-Sender: <xms:3U3OX2Aco2buBWccNzptNfc-ib9suGQFHhykYYmaEqnzxahC6sTsog>
 <xme:3U3OX6IHBoNnVTsmIo-vj5RckazVJfCIwLoqqxSsiNjc5cqRo5NBi6jyz3glVGlir
 ireL-Y_u4JlPflV5Bo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejgedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:3U3OX5nDlmtWiYDIJJ8LA2ys5l_CTW7QjyKO9v2Id5uesuGBX9RNGw>
 <xmx:3U3OX4HGdnZkzGuG2kFbB2gM6VBUbMytSwbjGWzXq3Vqppu3aFu3KA>
 <xmx:3U3OX5HuoOy2AJOJXp54zndRkefuu-rtsTfuLnKFo2rONFGzSlRyfA>
 <xmx:303OX43iYy-e8VgSmNtLgZFbUXU02bvmV9_E-Jyh2WiR9crTpOYfeA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id EAAD3240064;
 Mon,  7 Dec 2020 10:44:28 -0500 (EST)
Date: Mon, 7 Dec 2020 16:44:27 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 5/8] drm/vc4: hdmi: Store pixel frequency in the
 connector state
Message-ID: <20201207154427.uvhhnwrtmwagas33@gilmour>
References: <20201207133948.2109194-1-maxime@cerno.tech>
 <20201207133948.2109194-6-maxime@cerno.tech>
 <201be890-781d-0c94-7f42-df761e4facac@suse.de>
MIME-Version: 1.0
In-Reply-To: <201be890-781d-0c94-7f42-df761e4facac@suse.de>
X-Mailman-Approved-At: Tue, 08 Dec 2020 08:32:06 +0000
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1278942038=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1278942038==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gypjzd3dklatuk4b"
Content-Disposition: inline


--gypjzd3dklatuk4b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Mon, Dec 07, 2020 at 03:14:49PM +0100, Thomas Zimmermann wrote:
> Am 07.12.20 um 14:39 schrieb Maxime Ripard:
> > The pixel rate is for now quite simple to compute, but with more featur=
es
> > (30 and 36 bits output, YUV output, etc.) will depend on a bunch of
> > connectors properties.
> >=20
> > Let's store the rate we have to run the pixel clock at in our custom
> > connector state, and compute it in atomic_check.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >   drivers/gpu/drm/vc4/vc4_hdmi.c | 26 +++++++++++++++++++++++++-
> >   drivers/gpu/drm/vc4/vc4_hdmi.h |  1 +
> >   2 files changed, 26 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_h=
dmi.c
> > index 862c93708e9a..c1667cfe37db 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -194,6 +194,7 @@ vc4_hdmi_connector_duplicate_state(struct drm_conne=
ctor *connector)
> >   	if (!new_state)
> >   		return NULL;
> > +	new_state->pixel_rate =3D vc4_state->pixel_rate;
> >   	__drm_atomic_helper_connector_duplicate_state(connector, &new_state-=
>base);
> >   	return &new_state->base;
> > @@ -611,9 +612,29 @@ static void vc4_hdmi_recenter_fifo(struct vc4_hdmi=
 *vc4_hdmi)
> >   		  "VC4_HDMI_FIFO_CTL_RECENTER_DONE");
> >   }
> > +static struct drm_connector_state *
> > +vc4_hdmi_encoder_get_connector_state(struct drm_encoder *encoder,
> > +				     struct drm_atomic_state *state)
> > +{
> > +	struct drm_connector_state *conn_state;
> > +	struct drm_connector *connector;
> > +	unsigned int i;
> > +
> > +	for_each_new_connector_in_state(state, connector, conn_state, i) {
> > +		if (conn_state->best_encoder =3D=3D encoder)
> > +			return conn_state;
> > +	}
> > +
> > +	return NULL;
> > +}
> > +
> >   static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *e=
ncoder,
> >   						struct drm_atomic_state *state)
> >   {
> > +	struct drm_connector_state *conn_state =3D
> > +		vc4_hdmi_encoder_get_connector_state(encoder, state);
> > +	struct vc4_hdmi_connector_state *vc4_conn_state =3D
> > +		conn_state_to_vc4_hdmi_conn_state(conn_state);
> >   	struct drm_display_mode *mode =3D &encoder->crtc->state->adjusted_mo=
de;
> >   	struct vc4_hdmi *vc4_hdmi =3D encoder_to_vc4_hdmi(encoder);
> >   	unsigned long pixel_rate, hsm_rate;
> > @@ -625,7 +646,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(str=
uct drm_encoder *encoder,
> >   		return;
> >   	}
> > -	pixel_rate =3D mode->clock * 1000 * ((mode->flags & DRM_MODE_FLAG_DBL=
CLK) ? 2 : 1);
>=20
> Has (mode->flags & DRM_MODE_FLAG_DBLCLK) been lost? I cannot find it any
> longer. The code in atomic_check() looks significantly different.

Indeed, it's a mistake from a previous patch. I'll send a fix for that one =
too.

Thanks!
Maxime

--gypjzd3dklatuk4b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX85N2wAKCRDj7w1vZxhR
xUaeAQDVZHnWt5F11d/qxypVJb57LK7hwc2tp6A1pbVsd2hISQEApj+0WoW0d2xs
6MAOZRDb52IwiNm6XH8AzJqivELFpgw=
=PvRH
-----END PGP SIGNATURE-----

--gypjzd3dklatuk4b--

--===============1278942038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1278942038==--
