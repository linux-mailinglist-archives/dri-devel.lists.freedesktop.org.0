Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A013C4CA7DD
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 15:21:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF6410E4A6;
	Wed,  2 Mar 2022 14:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC5710E52F
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 14:21:49 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id E47B5581057;
 Wed,  2 Mar 2022 09:21:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 02 Mar 2022 09:21:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=hU6HsrKnth78ZSddWHxb6QvqVJZedVM+vKp04w
 +0t/A=; b=idvznvAYB6IWlPqt1bftUZQc0o3Ln7Sj+QWhtSkR4jbY8YIJGSNj50
 d93ZKiwIBiJ4TwFrE5NoErbnxh9OzoSFWA5Z0lr3mzmDLe9NHYJoDXaXW5stsK9n
 8RoiRpfYelWFT0gRxVLg5tApVI3TvCriFGyua4q0XYkNqFhJgx01GZRLH4i0VYo+
 dV6rsYyuItFcRRDYDwTFZ+HG5HEXIaIlGHgQ+rIXNZpPLHtmldVSu0v/jcWcI3Qt
 Nwy/GxtLP5O+ENQapkqYbM7V6kvPyS2SK63MtrwxXsX0A9iR9ZwJhZsaMSUe0WcY
 UDPvdGlhuCqz8rNNsnob2KNePo/vrXyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=hU6HsrKnth78ZSddW
 Hxb6QvqVJZedVM+vKp04w+0t/A=; b=BqC6X+e4OGKrmXH8Du9ng0ptEkjaa9ovt
 tBeluC3HTHSkBxEaJoAkjRs7ag/KmoLCVz14w5SAkV7MQVWkeDWVm64XnUHwKycs
 MayHmtafh2V1jaQLAVxmzB1TFst6WdDAm0ZCqKdd4XRsMl9itvqiZvLr4vKW0Qkb
 a3OMcH/xOtU8XhkefR/zDmmp//J/8hxEUGBNSBMdcLPd7uVzsVC3Jqxg9YGmcnCz
 m09dgvd9qmFq4WdvaFnc3kulSleFKdlDUKVHKvuScA0sqF1JUcxHEj3c8BGyugDU
 5+4paJEDvvtif3iAc51vXTY5cvvA7fMZK8PhmDgKrzB5zATY3+DkQ==
X-ME-Sender: <xms:eX0fYk7cEZBTtJWXOVQhE-2eO5x76WLY6iGLskiPwKRsc1zVKwX9hg>
 <xme:eX0fYl79ZmdyVyx2WQKeomYztn1cYsdZzjBgHozc5TSiy8Sb4yA4Iva3w5CwHPqV3
 30lTGQl2IzRkxCT7fw>
X-ME-Received: <xmr:eX0fYjethJytNvE-SzHKYiF9LGvTKTIoHinag-ir4T-7Y-3Qxa67lQs94vxb_VewB7R_whoe1UqXJVmBhT2kMiP-2sLbOlCgskJye4s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtgedgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:eX0fYpKWtH1IJaSy7yu0r_h8CY39u3HEMYyf_vcvhCR7IKS3lrw3_Q>
 <xmx:eX0fYoIMB2wwa2zZsScWhoft4cYp4b_I9sfYvDFUrGViqKSlBMYOpA>
 <xmx:eX0fYqy7-xg7qvAy2y47AueRtEgViUmRnfZk02T3h27_-FIOXl16Kg>
 <xmx:eX0fYl4waytffxuf-ln_gW9TMkY8JkZedh2Lt2QWXqOq8GsJmLWKqQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Mar 2022 09:21:44 -0500 (EST)
Date: Wed, 2 Mar 2022 15:21:42 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Max Krummenacher <max.oss.09@gmail.com>
Subject: Re: [RFC PATCH] drm/panel: simple: panel-dpi: use bus-format to set
 bpc and bus_format
Message-ID: <20220302142142.zroy464l5etide2g@houat>
References: <20220222084723.14310-1-max.krummenacher@toradex.com>
 <20220223134154.oo7xhf37bgtvm3ai@houat>
 <b5f471f4-0712-b798-efb8-b5b481cdb898@denx.de>
 <CAEHkU3Womyq09Lz62SJohix5JywfKvBRvuWedqF1D7gvb+T2tQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="k3a6e5aq6fismlwb"
Content-Disposition: inline
In-Reply-To: <CAEHkU3Womyq09Lz62SJohix5JywfKvBRvuWedqF1D7gvb+T2tQ@mail.gmail.com>
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
Cc: Marek Vasut <marex@denx.de>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 DenysDrozdov <denys.drozdov@toradex.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--k3a6e5aq6fismlwb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Please try to avoid top posting

On Wed, Feb 23, 2022 at 04:25:19PM +0100, Max Krummenacher wrote:
> The goal here is to set the element bus_format in the struct
> panel_desc. This is an enum with the possible values defined in
> include/uapi/linux/media-bus-format.h.
>=20
> The enum values are not constructed in a way that you could calculate
> the value from color channel width/shift/mapping/whatever. You rather
> would have to check if the combination of color channel
> width/shift/mapping/whatever maps to an existing value and otherwise
> EINVAL out.
>=20
> I don't see the value in having yet another way of how this
> information can be specified and then having to write a more
> complicated parser which maps the dt data to bus_format.

Generally speaking, sending an RFC without explicitly stating what you
want a comment on isn't very efficient.

That being said, what I (and I can only assume Marek) don't like is the
string encoding. Especially when the similar bus-type property uses a
integer with the various available bus options we have.

Having an integer, with a set of defines that you would map to the
proper MEDIA_BUS_* would be more efficient and more elegant.

That being said, the first question that needs to be answered is why
does this have to be in the DT in the first place?

Maxime

--k3a6e5aq6fismlwb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYh99dgAKCRDj7w1vZxhR
xdaEAP9fW1YJFu2pC0biPazLcBK3CNE9ztJtJFL1JsuwlGokUAD/ezrhXG9q4QiT
OJ6Ye6hKheS3IAkQTKa8Isxzn+ILlAg=
=cJti
-----END PGP SIGNATURE-----

--k3a6e5aq6fismlwb--
