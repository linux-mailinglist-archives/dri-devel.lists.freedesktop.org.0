Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 104152C1F76
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 09:08:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 514906E20F;
	Tue, 24 Nov 2020 08:08:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F9B289D5C
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 12:32:14 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id B60F5E28;
 Mon, 23 Nov 2020 07:32:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 23 Nov 2020 07:32:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=ef/RNcMNddLpUtmqpwpwpZ6Ud3w
 MzRbMaXsHTKMDB1s=; b=Dnp4bJps+1pTbIpaQTR9GszGAZAAcv9kO8MekfKtfo6
 qDgkn4587eck4rzqBdIKTOLGN/e1dayFaaNxN4ZlRaqbAn8benLYluOIPZi/91bQ
 3dehJSHPlQDEttOHV0po2DcTk58yxssxh9rmpsUzgwVRXnYTbttdCTIoLePDXRnX
 IitsrXwUJBqyLLUYLITedy6Y+Y+rsiXNytvaVQvsEBOVWB3ibl/pmpSAbdTZ6NgY
 BhxqCiLSvOAsUl2/uFLujDljVqWyyq7pyHHCJCP2ORsBfgQmAwywLq0MPMzX1jKF
 ePRZiBIJxqsAEzJaQ+3W/8Y2ZduLnxYxKde3xfoowbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ef/RNc
 MNddLpUtmqpwpwpZ6Ud3wMzRbMaXsHTKMDB1s=; b=C4QAh7vMjbDkx26Y9NCZhH
 dCUTElcWelmG1hsw8M8PxbPu+c4BeNEBDqtfEPJXQbEc2/dKMDbZvfTzm2e0D8vF
 aAPA8U1rUCeVz5Nca1y/drcthtObyCcM9wtMtfD2Pf5e969el1RTVgpFL932VGM5
 jqo6xllVpNo5TkFESxUSMrwrX+vO3Py15P5cuF6W9iw5u0jkdEzcDuo90fXcLi6n
 tlx9yddDo5a4F5OhvDAFg3o+GSXr0WqhEsJiiBPVYTMNK+6+f9SS/WwL043xdoAy
 uZtNxRl5k/gMU5A7lsuFWpykcfBjPjrnKEZvKjmDnIOHMy+jRySy02Ybf82Ir+nw
 ==
X-ME-Sender: <xms:yqu7X1QjKuOjTcozKNtScgejVpipPI0unqNkZhntl2SK7nJVvqGGiw>
 <xme:yqu7X-yeFEa-Ht20wJRP8qgAANhKz0xLXbycAFb1ee9fcHhDjOwOboHe08kG52-T_
 jpRLCUWOuxUlh33XnI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudegiedggedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:yqu7X60KgH6dz4N6Ren5DFHGD4LMQGV7bn7gB-cH8X0R3Ytp2GMhAA>
 <xmx:yqu7X9BlewjBZB9prOnrBHgU-OoUUzPOEV6TSAOnnd6j5MarLzVMpg>
 <xmx:yqu7X-j9BvID40lZjoUQCsS793LVj424Q5eBirjCAvQ_lfeuDM5WgA>
 <xmx:y6u7X_u2FoUdtfGbXQTnZe1Pauo7xeWcEZYwHShXJ_FzDg7dYtEb7g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D8BDC3280063;
 Mon, 23 Nov 2020 07:32:09 -0500 (EST)
Date: Mon, 23 Nov 2020 13:32:08 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/2] drm/cma-helper: Move mmap to object functions
Message-ID: <20201123123208.cjzsiat66sjcfur4@gilmour>
References: <20201123115646.11004-1-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20201123115646.11004-1-tzimmermann@suse.de>
X-Mailman-Approved-At: Tue, 24 Nov 2020 08:08:40 +0000
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1417728982=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1417728982==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qnvz6wy6s7r6sx4x"
Content-Disposition: inline


--qnvz6wy6s7r6sx4x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2020 at 12:56:44PM +0100, Thomas Zimmermann wrote:
> This patchset moves CMA's mmap into a GEM object function. This change
> allows for removing CMA's mmap and gem_prime_mmap callbacks in favor of
> the default implementation.
>=20
> Tested with vc4 on RPi3.

For both patches,
Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--qnvz6wy6s7r6sx4x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX7uryAAKCRDj7w1vZxhR
xdvVAP9vL9HhjTqNgKXs7v76qiRkeo53bKdBtKjzTbzbGxfOfgD/SXqDDOE2pB/r
0IuujppulJ1tmeoLLpVo0YiSkXTVsg0=
=sO5J
-----END PGP SIGNATURE-----

--qnvz6wy6s7r6sx4x--

--===============1417728982==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1417728982==--
