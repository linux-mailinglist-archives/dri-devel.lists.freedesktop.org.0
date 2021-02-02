Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 218EC30D4DD
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 09:13:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1516EA0B;
	Wed,  3 Feb 2021 08:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010BB6E95E
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 16:34:49 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 406A28D4;
 Tue,  2 Feb 2021 11:34:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 02 Feb 2021 11:34:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=QGVTBo2RVfo554p2DPnJD8j7txc
 2YFyRWpwVHi3RqGo=; b=b+Jx5n3Cs+VebRiR9g/VjGLIOivf+Js/rhBwmsi9E++
 5G+Ru9nGU5jM1xLxR7uQwtWZ/0NKLNicc0NCcvdMMF2Hlt7ki3jqN4BVhEmJJaOw
 E1uDWKcLJLWS4mLhk9Se3e454fZwY49mX8Dp7hTS4nLrRrMNpExr22xZpzdj9Oq4
 ItbsyFma8vhY1iLD+JcKNZZgJUWmTWS5mScNgoM8k5kY7cy1PQHnstRcdXyWtCFC
 N+4Fro7+tpm0lBoSChXt3i2/J/9/6AlZcW0rrv5qs1vOS7YIBsp485wl7LfJ5PYH
 aswDhh3uZbfUJi/VudzsX+qgueZbtuR99EQ6LETHaFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=QGVTBo
 2RVfo554p2DPnJD8j7txc2YFyRWpwVHi3RqGo=; b=lGvxcMxxjLN7Yf5gTOYtvB
 76ELt0tyRMRn7Itk38aIyvlrkl8VMoBg/kAFlGIwJ4fra6HAlCxnsHAP38Id28+F
 lJThEJKLjmVZUIldiZ3+xD/knB+Efzkk9HmLe1mf8MIuqoAfS/QZO6Ma6TIYLF87
 v+xfBH3dXXkfgCUBNKqILgWUAmMj+tmYUdQKkolE1A19yd3SbhAb2lQgblydrO/z
 iOH2uDy7qsdcc+cbtWAIq+dWQvoUo5Iqq7qQZuUn+RYjSpfHXW+qW8IQcVj7iziN
 /qXOYZ17SqYOw4T+359p7p6YYD4+yDdQ5/zN5eJJnAaZ1lVp9SNydVy2WYrM3Nqw
 ==
X-ME-Sender: <xms:JH8ZYBjtr0M7WEY4BftU4zjLGOzzORuIbfeRNW_TBTSnzAIjA8QrZQ>
 <xme:JH8ZYNb5E1EyBPaH5I2Ilacos84DWYmeG56HTgMElZFQcat4hDhzYEHh3NmK_Prwz
 ES86Qri5cVZ63FRSIQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrgedtgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:JH8ZYGqoDVyO4IBSB8d0irinHiol5PAAwGuUGYL32eNSusIwozCP6w>
 <xmx:JH8ZYCPNG5AYNfl3yCr0HsFdCr-zU9H-CfGL7szfGu13l7UzkT1Eew>
 <xmx:JH8ZYBo4F1vxQeGVuVI5hUroZybg2d_nupmYZUh2R4zFhkvQ3lwptQ>
 <xmx:JX8ZYLzZ_mw3KMaggHXzQaKRg7DziRvVpLNwNTSLVqSqYFgGfv26qgGv-rs>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0373B1080069;
 Tue,  2 Feb 2021 11:34:43 -0500 (EST)
Date: Tue, 2 Feb 2021 17:34:41 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/vc4: hvs: Fix buffer overflow with the dlist handling
Message-ID: <20210202163441.hkszh2r7nfppjvrk@gilmour>
References: <20210129160647.128373-1-maxime@cerno.tech>
MIME-Version: 1.0
In-Reply-To: <20210129160647.128373-1-maxime@cerno.tech>
X-Mailman-Approved-At: Wed, 03 Feb 2021 08:13:07 +0000
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
 David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Content-Type: multipart/mixed; boundary="===============2061708785=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2061708785==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="slpwk5qbbyt32sv2"
Content-Disposition: inline


--slpwk5qbbyt32sv2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 29, 2021 at 05:06:47PM +0100, Maxime Ripard wrote:
> Commit 0a038c1c29a7 ("drm/vc4: Move LBM creation out of
> vc4_plane_mode_set()") changed the LBM allocation logic from first
> allocating the LBM memory for the plane to running mode_set,
> adding a gap in the LBM, and then running the dlist allocation filling
> that gap.
>=20
> The gap was introduced by incrementing the dlist array index, but was
> never checking whether or not we were over the array length, leading
> eventually to memory corruptions if we ever crossed this limit.
>=20
> vc4_dlist_write had that logic though, and was reallocating a larger
> dlist array when reaching the end of the buffer. Let's share the logic
> between both functions.
>=20
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Eric Anholt <eric@anholt.net>
> Fixes: 0a038c1c29a7 ("drm/vc4: Move LBM creation out of vc4_plane_mode_se=
t()")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Applied,
Maxime

--slpwk5qbbyt32sv2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYBl/IQAKCRDj7w1vZxhR
xe8GAPwKb6MjqfLbakn1Dkk52WoBI56cfYJiy652NNBd5ppcawD/RMPRnv6DjhGG
qBu1Gn29XuVvJatlfz1fxyqlER3mcgA=
=tlJl
-----END PGP SIGNATURE-----

--slpwk5qbbyt32sv2--

--===============2061708785==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2061708785==--
