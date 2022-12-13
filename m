Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDA564BD2F
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 20:23:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F4410E15E;
	Tue, 13 Dec 2022 19:22:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCEE710E1E0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 19:22:34 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id q6so6577409lfm.10
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 11:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DONLyeUBEvtFdZRbXVpwOfCfRvSLKPBvM/+r4HRnRgM=;
 b=v8HDutxzGC6RaReRlTrmxmKgJIXCXC/oVRaM+uT54YvOYonHAt11Imn8wYHFcsPdIA
 VTvzL63p24fwRyy5Oq+BLykG4DNtF8ZTk3vunsvadKucc+oi4M2mCO5LB/q/HB3EJLuq
 9w6/RCXNPuv89MVQt/29SfEADwScw+/rKxtuxIG07rcxilpaTNLDAwAtCwkBM6TUDlO6
 z7u8Vp25g//j80hAAKHktNQOsPCqdTR29gnEyDAhK9upNq14dkd6xBWpuSrE/7pZ0VM8
 j9LU6R/JvQJADgUuQ+pMBAXrdj1k5vDpD6Rox8bqkqtOSdC5YG4peOiyZF/GjIkjUuPR
 dQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DONLyeUBEvtFdZRbXVpwOfCfRvSLKPBvM/+r4HRnRgM=;
 b=dqQ0y3Aw6vMTnZgyUOtjLPQrY9lrwKOEdKcWhr/ycE/uL9eJDvjqbKx/rQnUR3rw6Q
 RFFTlB7P7Bd9QGKm3lu0MUAvyOzItDY1aH2JnTfAfmH8OBzBw4Cjz3SVYeNBWJBpuUmJ
 HGQE/LAhvSyrJyikTj9jEZUZZhmp4R0E/2meNvKAK/nQnX/qkvfDnlF9F0yBBXCVqEDs
 0ty80vgwJUWs0FAw2IeB74nhGbNbLON7a5VPpgsXe/nHiBw24ZJySXb9zFUK1CUMlqDO
 PPHeFuZ9lGEWZJ7Jjphw2KVDorodWG/F3+SRwOAkIwA1UjQSeSyOy9qBnKszKXYRINvw
 cw0g==
X-Gm-Message-State: ANoB5plu2aUCP2c6GcVkTMp86fBiq0n+yxKjbiIt4a97e2z/AezUN989
 CXd9i+RBgvn7ByHdYTjWPnOXcw==
X-Google-Smtp-Source: AA0mqf5uSyuiT5WBiKktCwmsC2x5fCZrowPoOImGCXw/yGr/q+6Uhi76/7oI59/c4EmGR3i7siSRDQ==
X-Received: by 2002:a05:6512:23a9:b0:4b6:e775:ebb7 with SMTP id
 c41-20020a05651223a900b004b6e775ebb7mr4041100lfv.12.1670959352767; 
 Tue, 13 Dec 2022 11:22:32 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 j20-20020ac24554000000b004b1892aa5c8sm482465lfm.56.2022.12.13.11.22.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 11:22:32 -0800 (PST)
Message-ID: <b673eae4-03ab-0a87-32c3-49e35e8759a8@linaro.org>
Date: Tue, 13 Dec 2022 20:22:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [Freedreno] [PATCH v11 2/5] dt-bindings: msm/dp: add data-lanes
 and link-frequencies property
Content-Language: en-US
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
References: <1670539015-11808-1-git-send-email-quic_khsieh@quicinc.com>
 <1670539015-11808-3-git-send-email-quic_khsieh@quicinc.com>
 <5a3865ed-8847-db04-3d60-f35438250bef@linaro.org>
 <5aa16223-dbf6-996c-1985-794302dcce91@quicinc.com>
 <be1411e8-1d07-7643-977c-a306016fd660@linaro.org>
 <b6d90c1f-5365-7197-be63-96c3d8cf0746@quicinc.com>
 <e53844b7-601b-f355-302b-cc871962a446@linaro.org>
 <8b306c8f-3089-4aaf-7fc1-038a8330c89a@quicinc.com>
 <CAA8EJpr5RYyQa7xu1_xJ0F-dn-H9aOf0KE-CDgDCwnZu3HPgXg@mail.gmail.com>
 <a9e2f269-b9df-814f-adcd-f5577f590fa7@quicinc.com>
 <bca77270-f3ac-f23f-ef96-43f9f7d574c4@linaro.org>
 <0c131d43-1e91-8b92-5517-ca8fffef238c@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0c131d43-1e91-8b92-5517-ca8fffef238c@quicinc.com>
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
Cc: sean@poorly.run, devicetree@vger.kernel.org, quic_sbillaka@quicinc.com,
 vkoul@kernel.org, freedreno@lists.freedesktop.org, andersson@kernel.org,
 konrad.dybcio@somainline.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, robh+dt@kernel.org,
 agross@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/12/2022 18:31, Abhinav Kumar wrote:
> 
> 
> On 12/13/2022 5:13 AM, Krzysztof Kozlowski wrote:
>> On 13/12/2022 00:41, Abhinav Kumar wrote:
>>>>>
>>>>> besides, i think i have to sent the whole series patches include this
>>>>> one to address your new comments on other patch.
>>>>>
>>>>> is this correct?
>>>>
>>>> No. Please fix your system first, validate your patches and send them
>>>> afterwards. You can not expect others to do your job.
>>>>
>>>
>>> Just finished working with kuogee on this. This issue had been reported
>>> by few others earlier (example
>>> https://lore.kernel.org/lkml/bc9be279-a130-d5e7-4397-bbb389d14403@intel.com/T/).
>>
>> This report says:
>> "Sorry for the inconvenience, please ignore this false positive."
>>
> 
> That was one of them, and I dont think its false, maybe because after 
> fixing the PATH issues, the user deemed them as false.
> 
> Here is another one 
> https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20210812174209.1970-3-bbudiredla@marvell.com/ 
> with the same report but no resolution.

Thanks. Could be also Python mismatch. `make dt_binding_check` could use
dtschema from Python2 but the reporter used Python3 for checking the
version: `pip3 show dtschema`

> 
> So i thought for the benefit of others I would atleast summarize how we 
> resolved them.

Sure, that's helpful.


Best regards,
Krzysztof

