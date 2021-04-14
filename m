Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4090135F019
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 10:52:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38CB06E486;
	Wed, 14 Apr 2021 08:52:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A46136E486;
 Wed, 14 Apr 2021 08:52:03 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id ED95515F5;
 Wed, 14 Apr 2021 04:52:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 14 Apr 2021 04:52:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=tlSEw4hWRMxP+Ie9Rw2eTxfrnLy
 +Oiu+FzNqODRDIgA=; b=FWrL6wb4oC7fm08k4x8FEUycwEbhuZJkgiFi22+f3PP
 g+Y/OWOJkWlgIuY9lstumL825RT9XIM3dvRIPo3v0h/ZoFAYZwtFC5BNhLt2zZ7U
 RerrkCOy4nc/Cy5bVGHOzVuKX8XxQT9vW54hw3wW0YNEODlKDuJhOEesel9wlS56
 PMggCTSeHHMEjNGMosHYh+Dts2/w1VPz50r8vSsNOJ4E3ahPG8q2AJ64XH4527VU
 3TPibL4+NFoNZ7ImiJk1eBoDpOX+5lpbCFt5WcLf1rEH/bnwJZhM8xL9WhekK/wC
 bJxy1UywaRy5eheFWMVILJiC3Ww7ptVniecQBDJEM7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=tlSEw4
 hWRMxP+Ie9Rw2eTxfrnLy+Oiu+FzNqODRDIgA=; b=nMMuEJwcHhkqLrVsw/YpLG
 18Urm7zEEshKI5LkWsICyHbN40aLStqdrRCiPlTKAUS+cwRPqTk9DWhBG1UtDujG
 zpU6mxDwy9YbUC+hIQaSAIJD95vu5YwMGD+0uMWQC2XAtGRMTiSgm65YKkCXVNuG
 qUmc8qNSpdg3s6RU0PP8rY3lsL+DdVx3OOcRrw3GWC/PXw2Q4WfG0g2W4AEmeXTg
 fF1iaRNQiYB3yyRubD+hCvgqzXleJb0EzczRfn3dvEm4rdjiXhsAGzk+cFe6s0xT
 OwQSQgeZDZf3z/SbLImSi+g5Ejdiq0X+25Dr6XfnL7iJmFg4YSe376wVfIFoC+qg
 ==
X-ME-Sender: <xms:L612YKFlsivfmd4aXRFZ15Ha2UAakL1ZQZSL3IZv5aBC-2ncAk1PPw>
 <xme:L612YLUHpnj46xVINi4BJltEQe4Myc6UAFJjYnRAkCTxubj9ARYf0hPclc-jCDw7j
 q6SSx_aNpsVdR07c58>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeluddgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:L612YEI-2pEbXPam2w4eSBtJBZr6GVts28cswaHpXiqoqEK3X10hPw>
 <xmx:L612YEE6lxP41bZEsbet7gdrWZvHWXSyHEY66n57qKCMC75AcFgRJw>
 <xmx:L612YAX46YMjTn9dXrLG7Sw7RNhjbnFF7pNi9Rreyk4cFz5TnanPLA>
 <xmx:MK12YNgguAKC1Z8PJzpabhBCb1SlDdJl_S76pewJkncEjiDa2O151Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id AA094240057;
 Wed, 14 Apr 2021 04:51:59 -0400 (EDT)
Date: Wed, 14 Apr 2021 10:51:57 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 11/12] drm/vc4: Don't set allow_fb_modifiers explicitly
Message-ID: <20210414085157.nz7fmcc3lnip2igr@gilmour>
References: <20210413094904.3736372-1-daniel.vetter@ffwll.ch>
 <20210413094904.3736372-11-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
In-Reply-To: <20210413094904.3736372-11-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1466639030=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1466639030==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2474c5xhxry74zal"
Content-Disposition: inline


--2474c5xhxry74zal
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 13, 2021 at 11:49:02AM +0200, Daniel Vetter wrote:
> Since
>=20
> commit 890880ddfdbe256083170866e49c87618b706ac7
> Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Date:   Fri Jan 4 09:56:10 2019 +0100
>=20
>     drm: Auto-set allow_fb_modifiers when given modifiers at plane init
>=20
> this is done automatically as part of plane init, if drivers set the
> modifier list correctly. Which is the case here.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Maxime Ripard <mripard@kernel.org>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Thanks!
Maxime

--2474c5xhxry74zal
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYHatLQAKCRDj7w1vZxhR
xRQtAP9VIAi7ensrX/WDoO4TNpAY2rKi0ds9kJwSn9b65HtpPwEAo1OfR9XSgkK+
BfiPI4Z5NWgciSXp3ttNctT3JVdJ5gk=
=3N2a
-----END PGP SIGNATURE-----

--2474c5xhxry74zal--

--===============1466639030==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1466639030==--
