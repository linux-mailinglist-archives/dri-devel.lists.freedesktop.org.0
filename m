Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A577C6B8A5
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 21:14:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B61E289149;
	Tue, 18 Nov 2025 20:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="MGt3VCE3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6418F10E1BC;
 Tue, 18 Nov 2025 20:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1763496872;
 bh=ntdaEV4NiE2bT4pn3tO90tYaLAWeTGwiO9iMvGVDXFA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MGt3VCE35VgnXxKwFcVu+oj8XsA3gr1L1/1gC2LzuZ0trDFz0okJfjfVx9Qob+QLy
 a+bOU/4DiNWztKlIMnbyx+E/G8lpDMrzmAiGWPaw+6AFK0cklkbq5ocmkvzWVM3mUu
 SOcOt+su5NVsfXehJIi6QLbyEO8WrtauGkMho30RXajZodHKZFeJU+AiNMpcUvimbR
 LUtf5g20byvWgfeJ4XhEGOpaLToS9qrY6o2+PKJuIQBtPWInz85xhDKLadmfqhSsrY
 pBqiBB+hKG/1wOmsYGvmjytI3sxEAqUWAI/vlFoO51HZyP1DKCgAf5qHkVjGcybudO
 +Rp4qz8/QWhZA==
Received: from [192.168.1.90] (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D94A317E0342;
 Tue, 18 Nov 2025 21:14:31 +0100 (CET)
Message-ID: <edc12051-6e50-4ef6-98cf-713abb49dd90@collabora.com>
Date: Tue, 18 Nov 2025 22:14:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/10] drm/rockchip: dw_hdmi_qp: Set supported_formats
 platdata
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
 <20251117-color-format-v4-6-0ded72bd1b00@collabora.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20251117-color-format-v4-6-0ded72bd1b00@collabora.com>
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

On 11/17/25 9:11 PM, Nicolas Frattaroli wrote:
> With the introduction of the supported_formats member in the
> dw-hdmi-qp platform data struct, drivers that have access to this
> information should now set it.
> 
> Set it in the rockchip dw_hdmi_qp glue driver, where such a bitmask of
> supported color formats already exists. It just needs to be converted to
> the appropriate HDMI_COLORSPACE_ mask.
> 
> This allows this information to be passed down to the dw-hdmi-qp core,
> which sets it in the bridge it creates, and consequently will allow the
> common HDMI bridge code to act on it.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> index c9fe6aa3e3e3..7c294751de19 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> @@ -468,6 +468,28 @@ static const struct of_device_id dw_hdmi_qp_rockchip_dt_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(of, dw_hdmi_qp_rockchip_dt_ids);
>  
> +static const u32 supported_colorformats = DRM_COLOR_FORMAT_AUTO |
> +					  DRM_COLOR_FORMAT_RGB444 |
> +					  DRM_COLOR_FORMAT_YCBCR444;
> +
> +static unsigned int __pure drm_to_hdmi_fmts(const u32 fmt)
> +{
> +	unsigned int res = 0;
> +
> +	if (fmt & DRM_COLOR_FORMAT_AUTO)
> +		res |= BIT(HDMI_COLORSPACE_RGB);
> +	if (fmt & DRM_COLOR_FORMAT_RGB444)
> +		res |= BIT(HDMI_COLORSPACE_RGB);
> +	if (fmt & DRM_COLOR_FORMAT_YCBCR444)
> +		res |= BIT(HDMI_COLORSPACE_YUV444);
> +	if (fmt & DRM_COLOR_FORMAT_YCBCR422)
> +		res |= BIT(HDMI_COLORSPACE_YUV422);
> +	if (fmt & DRM_COLOR_FORMAT_YCBCR420)
> +		res |= BIT(HDMI_COLORSPACE_YUV420);
> +
> +	return res;
> +}
> +
>  static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
>  				    void *data)
>  {
> @@ -521,6 +543,8 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
>  	plat_data.phy_data = hdmi;
>  	plat_data.max_bpc = 10;
>  
> +	plat_data.supported_formats = drm_to_hdmi_fmts(supported_colorformats);

Any reason why this cannot be simply set as

  BIT(HDMI_COLORSPACE_RGB) | BIT(HDMI_COLORSPACE_YUV444) | BIT(HDMI_COLORSPACE_YUV422)

and get rid of the unnecessary conversion?

> +
>  	encoder = &hdmi->encoder.encoder;
>  	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
>  
> 

