Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E60474AE65D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 02:50:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D04B110E2C3;
	Wed,  9 Feb 2022 01:49:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093A610E1AF
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 01:49:57 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id u7so1392511lji.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 17:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ccvf/lE8CFEFcKmjCKKQmAS5+2lkQ1u4zosOVr9I0b8=;
 b=zj+L+nlzpZ/ar3DgWQcRAu1Rsinfnq86FOdf+22duu+UtJlmeoz1bqatFORy/8J8sb
 ZPwtLThHJJ4r93aH+8geX09s5A0oub9yckPa4N8Q/NfuL/G7L2J57on8ecZSd+Ac3IDq
 9BvpXTADNk6RXsn0H60y+c9D7EdYKFj4HOKy3fQNFUooCuF8kMDCpLnQM9dM5Qets9S0
 4Mv7DpTOnbQi/XBT9HSq1JZaTzDBC+qJ6t5ioNng3TyWl06vjCqvh8PFKh1Xj1pJwMMg
 R8LLNUvm6+h/ZOAvxR/Akc1hBVWl63wFS8LKPNr9pkM973buxB7xwOHP7Oy1djXfL5Qs
 AVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ccvf/lE8CFEFcKmjCKKQmAS5+2lkQ1u4zosOVr9I0b8=;
 b=jdugIi6N/nYMn8/NXupYTTlUUlK0BGm693W9blv4lcwy4XWhayL5oaqTAxzOGjpgLV
 KvCm07zbL7XjY95H6tSVry3FdqoDYRP6BTauJ2/q/pSrz4cS3g4GdHiX58P/zQ6zTpKj
 jj3zwEIOXhjDx0udpWrQPDf1lpverIgwaMAsZRKccHvogONC9XVDNXxg+HHKwIQr+zb5
 E51KXGOCTRyg8/tP4W/kXKN7etQhIy6NirNF/oSTCHDWpkTK3pLAYQWijYy/RHwZBjdT
 Y9dhXJSQAGQWxIo1HgM1xL7QSI63Ni+IcV9W+fXgeNJlEAnwNThBXMyVB79cAymR6ww/
 N3QQ==
X-Gm-Message-State: AOAM5311pIqDDh5o4M7/83I5eopaIsr5y5oDZXmyhORY++hXKQsFGwSb
 9/U3nYCd7GpFkJcIJXTySFqiqA==
X-Google-Smtp-Source: ABdhPJwZM2W4CYOeo7xJdXSzCmCWqxb2jc1HMIyxXf4e2nGnJWVmM/oUsl91KCHs4+mIOJYfbYmm3Q==
X-Received: by 2002:a05:651c:2108:: with SMTP id a8mr84082ljq.22.1644371395192; 
 Tue, 08 Feb 2022 17:49:55 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id w22sm2265955ljh.44.2022.02.08.17.49.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 17:49:54 -0800 (PST)
Message-ID: <8d710de8-f340-f15a-30c0-3358536bb4f5@linaro.org>
Date: Wed, 9 Feb 2022 04:49:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 1/3] drm/msm/dpu1: Add DMA2, DMA3 clock control to enum
Content-Language: en-GB
To: Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org
References: <20220113145111.29984-1-jami.kettunen@somainline.org>
 <20220113145111.29984-2-jami.kettunen@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220113145111.29984-2-jami.kettunen@somainline.org>
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/01/2022 17:51, Jami Kettunen wrote:
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> 
> The enum dpu_clk_ctrl_type misses DPU_CLK_CTRL_DMA{2,3} even though
> this driver does actually handle both, if present: add the two in
> preparation for adding support for SoCs having them.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Signed-off-by: Jami Kettunen <jami.kettunen@somainline.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 31af04afda7d..736f52c742fb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -435,6 +435,8 @@ enum dpu_clk_ctrl_type {
>   	DPU_CLK_CTRL_RGB3,
>   	DPU_CLK_CTRL_DMA0,
>   	DPU_CLK_CTRL_DMA1,
> +	DPU_CLK_CTRL_DMA2,
> +	DPU_CLK_CTRL_DMA3,
>   	DPU_CLK_CTRL_CURSOR0,
>   	DPU_CLK_CTRL_CURSOR1,
>   	DPU_CLK_CTRL_INLINE_ROT0_SSPP,


-- 
With best wishes
Dmitry
