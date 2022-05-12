Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 042C4524863
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 10:55:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8092410FC65;
	Thu, 12 May 2022 08:55:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E62B910FC65
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 08:55:15 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id F1D3C320095E;
 Thu, 12 May 2022 04:55:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 12 May 2022 04:55:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1652345711; x=1652432111; bh=76WkP2VfUr
 tCYkj0/+l0ZpxaKU1NSFwWx6D8oQZrZWA=; b=dRwzJOiOOXFcOpaTQJ7l2XCZSG
 xIs+/nLxOngrknu5RsONAwy4WFLE/UIEkavaWoJMRS8ycJ5bWDJex9Emp1BMMmwl
 B44WaLjkDpFIvK2m26OXIb4yjIg6NR4fGOzoIHAK6ry9uzrXluu4yO216oJ5HyvK
 Trg0xTz11KP0d55kBuJz2tieszAFYS0vn1gYr/XAkvi0Noe4NgiYiS6JwEo0qqOq
 0234wca+X7dClHsd898pvTqzHZx0WHzBQvQ686dClzrSgks97efKmDf5j7FGPWsf
 7eTbSFGHDtFIqAgmwia4Ey+dcTpeuIMbV1S45XvVVhZJ5rjviwfZh6XEW6KA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1652345711; x=
 1652432111; bh=76WkP2VfUrtCYkj0/+l0ZpxaKU1NSFwWx6D8oQZrZWA=; b=x
 /sBYtmOrp+4t7f/tLBDilajqENNBXbCWcC5sldZuWAYU+abzuQtHKMiInERmuRyx
 tpOto1J4xGUsc955VaM2m04t21nCj8TBfxMaLwKeVpoppZlzZhwX298fdEPdyP6F
 defPGDxuYlhRw5eiIfuXOLdPuR4aMNUoJX4XMxHdOlTTGB+pHwEYg7N/QXNcHJvZ
 mtMhAPGfOVkg3SewMHvMEJTs273oXDYdiVunCOOTwbjNWQgL2X2ecLtjtiXpiMcZ
 s9O7Yms7MUAt4axCSOIGb3NJz8vkUb0iDUuORgfd42U0ufAV1ZO+rCRFFPp58yJR
 oyXKHoKhz8jBkCdxy9MYg==
X-ME-Sender: <xms:bst8YkGRxPW4Pte_mfew_Ri2cv0CnT00fjX7n2nWxZVG9MGjBLMqJA>
 <xme:bst8YtVaFM1VPCo2C0ppuH9KZnxqbQ2eKQCkjkTyG_9QnrQPK9qwbvN7Iz9GZz6WD
 V_3xdkKEMqxKPfN4_Q>
X-ME-Received: <xmr:bst8YuJiAgUwkuiju7sohr7AVLi5r8v6vaoKKVNDlXrC7ZHabOnLgOgOjHws7p-tMf737N5Is5vGpPChqVHtx1knTdh4kLYj4sTb17U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeejgddtjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheehfffh
 vedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:bst8YmGSFrD-XYyeHmpqwOfsOytF5VN84iSi8xXnoZOueKaUriBIFg>
 <xmx:bst8YqU9z4x2GgVR9rFKiaBH4svs3JYYmmJRckOROu-GpihWylmPKA>
 <xmx:bst8YpMZopAcoBV-VGLLrQpT3hyDbK2Qdz6IiyIsMRWTEjZz663Mkg>
 <xmx:b8t8Yoz8Ps86nEYifQT3J1kriAjf0Z4a0mUqkAPI7mZ4GR6C7tysWQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 May 2022 04:55:10 -0400 (EDT)
Date: Thu, 12 May 2022 10:55:09 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/3] drm/client: Fix display-mode selection
Message-ID: <20220512085509.kkffrhlypayhuo23@houat>
References: <20220511183125.14294-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="if6a4whwkryybru6"
Content-Disposition: inline
In-Reply-To: <20220511183125.14294-1-tzimmermann@suse.de>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, javierm@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--if6a4whwkryybru6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 11, 2022 at 08:31:22PM +0200, Thomas Zimmermann wrote:
> Pick user-defined display mode in DRM clients if the mode has been
> validated by the driver. Otherwise pick a preferred display mode.
>=20
> Booting the kernel with video=3D<mode> and giving an unsupported display
> mode can easily turn the display unusable. This is best tested by
> booting simpledrm with a display mode that does not use the firmware
> framebuffer's resolution. While simpledrm filter's out the mode as
> invalid, the DRM client still picks it and the console won't show up.
>=20
> Several factors contribute to this problem.
>=20
>  * The connector invalidates the user-defined display mode, but never
>    tells the user about it.
>  * The DRM client doesn't look for user-defined display modes, but for
>    modes that are similar.
>  * If no similar mode can be found, the client adds the invalid display
>    mode back to the connector's mode list for use.
>=20
> Each of the patches in this patchset addresses one of these problems.
> Overall the DRM client has no business in display-mode detection and
> should only pick one of the modes that has been detected and validated=20
> by the connector.

That's awesome, thanks!

For the series,
Reviewed-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--if6a4whwkryybru6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYnzLbQAKCRDj7w1vZxhR
xcLZAQCmaFZm5VML0zj8eT61S8TNNWnJw2O0srCY/BQbQYp0mAD/RkvwTrNhcPhn
y3biVwYgPt1dMR/VYAG1glSW9CNEKAk=
=nW+V
-----END PGP SIGNATURE-----

--if6a4whwkryybru6--
