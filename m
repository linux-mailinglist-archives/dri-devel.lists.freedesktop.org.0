Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A056F17D6
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 14:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6496B10ED19;
	Fri, 28 Apr 2023 12:25:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4184710ECED
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 12:25:41 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-506b8c6bbdbso14523814a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 05:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682684739; x=1685276739;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JZaTVYj+7JHW5ogrU2gshDHZR4SGV9IAITO2F/xNkdE=;
 b=S09ujwy6aOa6ctTYPXwZoPuRqF36CQOsazZonATFMiCtuWUqgPKeTkzkXMlHuMRDwV
 fLyWqUdCI9LTy5qBVXnvUr9nsc1iUB70043XxxZExzigT7J8Q5IBgzamv6tF2kALgu1Y
 Yea9deTDF9RU3VYdjcs6b5Rjz461ikvTNh/RO1MsUPAASsf9MNnIjvxm5MHjXHO8mWd3
 MpDfVvBEqhnqWnh/krHjWorg//QItjEdQCqnZZ+7NaRY3SFEK9fv0qHuNQP8oTu23hUq
 XRgPM+D1+VtGFF4UcvqEN3Z1pUWM0Gxg0ZN152oSurdgRNsePO4i9JsPUHjavQrMvg1Y
 Uwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682684739; x=1685276739;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JZaTVYj+7JHW5ogrU2gshDHZR4SGV9IAITO2F/xNkdE=;
 b=PuPkbT/m1g/8EdKV1XP0Bp+xXgeH0F5YpHeDBMr0HQsr/32rhEfCLmY0fhbZ27Fc/Q
 NgzChM4y5XddMDKHniqyeEBG9WApj58pvKm/eO2OyvjdR/Og5p9XgI5kMXqRfGeehC5s
 y3jtNX31SNsuHwi8nptrt53FFccKbt423OwSNCDfr5izq5u1Ta7M9U43t9HaTMQBcCBi
 r8Z6njn2zE+LpkDSMXjal9B/EVwMiKFfNjX5jXMWE5L2GJ8TYmMPLS0fiQ4/dTLq4S0d
 eAERrWGlAuKUtvg/D0hpZxSsAErFZRXFTVWMKkKsBPH+10Hq2EMgRgg0l13f3LQLj9FD
 5snA==
X-Gm-Message-State: AC+VfDzL000ytg++MXYeqmYNJ3qkQTojHSY+AgFISninQOrTJL65F4ef
 kKEBD4eCOWc8BsSQkqJdOlq4dQ==
X-Google-Smtp-Source: ACHHUZ5nE8CV6swtaa6RT8oWCahIZAfJUkO/1Goui9aA/rILn+31p0oddbno5lpzYsEOiXt4oKJLeg==
X-Received: by 2002:a50:fb04:0:b0:506:be49:243a with SMTP id
 d4-20020a50fb04000000b00506be49243amr4117396edq.15.1682684739187; 
 Fri, 28 Apr 2023 05:25:39 -0700 (PDT)
Received: from [172.23.4.26] ([31.221.30.162])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a05640214c700b004fa380a14e7sm9102383edx.77.2023.04.28.05.25.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 05:25:38 -0700 (PDT)
Message-ID: <87d16bb4-178a-2583-5338-d9e9674da6e9@linaro.org>
Date: Fri, 28 Apr 2023 13:25:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 07/13] drm/msm/dpu: Add SM6350 support
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
 <20230411-topic-straitlagoon_mdss-v2-7-5def73f50980@linaro.org>
 <k25jg7cez2kimpxr4ztbdzjr2adq6a2vjknyvfe5frxujtogfg@vhfdyt45unv6>
 <b3fajcbkfxqy4bxzjezrugbetpbjxdskarr3fhtn2unhqv2srj@y2o3wfd4v7dz>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <b3fajcbkfxqy4bxzjezrugbetpbjxdskarr3fhtn2unhqv2srj@y2o3wfd4v7dz>
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
Cc: freedreno@lists.freedesktop.org, iommu@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Joerg Roedel <joro@8bytes.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/27/23 16:48, Marijn Suijten wrote:
> On 2023-04-27 17:37:42, Marijn Suijten wrote:
>> On 2023-04-21 00:31:16, Konrad Dybcio wrote:
>>> Add SM6350 support to the DPU1 driver to enable display output.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> After addressing the comments from Dmitry (CURSOR0->DMA1 and
>> CURSOR1->DMA2), this is:
>>
>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>>
>> See below for some nits.
> Actually found one glaring issue that might explain why INTF TE wasn't
> working for you the other day!

[...]


>>> +	.vbif = sm6350_vbif,
>>> +	.reg_dma_count = 1,
>>> +	.dma_cfg = &sm8250_regdma,
>>> +	.perf = &sm6350_perf_data,
>>> +	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
>>> +		     BIT(MDP_SSPP_TOP0_INTR2) | \
>>> +		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>>> +		     BIT(MDP_INTF0_INTR) | \
>>> +		     BIT(MDP_INTF1_INTR)
> For completeness I should've pointed out that you're missing
> MDP_INTF1_TEAR_INTR here, likely resulting in INTF TE not working.
>
> - Marijn

<annoyed noises>

so it might have been this.. I'll retest, thanks!


Konrad

>
> <snip>
