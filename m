Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E1D9F4B0C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 13:36:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1032D10E95A;
	Tue, 17 Dec 2024 12:36:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cknow.org header.i=@cknow.org header.b="WrnXm66o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com
 [95.215.58.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BAC410E95A
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 12:36:45 +0000 (UTC)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
 t=1734439003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RolKsme1G9Rjox6sw68grNTuofAMfeweMCbeaFaOjdE=;
 b=WrnXm66oWyjzl5/KX5EDjjmy8k7gwxzTP0hDuvZDpj1vGd/1V7BBy61LdZaM5wSNYAjoXj
 FnPekO+HSxOYXxOIIoW+7HgnRyQlCdmWs3uMcVxDzMYbEns3wmGenx0D2dzkfH6HdiiTxV
 QtU7idQ6FjTQmrXHPWjFWO9yfp7MCANXq3Svn8ytWYeGIeiCMf3GYKb+i+J6nOqVHRgP/+
 XIa2cUnJ8EppY4xpTSJQTwcrVpDLqGmSQHRChEs0mQvjWib/fprlCbFw7GlXcE1cLBKvId
 84zo5MHicnENQIC+c1VQLKfyj2A0lXBQXWzen4IfKjBWGQMtbqrepa8h8eDALg==
Content-Type: multipart/signed;
 boundary=213d8d12555ec1eb5ee8f786b8c3bbdacf37d77fd939badb04e2ddb33646;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Tue, 17 Dec 2024 13:36:29 +0100
Message-Id: <D6DZB443IQ7A.3P1135M6DMF2S@cknow.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Phong LE"
 <ple@baylibre.com>, "Inki Dae" <inki.dae@samsung.com>, "Seung-Woo Kim"
 <sw0312.kim@samsung.com>, "Kyungmin Park" <kyungmin.park@samsung.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Russell King" <linux@armlinux.org.uk>,
 "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Sandy Huang" <hjc@rock-chips.com>, =?utf-8?q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, "Andy Yan" <andy.yan@rock-chips.com>, "Alain Volmat"
 <alain.volmat@foss.st.com>, "Raphael Gallais-Pou" <rgallaispou@gmail.com>,
 "Dave Stevenson" <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, "Raspberry Pi Kernel
 Maintenance" <kernel-list@raspberrypi.com>
Cc: "Jani Nikula" <jani.nikula@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH v7 00/10] drm: add DRM HDMI Codec framework
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
References: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
In-Reply-To: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
X-Migadu-Flow: FLOW_OUT
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

--213d8d12555ec1eb5ee8f786b8c3bbdacf37d77fd939badb04e2ddb33646
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Dec 17, 2024 at 1:40 AM CET, Dmitry Baryshkov wrote:
> This series depends on the ELD mutex series [1]
>
> [1] https://lore.kernel.org/r/20241201-drm-connector-eld-mutex-v1-0-ba56a=
6545c03@linaro.org

There's a v2 of that patch series here:
https://lore.kernel.org/all/20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8=
bea@linaro.org/

HTH,
  Diederik

--213d8d12555ec1eb5ee8f786b8c3bbdacf37d77fd939badb04e2ddb33646
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZ2FwVAAKCRDXblvOeH7b
btcgAQCrCEekrUY/E2pSYqYaHT6HKwkoEGuruBblZdydAr68eAEAsy2oRKKCWk/8
hitjosySt34ZoKPme2E/QoeOAZUr1gA=
=oJtw
-----END PGP SIGNATURE-----

--213d8d12555ec1eb5ee8f786b8c3bbdacf37d77fd939badb04e2ddb33646--
