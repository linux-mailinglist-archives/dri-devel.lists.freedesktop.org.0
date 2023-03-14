Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8DF6BA05D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 21:04:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E2A10E1C7;
	Tue, 14 Mar 2023 20:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB8A10E1C7;
 Tue, 14 Mar 2023 20:04:14 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id h8so23073707ede.8;
 Tue, 14 Mar 2023 13:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678824253;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FPsjGLHEk2fgihOY0CRt86zGCJvphTuiaNQiTQsSdI8=;
 b=niwvqGj4rz9lE9IYdY/3oo8dPQUpl+arw5E1AnCutPKcaNCEP3cksSZrxw89aTHZh9
 MImVlNjxF6RRXBEUPA23BzAj0QZJj0KoRfM0h2M6T5T6u5qO78weld3wkfTN2Ca+A3If
 hPu7PGGeAHrftZ9QCXZTWmMzxwvReK69bRahRthU0LX/c5De42X0MdxrWSmk5Gmr93KB
 9vNzhvNx3QjNVOqSw68H8GVSmFXaeKVB1Y8Y/0nEGjY5M9LQ3BDLZuJd1QmDSdO7xFwr
 P0fNTtQIWFuFa+MoR4b1zDkfFalD2vqIvdhql41+DhjVShW8ZUZz8WxbXI+F9kNjI34i
 JeNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678824253;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FPsjGLHEk2fgihOY0CRt86zGCJvphTuiaNQiTQsSdI8=;
 b=LKsbZOTEAcdPlUxTuSLhj1iT8eEsoJqFpMiqBbTUTLTgIA4tHMprdBl6VPN6zP/ZiX
 BW7MgX/UIWYCPUqSyV5iJKMkQiPRxe/UuOcjY6YetFhCPXOfKRx/2Tmqopivt85YP8WF
 D96F2tLQBom8gpFObrOZgOtSI53xg/wsEN1Q1fOfCmwGzO/if6U9uZnHNTWWFUapmNBy
 ZvtG6CcHAYUbasrpDIMSzk7OVETR1YbAbRMGq53ifYkk4g5Kxpit8edVKywnqqwC3IIz
 Q32uTX7QgWCeYkS9GfUrJeF8iZPsTDr5sVaEvPJFoQEZ9TAyTd1q8hrImRTaWl8wnkr9
 998Q==
X-Gm-Message-State: AO0yUKWgRYZ/f/Eg+5+8R6e+1lpWf6HU5O1PkT7SQB7tjx4s+NeBPQRD
 4Qae/1YqN7/HmvPLPtIKdOk=
X-Google-Smtp-Source: AK7set+oYbAeJ/U09NE2UZA16bmg8V2CkrqR5DzKLghgbnkXuMEp72tKp2I0vc56SOYdAmC9FNqhOw==
X-Received: by 2002:a17:906:9f0a:b0:92b:d4f6:7f4c with SMTP id
 fy10-20020a1709069f0a00b0092bd4f67f4cmr4526093ejc.2.1678824253254; 
 Tue, 14 Mar 2023 13:04:13 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net.
 [82.149.1.233]) by smtp.gmail.com with ESMTPSA id
 r9-20020a1709061ba900b0092b65c54379sm1527520ejg.104.2023.03.14.13.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 13:04:12 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Emma Anholt <emma@anholt.net>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] drm: Use of_property_present() for testing DT property
 presence
Date: Tue, 14 Mar 2023 21:04:10 +0100
Message-ID: <2217075.iZASKD2KPV@jernej-laptop>
In-Reply-To: <20230310144705.1542207-1-robh@kernel.org>
References: <20230310144705.1542207-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne petek, 10. marec 2023 ob 15:47:05 CET je Rob Herring napisal(a):
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties. As
> part of this, convert of_get_property/of_find_property calls to the
> recently added of_property_present() helper when we just want to test
> for presence of a property and nothing more.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 2 +-
>  drivers/gpu/drm/drm_mipi_dsi.c                  | 2 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c         | 2 +-
>  drivers/gpu/drm/sun4i/sun4i_backend.c           | 2 +-
>  drivers/gpu/drm/sun4i/sun8i_mixer.c             | 2 +-

For sun4i:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  drivers/gpu/drm/vc4/vc4_hdmi.c                  | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
> b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c index
> 9e5f2b4dc2e5..fab139b324af 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
> @@ -313,7 +313,7 @@ imx8qxp_pixel_link_find_next_bridge(struct
> imx8qxp_pixel_link *pl) }
> 
>  		/* specially select the next bridge with companion 
PXL2DPI */
> -		if (of_find_property(remote, "fsl,companion-pxl2dpi", 
NULL))
> +		if (of_property_present(remote, "fsl,companion-
pxl2dpi"))
>  			bridge_sel = ep_cnt;
> 
>  		ep_cnt++;
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
> index b41aaf2bb9f1..7900a4707d7c 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -329,7 +329,7 @@ int mipi_dsi_host_register(struct mipi_dsi_host *host)
> 
>  	for_each_available_child_of_node(host->dev->of_node, node) {
>  		/* skip nodes without reg property */
> -		if (!of_find_property(node, "reg", NULL))
> +		if (!of_property_present(node, "reg"))
>  			continue;
>  		of_mipi_dsi_device_add(host, node);
>  	}
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> b/drivers/gpu/drm/msm/adreno/adreno_gpu.c index ce6b76c45b6f..2359dca80492
> 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -964,7 +964,7 @@ static void adreno_get_pwrlevels(struct device *dev,
>  	gpu->fast_rate = 0;
> 
>  	/* You down with OPP? */
> -	if (!of_find_property(dev->of_node, "operating-points-v2", NULL))
> +	if (!of_property_present(dev->of_node, "operating-points-v2"))
>  		ret = adreno_get_legacy_pwrlevels(dev);
>  	else {
>  		ret = devm_pm_opp_of_add_table(dev);
> diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c
> b/drivers/gpu/drm/sun4i/sun4i_backend.c index 38070fc261f3..b11dbd50d73e
> 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_backend.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
> @@ -792,7 +792,7 @@ static int sun4i_backend_bind(struct device *dev, struct
> device *master, dev_set_drvdata(dev, backend);
>  	spin_lock_init(&backend->frontend_lock);
> 
> -	if (of_find_property(dev->of_node, "interconnects", NULL)) {
> +	if (of_property_present(dev->of_node, "interconnects")) {
>  		/*
>  		 * This assume we have the same DMA constraints for all 
our the
>  		 * devices in our pipeline (all the backends, but also 
the
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> b/drivers/gpu/drm/sun4i/sun8i_mixer.c index bafee05f6b24..11d5244a5aa5
> 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -391,7 +391,7 @@ static int sun8i_mixer_bind(struct device *dev, struct
> device *master, mixer->engine.ops = &sun8i_engine_ops;
>  	mixer->engine.node = dev->of_node;
> 
> -	if (of_find_property(dev->of_node, "iommus", NULL)) {
> +	if (of_property_present(dev->of_node, "iommus")) {
>  		/*
>  		 * This assume we have the same DMA constraints for
>  		 * all our the mixers in our pipeline. This sounds
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index ea22c9bf223a..bec1e0cdddb3 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -3018,7 +3018,7 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi
> *vc4_hdmi) struct device *dev = &pdev->dev;
>  	int ret;
> 
> -	if (!of_find_property(dev->of_node, "interrupts", NULL)) {
> +	if (!of_property_present(dev->of_node, "interrupts")) {
>  		dev_warn(dev, "'interrupts' DT property is missing, no 
CEC\n");
>  		return 0;
>  	}




