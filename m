Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 567975E9E52
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 11:51:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E61610E678;
	Mon, 26 Sep 2022 09:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C4110E65D;
 Mon, 26 Sep 2022 09:50:41 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id BA80C2B06A16;
 Mon, 26 Sep 2022 05:50:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 26 Sep 2022 05:50:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1664185835; x=1664193035; bh=Q5YqCB+bWv
 ZnM9/MP8ojAxE88SZk5mFeXFT7vJkPnOQ=; b=CbM+ffh8hGO/4EshyJBj+hQOby
 uSKuQbZ08yV/O7npvaPQjbriXKz7qwOJBEikhupb5sz0HlXEtWmHAHdOA4qf5RBY
 pfDNJ1VLYDnr70g9GdLd9IYldjQxT/Iq6J9hTa+K5/VWSkT5KChkQ0B9AibPm/8n
 7nfRE08jBYGvUlDqTzM12ThVEgQispAaoWewCio/6R1E8zGatUiJL1a+b5T66KIN
 rq7Gk7j+Mb5JHSO8r9EHWK6oOf4amJ1qF/YtwN0UF7wYp7CX8CMRTEhqe/ANmvXe
 f81xbiiXBtST8iwQWcPL1/9auidpuErFhQTpVnBYNBQpxN217qqrf3Gqq/FQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1664185835; x=1664193035; bh=Q5YqCB+bWvZnM9/MP8ojAxE88SZk
 5mFeXFT7vJkPnOQ=; b=cPnysf/P2PbQ+IH15wTtgZdBsVOpPnb2MQAnFYR//HLr
 0AtcpJNkLsq9mQwQeO0StKNYJ8NYvfjVmONFwBj+KE076TaUJsOMWsPV4Sx5OYD/
 hjLEVXsK94HIO89vQZZCSsDYXmrRS2NjtzyoQWC1gU2aA0xVHpl0OtKgOFAxfitT
 SXV7/exwbblPSjKAOl4+Wx4EvEMdGuaUmmTxpl/pX0QzUCWC6qwxy9GqumaZV1th
 uSI8hyrUNQS7ER9MT9IOAZUx1eNatyvuJn8MY+uHvs3iFzF0F3bDZD1rP2uNxpcf
 tyNVlUMI3dhfW0OBU6Ug6vm2Aw6DYXXdBv8q0BSZEw==
X-ME-Sender: <xms:6nUxY87En6rl5JtBuegrYVkuYyU3-SsDG1klILVdtAL6Qwdkf8M7_A>
 <xme:6nUxY977tYpT4xSW1ett0FDl09ghWQIlAFzl3xyO7crQB2rXhCSY2Z_0W_LC4_1iA
 tiIUVtOu2qn7sxu7J8>
X-ME-Received: <xmr:6nUxY7cJzjsH4MvX7DFh81T_6wT9FR0cWe1i0iFlKHQ-ZIBz0noGBnTuxkmZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegvddgvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:6nUxYxL5C3_5Sf-v0pBL2lLWMha6XHNYSheIMrAReX6Ir_PDDc5nZg>
 <xmx:6nUxYwL9uk7F2dJOprwNmH-QHjyshXE5TmqygRW_2TebDZ25AJWT5w>
 <xmx:6nUxYywirP_MNHdMbw3JQf71HU-KaS1e7RhGNrcmmnLC8C1XxAOspA>
 <xmx:63UxY6qYHueW2DoYIPmZe-TsKLaxZoD5D2QROroXMgvC9MPpd2kLiSOmsB0>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Sep 2022 05:50:33 -0400 (EDT)
Date: Mon, 26 Sep 2022 11:50:31 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 06/33] drm/connector: Rename legacy TV property
Message-ID: <20220926095031.vlwsw7willi36yd4@houat>
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-6-f733a0ed9f90@cerno.tech>
 <fa71ae1c-f9ca-167c-7993-b698ea3473a0@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wppcaqoyqh7rspqt"
Content-Disposition: inline
In-Reply-To: <fa71ae1c-f9ca-167c-7993-b698ea3473a0@suse.de>
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--wppcaqoyqh7rspqt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Fri, Sep 23, 2022 at 10:19:08AM +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 22.09.22 um 16:25 schrieb Maxime Ripard:
> > The current tv_mode has driver-specific values that don't allow to
> > easily share code using it, either at the userspace or kernel level.
> >=20
> > Since we're going to introduce a new, generic, property that fit the
> > same purpose, let's rename this one to legacy_tv_mode to make it
> > obvious we should move away from it.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> It's not wrong, but 'legacy' is already overloaded with meaning. If you c=
an,
> maybe name it 'driver_tv_mode_property' or 'custom_tv_mode_property'
> instead.
>=20
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

I'd really like to point out that new drivers shouldn't be using this.
If we're using either of your proposals then writers might get the
impression that this is ok to us.

Would you prefer deprecated to legacy?

Maxime

--wppcaqoyqh7rspqt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYzF15wAKCRDj7w1vZxhR
xXcKAP9L/I+uhmTIq76oVEB9ee7MilxBf4AgksOX/7k93P3lJAD/Q9YHrVicNYNH
d5hLg5xM8KI/DdLiQRhSunqAKaDeKAk=
=OLhV
-----END PGP SIGNATURE-----

--wppcaqoyqh7rspqt--
