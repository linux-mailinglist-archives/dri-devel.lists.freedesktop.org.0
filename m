Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D99C8989BA4
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 09:36:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE9A010E1C4;
	Mon, 30 Sep 2024 07:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kHk8kVgB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7F310E1C4
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 07:36:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E304DA41421;
 Mon, 30 Sep 2024 07:35:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62884C4CED1;
 Mon, 30 Sep 2024 07:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727681764;
 bh=UwQAYfkqO+7NbChaILjq1p3+O1Kla+UdCJwA5Zn+i+8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kHk8kVgBpj2ON88akPzrIYylMLUgkV1Q6RkC0c2RjwJt/BSIJ87fNshgke5fe46ZJ
 iYU3wwLz/69kaTz1omPQYJShXxSKJ4LGClpckh5sDkrdpInZCf3YgRU+SbKOqZvsiR
 C8Xn1I1qxQa3k4ka/MSTR4nRRXlhF4MWv/e9dyB59hX3KoXUv+1PtHykAslywsg2f3
 wahc09BFFjbHfGmM3aPRurHbNlQ4oR9cZ7P25Wgi5vuSanUHaYREnvBKycnR8Zmvil
 la5KA0V5/ykcedOKIHuFB+hwMBF9CU1svFkKdsScPnOzIYe/D2q8rWjlRlMB3VC/u5
 0fZ7wEnwu32FQ==
Date: Mon, 30 Sep 2024 09:36:02 +0200
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
Subject: Re: [PATCH v8 3/3] drm/rockchip: Add basic RK3588 HDMI output support
Message-ID: <i2nsst5bvz2emy54r7ll5pi6uihnvdodkgewevumhrdrr7jr6a@uui3shhzhz2y>
References: <20240929-b4-rk3588-bridge-upstream-v8-0-83538c2cc325@collabora.com>
 <20240929-b4-rk3588-bridge-upstream-v8-3-83538c2cc325@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="7s67ya4tohfqd2w2"
Content-Disposition: inline
In-Reply-To: <20240929-b4-rk3588-bridge-upstream-v8-3-83538c2cc325@collabora.com>
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


--7s67ya4tohfqd2w2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Sun, Sep 29, 2024 at 01:36:49AM GMT, Cristian Ciocaltea wrote:
> +static void dw_hdmi_qp_rockchip_encoder_enable(struct drm_encoder *encoder)
> +{
> +	struct rockchip_hdmi_qp *hdmi = to_rockchip_hdmi_qp(encoder);
> +	struct drm_crtc *crtc = encoder->crtc;
> +	int rate;
> +
> +	/* Unconditionally switch to TMDS as FRL is not yet supported */
> +	gpiod_set_value(hdmi->enable_gpio, 1);
> +
> +	if (crtc && crtc->state) {
> +		clk_set_rate(hdmi->ref_clk,
> +			     crtc->state->adjusted_mode.crtc_clock * 1000);

Sorry, I should have seen it in your previous version, but the rate here
should be the TMDS character rate, not the pixel clock, right?

Once fixed,
Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--7s67ya4tohfqd2w2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZvpU4QAKCRAnX84Zoj2+
drrdAYDIR05FELJA0qfbce9Chdkrm4BQoxsM7sNZLCHRE9StuP0VWBJNhNidV5Ql
k8L4akQBf2bEy3dcSYB6/4q5XJpS664ZDID1RP/TgfiVQJp8F+o0pEH1pevFglig
lzo1uFYjqg==
=sHau
-----END PGP SIGNATURE-----

--7s67ya4tohfqd2w2--
