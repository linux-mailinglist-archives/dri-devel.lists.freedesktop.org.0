Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7E54A6D5F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 09:59:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A00210E4E6;
	Wed,  2 Feb 2022 08:59:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 270CF10E4E6
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 08:59:42 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 2D3EC3202202;
 Wed,  2 Feb 2022 03:59:39 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 02 Feb 2022 03:59:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=W19NGVeol9WzjG7xEuFLGt+rTmwOzVlo+gwhmQ
 egsy4=; b=GnfMpzOtyTDJnDycvd9fEydHnEgVZbPgq/ooxeMm4ZeejCuKzMFG4M
 MWidB+JMgLM0VPVbGJGzudAU8OX/pGy2oK/cqz/V2NKuDkR6+PuIjW0aVHSPOBQt
 QNUha4RVViwqxTaD65QavZPpxGxkOtsi/XsrDmnwGz1HNtdRaOwiwri9NwQb7l4F
 5A99JzvLTRijFG9OgjIt8zzSnpsN3BCH/ZED0w4V1i4jqUPsInPiQQgp7WU2oEb6
 p6+fcnihB6E1GH8Fi4h9qPb9kURrJ+aNLUw7smq8DJvf0V2AeemoMm3+HERA+LCf
 KE1swabgnpYjJKr4nICliJsrbZ3M8BkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=W19NGVeol9WzjG7xE
 uFLGt+rTmwOzVlo+gwhmQegsy4=; b=CDCaq8AJPTvqg0MhvIYqJOR3X7B6RqONT
 3rtdT6G7t706FQxicIRjrpquR/RAKQjzatYulCq9VbCxE/zq4NSPX0HS1BMPjOZv
 N4u1w4Tl8iTV7ZYoEJbNqx24pVJ8KaJqIKlpGk0uKNOCpyDrRmQxU1ADvOlDamhI
 lgjifq84wUcIwultMozBgtu4f/XOGEYPe1ocX4D2MdrkQRNG3J/bAxtQ2WwvTube
 K0FwvotHbgDRK606YtB3XCYRqEMmM4MHevua43ytrsqAYOfl8E6a5oQwnLzswXNf
 /a7i2kWKk7e4B1HgFg4QS9OUnZJlsGWC+edPsT64Dda0GJoIOErJw==
X-ME-Sender: <xms:-Uf6YV40T6DYU5QXXG-IMTuhfXF1xIk85muuTQ8Q2nMTNzJxjxH1qA>
 <xme:-Uf6YS7cY30Bes6UrBkQhaEaogFZAPpKnbn9_ZRMpeKJXgoKIY1edmYzOda6hLIWw
 MkmmK-IoH1BzD6occw>
X-ME-Received: <xmr:-Uf6YcdrHvEMo2liX0HFzEnXddVmM4B3tzIeqI35CR2A2Asen1TfTOHcuBM1KsJYNiOk3pFboTUMIB_ijwvardGFTQLjd768kB9Bclw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeeggdduvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepveevfeffudeviedtgeethffhteeuffetfeffvdehvedvheetteehvdelfffg
 jedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:-Uf6YeIZIDEmonnRmqLV5bOmFqfHU72hI68UWlDEi1R-Ez4-TojjDA>
 <xmx:-Uf6YZLVh9Yl66rxlGvjAATsFtw9CbYylu_fvNse3Zd3GKNuiVe39Q>
 <xmx:-Uf6YXy3NWE4zcQabG1DrOmN7q2CvKSL5XHq0PpGs501PccaniwJLA>
 <xmx:-kf6YQ_UayN82cv0QlHowMO0qHx1laPJrfB1H5ywJu_cIyDn9e1a-A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Feb 2022 03:59:37 -0500 (EST)
Date: Wed, 2 Feb 2022 09:59:36 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v6 1/6] drm: sun4i: dsi: Drop DRM bind race with bridge
 attach
Message-ID: <20220202085936.ogxhpl7u42lubhdd@houat>
References: <20211210111711.2072660-1-jagan@amarulasolutions.com>
 <20211210111711.2072660-2-jagan@amarulasolutions.com>
 <20211213170223.fx5656vjk3fwizbg@houat>
 <CAMty3ZAetcXpcokJ418VGHzbi4ivJg4Rt0OVgh7WaZ6GAJQY1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dwa3ea6vcaiywqfz"
Content-Disposition: inline
In-Reply-To: <CAMty3ZAetcXpcokJ418VGHzbi4ivJg4Rt0OVgh7WaZ6GAJQY1Q@mail.gmail.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, linux-sunxi@googlegroups.com,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--dwa3ea6vcaiywqfz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 17, 2022 at 09:12:37PM +0530, Jagan Teki wrote:
> On Mon, Dec 13, 2021 at 10:32 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > On Fri, Dec 10, 2021 at 04:47:06PM +0530, Jagan Teki wrote:
> > > Existing host driver will keep looking for DRM pointer in
> > > sun6i_dsi_attach and defers even if the particular DSI device
> > > is found for the first time. Meanwhile it triggers the bind
> > > callback and gets the DRM pointer and then continues the
> > > sun6i_dsi_attach.
> > >
> > > This makes a deadlock situation if sun6i_dsi_attach is trying
> > > to find the bridge.
> >
> > I'm not sure what you mean by deadlock here, there's no lock involved?
>=20
> deadlock parse here for general understanding, where bind is trying to
> attach bridge but drm pointer is not available that point and drm
> pointer will available only when bind done. This is what I'm calling
> as deadlock here.

Have you read:
https://www.kernel.org/doc/html/latest/gpu/drm-kms-helpers.html#special-car=
e-with-mipi-dsi-bridges

Maxime

--dwa3ea6vcaiywqfz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYfpH+AAKCRDj7w1vZxhR
xWfCAQD4MFLtNZKDYyk7aRzUt9x2u0oqC6PSBAxdUVwIJBgHjgD/Tn7i8wku0mnd
T6Kr0Z9f0VN/3OjiJp0VJrjsWhKJcgg=
=RQlU
-----END PGP SIGNATURE-----

--dwa3ea6vcaiywqfz--
