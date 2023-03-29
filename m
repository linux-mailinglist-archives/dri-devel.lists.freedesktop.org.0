Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B59E16CEFB5
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 18:46:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A09610EB94;
	Wed, 29 Mar 2023 16:46:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F76310EB94
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 16:46:41 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 375AE581FA9;
 Wed, 29 Mar 2023 12:46:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 29 Mar 2023 12:46:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1680108400; x=1680115600; bh=ff
 qq1UU54yrkZu4ksQG15+4UlgWBJoa8eBUm1mgkh5M=; b=CohyV6qy+Nc9nTRzHh
 dVoxzzfeRWf/zcdMjLmT8Fz+6hK4OAM2dGBUCerDEDJBptQVH6uUwvPbAPlzNZpZ
 OwUGH+Z0KubZuOwzOskUo7nmZuPKtwg1LDLRowD0g0AgT4om4D/s9EMOSHoMpSaK
 N7mEaUUshf3nx1VEO68/dyUo6ipy7gtAbEDT/GYM/E3HCbB213JvNvA0NxICTuP5
 BbtDpRDDTe2PNi2letqytLB8nNmDrmwoU52fcdjyH53gF5f6k9DAxtbAgQg6rH3J
 lDeLmrJjyXYCmR2Ibl/TAZjTidBSfXxzRWpaeoVZI7LAuR320YmMFu3JgC3rB93k
 nA0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1680108400; x=1680115600; bh=ffqq1UU54yrkZ
 u4ksQG15+4UlgWBJoa8eBUm1mgkh5M=; b=MmGQvnMjCAkiSGwkRUwX4RetARm9D
 K8GOsCO1EkITlg0RzsFCwcyj9n0mMKoI8snuPEcru7tp3Sk/u748BcHKkHREjTXe
 mi8jU5GIfODiPLxnjf6sF+cMS9h84UTU7Gh1nGRWjRAyyqeG66Nqd1PTcmg0i9eF
 kRn1wMmDTCTOjYXHPJg0MydOL86jehds/KS6fw1AeA3hTl2UIH4xt7sqWUtTAr6c
 5/0127bT/J1SnqN9MYaxmp+XuVsraAHNqkgsI0fmrHBqjn2QVY/z24iWyam9REut
 CHhfruDjyeiO5hiM6+tdLJ4r+XJIUKjcwa7hUeqqWHKrTt2XeYV6F40Jw==
X-ME-Sender: <xms:b2skZIkrj7v7eCQ-srynG5OuT7fHNOD5DKnio13n7B-yyjprfsCbWQ>
 <xme:b2skZH27VLXJCBZfaKB3ryZORw0lOLlNV5XaHfBVoZG0abEUu-RCCQRa0JCKZgfm-
 th5tFDoeLP8qMk-J98>
X-ME-Received: <xmr:b2skZGp6IopX5y_netGHsV9ERxoXN0x7chwpWELIUZsDSADgMPdtNGm36Y8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehiedguddtiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepgfeuuedtfefgveevheejfeeghedvjeejfeehkeffudetuedtgfeiieei
 ffeutdffnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordht
 vggthh
X-ME-Proxy: <xmx:b2skZEnHRNXTGagHxNGh1vMIxn0bBpH6sa0YY_W5HHfYVmtKIcGQ2g>
 <xmx:b2skZG005NpQC_oqGxjnEdI7CE4-0hcnOC_0SGuApZLLsEKjg-c9jA>
 <xmx:b2skZLvcppXHOBuzYMW62az_vJ_NzISIw5E6E6TbllpdFX8OpkS-_A>
 <xmx:cGskZP6RjHGqLKriO8IrVxBVBizuh6hP8Elt5fVaKTqezCBv5GBgUg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Mar 2023 12:46:38 -0400 (EDT)
Date: Wed, 29 Mar 2023 18:46:38 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v7 10/12] drm/bridge: Implement enable_next_first to
 alter bridge init order
Message-ID: <20230329164638.v43la4l7rxut6hk6@penduick>
References: <20230329131929.1328612-1-jagan@amarulasolutions.com>
 <CAPY8ntCJP53uiGNQHUZqma08Vsxfwm7KvAkgMzK=hn4AxJLS3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="joi337d72cqpshm2"
Content-Disposition: inline
In-Reply-To: <CAPY8ntCJP53uiGNQHUZqma08Vsxfwm7KvAkgMzK=hn4AxJLS3A@mail.gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Jagan Teki <jagan@amarulasolutions.com>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--joi337d72cqpshm2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 29, 2023 at 05:28:28PM +0100, Dave Stevenson wrote:
> On Wed, 29 Mar 2023 at 14:19, Jagan Teki <jagan@amarulasolutions.com> wro=
te:
> >
> > DSI sink devices typically send the MIPI-DCS commands to the DSI host
> > via general MIPI_DSI_DCS read and write API.
> >
> > The classical DSI sequence mentioned that the DSI host receives MIPI-DCS
> > commands from the DSI sink first in order to switch HS mode properly.
> > Once the DSI host switches to HS mode any MIPI-DCS commands from the
> > DSI sink are unfunctional.
>=20
> That statement contradicts the spec.
> The DSI spec section 8.11.1 Transmission Packet Sequences says that
> during any BLLP (Blanking or Low Power) period the host can do any of:
> - remain in LP-11
> - transmit one or more non-video packets from host to peripheral in escap=
e mode
> - transmit one or more non-video packets from host to peripheral in
> using HS mode
> - receive one or more packets from peripheral to host using escape mode
> - transmit data on a different virtual channel.
>=20
> Indeed if the sink doesn't set MIPI_DSI_MODE_LPM /
> MIPI_DSI_MSG_USE_LPM, then the expectation is that any data transfer
> will be in HS mode.
>=20
> That makes me confused as to the need for this patch.

Yeah, and it looks like that would break the expectation that, in
enable, a bridge can expect its controller to be in HS mode.

I think that was Jagan is trying to do is to work around an issue with
the Allwinner DSI driver:
https://elixir.bootlin.com/linux/v6.3-rc4/source/drivers/gpu/drm/sun4i/sun6=
i_mipi_dsi.c#L775

This is working mostly fine since we only have panel support and can
control that, but with bridge support added in the latest patch, then it
probably doesn't work anymore.

The proper way to fix this isn't to put more logic into the framework,
it's to make the DSI driver behave as expected by KMS.

Unfortunately, that controller is not documented, so it's not clear to
me how we can fix it.

IIRC, it's basically a state machine where you would encode the
transitions between one DSI state and the next depending on what your
expectations are.

I think there's two problem with the driver that need to be addressed:

  - First the driver will drop back to LP11 mode to submit commands. I
    don't think it's needed and could even be hurtful to the video
    stream if it was to happen during HS mode:
    https://elixir.bootlin.com/linux/v6.3-rc4/source/drivers/gpu/drm/sun4i/=
sun6i_mipi_dsi.c#L877

  - And then, it looks like, in HSD mode, we never get to go to the
    state LPTX is in (LPDT). It would be interesting to test whether
    adding a transition to that state makes it work or not.

Maxime

--joi337d72cqpshm2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZCRrbQAKCRDj7w1vZxhR
xQZJAQDH3xgUKxVj5rppBW1RavNmxnchGfTOlX7lOAlA0Q7HlwEArkAWecM+dFuZ
pc5iqmetMDBWSp9ERryFXaRO1cykVQg=
=Itto
-----END PGP SIGNATURE-----

--joi337d72cqpshm2--
