Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A72268559
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 09:03:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B010F6E1D6;
	Mon, 14 Sep 2020 07:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 484826E3B0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 09:30:45 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C4D665C0143;
 Fri, 11 Sep 2020 05:30:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 11 Sep 2020 05:30:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=4eZPvAv3U0ei+14UtDDh27zONnm
 UsYhV4QCkXaiv95U=; b=cVg7pVYoHtQ+hvwb8cQNsrps9G+IF7pfPQK1slBQDA3
 Sqnfc6mEd9yCy7mCj8OT27z6uydy8YS+CN9RNql7puGeDfxmu+B8KgxfdzyKp5H4
 ygqfEBhL3749W7eFNkiNxGUk5Thv7u7/Ibf6IGSCSWGXfn/O9Kpo/JiXdf9u/96u
 FMig7f7cdI+LMJjDaZsJa8hUd7J9hrSN3AzgJaO7McVkCAj0cF7LcaGhShTnfP9X
 I3ubBZz3YkmBF74ZmevyMUzMCHLalm7f5mCt4cE313bvsWL0IrmA1yzKCpEKYK/Y
 /ajWu/Kf454TjtlLVnjLoQWa4oFaTKgJxi1nSEq/7/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=4eZPvA
 v3U0ei+14UtDDh27zONnmUsYhV4QCkXaiv95U=; b=dfH6sYtjoYu1rDC3NGm9lm
 M58DQ6AeSrVF6hJM2j+RArhBSzI78eEtW3N1o++2CudQMGd4EFE8m1iaOS8vCvg+
 s28ZWb853EHp2j8ZcWgmsOuP2zxQWwRscRAJDGLr2GN1kXxn5cI1R77nxKZV+l7W
 ZB9Bd9IGj/PxLDFgYx3GLIl2xTyR2dhtSIFCk2gXYHQckO5K4/gLe+dF1kT9QPWq
 gkTk6fY94LdMZHqswXoDLV2m+PGWExUASlZb58qAG7iWVXI+/LQXyoCBe1BMK/2Z
 LSJzz5SYIA1K/UgHUEtY9pPCOAC/f4zoFadBUGbKCWIOVGPcvw6OFpiwCPf9hJ6w
 ==
X-ME-Sender: <xms:wUNbX8wTwySe2pk7F3uY_ycdHvh6M32Ek5BDfp8yw12tMp5Wt2wrNQ>
 <xme:wUNbXwTS3lqYLsAyXhMID8LOWX1GMui7u9Eaa-9IvuMWJrfnx67Ckkgr9EiTJl14Q
 0MLNc83iZ9GFpEl_oI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehledgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepveegudetkeethfetgffgtdekkefghefhffefgeduleehgeehieeuveefgedv
 ieegnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepledtrdekledrieekrd
 ejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
 rgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:wkNbX-Vbn-y9gfr4apn-2UJzARWpt7QDKtizO8NjacHKtr5UwdWhEg>
 <xmx:wkNbX6hKaX5TlaS1j-Qb5OTHly_xAkRqZ2ylmIOpiGRFU060p30BMg>
 <xmx:wkNbX-B9CytH0zvYuu0RizjFeVFOQhNCyz7RPkvoKLuT_L5486YJ5g>
 <xmx:wkNbX5P-jTbyqZgGslD1VBdWSjMfVNvOkPVz2iLuiUytkIIynCtqGw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id B14243280059;
 Fri, 11 Sep 2020 05:30:41 -0400 (EDT)
Date: Fri, 11 Sep 2020 11:30:39 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] drm/vc4: Fix bitwise OR versus ternary operator in
 vc4_plane_mode_set
Message-ID: <20200911093039.ki55jtui5z5pftax@gilmour.lan>
References: <20200910171831.4112580-1-natechancellor@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200910171831.4112580-1-natechancellor@gmail.com>
X-Mailman-Approved-At: Mon, 14 Sep 2020 07:03:05 +0000
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
Cc: clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: multipart/mixed; boundary="===============1313707280=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1313707280==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4mr3dssagjsp7qtp"
Content-Disposition: inline


--4mr3dssagjsp7qtp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2020 at 10:18:32AM -0700, Nathan Chancellor wrote:
> Clang warns:
>=20
> drivers/gpu/drm/vc4/vc4_plane.c:901:27: warning: operator '?:' has lower
> precedence than '|'; '|' will be evaluated first
> [-Wbitwise-conditional-parentheses]
>                                 fb->format->has_alpha ?
>                                 ~~~~~~~~~~~~~~~~~~~~~ ^
> drivers/gpu/drm/vc4/vc4_plane.c:901:27: note: place parentheses around
> the '|' expression to silence this warning
>                                 fb->format->has_alpha ?
>                                 ~~~~~~~~~~~~~~~~~~~~~ ^
> drivers/gpu/drm/vc4/vc4_plane.c:901:27: note: place parentheses around
> the '?:' expression to evaluate it first
>                                 fb->format->has_alpha ?
>                                 ~~~~~~~~~~~~~~~~~~~~~~^
> 1 warning generated.
>=20
> Add the parentheses as that was clearly intended, otherwise
> SCALER5_CTL2_ALPHA_PREMULT won't be added to the list.
>=20
> Fixes: c54619b0bfb3 ("drm/vc4: Add support for the BCM2711 HVS5")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1150
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Applied, thanks!
Maxime

--4mr3dssagjsp7qtp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX1tDvwAKCRDj7w1vZxhR
xX0EAP47LWuq4yevIMaFjUP73PiNl7Exoby6G4mj8QuRY4gduQEAhkTXFPSjmzvw
gZ5q4Rxbxl+PYtOOngPfqyuIAelmZw4=
=WjzN
-----END PGP SIGNATURE-----

--4mr3dssagjsp7qtp--

--===============1313707280==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1313707280==--
