Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0608C595AFD
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 13:57:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7265E112298;
	Tue, 16 Aug 2022 11:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D8010E6D3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 11:57:15 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id A0B622B05957;
 Tue, 16 Aug 2022 07:57:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 16 Aug 2022 07:57:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1660651030; x=1660658230; bh=Bq03lVvJy5
 RJk5H2jo3OulUHY8HxQaSHcH39oL5pRFM=; b=LWkNGdC+qKavdgb06LCYhhdfaH
 EMilD3yNruebG4rdFpIEf/I4xnlrJyUn9xE6NIN3HxPA7FdOTeBHXU54ELxt9Vts
 /TEy3DDaL05UnzuFbzp2mP5cLACMIbB1dNecnbiMUWk1IVGBETPJ+1uhAqwZPoDH
 fqM7mZZE9VPgjTXmenP2OT8fEAzuk3AGPtUl/tpH1snsTs4n6xmjP7Fesne8J80k
 wsGf/8lSANiEam48J/7VUsCDx0BsEiyQMAHoo61crP6hQEIMd4HTPwEXsyDhCTYE
 LxurXivClkNnluoJqMoobh2U7tkI2YB30ImyM9+0Y7ar/9uTb7qZdpIGkfrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1660651030; x=1660658230; bh=Bq03lVvJy5RJk5H2jo3OulUHY8Hx
 QaSHcH39oL5pRFM=; b=tDtWMsyT9dCSohJZolo2mSo6j08so3UpgKj1hYIbmaXh
 waSP51wOKEb5Ply3yvRQLIEphIKB83VIekklo1Qg/TXsSZCAWvOnDUIXDTBU4QB2
 FAOPE4hIg/QY7GA3yfEmoohqHpKUcSg6M77BfxcAcAtIhbacAvt342Wn2sQQOm46
 ZanJnKgviDsseWtZxoJ5yFxBoDH+20Yk2UOUPc0HvbY37a+ILT3NtK+gNtMi4brh
 Ncrwgu7Xbhfd9ixEUFYDfskHcCyfm4NGgx6+skv/h1uZndqM+rTSTojNxZNWvCK4
 2vl5n1fgGuZp4WIT/3lFjWUnTuaskSPGVcucu0vEFA==
X-ME-Sender: <xms:FIb7YtLe5ycAPmkRukyv_usJsIdDUpXMX0U8k3o-2grPWxzl9iEOng>
 <xme:FIb7YpKneB3U0bxY4so0ZLmmz4CiKpGDWJchVJ5ToOxJkXQ6B5yOoZgq6fg1eE-yM
 XA14xtMLr9dBMUwt1c>
X-ME-Received: <xmr:FIb7Ylvd5ADF_a-_o0ncybmn7ALYvjAn7FgHBrMsbfySC45HMtZHZIex8Mc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:FIb7YuZtGT-7Iwe_2Xvy5OmK4cNcOxQIQw9CbOBLfM2KuGjmcGJVlg>
 <xmx:FIb7YkYz3LYKkO8f9qGZmPgeLoU2sXhTt7x39ofcXq2X36YoDaM5mA>
 <xmx:FIb7YiBVQSvOkGirQDAKVr4cCvKoB8kL1duQFv4bCXdB74SbkISo8A>
 <xmx:Fob7YhLKnsHr-bCzG1ZaYbIxRvAUXlz15kZU_Da8CLH5AUU0BayaHVe_Bpo>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 07:57:08 -0400 (EDT)
Date: Tue, 16 Aug 2022 13:57:06 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Mateusz Kwiatkowski <kfyatek@gmail.com>
Subject: Re: [PATCH v1 20/35] drm/vc4: vec: Switch for common modes
Message-ID: <20220816115706.nizhpgqi2gggvhtf@houat>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-20-3d53ae722097@cerno.tech>
 <0e285cf5-6ef2-3484-9fb7-5eb55c0ca269@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6rmmsvytrn6spomv"
Content-Disposition: inline
In-Reply-To: <0e285cf5-6ef2-3484-9fb7-5eb55c0ca269@gmail.com>
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
Cc: Emma Anholt <emma@anholt.net>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--6rmmsvytrn6spomv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jul 29, 2022 at 08:12:07PM +0200, Mateusz Kwiatkowski wrote:
> I'm just noting that the modelines you defined in drm_modes.c are differe=
nt
> to the ones you're removing here.
>=20
> The horizontal sync differences probably doesn't matter too much, VC4 uses
> those only as a hint anyway and generates sync autonomously, so the slight
> differences will only cause the image to slightly shift horizontally.
>=20
> But you're also changing the 480i vertical sync (vsync_start is now 488
> instead of 487, etc.). Are you sure that this won't break anything? This
> will probably shift the image by 1 line (which for the 480i might actually
> mean going out of spec), and I _think_ it might control the odd vs. even
> field first modes on some drivers. I won't be able to test this before
> Monday, but I'm just pointing out the potential issue.

I didn't see any difference on both vc4 and sun4i, but you might be
right about this.

I didn't have much confidence in the vc4 modes since they were broken
before your patches, but maybe I should have used yours still.

> BTW, I've seen a similar thing in the sun4i driver changes (patch 32/35) =
and
> the differences in vertical sync are even more dramatic. It's entirely
> possible that the current timings in sun4i are broken and the new ones are
> correct (the new ones certainly look saner to me), but I'd double-check if
> that driver does not have any quirks that would _require_ such weird
> settings.

The only thing sun4i requires from the new mode is the line number
anyway, which stays the same.

Maxime

--6rmmsvytrn6spomv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYvuGEgAKCRDj7w1vZxhR
xRHiAP9fE8CmBUW5DpGpBM8rlS+1m979Rf5KfhJkiXI4XgaLTQD7B6CwXU7vkS/6
Zd1eWht5CPS1YtFPdcFpEpBIdg0jkQw=
=VB11
-----END PGP SIGNATURE-----

--6rmmsvytrn6spomv--
