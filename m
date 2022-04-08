Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA344F945C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 13:42:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A618F10EFB0;
	Fri,  8 Apr 2022 11:42:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1996510EFA1
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 11:41:59 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 6B8C35C013C;
 Fri,  8 Apr 2022 07:41:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 08 Apr 2022 07:41:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=IXqg0U4DnRk4Zk7JHLf3wNfsPx06XD2qd9bODQ
 tgAeI=; b=ewlBqd2n4tJLg3VzfBP8LG73j7Qwc2wml5/BuKb19vTzQBvorAIFMw
 JZf4endumFl/ZZO+ocjLiFLz4AxXph7QTWEuCSXLYPYBEcf7LwEmPytNMmqWraMZ
 WSQaiBaRxEymjWk4q8QJE+9zZFpBXe/YE61Q+SaVFIlqom/lAwD/UQ78V3H7XF2g
 XVUp3YbM82vftmYI9UvTnJ/AK1o713yzqpZDytUXVnMAaB6RIDmmNiCXJxaruzgs
 gDDsSQDb1uU2oOXsrKm7f+03oXjHtv0mlCRiNR8+J8KuW5beSEs1tMTJAMh5oRK3
 dVjfBpV1gfTgHdFJ7KfA74J8Tgg12+Ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=IXqg0U4DnRk4Zk7JH
 Lf3wNfsPx06XD2qd9bODQtgAeI=; b=Uz65avoxmleFxdqEJcAMetcGl1U6Pylv8
 YJND/P2JjaIaUvfnExJfHxiEhl9A37WP6dXk5ULG7eEB1RqslTLw7Mz9kxzXlhD6
 5eB1iB016zAxX+kBiXZtimwTGav2RGOHhM1zn7tKbcOdCidxp4IXP1mBCqTGouoC
 +OP9d7yAU3KNCAqoAxVR0u2HL1xVT1yOnZCtN9ItpiB9D6QuC8QyJP2vlWMxaGSP
 kGqD1t5l8L350Ko5ViDDnMQwaU3xzIhwhFNt1qmkmDzhezs9PEnGHCgh3yNCUSgl
 m5Go5gCQnoXt2jqyj0coPY3t/5KYw0jgrr4FN9FEPHYpMgx6IUmZQ==
X-ME-Sender: <xms:hh9QYiS-XxrsNkHWzt4BHVZuma72LUrBdgO5P33f4P4hg9DdaRI1-w>
 <xme:hh9QYnxpvgj5AEx0-s-Jgs4VFDoCe9_9kCfHWtfE-Po-9JHJVTt3ELGb1HlWxFe3K
 8HwZfOoY5jjVZw7Thk>
X-ME-Received: <xmr:hh9QYv2piInY3rs_t1_A_4Xf5jtHPAzCQA-72ejqWk-jAbeTSPCOf_HBZ3FhOM9Z0P3Cz8Fz15kcb5kWS0xhKaRjMHIYBOd8qmZZm6E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudektddggeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:hh9QYuAaCbhHHnrsbGhtyC1kjPC8RoVqygobXm6tCSpnMnE3XhQ-ZA>
 <xmx:hh9QYrh1ycyFOIaCRNsnhbsQk6Bx-wCqEwqQoaOjS6CA20V96scAtA>
 <xmx:hh9QYqoLEciBG4Jr8JpiRKEsXtPwRR2nV5RUOpgezwBksUy-Q8QbNQ>
 <xmx:hh9QYot8q4tPTexfu1TVTyAHUaG4_CtKe6-F75_Fncptw6xSxpjJPg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Apr 2022 07:41:57 -0400 (EDT)
Date: Fri, 8 Apr 2022 13:41:56 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/6] drm/vc4: Fixes for the writeback
Message-ID: <20220408114156.lwdto6qurmm3jikw@houat>
References: <20220328153659.2382206-1-maxime@cerno.tech>
 <165a2746-29a7-6749-08d7-f0c7086378ee@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dmzhwgmyhgjs4kne"
Content-Disposition: inline
In-Reply-To: <165a2746-29a7-6749-08d7-f0c7086378ee@suse.de>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--dmzhwgmyhgjs4kne
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 06, 2022 at 11:10:12AM +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 28.03.22 um 17:36 schrieb Maxime Ripard:
> > Hi,
> >=20
> > This series address multiple issues with the transposer support, and th=
us the
> > writeback support.
>=20
> With my comments considered, feel free to add
>=20
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> I cannot really check the correctness of the individual HW operations
> though.

I amended the patches with your suggestions and pushed them, thanks!
Maxime

--dmzhwgmyhgjs4kne
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYlAfhAAKCRDj7w1vZxhR
xVGPAQDVeaQM7LAuX3MfV+8I9nnhAon8Ulc+uH4Xpx1reCnuAQD/WjEGOVzJyV8/
hNvKifcBHVfOSe3jBnI+oNRhTZJzGgU=
=G121
-----END PGP SIGNATURE-----

--dmzhwgmyhgjs4kne--
