Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 915A26AE376
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 15:56:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9029110E4D6;
	Tue,  7 Mar 2023 14:56:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1724E10E4D6
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 14:56:23 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 9AE3A2B0725A;
 Tue,  7 Mar 2023 09:56:17 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 07 Mar 2023 09:56:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1678200977; x=1678208177; bh=GQ
 gX+OFkaGwQO+Ny7NdW8cV5dWlF2ecQwTfPYmkv02s=; b=D7w4Muld8Eu5UCLbVO
 LkJFD+WIQx/Vzhl/X9C7A3qLfJhZNcIALZMfRNsBf7+N55NHVr9FJUhm0NBULAMK
 OdN1V2vrqVaMLDU/IZklg1687bwu5j1CmvmG2CA6DVe2PIWdLUGEF8hQig4Krczx
 V6EV2IYQMElVTx3+qTYWF41t6gcXtpmwEnBu1P1+LLahYaitCge2I2jYbsxmlBQW
 rXRlBxq5JKjAlT3QnidUxg3FOfE5dcKEXlD+cJhw596isAMQouwEYW8x///plLZw
 GoV2fs2GbKvlj8WQ/J6OCAW/IYoSEpi2CZ23J6b/bQybSaatyf4Djxnu9LqkXqrb
 9iAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1678200977; x=1678208177; bh=GQgX+OFkaGwQO
 +Ny7NdW8cV5dWlF2ecQwTfPYmkv02s=; b=KmI5/Os6WpMErhW3w/1B7EuXeAvCQ
 xhfYD5k9CNH3MJZkJgOgkqQNvmfzPZY97/kz27sByxjiByCcWO0iq9Di3H0ozngH
 AJ34GxitJkGvPu3BfwwlKR3OeVQhzyah69W7ESRThiYprN31rCqtxCdDPEHLcsQp
 Mua38OlFMeFfYx8gat2t5Z30dGaEgFeH8r6BBIB5ogU9N5eliiCKTx7lQsiinlkd
 7rpmCHNmCiTbrb0GTqb6qNaPETFhGAYwaCbou6zZPq6Zk5y6qa90IJvlcwtPgQlS
 Z+LEv2EIQYTD3Jkk0AOvgJVjahHihNBwH559ddWvrL/Q1fz+IpJYufmPw==
X-ME-Sender: <xms:kFAHZGeaqwXLPcM2ZfAd9njBAJC7Qi702nIuGITTB9r2mHpiJQmxuQ>
 <xme:kFAHZANks4fE2kD4LVIfrNXPmvJ2LWq68vgJFN5G9I036iVCLwpItQKtwdvvePLG3
 lIz6eoANG5nWgguZsg>
X-ME-Received: <xmr:kFAHZHifYLdjTcgYugedhArfBJX5ZO095Tzyk3GJMwGW_JqKMbxkcv4-6UdvXVWL_IdTdizpJ4-nBCbAKDYobYgANbZBeMI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddutddgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:kFAHZD8i7TqRetgXoJKraTcZZ4qAe6yWv7D7zbRf67iVgQS8jbZdiQ>
 <xmx:kFAHZCvzE5SAi7en6Ya85Dfx_8ANirukxjtec1coGl342WvLls9Chg>
 <xmx:kFAHZKHHge_08-IbbPVfQcusfH4wd8uO9ND8Pzsqjnw-7qeaVVPO_A>
 <xmx:kVAHZMtyfuXByAQ91WiEFHmEhoTysW6RSMH7Y31dJM6poMiGIfPxH1JkFNA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Mar 2023 09:56:15 -0500 (EST)
Date: Tue, 7 Mar 2023 15:56:13 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/atomic-helpers: remove legacy_cursor_update hacks
Message-ID: <20230307145613.xvhru3fpcudlpazt@houat>
References: <20230216111214.3489223-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mgg47tbsz3puzqki"
Content-Disposition: inline
In-Reply-To: <20230216111214.3489223-1-daniel.vetter@ffwll.ch>
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, linux-arm-msm@vger.kernel.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@intel.com>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel@daenzer.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, mikita.lipski@amd.com,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, Manasi Navare <manasi.d.navare@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, "Kazlauskas, 
 Nicholas" <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--mgg47tbsz3puzqki
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Feb 16, 2023 at 12:12:13PM +0100, Daniel Vetter wrote:
> The stuff never really worked, and leads to lots of fun because it
> out-of-order frees atomic states. Which upsets KASAN, among other
> things.
>=20
> For async updates we now have a more solid solution with the
> ->atomic_async_check and ->atomic_async_commit hooks. Support for that
> for msm and vc4 landed. nouveau and i915 have their own commit
> routines, doing something similar.
>=20
> For everyone else it's probably better to remove the use-after-free
> bug, and encourage folks to use the async support instead. The
> affected drivers which register a legacy cursor plane and don't either
> use the new async stuff or their own commit routine are: amdgpu,
> atmel, mediatek, qxl, rockchip, sti, sun4i, tegra, virtio, and vmwgfx.
>=20
> Inspired by an amdgpu bug report.

Thanks for submitting that patch. It's been in the downstream RPi tree
for a while, so I'd really like it to be merged eventually :)

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--mgg47tbsz3puzqki
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZAdQjQAKCRDj7w1vZxhR
xWtgAQD3/rzdROsdbjOwFc/mbmUyG/GnJLulhBcauAuhRqkI9gEAliE4z5x/v2vW
zxe+foePRa9l0/iW//JcHyAuNW9R1Ac=
=Xp79
-----END PGP SIGNATURE-----

--mgg47tbsz3puzqki--
