Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA868194AAA
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 22:35:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E3BD6E93D;
	Thu, 26 Mar 2020 21:34:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C0586E117
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Mar 2020 12:32:21 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id A3DFD5F2;
 Thu, 26 Mar 2020 08:32:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 26 Mar 2020 08:32:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=6LPzcEpZCIWZe3NWzXCtwyC1WRy
 8GtF3+kzmi9vHqJQ=; b=zb7KlrP8//mqZlUFFm7OBjbNUhlJFsIf7jHIp5WCwfg
 MS+GkFN0EISqpDyMhYQAyF+aNL4pMNP8Kg7ONpLcbU9BKNZein7FMmkfL3FMG5iW
 SQCdvNeg7UBXpa3cQdQsi52ewJIPVGL190r95PPenn4cgVKBzrACrLcKpN+bZNdD
 9/QQPVc7TRkRMXdY05CjqKubjESLuW1iLr6Nf4sSULpPdcnCwoq//ivebdmICYAL
 skKjE4+9pcU3Vrl9YLSzb9mvQ1Xk/ejQCXQdqJhE7edBlChBEWd5rT865FWMuEk3
 CKw3xcpmqCK3hJfhcgQE1xsos/lWYHvg4omCk+V0fxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=6LPzcE
 pZCIWZe3NWzXCtwyC1WRy8GtF3+kzmi9vHqJQ=; b=WJfAQVpNlaQNhVBwxd8UTF
 EbWip3j8NfDKAGFnYE05SwPsqzzSi4vwHjwartVxM9VJBE6eLGEuICJ9mkcd6Dkw
 BAHrumVa+ZvsUPzc7DJQ1uZj3ZUOQTswuWllUM6YT6e23cS3y5yLSyysdIFugdm1
 cHdqWfXIGUS7dGb/Nc8KR3zlBWY9sGRHwL6uGt6xjPs4yh4Nd9dERHqUrMuu9hSI
 vi8Xp6LU780FF+uZ7+lGkDrylz5gab8H5yL91CsUkpcn/IENNetSn8Q7Zc2RQ8NH
 ikcvw1xwqb99NggfGG6jo8Ll4EZJApptAszMFZ24w1e4D/RYLbpyuMcEjJwqfdbg
 ==
X-ME-Sender: <xms:zqB8XrAWJcSwPfZVp6bYg9IM-S2U54bu9TvbF9mca1PT0kVPpmluog>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudehiedggeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:zqB8XtFypG5HVZuotwPN2jMDykCJ0tHvzAI4Hsf6oYQJlEBAtPf2xw>
 <xmx:zqB8Xt3ypyYOjbZu74dbyJmZ72Q9UgwiNU8MnOrzCaXUI1XV2IaoOQ>
 <xmx:zqB8XmI5RTOQW0-uz3PGClzN0TBsn2LehT4swIaI5z1mxx0ermf69g>
 <xmx:0aB8Xsk7c8LvaMObwbm2BlgtSeu8vUYSUcgPkYdz76sSGEh2glMbdJE2j3c>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0DB52328005A;
 Thu, 26 Mar 2020 08:32:13 -0400 (EDT)
Date: Thu, 26 Mar 2020 13:32:12 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH] drm/vc4: Fix HDMI mode validation
Message-ID: <20200326123212.q6fl23fnjg7o7yyp@gilmour.lan>
References: <20200326122001.22215-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
In-Reply-To: <20200326122001.22215-1-nsaenzjulienne@suse.de>
X-Mailman-Approved-At: Thu, 26 Mar 2020 21:34:52 +0000
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, f.fainelli@gmail.com,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1438988276=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1438988276==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vddfs4mx3yibhlne"
Content-Disposition: inline


--vddfs4mx3yibhlne
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 26, 2020 at 01:20:01PM +0100, Nicolas Saenz Julienne wrote:
> Current mode validation impedes setting up some video modes which should
> be supported otherwise. Namely 1920x1200@60Hz.
>
> Fix this by lowering the minimum HDMI state machine clock to pixel clock
> ratio allowed.
>
> Fixes: 32e823c63e90 ("drm/vc4: Reject HDMI modes with too high of clocks")
> Reported-by: Stefan Wahren <stefan.wahren@i2se.com>
> Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--vddfs4mx3yibhlne
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXnygxwAKCRDj7w1vZxhR
xfOfAP0XYlKMR4DO967bRlehb2c975Ko9zqxfY2QFxSGl8gB6QD/VsLjZcdU5pOT
uncl3gohPDbB7bP6wYIzKtG3hicnwQA=
=Tn00
-----END PGP SIGNATURE-----

--vddfs4mx3yibhlne--

--===============1438988276==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1438988276==--
