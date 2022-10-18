Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 621886026F4
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 10:32:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12DC310E4C8;
	Tue, 18 Oct 2022 08:32:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C0510E4C8;
 Tue, 18 Oct 2022 08:32:00 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 6B89B2B06866;
 Tue, 18 Oct 2022 04:31:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 18 Oct 2022 04:31:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1666081915; x=1666089115; bh=fVI2EJnVlp
 jbITRfhf/MEDKDIYqZ83EHW+uFvYqJ3GE=; b=E/oS9DyWhA8g58HLIuCEAdjp+3
 t+kXUNNmuvVW4gCFTX4uansKgdcI0z1od/7hZp2owj39fURNiT13fB47gkmtn3CJ
 2H2C4LDxzVpImC14E5MiwhaFrP/wzx0Zu6aWSo8vnz6ZiWDuTzIf7mPSafcjIjL7
 Ktt68vaMOaL1Kas6E5aO6d4LP7+lFw8cRiOqNGQ3Ck9TjNIGleczD4KO4Y16ATdN
 sp/ePs2Cxw97s3Eiok74y0erQQ34oFh1UGuDHwcy17gmgBVPIBuw4DUrHqNzS+ar
 dGgnm7RqzlAZVuXIWgZCjwAOse8HIxhDma/q9bVSzJFrtJEPU0+B2qfcoqfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1666081915; x=1666089115; bh=fVI2EJnVlpjbITRfhf/MEDKDIYqZ
 83EHW+uFvYqJ3GE=; b=epm9K8FSvMhkC5qc+KzKqUBNaO6dGHyYD3uVRcM+AfSC
 DQBGTJwzntTrsvr9uPrUGuWUjd0kBwTiB7h73aMrJmvShW1KtQzk3qA5CMlu3UJ6
 re2xV5ugJXQEII1HodNUDxsnFaQk7bAUK7K66sg4a+gjWX9R/ZejWdxCimSSqYqm
 6QatFQOrHIKqRE7Qm7uB77oKaS+dx/V9Gh5wqIfrIkPBteGluP+B60oBLht7/9rQ
 7cCBygs54841y6xJ1O8yAye2mw90tr2EOGp6fYbN5VA9ebIJ6C+7vG+1lPuCYK9/
 Ugc+txHMO0LDiAjWoEy7aqQHW0V3BnalWAoLOA/+6A==
X-ME-Sender: <xms:emROY46iy60goFrr_WU2zHsL9iuc399b7JhJODl0-LgksKAMSNTkcw>
 <xme:emROY57mnTp_3ENJZ8OzX0xtCU67J4FOTM3VAdL5AaO4kupPv__bkOI2R59aE_brX
 hCZtUfG-FNzTAksq_o>
X-ME-Received: <xmr:emROY3d9dWcAzYHBLjYTAdJNGT4GClAW81v9347IhMA51V5iLYMj3p-idlvT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeluddgtdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:emROY9LBVry6aKrA2NlwwP8wDSRg7PDiELeB6DYc4Gds3rw9XRoR1w>
 <xmx:emROY8L27ihIBZ4gnvlia-DXnfdfA_eN5iKOAOL9U6b_pHaaBPg2RQ>
 <xmx:emROY-z4L1c83o5TN_73-0SbD7iixLdy2H6Hz8SbNhRW99CwE2zKgg>
 <xmx:e2ROY2o2vgyykG5PFglEXmdAutCaV1CBZNCRvmLRTqHCgXcMUXkOxWVRiJg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Oct 2022 04:31:54 -0400 (EDT)
Date: Tue, 18 Oct 2022 10:31:53 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: kfyatek+publicgit@gmail.com
Subject: Re: [PATCH] drm/vc4: vec: Add support for PAL-60
Message-ID: <20221018083153.okkqpd5ccfrnwdj3@houat>
References: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
 <20220728-rpi-analog-tv-properties-v5-21-d841cc64fe4b@cerno.tech>
 <93bf9fcc-c645-b042-011f-8f1fc957af48@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gs7goob5irll63bf"
Content-Disposition: inline
In-Reply-To: <93bf9fcc-c645-b042-011f-8f1fc957af48@gmail.com>
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--gs7goob5irll63bf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Oct 16, 2022 at 09:46:49PM +0200, Mateusz Kwiatkowski wrote:
> @@ -308,14 +324,15 @@ static const struct vc4_vec_tv_mode vc4_vec_tv_mode=
s[] =3D {
>  };
> =20
>  static inline const struct vc4_vec_tv_mode *
> -vc4_vec_tv_mode_lookup(unsigned int mode)
> +vc4_vec_tv_mode_lookup(unsigned int mode, u16 htotal)
>  {
>  	unsigned int i;
> =20
>  	for (i =3D 0; i < ARRAY_SIZE(vc4_vec_tv_modes); i++) {
>  		const struct vc4_vec_tv_mode *tv_mode =3D &vc4_vec_tv_modes[i];
> =20
> -		if (tv_mode->mode =3D=3D mode)
> +		if (tv_mode->mode =3D=3D mode &&
> +		    tv_mode->expected_htotal =3D=3D htotal)
>  			return tv_mode;

Is there any reason we're not using the refresh rate to filter this? It
seems more natural to me.

Maxime

--gs7goob5irll63bf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY05keQAKCRDj7w1vZxhR
xaoGAP9HmWvEP2iOcoDGqog26qg7gWYMxwwOjWfwgHtgcV81kQEAx9tCz7NmGbD4
TRrl+IN8yZd5ByEPUAc0V6js5M4u6w8=
=0Z/k
-----END PGP SIGNATURE-----

--gs7goob5irll63bf--
