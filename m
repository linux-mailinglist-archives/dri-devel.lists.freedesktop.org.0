Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4667A4B83CE
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 10:17:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 092DC10EDCC;
	Wed, 16 Feb 2022 09:16:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 377A910EDCD
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 09:16:58 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 7E01F2B00253;
 Wed, 16 Feb 2022 04:16:56 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 16 Feb 2022 04:16:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=VFcoWbDd0osHHRdxqMFsT3iCNYCwOPPti/8jLz
 0l9Fo=; b=gMmOOb/cy5q0qSaypHszjYTjRp6mkgE1E0X5SVN8+LXilm9VlD0ba1
 Yd8PELTECnV/WyTPCMail7BPOLOYKq1tAebPOXRlsKA+qJIHylIXmJnxN4krzX14
 zAlujRe7EgJUfLQpIykKB1KsBZLntJau8WMyIwV1XRVWuzIUvbVGEWUBKWHT5b8w
 JXXrByFWuX3J9LAmv/uA5EtJL8Bif2JJctSida7kqBFxSjOrZdW1Rohr6TIbxIlD
 CblAX9rIGsHM7ZtB278F1Ay8hIT8Y8C95EBMXUMJijsKQ/MLlusP5UznKk3vd+4p
 rRTPG/ExpDLqyjUfCdJAeif3lOtng1EA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=VFcoWbDd0osHHRdxq
 MFsT3iCNYCwOPPti/8jLz0l9Fo=; b=IXl7IynA7aSHcbw2X5veDZ+sxmlfQELXT
 Cgc9KsGlF+bvXOFhUPAA3u4MdbxSWWZcY5RQmagwPYuqffx+DMYgKQLP3nCHvdt1
 qgonZdjyft9ogfyrkG9yuGI/ZNawD9Q2Z1mI8nbpwxFgV7+ylTuFI2TJt0bsLxUa
 zcd/LKt87aeF5dAMZoTbGsI2vP7EjK4pa0OfOxY6HD4pdzOi/B/30ejWrB6HYCsy
 V5tVep0oUQNgXFxgEk70yewB+dpLYyb7X+H0tB5I2t1LRQRh9WJ6meSKCH+6kB7V
 HR7QA7pOzNdASHqgtZfWq3LdrfUp1ZHd8G5NGs02G/cNGOcIrkRXw==
X-ME-Sender: <xms:B8EMYor_nJ2EwWClDvHiGDOFmF0E3m8geN51vi_QkUSziqAogEeI2w>
 <xme:B8EMYurlnLBi0qOL9gdN7KmjGGwWX7r4ViNW_LuBOz7n-7EVUUMRU2YDRVX_bgHBt
 dDHWMMprnHFleh28KQ>
X-ME-Received: <xmr:B8EMYtN4dgBqIQG91gBB25tHlJK2gMGKlF-6mj1_vtQEkyMf92u_rPi9Pk7NA9Nj7JRZGL0mAF0t00SGY-CkK7p-Ekufa5zI5PSzw9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjeeiucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 epfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhmvgcutfhi
 phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvghrnh
 epleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieehgedunecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimh
 gvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:B8EMYv5vZkT1aAUs0S3c6j5KBtiLTwkHNtRNjO3skOmQls_SoB0KmA>
 <xmx:B8EMYn6np-ZrPxvWORcnBRLIx5Le66ffTjOCicE84kdv5WTw4tJwqg>
 <xmx:B8EMYvgg7ALN5zKooKRP9DzO6DrTjIljNCG-ZzY6zG7Hrhi1dCK1ag>
 <xmx:CMEMYmq50CeVW0SbdTcwY0zwZ1u5cWDvwJwGOWw9giYRkOvdCC7RJre6xOM>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Feb 2022 04:16:55 -0500 (EST)
Date: Wed, 16 Feb 2022 10:16:54 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v6 3/6] drm: Add driver for Solomon SSD130x OLED displays
Message-ID: <20220216091654.vwscevn6g7igzaau@houat>
References: <20220214133710.3278506-1-javierm@redhat.com>
 <20220214133710.3278506-4-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="iis3uqkiq2yj5fqd"
Content-Disposition: inline
In-Reply-To: <20220214133710.3278506-4-javierm@redhat.com>
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--iis3uqkiq2yj5fqd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 14, 2022 at 02:37:07PM +0100, Javier Martinez Canillas wrote:
> This adds a DRM driver for SSD1305, SSD1306, SSD1307 and SSD1309 Solomon
> OLED display controllers.
>=20
> It's only the core part of the driver and a bus specific driver is needed
> for each transport interface supported by the display controllers.
>=20
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Reviewed-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--iis3uqkiq2yj5fqd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYgzBBgAKCRDj7w1vZxhR
xeISAQCFHDmKrRlVBHnHyZrWxgNiHdImv6H7xoVHC1ZcIWMEagEA6owxEBS0b4vI
R0QEr6UuhEyRwL/GPyIajKEHVfWqHAY=
=+M1k
-----END PGP SIGNATURE-----

--iis3uqkiq2yj5fqd--
