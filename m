Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5466D636B88
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 21:49:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB1510E242;
	Wed, 23 Nov 2022 20:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5581C10E248
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 20:49:36 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id d3so22753407ljl.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 12:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S7YvUMQ+nKYiMNNWPyDhQ/jukxJGNja3gA82pbwqtr0=;
 b=qze4Fhr0i3wUjK7JmEknyCoCM3OyXohdoTL4Xq39kXScuKBAlMYJMwXKjKdN0O7L+I
 kUPREyK48s65dzMlGsXdM+g8KDHeD6kY7LrvXocUDBc/P3Il2GYIKm9+lWoYOH8F5YHx
 NkgqSj21KZyxtWthL7UsesnZG2woWNiG1MW5mMlEWa4HsUJxy+BxRthpGa1Ctd8I5x8M
 PsR7rwRkPrbJWzxW5/iUfBMyK8e/fwoCRK7JkNn8UKXO3maLYCR3BzwiTSNW9p+y7PmE
 ULhHZTRBr2ExTWIe0tZ55hHpDolMAjmRoFSDdu4IiZgb1IT67klnF/d6+aJXxmxkqTpi
 WyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S7YvUMQ+nKYiMNNWPyDhQ/jukxJGNja3gA82pbwqtr0=;
 b=woCow0DSWT82Hm1/wLKI9l54fFfpcuROMM2GnXJTp74r5bSEK0gpY85bIMTkLFhdtg
 8xdqik4xxDdow9Q4LSXFtIQcwkxiNNizWN9gTrm/gfwyqhQf/4ZHeOtzd3tL6v6nwaHQ
 RBqB36E7ZxBuDOjuKmZ296GcJffP3T0A2JB3L0x5Pc8N0d1xlIlvSCAUlxsRG3ePHukJ
 jbMT6vaScA7Y990ED6zZi6J81q8Ak75ytFmGr5ZHJimfmYnNWLhtBx4NDeXrvGgNhvRA
 sKyHGKQzi1wl1DUxjIGxM4PtgqQdTDS9dtaFvzgJeyC6LMSQT/pxiI7cMR4bFN5DiyTL
 R0sw==
X-Gm-Message-State: ANoB5pmWqCkjlUN7SKFSRM67Gqh1Fi9bcW+n51D7w1Ryx2jngEJyuJC6
 qcIwap/oD1O84LL4awCqZq4jUw==
X-Google-Smtp-Source: AA0mqf6qjoBrUq7CGFIeDR/JoCZ8sBBy+cS4F3Qk97kaSCgXDjoTf66drKA9dZ74tkFh2N6z6E0dcA==
X-Received: by 2002:a2e:a4a3:0:b0:278:ecbe:ebba with SMTP id
 g3-20020a2ea4a3000000b00278ecbeebbamr4753569ljm.450.1669236574484; 
 Wed, 23 Nov 2022 12:49:34 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x12-20020a19f60c000000b0048b26d4bb64sm3036057lfe.40.2022.11.23.12.49.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 12:49:34 -0800 (PST)
Message-ID: <0800676c-9182-aa2c-72f2-525d8776b33f@linaro.org>
Date: Wed, 23 Nov 2022 22:49:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: sm8450-hdk: Add LT9611uxc HDMI
 bridge
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221122233659.3308175-1-dmitry.baryshkov@linaro.org>
 <20221122233659.3308175-5-dmitry.baryshkov@linaro.org>
 <ac216c05-d939-0045-9a32-c874b584ee2d@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <ac216c05-d939-0045-9a32-c874b584ee2d@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/11/2022 11:01, Krzysztof Kozlowski wrote:
> On 23/11/2022 00:36, Dmitry Baryshkov wrote:
>> From: Vinod Koul <vkoul@kernel.org>
>>
>> Add the LT9611uxc DSI-HDMI bridge and supplies
>>
>> Signed-off-by: Vinod Koul <vkoul@kernel.org>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> 
>> +
>>   &sdhc_2 {
>>   	cd-gpios = <&tlmm 92 GPIO_ACTIVE_HIGH>;
>>   	pinctrl-names = "default", "sleep";
>> @@ -431,6 +478,20 @@ &sdhc_2 {
>>   &tlmm {
>>   	gpio-reserved-ranges = <28 4>, <36 4>;
>>   
>> +	lt9611_irq_pin: lt9611-irq {
> 
> -state suffix
> 
> And test DTS against bindings (`make dtbs_check`).

Ack

> 
>> +		pins = "gpio44";
>> +		function = "gpio";
>> +		bias-disable;
>> +	};
>> +
>> +	lt9611_rst_pin: lt9611-rst-state {
>> +		pins = "gpio107";
>> +		function = "normal";
>> +
>> +		output-high;
>> +		input-disable;

Also dropping input-disable and changing function to "gpio".

>> +	};
>> +
>>   	sdc2_card_det_n: sd-card-det-n-state {
>>   		pins = "gpio92";
>>   		function = "gpio";
> 
> Best regards,
> Krzysztof
> 

-- 
With best wishes
Dmitry

