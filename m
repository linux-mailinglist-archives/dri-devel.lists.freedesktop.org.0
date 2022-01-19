Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 205B34943C1
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 00:16:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C9910E297;
	Wed, 19 Jan 2022 23:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C86DE10E294
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 23:16:25 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id b14so14528164lff.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 15:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=t+UvExnMGr7obKnDTWnSkdCN+ME4NSBCGXqXzSw5iSo=;
 b=MqmYEnYdyhMJQDO68f9G4rEyyQ+cVfJ5LtIxWphKLXzEy8AoymRWzSkqsFzbObiG/9
 B6SZD4nbnx8gAGPPA1N689vo/7nMCzNxyUMzHRU4jJFpehDt40vNspf1/xLFyI3Zzgxr
 Fi1V1lpKR10/s2Cj4VlJx5zGTPjW3izAjWbesprmkZX2GuvZIahc9Vx2FQ5OO+PZPn8X
 qmamUxWjfw6sWPgJ0eoYIh70eLo2ztGuEbMTX4+oEpssIFAO6wB8f0TlUyyxtE+UQ0oI
 TS5hPneXt9SBcKOXTgwji36xleJGUNU1Q9IythpsWeGAehy79ed9M1ipdZY9LYVCe9AI
 ZgVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=t+UvExnMGr7obKnDTWnSkdCN+ME4NSBCGXqXzSw5iSo=;
 b=AZWKtyVt7xzNCz1bT1jqVDYM2yjmjlE5stKvDooFgEROBgrkRVaCKVXQEDV8iBzw49
 vXupXZ2SREldwWaSp7sza/iN83J/YJSAMvTIxoQIEn9pkg4DcwPl9BbOe5EmeZWK1Fmn
 rYMXnlCpHBrt2LmwJ6+OC/Rq+eVu0nkqD0XgRTelbAzVE2wJNgeCKyAHsIyLmGRVT7g0
 QZ7ZLNfK7XrijorfUXetHO4iHgvyObWkjQQy8DQyXFLp1SBn/qoQArylRj4OBqtAZtEj
 lRDA6gztSob/RZ2ZohKx3Bpc+v7bSaS+inuORv5h/cRJXfLfv535GNj46FeLqD5DFtET
 NTxA==
X-Gm-Message-State: AOAM5324eUePBQ1OWOY16qgf3lyrqTUkV+3uEnYmxsqg71flWCJGGeQk
 VbON9zVG4QhrYnfxiWAzJfzn0A==
X-Google-Smtp-Source: ABdhPJyyVg2TL1sPJO+eUBnw0lNT7DDk9o3klte92k8k0CTTv7NNqC70fAiw84rmP9ZoBDPTQR9mkA==
X-Received: by 2002:a2e:a5c9:: with SMTP id n9mr28015844ljp.220.1642634184142; 
 Wed, 19 Jan 2022 15:16:24 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id be28sm97280ljb.37.2022.01.19.15.16.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 15:16:23 -0800 (PST)
Message-ID: <5db5b998-9563-be71-e87f-d906bf8b438b@linaro.org>
Date: Thu, 20 Jan 2022 02:16:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/msm/dsi: Fix missing put_device() call in dsi_get_phy
Content-Language: en-GB
To: Miaoqian Lin <linmq006@gmail.com>
References: <20211230070943.18116-1-linmq006@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20211230070943.18116-1-linmq006@gmail.com>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Hai Li <hali@codeaurora.org>, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/12/2021 10:09, Miaoqian Lin wrote:
> If of_find_device_by_node() succeeds, dsi_get_phy() doesn't
> a corresponding put_device(). Thus add put_device() to fix the exception
> handling.
> 
> Fixes: ec31abf ("drm/msm/dsi: Separate PHY to another platform device")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/dsi/dsi.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> index 75ae3008b68f..35be526e907a 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -40,7 +40,12 @@ static int dsi_get_phy(struct msm_dsi *msm_dsi)
>   
>   	of_node_put(phy_node);
>   
> -	if (!phy_pdev || !msm_dsi->phy) {
> +	if (!phy_pdev) {
> +		DRM_DEV_ERROR(&pdev->dev, "%s: phy driver is not ready\n", __func__);
> +		return -EPROBE_DEFER;
> +	}
> +	if (!msm_dsi->phy) {
> +		put_device(&phy_pdev->dev);
>   		DRM_DEV_ERROR(&pdev->dev, "%s: phy driver is not ready\n", __func__);
>   		return -EPROBE_DEFER;
>   	}


-- 
With best wishes
Dmitry
