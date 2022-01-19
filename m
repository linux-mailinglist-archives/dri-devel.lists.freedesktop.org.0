Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E0E4943C5
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 00:16:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F148B10E2BA;
	Wed, 19 Jan 2022 23:16:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383BD10E294
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 23:16:38 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id s30so14467572lfo.7
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 15:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4frs59YJlPKUn4ECIxS4w+UO9vELx/wX9L+HYGD0PPU=;
 b=kaXFa7BU8V7n0wYiOXe2T9/reNlqGfjeXzP039cx3hxNLazSCKozFUK9BE5fyMQ0dl
 OSja1kfX+A4kjBk1KKJhJkDqece5eBg9fzndnGgXTGdGJPIL8F/lu2H/pH4XC/lfSnIh
 PWcxSW0D8IIWERHvwEbmTW3FoO4urZnQs1qrAYYcCdcSInl8yvO/gfAwZVYuC2BAlG7V
 +JaARezbrGsrTjGa8g5WDQSMCcHlo6d72+tL2ehABfolCUR5VA4elB4lPo+uB+heu1YO
 AaDLVjX2PkJqjiJpRDHOtO7eUzEB8FByqX1eO9vcE1LtU2K+mMZggpq3qzc0CQm5F1g3
 RKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4frs59YJlPKUn4ECIxS4w+UO9vELx/wX9L+HYGD0PPU=;
 b=hKV/d2j23p3fkF1HDy4Zs6rBBosVTFvudE0RawWovhXONvTmkgQVNVdrHQIMtba6LC
 aQDY+ZmSlFZ1BNQ/tlxJq1uBrDXnf/P3ICDiQnXlNYY+qcPUoz+trHLrIgjvczUGYPwl
 PP1dU6W/gJgOwfT0Kp2hfdocNxIA8X9rnf77YcQdPOY7T9LtS2wEtOD6yBZflCpNjcor
 Vd8eGmBOI0jMe1JOAeOBAB+IRYrsb371fV8aTESTVUGNN15JS2oBM+zjq0e6FlEzmP4F
 nFpm01tzQYl8VYnF0PqXvW3ACAqJdefnwgHD+6sT6UU2aKDFC5cS8IGKZfEeulPxy7e1
 yCDA==
X-Gm-Message-State: AOAM531MqATetuajBEjXwX5NaRkXu4pTS1Ay3GMB1r4lNyPfRwb2/Vyw
 5oNrX2GiKJfDfYH4HCisYQ0eHQ==
X-Google-Smtp-Source: ABdhPJzBN1gta2RG1WiG9bwGJXAws9yfXg5qJWQC6wtU3f13U+qPjvj0TL8vz4P8MaEzRyRe6yD7gQ==
X-Received: by 2002:ac2:4e0b:: with SMTP id e11mr16126235lfr.296.1642634196566; 
 Wed, 19 Jan 2022 15:16:36 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u15sm106159lfo.194.2022.01.19.15.16.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 15:16:35 -0800 (PST)
Message-ID: <8042df9c-5dba-a857-e62f-3ea66c2cd218@linaro.org>
Date: Thu, 20 Jan 2022 02:16:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/msm/hdmi: Fix missing put_device() call in
 msm_hdmi_get_phy
Content-Language: en-GB
To: Miaoqian Lin <linmq006@gmail.com>
References: <20220107085026.23831-1-linmq006@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220107085026.23831-1-linmq006@gmail.com>
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
Cc: freedreno@lists.freedesktop.org, Archit Taneja <architt@codeaurora.org>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/01/2022 11:50, Miaoqian Lin wrote:
> The reference taken by 'of_find_device_by_node()' must be released when
> not needed anymore.
> Add the corresponding 'put_device()' in the error handling path.
> 
> Fixes: e00012b256d4 ("drm/msm/hdmi: Make HDMI core get its PHY")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/hdmi/hdmi.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index 75b64e6ae035..a439794a32e8 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -95,10 +95,15 @@ static int msm_hdmi_get_phy(struct hdmi *hdmi)
>   
>   	of_node_put(phy_node);
>   
> -	if (!phy_pdev || !hdmi->phy) {
> +	if (!phy_pdev) {
>   		DRM_DEV_ERROR(&pdev->dev, "phy driver is not ready\n");
>   		return -EPROBE_DEFER;
>   	}
> +	if (!hdmi->phy) {
> +		DRM_DEV_ERROR(&pdev->dev, "phy driver is not ready\n");
> +		put_device(&phy_pdev->dev);
> +		return -EPROBE_DEFER;
> +	}
>   
>   	hdmi->phy_dev = get_device(&phy_pdev->dev);
>   


-- 
With best wishes
Dmitry
