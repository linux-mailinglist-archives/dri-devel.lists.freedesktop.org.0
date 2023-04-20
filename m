Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 562DE6E86BB
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 02:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862F510E691;
	Thu, 20 Apr 2023 00:46:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A6510E691
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 00:46:03 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4ec8eca56cfso235328e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 17:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681951561; x=1684543561;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E5UTDS8/MS3VS6xHJciTdouskvxQrmpDUWCPfu+muRA=;
 b=RkEh/zVgE9stt/xRUg3A9i8zUpmT5lbttbj/10PoJ4C1ZlN9N92e8hwbRxBw59tBg2
 7AAfFXsQVQ/E3M2gZmI6pmy504+SddSZazkZEJYMqyCMMjlyWIteJf4/waONQ+YggSOO
 YhcFMqq7Tdb/p6Y/44vOc6JfCjxQw/x8eVUkbIh81bpNF5F0gVa/JP50Mcka90h+tc2q
 uxIqy45+53SOjgRYJ9cjV0iPpo2zYo3/nZngdIImonOJ8PzJ4/2/b+RwAF1v/DRTYX1J
 7LwfIhS9tc9wR1QMHVUL6Yg48YQ+ohIply8giG1DSzqHKZse25u3L7hVjNeI6/vvy+V5
 BOVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681951561; x=1684543561;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E5UTDS8/MS3VS6xHJciTdouskvxQrmpDUWCPfu+muRA=;
 b=JvmAR/c0PRx+pCb9MxyKcKxcjL/WOBGVs/Wo3N2ljqdmYH8dFazbORD5Z5ihWpRyeO
 e7sDoavGWgu52mj6hN7rUWMdGKiQnsqJa49BB+Rezk8J0pgZDy1VYGyjY+hsKaIO1IPZ
 MNNQXXWsiPUd/ng6rg00MT7ckSXcnT8JAIQY5W13slE3zR/N71oFKBi7/MezcnAWNqc1
 py4lBoXOPIWdYSzBXZAB7+qggt8ZqQ5A2v9Ohss//qAN+7i47iDecaF4m1TrZcAiC0zl
 I8O0LINiHon2uDLfcYWiyebVdrHxfnQpuEsLgSpmIYfemGVATIyEIULA0XEGEnkI6glq
 cltg==
X-Gm-Message-State: AAQBX9eAa3cvGtf6Aj68v1eaS/lEe9dcxDiKQqra2RHBJSFp/U5W8Gqx
 vqc+OHxhuwZ31vd7ivBrvo2lhw==
X-Google-Smtp-Source: AKy350YawJTuM7ApeAn2yoXOaxbV6j25doSog73B8n5yooEfDjrMuVNLb4Ul6zgxH8SsKYb4PRQM/w==
X-Received: by 2002:a05:6512:374b:b0:4eb:2d45:f67f with SMTP id
 a11-20020a056512374b00b004eb2d45f67fmr4707310lfs.33.1681951561547; 
 Wed, 19 Apr 2023 17:46:01 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 n24-20020a195518000000b004db513b017esm57432lfe.45.2023.04.19.17.46.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 17:46:01 -0700 (PDT)
Message-ID: <20d415d7-ff04-a4d2-b9f3-5d9f95fb3fd4@linaro.org>
Date: Thu, 20 Apr 2023 03:46:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 04/17] drm/msm/dpu: Fix PP_BLK_DIPHER -> DITHER typo
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
 <20230411-dpu-intf-te-v2-4-ef76c877eb97@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v2-4-ef76c877eb97@somainline.org>
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
> SM8550 only comes with a DITHER subblock inside the PINGPONG block,
> hence the name and a block length of zero.  However, the PP_BLK macro
> name was typo'd to DIPHER rather than DITHER.
> 
> Fixes: efcd0107727c ("drm/msm/dpu: add support for SM8550")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 16 ++++++++--------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c         |  2 +-
>   2 files changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

