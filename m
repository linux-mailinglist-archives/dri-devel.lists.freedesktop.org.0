Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C52CEB2C385
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 14:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 325BF10E14C;
	Tue, 19 Aug 2025 12:29:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FXXLpS9y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26DF010E14C
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 12:29:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CAE6542BA4;
 Tue, 19 Aug 2025 12:29:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3829CC4CEF1;
 Tue, 19 Aug 2025 12:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755606575;
 bh=5Huu/pyzETo4vLox0ZvoelQRyZfLgqYs/4ywNM24QGA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FXXLpS9y+5N6zftUZlEDtGZ+LYXDHAxWcv12vcsQ6sJCsH9jLI9JOlovPED9Wg8lT
 ppHEvlHPxe8WFBLZ8p9UQ12wI1C4a9FOn0soleLWroD5qs/COpC2Dz4q82V+9Rf/0/
 1dRrgpfG8tYWl514/ZRZjmI2w3Fgs1o9Z86wqDWxEuD0Ts5tDEgOFdXvxY+/6SMJqv
 p5p9T3wc2GYBzJAg3eKqnlbHfVK2rZx4xCTqbZG/zdMEmFGXI/RUk8QXcpWowt1g6W
 KA/KOlmW0JkVWWUy/akw30Oqf3aOXTi/xxaIZwVqSpblUgqvCz4WMkm3bqnfnWyf7G
 uAkqnzmQcKxDw==
Date: Tue, 19 Aug 2025 14:29:32 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH 2/2] drm/bridge: ti-sn65dsi83: protect device resources
 on unplug
Message-ID: <l2orbpdoh3cqqgqudbnbdlogo3bd57uu4nv3ax74uoahknzjgr@gbxxuky3huw6>
References: <20250808-drm-bridge-atomic-vs-remove-v1-0-a52e933b08a8@bootlin.com>
 <20250808-drm-bridge-atomic-vs-remove-v1-2-a52e933b08a8@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="g4pzyrjzx5mkcdit"
Content-Disposition: inline
In-Reply-To: <20250808-drm-bridge-atomic-vs-remove-v1-2-a52e933b08a8@bootlin.com>
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


--g4pzyrjzx5mkcdit
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] drm/bridge: ti-sn65dsi83: protect device resources
 on unplug
MIME-Version: 1.0

On Fri, Aug 08, 2025 at 03:24:29PM +0200, Luca Ceresoli wrote:
> To support hot-unplug of this bridge we need to protect access to device
> resources in case sn65dsi83_remove() happens concurrently to other code.
>=20
> Some care is needed for the case when the unplug happens before
> sn65dsi83_atomic_disable() has a chance to enter the critical section
> (i.e. a successful drm_bridge_enter() call), which occurs whenever the
> hardware is removed while the display is active. When that happens,
> sn65dsi83_atomic_disable() in unable to release some resources, thus this
> needs to be done in sn65dsi83_remove() after drm_bridge_unplug().
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 53 +++++++++++++++++++++++++++++=
++++++
>  1 file changed, 53 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi83.c
> index 033c44326552ab167d4e8d9b74957c585e4c6fb7..9e4cecf4f7cb056f0c34e8700=
7fcebf50780e49c 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -157,6 +157,7 @@ struct sn65dsi83 {
>  	struct drm_bridge		*panel_bridge;
>  	struct gpio_desc		*enable_gpio;
>  	struct regulator		*vcc;
> +	bool				disable_resources_needed;
>  	bool				lvds_dual_link;
>  	bool				lvds_dual_link_even_odd_swap;
>  	int				lvds_vod_swing_conf[2];
> @@ -406,6 +407,10 @@ static void sn65dsi83_reset_work(struct work_struct =
*ws)
>  {
>  	struct sn65dsi83 *ctx =3D container_of(ws, struct sn65dsi83, reset_work=
);
>  	int ret;
> +	int idx;
> +
> +	if (!drm_bridge_enter(&ctx->bridge, &idx))
> +		return;
> =20
>  	/* Reset the pipe */
>  	ret =3D sn65dsi83_reset_pipe(ctx);
> @@ -415,12 +420,18 @@ static void sn65dsi83_reset_work(struct work_struct=
 *ws)
>  	}
>  	if (ctx->irq)
>  		enable_irq(ctx->irq);
> +
> +	drm_bridge_exit(idx);
>  }
> =20
>  static void sn65dsi83_handle_errors(struct sn65dsi83 *ctx)
>  {
>  	unsigned int irq_stat;
>  	int ret;
> +	int idx;
> +
> +	if (!drm_bridge_enter(&ctx->bridge, &idx))
> +		return;
> =20
>  	/*
>  	 * Schedule a reset in case of:
> @@ -441,6 +452,8 @@ static void sn65dsi83_handle_errors(struct sn65dsi83 =
*ctx)
> =20
>  		schedule_work(&ctx->reset_work);
>  	}
> +
> +	drm_bridge_exit(idx);
>  }
> =20
>  static void sn65dsi83_monitor_work(struct work_struct *work)
> @@ -478,10 +491,15 @@ static void sn65dsi83_atomic_pre_enable(struct drm_=
bridge *bridge,
>  	__le16 le16val;
>  	u16 val;
>  	int ret;
> +	int idx;
> +
> +	if (!drm_bridge_enter(bridge, &idx))
> +		return;
> =20
>  	ret =3D regulator_enable(ctx->vcc);
>  	if (ret) {
>  		dev_err(ctx->dev, "Failed to enable vcc: %d\n", ret);
> +		drm_bridge_exit(idx);
>  		return;
>  	}
> =20
> @@ -625,6 +643,8 @@ static void sn65dsi83_atomic_pre_enable(struct drm_br=
idge *bridge,
>  		dev_err(ctx->dev, "failed to lock PLL, ret=3D%i\n", ret);
>  		/* On failure, disable PLL again and exit. */
>  		regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
> +		ctx->disable_resources_needed =3D true;
> +		drm_bridge_exit(idx);
>  		return;
>  	}
> =20
> @@ -633,6 +653,9 @@ static void sn65dsi83_atomic_pre_enable(struct drm_br=
idge *bridge,
> =20
>  	/* Wait for 10ms after soft reset as specified in datasheet */
>  	usleep_range(10000, 12000);
> +
> +	ctx->disable_resources_needed =3D true;
> +	drm_bridge_exit(idx);
>  }
> =20
>  static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
> @@ -640,6 +663,10 @@ static void sn65dsi83_atomic_enable(struct drm_bridg=
e *bridge,
>  {
>  	struct sn65dsi83 *ctx =3D bridge_to_sn65dsi83(bridge);
>  	unsigned int pval;
> +	int idx;
> +
> +	if (!drm_bridge_enter(bridge, &idx))
> +		return;
> =20
>  	/* Clear all errors that got asserted during initialization. */
>  	regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
> @@ -659,6 +686,8 @@ static void sn65dsi83_atomic_enable(struct drm_bridge=
 *bridge,
>  		/* Use the polling task */
>  		sn65dsi83_monitor_start(ctx);
>  	}
> +
> +	drm_bridge_exit(idx);
>  }
> =20
>  static void sn65dsi83_atomic_disable(struct drm_bridge *bridge,
> @@ -666,6 +695,10 @@ static void sn65dsi83_atomic_disable(struct drm_brid=
ge *bridge,
>  {
>  	struct sn65dsi83 *ctx =3D bridge_to_sn65dsi83(bridge);
>  	int ret;
> +	int idx;
> +
> +	if (!drm_bridge_enter(bridge, &idx))
> +		return;
> =20
>  	if (ctx->irq) {
>  		/* Disable irq */
> @@ -685,6 +718,9 @@ static void sn65dsi83_atomic_disable(struct drm_bridg=
e *bridge,
>  		dev_err(ctx->dev, "Failed to disable vcc: %d\n", ret);
> =20
>  	regcache_mark_dirty(ctx->regmap);
> +
> +	ctx->disable_resources_needed =3D false;
> +	drm_bridge_exit(idx);
>  }
> =20
>  static enum drm_mode_status
> @@ -1005,7 +1041,24 @@ static void sn65dsi83_remove(struct i2c_client *cl=
ient)
>  {
>  	struct sn65dsi83 *ctx =3D i2c_get_clientdata(client);
> =20
> +	drm_bridge_unplug(&ctx->bridge);
>  	drm_bridge_remove(&ctx->bridge);

Shouldn't we merge drm_bridge_unplug with the release part of
devm_drm_bridge_alloc?

> +
> +	/*
> +	 * sn65dsi83_atomic_disable() should release some resources, but it
> +	 * cannot if we call drm_bridge_unplug() before it can
> +	 * drm_bridge_enter(). If that happens, let's release those
> +	 * resources now.
> +	 */
> +	if (ctx->disable_resources_needed) {
> +		if (!ctx->irq)
> +			sn65dsi83_monitor_stop(ctx);
> +
> +		gpiod_set_value_cansleep(ctx->enable_gpio, 0);
> +		usleep_range(10000, 11000);
> +
> +		regulator_disable(ctx->vcc);
> +	}

I'm not sure you need this. Wouldn't registering a devm action do the
same thing?

Maxime

--g4pzyrjzx5mkcdit
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaKRuLAAKCRAnX84Zoj2+
dlv2AXsHD/wvh5nj+sbybV6jaxdvjcYkvSx2ke3niTEIe6cEaY0r9tVPRfydxl4Y
9K/C3RcBgJqyGxEBvV2Lm+mFRuHRs7e/UTe7BVWFnM16oQnqdv28mAiouDFw6G+Q
49fLyRM5vA==
=NpQK
-----END PGP SIGNATURE-----

--g4pzyrjzx5mkcdit--
