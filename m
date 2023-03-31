Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED886D1B4D
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:06:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ACD910E062;
	Fri, 31 Mar 2023 09:06:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F4310E062
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 09:06:47 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id l12so21653926wrm.10
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 02:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680253606;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=n/qHDI2XATx2TdwwrGZWbe9ANXTDDjSuUckU4tumIIg=;
 b=hnrhqzRTrMQRhfBU8NZ73fIzzb4Zmbq3p6PCkrRBm9CxE2RxUcwt/22PASFM3iqAti
 oysh2iwzb70hD4b47BnDnOruFckF73k40iXKH3WeNHDuQ7ELCstnZr8ngccej7rNNklR
 lSaFYeMj+PyVdZGPWwbSslcySKbwlKsyX2tC+/+o2H1iVfn4ZEbgaIblJrEDVhNlGDXr
 +uK7jN1FxkgDP5KzhDCsaYtYNy7RWBNgo3FFPr2IsKhZgFCrUIjj7WJwsTJKmpzI0gwU
 3jrtEi1bzimgCSatXmRFGDfXFHukhR8czFIDhXqCUICwYrMlNyJ9ckEjMNyN9CnwU9xb
 hjZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680253606;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n/qHDI2XATx2TdwwrGZWbe9ANXTDDjSuUckU4tumIIg=;
 b=jGmRVN3mKNiVdXvv5T7x6WYsQPFFNYZL8JU3okAcmPPNa9T6l4L/I8ZQrUu/VYinb2
 kDvTrRXIOvijV6DmS1J6klqwzBADQrdRXqvwdvsQAaaKCkvbH/kizDe1UQMRYM5ki7kR
 22glsMqGT8n61+8YhJ7QsMh57u+BilwMnDpAE3Xz0LY0PxX/ULL9ZiqQitUkdVA07Ya+
 dUb05hYe/eSVcxoYtqohs2JZQ7l0ahspNP416Q3wA8rgP4Vr3QhuxHWGEd2NgGciB46k
 1Q489dkEjAbzPQ0oexAbPfaMgs3Sj7HwidrO9QzYTnmEMErjuXchY8Wl3qKzZyLGguBy
 X+5Q==
X-Gm-Message-State: AAQBX9cnyVWaAXYqQeibpHGuShheislaYPCNTqpKTFE5WcHCum8A10U2
 qXzfUVoVx3wiCfuKgwp92J9+UQ==
X-Google-Smtp-Source: AKy350aTrYnc9UuG9bJ66DZ/1QaY7OCh8DB9/Nw+qIDm2v5EajtM9gla/uJHB27+0JWtb6ZpZdpKbQ==
X-Received: by 2002:a05:6000:ca:b0:2d6:5afe:7b91 with SMTP id
 q10-20020a05600000ca00b002d65afe7b91mr6225734wrx.30.1680253606228; 
 Fri, 31 Mar 2023 02:06:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:74cb:1a96:c994:e7e0?
 ([2a01:e0a:982:cbb0:74cb:1a96:c994:e7e0])
 by smtp.gmail.com with ESMTPSA id
 f9-20020adff989000000b002c71dd1109fsm1662892wrr.47.2023.03.31.02.06.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 02:06:45 -0700 (PDT)
Message-ID: <6a386ff3-2af6-a544-674f-7c60d4d89e4e@linaro.org>
Date: Fri, 31 Mar 2023 11:06:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 2/2] drm/bridge: ti-sn65dsi83: Add DSI video mode
 configuration
Content-Language: en-US
To: Francesco Dolcini <francesco@dolcini.it>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, Marek Vasut <marex@denx.de>
References: <20230330101752.429804-1-francesco@dolcini.it>
 <20230330101752.429804-3-francesco@dolcini.it>
Organization: Linaro Developer Services
In-Reply-To: <20230330101752.429804-3-francesco@dolcini.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: neil.armstrong@linaro.org
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 30/03/2023 12:17, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Enable configuration of the DSI video mode instead of hard-coding
> MIPI_DSI_MODE_VIDEO_BURST. The bridge support any of burst-mode,
> non-burst with sync event or non-burst with sync pulse
> 
> With this change is possible to use the bridge with host DSI
> that do not support burst mode.
> 
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>   drivers/gpu/drm/bridge/ti-sn65dsi83.c | 24 +++++++++++++++++++++++-
>   1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> index 91ecfbe45bf9..144d0de0d278 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -145,6 +145,7 @@ struct sn65dsi83 {
>   	struct drm_bridge		*panel_bridge;
>   	struct gpio_desc		*enable_gpio;
>   	struct regulator		*vcc;
> +	u32				dsi_video_mode;
>   	bool				lvds_dual_link;
>   	bool				lvds_dual_link_even_odd_swap;
>   };
> @@ -603,6 +604,9 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
>   		return dev_err_probe(dev, PTR_ERR(ctx->vcc),
>   				     "Failed to get supply 'vcc'\n");
>   
> +	ctx->dsi_video_mode = 0;
> +	of_property_read_u32(dev->of_node, "dsi-video-mode", &ctx->dsi_video_mode);
> +
>   	return 0;
>   }
>   
> @@ -642,7 +646,25 @@ static int sn65dsi83_host_attach(struct sn65dsi83 *ctx)
>   
>   	dsi->lanes = dsi_lanes;
>   	dsi->format = MIPI_DSI_FMT_RGB888;
> -	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO;
> +
> +	switch (ctx->dsi_video_mode) {
> +	case 0:
> +		/* burst mode */
> +		dsi->mode_flags |= MIPI_DSI_MODE_VIDEO_BURST;
> +		break;
> +	case 1:
> +		/* non-burst mode with sync event */
> +		break;
> +	case 2:
> +		/* non-burst mode with sync pulse */
> +		dsi->mode_flags |= MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
> +		break;
> +	default:
> +		dev_warn(dev, "invalid video mode %d\n", ctx->dsi_video_mode);
> +		break;
> +	}
> +
>   
>   	ret = devm_mipi_dsi_attach(dev, dsi);
>   	if (ret < 0) {

As I understand from DSI spec is that those are dynamic, so they are hardcoded in driver now
but they shouldn't be hardcoded in DT.

The problem is larger and we should add some sort of "supported features" we can get
from the DSI controller and set the flags accordingly because the features support accross the
DSI controllers isn't linear.

Neil

