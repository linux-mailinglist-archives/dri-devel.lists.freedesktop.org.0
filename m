Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5356E871C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 03:02:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A41810E775;
	Thu, 20 Apr 2023 01:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B491E10E768
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 01:02:26 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2a8bae45579so1869321fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 18:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681952545; x=1684544545;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C/pp3QfQeJUIHW14OLCMS+G47iSMCdzs69sqXB50dBE=;
 b=iCkx6lKpkptF0tJxFEGz67oS9HSEhz+/2wAIH8spWiizogxSlrbbglrLaDwFdeppEE
 Qszm7jwg8wE095O2ygabypqgZk1TxvzcX3USJcsSFzMN60q/CbBxsAvdt4oq1xptM5L1
 +ivDXC+ibFD8qtKbFhx6PRSRzVXnGaG7Ncd/UeGNJzxQXXqcr01flB4S6vV8piyMTF4c
 vqFGKhsBg2YMYfU00f1aZJRluYdSfuxA5Fvd7B2RmP/WUqVfMGjbB0cS0FfGXDNaUxLb
 aMWiwBAnFIp27qJEZCFin7AL3CTdgv6lO2Cmk4IrBtFg803c4u62NHeICLaAB7SeDJUP
 Azsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681952545; x=1684544545;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C/pp3QfQeJUIHW14OLCMS+G47iSMCdzs69sqXB50dBE=;
 b=GfVkxn9ZoEH6MP7Vpj1sSrKTDIqL0FeE11ll3pr43rY7dwr8FGgQdxDqkpLWB5S3AN
 QXYEVMcs3YnXM28Qgt1cbr4vODq8Kso8wKYOrD1kfY/i3B5KhNn+gz09BCSR6kjMLw5p
 6//9q2lgnvxE/tmkmmLCOkAIx2rPrVd4trjDo0kn1MNOdQnm2UohU8feqUvzvTo+uzxm
 oTR6q5VQ9q5cimYsPeSn8TzIkQ3VEzlOxkNtLZL6t8bxxiG6PMVfGaJuwnVBfqmmf2PV
 1uCwbFLfdUayzNtJyLWeaoL4Iz/NvZwvlqllFuN8xSYMNXQX5IOJfDqZN9RVxWZEQTyd
 Qp4g==
X-Gm-Message-State: AAQBX9cy0BHFEqHCM9TRJupcTRt99xEfYeBgDEMIRwc9d1C/AC/ZZAHv
 v3VMypQabv9TF0T2G297NLi5ag==
X-Google-Smtp-Source: AKy350ZYzpsVgsfgazxjIepxhv3Z+KBUrsjU+GSMcYyj6usIfkNv1djyVvl51ydZukfsBjH1x65Jzw==
X-Received: by 2002:ac2:4141:0:b0:4dd:a445:e69d with SMTP id
 c1-20020ac24141000000b004dda445e69dmr5004420lfi.26.1681952544851; 
 Wed, 19 Apr 2023 18:02:24 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 x17-20020ac259d1000000b004e846175329sm54417lfn.202.2023.04.19.18.02.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 18:02:24 -0700 (PDT)
Message-ID: <0be743fb-51e0-1570-63b3-6ebcf9a6e768@linaro.org>
Date: Thu, 20 Apr 2023 04:02:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 13/17] drm/msm/dpu: Factor out shared interrupt
 register in INTF_BLK macro
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
 <20230411-dpu-intf-te-v2-13-ef76c877eb97@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v2-13-ef76c877eb97@somainline.org>
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
> As the INTF block is going to attain more interrupts that don't share
> the same MDP_SSPP_TOP0_INTR register, factor out the _reg argument for
> the caller to construct the right interrupt index (register and bit
> index) to not make the interrupt bit arguments depend on one of multiple
> interrupt register indices.  This brings us more in line with how PP_BLK
> specifies its interrupts and allows for better wrapping in the arrays.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    | 16 +++++++---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h | 16 +++++++---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 16 +++++++---
>   .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    | 24 +++++++++++----
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 16 +++++++---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  8 +++--
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |  6 ++--
>   .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |  6 ++--
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h | 16 +++++++---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 12 ++++++--
>   .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 36 ++++++++++++++++------
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 16 +++++++---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 16 +++++++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  6 ++--
>   14 files changed, 155 insertions(+), 55 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

