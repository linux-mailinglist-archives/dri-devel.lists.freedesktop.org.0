Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D43399C68
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 10:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4344E6E0E8;
	Thu,  3 Jun 2021 08:18:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D066E0E8
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 08:18:51 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5D547580D7B;
 Thu,  3 Jun 2021 04:18:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 03 Jun 2021 04:18:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=TwuV2ha2tJsTpTc91CLj3/nFVE9
 pHYO8daaw5cAu/GA=; b=bmc529wQ/ycDZT1mFhRMsS5hx2i+7bVsoVSMBpt1R2E
 /XTVA58cdE+uhOYWpksVNPd6m2RigwpliF/zpb4KwAVsV/0ewE5nfsDAOp0vu5PP
 4agDFkGE/RmBRlz8D7J2lOj1yU5InJLXG/kzts+EJgpsY+UK0+saKXPkWFZwuD0J
 HaQQIREDCXqP6EG7zFbfFQ2/EAVuXmzz6KfZ/GcGyXSJTo6MQMFDNJiqwPhJwEtT
 WzeKeGwTmgKiuvt2UV51IgFwlTZxcpHFrGJYXnw2UnHRiskKj8iU+X8unZ1fBQ37
 t7qSxgVha2kDQc9iPKBEs0zJ96GNo50B9bS9LkvG+7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=TwuV2h
 a2tJsTpTc91CLj3/nFVE9pHYO8daaw5cAu/GA=; b=cXN7HapewSBA26vXGphUOj
 KTO3JU8zvSB+2zoOxEuo8VBWwGQPUOdmbvonVDLpAbwMo9hbFEkyRm5JcH0xT2TT
 CeOkvNNeg4e0K1WYGbYVBJ+0eeA6rUYGBW7pGIFVgf2T38n+VzdOccwvvfjOTU/m
 rWe3y47+JtQyQx6V27xYJL+LrPsM4alHivsuLrJoZXnndw33kwiIEZ+6OpFvw9Fm
 rxtfnApe9yP1jDQbR3l3KdUwMNZu5qFKbKpMwuEmC4CI0PNsBtFSj/pZBYuM9Sr0
 23gm05asHBlVddMdtjxj8aA4MrehKYtzJV/aVdSs2zTCbJq/TyQKUe8lYNqgH3zg
 ==
X-ME-Sender: <xms:ZpC4YAyP1DoSpNjxBM9snafm74YZe9v1HNc20eO9Lu0ZpChEgaYCJw>
 <xme:ZpC4YETMC5Tn8Ks6QwW1BQjwdTtMTW8sNG6YCfBHwmvE3nvFMBxvfdtWAfZHmwwhS
 oes8lrqzOtyJHo897w>
X-ME-Received: <xmr:ZpC4YCVpm-Dd8yskZiENlD6BG5M3hh7pi8ZqgcyVT8WsvIwi2h7f_N7va8471NLYl_deMvJhSjNb7xouQBBHC0aQwhScHy6fIF5X>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelledgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ZpC4YOhuoovgCtB9ahz98RraRepUfHrwGs1oRpbSzOH5fq3sorGrLQ>
 <xmx:ZpC4YCBt8Q3HGL-b_3WDuaSh_8z_-KgwfBQSZTqr1hupYrULkTMfIw>
 <xmx:ZpC4YPLSPLKbhiFwrgrp5aVHUC87bgIZEkvt4MA1oF5WZLU-xEtgHw>
 <xmx:aJC4YDwuoE0lyEmcAHKW0O8fMxzaGEbBYXAF9H32z6jEnNSWstq_wQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Jun 2021 04:18:46 -0400 (EDT)
Date: Thu, 3 Jun 2021 10:18:43 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 05/12] ASoC: hdmi-codec: Add a prepare hook
Message-ID: <20210603081843.nwjlcoik7aubct2p@gilmour>
References: <20210525132354.297468-1-maxime@cerno.tech>
 <20210525132354.297468-6-maxime@cerno.tech>
 <YK4lWaB6Lx+SPjpF@sirena.org.uk>
 <20210531094213.kuuunk7ytu3q6sq6@gilmour>
 <s5hzgwb17ji.wl-tiwai@suse.de>
 <20210601123600.GA4089@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rkj45skaaxwizccg"
Content-Disposition: inline
In-Reply-To: <20210601123600.GA4089@sirena.org.uk>
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
Cc: alsa-devel@alsa-project.org, Tim Gover <tim.gover@raspberrypi.com>,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, bcm-kernel-feedback-list@broadcom.com,
 devicetree@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-rpi-kernel@lists.infradead.org,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 Dom Cobley <dom@raspberrypi.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--rkj45skaaxwizccg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 01, 2021 at 01:36:24PM +0100, Mark Brown wrote:
> On Mon, May 31, 2021 at 01:12:17PM +0200, Takashi Iwai wrote:
> > Maxime Ripard wrote:
>=20
> > > There's a build dependency between the DRM bits and the new hook
> > > introduced in hdmi-codec, would you be ok with merging it through the
> > > drm tree?
>=20
> > Speaking of ALSA core changes, I'm fine with that.
>=20
> Yeah, a pull request for the shared bits would be handy in case there's
> some collision with other work.

I guess the easiest then would be for you to merge the patches and send
a PR? Assuming you don't want to pull half of DRM of course :)

Maxime


--rkj45skaaxwizccg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYLiQYwAKCRDj7w1vZxhR
xY3tAQCNDRo7aulJ5VeVRzqdd+tlvfHDwEv8T2XuJbx+a2+uQwD9GYltrs50+UPd
23Wv2j7Qynv07biPvFD4miTXZeE54gw=
=G3gn
-----END PGP SIGNATURE-----

--rkj45skaaxwizccg--
