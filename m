Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A2A4EBD04
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 10:56:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F0210F7B9;
	Wed, 30 Mar 2022 08:56:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677D710F7B9
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 08:56:20 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 74D6A3201DCC;
 Wed, 30 Mar 2022 04:56:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 30 Mar 2022 04:56:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=+S4oLc/xqK8ZDPJSacDNcX6qLUyxS1u8t8e9kf
 OxLMg=; b=nuzFLxmKFWr4Yf9LeDELglsPHsrwep7eaYbmejbi8YYxFb81vVrs/f
 i6anwmAGyx2TI0H3DPuXyJZOrVFt5K9nbMtyRaWFH0LOmScwfKVH6ZTIahMWavch
 JyKl5DnrC3qc2hHR3SUAfOtmHAOgbWntznz/3sESWEXWpxw2Li8Oagbv1IuQ/+bk
 WChllTSWAkXV6fAud+6Gor9hfwv1jMJ2jp/FumXrn7EwGp1f+D1wBLg3Z2c2hMsR
 nLW2JPWEiIIqbM9EDG6eD5B2LJFBVMKm603MtzplNM0XnBr/3IdtX2KN9dxPazJJ
 kw/eTBBSv0a7pJOAUUjOzsz9vZy3XoMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=+S4oLc/xqK8ZDPJSa
 cDNcX6qLUyxS1u8t8e9kfOxLMg=; b=jHPCygPBhWA2tGSmmhgggVdY31aHNYwtc
 Jn2fjITPiFmxPFZgIXCdaRFBHIGABTnaIp5/mpadyLEeLPfxEnPPl8pODeAMloBW
 F+NAZLZKaaXYsP+sGYV9FihtRyBCpfdN/qUca+mTbju8CpqFgY81GbR+XfneyQ7W
 2NgunyRDVNe28UxfWpTgqhZtD1bScba8n2Rt+DOl1uae1H32Gb3d9n4UCWMi2rVY
 0InGsOWc9NNYicmDbZ7jpWEWXCc2ZoEJwckr2JAp//C1IDDMD2yYlhSauymogkja
 cop+tcBaZO8zRGRZ8wEUxaAb5BR9ceUre2O5Cp/7tF1KTgRxrbkEg==
X-ME-Sender: <xms:MhtEYjhsNPoEti2ma_pfKbxIs5gHfPcNka9iSwrls1n8SPMMLU1PfA>
 <xme:MhtEYgCAIj2YMI-48wN9Mkd-S7tLclxo9g-e9kzVgdl17CyeHTKcWt9_WIPoCAA0a
 HXWOykqa3enNPd6jNA>
X-ME-Received: <xmr:MhtEYjHYEP5mZgZQWJV6PM7UFwZkvy_XbM9emdPT4k0gaD2OfL7YTzRbC0iAyVD6NvwdkAAtBO_xd9LWOgLOcPzp_-E4FVxPYax3Mu8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeivddguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:MhtEYgR_d1-M71t6t_DzdQheTTh5KUgumZIC8zaBtiAHeM2HeAsUlw>
 <xmx:MhtEYgxx8s2hV0-0L2qPNM8FTFpRHtBB78-sGi0c4JlSUW_Bog1aZg>
 <xmx:MhtEYm6GwaFwXsSSKrho4FfOjkBVXA5JYWPRZeaC8lPNZOVbm70thw>
 <xmx:MxtEYqugmyvxGDKlo1QqxMytbh0xdVeKhWGtWraxqNoJukF3zc1QpQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Mar 2022 04:56:18 -0400 (EDT)
Date: Wed, 30 Mar 2022 10:56:17 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: BUG: KASAN: use-after-free in drm_atomic_helper_wait_for_vblanks()
Message-ID: <20220330085617.pyutwxtymnt4jjka@houat>
References: <4438d667-1be2-24f1-c987-1a8e3fb85bcc@collabora.com>
 <20220311142205.ztg6njrubmnjud7c@houat>
 <32a34a20-f9b5-3b7b-95f5-a6a34ad225c4@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="q6cdt3wjoh6lx34o"
Content-Disposition: inline
In-Reply-To: <32a34a20-f9b5-3b7b-95f5-a6a34ad225c4@collabora.com>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--q6cdt3wjoh6lx34o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 15, 2022 at 12:53:30AM +0300, Dmitry Osipenko wrote:
> On 3/11/22 17:22, Maxime Ripard wrote:
> > On Thu, Mar 10, 2022 at 03:33:07AM +0300, Dmitry Osipenko wrote:
> >> I was playing/testing SuperTuxKart using VirtIO-GPU driver and spotted=
 a
> >> UAF bug in drm_atomic_helper_wait_for_vblanks().
> >>
> >> SuperTuxKart can use DRM directly, i.e. you can run game in VT without
> >> Xorg or Wayland, this is where bugs happens. SuperTuxKart uses a
> >> non-blocking atomic page flips and UAF happens when a new atomic state
> >> is committed while there is a previous page flip still in-fly.
> >>
> >> What happens is that the new and old atomic states refer to the same
> >> CRTC state somehow. Once the older atomic state is destroyed, the CRTC
> >> state is freed and the newer atomic state continues to use the freed
> >> CRTC state.
> >=20
> > I'm not sure what you mean by "the new and old atomic states refer to
> > the same CRTC state", are those the same pointers?
>=20
> Yes, the pointers are the same. I'd assume that the newer atomic state
> should duplicate CRTC state, but apparently it doesn't happen.

Yeah, I don't think this is right either

> >> The bug is easily reproducible (at least by me) by playing SuperTuxKart
> >> for a minute. It presents on latest -next and 5.17-rc7, I haven't
> >> checked older kernel versions.
> >>
> >> I'm not an expert of the non-blocking code paths in DRM, so asking for
> >> suggestions about where the root of the problem could be.
> >=20
> > Does it occur with other platforms? Can you easily test on something el=
se?
>=20
> Shouldn't be easy to replicate this on other platforms, but I'll try.

By replicating I meant running SuperTuxKart on a platform with a
different KMS driver than virtio-gpu. So any ARM SBC with a GPU will do
for example.

That will allow us to see if it's a bug in virtio-gpu or in the
helpers/core.

Maxime

--q6cdt3wjoh6lx34o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYkQbMAAKCRDj7w1vZxhR
xb3EAQDCvLA30k7H3FBc1xEyHqbvLYH/od4oeqCxzmGQOVFnPAEAh5J2PhnuYMTM
OacO//TdOBvsAcBmJY+L+/8A3labzwk=
=galK
-----END PGP SIGNATURE-----

--q6cdt3wjoh6lx34o--
