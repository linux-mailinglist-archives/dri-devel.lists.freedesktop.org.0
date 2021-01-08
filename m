Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C43C62EFF3A
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jan 2021 12:47:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7112A6E93C;
	Sat,  9 Jan 2021 11:46:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E7746E825
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 15:16:55 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 26A4B5C029F;
 Fri,  8 Jan 2021 10:16:52 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 08 Jan 2021 10:16:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=gEF+iBzLjyM0wR4beTJu/4hWPgq
 l8ApHKnxPAJ6MBH4=; b=WHlIMc5D6BTn8XDQfmgzuZ3/+OoY17VT7qzX3lYNb5p
 rk4WyMNCsINENeIRfnlFs7Rc7By0GkzB+2LC15hi18/XWtjI/atbauhlZBuRr3Ad
 cYIvcOZRRlpMBhKdJgXK59N+NbpByTubsyCp1VVf1CXhBRppxleaFXtE3q+Ps+Ch
 jX+JCFxC65OOFwxzcqk/nzSSa1tzkVrilYQyATynVAUL8indOnSswKxUy1w4B0pq
 DwxVJsSX8oWgcRQzCrpA7GvX+Rc79LVpzWC4djqUV/PaUMlA4/iaPp5zEaFo9Ya9
 C/hrzQ4sK0407naq2ZxGlkAbTLR2Zjbu9Lx+13HOONw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=gEF+iB
 zLjyM0wR4beTJu/4hWPgql8ApHKnxPAJ6MBH4=; b=LJU0RwYmkRSzTHJOKaoTk1
 7t+009qY/A+GTF/g/va/jUU4DO1whjq6FU7RqsfKcYiNCj7HxkvM3kwIzckDWGEw
 Hw/6mMvIO9wZtEzONGTv5wDXNmNIJ4uaD6G3GmlwB5b8OrWWBedcHbd8SvMDCs4j
 E89KhxvtgK4DBiWAsqR8kvbh4DZjtftL2ryV/yWjO2m8Y5BKBCV1L8flKADyvgmB
 pHtGk0nMSAYeIZ7thg4mOwV+uCmA4NLLBCbVfQ5bhs5zUmqbp++IsYb7awProh4l
 C9fQBMEki0QPUbAfNp8cBfpOR9C5BE/P6HzqzD5oy9bV/4JXSd+X9yRp8nFOme8w
 ==
X-ME-Sender: <xms:Ynf4X-UiD1tRpjnhEgfnWKgjBczWKn82r6CZW8zklqdoQeWJOGD9_g>
 <xme:Ynf4X6m13WfTYOjQC3fwqXNBJ0jLKCNlFufnmIhQ-ErCqpkQ7r4NkQkn1sgB_o-y5
 eRCN_04afHBeiFCVhM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdeghedgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepveevfeffudeviedtgeethffhteeuffetfeffvdehvedvheetteehvdelfffg
 jedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledtrdekledrieekrd
 ejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
 rgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Ynf4XyaHyGc8AhHqMad4wvXf3tJDlqzE4avWVX64tccIG8xrUCci9A>
 <xmx:Ynf4X1UbuSlqPsO2O0U8ioBcwAGb2Y4v9s43i6m2C32SOyofosBUPg>
 <xmx:Ynf4X4nF_jbU4pFNnReX9I1UbDseV-QiKL5NOGnZ3DzESpVzROWFuw>
 <xmx:ZHf4X9yaH7RmPycGJjx9eFx-Qd2zi7AGxjDFgZKBTDaK-hiroCWLqg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3AB23108005C;
 Fri,  8 Jan 2021 10:16:50 -0500 (EST)
Date: Fri, 8 Jan 2021 16:16:48 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/3] drm/vc4: Streamline the vmap and mmap code
Message-ID: <20210108151648.lg4jor43u3ybnlzu@gilmour>
References: <20210108140808.25775-1-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20210108140808.25775-1-tzimmermann@suse.de>
X-Mailman-Approved-At: Sat, 09 Jan 2021 11:46:48 +0000
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
Content-Type: multipart/mixed; boundary="===============0127578104=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0127578104==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="otastfe3ynmz5z3t"
Content-Disposition: inline


--otastfe3ynmz5z3t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

Thanks for the series

On Fri, Jan 08, 2021 at 03:08:05PM +0100, Thomas Zimmermann wrote:
> Daniel recently pointed out that vc4 has test in it's vmap code that
> cannot really fail. [1] I took the opportunity to cleanup vc'4 vmap
> and mmap implementations.
>=20
> The patches got smoke-tested by running fbdev and Xorg on an RPi3.
>=20
> [1] https://lore.kernel.org/dri-devel/20201211094000.GK401619@phenom.ffwl=
l.local/

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--otastfe3ynmz5z3t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX/h3YAAKCRDj7w1vZxhR
xffOAP0Vut9lbBPMS3z9agOJJ/8htYRpLOoSyWxQ++mRXYgxEQEAwEprmz/wpg/7
xtTZmAjMXjhbG9UDeptzIrgEmSfXXQg=
=0sly
-----END PGP SIGNATURE-----

--otastfe3ynmz5z3t--

--===============0127578104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0127578104==--
