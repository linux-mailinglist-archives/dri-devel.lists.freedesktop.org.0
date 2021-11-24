Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE82945CA09
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 17:29:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDAEA6E912;
	Wed, 24 Nov 2021 16:29:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B392B6E8B6
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 16:29:02 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id k2so6670469lji.4
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 08:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WkqjCv1H8iCs2LbCoEle2c1z/X1KWtHu9nXiw6O/b5g=;
 b=JVn20yPHefHNLdS0sfAnScX2Ily94HhVnZxOpx8gaShsFA7wkk91mbK9KF3Y95oYJs
 6tPQwjbL0Q98iJMOwy+UdVPVzf0cFgNRWFj2Li31Yhpx+tKbGRN3AtiauSi1BsbnTp6W
 U+gvH6jpKOln5770wzOk9lXHuLhqiKMWI+rH+TRrLkzur/AbMi37KqKKyly9dA0AHtqH
 Xm9F5hjyO3hFVn+0ZFkSU7ezDtAz96+B3vzZAis4DFvRwTBnWNAeMGvQ1nLE3+GnVYdK
 WiOHtpRu1xZHVLwWOgAZVRacokcfWBRnYXcKD4XfZthW0Rk3zRfUfXzYfWgZ9eNxiZG1
 3FrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WkqjCv1H8iCs2LbCoEle2c1z/X1KWtHu9nXiw6O/b5g=;
 b=Qr8mBQxiMJzqcfTuaTf50h7ydmyl9F6mzpzx56hTj+csinyDrP/YfZFVe+iI0xYaTp
 ySTZpywf7Ng3UUpIi94h1W+8jGbn0G5M8F6C+HqiaV04wyPAiqn8bJhUph+18rKQLRL5
 +OgrlnP+rrYSUFHDlyOnplCitJqB/X0LoUeyCZxHWdrlg0gn+RB4ZlGZThfVoDkrD/Im
 9MV4t8W0TIF9jn7lFAGcLrWWRGS5GnKgpV6rKMIBlFN1GoGJb08DomFANGVAadqQA01i
 SSJf8Rym7V0PsFRNM0VIgDOeEy6Dyt1YwarM28tEdWaUfRfq65xyQ8bnihxKOSN0bt9B
 14Wg==
X-Gm-Message-State: AOAM530fZxSaZ/BKr44Ht2E0CFWTiM07ee3ca6EwpjstHvE3R1Qgtq82
 VzX28rQW/y/lvFwASW+2cFV0gA==
X-Google-Smtp-Source: ABdhPJwjNWwJmQJA0UgfY6sjpYYHU3TREPGrYNesnTdKOPO3gk/rQGVuGDCUHdC4Ft8pR1Jugie9ww==
X-Received: by 2002:a2e:8099:: with SMTP id i25mr17868323ljg.528.1637771341068; 
 Wed, 24 Nov 2021 08:29:01 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id p3sm24901lfg.273.2021.11.24.08.29.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 08:29:00 -0800 (PST)
Subject: Re: [PATCH v3 13/13] drm/msm/dsi: Pass DSC params to drm_panel
To: Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
References: <20211116062256.2417186-1-vkoul@kernel.org>
 <20211116062256.2417186-14-vkoul@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <1fecc2d3-28fa-57ee-db60-95713a84787a@linaro.org>
Date: Wed, 24 Nov 2021 19:28:59 +0300
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

devm_kzalloc()?

Or even simpler: embed msm_display_dsc_config into struct msm_dsi_host 
and use it only if dsc->drm is set (IOW the panel provided DSC data)?

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
