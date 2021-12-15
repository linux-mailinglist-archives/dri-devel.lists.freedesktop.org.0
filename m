Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1DB475B53
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 16:04:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE5E10E4F2;
	Wed, 15 Dec 2021 15:04:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B7C910E4EF
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 15:04:54 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id BBB5F320153D;
 Wed, 15 Dec 2021 10:04:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 15 Dec 2021 10:04:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=KgfDZZMinSx4xeiUFEBRRJYDWzj
 2bISlW7PBxcxgo5E=; b=lFDYHSlbpZRL+xMBi27jCGyfuoQeODN7IuFSUnF1m6Z
 bNITFW5wCnczlUUDf44eM8ptJEpv7DvvSqIIqgvQh2Aer3TtL9Ex71BcGHjdC+f1
 N+3cq++WT65nokGj3v/HBbA+dIVb6Nj96DElWVugiiX+cDyZHAshb6YYrjyk4WxS
 rfe9hccT+oB4j/HQjPTw0TiVkKjLI894WPHeme/elCH/3OAJoTE79HP6hocQp8Na
 m/7hqsEfyp4W4vdjHXQfNvkj/U4PXXlUKkt/6GVqyju0/MZYRBx+5MNwcQEzA+ke
 lbyDkXih9i8CNFUo0hSqGbUuHISy6euvtO6YLlEiFXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=KgfDZZ
 MinSx4xeiUFEBRRJYDWzj2bISlW7PBxcxgo5E=; b=ibj7peUslhdbNpoHc0Bx90
 GnKTZtCwdL7nEEjVuMlSM9WIRJMjGq/m11dcAhtN4PprMmiqyg8WXtdINDW73rFP
 GbR0Q8Ssftt9uIqTF6919qnBuxovXjMd0RvAckh0gFJDfN3ZKD6FkOrVXoQnR0Vn
 UAYrEzoeUk4UVgoLFZW7GpsrdexzCZpU6UddJ59GbgFGE76MuO6SVBTuM0Z4t5+1
 gOH6qYszOLhyh3BFpcuA07fTtikIytKTLsklRq+9/QEcHXaw7RIyPYUmYv0J2lBN
 pm6Wx/go5j0DIHyrJ8T5is3acWDvBB+8vIFi1c0h0cCPP997lXpMbhHvaV9K71CA
 ==
X-ME-Sender: <xms:EwS6YTy4dRZbWvXhuelH1bQAqktO33YTMAmd7m3pEue1T_-Rog1Bvw>
 <xme:EwS6YbR163p-coc_GHwUf474YX1cpjg4jtY6hTxaxrB1coqkAEaaJCRBQ6DNrvlhr
 1PMZXEAdmtJt5aerJo>
X-ME-Received: <xmr:EwS6YdUtUXNRDAsPUc0dsJ7y6AaIQcGBLW1A-tDDPOnHG-nY-y-kOZ1ZUjJpOkgW3TCbagZ53l3eGbLwu3s5CfWzIWsOYrSmxBe6S0M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgdejfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:EwS6YdhN_UNXqycpW-H2Ovr6uCYtm5HBCbwX4xkDMCqGY3D_WwDvkw>
 <xmx:EwS6YVD5LdYZQNNqiA_9pDPovuMlJGfGLP3_zYRYyQfZDLMTvY0Yuw>
 <xmx:EwS6YWKjNzahy5W4_PYNLnaDGqjrnkv0t6v_EjTtFjBWgqzsj6JqHw>
 <xmx:FQS6YUNTeOwGy7aGod_3vvRed_AhZXAhW5v7ror9vybWhbNOPup_mw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Dec 2021 10:04:51 -0500 (EST)
Date: Wed, 15 Dec 2021 16:04:49 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/3] drm/ast: Convert I2C code to managed cleanup
Message-ID: <20211215150449.dfgqhirkpmt6tyhk@houat>
References: <20211201153100.403-1-tzimmermann@suse.de>
 <20211201153100.403-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="s5zxzcunplmkhq3a"
Content-Disposition: inline
In-Reply-To: <20211201153100.403-3-tzimmermann@suse.de>
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
Cc: airlied@redhat.com, sam@ravnborg.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--s5zxzcunplmkhq3a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 01, 2021 at 04:30:59PM +0100, Thomas Zimmermann wrote:
> Release the I2C adapter as part of the DRM device cleanup.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--s5zxzcunplmkhq3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYboEEQAKCRDj7w1vZxhR
xRgIAQDwdyWaVdSc7A8uO3Efisva/gFcYvmc2Um0RMjuF5P5agEAhnhieGAZOfK3
YNg3FazRp6k5zMeHlebVe9HI86vuDg8=
=VF/m
-----END PGP SIGNATURE-----

--s5zxzcunplmkhq3a--
