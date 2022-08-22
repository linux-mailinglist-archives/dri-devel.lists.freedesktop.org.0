Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FD05A0282
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 22:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526F2C5CB3;
	Wed, 24 Aug 2022 20:12:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85686A1DEA
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 20:27:13 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id s6so5626198lfo.11
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 13:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=loYNWu7FRv2ThLC9ofsf4DwxdBiFsBUPefz91dNaNro=;
 b=BG/imemOmfpqBeOzL5CFYMAkxTPOeLgLdS7RJtZBRG6bIpbeog6aJj401flbO6GPgv
 DUUQs0HooT6mBtST4Z35dH3KEVTNOyz+2xxfcfcsL3J44Yv0hfWQKft6sR478G5+KkDQ
 EZdPWieOK1TzlgDiPB/V0ih4+3/NZ2IXcZMDhte9XckL1+XgijaV+UlEh6PSloX3uePI
 ctJzme61A5KE0mth7+KY17OGTocV/y1jTDSPt9vw/eNbayk6211LiNbClIYhB92rTXTh
 Bx4tY2wznshcIjbs1clZMBZMEMhxR6DW2y8nryErc0jtfjI0tHdIeWQ/TzOBwNj7Jl/D
 POcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=loYNWu7FRv2ThLC9ofsf4DwxdBiFsBUPefz91dNaNro=;
 b=QkvhIyA6B8lam/LFz2f5A2WBzkAv2apRFoZnhTnz7fsr+tM3EvVV3EwJH3ijWN5G1T
 4+ig3brpSwk/YLsQ/ngwkQeyBH8Q96HSOOsmlgQlLKSYQrhxd/3AWsFinPxWTz+qpQCp
 2kjB5eRxE6/Syl4+3ply0rckWXILfZtwSl2mAGe1/253Yv4FmDfPVY48YXTCFZsZ5e2+
 tg4RaPJ0gy+DFjQrQw1/cVDaFETpQ5IYUVEx+aVepBwBDIPdgFGW6/sDb6nwvEA+X6J9
 1p1PtGUxedZQ+BGIhLVNx9t2C7pbj9qxKS36UPtEicpFfD1Hj8yBZAzLDryG++1L/NaT
 xQPg==
X-Gm-Message-State: ACgBeo3FXEq7da7ezO8mMU0ObXXw5FcejuVC8APNzZJxWasR5PbcEYkT
 Zc1nG0vVn0gu+KtkO+Tg68fk1g==
X-Google-Smtp-Source: AA6agR4SmBR2z0Jp+Wr4jWA1Ua44vfUbLuyVcmjgNhY1h8LKQdoiYvY1uOEb0+pyAs0UXkL4y5xvdg==
X-Received: by 2002:a05:6512:2985:b0:492:d9dc:b3e3 with SMTP id
 du5-20020a056512298500b00492d9dcb3e3mr3821940lfb.426.1661200031863; 
 Mon, 22 Aug 2022 13:27:11 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 v16-20020ac258f0000000b00492dfcc0e58sm875694lfo.53.2022.08.22.13.27.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Aug 2022 13:27:11 -0700 (PDT)
Message-ID: <eb7ab2ea-de23-0ed4-466c-d422b48af276@linaro.org>
Date: Mon, 22 Aug 2022 23:27:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] drm/msm/dpu: Fix comment typo
Content-Language: en-GB
To: Jason Wang <wangborong@cdjrlc.com>, quic_abhinavk@quicinc.com
References: <20220724204242.4107-1-wangborong@cdjrlc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220724204242.4107-1-wangborong@cdjrlc.com>
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
Cc: quic_kalyant@quicinc.com, freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 quic_vpolimer@quicinc.com, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/07/2022 23:42, Jason Wang wrote:
> The double `be' is duplicated in the comment, remove one.
> 
> Signed-off-by: Jason Wang <wangborong@cdjrlc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 71fe4c505f5b..38aa38ab1568 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -76,7 +76,7 @@ enum {
>   
>   /**
>    * MDP TOP BLOCK features
> - * @DPU_MDP_PANIC_PER_PIPE Panic configuration needs to be be done per pipe
> + * @DPU_MDP_PANIC_PER_PIPE Panic configuration needs to be done per pipe
>    * @DPU_MDP_10BIT_SUPPORT, Chipset supports 10 bit pixel formats
>    * @DPU_MDP_BWC,           MDSS HW supports Bandwidth compression.
>    * @DPU_MDP_UBWC_1_0,      This chipsets supports Universal Bandwidth

-- 
With best wishes
Dmitry

