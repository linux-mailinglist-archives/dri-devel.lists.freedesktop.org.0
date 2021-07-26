Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD00D3D5CC6
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 17:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5DDA6E87F;
	Mon, 26 Jul 2021 15:17:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88156E87F
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 15:17:04 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id B268B58036C;
 Mon, 26 Jul 2021 11:17:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 26 Jul 2021 11:17:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=5FIKR14gh2moE93DzqPQOXq535s
 UfFWvi22VAwD+SLs=; b=sv8qazxxaLdKWfKAGemRIHvpFOtGbjgO2MGap1uolRa
 prn5pRe4dIS7A8ui1QHi4b7wr8YdlLrivD2HJhHs2SokOfFGQ4iYsXxuqkymi0Vs
 PIbxrowIAa2vOR/oNlLqaKrr98pZ9QIgv7jHPK1YbIoKao8qD1Ve+bUR/ciR6YkL
 ut4KSmIEh8v/kX6zkH6/9M38k9CmjWbYD8+GLKxK9SjlQBpXrvKcshjHV2Ku1XyT
 e5dCnqRUu43Oo67Bw4nciP2/gEAypy030WwL/P3TldPl58bYytrel+GQ4yoK9WIW
 hCutQXnAX4Wxtwrf3Mv5/ZZz3FHsw/Xasxd82lgptUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=5FIKR1
 4gh2moE93DzqPQOXq535sUfFWvi22VAwD+SLs=; b=bb11n19qzrXboWF6QOiJDF
 +IA3+jn2mbohYKtk4nZ/CvrgC5VivFgVgtMG2TC7PE1H/MV0Zl5vLW/aszjlibCv
 FJIHg0L1Pw9YcmxliclMOIxjifiJYS5dQNmgkjoIgxEpvmoIJ3VvZ6kORERafTaI
 ioPiCGBpY2Q/kMRDhHTJshf8/YEsUyPsg6DCFESvj/k/r8W/WHuR6QfJ+Zuhrt1P
 +mVzVBTh7r2yfCtsn1jIVLC7YL7Ug84rxV1sGffEMknZcGG7p8/ouN/o1AIu3t6I
 OZ+vR9vi5ceNDwtZinAfHnOqXsUaWy7EGE/YRT0/JHCONE9EwtRqogubpeOu1GGA
 ==
X-ME-Sender: <xms:69H-YMiEBe_nHBPe4oN9uJqL-oVJ8ZdDFirdNuqlIeW24SUN_mvMIg>
 <xme:69H-YFBV-9oSuTcVkT4v15eqUbBP25jS8c-fdhQatBfAdr4hVWirVmyLXxIjjZczK
 WIo8ne_uNz3cnYL7Iw>
X-ME-Received: <xmr:69H-YEGLyQg30mCFdqkU3xlypNoqC4T6idTobXKeSYr7vQOHiWKCwtHUlAn4oVptcDa0VOqea4JTqRYc82fa8gZXI6QF4CD0cdUn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgeehgdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:69H-YNQcvNOtBYeXruvHtpkIRLeiy2Zd7zP3RXUK0oekXRPdeYxyAg>
 <xmx:69H-YJyCstDABDHsnsutUu_6IPzAuOVhrHOmGn7GlRq254u4aEVD4Q>
 <xmx:69H-YL5gEG4vAvxqj-ZnZc5X2UzBIWkbnFeHuHds0OdtXG-oHRoj8Q>
 <xmx:7dH-YMrpj4ZwA24C_wwczRAUtjTdSOwfmVcx9rJQWakopzF694z_GQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Jul 2021 11:16:59 -0400 (EDT)
Date: Mon, 26 Jul 2021 17:16:57 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 04/10] drm/bridge: Document the probe issue with MIPI-DSI
 bridges
Message-ID: <20210726151657.c46qmkdvqfhlg6ox@gilmour>
References: <20210720134525.563936-1-maxime@cerno.tech>
 <20210720134525.563936-5-maxime@cerno.tech>
 <YPgNbVoNnq3fTMN2@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hsam23b3ijjhsxdu"
Content-Disposition: inline
In-Reply-To: <YPgNbVoNnq3fTMN2@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--hsam23b3ijjhsxdu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Wed, Jul 21, 2021 at 02:05:01PM +0200, Daniel Vetter wrote:
> On Tue, Jul 20, 2021 at 03:45:19PM +0200, Maxime Ripard wrote:
> > Interactions between bridges, panels, MIPI-DSI host and the component
> > framework are not trivial and can lead to probing issues when
> > implementing a display driver. Let's document the various cases we need
> > too consider, and the solution to support all the cases.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> I still have this dream that eventually we resurrect a patch to add
> device_link to bridges/panels (ideally automatically), to help with some
> of the suspend/resume issues around here.
>=20
> Will this make things worse?
>=20
> I think it'd be really good to figure that out with some coding, since if
> we have incompatible solution to handle probe issues vs suspend/resume
> issues, we're screwed.
>=20
> Atm the duct-tape is to carefully move things around between suspend and
> suspend_early hooks (and resume and resume_late) and hope it all works ...

My initial idea to fix this was indeed to use device links. I gave up
after a while since it doesn't look like there's a way to add a device
link before either the bridge or encoder probes.

Indeed the OF-Graph representation is device-specific, so it can't be
generic, and if you need to probe to add that link, well, it's already
too late for the probe ordering :)

Maxime

--hsam23b3ijjhsxdu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYP7R6QAKCRDj7w1vZxhR
xXldAQDXpWLYSTZeJVLCRJiFMIqVRrVtIsCXrhCNBxTWPQk6cAD+Ib0TiICvj6u2
gPWRpxDk3mTXiwDtQAWsfCfelfv/vgQ=
=tO9D
-----END PGP SIGNATURE-----

--hsam23b3ijjhsxdu--
