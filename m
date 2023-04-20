Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DACE6E9351
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 13:48:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 409E710E20B;
	Thu, 20 Apr 2023 11:48:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9698E10E20B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 11:48:09 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4edc114c716so501888e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 04:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681991287; x=1684583287;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bbzxcashoCDQOSY342pzyq2G7WMo2lq5fOYuUvS4juM=;
 b=j/jHkLE3rW45/Eb7oViVdeEuTCbgLb3dJ1DaMd4dkcG01aQyARQoL9vKLJR2MAqee7
 9/3JlhAnHnLuU5TPyvUqpriI5zwG5X73t7jJvMB6ItPvtgLqClrqmHcWiDU3Fgr68EOt
 Pz/XwjHx8Mrv4E8ouFFU0BffiAqbKJ59MdCI/Vr+RxyP+dGsBQ7JrUIZCBn2n97qQZH2
 TX7GTJ3swuBByfoww/DVAh3x+0SUqiWdBhIXQx+Vko5CGEVs8GQYU1Iu3Y9gLauHr4me
 MjKBtTJdHvDteIYw7vS1pTGCbALFrcQPRW84yAevZ+wNzQ4N+9FCDincpXVOfcjvOMwY
 BgTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681991287; x=1684583287;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bbzxcashoCDQOSY342pzyq2G7WMo2lq5fOYuUvS4juM=;
 b=iySBy7w1m90f5IpVdHLkNjEW6y6cR/VXd8uCEH25ANfHCT4wMurcTslLSg0SSqathM
 ycRdTzrnDtmsY6/blepXjTxJggaUHg1YWQJCj1HbMNPBrplaJt+u7O/86pqJggPqCCwo
 STJ0MkVA/WDenKCELQsq+joTEt/FGlmBWhm4lfJRyorpgTfyt7/xgsXan0N2/ZzSbBD6
 7KcD46ZjL7uHiSwLJ4joRAvv610wcnpIPy3E3O3ekkUi9G64JnQ10/eJhlIisodqBw/z
 kff3lTqepJViTzE9GhNz59gXlnQz1aQQrAbDG66iOOhbbT1xMo9ngye6JzKla+72D8/J
 1/BQ==
X-Gm-Message-State: AAQBX9c/IjGCrgq+DrszlyZLFishXy+W7eXVZDqhI97CXkzE/o1G9QLT
 q5SBRbwRSyIl4u9O4+9mpFsLtg==
X-Google-Smtp-Source: AKy350bDBd5I0jzSrTgkcplYpxYdInqlBZJb94gB+M0ExOUSpGan2r6Fowa9JWmLRx3tG5jrkzMKMg==
X-Received: by 2002:a19:f80b:0:b0:4eb:2523:e929 with SMTP id
 a11-20020a19f80b000000b004eb2523e929mr375118lff.43.1681991287486; 
 Thu, 20 Apr 2023 04:48:07 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 y21-20020ac24215000000b004ece331c830sm192447lfh.206.2023.04.20.04.48.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 04:48:07 -0700 (PDT)
Message-ID: <a2addd26-e027-c5f5-ee40-e8e5be9d866c@linaro.org>
Date: Thu, 20 Apr 2023 14:48:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] drm/msm/dpu1: Rename sm8150_dspp_blk to
 sdm845_dspp_blk
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230420-topic-dpu_gc-v1-0-d9d1a5e40917@linaro.org>
 <20230420-topic-dpu_gc-v1-1-d9d1a5e40917@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230420-topic-dpu_gc-v1-1-d9d1a5e40917@linaro.org>
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
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/04/2023 04:14, Konrad Dybcio wrote:
> SDM845 was the first SoC to include both PCC v4 and GC v1.8.
> We don't currently support any other blocks but the common config
> for these two can be reused for a large amount of SoCs.
> 
> Rename it to indicate the origin of that combo.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 2 +-
>   9 files changed, 27 insertions(+), 27 deletions(-)

For the patch itself:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

