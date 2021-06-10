Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E98B3A2B7D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 14:26:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A67CD6E867;
	Thu, 10 Jun 2021 12:26:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EDA16E867
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 12:26:44 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 193091EC9;
 Thu, 10 Jun 2021 08:26:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 10 Jun 2021 08:26:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=COkkJeYcvwmDlhpVmcIauI0ShUX
 vSvQARYR7Bn0tqj4=; b=G41sR6gjk5D5n5+FAAgCsTkZaWGX63tNhkvr9KZMQQa
 kD5xsbgJS4XyFwXzV5Q/f4SBi3DBuRTSsUaeYxwoP2NOBJh69atOAEGcwrAhIVU8
 20vpJ72V62SztQzyMH9C5HZG5TUnVluRMXH2fzDigiuu9ECr70ZHrxg4Qy7IvyZ5
 XwDcRkgE3fnu9M2pZzNCrEUydH1gKmEAniNMwscrUUGPaPqCnGAj4GX40+R7P1tk
 PEwIx9B3+gh5izlDpR/B9pus4aE4puPISZ9WCVYXZeCx0krKQh59tSew2E4vpKU/
 gqQGEuG3BX0vPBj7/uGa29kHeUBzw/bYKhrDSvJSUEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=COkkJe
 YcvwmDlhpVmcIauI0ShUXvSvQARYR7Bn0tqj4=; b=ICOyP9St7jwWbGIlx3CNCY
 prS1VY8z8pCBlkiiJufnszVcTDQ6oUi9oGOmAqXZaNjCkfKzZ1l/AUbW75BLyWYD
 d4ILtT1YWKvb0+FtgNoJmkd8vNXnSurrJNuF0U+kcOTu4BObkY8RMYWV+ZOKJ7rI
 ZQZzrYJIG3UL0I5P/4ve7LiAURdYQyy3MyePB7TIDDEAw+p9Qqz8+IIfVOS3ng1J
 G9y43mVHwGczXVMNOJyxSQcxjGXGSluVvlLhSH284NIdVZCeYDuKyW1ieArs4pz+
 6pFTapf57ZUlsnacwOnsbyC3MoFck26ZQ9cpnwOF0F0rq3fekwKyxBHp0oSWtoVQ
 ==
X-ME-Sender: <xms:_wTCYF8PdNQj6W1wzlV4kQcku_qarcQ_TOMFr8PFOqkGvb40AR-_xA>
 <xme:_wTCYJsBxJBy0KCQsbugwvxTyzZ6w04RwTzju7N20ULSoKeqgwA9-kNgMknL7Ut8K
 vawA16N3yALDIj5Ouk>
X-ME-Received: <xmr:_wTCYDBJKpkBtO6IXAFkEunQ1B8Iu4vHnVIl1jPtct49szdaqfPi7NuP83jRpssswdObcV5mx6LDPgBYKhVCaKlVxc_ZREmF8ssf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedufedgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:_wTCYJe15ZHZNdjUCja9QjWLu1WlqA-sRiba3xpvrVV--Dau8RAyww>
 <xmx:_wTCYKO_axXYL_TNXTtBXErnIF7oVy0322ml_28-M4VD7t-j6UzpHA>
 <xmx:_wTCYLmmN3LBJQ2VFRdSPScIEk3D1zJBZgkgc5oNyvi17jS1NWH_Ww>
 <xmx:AQXCYFeDXWWKPm8JQQYHlS0EskI_cmnxbj5Xwd05n2CNTN0ggvDag6Tc5P4>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Jun 2021 08:26:39 -0400 (EDT)
Date: Thu, 10 Jun 2021 14:26:36 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 04/12] ASoC: hdmi-codec: Add iec958 controls
Message-ID: <20210610122636.nrzq4edube4e4xx5@gilmour>
References: <20210525132354.297468-1-maxime@cerno.tech>
 <20210525132354.297468-5-maxime@cerno.tech>
 <20210609124304.GB5052@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ca7v7tdvp4h73ynz"
Content-Disposition: inline
In-Reply-To: <20210609124304.GB5052@sirena.org.uk>
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
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-rpi-kernel@lists.infradead.org, Jaroslav Kysela <perex@perex.cz>,
 linux-arm-kernel@lists.infradead.org, Dom Cobley <dom@raspberrypi.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ca7v7tdvp4h73ynz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mark

On Wed, Jun 09, 2021 at 01:43:04PM +0100, Mark Brown wrote:
> On Tue, May 25, 2021 at 03:23:46PM +0200, Maxime Ripard wrote:
> > The IEC958 status bits can be exposed and modified by the userspace
> > through dedicated ALSA controls.
> >=20
> > This patch implements those controls for the hdmi-codec driver. It
> > relies on a default value being setup at probe time that can later be
> > overridden by the control put.
>=20
> This breaks bisection:
>=20
> /mnt/kernel/sound/soc/codecs/hdmi-codec.c: In function 'hdmi_codec_hw_par=
ams':
> /mnt/kernel/sound/soc/codecs/hdmi-codec.c:504:50: error: invalid type arg=
ument of '->' (have 'struct hdmi_codec_params')
>   memcpy(hp.iec.status, hcp->iec_status, sizeof(hp->iec_status));
>                                                   ^~

Indeed, sorry. I just sent a new version of the PR with that breakage fixed

Maxime

--ca7v7tdvp4h73ynz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYMIE/AAKCRDj7w1vZxhR
xRTlAP9A1B518vIEh0yPmEb88zrbl9iK6pcUuknr9pf2xJtwUAEA/rrMwlBSRpR8
Y+nhnpOTpFudYyX6DNXdi97U/IRptgk=
=GVe1
-----END PGP SIGNATURE-----

--ca7v7tdvp4h73ynz--
