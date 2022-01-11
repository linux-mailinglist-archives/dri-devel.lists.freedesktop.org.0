Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD6248AB93
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 11:40:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F9510F2D6;
	Tue, 11 Jan 2022 10:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE5A810EFF6
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 10:40:22 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 38086580440;
 Tue, 11 Jan 2022 05:40:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 11 Jan 2022 05:40:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=C3JTjYYxj0pZNehnLmaGmXDui71
 qZDp0bI+uIeLilfw=; b=lCBfd9vcGNgOsH+P5FE1fo6q2X8mOsrStWR7XGamgQt
 4r0HhiAs53MRkfoDha+umVuO1PomnJoIWUpDkg9leH2NVS8YHGLJYWmdG2NO2xOV
 paMG8UaSxl2/yWNX6Q8XItcl6PJDUeFbO09piB0enVSIXCzQpwpYjGXE5Q6AWHnD
 prULm+nJu2TIeoV4DyafJriL7w/7PUy2Gsp2ruwd+N6V4PTJSWwUBAiTkze09LLd
 kwaLqpE2BqZBxBILVPDSauccz2/Q5p/FikfoqXnrIGWgX13If0fvchqPO/YT6xoC
 UVM0SzCDGJ7S6FbBFDItfGSuuSk+g/UsTkic9FEMJLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=C3JTjY
 Yxj0pZNehnLmaGmXDui71qZDp0bI+uIeLilfw=; b=BZekDj0Z8xKrD6MU2qDddt
 uQ1g//VNYKppc645NrOuhVeSBpXB7dwdd38TG+4driZw8yUQqvtwR2qIB3s/3dOW
 xdJ4dcNHSL1Ln+bQHa9+249yIwEGDr34sln4AI4rqCgei8BHXpK/Cg+Jw9mukk3p
 cF20vKcvWnPHKICfagvugLUN1R8PnwkFe9hdWH7rfJX+6tq2y9OaMy8WKNQI/QyK
 AFNpy/Wlz50aTd3gfmyYFlgfuQcYRCOCkagJEsJQSqlL/q0bcCDEiQOrHmGwzkzR
 PdSlzXyGqm4RY8COt87fY1Ojk/TizERNblNXFJugwHqV2t6guBc8F2CIqREjBMHw
 ==
X-ME-Sender: <xms:lV7dYUCl9lqwu9jpCwT7nLFhD5wSqlzTZknb0cqPRqehbEu_xGnutA>
 <xme:lV7dYWj4cXI40ocdOKh-rCQcRza11pgnBMpNnl3u0dnPZfCojex3exQOed-97uCr6
 bjwHB_aTFTOdGprut8>
X-ME-Received: <xmr:lV7dYXmM9EYFcyyryqPCB6ASn44bR27AuYNer7YZz17HwtGBsQszCFJId9bdZca_nr_qrbrO2Mae7HkUYIHZ2s69L0J79EGZyKo2C6Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudehfedgudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:lV7dYazxw56zSrbiewMeBnIBvkI039QziR38fO4PFDOApFwn_lLXWQ>
 <xmx:lV7dYZQyYtMNK6Z_0NpYI27nNTRGcDRN9TqyESc1iI7DkNPQyDmqAg>
 <xmx:lV7dYVYdl7ObBn-bvjZArxy20Fs3fN_1ij9mey67uRUKNrmF6u5KBg>
 <xmx:ll7dYeKRymvLho5z2CkcZVUnNj4nDKKr_bNZKGyrjCtKSWzQmMK2Yw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Jan 2022 05:40:21 -0500 (EST)
Date: Tue, 11 Jan 2022 11:40:19 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [PATCH 4/5] drm/panel: simple: add Geekworm MZP280 Panel
Message-ID: <20220111104019.e5e3e74riccaxgac@houat>
References: <20220103174106.907-1-macroalpha82@gmail.com>
 <20220103174106.907-5-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mmzfjhwm3u2b6ikx"
Content-Disposition: inline
In-Reply-To: <20220103174106.907-5-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 emma@anholt.net, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, mchehab@kernel.org,
 sam@ravnborg.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--mmzfjhwm3u2b6ikx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 03, 2022 at 11:41:05AM -0600, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> Add support for the Geekworm MZP280 Panel
>=20
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--mmzfjhwm3u2b6ikx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYd1ekwAKCRDj7w1vZxhR
xXL7APwJ2rr0nlvQpqa+FP49Cg9wStsOZ/C060sjOxoizrbAMAD8Dd3oYdjmKMDg
T/ZGTnLJnTyFLcnmDYazj02AYnIXXgM=
=Kckv
-----END PGP SIGNATURE-----

--mmzfjhwm3u2b6ikx--
