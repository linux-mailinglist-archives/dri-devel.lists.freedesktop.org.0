Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 614D85F9B65
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 10:51:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D1710E138;
	Mon, 10 Oct 2022 08:51:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA56A10E138
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Oct 2022 08:51:04 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id C64F532005C1;
 Mon, 10 Oct 2022 04:51:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 10 Oct 2022 04:51:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1665391860; x=1665478260; bh=F465zH3QC/
 AbnVw6vk1lOdg6PlWTj/fhAYUsOOtabSo=; b=V3CyrMEXGFQc8Xc05yin7R5KnI
 sKizRXnWMm2L4rbFdDyhhJQhF0trLKJo2g1hxkA3k8SLo+MEejGN0Yy362ULe1Ag
 J8Kpxew+ONtKrwUksKtT8aBHOs7L85m4OyPzYdBZczTeTAWQShwmRXAAhePLRjmE
 mkrkMvtKl2wDLfmxjGiQrgiYQj0wJt7foO7afBXhZsVoMsdwNjWEiVIuds++gcuv
 LgkTaKQ4kstrAaO3C8TTuPLpgixpgjcqOrHiEIjfXrb2a3q/fnDt5nLt0npVCSv3
 dC45SFLwlkia/PWZLn7q1k+I508R+Z2NGSlu6anp7KDIJeXln4NtKwks2V4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1665391860; x=1665478260; bh=F465zH3QC/AbnVw6vk1lOdg6PlWT
 j/fhAYUsOOtabSo=; b=n0SUXrJ+OHBSg04YiOa/xVQj5jjIn80uLRkcn1c/SZSC
 qZvMjbx3NZ1yztxJCuESVa9Os/3HQtky3zH1NGEqce6QLmEaPYpBikX6+vQEf5dB
 Htk1v4kPxx8kFArrIUFyg22ZfVzdUkV0wwUo+SHYAO0FpTqsA12W4BjaATfLpc+O
 NN60AAmBBvpYB1DI7vRuGvk2egm9RGPRgaMWvSssCNrGpeCux6//SPEjmNutJtu4
 /4XJTNoHCmtFdSkn+ptRl8wmd+xdbxHByAhY3OfHd5McgnFdrxAv6YAWon0393ZJ
 K65QEjlficBzQEQuXH9FOTfu5ognrjJFvrI/Lf567g==
X-ME-Sender: <xms:9NxDY6BbLy5mCOWeC6b1ej3HaXmZObqTegmSDihGdJNYIIvx3gzn5A>
 <xme:9NxDY0jf8bXZU72JyzxBSg6T9vvkiK6jxyYnuapiSj1RA8v6vwatF2E68N1OaEpF7
 FXTLGgHnj43B1lAyh0>
X-ME-Received: <xmr:9NxDY9kZVwSEi6Fc2acRqDeT-sTszJe1Q1_bq_b8T37LHU3_3mhOEPzY5lOU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejgedgtdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:9NxDY4xjPmETpSe3kx2rP3pRKgRO5_VMnp5JLbzdddK1LNBy-yXOOA>
 <xmx:9NxDY_TuU94A5Fos0y7Xw94qLYDlj9AKy1lOAxDqrUtkA1l8Pv1xYA>
 <xmx:9NxDYzaSQnRZ2sEU5WQ9C7DMVtHn8PbYfprmfq-u1OWzgW6G6EvlBA>
 <xmx:9NxDYwDoPrGVKuCz0eiBB6pWglgJtWi19EajeREjUB32IKAwzKekAA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Oct 2022 04:50:59 -0400 (EDT)
Date: Mon, 10 Oct 2022 10:50:58 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Emma Anholt <emma@anholt.net>
Subject: Re: [PATCH 0/2] drm/vc4: hdmi: Fixes for the RaspberryPi 0-3 stalls
Message-ID: <20221010085058.dvf4o6tsr55kmw7f@houat>
References: <20220929-rpi-pi3-unplugged-fixes-v1-0-cd22e962296c@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bthjslvleo7iysnz"
Content-Disposition: inline
In-Reply-To: <20220929-rpi-pi3-unplugged-fixes-v1-0-cd22e962296c@cerno.tech>
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--bthjslvleo7iysnz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mark, Stefan,

On Thu, Sep 29, 2022 at 11:21:16AM +0200, Maxime Ripard wrote:
> Here's a series addressing the current bug that has been reported for the
> RaspberryPi3, where booting without an HDMI monitor attached and with vc4
> compiled as a module will lead to a stuck system when the module is loade=
d.
>=20
> This is due to the HSM clock not being initialized by anyone, and thus not
> being functional once we start accessing the HDMI registers.
>=20
> The first patch will fix this, and the second will make sure we avoid that
> situation entirely in the future. This has been tested with 5.19.12. Earl=
ier
> versions might need a backport of 88110a9f6209 ("clk: bcm2835: fix
> bcm2835_clock_choose_div").

Could you test/review this?

Thanks
Maxime

--bthjslvleo7iysnz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY0Pc8gAKCRDj7w1vZxhR
xZn/AP94RF6lqgwflNPDMX8dl3wXFOH7iQb0gQWvAODp7AHGHgEA+m2fHtdGFiGn
z3lHqKdgvIpoXD4XtywFBQLeLT5Z2gc=
=KvOl
-----END PGP SIGNATURE-----

--bthjslvleo7iysnz--
