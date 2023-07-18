Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C8C7573A9
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 08:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87E3310E2D8;
	Tue, 18 Jul 2023 06:09:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4FB510E2D7
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 06:09:44 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4fba1288bbdso8522918e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 23:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689660583; x=1690265383;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z5VQwVrGcXMfCfvuw2kyfpvvEbdxnp5EKgVKHPURbWM=;
 b=HHvKaDKj0O6hNAptE4inyZOHuRF+UKZXm+WzhvsppGx6mT12Uv3s0wHix2zOZOkvkJ
 877SnV8WdE3kc/5yorMj2oCVMEcnUrqvrqltwTn2u3Ma5XlIhQ9YjVrYtchVjFchEUVs
 b4ns+4ukynBmrM4w9TK2edsk+MJLwwQFbmx0sdD9fvxXosHfFSPF1gAHqA55UosGsiHD
 asr4nRLbFZLmqxAJyEVTPU4ej+5KkCtQJCfSuXXDYYgcVdwYifBoECoY7YkW7k5/iM8K
 VPnYrIdT8Q//oCldxyRGgcLZUqFNTzskDMAuvE7hvRpARirSNs4Gfz0gRvAqXT76NsIA
 MTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689660583; x=1690265383;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z5VQwVrGcXMfCfvuw2kyfpvvEbdxnp5EKgVKHPURbWM=;
 b=dI3CZ9BefhPePf3i8YV/AEhTKYwGygB6z5pCqRJacCXQ7K6VDRQwKQ8Rm96l9T/oG/
 f5z3iu/7en3cdnERjdzTS/ws7BDt2KNiAZEWN1sz25cL9lsJRvXQrm71aXyMwFn8E5Oz
 LiKP0msmORl3OfKFw67Ah/IgKKc6leXZzQebx1RgQq55qS6St7i3ecwXZvFOvBV9R9b+
 ogyhCaKzI968dmpErNGrQi9w6lrKeEns2E9j2QLA5ztwpjLsepyjHrv0F5WvgG7RYwht
 8efMrXYjeaqmzp9D5PHCw8U7zzGjDAOdRXVc9ppW0mhs5pQSGslDGRuxo6fdW4k9z15H
 SPwg==
X-Gm-Message-State: ABy/qLa1s87dHjqHJdfs4uuOqLJ/yTzImh+gG+VhNm9zVZKWcOEglpLl
 7qmuGrfhn2ixH8Pso2Ei/pY32A==
X-Google-Smtp-Source: APBJJlFuWqM7VJ+TLOLnaEcliAKHtvXtVu+8Nyr2lg0mEZWLl6kglI0wuWE+sp43IVhjUCSwTxDmtg==
X-Received: by 2002:a05:6512:3989:b0:4fd:c923:db5f with SMTP id
 j9-20020a056512398900b004fdc923db5fmr1976725lfu.14.1689660582991; 
 Mon, 17 Jul 2023 23:09:42 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 a28-20020a056512021c00b004fbac025223sm279081lfo.22.2023.07.17.23.09.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jul 2023 23:09:42 -0700 (PDT)
Message-ID: <0075783f-9166-89aa-a9f9-068494e468e3@linaro.org>
Date: Tue, 18 Jul 2023 09:09:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/5] arm64: dts: qcom: qrb5165-rb5: enable DP support
Content-Language: en-GB
To: Bjorn Andersson <andersson@kernel.org>
References: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
 <yjr3i54z4ddifn7y6ls65h65su54xtuzx3gvibw6ld4x27fd7x@ganmrdp4vzx7>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <yjr3i54z4ddifn7y6ls65h65su54xtuzx3gvibw6ld4x27fd7x@ganmrdp4vzx7>
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
Cc: devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/07/2023 07:37, Bjorn Andersson wrote:
> On Sun, Jul 09, 2023 at 07:19:21AM +0300, Dmitry Baryshkov wrote:
>> Implement DisplayPort support for the Qualcomm RB5 platform.
>>
>> Note: while testing this, I had link training issues with several
>> dongles with DP connectors. Other DisplayPort-USB-C dongles (with HDMI
>> or VGA connectors) work perfectly.
>>
>> Dependencies: [1]
>> Soft-dependencies: [2], [3]
>>
>> [1] https://lore.kernel.org/linux-arm-msm/20230515133643.3621656-1-bryan.odonoghue@linaro.org/
> 
> I'm not able to find a version of this series ready to be merged, can
> you please help me find it?

This = Bryan's? I have posted some (small) feedback regarding v8. You 
also had issues with orientation switching bindings, etc. So there 
should be v9.

> 
> Regards,
> Bjorn

-- 
With best wishes
Dmitry

