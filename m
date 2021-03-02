Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AEE32A1AA
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 14:57:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 076F689FD3;
	Tue,  2 Mar 2021 13:57:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE5C89FD3
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 13:57:33 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 37D5F580634;
 Tue,  2 Mar 2021 08:57:33 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 02 Mar 2021 08:57:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=MyXGRWcGQgzv9g2cw/q7AhXo+mc
 RndtgVEVh2Ros9Fk=; b=Z+HG+iYsQpYnJYgVbbs4AImoGj6RtA4JmTxG9gQqIPE
 LFHU/HV6yhYv99mBL/bbwpP8JdGCJWWlvZ7pGhQ1euN4wMl8IBd+Gqe716d4N5uJ
 UiudBUCjpFC7dLsU45tC2ut+5Nn6fcseul16sq7QXxNH/cxfQTOsXVt21Oi2JVPz
 BiQc/BwKMHaui2D7HWFPOYamuwbz3kSzgj9kbFJnNWyX1WSIgsHeDwAdrK7jbCPZ
 AiQpbtlPxn+tki9G+zV5x+4nvJrCCJoEByvW1YalIamJE4wUv+VY+kMYUYJwKKMl
 ZYvfvEya1PA1f9ECZ71o45EPuMsEP+kWagcdUYJq5Hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=MyXGRW
 cGQgzv9g2cw/q7AhXo+mcRndtgVEVh2Ros9Fk=; b=gzxcp5webj4bgDrBRap3Db
 1ti0cJBjV/OFdAyVV+OalVII/YeeNew/TCF7oyROCik1QuR9q40cIiU/FVPQ4+WQ
 pzUUDrLjh58GokzIDlZwWCVVbgGS4SmAAubPSoWI06wAnbzp7ZEYX4NiJutRyprV
 ij2wQaI0MhzE9iQvJpCsXpKfxBjS0oPDpWgAken4dwNPVq5NRB5x46sVhcC27k0Q
 Wihqouzjdyu8NSUFHzd9C3CULTJZCbNJDe2Hw7o+iOggYaZtLrRQrhKdg6qkeksk
 LuFvGNDBwrY6Rbd6zHk3EYT1VaPuXJ9XLxSwuq4Yz8LlXgn4J8Hwvt/QZZ7R7Paw
 ==
X-ME-Sender: <xms:SkQ-YNYWnllR88Kuy875GqH4LY15TihPBmI6mDdx3EB45gLrmGmnwg>
 <xme:SkQ-YEYZEhqpIb4bGgAAYffywK_9dmrchTewddY1UdSac3_zdLzpO_DbSnnF7rII8
 ubWvtBNbWAeenv5lYs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddttddgheekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:SkQ-YP_-UVT3PgOevizLf2D6FZiOIO3zWai_z2FZzm96tuxwjNVtXg>
 <xmx:SkQ-YLoY-gvp5EqzJuo_RhmwL_uhvy47RYMr0_3sqosv4fLToo_TsA>
 <xmx:SkQ-YIpnbx_RAnl2gb1ZsWtoEXbCChhRFUW6IFZxWsb7V0FV1vfQDg>
 <xmx:TUQ-YNRtgUVAEhnKDujJtCkjBlELAAkGk1OH_sPd24GySBgc8g8X0Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 33281240054;
 Tue,  2 Mar 2021 08:57:30 -0500 (EST)
Date: Tue, 2 Mar 2021 14:57:28 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 8/8] drm/vc4: plane: Remove redundant assignment
Message-ID: <20210302135728.6d5z23f3egsmnvmt@gilmour>
References: <20210225155909.1853812-1-maxime@cerno.tech>
 <20210225155909.1853812-9-maxime@cerno.tech>
 <CAPY8ntBN=Kra-j7AS_VhYpVJ8y2+=T4EKOT3YBRZzEspuiUkaQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPY8ntBN=Kra-j7AS_VhYpVJ8y2+=T4EKOT3YBRZzEspuiUkaQ@mail.gmail.com>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, Stephen Boyd <sboyd@kernel.org>,
 Mike Turquette <mturquette@baylibre.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Phil Elwell <phil@raspberrypi.com>, David Airlie <airlied@linux.ie>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-clk@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: multipart/mixed; boundary="===============0470897813=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0470897813==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vboscgn5nk4bqple"
Content-Disposition: inline


--vboscgn5nk4bqple
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Thu, Feb 25, 2021 at 04:46:48PM +0000, Dave Stevenson wrote:
> On Thu, 25 Feb 2021 at 15:59, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> Other than no commit text body (which is hardly needed in this case)
>=20
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Yeah the last two patches weren't meant to be part of this series, I'll
add a commit log and resend them.

Thanks!
Maxime

--vboscgn5nk4bqple
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYD5ESAAKCRDj7w1vZxhR
xRXaAP9vzAbMXotUdCt0uLoV4LDdOIrKYiKWIRdXELXn7Uh4YQEAtarQ2d1HqinS
sMfqR8HfQpX9VwunVGbsJ6EKQ5wudAI=
=ri+a
-----END PGP SIGNATURE-----

--vboscgn5nk4bqple--

--===============0470897813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0470897813==--
