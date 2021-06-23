Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7566D3B1A1E
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 14:29:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F416E8D2;
	Wed, 23 Jun 2021 12:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE1056E8D2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 12:29:07 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 44CF35805E0;
 Wed, 23 Jun 2021 08:29:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 23 Jun 2021 08:29:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=LYmysgAYQbYf4D5WIV3nX+JHKv4
 gcr5JH0CPAhQp3EQ=; b=2eJlQpIHzliDahyhagWavmKnGgwp95ZisZfiYEn9MQr
 kFnx2PwYMwEwfxbsdSuu5H0iwUSDqsdvFTmGqElDbDAKRvHLLvLCIS1C2D4DLieT
 tdt+ULQRftMO8WV54GoiYsTiwbC3K1wUdoLrhvxobU6PNICaLAhzZZh5qwYIYHgW
 Qot3r07h03x4S/7gR4qA7Boi0D2f9UFjmRPBw0qSmGz4XnDhs7jQPkAAdv7QCFLi
 nJ9LVhD5NkgH7pPP4p/GixwP9y3ZHmJ2RmYL33AYyyR72L0/7xJhBtB7rBKnw5uJ
 aGzyS9WSLYNaGC0bdDafCdCCbAUf/zU12Sh0GMJYOCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=LYmysg
 AYQbYf4D5WIV3nX+JHKv4gcr5JH0CPAhQp3EQ=; b=lcr+uzMgCh79q2GtuWp50h
 xEyL0RWnfNYX34/c26G/ynQQcmDVGgDu76mPvLqRRyrlHWQm54BVa78BABb3nkjD
 RiE2e7XdKfj1iVGoZVQ27NgzEBxvM/5y4zx4W6Nd0dTIpqxtQgmQdEcaiXvm0Yp5
 MIGwT6Y0dztc9joSc9wgrs7/e2oOtOMeCndXFrRRrlCoirJE24OTBUeJF+EMLOdE
 APyK+Rzg9kPtZD+blzODFda0w24L/NONnXqZOovMh6kY6zlKzZLQlAwKiaN0GlyK
 eVGAOHLp5rFyuNX7+j7zSLsA1ePkLNUQVn59JahN0ZKhhonk+V1xtXGWaY3MxZaw
 ==
X-ME-Sender: <xms:ESnTYK_C-21U2l2QozyILoNSlPVqKfpTp1q6YqEseQtERYTgD7wEjA>
 <xme:ESnTYKs6ZYg2RUE3T4E6_4WYfh7byUamSHlJxrXSRIO9zEAnf3vP53J6ISh3gHTex
 vjveIKAZEot9ElXG9Q>
X-ME-Received: <xmr:ESnTYAD101y1Z0cSzKC5muGw7O86ArnMv0EERbPkuBkRESwg4ufvcqvrEDGFH43cICse_euQkCXeR5wF_iBFxf7l5AzuiVuIDg2F>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeegfedgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ESnTYCe9QBXtVFJhfKsnRwaDl-xkxqvQydUEScUwiqPYbRcEi1TlPQ>
 <xmx:ESnTYPNXuaRR8kEvEfb-7qU59Zify5c9K1HKVr_vC8Om2KWmtIZAxg>
 <xmx:ESnTYMlg2fbk5mkdtWnpb4rpr71L0d4YVRQ-KoHTE6BfyypN_1u9OQ>
 <xmx:EynTYCdX2W4keJN3BziO7ALHGBYvumNaAZ_6JzvRr3sRzPLV1XkbCg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Jun 2021 08:29:04 -0400 (EDT)
Date: Wed, 23 Jun 2021 14:29:03 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: nicolas saenz julienne <nsaenz@kernel.org>
Subject: Re: [PATCH v2 10/12] drm/vc4: hdmi: Register HDMI codec
Message-ID: <20210623122903.nvkm7hagt324n4pd@gilmour>
References: <20210525132354.297468-1-maxime@cerno.tech>
 <20210525132354.297468-11-maxime@cerno.tech>
 <c1ee306fbc81da2df7d0041c719fc8cd3302cf0f.camel@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ed3s3jfq3fuhw3ac"
Content-Disposition: inline
In-Reply-To: <c1ee306fbc81da2df7d0041c719fc8cd3302cf0f.camel@kernel.org>
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
 dri-devel@lists.freedesktop.org, Takashi Iwai <tiwai@suse.com>,
 Eric Anholt <eric@anholt.net>, Daniel Vetter <daniel.vetter@intel.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-rpi-kernel@lists.infradead.org, Jaroslav Kysela <perex@perex.cz>,
 linux-arm-kernel@lists.infradead.org, Dom Cobley <dom@raspberrypi.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ed3s3jfq3fuhw3ac
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 01, 2021 at 11:26:24AM +0200, nicolas saenz julienne wrote:
> On Tue, 2021-05-25 at 15:23 +0200, Maxime Ripard wrote:
> > The hdmi-codec brings a lot of advanced features, including the HDMI
> > channel mapping. Let's use it in our driver instead of our own codec.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
>=20
> Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>

Applied 6 to 10, I'll resend 11

Thanks!
Maxime

--ed3s3jfq3fuhw3ac
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYNMpDwAKCRDj7w1vZxhR
xTtEAQCsRUnfy20Se4iYG9OnMpYBOcMIXkIlk4MHoGG22GbIhgD+KEWBCy8hUjqQ
hXB++Vu4wHH9EPXj1HdCg3lwFXxWrQI=
=QYZn
-----END PGP SIGNATURE-----

--ed3s3jfq3fuhw3ac--
