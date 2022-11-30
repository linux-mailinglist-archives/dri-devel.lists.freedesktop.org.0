Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A77E363D8D2
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 16:08:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0930C10E47B;
	Wed, 30 Nov 2022 15:08:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF9210E479
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 15:07:58 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id j4so27443901lfk.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 07:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cJqrClHiZPXq+FVkSMKW0Xw+s2okc9K9A5evAAtGTUc=;
 b=RPnc/lltAqPuUJR2we1iwIcV3yGPf/+Rq00frStCStqEAEPC2KiqlNAK0E+USCVdMR
 AdX5iqF2ljKhuWEZ3zFTsU3qwhArQrMRIVVZR2mnLpuoUo7/8kUNqx6FSinAXd+qvcY+
 USy9Q3fxaysmVgNgtEU8UoYrPgfzphMi3vPzxDen/c8xafkFwI9ryL/3sq3dKJQBu1kx
 pdv9nv2tu9K0vNgFA4FoEbrP5hKNXR01xhyECNeR+HC+Mlf03gW3dInsD1j2IsdbERKi
 ajd9/SXttFzRZIQtoBlPOktOaqH92jE96L+8OfcYpe5NN6kFsxKAtdMZJe8yVVLA+TDU
 6UDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cJqrClHiZPXq+FVkSMKW0Xw+s2okc9K9A5evAAtGTUc=;
 b=fAnfyUuNnmgqSK8mL6u7YQsbe/3O0UDAP0M9UekowXCyXvCM48C709a8WI+p2m5NN7
 4O4dW9zJoQv3IarAZOxtrPAyRqQpIm0IWsVVsEOqVihx/UiI4be+Vt25u8K6E0Rzeojr
 8c9x+t3jRHyaCGm7t7FMdeP10x78D88OxuXG09jPh1P4E9MGss1vQsDn+j5PUHIrZ8RH
 kBoZM8/mkxxtoiJIruJFuN8TngN+zJyWBj1VQwI6EJdBkv/8qT1PdCVwPZQX5oSYbSUX
 yRD11s2hYidGp0QAm9d/1c5XVNnkpbydLl1tXzCS9FSC9N8D6KSXEtCYdmxbakFQ2/ID
 hd/g==
X-Gm-Message-State: ANoB5pmDV7ZgeKSa779foWCeW7AA3nZ0wYMKYPpEAdHOWs43jmZ8JE0S
 4bi3Wy5loe5V0/hVHTd9vJK0vw==
X-Google-Smtp-Source: AA0mqf734sY6ZDYeK/G5AR3EnvJhvF9S6ueO3jz/KPo7tyikas7hMGIGuMUsj5L17EBc21tQpzfyNQ==
X-Received: by 2002:a19:6717:0:b0:4b4:e13f:6a17 with SMTP id
 b23-20020a196717000000b004b4e13f6a17mr15560450lfc.372.1669820876997; 
 Wed, 30 Nov 2022 07:07:56 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a2e9150000000b00277045dcb5bsm155073ljg.97.2022.11.30.07.07.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 07:07:56 -0800 (PST)
Message-ID: <502a28b2-e77d-37aa-4f14-10917fca18b2@linaro.org>
Date: Wed, 30 Nov 2022 16:07:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 01/12] dt-bindings: display: msm: Replace mdss with
 display-subsystem
Content-Language: en-US
To: Adam Skladowski <a39.skl@gmail.com>
References: <20221129204616.47006-1-a39.skl@gmail.com>
 <20221129204616.47006-2-a39.skl@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221129204616.47006-2-a39.skl@gmail.com>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Gross <agross@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 devicetree@vger.kernel.org, Amit Kucheria <amitk@kernel.org>,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/11/2022 21:46, Adam Skladowski wrote:
> Follow other YAMLs and replace mdss name.

That's really not explaining what you are doing here. Your commit msg
and subject suggest you rename mdss. But you don't. You touch only examples.

> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  .../devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml      | 2 +-
>  .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Best regards,
Krzysztof

