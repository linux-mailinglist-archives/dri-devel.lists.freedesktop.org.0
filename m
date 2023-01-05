Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E58965E628
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 08:38:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A6D10E6B9;
	Thu,  5 Jan 2023 07:38:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D421010E6B9
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 07:38:47 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2855B5C0198;
 Thu,  5 Jan 2023 02:38:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 05 Jan 2023 02:38:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1672904325; x=1672990725; bh=r7qCgS6Rkr
 fEToI5NkCiDde4ax0xq/Y2Qx2BlziM3AU=; b=qQ83nZ8yfncMw+6g+7hQdbmS95
 enjwphZ/YVEYarfvgzQux4CjUc4T8LWqI9hPtcsLNGXwptqTt+XjjoEDE85WCtHW
 paflxE8N3PNJuJao/85dw+t4tnC7tyNVMdWP0Yq4tSgkWbndwv9frXjTnbWfBD9+
 +26hIKcjn/QYeV8dtCwUXKPtj4vi6QyNz4PyZphPVV1ihv70LbAhjSV2p2MWBxtl
 vuDoQMwKY527hjcmpdyYiQHZJAJ61uDn3H71uxXJpvgzLxWLo5DMwBSckghxDaMo
 GQbw7FNJGIQR4MX6jO2M71GmScKv6Q9poJKFNlaUdfJtBSWoKcfwm2Pg0pQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1672904325; x=1672990725; bh=r7qCgS6RkrfEToI5NkCiDde4ax0x
 q/Y2Qx2BlziM3AU=; b=a9Mubvmcic2SSf7S9J6h77YuJCKW9TvrfcOmzfU03itm
 1p8O+YYXMgxQOMZDHLca9YpUBffSAbTfmcdfOJ5d/8ZcTbF3HiT4DBYGxlZTdRCo
 GhH5nGoRqc1g2aF04ueI5F/KRc2/Q9Ukwgnrur7YkbgWd2O4Uhwwpd+stoHTG8hZ
 Js/7AHHN4x+cHk7Zlwei1lpoZsezGU7PKcWedXlGkGFOME00hvdIDvep085KjYth
 7P075t1nYFsWGPY53EIQXgT4uLEVZ1P/LIfpMvn8jXkGeDqTg9D4gYsXyH4u23pe
 Ri3irYJdtlOc3yXeSAFR/yMzYcEtL7j58vO6JOfybg==
X-ME-Sender: <xms:hH62Y9xBXtBufJCp17_XaCjpw9EE5FqOoW6H6-WV3_v6ad9nyuZ8HA>
 <xme:hH62Y9TOEy7Ky_QrNba39TSJ_f2iiPO3n-Ro_Rl-NWMyn-PCi6YVDsmWrNkBH1-Zi
 WTXsEe-NuN_MVJclik>
X-ME-Received: <xmr:hH62Y3XgEeXKlc_SvWYkApuDSPHIjmiz2anJSAF7_l6MrXho8qgB9V5DiVnAhkYerR7gcoOu-7UdjLGXredOn3nmzoq8zAGg7kGGGNwEVtnf3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjeejgdduudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejveefheefkeeiffegveelveetgffffeektdefuefhtedtgeejhefggedu
 ffffudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:hH62Y_gbBT-vCZDspFavXD0M6fcZN2rKofFAoEiKhjqnIdNJOmu44w>
 <xmx:hH62Y_B8MYGJTtN5Cu8ItgWVPwNL4RVgi4P3eUnS-OE8qI1D9bpWKA>
 <xmx:hH62Y4JueEZCEsMWeHFJmpSIL28mLoAZHB6MG5kzeVh7D7iIrPQNAQ>
 <xmx:hX62Yz7jYSN9iT7FrZGlBz9NAWC1FaG5duf_C0XnEhYk7zLTRCl5cw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Jan 2023 02:38:44 -0500 (EST)
Date: Thu, 5 Jan 2023 08:38:41 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm: document better that drivers shouldn't use
 drm_minor directly
Message-ID: <20230105073841.m3xpxga7qee762qj@houat>
References: <20230104211754.1967591-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="e4rvxo5lgsyu2nom"
Content-Disposition: inline
In-Reply-To: <20230104211754.1967591-1-daniel.vetter@ffwll.ch>
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
Cc: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--e4rvxo5lgsyu2nom
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 04, 2023 at 10:17:54PM +0100, Daniel Vetter wrote:
> The documentation for struct drm_minor already states this, but that's
> not always that easy to find.
>=20
> Also due to historical reasons we still have the minor-centric (like
> drm_debugfs_create_files), but since this is now getting fixed we can
> put a few more pointers in place as to how this should be done
> ideally.
>=20
> Motvated by some discussion with Rodrigo on irc about how drm/xe

  ^ Motivated

> should lay out its sysfs interfaces.
>=20
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Wambui Karuga <wambui.karugax@gmail.com>
> Cc: Ma=EDra Canal <mcanal@igalia.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--e4rvxo5lgsyu2nom
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY7Z+eQAKCRDj7w1vZxhR
xWxVAQDbPlmQWwwy9D2QzX9hoeogfEPDVqrmJD2vRUdJ79RqowD/cWbWbq2V0HS1
Tuq4LgwCA92H002nikeO5YA6F7/EwA0=
=IGP9
-----END PGP SIGNATURE-----

--e4rvxo5lgsyu2nom--
