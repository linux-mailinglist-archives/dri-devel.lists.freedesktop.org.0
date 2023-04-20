Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D82306E8746
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 03:14:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DEB110E22F;
	Thu, 20 Apr 2023 01:14:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F53210E22F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 01:14:37 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id bz21so971671ljb.11
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 18:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681953275; x=1684545275;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Bs3T4CoT9dcZGpM4NSaYLbZwM4ao6CkSlWOs854SEP0=;
 b=jvziNZEKWKFcemyK4qjPHfbBwlZp5vj2rQqNeL6rkXzcvr/wW3qsNVZ1+jrMtDGv6G
 TNmcpWu6v2MR4aHHiakWDo9fVyJSR5zKuaDOjmhhB6M9D8JklnYoO1MU1XazxKlA8Uz/
 cZi32nzJJX2EUMQu2gMjkYr0T2NVG2t7gsJbVUl9G6jnxpPPS6iMkewVcYjr5tlgdl7N
 9rorAKtaszGsOV4s0X7hvZI7sGkrGZGfQ1Sj+65gmY6stvxpuMaUxd2K8ZYxJv3KBFVU
 NCQDtX8tKtH3kUCwp5/b6o4LxcvigSyuDPLBtm4hszdEu/LXkivSs6Fj7kt5QdPNQoYK
 DnIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681953275; x=1684545275;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bs3T4CoT9dcZGpM4NSaYLbZwM4ao6CkSlWOs854SEP0=;
 b=Z7+U7ql+jPMsZB8npoIGhD+o9N8J9FYamugBr9hwu5OFVu0GIUuBGKhq6Zq8iKmAgn
 ZaA7lrO1C+VMssrAwwFjGah9OXXVEzoeIZh5gKDkJ00ccVq2189V606WhfMlFpoI6Xv3
 h+mRK2lQIEWwd+F2e5U9+rQ2zuae8VCBVlIkP/TQlwN0HLg3n9WYuccfeVrx6HreMVNu
 GLgBToDOADEuRCRO0PoaBA22EVjWsJmP9Q4UK+hRv8Q5SS+idyNRCd8VmA4VFYiyESEP
 7Hb/E6GTkPk1CXfwag8fEJpEPleYEB3w5iQggaogAbS8mj6HU1VVQMu7zyXgkyQ9Xep5
 dQ0A==
X-Gm-Message-State: AAQBX9eKA9BLB2Vn+5LcLPUHa8cVVpPC9FWh8avD0MKXgXgRk6UAFwSU
 8rBjAmiihsQo1ebCUi1vVGCIcg==
X-Google-Smtp-Source: AKy350bBIAueDX7yZiBWXI0I+IiG4Q+5dFV0CHAv3I6r6BoS3JFZzMzJcF2idvVkrCZSsQdYBq6yWA==
X-Received: by 2002:a2e:9159:0:b0:2a8:d146:12cd with SMTP id
 q25-20020a2e9159000000b002a8d14612cdmr2726556ljg.17.1681953275668; 
 Wed, 19 Apr 2023 18:14:35 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 g24-20020a2e9cd8000000b002a8bce7ce0dsm27182ljj.107.2023.04.19.18.14.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 18:14:35 -0700 (PDT)
Message-ID: <c31bc489-6f5d-d5c7-2b8d-328a20a17b81@linaro.org>
Date: Thu, 20 Apr 2023 04:14:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 16/17] drm/msm/dpu: Implement tearcheck support on INTF
 block
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Adam Skladowski <a39.skl@gmail.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Rajesh Yadav <ryadav@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
References: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
 <20230411-dpu-intf-te-v2-16-ef76c877eb97@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v2-16-ef76c877eb97@somainline.org>
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
Cc: Archit Taneja <architt@codeaurora.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 freedreno@lists.freedesktop.org,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/04/2023 23:21, Marijn Suijten wrote:
> Since DPU 5.0.0 the TEARCHECK registers and interrupts moved out of the
> PINGPONG block and into the INTF.  Implement the necessary callbacks in
> the INTF block, and use these callbacks together with the INTF_TEAR
> interrupts.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  11 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  10 +-
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   | 160 +++++++++------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        | 214 +++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  25 +++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   2 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |  14 ++
>   7 files changed, 378 insertions(+), 58 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

