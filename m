Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B37A69B9BA
	for <lists+dri-devel@lfdr.de>; Sat, 18 Feb 2023 12:23:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2723110E4AB;
	Sat, 18 Feb 2023 11:23:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2666E10E4A4
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Feb 2023 11:23:19 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id b1so776968lfs.8
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Feb 2023 03:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zXrmfYPtbD+a4mYWOw7gzX5blmN63cfug46pUteyx84=;
 b=kzgT7ub+8SeOW/sL4cVFBuzPnNqoM6WqL8uiNYdBNlvtGlgd5lAOwrqaThKyUtzI6q
 hZPQ++Wa9Bdv294jRq4J9JThEpkCGjTVN/gjjmPdJBTIlwxde9hPV4HU3+iL4zJCiRh7
 s2aJ0gekWlA7msRBLxF/MznErWfBfNzq/Mz3p8dssISUc70jYCJU1FcC0v5ctD+0KdUX
 ++eferbxRB4BEpZRn/gvHYPjkeUD88GbtQW7C8PS2zo8EOMuAgDxFCi4rluIgPqPVepn
 V7+Vrj2qW7APxl6KjZnwP03e9dmotmyN2gGqQn1nuUphnePzLuUcY9T2RSG8YvhrdKSj
 hEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zXrmfYPtbD+a4mYWOw7gzX5blmN63cfug46pUteyx84=;
 b=y5Bj/Rlzug8OzL1NihQ62DljYe8PZvvGrs9SSlRMT0Urpj1bYLy6YXxpXKS6uEItOK
 h++Wwy3TH49/AmP3KVWOzUQXJRhskxm5rYQle/H0bc2hvj2boHeSZl2amdX6GgAPYb6G
 /Q7CkyZsV8KxyscS1Q1cRuQ2e30C35Az+g3nSCe6Jsy6DacGWWL7eu/OkR8Mbnr6qoHo
 p+Vckxj2+XdQ4apCMnKQ32U1WWL9zVD6RnbmlMUdHM8jrINT3Hz//zHKR/q/bdsIJUF4
 biSz8zYMfeRAOk5guZlfGdvtzF42XIbWvuBQVIvrZFr/YgvPfe+6+jmN56pIlHpzwhtl
 hS9g==
X-Gm-Message-State: AO0yUKWFv/PKXQG3jxvqj/mzQibSXv5Jfnb7Ss2RWognYdm2KtnC1wT7
 4Pecz8vbkEBHK8NOVsH47Chjh5u/nDHScyEu
X-Google-Smtp-Source: AK7set/2Ym3B0dnJtwcPI9O9DneEz9RDbQ+ZtBmCZopQM4AHFgi7uc2wVb/PGBW+WJcbmcklTCJHtA==
X-Received: by 2002:a19:a40e:0:b0:4d1:7923:3b92 with SMTP id
 q14-20020a19a40e000000b004d179233b92mr781116lfc.50.1676719397408; 
 Sat, 18 Feb 2023 03:23:17 -0800 (PST)
Received: from [192.168.1.101] (abxh184.neoplus.adsl.tpnet.pl. [83.9.1.184])
 by smtp.gmail.com with ESMTPSA id
 m17-20020ac24ad1000000b004cb1e2f8f4dsm950902lfp.152.2023.02.18.03.23.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Feb 2023 03:23:17 -0800 (PST)
Message-ID: <fbece9d6-2204-2534-e44f-29c29cc56413@linaro.org>
Date: Sat, 18 Feb 2023 12:23:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 1/2] dt-bindings: display/msm: dsi-controller-main: Fix
 deprecated QCM2290 compatible
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org
References: <20230217111316.306241-1-konrad.dybcio@linaro.org>
 <c49904be-d842-fc12-a443-17f229d53166@linaro.org>
 <a4eaccfd-34ba-15f3-033f-165b46c43317@linaro.org>
 <a158bca2-78bf-5b38-60fe-88118e8b4ad7@linaro.org>
 <ab35cdcf-53ae-a3f2-fc08-d0f58c51a0ae@linaro.org>
 <48cb00cd-961c-b72f-fba8-1842d658e289@linaro.org>
 <d4ffa9f0-797e-7a32-147e-64aa46d7e197@linaro.org>
 <e6d397bb-dd5d-8308-eb07-3aeb2589115c@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <e6d397bb-dd5d-8308-eb07-3aeb2589115c@linaro.org>
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 18.02.2023 11:14, Krzysztof Kozlowski wrote:
> On 17/02/2023 22:13, Bryan O'Donoghue wrote:
>> On 17/02/2023 12:24, Krzysztof Kozlowski wrote:
>>> First, it would be nice to know what was the intention of Bryan's commit?
>>
>> Sorry I've been grazing this thread but, not responding.
>>
>> - qcom,dsi-ctrl-6g-qcm2290
>>
>> is non-compliant with qcom,socid-dsi-ctrl which is our desired naming 
>> convention, so that's what the deprecation is about i.e. moving this 
>> compat to "qcom,qcm2290-dsi-ctrl"
> 
> OK, then there was no intention to deprecate qcom,mdss-dsi-ctrl and it
> should be left as allowed compatible.
Not sure if we're on the same page.

It wasn't intended to deprecate [1] "qcom,qcm2290-dsi-ctrl", "qcom-mdss-dsi-ctrl";
(newly-introduced in Bryan's cleanup patchset) but it was intended to deprecate
[2] "qcom,dsi-ctrl-6g-qcm2290"; which was introduced long before that *and* used in
the 6115 dt (and it still is in linux-next today, as my cleanup hasn't landed yet).

[3] "qcom,dsi-ctrl-6g-qcm2290", "qcom,mdss-dsi-ctrl" was never used (and should never
be, considering there's a proper compatible [1] now) so adding it to bindings
didn't solve the undocumented-ness issue. Plus the fallback would have never
worked back then, as the DSI hw revision check would spit out 2.4.1 or 2.4.
which is SC7180 or SDM845 and then it would never match the base register, as
they're waay different.

Konrad
> 
> Best regards,
> Krzysztof
> 
