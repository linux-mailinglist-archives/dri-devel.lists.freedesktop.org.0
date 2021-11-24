Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8383845CA6A
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 17:52:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B7B6E321;
	Wed, 24 Nov 2021 16:52:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882586E270
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 16:51:59 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id u3so8932384lfl.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 08:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SxpT0NltrIzzR1Gn9E4hcFAfBzYhQiD+NgncBW5q7Kc=;
 b=mI5oApmWGex/imckCGWVSEmyd75rAfp7utD8RM/u6lijs2E2bLA2V6gFRBU77DVcne
 ifZQ6LvXKvt6UrBDCx5GDpLICiuDEcAl8wkk5kKfHLzvmsJtttB/lmOP12t17eyAuIfa
 WK6Dfcq+vHj4JSjtNyurCRY0O9P2mcRut7rZkhUNGApEa6+Qc7bJ8VVz/mBI9zpE+1qh
 ebADOyI3xAFqT6+y81GXvQnj/Y/rI/YEGMijWx3E9/mZ8FyVzc3FyApDR+t3IjHsXuCp
 U1eCLhNQWMkwgXJY/bokq84cdZjE6m4w/KkqwUFB1bgtPclDuMr3bDgnzAyZN2/Jkx+J
 lP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SxpT0NltrIzzR1Gn9E4hcFAfBzYhQiD+NgncBW5q7Kc=;
 b=oxgrieu5CYYKJ+3H5lWZeOHHUE2NXJWlu1gbWBk0cAobxDCaVJJZSb8L+rVzCaTD1d
 VtVsVWDAagOPyRkZMcZ5rWuBbaH4pRVdVf4r1BWAYZAKnrWaTOVDlIlKpS/hR7n44e5o
 4WRgYoRhZIqAY6IM0J3sKPO+TJdNSO+CUnVKAUHx/VbKvTa1W8q70vPhdU+0duYi22Z/
 bREJcb5QEI4WdlxyTLf0PILZ5CaU9ejnNpj/PkfH+TmTQpuGKqVC0/MSN7KHTgSxraxf
 Y7lQS9CHH/1MEXpb2hnVxRQcfYHo7c4yAkDKnkNCbNA3dO40f+6uxLU4bA4MnBffSjnZ
 cvpw==
X-Gm-Message-State: AOAM5333dncu14z1nBf78XaXvjZrKFb/pfSvgJAsEoLAphLlm9owd3Ko
 HKcmpe6dk0ZkBl2uUfCMvbJFcg==
X-Google-Smtp-Source: ABdhPJwHHd2b51vkL1ni+njs9obrWdIBL3HhU72Ow3NDYj5qyCvn5JW9wrg24gwf6jwKVFe1tCAchA==
X-Received: by 2002:a19:ee01:: with SMTP id g1mr17044094lfb.44.1637772717815; 
 Wed, 24 Nov 2021 08:51:57 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id i24sm39685ljm.135.2021.11.24.08.51.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 08:51:57 -0800 (PST)
Subject: Re: [PATCH v3 13/13] drm/msm/dsi: Pass DSC params to drm_panel
To: Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
References: <20211116062256.2417186-1-vkoul@kernel.org>
 <20211116062256.2417186-14-vkoul@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <056650fc-b2aa-49b7-cf8d-f479c2fe5825@linaro.org>
Date: Wed, 24 Nov 2021 19:51:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211116062256.2417186-14-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Jonathan Marek <jonathan@marek.ca>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/11/2021 09:22, Vinod Koul wrote:
> When DSC is enabled, we need to pass the DSC parameters to panel driver
> as well, so add a dsc parameter in panel and set it when DSC is enabled

Nit: I think patch description is a bit inaccurate, since we pass DSC 
parameters from panel to DSI host rather than other way around.

> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 16 +++++++++++++++-
>   include/drm/drm_panel.h            |  7 +++++++
>   2 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 2c14c36f0b3d..3d5773fcf496 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -2159,11 +2159,25 @@ int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
>   	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>   	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
>   	struct msm_drm_private *priv;
> +	struct drm_panel *panel;
>   	int ret;
>   
>   	msm_host->dev = dev;
> +	panel = msm_dsi_host_get_panel(&msm_host->base);
>   	priv = dev->dev_private;
> -	priv->dsc = msm_host->dsc;
> +
> +	if (panel && panel->dsc) {
> +		struct msm_display_dsc_config *dsc = priv->dsc;
> +
> +		if (!dsc) {
> +			dsc = kzalloc(sizeof(*dsc), GFP_KERNEL);
> +			if (!dsc)
> +				return -ENOMEM;
> +			dsc->drm = panel->dsc;
> +			priv->dsc = dsc;
> +			msm_host->dsc = dsc;
> +		}
> +	}
>   
>   	ret = cfg_hnd->ops->tx_buf_alloc(msm_host, SZ_4K);
>   	if (ret) {
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index 4602f833eb51..eb8ae9bf32ed 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -171,6 +171,13 @@ struct drm_panel {
>   	 * Panel entry in registry.
>   	 */
>   	struct list_head list;
> +
> +	/**
> +	 * @dsc:
> +	 *
> +	 * Panel DSC pps payload to be sent
> +	 */
> +	struct drm_dsc_config *dsc;
>   };
>   
>   void drm_panel_init(struct drm_panel *panel, struct device *dev,
> 


-- 
With best wishes
Dmitry
