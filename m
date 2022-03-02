Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B89654CA1D5
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 11:08:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F5B10F37E;
	Wed,  2 Mar 2022 10:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C6710F37D
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 10:08:28 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id F11545C03FF;
 Wed,  2 Mar 2022 05:08:27 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 02 Mar 2022 05:08:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=6PkVLK8I8HKXXo307qiL9Y+ZZGvieY/iCvXw9G
 RyY1M=; b=VtBFMv6cML2UgS2bnhtqqfBtBh4uIJibCft6dHAA7k7QFq7RC1vMkd
 vL5bdNER7pUCyxeEWnIlvc8I45PEYnbjW/CeRAhyzpdpJlgCBAveQ/tiy2+r+fEM
 TL46VS34RgNcIOCDXYk/TcxyUzg4Bi0+lnWFM3bW3Pgq1rQB6NtDSohZz8FNubL2
 UimPngaIQK4r89uKISOSyAMTT0ogDpb5b2NcTCV0hMYVItAsgCexagmf0sCcbsP4
 CIx1jjcBWVwPCXoXEeiRq5SjwGRr1CNwFWeAuud8rNsvHhwXG0pi4RRVqMSP+8ht
 yFqdWHoEA7Xd4UsF7k6a+/WBy/hDYDJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=6PkVLK8I8HKXXo307
 qiL9Y+ZZGvieY/iCvXw9GRyY1M=; b=Ygu+zw745hyLZAxEfDz1UmBa3K+ZxcwYC
 SAgVxSrZGEsnNUFp/hIUrZvGIsCjB2/GOEV9ggwHMSyW91HH3O80VIMhbusuZvBb
 al2OHzGQucM/5VLfnQE7j9zHLtbKTxC7U1rlDqaIKAX46jNJ9Cv7ys8LvAsbgKkB
 cW60O9knl+qTx/yfRwd3WDSqiSszm+K1g+HOaB8tnCKslGFvN8pqe2N+wR2UJ5J0
 25D4aq7GBwLQ2uJx6DEcrqQfMDspY0jFXWGIOtdtKbd0MO5fi7FLFYNK+dS+gNGI
 iLVIlqKt21TUlnaWVlnBJEnN8u6wPVfTdlu1Z620jo+hiNURq/15g==
X-ME-Sender: <xms:G0IfYkjiBckUJPTbGLDqpPa9Jk0UodBk89QNnStE9y2fGGHDo-ttBQ>
 <xme:G0IfYtAkJDN2TKrrzvA3dosQBNKRxl9qfJPl5vpiz9kAVAb6Vy7mgQoilgeSIYDuC
 V_27cqSDWo9eaKsNc8>
X-ME-Received: <xmr:G0IfYsHkloZxfVUAKVRADFKtHmPDJfDn9TXAPYni9MqvlIFxqyaLvf2f037zjZjYgbdRwdr7i9IhWUh737-mh1ofaGyddAI6iAb3cHA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtgedguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:G0IfYlQ4lGSctkOCaeJudWvI4aVZMTw5YRVZuFt1KBtb9oCM9Ryq2w>
 <xmx:G0IfYhw4a__Y0Xe-rBTBbD5lCuPrYqg8w_65HIwQoAAznIT4aj8lmg>
 <xmx:G0IfYj6oxpd-_fiaDbzqY-GQdcUD1HyDjQ7FYYIHf5yFqmhEeY31XA>
 <xmx:G0IfYjsI-Xb5JpLHE8ifrGUob-iA3r3x5wNkAOiHZdlZPwH1Vx6rTg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Mar 2022 05:08:27 -0500 (EST)
Date: Wed, 2 Mar 2022 11:08:26 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V2 12/12] drm: bridge: icn6211: Read and validate chip
 IDs before configuration
Message-ID: <20220302100826.3bv6v3o7d4bhtndq@houat>
References: <20220217002530.396563-1-marex@denx.de>
 <20220217002530.396563-13-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3cv3tgctva4yzlsa"
Content-Disposition: inline
In-Reply-To: <20220217002530.396563-13-marex@denx.de>
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


--3cv3tgctva4yzlsa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2022 at 01:25:30AM +0100, Marek Vasut wrote:
> Read out the Vendor/Chip/Version ID registers from the chip before
> performing any configuration, and validate that the registers have
> correct values. This is mostly a simple test whether DSI register
> access does work, since that tends to be broken on various bridges.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> To: dri-devel@lists.freedesktop.org

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--3cv3tgctva4yzlsa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYh9CGgAKCRDj7w1vZxhR
xTP9AP9Ph9XZ2ahiwSgQJOvQBfFGdWoSjm4LQpmBcvVhFdnUygD9F02XgMCScqUR
oiV+q9yh6qIzfRPhmw+fnV36SGjseA8=
=PH8+
-----END PGP SIGNATURE-----

--3cv3tgctva4yzlsa--
