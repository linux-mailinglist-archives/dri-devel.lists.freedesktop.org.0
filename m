Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6055045CE10
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 21:33:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311156E2D7;
	Wed, 24 Nov 2021 20:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E0E86E0D0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 20:33:35 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id l7so8000104lja.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 12:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sT2ApcG9AQxoESBvPgec5gNhDuTFLopwHxgm37++phI=;
 b=Ns7MLbs7+WyewOZwg3Ezzj/vma7SFuQpk5ELc+KUUW9s833R20wu6hc66uS2qFXss9
 cpKsq1iQ2Lh/k9RE1a2txSD0XJkyfrMaPTF5+nEfhlWiGT9Gw/D4VSGeVtcFZJmAMj1o
 KGCz/ur86ZNNQmA9RYaKIf9zWnzhto2//I6DuPixZwRCXzG7rEQzGu12Vvi3E+497AHt
 /3HoFln0orR+fgP/F1FFvgNBNzvjfRIh1JEV80/XhNrJPUbcaxZ8CGobuVf3XVpO26d3
 DIzlTLtsLQHqFYyyyCvWbKoRAWIR1NdCEImjMUmdPUlLX/pLFybCgyR/CjWKM+1xhyC0
 QLkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sT2ApcG9AQxoESBvPgec5gNhDuTFLopwHxgm37++phI=;
 b=or/QCLxtT+Ov0yS5yxaUiffCeBPJewKeqKSVmI74ZIKa1hfXPrOhWhC0sZU0uDsDjV
 1yfzJOsn5u0KfWgLSEsaE7v95r3hUG8dJ33VF34wroA1bFapGpH2OfCTc476ZtvY9tPg
 X/u1QO0LQ3ed+gzLaoPcTlmpLJZ6O4E8GXUAxoBCHtMLFYSoq/NE6Ichdi195LK1k+VG
 y/An/P745ICQGO0FkDKXHwi8G4XPrZrbTEZxA0XuzYWNoI8c62KG6hB/t4ETev6bkUjN
 zHm1gMyVidgHGq2+WQU1SF1xmYMxmOlmWUx1q0w8YAgOy3El+3vv+AdBMOnzEBkC23eN
 J3sg==
X-Gm-Message-State: AOAM5304AqJwyf6eZC2SacNT3sTpvuh6uC3LGMyd5CKVJ7dRWf81xApI
 19fBTKx0Yhm5zkMrvj8ctYDcsg==
X-Google-Smtp-Source: ABdhPJyaWfST1iBUwxTtckh2LYTYg0pVPA9P0rQgbTKLoz+Ahm/X1Xfm3OLS3NZKBq7e7hTgtpjB0A==
X-Received: by 2002:a2e:9bd4:: with SMTP id w20mr19388784ljj.69.1637786013365; 
 Wed, 24 Nov 2021 12:33:33 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c21sm80949lfv.29.2021.11.24.12.33.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 12:33:32 -0800 (PST)
Subject: Re: [PATCH v3 11/13] drm/msm/dsi: add mode valid callback for dsi_mgr
To: Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
References: <20211116062256.2417186-1-vkoul@kernel.org>
 <20211116062256.2417186-12-vkoul@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <08b4ee1f-6232-7d5d-9b84-2aa9a1396e48@linaro.org>
Date: Wed, 24 Nov 2021 23:33:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211116062256.2417186-12-vkoul@kernel.org>
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
> Add a mode valid callback for dsi_mgr for checking mode being valid in
> case of DSC. For DSC the height and width needs to be multiple of slice,
> so we check that here
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/dsi/dsi.h         |  2 ++
>   drivers/gpu/drm/msm/dsi/dsi_host.c    | 26 ++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 12 ++++++++++++
>   3 files changed, 40 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
> index 569c8ff062ba..e7affab2fc1e 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -115,6 +115,8 @@ int msm_dsi_host_power_on(struct mipi_dsi_host *host,
>   int msm_dsi_host_power_off(struct mipi_dsi_host *host);
>   int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
>   				  const struct drm_display_mode *mode);
> +enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
> +					    const struct drm_display_mode *mode);
>   struct drm_panel *msm_dsi_host_get_panel(struct mipi_dsi_host *host);
>   unsigned long msm_dsi_host_get_mode_flags(struct mipi_dsi_host *host);
>   struct drm_bridge *msm_dsi_host_get_bridge(struct mipi_dsi_host *host);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 30c1e299aa52..31d385d8d834 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -2588,6 +2588,32 @@ int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
>   	return 0;
>   }
>   
> +enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
> +					    const struct drm_display_mode *mode)
> +{
> +	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> +	struct msm_display_dsc_config *dsc = msm_host->dsc;
> +	int pic_width = mode->hdisplay;
> +	int pic_height = mode->vdisplay;
> +
> +	if (!msm_host->dsc)
> +		return MODE_OK;
> +
> +	if (pic_width % dsc->drm->slice_width) {
> +		pr_err("DSI: pic_width %d has to be multiple of slice %d\n",
> +		       pic_width, dsc->drm->slice_width);
> +		return MODE_H_ILLEGAL;
> +	}
> +
> +	if (pic_height % dsc->drm->slice_height) {
> +		pr_err("DSI: pic_height %d has to be multiple of slice %d\n",
> +		       pic_height, dsc->drm->slice_height);
> +		return MODE_V_ILLEGAL;
> +	}
> +
> +	return MODE_OK;
> +}
> +
>   struct drm_panel *msm_dsi_host_get_panel(struct mipi_dsi_host *host)
>   {
>   	return of_drm_find_panel(to_msm_dsi_host(host)->device_node);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index 20c4d650fd80..0ad8a53aaa0e 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -579,6 +579,17 @@ static void dsi_mgr_bridge_mode_set(struct drm_bridge *bridge,
>   		msm_dsi_host_set_display_mode(other_dsi->host, adjusted_mode);
>   }
>   
> +static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
> +						      const struct drm_display_info *info,
> +						      const struct drm_display_mode *mode)
> +{
> +	int id = dsi_mgr_bridge_get_id(bridge);
> +	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
> +	struct mipi_dsi_host *host = msm_dsi->host;
> +
> +	return msm_dsi_host_check_dsc(host, mode);
> +}
> +
>   static const struct drm_connector_funcs dsi_mgr_connector_funcs = {
>   	.detect = dsi_mgr_connector_detect,
>   	.fill_modes = drm_helper_probe_single_connector_modes,
> @@ -600,6 +611,7 @@ static const struct drm_bridge_funcs dsi_mgr_bridge_funcs = {
>   	.disable = dsi_mgr_bridge_disable,
>   	.post_disable = dsi_mgr_bridge_post_disable,
>   	.mode_set = dsi_mgr_bridge_mode_set,
> +	.mode_valid = dsi_mgr_bridge_mode_valid,
>   };
>   
>   /* initialize connector when we're connected to a drm_panel */
> 


-- 
With best wishes
Dmitry
