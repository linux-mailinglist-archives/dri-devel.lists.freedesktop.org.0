Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E376C0F83
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 11:44:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E6610E326;
	Mon, 20 Mar 2023 10:43:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D57B710E326
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 10:43:54 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id p16so7142706wmq.5
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 03:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679309033;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=cpovqAD+8TpVtFMnyoL4JisxUGVryrFReZuxy2PqaME=;
 b=xRHJSJ5/Zw7Xu4SNZARW3d9maNaE2C5+vNuqqTBWvi4rgKOBACAJl20JH89axVqYwQ
 TLziOV/vunS9dsi9X3qzSaN1/KZlc+Zv0QFRoSFB/DI4lwJk/+MFEBd8TpNhssscoxTA
 3JG589zmUKYKcUgSt+UbvHjt+Qd9UWlpgrXVeCSOWuMIFycWCrTP0wSVLke7fgKeOkRE
 BlG2vijAKpO0uuYL0sU4U0nXNH3g1sI9Q+BSvPFByFY8NQxQ+/xDNBJfxGN1+/LYw4L1
 nEHStH0nrEQ1Lxh2VsYhb09lwrDwaC0v2TqMKDaHdxS0dkAZAOj733tL9HpZrrxdatTA
 JMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679309033;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cpovqAD+8TpVtFMnyoL4JisxUGVryrFReZuxy2PqaME=;
 b=ea3j6h+m/tBGRXsJVF7ZQX5jyX8iTa9AcY0O0zcLhZrNRHQyFuGs9/2Ty7oOhJaEmA
 rOJ5u/LxMs0IvRWzKP15pntGQxS/UT5YR8h2G1yS6HUgPdHIXfhDj8Yw9V65V8B4UUbF
 /Wg2BkYbzO8xP4ZckU0M+ee2UnsKHu4JgkvtMdP8mBNGdV27FVxbUTqAOTXvMR/u8YVg
 ZxHzEAysoFcpev1lixnt5RGMNDue+T9lPxLGs8940FeKu37Ad/RAkSflmvLDVXBjgNWo
 d1yw40dRuZzecf5uDjLgZMrfCmraHhgH2cZfdvnWaM/8ELtMkHXe7qmK+2rVkUMjD3j4
 2b7Q==
X-Gm-Message-State: AO0yUKUZuYEUyz0WAle+AZI4MOiTlUQ4sK3oJOYINtGQmw1XPb4mELsD
 KtKp0NsINF3TpSBXwzVBaf0MQwu7rEc3AIZ/IJSFMQ==
X-Google-Smtp-Source: AK7set+KgAqimOf7QtJlmloTkty2fvIWumLlyaoQLs6yC7xmeHqBG1brzNXme6Tkc5AbxHW5OUVK5g==
X-Received: by 2002:a05:600c:4fcb:b0:3eb:2e32:72c3 with SMTP id
 o11-20020a05600c4fcb00b003eb2e3272c3mr33542049wmq.22.1679309033321; 
 Mon, 20 Mar 2023 03:43:53 -0700 (PDT)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a05600c468900b003ed5909aab2sm12802826wmo.25.2023.03.20.03.43.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 03:43:52 -0700 (PDT)
Message-ID: <0f183988-f100-c4ff-056e-a737767a772d@linaro.org>
Date: Mon, 20 Mar 2023 11:43:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/bridge: nwl-dsi: implement MIPI_DSI_MODE_NO_EOT_PACKET
Content-Language: en-US
To: Kevin Groeneveld <kgroeneveld@lenbrook.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230318223357.3899-1-kgroeneveld@lenbrook.com>
Organization: Linaro Developer Services
In-Reply-To: <20230318223357.3899-1-kgroeneveld@lenbrook.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 18/03/2023 23:33, Kevin Groeneveld wrote:
> Previously EOT packets were only being enabled when
> MIPI_DSI_CLOCK_NON_CONTINUOUS was set in the dsi_mode_flags. However this
> really should be based on MIPI_DSI_MODE_NO_EOT_PACKET instead.
> 
> Some displays require EOT packets and a continuous clock which was an
> impossible combination to achieve with the current driver.
> 
> Signed-off-by: Kevin Groeneveld <kgroeneveld@lenbrook.com>


Thanks for the patch, can you provide a Fixes tag ?

Neil

> ---
>   drivers/gpu/drm/bridge/nwl-dsi.c | 13 +++++--------
>   1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
> index 6dc2a4e191d7..bb8404ffd3f5 100644
> --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> @@ -211,7 +211,7 @@ static u32 us2lp(u32 lp_clk_rate, unsigned long us)
>   
>   static int nwl_dsi_config_host(struct nwl_dsi *dsi)
>   {
> -	u32 cycles;
> +	u32 val, cycles;
>   	struct phy_configure_opts_mipi_dphy *cfg = &dsi->phy_cfg.mipi_dphy;
>   
>   	if (dsi->lanes < 1 || dsi->lanes > 4)
> @@ -220,13 +220,8 @@ static int nwl_dsi_config_host(struct nwl_dsi *dsi)
>   	DRM_DEV_DEBUG_DRIVER(dsi->dev, "DSI Lanes %d\n", dsi->lanes);
>   	nwl_dsi_write(dsi, NWL_DSI_CFG_NUM_LANES, dsi->lanes - 1);
>   
> -	if (dsi->dsi_mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) {
> -		nwl_dsi_write(dsi, NWL_DSI_CFG_NONCONTINUOUS_CLK, 0x01);
> -		nwl_dsi_write(dsi, NWL_DSI_CFG_AUTOINSERT_EOTP, 0x01);
> -	} else {
> -		nwl_dsi_write(dsi, NWL_DSI_CFG_NONCONTINUOUS_CLK, 0x00);
> -		nwl_dsi_write(dsi, NWL_DSI_CFG_AUTOINSERT_EOTP, 0x00);
> -	}
> +	val = (dsi->dsi_mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) ? 0x01 : 0x00;
> +	nwl_dsi_write(dsi, NWL_DSI_CFG_NONCONTINUOUS_CLK, val);
>   
>   	/* values in byte clock cycles */
>   	cycles = ui2bc(cfg->clk_pre);
> @@ -241,6 +236,8 @@ static int nwl_dsi_config_host(struct nwl_dsi *dsi)
>   	DRM_DEV_DEBUG_DRIVER(dsi->dev, "cfg_tx_gap: 0x%x\n", cycles);
>   	nwl_dsi_write(dsi, NWL_DSI_CFG_TX_GAP, cycles);
>   
> +	val = (dsi->dsi_mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET) ? 0x00 : 0x01;
> +	nwl_dsi_write(dsi, NWL_DSI_CFG_AUTOINSERT_EOTP, val);
>   	nwl_dsi_write(dsi, NWL_DSI_CFG_EXTRA_CMDS_AFTER_EOTP, 0x01);
>   	nwl_dsi_write(dsi, NWL_DSI_CFG_HTX_TO_COUNT, 0x00);
>   	nwl_dsi_write(dsi, NWL_DSI_CFG_LRX_H_TO_COUNT, 0x00);

