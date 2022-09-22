Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E625E61B1
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 13:47:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6635410EAC7;
	Thu, 22 Sep 2022 11:47:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F3C10EAC7
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 11:47:35 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id g20so9431122ljg.7
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 04:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=tTJpqulNTalAxQMSKHMc2wkq+qWBti/BYq6+1u3kzuU=;
 b=ir1pwH9bZAi5MqwskYwxYLbVt0Phuh61TYIxcCyyTviQafyO5f960A+6UDHQMLBMtf
 UrvQRaT78SaKv2Sh8gMc43zi76pVKaIjmwTD28kkRyT/d+DZ2GT84fwH5amfJD+UepdC
 dVWrrtjRNQejIsK+slKsNVbAd1XeeFNwB4VqMaiv8F+BPzTY6CGM9w4eqfG3vn1/fkJG
 LF0TTA6mkFX2isnfqrfjulGffDvlUe4J6+Q5p7/BK56DQFoPMbuWZQQYvlfvnZwilaHw
 5Z1NgQhFL7Y30PNg0kO+E3dGDumQzH7HIAHgmJ5K2R4jzrP3Qyf+1Jqy2uRZ67BUl4Fc
 +YIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=tTJpqulNTalAxQMSKHMc2wkq+qWBti/BYq6+1u3kzuU=;
 b=6/BdQ9Byoa+6keAexZooOwwL5vjcwJhyVqjdtFlVU6lCY9JDDWnV1SpSa7QuHo2LeZ
 0CPECOEB8tfsRTTxj3bf1sDUeH/SDrWDBI1wyNU9kCZw+0klsmYp3Ohz8e9CZtDJrsAy
 oXpTM4mnfzraIbY59NF5dLOQ+4wxXt+cFq9P/7J+Snmrz4zBDU/pBHNQyVhvV29FgMo/
 jaPNh+UiJNnyjgBWNYcvNZrT1SqW1jcMgtsDp25+3yPg2QDVzGXgqEJ4AWkdTxflnTlq
 2mmjnk4NIsiK8CXxAXVd9N8JK+Epy3eRVUB/kuUjfqjBEcbZKG2L6TXRDdg3ottD/lee
 JwYA==
X-Gm-Message-State: ACrzQf09c0r3KDCHIozzH0xZbs0YHY3Uv7lckbxfX7He5qJbkNygrMNh
 ilgpMp0QPKBgqsycffg3e2f6rw==
X-Google-Smtp-Source: AMsMyM6zDmpIODc35JEf69VpVw6lqcdRjBvTn84wI5Myzv3DwDMbgV5pMGqaNxbYsCnFXyhBuE6ymg==
X-Received: by 2002:a05:651c:c8d:b0:26c:6ec5:294 with SMTP id
 bz13-20020a05651c0c8d00b0026c6ec50294mr950111ljb.518.1663847212613; 
 Thu, 22 Sep 2022 04:46:52 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a19f207000000b00494643db68fsm902789lfh.81.2022.09.22.04.46.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 04:46:52 -0700 (PDT)
Message-ID: <168a46c3-2c0e-cd5c-e6f1-1e072c67d162@linaro.org>
Date: Thu, 22 Sep 2022 14:46:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v7 05/12] dt-bindings: display/msm: move common MDSS
 properties to mdss-common.yaml
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
 <20220915133742.115218-6-dmitry.baryshkov@linaro.org>
 <02b60bf8-70ac-eb7b-33d7-1c9b7a6f0a54@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <02b60bf8-70ac-eb7b-33d7-1c9b7a6f0a54@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/09/2022 10:04, Krzysztof Kozlowski wrote:
> On 15/09/2022 15:37, Dmitry Baryshkov wrote:
>> Move properties common to all MDSS DT nodes to the mdss-common.yaml.
>>
>> This extends qcom,msm8998-mdss schema to allow interconnect nodes, which
>> will be added later, once msm8998 gains interconnect support.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> 
> (...)
> 
>> -  "#interrupt-cells":
>> -    const: 1
>> -
>>     iommus:
>> -    items:
>> -      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
>> -      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port1
>> -
>> -  ranges: true
>> +    maxItems: 2
>>   
>>     interconnects:
>> -    items:
>> -      - description: Interconnect path from mdp0 port to the data bus
>> -      - description: Interconnect path from mdp1 port to the data bus
>> +    maxItems: 2
> 
> I think this is not equivalent now, because you have in total minItems:1
> and maxItems:2, while in past minItems was 2.

This means that I should have minItems:2, maxItems:2, which, if I got it 
right, is frowned upon. Let me doublecheck though if it works as expected.

> 
> The same might apply to iommus. clocks look good.

-- 
With best wishes
Dmitry

