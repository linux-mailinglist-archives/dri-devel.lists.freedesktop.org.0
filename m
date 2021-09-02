Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 688D33FF70F
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 00:21:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 240B26E825;
	Thu,  2 Sep 2021 22:21:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E8136E825
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 22:21:28 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id g14so6370539ljk.5
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Sep 2021 15:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9rEOZFgWRRBzTrjc1sgzKvt3j7Y9HuVgaQyFS26IehY=;
 b=JkCeMuzLEtYTo2ErGSbOtDhauLuY9ISqLH+XlnzYhixy4flLEenALZSqTCJngMEvWd
 QZayWzxlTwOU2L5LrVgPEIXWOgK77MMdMXD3MWH0OcI84M6esyxVHewe7YDYjbgkSpA9
 Rpc5ceCzCvAg96LA0DjEzr5fnknjaDRUMtSGw+/crwuAA1HP4OracNWUHJZUhIv8tyyE
 +NphV+3aMOxP1tGBlbN4zxiFETCFHfQ0bfwdz+LDvxsX3YlSg/8wrcWi+cLStgaSKA2z
 IhbFNlkBtXqv7Qfs+xu2bahai8Rb1ZJQi71jUQeIfZOBxcvkr7qv5UfM9DkwnBAig6Wn
 QCJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9rEOZFgWRRBzTrjc1sgzKvt3j7Y9HuVgaQyFS26IehY=;
 b=swbEy/2JzzLI4DN1g4Uz5rJ7J47vFuziF6cbSI6pnrivApiiDPYdPAI4WTT6WqDsiJ
 X4lue95Sc5jhLpe8vzlkudPHiuLXx276fUaH26a7taIXUEbxSl7+2hEg/Ip+QFdBgFfG
 BWq15pooe3PBOvBBFgqOVBWGGW5JLWV5AQL+HCmzpYWpjnW+YC7tbrA8RzA+1UhDdUnd
 h3+EGk+Y4n9kAyu538BHo3Bux8ZCv554zMH92vY4H9T+RG9IX+eiXKEfzkSkHZujwZqe
 m2XVmkHrgX1cLBB4KrZOTXMj3czkotBXmuJf88h6CYTeoCocuptVhRK8yetfhNIGtPok
 bNgw==
X-Gm-Message-State: AOAM531048AYMoAmIXD+nbVOCLQnldJ8EQy6DFE/Rdy6LMdyCMprnoMk
 l1gu99b9IzBJiOjG6RowPsSVjg==
X-Google-Smtp-Source: ABdhPJzgLfjJhFjZHFLjaekUj1FBfy+HD/gqft1OE03PQCNBoCsxY7dcNgpn5zLJxI+SNz6o0uI1vQ==
X-Received: by 2002:a2e:8107:: with SMTP id d7mr447828ljg.68.1630621286200;
 Thu, 02 Sep 2021 15:21:26 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id x1sm371700ljh.113.2021.09.02.15.21.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 15:21:25 -0700 (PDT)
Subject: Re: [PATCH 1/3] drm/msm/dpu1: Add DMA2, DMA3 clock control to enum
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 robdclark@gmail.com
Cc: sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 abhinavk@codeaurora.org, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
 marijn.suijten@somainline.org, martin.botka@somainline.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 paul.bouchara@somainline.org, devicetree@vger.kernel.org
References: <20210901181138.1052653-1-angelogioacchino.delregno@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <c4a86a25-0996-9849-365c-cc36cbc04f8a@linaro.org>
Date: Fri, 3 Sep 2021 01:21:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210901181138.1052653-1-angelogioacchino.delregno@somainline.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/09/2021 21:11, AngeloGioacchino Del Regno wrote:
> The enum dpu_clk_ctrl_type misses DPU_CLK_CTRL_DMA{2,3} even though
> this driver does actually handle both, if present: add the two in
> preparation for adding support for SoCs having them.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index d2a945a27cfa..059e1402b7d0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -432,6 +432,8 @@ enum dpu_clk_ctrl_type {
>   	DPU_CLK_CTRL_RGB3,
>   	DPU_CLK_CTRL_DMA0,
>   	DPU_CLK_CTRL_DMA1,
> +	DPU_CLK_CTRL_DMA2,
> +	DPU_CLK_CTRL_DMA3,
>   	DPU_CLK_CTRL_CURSOR0,
>   	DPU_CLK_CTRL_CURSOR1,
>   	DPU_CLK_CTRL_INLINE_ROT0_SSPP,
> 


-- 
With best wishes
Dmitry
