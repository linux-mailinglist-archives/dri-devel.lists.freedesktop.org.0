Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6846839584F
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 11:42:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC0C6E49C;
	Mon, 31 May 2021 09:42:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CEF66E49C
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 09:42:20 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7AFD3580487;
 Mon, 31 May 2021 05:42:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 31 May 2021 05:42:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=WnQrnLtWZNnyNpO3acQJhJ/bTb/
 zVNlgSLckx9ud/3k=; b=IiNPuoSFaFJ+FLfnMfuu0aEao+0+SQJzPnBdOtZHIwx
 OI5D+UwzLtd7hRao0VOX+54M25thB09hjMV3+TBAFXsF6VqvVBnfc8JbwLsA88uX
 wptoS5MESiCC0w0oyKK43dHB2JMlOgHiCHLqarkclDNVfkGv6Q70Yxuft6uYFDh+
 Xu6WsFskOaVtqg3tYsUAABsHnt0YqgcH10pu/NZvyrPFS0vchctcJ0Ljv9UPJfVL
 Xn/t1MFPoKG3M2qcBJtnjFf0yuOS8HJAa2y2Vf8cv7xPGdXS+6VOhtbCdLtE2Dyz
 Ve1q0L1SMNkMKWpbuFF9FY9yM0Ppq5a8OS8XAoAeR6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=WnQrnL
 tWZNnyNpO3acQJhJ/bTb/zVNlgSLckx9ud/3k=; b=EP97E+O8VhXdqGz4Fz+hhl
 kSawOnEOwyehJuxeeevB9mTvHubWVIbysLBVCUsn+Z//mZWJccffGjitbW2fAu1w
 zyJDGQsGivdz0IJ5c51wzy/6HXReypofgir1cYHIDE2vwm9kBSM+QQZg6ZUJ4wgt
 cUWt8Zd7p8TUXgVJn8RbMPWtS4Us9vAuSdpg5VzgP2RyHoVV0iaG4KFMW1kwJkAZ
 dR3N+qurzBW3MLGKVhS9KjbBlifyX0Pyw22aLvfSlWLdsalKyf4gRc8Oru/+ncL0
 e+oGa8P8gnM33JpZHSzWU0wE0mayEBnwdzEoBDdufwn8wU3a4cdwCQoR7amFJNMQ
 ==
X-ME-Sender: <xms:eK-0YENy5kYVKheJHzJSf9GxHJTXE5_iJwRRVu8JQYMU8nJSegoGhQ>
 <xme:eK-0YK_0gPKAdMHAyo2IF2xWG7LSYjPKBmEkbJFNj4VXdSmHgtOL3N3QOyqPYP7eD
 DZVXEB52P2xN21uCtw>
X-ME-Received: <xmr:eK-0YLTAcWdlQVlkfRq_UXtw6KguUqAJj5-prtf6314yvxhpcYnnWEzEa89_h32ikJjWloqg8-xv3DrOLTYgWT_JuO3JpNykUl7e>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelfedgudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:eK-0YMswZEFbzrn78ajFD2lv6xQMq_J9bLnQk8FCdRIU8cC9oqBKyQ>
 <xmx:eK-0YMfs5hyrB_cMPTjQY60dtY89rf2NN3SVtCL0WL3yHjOoj6GXfA>
 <xmx:eK-0YA03aCFobWxbDcheaY-7ptLK8O9UVrDASHW6Yz_Cju3YwXBIlA>
 <xmx:eq-0YNsM67k5Toi9bS0UE-ngDjUqfh6lXn_l9q-x15hBffqEAGEMLA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 May 2021 05:42:15 -0400 (EDT)
Date: Mon, 31 May 2021 11:42:13 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 05/12] ASoC: hdmi-codec: Add a prepare hook
Message-ID: <20210531094213.kuuunk7ytu3q6sq6@gilmour>
References: <20210525132354.297468-1-maxime@cerno.tech>
 <20210525132354.297468-6-maxime@cerno.tech>
 <YK4lWaB6Lx+SPjpF@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="epjegrbj6kpv446q"
Content-Disposition: inline
In-Reply-To: <YK4lWaB6Lx+SPjpF@sirena.org.uk>
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
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-rpi-kernel@lists.infradead.org, Jaroslav Kysela <perex@perex.cz>,
 linux-arm-kernel@lists.infradead.org, Dom Cobley <dom@raspberrypi.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--epjegrbj6kpv446q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mark, Takashi,

On Wed, May 26, 2021 at 11:39:21AM +0100, Mark Brown wrote:
> On Tue, May 25, 2021 at 03:23:47PM +0200, Maxime Ripard wrote:
> > The IEC958 status bit is usually set by the userspace after hw_params
> > has been called, so in order to use whatever is set by the userspace, we
> > need to implement the prepare hook. Let's add it to the hdmi_codec_ops,
> > and mandate that either prepare or hw_params is implemented.
>=20
> Acked-by: Mark Brown <broonie@kernel.org>

It looks like you're both happy with the ALSA/ASoC side, how do you want
to get this merged?

There's a build dependency between the DRM bits and the new hook
introduced in hdmi-codec, would you be ok with merging it through the
drm tree?

Maxime

--epjegrbj6kpv446q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYLSvdQAKCRDj7w1vZxhR
xWXFAQDysUxOnMmdBoxWo7OqzkjGIwVcF9ekclQWjJWOn1GNgwD/ZCJRk/ix3+v+
3HrGEoP5DWXcawng2o1uOjuTho/i5wE=
=7cDo
-----END PGP SIGNATURE-----

--epjegrbj6kpv446q--
