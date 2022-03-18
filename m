Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F41464DDE8B
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 17:18:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E2C10E604;
	Fri, 18 Mar 2022 16:18:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 321AB10E604
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 16:18:53 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 2C2463201E3E;
 Fri, 18 Mar 2022 12:18:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 18 Mar 2022 12:18:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=W0RtaiVVoWuDJFHs12YiGTwXGd5lX99ofXkpvP
 buN/M=; b=ZGHO3Vd7IFoj1GyK1l6273ryTg0I/eVkqSUzVtrCkje71GM+kcqIkd
 G8YfOBYH2poC/2y8VKHPqdbw6OWYqgVXR+pZ7/OcKnUsGFnYfqpz9n+NSpLzcxg3
 Bbt7TDEoHMRwZkk5utXbvLcmGHJyYU1Sir+TiWwrBqcLtQBLdx6oKMqullp42bq3
 kLlbttwB+yVtSwe8j6goGK8bhp2qir4iTqlMMOmuJPcLL4JjcYMuILxWFsGgAOzz
 d53KQHekoMPR0NJdMDFObhPnrju0a7CCPWvyU8T4x/H2ObVUZCkkdcxQyjmOlUS9
 uRuelEAHaD1qZrt2s/g4fl5eija+yf8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=W0RtaiVVoWuDJFHs1
 2YiGTwXGd5lX99ofXkpvPbuN/M=; b=Sg1aNxuhbeKW3dADtgBAJKe9zO6uT+Lhm
 2QLxdFnWCmakrgRE8iDlBRd50QTnawTBL+FTxsmjRb/xGI3ojjHeq/bMIm5bBpRi
 wO70npk24n5P/aVhscq4AmbkqS7UrMPgKBhP+R5BjWviAe0rETmF7+NBTXxrrOxz
 hSHliveO/GXyb9pyMFGOvrkUsBNEap7qwv63p+xEO810lMhx51b7vB6l/hXSyEdj
 LF3jWZ6Q/4Knhd9ENv3n1SsNL9tthJjuMynrpuR06DDfaDM57plwPKPW2cirEBBG
 tCQaQuRLev2IBjokWNCKAjE82mbaWo8gpex01FbpaKAgcWdIOcfyQ==
X-ME-Sender: <xms:6bA0YlhAq0ndjOUBe9dODegdLLP2_WZUpwdF8EHNQyGxyV6BqSETDQ>
 <xme:6bA0YqCRzyJkn65lATBpfjpN_XK4TjgAQfpSoQ7a_RXODu3Mv8QWRnOthggiQ7fcJ
 Y19_IDdA0YhWo2Vfbs>
X-ME-Received: <xmr:6bA0YlEZF0YPAy6qHJeb9KUnj3w1bzBiewHsARksMyLxpAzmHI_NKQPQnWDfdrv9chL-Ae0Q-0DcT2iWq3cb7WNkcFqklY6ZpQksfqc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudefiedgkeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucdnkfhovfculdeitddmnecujfgurhepfffhvffukf
 hfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceo
 mhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvghrnhepleekgeehhf
 dutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieehgedunecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnh
 hordhtvggthh
X-ME-Proxy: <xmx:6bA0YqT5I3Linvec27AhQoNLHvXEPJIAl-M7oAzJI3Rlr12Gt4-JqA>
 <xmx:6bA0YixnDoN4eWnaX1rxQ24R2CN51-Cg-zCazC3v_qHX_FNh5zIQUQ>
 <xmx:6bA0Yg4SSoM5k8zSEW0jZlPUKpmalXbOW3rwKE8a1OOruyh6Z9xMBjB1ow>
 <xmx:6bA0Yhn4cgo-d-CVOT_LU2mrZhwv4VWbYimR4-xdt92W8UJA3HCyIQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Mar 2022 12:18:48 -0400 (EDT)
Date: Fri, 18 Mar 2022 17:18:47 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v2] drm: of: Properly try all possible cases for
 bridge/panel detection
Message-ID: <20220318161847.ezi6yat4on7rvfdf@houat>
References: <20220318160249.126431-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="z4cu6dac2674z2wt"
Content-Disposition: inline
In-Reply-To: <20220318160249.126431-1-paul.kocialkowski@bootlin.com>
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--z4cu6dac2674z2wt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 18, 2022 at 05:02:49PM +0100, Paul Kocialkowski wrote:
> While bridge/panel detection was initially relying on the usual
> port/ports-based of graph detection, it was recently changed to
> perform the lookup on any child node that is not port/ports
> instead when such a node is available, with no fallback on the
> usual way.
>=20
> This results in breaking detection when a child node is present
> but does not contain any panel or bridge node, even when the
> usual port/ports-based of graph is there.
>=20
> In order to support both situations properly, this commit reworks
> the logic to try both options and not just one of the two: it will
> only return -EPROBE_DEFER when both have failed.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Fixes: 80253168dbfd ("drm: of: Lookup if child node has panel or bridge")
> ---
>=20
> Changes since v1:
> - Renamed remote to node;
> - Renamed helper to find_panel_or_bridge;
> - Cleared bridge pointer early;
> - Returned early to make the code more concise;
>=20
> ---
>  drivers/gpu/drm/drm_of.c | 98 ++++++++++++++++++++--------------------
>  1 file changed, 49 insertions(+), 49 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> index 9d90cd75c457..63137c833b7a 100644
> --- a/drivers/gpu/drm/drm_of.c
> +++ b/drivers/gpu/drm/drm_of.c
> @@ -219,6 +219,28 @@ int drm_of_encoder_active_endpoint(struct device_nod=
e *node,
>  }
>  EXPORT_SYMBOL_GPL(drm_of_encoder_active_endpoint);
> =20
> +static int find_panel_or_bridge(struct device_node *node,
> +				struct drm_panel **panel,
> +				struct drm_bridge **bridge)
> +{
> +	if (panel) {
> +		*panel =3D of_drm_find_panel(node);
> +		if (!IS_ERR(*panel))
> +			return 0;
> +		else
> +			*panel =3D NULL;

You don't need the else branch here, we already cleared panel in
drm_of_find_panel_or_bridge

Looks good otherwise, thanks!
Maxime

--z4cu6dac2674z2wt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYjSw5gAKCRDj7w1vZxhR
xWMYAP9UxgWQ44wOKvarITHty4nCGtH+DXxERccY8JZh+3tr0wD/eIa4rSSsOg12
DUrsZb8HDRBGNTMwSgMSFnfdBo2+2Qo=
=mFT4
-----END PGP SIGNATURE-----

--z4cu6dac2674z2wt--
