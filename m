Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D696D38DB
	for <lists+dri-devel@lfdr.de>; Sun,  2 Apr 2023 17:44:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2656910E0E0;
	Sun,  2 Apr 2023 15:44:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52C2810E0E0
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Apr 2023 15:44:01 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id o20so24960148ljp.3
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Apr 2023 08:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680450239;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8jXhcT5ZVw1OvQ2qjM62gp4jmz1Chro5Ew3RaPugUX0=;
 b=vmjyzEB8Q2LRKXisvJ5vw0iEDdeP1zteah9BoGMk2wu89tKXwsIJ5SLD1Num8XYLlY
 nyvXxB+3DJM63pM1Mb+cEu/uLvI5pGoYB+Al1LGnC7N7FfqnMGl7kTOOCS27UgSGpd0y
 kJg60dEhsOKK2gAkWM/S+LcOm5sEQxGb1kLcp7fBYLZbBWcIfssbZKnTC4jrRVzMKYQ9
 1Ywjb1KOKzDJyQEw0q0viRqNJWdqR6o4phLElQ9aN1hBakNScRj0ES1Xk5z8AxOJJt0M
 +LShuRN+U8SAXvGightjg12Jl+m9vSxV+wvjlUrnQYL4arer17yYGraL/lStU4YT5jUM
 ouwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680450239;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8jXhcT5ZVw1OvQ2qjM62gp4jmz1Chro5Ew3RaPugUX0=;
 b=HGNEpZh3SxjQ89rYnZOI4K3Qy/q9gE7g4+l+yur2nM0F8sOntPKE0uRZiTN3Ko2RGG
 7RH3PbQahnKzaNdQThTMh+PciNvjoTD/USzZvW6MF9t3przIqoyWKkzvSL1mRYIdr36W
 iZ9R+DezAtMHYIYuAqwYaDPLLfx1Y2wl9UMDYFPvNJ4oXyGQSBDYJwotSUwUccf4DSnt
 u2Nfztjg1O/xdafjdetzAfpuwB9lhYU6UCGPO7c4ah7xteM6IYBAWWs+veDwmvagPGxK
 f6cRlfHmjAG9zQzlkenvK+Sd0ZpVoXkU2wJ9ZRXS+suFN8br2MgsJc+IXOGgMjgf9Htw
 KGRg==
X-Gm-Message-State: AAQBX9c/dKICif1Km+r8sO5GWSS+4lpDKAY4wSCg7194oaUTgdo3ME7p
 ODMueJZ5d6C9hoPG5HgOdPMKZA==
X-Google-Smtp-Source: AKy350Y5aEPWgsceuXkfIdTFwafBhWN+FGbs5H/6SNUrjipWa9ZUTqU9oADjjxRPo9rQbefvS5Srwg==
X-Received: by 2002:a2e:9bc7:0:b0:293:4c17:9998 with SMTP id
 w7-20020a2e9bc7000000b002934c179998mr9990534ljj.11.1680450239095; 
 Sun, 02 Apr 2023 08:43:59 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a2e8750000000b002935632b3f8sm1300173ljj.14.2023.04.02.08.43.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Apr 2023 08:43:58 -0700 (PDT)
Message-ID: <51451dc1-14d5-595b-589e-1cbcb5468180@linaro.org>
Date: Sun, 2 Apr 2023 18:43:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v6 01/15] drm/msm/adreno: adreno_gpu: Don't set OPP
 scaling clock w/ GMU
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>
References: <20230223-topic-gmuwrapper-v6-0-2034115bb60c@linaro.org>
 <20230223-topic-gmuwrapper-v6-1-2034115bb60c@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v6-1-2034115bb60c@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/04/2023 14:54, Konrad Dybcio wrote:
> Recently I contributed the switch to OPP API for all Adreno generations.
> I did however also skip over the fact that GPUs with a GMU don't specify
> a core clock of any kind in the GPU node. While that didn't break
> anything, it did introduce unwanted spam in the dmesg:
> 
> adreno 5000000.gpu: error -ENOENT: _opp_set_clknames: Couldn't find clock with name: core_clk
> 
> Guard the entire logic so that it's not used with GMU-equipped GPUs.
> 
> Fixes: 9f251f934012 ("drm/msm/adreno: Use OPP for every GPU generation")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 24 ++++++++++++++----------
>   1 file changed, 14 insertions(+), 10 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

