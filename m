Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B56DB09CE4
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 09:44:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A3410E0EF;
	Fri, 18 Jul 2025 07:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="NtDb9gfu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA92B10E0EF
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 07:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=34xXsyuXLt5G3sFnnm6LhH0F5M0Q/CkN67+h8HkKCxM=; b=NtDb9gfuqjcjuFv2bb5yO2ErUu
 09m3nI8IKZPKenJnZ3CKZiGRxiSW+f6xClTFPKwwy1+1135Ln35PsRzJQrho/KbaArb4IpsoojkDy
 g7peFThtI9xjmVgSmub8FBHopdReuQT6NIb/h5VlfZo35FQKCMqqdz3dkv7rI3pCGW1PYx980PuUZ
 xBw3NCnrt+goyscrsY1q1Df54YHmNrKTluZXKbNPmzojROJRDQacm1x7bTUgRCYbOZE9oa+558h6P
 fasIVQFdQZl9wLr5Pxgt4KigYQTrK85dP7IYMoM5CNwbjUCukXMd6N5xmucBhSdVGaTJT6xVhpiOl
 +svb00ZA==;
Received: from cst-prg-35-241.cust.vodafone.cz ([46.135.35.241]
 helo=phil.localnet) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1ucfke-0001jF-Us; Fri, 18 Jul 2025 09:43:29 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: linux-kernel@vger.kernel.org,
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Douglas Anderson <dianders@chromium.org>,
 Sugar Zhang <sugar.zhang@rock-chips.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Raag Jadav <raag.jadav@intel.com>, dri-devel@lists.freedesktop.org,
 linux-sound@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH 1/3] drm/bridge: dw-hdmi-qp: Return 0 in audio prepare when
 disconnected
Date: Fri, 18 Jul 2025 09:43:26 +0200
Message-ID: <8861545.DvuYhMxLoT@phil>
In-Reply-To: <20250717215620.288651-2-detlev.casanova@collabora.com>
References: <20250717215620.288651-1-detlev.casanova@collabora.com>
 <20250717215620.288651-2-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Am Donnerstag, 17. Juli 2025, 23:56:18 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Detlev Casanova:
> To configure audio registers, the clock of the video port in use must be
> enabled.
> As those clocks are managed by the VOP driver, they can't be enabled here
> to write the registers even when the HDMI cable is disconnected.
>=20
> Furthermore, the registers values are computed from the TMDS char rate,
> which is not available when disconnected.
>=20
> Returning -ENODEV seemed reasonable at first, but ASoC will log an error
> multiple times if dw_hdmi_qp_audio_prepare() return an error.
> Userspace might also retry multiple times, filling the kernel log with:
>=20
> hdmi-audio-codec hdmi-audio-codec.0.auto: ASoC error (-19): at snd_soc_da=
i_prepare() on i2s-hifi
>=20
> This has become even worse with the support of the second HDMI TX port.
>=20
> Activating the clocks to write fake data (fake because the TMDS char
> rate is unavailable) would require API changes to communicate between
> VOP and HDMI, which doesn't really make sense.
>=20
> Using a cached regmap to be dumped when a cable is connected won't work
> because writing order is important and some data needs to be retrieved
> from registers to write others.
>=20
> Returning 0 to silently fail sounds like the best and simplest solution.
>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/d=
rm/bridge/synopsys/dw-hdmi-qp.c
> index 5e5f8c2f95be1..7d3d7b5084c8d 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> @@ -459,7 +459,7 @@ static int dw_hdmi_qp_audio_prepare(struct drm_connec=
tor *connector,
>  	bool ref2stream =3D false;
> =20
>  	if (!hdmi->tmds_char_rate)
> -		return -ENODEV;
> +		return 0;

nit: part of me would like a short comment stating the requirment of the
running video-clock.

Heiko

> =20
>  	if (fmt->bit_clk_provider | fmt->frame_clk_provider) {
>  		dev_err(hdmi->dev, "unsupported clock settings\n");
>=20




