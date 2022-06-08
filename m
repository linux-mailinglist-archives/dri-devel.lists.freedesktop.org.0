Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC51542AAD
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 11:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35B810E10A;
	Wed,  8 Jun 2022 09:06:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1122F10E10A
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 09:06:41 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id c4so158028lfj.12
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 02:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UWYWVcXogZZm7TQss3LobaIgIJTxFR11rLplfzwNMig=;
 b=I+f7PscBnXMmsm6JdEzkN2r/BEt/ov8ZM76Of9NkJuptPE0KKTlIUPs75o4N75t+c9
 akUFLm72NOe/Dwa+JZKwGsZd6vIvsolgjFqCFy+7Q8gxb+lGg7Fm1kRDuQl/qe4xFy3F
 jmvEAD+FqGv5Tk9hX6na08VmJzEGvOgQTyPSi0Wb+OZxOLTEw7rPUx3ODM9dLH7df5Vk
 k/mkjhhiDuRAhRbIB+y4vuYQ+u68A7ejwC+UvqxRHiJ8FLLn2ify8SqSDPLxAnQxAQyC
 9R8gjr3zavFFHfAToBI8dANCxRJSx3bCQncuQbziii+rFS5hcekPkTLq52y0pma8ILvG
 j9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UWYWVcXogZZm7TQss3LobaIgIJTxFR11rLplfzwNMig=;
 b=ZwIuCvSfWKTL6NKZ7qW3k6eS9qzBx11H9joQHL0QxlPAZucPdJagn0CegbQvgaqKXt
 akzdE6+6NXIcdJa4hT5Ciqjpxrf/JF441Yo1+BYnzKSp3z6MZvtSoX8beTRZ3EP2KJxD
 POa16MPLvPlgIPe/Ggb9JFXrr7Bid05ns4Rr4MTGOdyduZK1YFP8ftplAP4DwnjoQmuM
 IANkpVm4ZUV/Abw5P416WgfyTiGNHC7Fc6snoN34xk3MS06p5CJiTq1nIPn4Lgwsx0A3
 kdrEcCUHkDMmOdrcE+DoqL1AD8WsLt+TEHAt/aZpMIzKhcOou2+Qp31fp3sbOrqczALj
 80CQ==
X-Gm-Message-State: AOAM5309B3qa3nqHjXbxlbXTS6HZh21SHwk27NIYpvLeaQkEFS0tVJGI
 mWYdv7k+FztewvdohiVNuclb8nG4jucLehVTXpdTbg==
X-Google-Smtp-Source: ABdhPJx2A5aRKvXYdtPa/8GFoapItwwMlKdcoNxXkyMGuWfdsOjCC9S9cC1Zud9VZdYGP7rgIy+NAQ==
X-Received: by 2002:a05:651c:98d:b0:250:976b:4a0e with SMTP id
 b13-20020a05651c098d00b00250976b4a0emr55921408ljq.494.1654679188857; 
 Wed, 08 Jun 2022 02:06:28 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 j20-20020a2e3c14000000b00253bd515f88sm3110633lja.68.2022.06.08.02.06.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 02:06:28 -0700 (PDT)
Message-ID: <5a7b9d21-1d10-fba0-1102-c5ae27809a79@linaro.org>
Date: Wed, 8 Jun 2022 12:06:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v1 2/7] dt-bindings: display/msm: hdmi: mark old GPIO
 properties as deprecated
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220607185806.2771739-1-dmitry.baryshkov@linaro.org>
 <20220607185806.2771739-3-dmitry.baryshkov@linaro.org>
 <c431b51a-f68f-8608-5d5d-6dac85e2be4f@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <c431b51a-f68f-8608-5d5d-6dac85e2be4f@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, David Heidelberg <david@ixit.cz>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/06/2022 12:05, Krzysztof Kozlowski wrote:
> On 07/06/2022 20:58, Dmitry Baryshkov wrote:
>> Mark obsolete GPIO properties as deprecated. They are not used by
>> existing device trees. While we are at it, also drop them from the
>> schema example.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../devicetree/bindings/display/msm/qcom,hdmi.yaml         | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,hdmi.yaml b/Documentation/devicetree/bindings/display/msm/qcom,hdmi.yaml
>> index 2f485b5d1c5d..2b1cac0851ce 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,hdmi.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,hdmi.yaml
>> @@ -59,22 +59,27 @@ properties:
>>   
>>     qcom,hdmi-tx-ddc-clk-gpios:
>>       maxItems: 1
>> +    deprecated: true
>>       description: HDMI DDC clock
>>   
>>     qcom,hdmi-tx-ddc-data-gpios:
>>       maxItems: 1
>> +    deprecated: true
> 
> This is confusing. These two are not defined in the old bindings, not
> used by DTS, not used by Linux implementation - why did you add them?

Most probably I added them as they were referenced in the source (and in 
the example). I'll drop these two completely (and document removing them 
from the example).

> 
>>       description: HDMI DDC data
>>   
>>     qcom,hdmi-tx-mux-en-gpios:
>>       maxItems: 1
>> +    deprecated: true
>>       description: HDMI mux enable pin
>>   
>>     qcom,hdmi-tx-mux-sel-gpios:
>>       maxItems: 1
>> +    deprecated: true
>>       description: HDMI mux select pin
>>   
>>     qcom,hdmi-tx-mux-lpm-gpios:
>>       maxItems: 1
>> +    deprecated: true
>>       description: HDMI mux lpm pin
>>   
>>     '#sound-dai-cells':
>> @@ -171,8 +176,6 @@ examples:
>>             <&clk 61>,
>>             <&clk 72>,
>>             <&clk 98>;
>> -      qcom,hdmi-tx-ddc-clk-gpios = <&msmgpio 70 0>;
>> -      qcom,hdmi-tx-ddc-data-gpios = <&msmgpio 71 0>;
>>         hpd-gpios = <&msmgpio 72 0>;
>>         core-vdda-supply = <&pm8921_hdmi_mvs>;
>>         hdmi-mux-supply = <&ext_3p3v>;
> 


-- 
With best wishes
Dmitry
