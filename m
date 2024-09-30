Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C00989BC7
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 09:45:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B12E10E3B8;
	Mon, 30 Sep 2024 07:44:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FQGExqGq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B67410E3B8
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 07:44:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9ABD15C4C5F;
 Mon, 30 Sep 2024 07:44:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0200CC4CED5;
 Mon, 30 Sep 2024 07:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727682293;
 bh=hNlNzwLvuBX9rwWnjO4/JPLaI48Tlz1qJu1m0jUpdr0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FQGExqGq2aPE3j4VEmerBOuBA9h+AxXSq37e0bOCBjl/je9eYV+/ykLoVah07BrfE
 GVpRcpdUYmGx0opBIcT2tWCB6liMeIfMnbp9hvKqEVhCOUSKPsY6PTVSyccnrg9A/b
 epH66JiWfAQKHua644mmkoe6mw3Dz6x/AycVgQtL3LrwSQCBCUfOLmnZEmqu+d0sb6
 oRO6cdYhak5DUXAaB2Z9mhBs+S7fFhG+kHPdBdQQsPNrkSrXcOT+m8DWXcJpkdoXvd
 hK/6T+Sw5oNLLUvsFF92/E6p6ySbhyAZ7EY/jTvMwGrthrH+QGhP9avQj6wNWreY2K
 ijU0JQ8Ec0hGA==
Date: Mon, 30 Sep 2024 09:44:51 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Mark Yao <markyao0591@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, 
 kernel@collabora.com, Alexandre ARNOUD <aarnoud@me.com>, 
 Luis de Arquer <ldearquer@gmail.com>, Algea Cao <algea.cao@rock-chips.com>
Subject: Re: [PATCH v8 1/3] drm/bridge: synopsys: Add DW HDMI QP TX
 Controller support library
Message-ID: <hax2zu7wlpucxllqapc5dzjirvrkanxkzdxtd2shu3tlc53t3m@ctpcuxifl3ds>
References: <20240929-b4-rk3588-bridge-upstream-v8-0-83538c2cc325@collabora.com>
 <20240929-b4-rk3588-bridge-upstream-v8-1-83538c2cc325@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="s7gahhjnit22mlpj"
Content-Disposition: inline
In-Reply-To: <20240929-b4-rk3588-bridge-upstream-v8-1-83538c2cc325@collabora.com>
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


--s7gahhjnit22mlpj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 29, 2024 at 01:36:47AM GMT, Cristian Ciocaltea wrote:
> +static enum drm_mode_status
> +dw_hdmi_qp_bridge_mode_valid(struct drm_bridge *bridge,
> +			     const struct drm_display_info *info,
> +			     const struct drm_display_mode *mode)
> +{
> +	struct dw_hdmi_qp *hdmi = bridge->driver_private;
> +
> +	if (mode->clock > HDMI14_MAX_TMDSCLK / 1000) {
> +		dev_dbg(hdmi->dev, "Unsupported mode clock: %d\n", mode->clock);
> +		return MODE_CLOCK_HIGH;
> +	}

Similarly, you should use drm_hdmi_compute_mode_clock here, with RGB and 8bpc

Once fixed,
Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--s7gahhjnit22mlpj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZvpW8gAKCRAnX84Zoj2+
dmA3AX9ZbkD3HSjUw8ZudFDWE7bSMD1N/4nblONlQVzDTPoRo/xUWVvxRifyIpHo
n8eWlTcBfjfxBcgbXzYRvbh16CIBICTLF7N9txHbxgi0eIVoUlyBZm+LQF7eS823
KwAALtJWVg==
=VY2V
-----END PGP SIGNATURE-----

--s7gahhjnit22mlpj--
