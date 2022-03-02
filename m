Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD9B4CA196
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 10:59:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF92710EABC;
	Wed,  2 Mar 2022 09:59:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE5A10EDB0
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 09:59:08 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 5979C5C022D;
 Wed,  2 Mar 2022 04:59:08 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 02 Mar 2022 04:59:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=KFvsxfF8JDHM7wL+/s5I2mmQ232f/C4ItehR9h
 TyJ68=; b=giYpHCbL9fkEqdPIVhzFubdDx9kk7vE9LfBRisM9CTJa0Lg5eas1+V
 GB8V6br8aC32b9olOq/ZlQjU71sqB40CHl3tFmO3xawxVm20J1ZIqfC8LEB8lTAc
 Cx3VfGWVm8Kolh+jblk5i2IIihkxH77G9gV47mpYE/uBnx74GxCPaSyWE6+9ZWeD
 LWKG30ieiy5VScnLIgJ6NDB4k+ayirYP+Xssh90bNuRDs9iXfuCkNqhYiuywN2E7
 1mdSWEj44Sv7CB7Irngqrq287CmNmCMrX7wgt6mAi3QE0JDUrkjXhbjw7NsW1JqC
 UTvfvShBatjXBSLpAKZzLs9nDXtUnqeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=KFvsxfF8JDHM7wL+/
 s5I2mmQ232f/C4ItehR9hTyJ68=; b=EamGSNJ+dCDU5RQPPZeCD/n/ZN+838yFI
 lRBk5Sx6t33ypkVBM8TW7AXy9rHa3V1vMG2zJVuPf3XdSkII0XNTEpDw47exbuWA
 gkCVVdNCBvlVXDr8kuYTAjr8HZjL/I35w39H98E+PI1JRZDgZuevECgZ1YKu5Vxk
 /ApC410uv+BvfaKyK6mX9bzpRimUzVJhk/qKworTYSDOZ3ovGeGmIFycpOktLYQQ
 oxqb+CYNfGc503JE7C1qYHQq+vxLBuUIwVx8rEhS439p7I1y+CORYY6lCBeZ+JlS
 j3k6waBHoDmMjUG2uutW7lJ+PBOikTlfGOMw1GoatzZs+aQvuMQPg==
X-ME-Sender: <xms:7D8fYg9ovEsxuaOyVCwhuIX0Gpj7xg2mhTrnyn7CKwuQlI_1FgHQ6Q>
 <xme:7D8fYovkf7wjk1GFRyUNefhvbzdZB_CpUyIQm-mA6Px0p50q9qR8JXVvNBycqzbn2
 u1cGOnmjH-9AZ9dpIE>
X-ME-Received: <xmr:7D8fYmCJTVv4sqHTjbhfuqIbUwHHPS2zfLpK8hx8YxuBT5JYBDfm3w13Dr5JFGkhyOZdQvK-okOT2jtpwArwjLR3g96jiulNuzveBwE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtgedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:7D8fYgcq07Jim2NNjHCPO3hFOPbn8nebhpvzeSXBkctA1CM861oxFA>
 <xmx:7D8fYlPzYugoI7_bHqGIBqnJDm-sGdxpQN4fBHecziveKKVgZUoZVA>
 <xmx:7D8fYqnIKKQm_GGjDqI_aWGpezrFA9mwu-GEBiXNxt5_6rUfkB8Ujg>
 <xmx:7D8fYqq6d15af0x6GbdZKmvsddZa4xaE28s8v0iGokv_OHUoRCo_LA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Mar 2022 04:59:07 -0500 (EST)
Date: Wed, 2 Mar 2022 10:59:06 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V2 03/12] drm: bridge: icn6211: Add HS/VS/DE polarity
 handling
Message-ID: <20220302095906.zevdeadlx2cpyyrx@houat>
References: <20220217002530.396563-1-marex@denx.de>
 <20220217002530.396563-4-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3cx4htcgpbloxmna"
Content-Disposition: inline
In-Reply-To: <20220217002530.396563-4-marex@denx.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--3cx4htcgpbloxmna
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2022 at 01:25:21AM +0100, Marek Vasut wrote:
> The driver currently hard-codes HS/VS polarity to active-low and DE to
> active-high, which is not correct for a lot of supported DPI panels.
> Add the missing mode flag handling for HS/VS/DE polarity.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> To: dri-devel@lists.freedesktop.org
> ---
> V2: Rebase on next-20220214
> ---
>  drivers/gpu/drm/bridge/chipone-icn6211.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/b=
ridge/chipone-icn6211.c
> index e29e6a84c39a6..2ac8eb7e25f52 100644
> --- a/drivers/gpu/drm/bridge/chipone-icn6211.c
> +++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
> @@ -165,8 +165,16 @@ static void chipone_atomic_enable(struct drm_bridge =
*bridge,
>  				  struct drm_bridge_state *old_bridge_state)
>  {
>  	struct chipone *icn =3D bridge_to_chipone(bridge);
> +	struct drm_atomic_state *state =3D old_bridge_state->base.state;
>  	struct drm_display_mode *mode =3D &icn->mode;
> +	const struct drm_bridge_state *bridge_state;
>  	u16 hfp, hbp, hsync;
> +	u32 bus_flags;
> +	u8 pol;
> +
> +	/* Get the DPI flags from the bridge state. */
> +	bridge_state =3D drm_atomic_get_new_bridge_state(state, bridge);
> +	bus_flags =3D bridge_state->output_bus_cfg.flags;
> =20
>  	ICN6211_DSI(icn, MIPI_CFG_PW, MIPI_CFG_PW_CONFIG_DSI);
> =20
> @@ -206,7 +214,13 @@ static void chipone_atomic_enable(struct drm_bridge =
*bridge,
>  	ICN6211_DSI(icn, HFP_MIN, hfp & 0xff);
>  	ICN6211_DSI(icn, MIPI_PD_CK_LANE, 0xa0);
>  	ICN6211_DSI(icn, PLL_CTRL(12), 0xff);
> -	ICN6211_DSI(icn, BIST_POL, BIST_POL_DE_POL);
> +
> +	/* DPI HS/VS/DE polarity */
> +	pol =3D ((mode->flags & DRM_MODE_FLAG_PHSYNC) ? BIST_POL_HSYNC_POL : 0)=
 |
> +	      ((mode->flags & DRM_MODE_FLAG_PVSYNC) ? BIST_POL_VSYNC_POL : 0) |
> +	      ((bus_flags & DRM_BUS_FLAG_DE_HIGH) ? BIST_POL_DE_POL : 0);

Is there a reason you didn't use bus_flags for all the polarities there?

Maxime

--3cx4htcgpbloxmna
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYh8/6gAKCRDj7w1vZxhR
xTXhAQCpjkjKri4AMisZTgA4md9Psi7qww+meuvPJQ7+tFGQjQD8D3FlmBTtLMIe
jEPUhRmNyHp9/lhsD5MH/ZRCveZcAg8=
=4M+M
-----END PGP SIGNATURE-----

--3cx4htcgpbloxmna--
