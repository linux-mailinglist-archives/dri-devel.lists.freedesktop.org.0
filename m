Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 734116ABAC1
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 11:06:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3AC010E0B7;
	Mon,  6 Mar 2023 10:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C41710E0B7
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 10:06:33 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id a32so8994971ljr.9
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Mar 2023 02:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678097191;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qL3HmAMZXbE+tU4cZr71bQvnmInTwDDVr78Hu6G/gXg=;
 b=Mwk82bE/GvduM3fFm6qfsIX9+p4RxWtbJurmbG4xt14UF18rx/cX6FXxf6IPH9Yh1j
 aRV3aIqG6zDJ8rOGcp3VYx+I/cICrTugpgj4syvgXyJSs1b8gX4LGiNGIcXmj99DCMUI
 sci658j5zlOHUBrJJUA1bSdCalnUbLFNS+AjBlB6bTD2rKLREJdh0EkhivGUaMu2vaR6
 hOqoat2PBSJkaTtl7KQNK5lIAzgF/1zubcGICjhU9me+EUUl/DxeO4TMLRM0m7YkSSl+
 s08BrtGOIKxKwms2GuH+JqOzqd8SvXjvMm7YktyvXD9zeQ4Xjbvl17t/mXU196VO6DhC
 tfPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678097191;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qL3HmAMZXbE+tU4cZr71bQvnmInTwDDVr78Hu6G/gXg=;
 b=YSx+maGhY6o66nvN3NEIsxZUe9GKuVNqNdOms4Haqqki3vOjdVAe90eFlOwS0Wrmx5
 ICTGZ8taSUAZ0/pAhJ8qT/57Blj5wpGhgCIEyue7+GT0e70gYVVntsH6qtELkDYBvf0w
 R4D/UxWzEfWRalCYJAtlutOkw2o/0KB36AyE97tyCByy4rHcSsjMs0SmVcETNlGQtakB
 7jHruynLm9oC/T0IWPEEImn5vQh3iWA+iLQaRA1xFWl4L0BUktLtaP0f7kjIgnGFqTvy
 E8Qo0U+JIMyIlyVwufXSEHfNYfPq8kvZwsLxtnmbrve1Ps2ICBwO2BKKPQihppu54d7T
 dyWw==
X-Gm-Message-State: AO0yUKWoJGvsB0+cX3nIiNWCQKm1IkKls61sSEno72vO0366500xFVIx
 Ose5FJ6Ip9YzPLLX7ctSNRZ2/g==
X-Google-Smtp-Source: AK7set/6RjJM9RgwapIiqqa60HrY2H4DbY07gJyWtciss4OLaEuYasLPM3YqalZX5PUaz9yx85GM0A==
X-Received: by 2002:a2e:98d6:0:b0:295:bab7:c7df with SMTP id
 s22-20020a2e98d6000000b00295bab7c7dfmr2797895ljj.38.1678097191451; 
 Mon, 06 Mar 2023 02:06:31 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a2e98c2000000b002934fce87bfsm1586710ljj.108.2023.03.06.02.06.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 02:06:31 -0800 (PST)
Message-ID: <4b8745d8-144f-fb82-3e54-5ce6bd3162e6@linaro.org>
Date: Mon, 6 Mar 2023 11:06:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/2] dt-bindings: display: msm: sm6115-mdss: Fix DSI
 compatible
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20230304-topic-dsi_fixup-v3-0-b8565944d0e6@linaro.org>
 <20230304-topic-dsi_fixup-v3-2-b8565944d0e6@linaro.org>
 <e105eff0-816e-b9e8-b47a-5c85731c9ba0@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <e105eff0-816e-b9e8-b47a-5c85731c9ba0@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6.03.2023 09:57, Krzysztof Kozlowski wrote:
> On 04/03/2023 16:55, Konrad Dybcio wrote:
>> Since the DSI autodetection is bound to work correctly on 6115 now,
>> switch to using the correct per-SoC + generic fallback compatible
>> combo.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml         | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
>> index 2491cb100b33..605b1f654d78 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
>> @@ -40,7 +40,13 @@ patternProperties:
>>      type: object
>>      properties:
>>        compatible:
>> -        const: qcom,dsi-ctrl-6g-qcm2290
>> +        oneOf:
>> +          - items:
>> +              - const: qcom,sm6115-dsi-ctrl
>> +              - const: qcom,mdss-dsi-ctrl
> 
> Does it actually work? You did not define qcom,sm6115-dsi-ctrl in
> dsi-controller-main?
Check the "Depends on" in the cover letter.

Konrad
> 
>> +          - description: Old binding, please don't use
>> +            deprecated: true
>> +            const: qcom,dsi-ctrl-6g-qcm2290
>>  
>>    "^phy@[0-9a-f]+$":
>>      type: object
>>
> 
> Best regards,
> Krzysztof
> 
