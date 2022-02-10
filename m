Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB864B0905
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 10:00:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EE8410E788;
	Thu, 10 Feb 2022 09:00:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A08610E788
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 09:00:10 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 58DD52B00198;
 Thu, 10 Feb 2022 04:00:09 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 10 Feb 2022 04:00:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=MGWByFSubqZQc+ek8V7h0D2NffjGhFVDBZaj7I
 7Vn7A=; b=pNERgv/jdi2CiTfiq7VZkEfizypI9c+zIksswo8Yj5smY0Ae4maflC
 rkP9KEY54IlbZGqOdMpTw+U08oJ8C/staUDwn2YZJEtVy9+KusXPd7eZvsxSjWGs
 8f4y245HddHrtoSkYCQzkfX/Z3JdhkmY93nOhd7R8hwoRBdXyZgqAFA6kwBSU9TT
 hUIkWZGj66zO7ml20nZaP9mMoWqp/UOh1zD26IbRwK+i+NE0/Kj0Wy4tD9GvSIFD
 aZ4X1oAt87IYFLUAn+ezGDPlvd1WiK2Jq9i5QksdwbnJ09WJmxaU6dJpM1TWAUwu
 bp2YdIotEMPXk8ZBs3RZtzcZ1jKxe7wA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=MGWByFSubqZQc+ek8
 V7h0D2NffjGhFVDBZaj7I7Vn7A=; b=KLMThvgL/eJlGhydqTZRArUukBDTwCi6b
 d21Irs9KJW34xxwq1DncgiGE0kchyrv7t4AsKPDWtkHmFBlRJa5z19DaPSkUtNEi
 +Fz1PZ7GXZ+P7SN8NQ6g61NrB+vA5j7D9HfLAsundbQW2eo5dPQJZ0l/9gPZCaw7
 Zu46djdW6roUKo9utdgzJ7U3UzX+rtOeX5qLrOz90LHxV9564tFbDwqRb13+byXm
 f3HQomgCHLIv6R5JYTNyqkWt8dLqXRQK//1koINeRcO5r4GBqidAmhNNn2iSQtuZ
 iGp6b75ubpaU4FnrrlyUi/zcQNLmxHAU1fsLBKRc4cicMGduTp1zQ==
X-ME-Sender: <xms:GNQEYkFYR8JfM8kVEkm0h7BFLyIneRezHB0sV5LENIUcxbJnfPdJzw>
 <xme:GNQEYtUVjdOM6iC4Aub1UWs0yREnMypyxbaUz2IQup4tlDQtZwckc2uNcJf5GA5Ks
 n1f1A9BVrBzRzpm69M>
X-ME-Received: <xmr:GNQEYuIBbKJylFHMsh8TvhcGVKkzqfGMuBH4f1NqHw0dChlu9ychBrSpIQwV0AqvZDP97rxoK468gtyEokUEwTtcAytpMTel59UrAoQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddriedtgdduvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
 gfevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:GNQEYmFF6S49a5FXO-MQIEprrZKtyzYgH_4C-ZF0_b1yeUpI_s-LvA>
 <xmx:GNQEYqV0V92QabTXIrlsIvdVSyxduc-PkZkJkb3rjG3p44XU94XAjg>
 <xmx:GNQEYpOEC_CC9dcGlF0nAyEf0gyvvJKBef3imPuE_i6MLk58ayLXPA>
 <xmx:GNQEYmSAzqiuBtyX7fBcNVpDZr_7NE7Kk69712SXA39cNtzXk9kSPjM59AA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Feb 2022 04:00:08 -0500 (EST)
Date: Thu, 10 Feb 2022 10:00:03 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v5 2/6] drm/vc4: hdmi: Move clock calculation into its
 own function
Message-ID: <20220210090003.6hh2dpwyr5ehqxde@houat>
References: <20220127141021.302482-1-maxime@cerno.tech>
 <20220127141021.302482-3-maxime@cerno.tech>
 <Yfw0EwaI9OqS6keP@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="r2mvk4rz7opbm6ei"
Content-Disposition: inline
In-Reply-To: <Yfw0EwaI9OqS6keP@intel.com>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Werner Sembach <wse@tuxedocomputers.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--r2mvk4rz7opbm6ei
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ville,

Thanks for your review

On Thu, Feb 03, 2022 at 09:59:15PM +0200, Ville Syrj=E4l=E4 wrote:
> > +static int
> > +vc4_hdmi_encoder_compute_clock(const struct vc4_hdmi *vc4_hdmi,
> > +			       struct vc4_hdmi_connector_state *vc4_state,
> > +			       const struct drm_display_mode *mode,
> > +			       unsigned int bpc)
> > +{
> > +	unsigned long long clock;
> > +
> > +	clock =3D vc4_hdmi_encoder_compute_mode_clock(mode, bpc);
> > +	if (vc4_hdmi_encoder_clock_valid(vc4_hdmi, clock) !=3D MODE_OK)
> > +		return -EINVAL;
> > +
> > +	vc4_state->pixel_rate =3D clock;
>=20
> This thing seems a bit confused between pixels vs. TMDS characters.
> Either that or some/all of the pixel_clock/rate things are just
> misnamed?

Yeah, this is the TMDS characters rate, I'll rename it.

Maxime

--r2mvk4rz7opbm6ei
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYgTUEwAKCRDj7w1vZxhR
xcUeAP9Ai7pwkpK98KTjSBUtOTRHqN1U6BRyihOM3sHwXHQCrQEA7tgyoNKEcOMf
kjhfZunmIYtzgzXdUG60VxnY8kxehQM=
=/vPc
-----END PGP SIGNATURE-----

--r2mvk4rz7opbm6ei--
