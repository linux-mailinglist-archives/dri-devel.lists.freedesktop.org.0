Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 302962D7587
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 13:26:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 675306EDD4;
	Fri, 11 Dec 2020 12:26:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 278146ED64
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 10:17:43 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9330E580362;
 Fri, 11 Dec 2020 05:17:41 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 11 Dec 2020 05:17:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=9D32wugrFLgB0uzOVmA2pDi0jWc
 mCQtUeBJzPKrDHYM=; b=ByVUoK3fRT3tb07JwT9XmYoNtq15eZieoPhShBCML1k
 X4ZLGnVGRHNuw3C3xNBC0NwSubLs/svgq3fR+RMOJJPYBeQ3r2XltdgLvP8PL8gr
 WP0TXLK83zlL9rd2xQYP+cc6vRd8z7m3F7G2jwk1TFido5B6YvmMPZK7BqHHAuNl
 K5+SZR7e5dsNw2eUtOtRD6auO1tEXaBrCMdzq2rVjbktdI59WE+LIqL6X6/Y/5CR
 ctR8cE+lTQJSgnixNe5E5S84KAD4mJ94GL8jDTKR7qgDnDi5q8VEFiBkSJDJDun6
 Lqu6kk1fjongGGObA3g2sX3KTZxMmnIRClkk9Eb/NaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=9D32wu
 grFLgB0uzOVmA2pDi0jWcmCQtUeBJzPKrDHYM=; b=FDj0vVCNSb69YWjNMN0PRj
 k+buNJfo0f0nuXg9mjVtw0D3Cp90weNY9oX6IK2cAdqcJwwHj6jIvEizTa3C702G
 7+Eop0hjEnqm6uewaBDIhET9ZfjEQGSkyDEk1ssTXBZCXE/KDhHRSNrN9pA7aESI
 7I4O0g4wDtniQuEizUjTspYo+DIoQgmiKfvf7PPzGz6rLwokNoaS6rCu4utuJgN1
 339N5SXmhPdtToIr0w9MpmNk3xVX8hitWuQa0DoEGnXwqJ9DNVfqNllHJh//Y+tB
 0Vhu6fMEfYg/cnvsKUYtflYkkeoRMF8EK4hej7vNlyCo0q0d3LZAae9He6zunJcg
 ==
X-ME-Sender: <xms:QkfTX6tOQ-vauCcK2EJy9MA3LS01U9kkRhbjj2CbbiQoUScxDzaFig>
 <xme:QkfTX_c88LtxIg_jLzKRhe27MUpsot4vZw61lFXhJndqCNJIOQeFZSC7960QjhRzx
 FtE5vvJQWxdjxR4EO4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudekvddgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:QkfTX1w3JDnILaqyCCCON2EugZ09cVfa5yoQVba-2zCAaax-Ra0bug>
 <xmx:QkfTX1Om2_OocKQ4YeofTC6UphmHecj1lwCqaRONkFIOX6UGEjiY6w>
 <xmx:QkfTX68nvLYc0FQuJzaV4p3dI-ZfNmIzorHO8SjAuKZPuW1N8PmR5w>
 <xmx:RUfTX-Su_5csZZPyXgC_i0i5ksZGYK9BGZsGTlftqHIlI-L-myx0UQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 32E4424005A;
 Fri, 11 Dec 2020 05:17:38 -0500 (EST)
Date: Fri, 11 Dec 2020 11:17:36 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: Re: [PATCH 2/8] drm/vc4: dsi: Correct DSI register definition
Message-ID: <20201211101736.e26kyrbdaq4qhk7p@gilmour>
References: <20201203132543.861591-1-maxime@cerno.tech>
 <20201203132543.861591-3-maxime@cerno.tech>
 <cfcfd349-e0fc-8bd0-4c9e-6cc33bf5f056@kontron.de>
MIME-Version: 1.0
In-Reply-To: <cfcfd349-e0fc-8bd0-4c9e-6cc33bf5f056@kontron.de>
X-Mailman-Approved-At: Fri, 11 Dec 2020 12:26:42 +0000
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0764760911=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0764760911==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lxvzogg4gx63k4ta"
Content-Disposition: inline


--lxvzogg4gx63k4ta
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 08, 2020 at 09:34:05AM +0100, Frieder Schrempf wrote:
> On 03.12.20 14:25, Maxime Ripard wrote:
> > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >=20
> > The DSI1_PHY_AFEC0_PD_DLANE1 and DSI1_PHY_AFEC0_PD_DLANE3 register
> > definitions were swapped, so trying to use more than a single data
> > lane failed as lane 1 would get powered down.
> > (In theory a 4 lane device would work as all lanes would remain
> > powered).
> >=20
> > Correct the definitions.
> >=20
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> Wouldn't this deserve a "Fixes: ..." and "Cc: stable@vger.kernel.org" tag,
> as this bug is present in all stable releases since this driver was
> introduced? I think it would be really helpful to have it backported.

Sorry I forgot it. The patch is applied however and drm-misc-next
doesn't get rebased, so I can't add it now.

We can always send it for stable by hand though once it's in Linus' tree

Maxime

--lxvzogg4gx63k4ta
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX9NHQAAKCRDj7w1vZxhR
xZ66AQC+kdfoj94MYjL0EAGhh5ZK8eE3izsoekSwCQIaKQ4KCgD/U/A2aw/+be6t
Z5CUwHPldU8WqMhLMaPGuZyCpZlujwI=
=J2vg
-----END PGP SIGNATURE-----

--lxvzogg4gx63k4ta--

--===============0764760911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0764760911==--
