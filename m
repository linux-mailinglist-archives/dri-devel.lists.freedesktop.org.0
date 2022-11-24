Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DD56372F4
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 08:38:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA05210E68F;
	Thu, 24 Nov 2022 07:38:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0153D10E68F
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 07:38:01 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 5845B5C01D5;
 Thu, 24 Nov 2022 02:37:58 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 24 Nov 2022 02:37:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1669275478; x=1669361878; bh=ULupW01s0G
 yXcaEPcW42CI/HH+9rrYUZSnaM3DQOOKg=; b=KCW2Jrup+P6nHLvAfPsvuBQ2xm
 eMX0irHWHsn6bEawQy49UU7T809ocClS41+Wc7xzFbZrUA04OO93b5Hrvvk7yu71
 xof8EHJH1qoAqc3ltJBUhg7gs5R8ZVdWH9UNCVJ1+G/AIkHZ0RTkgYeMRW/Dbk2a
 FOg6hh1acCRCka6N053pXByo7iGu67hDzRu4dy4RhPp9h7N3IWWrS1NjM2ckecNB
 Qr86MLTY2hVT50gv74j38xjEuJ+1kH+BC8ybhbzr+T1NW+GWe7UTby3QxcYaSEdI
 dh6EXe8CZhAMNnXzWlQChMDF9k1ro66DbngilWuYV3jXb1MYbdESYLcHhljQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1669275478; x=1669361878; bh=ULupW01s0GyXcaEPcW42CI/HH+9r
 rYUZSnaM3DQOOKg=; b=nmNQQYWJqKKDMXFO3lkPMyj46vpOzz7NiHuzVhPQRcrZ
 ML41sWG5etm7xhXzX0JW32HxjIfWX79CIHuDX31vxH+dXnkHPDs5p6WuLy+nRbQA
 PCREHFfSvllIfdgO94kSJMO3w0U15p5ir9/U7nqHco7nct5rCkdaJnIA8uq10/zl
 Skr14KlKmjeMn3hPDm7EUz60yxXiOHq/mQP4+BhyeciTGckt6W+veF7Nt9BMb7ds
 lIMqSR03eKiJM7KKfLYou8StAmpnV1dq4enkYN1fsIqMHH4VBxY16//ghouYgXyj
 QuHa7yXO58s6t7rUiJp/NKXW4n5vyalucJHbvOSr4w==
X-ME-Sender: <xms:VR9_Yw1rcZRoIPU_OFyfxOxMj9-VNy5vQG6dIpoHomLAfIpbbClEkQ>
 <xme:VR9_Y7FealhffGhXmolE262x1fiFggGOvaUDc78X_HVnIdiD_42JxCBiyKLaxsfcm
 rT1rKSAg6zYuvz8IwM>
X-ME-Received: <xmr:VR9_Y46v6fZya7AZRmAQ8bNQJeD9yJmT9Cde196LB_uCJrG0WO07M-JTY7VHdWciBXgOZLT-caxRoeJTEsgj1RPSp5ziahj2KIeM2up58rEbFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedriedvgddutdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:VR9_Y52_BFUGLr5yM67G-IogY_JzVwNQeNqInWeXYjyY1oC3E0xlVw>
 <xmx:VR9_YzFoLH4eJg_Pqr-cN_ilPcK_fSwuEueywgNv9qLPtGQsSZ_qdA>
 <xmx:VR9_Yy__lqon6xTCHy5x2t5zVrd3ocvAePD4CiNC8_xY7jqTXroEpg>
 <xmx:Vh9_Y80PgpLnYU_CE2sbVCHNOcHYIKXDLcmPKVm3rSEVCSTrvG1XCA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Nov 2022 02:37:56 -0500 (EST)
Date: Thu, 24 Nov 2022 08:37:55 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/fourcc: Document open source user waiver
Message-ID: <20221124073755.2rgqsvcgn3dujn4p@houat>
References: <20221123192437.1065826-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6qeff5fitdggd2om"
Content-Disposition: inline
In-Reply-To: <20221123192437.1065826-1-daniel.vetter@ffwll.ch>
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
Cc: Neil Trevett <ntrevett@nvidia.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--6qeff5fitdggd2om
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2022 at 08:24:37PM +0100, Daniel Vetter wrote:
> It's a bit a FAQ, and we really can't claim to be the authoritative
> source for allocating these numbers used in many standard extensions
> if we tell closed source or vendor stacks in general to go away.
>=20
> Iirc this was already clarified in some vulkan discussions, but I
> can't find that anywhere anymore. At least not in a public link.
>=20
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Alex Deucher <alexdeucher@gmail.com>
> Cc: Daniel Stone <daniel@fooishbar.org>
> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Neil Trevett <ntrevett@nvidia.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--6qeff5fitdggd2om
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY38fSAAKCRDj7w1vZxhR
xVDEAP9dI1eV1VTse1zxlQs4jV81uwGRL6ORwmIUTyjHXVKRNgD/act/Zb8DjPKK
o+Jui9TI1ByiYgsZ52e3260pt3QI/gk=
=A73g
-----END PGP SIGNATURE-----

--6qeff5fitdggd2om--
