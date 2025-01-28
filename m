Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA2CA20E28
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 17:14:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E6A10E290;
	Tue, 28 Jan 2025 16:14:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sSuZdn8p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A1010E290
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 16:14:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E343CA40F8F;
 Tue, 28 Jan 2025 16:12:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 034EAC4CED3;
 Tue, 28 Jan 2025 16:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738080850;
 bh=mdFKniHm9KXKpyePPQqG9Nc6x0eYjQPiW6XlN7qqAIU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sSuZdn8pDee/DRuFRqYjEAkq9R8bzjMJesnY/LmKCK8XEqjdrMVHiDQgP2CK09WdM
 eupy8IDuwFO1Q/5V3BNFri63zR1zhuAt8Hk5RjnihHqEEAUcfDzJ2z96hM3AuWlVF3
 +aRpr61TS0R4dvpNRpWjau8SlzUovaInWIC5Z3NLevHdlwQkU9k3atpeFApVT6Q4af
 XEC5dTEY8+DoRZRFsnLH4+q3QU8gPa6/oIXxU8PlR4aVKw78U46CRbxHwy8JxiIy+Y
 uLh5QfRcK/Ze9+lcjVG+M1xrfwBULw6BD0mA58FF2t+4Bi9e5iBH3/fqSdjnNRVG5U
 shorGlJCCwwaA==
Date: Tue, 28 Jan 2025 17:14:06 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 08/10] drm/display: bridge-connector: handle CEC
 adapters
Message-ID: <j5vgb5kcjs2ax3kws6rlbcca57set22ncj6onvgbm4xwjtw43t@uplzdjywzrkr>
References: <20250126-drm-hdmi-connector-cec-v3-0-5b5b2d4956da@linaro.org>
 <20250126-drm-hdmi-connector-cec-v3-8-5b5b2d4956da@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="jlvdrkt32g5ihies"
Content-Disposition: inline
In-Reply-To: <20250126-drm-hdmi-connector-cec-v3-8-5b5b2d4956da@linaro.org>
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


--jlvdrkt32g5ihies
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 08/10] drm/display: bridge-connector: handle CEC
 adapters
MIME-Version: 1.0

On Sun, Jan 26, 2025 at 03:29:13PM +0200, Dmitry Baryshkov wrote:
>  /* -----------------------------------------------------------------------------
>   * Bridge Connector Initialisation
>   */
> @@ -633,6 +711,21 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  			if (ret)
>  				return ERR_PTR(ret);
>  		}
> +
> +		if (bridge->hdmi_cec_adapter_name) {
> +			if (!bridge->funcs->hdmi_cec_enable ||
> +			    !bridge->funcs->hdmi_cec_log_addr ||
> +			    !bridge->funcs->hdmi_cec_transmit)
> +				return ERR_PTR(-EINVAL);
> +
> +			ret = drm_connector_hdmi_cec_register(connector,
> +							      &drm_bridge_connector_hdmi_cec_ops,
> +							      bridge->hdmi_cec_adapter_name,
> +							      bridge->hdmi_cec_available_las,
> +							      bridge->hdmi_dev);
> +			if (ret)
> +				return ERR_PTR(ret);
> +		}

Maybe we can use a different bridge feature flag to trigger the CEC code
support instead?

Maxime

--jlvdrkt32g5ihies
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ5kCTgAKCRAnX84Zoj2+
dvmIAYDiQe6rHPk9dNG3rlqlQ+L6eAK5T5NsL5wnq6iHTm97tOu6EMbLTXE9X+JR
Ge2YLYkBgOxY7eZ7hGhJA47GxGHy3WMHHDvX0eIzHPo6aNlfDaya+6lr+gtyJSQE
1oFKUnLfYg==
=xUXC
-----END PGP SIGNATURE-----

--jlvdrkt32g5ihies--
