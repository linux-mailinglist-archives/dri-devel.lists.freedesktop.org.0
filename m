Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A984B83CC
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 10:16:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A49F10EDC2;
	Wed, 16 Feb 2022 09:16:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27B910EDC1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 09:16:39 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 525D92B00254;
 Wed, 16 Feb 2022 04:16:38 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 16 Feb 2022 04:16:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=KmLufUqjfQqxm6ppQfPseUWWMvRBMQWSjJ2fxH
 Ea95o=; b=RynjBkf0aoz7dpCZiMdPAwwk7pGxP/1UM/fIa7V6rxYOfeOuZ4SF+G
 KrvrWm5ovKdDJx82/Ur63J0ARcjvOTpPBhjmJEIEtsGFAz1k7VBcm3PQ53JKoE8+
 VcGK9sEKL7YKORCcMxRpHONPGHdU+PuMQNpywaTdY4mw7TLOD9Z814rq3j8BAQEy
 U+xE8ZzinU2nMXAJubpZ3bXV2WBmDNTDwsfSFrvhm+q7WyRJXtXrRE5LBSnYfBca
 3RWtAXd0EoQnygywtp/tF439iSVAlEp8WEE7MTHeve2dlmV4tFxeOKOiH+QTvzZk
 LsbWdY6DSoPe/3T3Jacm7n9V9k4giNwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=KmLufUqjfQqxm6ppQ
 fPseUWWMvRBMQWSjJ2fxHEa95o=; b=aGWFJVn3MWfexkpqzW1/dgFAvUkAGpC21
 lvGoOqDFaSizQF+Mw7gTo8Drsox6K+5XkA7NSw28JmaKlgcOmy8S52IAD02SrKwP
 tsybvgy+TcBRLzzUm+JO9L5Gna170wi3R5BcRM+1fS0erNPw1X5gXPvpW8zXw30q
 JjgN8T7KgbgAFQJzhCDdcQHJHEP8yybx9D8bt04lrfQ0BRYQzU0CLC21W8dI1jD/
 gt8cFhbufXGj+J9OM0/FhATwZjzN1nN1u79kbjsXkVD400RdVrlo0sRyvA6KDfai
 CjT/g37/SmDhf5vJv/r7L7hZ7b/hyg5Ei0nSf50CkssEFRXxFTbzQ==
X-ME-Sender: <xms:9cAMYnZTNcL5cYjSfr9Qirtwf1RbLx6s2l6XxsQfOaVilRlV7AhzOQ>
 <xme:9cAMYmapbiZT9rOCWUUQrE9ZzHwWikbAsK-UiqHgC9yH5g-rWxA1PGhgufMyC7izI
 4u9541zNH4EvVmceJQ>
X-ME-Received: <xmr:9cAMYp8cuF5JBtQSKTqfifqL9rJ4b8Zrth45rZpCWWi6ire7dtFQqmMOF-Xm6TIWBZBoUxR-S82G_TPbfVxQp9xw5zABCKef0AmJSS8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjeeigddtudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:9cAMYtp1kkf1JcPRDykfszYh9a8VHS5YO3iWm4o8e1G02G3-GkE6pQ>
 <xmx:9cAMYirOefxpguEGSRn48v7xnhquaJpxZ7zkX0yn6--Ypag8nWBdzQ>
 <xmx:9cAMYjQgteovdM-6n6TBO7Moj0dREdo0U4bDJrz5ASfEiykIcxSuBw>
 <xmx:9cAMYvSnY1ibb2x6e66fkHah9zP6z8MWviyNlQqNMEK7V_dP0SsW8aWNLlQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Feb 2022 04:16:37 -0500 (EST)
Date: Wed, 16 Feb 2022 10:16:35 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v6 2/6] drm/format-helper: Add
 drm_fb_xrgb8888_to_mono_reversed()
Message-ID: <20220216091635.6me7zh4l6p6qvoqz@houat>
References: <20220214133710.3278506-1-javierm@redhat.com>
 <20220214133710.3278506-3-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yxsysjzabnrzwwaz"
Content-Disposition: inline
In-Reply-To: <20220214133710.3278506-3-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--yxsysjzabnrzwwaz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 14, 2022 at 02:37:06PM +0100, Javier Martinez Canillas wrote:
> Add support to convert from XR24 to reversed monochrome for drivers that
> control monochromatic display panels, that only have 1 bit per pixel.
>=20
> The function does a line-by-line conversion doing an intermediate step
> first from XR24 to 8-bit grayscale and then to reversed monochrome.
>=20
> The drm_fb_gray8_to_mono_reversed_line() helper was based on code from
> drivers/gpu/drm/tiny/repaper.c driver.
>=20
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--yxsysjzabnrzwwaz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYgzA8wAKCRDj7w1vZxhR
xYXoAQC0KgnDTZ6PH4yXe5+8eUvWmGjolaAycOwLCERdzSU4qgEA/zDW4/QUB06G
t9KCewGFlLs4cC3d/otfJcY1WbHkYgI=
=rKR/
-----END PGP SIGNATURE-----

--yxsysjzabnrzwwaz--
