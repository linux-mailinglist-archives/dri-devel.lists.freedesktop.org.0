Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDE24CA16C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 10:56:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8FF010EE3E;
	Wed,  2 Mar 2022 09:56:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2410B10EE3E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 09:56:00 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C63985C02AC;
 Wed,  2 Mar 2022 04:55:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 02 Mar 2022 04:55:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=jnSLu4ZrEfC0BGS1cbLS7i5AARWUyd9dmNjDQ3
 nVY74=; b=k1zmtaYrqkRzkQW6+ym+zwBgHjbRQy+zzODOLp+k3y5Sn+tF56g4DW
 oZdohJGs4afxZ4LgGS44oRep6fD9r5qcGfR/XSI+9wI3gV/wnsWerRfy6exzc4s6
 EGKR+o55cnwKtq2T0Ywwaq0bH00Y2WI7ybiGSWAJVcXPSgxaBR/1HbGlf8AKWHVV
 uSpGDlQ0BPrzyDRD4ZamkPxW8JaywrS/luz4Y1sOM9t8qxjuVRpO2sgMGLPhMoMa
 W5LpGhKT0gF/x4DKnglI87/AYF9PeoEvusrIphQ/7M1covIy1mtTp8lHLCgl6Dvk
 VHbi2Ft1iflKfFcEPKiqJglzgjqH0GSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=jnSLu4ZrEfC0BGS1c
 bLS7i5AARWUyd9dmNjDQ3nVY74=; b=FTt/tTwomA33E2XfysUgTO+IMdTj30HdN
 UruZR/Oi9twGa5GMaF7/ux/OKk+JoHQadh6qS3sy7c2VG2QAXiPeEoMe846L/Ob5
 9YdYRm54CXleCn1S5pjnhU8mzNlReP7Ncwbv/A5/Pochv4nu801QPkStGttZK36W
 cgkWcWB4f7gj1bDn7Qe3QdGX5AyVD4flGeWHKOUoKaELy51ie1TIWpWGmOuD0JUE
 eBjE8m/f5E50ydgdDOfKCaLWqQqyrtpQM4Wl0OAfT7fNKt4yiiGQzAGX1fTwT+b7
 Vt8spyKJY50qJ1EIpwkZZtUhZj0vx/GpuQHIytPO+ePMOmhHB805w==
X-ME-Sender: <xms:LD8fYj0Dq5lCMmjms6NfIgyfWvwwvPaqyWqyyLFvUJucp-PwTBAX_A>
 <xme:LD8fYiFL6zxnnPQ0WUWgXaXlo_uSjwKfxaKAR60QiC52Z3rseRjn4BjFp3t0T5WxA
 n8bCjWjKgEZ14NQ1RY>
X-ME-Received: <xmr:LD8fYj77ei3M5qM4jD0GPGxIIl1RWbhzm23bny6sLFaM-LXvRI4ci5KHa5wH9BJ1GZuOmsIolbo7zTBKYeOcwQh1FXAs2aCORztxz8s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtgedgtdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepveegudetkeethfetgffgtdekkefghefhffefgeduleehgeehieeuveefgedv
 ieegnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:LD8fYo0ZIoFy8UQ05xX3oUVUlUgjjjYKJtTdpCcHKrvCS91qjfcVog>
 <xmx:LD8fYmFTua4DfaGIg4QFpdN2-9ZKnkDq5OZKX0E8wZI9noU0Aa9ctQ>
 <xmx:LD8fYp9CJGKKBTjg3Z52ktXFOmGeoRGzauKzBOyvKf7KnrDJfNwEnQ>
 <xmx:LT8fYijmPv7OjJR3GT1Yq0ynupz0l_FFgJlg7BdkGqJQ6n0et52eBA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Mar 2022 04:55:56 -0500 (EST)
Date: Wed, 2 Mar 2022 10:55:54 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V2 01/12] drm: bridge: icn6211: Fix register layout
Message-ID: <20220302095554.v4kknz4qswvnad4e@houat>
References: <20220217002530.396563-1-marex@denx.de>
 <20220217002530.396563-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="owmsv36pjt3zowbo"
Content-Disposition: inline
In-Reply-To: <20220217002530.396563-2-marex@denx.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--owmsv36pjt3zowbo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2022 at 01:25:19AM +0100, Marek Vasut wrote:
> The chip register layout has nothing to do with MIPI DCS, the registers
> incorrectly marked as MIPI DCS in the driver are regular chip registers
> often with completely different function.
>=20
> Fill in the actual register names and bits from [1] and [2] and add the
> entire register layout, since the documentation for this chip is hard to
> come by.
>=20
> [1] https://github.com/rockchip-linux/kernel/blob/develop-4.19/drivers/gp=
u/drm/bridge/icn6211.c
> [2] https://github.com/tdjastrzebski/ICN6211-Configurator
>=20
> Fixes: ce517f18944e3 ("drm: bridge: Add Chipone ICN6211 MIPI-DSI to RGB b=
ridge")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> To: dri-devel@lists.freedesktop.org

I don't know this device, so I'll trust you on that one
Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--owmsv36pjt3zowbo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYh8/KgAKCRDj7w1vZxhR
xTsDAP9co+GWV2daKh1UTWUgZj3zdaCN/ujf/wxzD7PVlt2NYgEAz9KrctjEQ76K
HjSuKK6/dz6j64hbttTKiuwd7eLRjwQ=
=XXme
-----END PGP SIGNATURE-----

--owmsv36pjt3zowbo--
