Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D547F587769
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 09:03:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 084E42A36D;
	Tue,  2 Aug 2022 07:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A41B32A2C4
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 07:02:44 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id x39so11065549lfu.7
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Aug 2022 00:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=/ySHTyzeX/H7MclcVdbanxVutrzYknZPMky5Ufc/cco=;
 b=ILkBFGqDuBCm81NrzjcIfk8v3fifksnPm3jgAYKIm1BAm3lRuNREbalAI0fcXnz7IF
 JrlZx82CDX0uqldmBtxSkHAwRsYgW/DoTJ/9BnUGVTwk73vx/GRAjghPbY6AEzGREj79
 pPIip6BBlJqM7gCDwLMRFLhCfHfXauIlXdJPxY2PCV0z9Zl7M74xX4hH8FFsT5d/GTS7
 2fkW1xVwAX6Da7nQgCrqpe1Kp1UGxmIb417ZoswTZ2HUNFKYLNARs8l3WNnR6TdiOMfo
 G2UhGeT2lPVHtLKb0qRt3SLBhgiVVcQhbu2mu/2+M5KSR5xECr+ASZdEJnmTtlWyhaS3
 wqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=/ySHTyzeX/H7MclcVdbanxVutrzYknZPMky5Ufc/cco=;
 b=YrndKP8NYq+BiwVXj1+aQpjJjyL7iBkD3VrTx89onPmz0SILVfqWCB2zNtqTeSNiFW
 QrQGJ3HZdKTuOFWFfsGGUZK90o2mgiSZK3iK8M42WYc6SHXDb9nA7du+IUvqFB/wVj86
 hRjBqJOQST3U9gVez/qiEOlj+AtrHBWTgv0kiNn+5UB6gAZgZZXXOfszvbhfhQZ0kcUC
 hN21JWZYN18urgZfrXIGL2mBjgrhtsngG4bT4CMB5bUu/af7/qqq5v0uYZw7bxj0tYQh
 ipRh9ewue8oqpZ1vuedJ0mjQUKDpxFPD7Dc53zLJZU4CucXZOKCb0JUaaLMJFD2I2UXH
 QHBQ==
X-Gm-Message-State: ACgBeo0K4sgZNCY0RMxZ3Nt0pHl3sysDdB52EO9+PEmyPkQ/5giEpBXQ
 pYJ6HOLVXmueAk98vvIySlTjqQ==
X-Google-Smtp-Source: AA6agR4N7si8u20TMih2xTB+Z2+BSt/eBM4OC4TX8ZhEGP1kPVnVDh9g8o9nA0BSsYDSlm57b6YqfQ==
X-Received: by 2002:a05:6512:3d8f:b0:48b:12f3:c9c7 with SMTP id
 k15-20020a0565123d8f00b0048b12f3c9c7mr161931lfv.23.1659423762780; 
 Tue, 02 Aug 2022 00:02:42 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 i17-20020a056512341100b0048a7fa5bff1sm1085463lfr.248.2022.08.02.00.02.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Aug 2022 00:02:42 -0700 (PDT)
Message-ID: <34ae275e-8d4c-3735-c08c-4769caf2909c@linaro.org>
Date: Tue, 2 Aug 2022 10:02:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/5] clk/qcom: Support gdsc collapse polling using 'reset'
 inteface
Content-Language: en-GB
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Stephen Boyd <swboyd@chromium.org>
References: <1659172664-10345-1-git-send-email-quic_akhilpo@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1659172664-10345-1-git-send-email-quic_akhilpo@quicinc.com>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/07/2022 12:17, Akhil P Oommen wrote:
> 
> Some clients like adreno gpu driver would like to ensure that its gdsc
> is collapsed at hardware during a gpu reset sequence. This is because it
> has a votable gdsc which could be ON due to a vote from another subsystem
> like tz, hyp etc or due to an internal hardware signal.

If this is votable, do we have any guarantee that the gdsc will collapse 
at all? How can we proceed if it did not collapse?

> To allow
> this, gpucc driver can expose an interface to the client driver using
> reset framework. Using this the client driver can trigger a polling within
> the gdsc driver.

Trigger the polling made me think initially that we will actually 
trigger something in the HW. Instead the client uses reset framework to 
poll for the gdsc to be reset.

> 
> This series is rebased on top of linus's master branch.
> 
> Related discussion: https://patchwork.freedesktop.org/patch/493144/
> 
> 
> Akhil P Oommen (5):
>    dt-bindings: clk: qcom: Support gpu cx gdsc reset
>    clk: qcom: Allow custom reset ops
>    clk: qcom: gpucc-sc7280: Add cx collapse reset support
>    clk: qcom: gdsc: Add a reset op to poll gdsc collapse
>    arm64: dts: qcom: sc7280: Add Reset support for gpu
> 
>   arch/arm64/boot/dts/qcom/sc7280.dtsi          |  3 +++
>   drivers/clk/qcom/gdsc.c                       | 23 +++++++++++++++++++----
>   drivers/clk/qcom/gdsc.h                       |  7 +++++++
>   drivers/clk/qcom/gpucc-sc7280.c               |  6 ++++++
>   drivers/clk/qcom/reset.c                      |  6 ++++++
>   drivers/clk/qcom/reset.h                      |  2 ++
>   include/dt-bindings/clock/qcom,gpucc-sc7280.h |  3 +++
>   7 files changed, 46 insertions(+), 4 deletions(-)
> 


-- 
With best wishes
Dmitry
