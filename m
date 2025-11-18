Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE512C6B82D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 21:00:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6445710E504;
	Tue, 18 Nov 2025 20:00:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="UTV8MhzG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E82610E504;
 Tue, 18 Nov 2025 20:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1763496009;
 bh=Ouz3sykA6NZWtw6Ox5elkRDV5HgOt7b0f0GP8Kov1EI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UTV8MhzGZCT6pEbkvadKMx88eRgkHh/BuJwjL7ViFkX8GYKo/Kklgll2xVBXkZlQF
 ZBDDmOe+RdQMe08+xVVPmYlsa3GF5Lw/PjdGBsKdTsYqoZJV/wQ9Zh0YMyPvEGzo7Y
 axSvCTEV+OYbBjghz5nybkVV2zcXM6sAxV4Umijn2BdAvXKVbgA3DCf2VDs3YT9YOT
 LYz8OowQRHgsRHjB2iaR0yuFmK+CgnHMkfF4uwNYt4ueo9cu20LqAY4W3Y9sm4j8EH
 Rwdm06n+iHYdq08roCIF3rHHZD3K+D9QZinZRYCgC5ADRTB0V3+J9sPvmlujWxP5QR
 HP+nOID4xnnpQ==
Received: from [192.168.1.90] (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C39BF17E0610;
 Tue, 18 Nov 2025 21:00:08 +0100 (CET)
Message-ID: <3863e0e5-677b-4225-9854-3ee420828275@collabora.com>
Date: Tue, 18 Nov 2025 22:00:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/10] drm/bridge: dw-hdmi-qp: Set bridge
 supported_formats
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20251117-color-format-v4-0-0ded72bd1b00@collabora.com>
 <20251117-color-format-v4-5-0ded72bd1b00@collabora.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20251117-color-format-v4-5-0ded72bd1b00@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi Nicolas,

On 11/17/25 9:11 PM, Nicolas Frattaroli wrote:
> The drm_bridge "supported_formats" member stores a bitmask of supported
> HDMI output formats if the bridge is in fact an HDMI bridge.
> 
> However, until now, the synopsys dw-hdmi-qp driver did not set this
> member in the bridge it creates.
> 
> Set it based on the platform data's supported_formats member, and
> default to BIT(HDMI_COLORSPACE_RGB) if it's absent, which preserves the
> previous behaviour.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> index fe4c026280f0..cf888236bd65 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> @@ -1269,6 +1269,11 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
>  		dev_warn(dev, "Set ref_clk_rate to vendor default\n");
>  	}
>  
> +	if (plat_data->supported_formats)
> +		hdmi->bridge.supported_formats = plat_data->supported_formats;

This duplicates a change already introduced via commit 1ff27c5929ab
("drm/bridge: dw-hdmi-qp: Handle platform supported formats and color depth").

> +	else
> +		hdmi->bridge.supported_formats = BIT(HDMI_COLORSPACE_RGB);

And this one looks redundant as well, since RGB is supposed to be mandatory:
supported_formats defaults to RGB in drm_bridge_connector_init() if there's no
HDMI bridge in the pipeline overriding it, while drmm_connector_hdmi_init()
errors out if supported_formats is unset or doesn't advertise RGB.

Hence I think this patch can be dropped.

Regards,
Cristian

