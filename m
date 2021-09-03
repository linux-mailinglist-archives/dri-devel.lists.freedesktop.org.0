Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFED4004D2
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 20:24:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E086E8BD;
	Fri,  3 Sep 2021 18:24:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E8436E8BC
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 18:24:06 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id j12so171321ljg.10
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Sep 2021 11:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9rEOZFgWRRBzTrjc1sgzKvt3j7Y9HuVgaQyFS26IehY=;
 b=qkHognoxURfD5dM1rhFf+ejqDj4AodnjjnIF1fbS7miJaIFBv2d/cjNFUxR8VJyJwW
 lnzREYn5RxDERjhpg7YuKd9sehvjNbCoUvLo4jQhVDbY7p6ErcqHr8ECQ7M3xzi+D76A
 LVuweIsCoAAdrnOsmRcRcWUWvZT6p2QZBVfUqKqKzEhZ6mnet9eMgu3x/BXf8LMk4fu0
 wtJiRevjC5awf8fEkww+Jn96XQ1ssiYUYr8GSieEJMC4ejhv4XVPi05LNfX1/Lq1hjjI
 aaRMmxpebkxUEWopvuZKq5LY/W/UtOYlhpg19nkeuAcTNTH9RQiLsvaJ4oPY3PDWvLNb
 W+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9rEOZFgWRRBzTrjc1sgzKvt3j7Y9HuVgaQyFS26IehY=;
 b=rugcnjhYJtGeR6Nt5eAguJmAvRBldPqLE5dSzMYpzezmyhSwXNGsQSxEet6B0e85zk
 qDNB4/6g2B6Uvw+Sw4h5hlNFmozXz17sJwXr+q9tdKbfjtZhv4VvXNTJGteoADJ7GtHM
 rBKeaB1NrAgluemh4/Uk8bkyzFJwTaTz/bJ/7EnJxLFGN+kPi2SCUICs7S1vZHF8bTZa
 0MIuDOMz2/RyFPaXc5geX4HBfIz76AiasOyVvkMsj0D9hQ1K+wPulh0dDLkQBhF87EPI
 dSkPOtq3tWuyqv1mpXfmsEOSMcy9Xt5oldoW5h7Rn1rjYT+T/afw+VIP3hJA2Mk5DloD
 rbRA==
X-Gm-Message-State: AOAM530sXxsw/m/6F3rETaXCrodttYpTtUmsnS3v5nMj1YlzvKrB3TxV
 Nrf9Qy30gd34EKjlhcl9YOLuYw==
X-Google-Smtp-Source: ABdhPJz6vIY3BKpngT9hBro3h/w+4cLaEvhEKm7lFcDxED6un/1W/8r+MNrcUUM3Mi0WXbnil6rxGw==
X-Received: by 2002:a2e:94d0:: with SMTP id r16mr235236ljh.403.1630693444412; 
 Fri, 03 Sep 2021 11:24:04 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id w18sm17659lfa.50.2021.09.03.11.24.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 11:24:04 -0700 (PDT)
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
Message-ID: <2efd8a35-10af-473c-b6d4-81a757949c40@linaro.org>
Date: Fri, 3 Sep 2021 21:24:03 +0300
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
