Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 166A86D069C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 15:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 303DA10EE1D;
	Thu, 30 Mar 2023 13:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9821410EE1D
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 13:26:58 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id br6so24472104lfb.11
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 06:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680182817;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S3TWXdzpSnGOM40T9XOpuvX+5naiiIUyXSAIJsPyKJ0=;
 b=DwMmHfz053UKTc8MUJ6Awy9An9UGAQjuj1MbpFu7R/Buuo/8G490Jy8TGjAQEbp0iK
 3mg5iq+LZKZHyi8ZzfZLfUX+zEnNzGyOFE9h5vQURvLR64dGFxW+1xsmeuEWbTUk5xtu
 Man/zMn8NpgvDf1QzL5yuWVKRQrKeLGy++/b9Pd9kCZ3wJ8DKrsEo0Pz2XC+lyuJagUT
 Ab0i1AzqFHGEAzX4Q8kuG29kO1m2Q1FQKle5OaunPA+UAA/mNzJ7X4MQ9wwChaQhWdF0
 6sarK2/3eb4+z449e29a9ZUxqa0l2qtQwqFQxS52Ks2e/9fILeRTJe7RidCxts7kPPb5
 ZjcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680182817;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S3TWXdzpSnGOM40T9XOpuvX+5naiiIUyXSAIJsPyKJ0=;
 b=oFZY+nLzOnLMwm4GxzDpx6tLJSIRgm2V2XNRLaz0QHRTB4GvFuIupFKKPcDos+m/9M
 PXSjybpSGsFhgGeNeRdBgxhrdY5yRSIuf9syVKAfieLvZigflEvBOcQsL/kntcyRyYOI
 jP0doqj5X2+WRHgL8T3reXgyYWFYsEAH0RfDyJ8akaOwDDRUu2CgHV+yM67vnxx7EaVD
 j2d7dTv3Y42tZL0sBeOqFidWV1XjAZKF9uIPyvMZjgFg2HnEbAuq/NHvCKd/lFOf0nYo
 HEeyHFA2HZCXpgi9AaQVgd3qlfDPfAULszdLls4Wj1rr4QCBN/cEkpGJMUSokhcwRZ7M
 hZGQ==
X-Gm-Message-State: AAQBX9dkdadf6q5VExG48KlA4UIHyhjBiW1qeCMQfL4p/pwRnecBXAq3
 INAzbdsL6jqH1i8rYx/r0pdzCQ==
X-Google-Smtp-Source: AKy350b6oLNktszZUGsV6t3dNBDbVvq8Jv73lwCM55h0UOeX0Zy/C9raFLWh6dODP5PcC4EI2en9jg==
X-Received: by 2002:ac2:442a:0:b0:4ea:e68c:91bc with SMTP id
 w10-20020ac2442a000000b004eae68c91bcmr7337868lfl.18.1680182816729; 
 Thu, 30 Mar 2023 06:26:56 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 d21-20020ac25455000000b004eb19a51896sm1048337lfn.83.2023.03.30.06.26.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 06:26:56 -0700 (PDT)
Message-ID: <8f5b19b3-fea7-1386-ec30-f27aba0f9901@linaro.org>
Date: Thu, 30 Mar 2023 15:26:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2, 50/50] drm/msm/dpu: rename MERGE_3D_foo_MASK to contain major
 DPU version
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-51-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230211231259.1308718-51-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12.02.2023 00:12, Dmitry Baryshkov wrote:
> To ease review and reuse rename MERGE_3D feature masks to contain base
> DPU version since which this mask is used.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index b8143a3c35b0..6f907992866b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -70,7 +70,7 @@
>  #define CTL_DPU_9_MASK \
>  	(CTL_DPU_7_MASK | BIT(DPU_CTL_HAS_LAYER_EXT4))
>  
> -#define MERGE_3D_SM8150_MASK (0)
> +#define MERGE_3D_DPU_5_MASK (0)
>  
>  #define DSPP_MSM8998_MASK BIT(DPU_DSPP_PCC) | BIT(DPU_DSPP_GC)
>  
> @@ -507,7 +507,7 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
>  	{\
>  	.name = _name, .id = _id, \
>  	.base = _base, .len = 0x100, \
> -	.features = MERGE_3D_SM8150_MASK, \
> +	.features = MERGE_3D_DPU_5_MASK, \
>  	.sblk = NULL \
>  	}
>  
> 
