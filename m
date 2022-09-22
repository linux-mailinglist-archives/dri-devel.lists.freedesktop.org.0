Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA3E5E6260
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 14:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8518810EAFD;
	Thu, 22 Sep 2022 12:28:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D84FC10EAFF
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 12:28:19 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id f14so14430543lfg.5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 05:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=5SZRoMWkj7sPPK68CLRRPVikyUUuj8SEQiwVkaQJlWY=;
 b=MCQN23xBoz2SKYpzjoltuC8QA9SC1+5Ru6OFQsdFc14JZGlqhxRsf909vKHzjWm1Te
 WT/D/0SCsUz22VN1J1zOME7omOBRfg6yj8dwWUt21xjBwbWkwhOK8HZomv/ua9Oh7Wo4
 pBrfkYSh38qHgM+TIIimvhBy4xQS+eoy6+HJbXUBcXlrAQwum58MLvFoN77AfQJqhTli
 d6bnIsmj93xjXmdBNpLsQSKJ3oJJ/eb7Tl9wH4qhk17EXNDGTELUd8BDh2NChQUhb5oN
 vY4rWE+23sodZwklNhN3f38s1F+LNzFfuvWaK8+P48Kl6kHfAnuXAnYU5YzsuY4chov5
 aKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=5SZRoMWkj7sPPK68CLRRPVikyUUuj8SEQiwVkaQJlWY=;
 b=gxxBzMlfJHcW7uj/jte2DK5DWw0G8zEFksz5qjOk1r9SMvEPqQgTPu9TozWhybelPb
 oigO/fOUyJzhki5YkUYsT+SkF1JsSxKpv0CTcDboQRV21rEpM+DTzK+Jmefacif294km
 38bjgt+z74Cm/k6KlVZfknXAmoYEdBoAY6nlqCF3jFBHSWLT0QNe0/wZUW4PDoa4gk4e
 ZWzJBtXahzXvyrqJO0G+8pIW6Ni1KfgllFBLUnF7p9QAuR0X1gWCTBCy0FqStwSdCMfM
 ly9Cp3IXyUwIHdFBVWRZqp/HITClK5tLY5ivjIFitnVTYIgKx4u388hZxDE81Ei00Fi5
 H3lQ==
X-Gm-Message-State: ACrzQf1ENY9g3/kO/+oEyOwQB17BXbGpLY8pbM1lajJJkp4ybDE3rU/4
 UMP62tUQilN5oBG4FzCMc7vLQg==
X-Google-Smtp-Source: AMsMyM4wVKJ79xhrEwFdmhQEp5YX56Nc1TUep7BTcnzG89LQeXIsYvp7rQ2cqzc+hSndw9i+usfS6A==
X-Received: by 2002:a05:6512:401d:b0:496:9971:78c5 with SMTP id
 br29-20020a056512401d00b00496997178c5mr1054971lfb.337.1663849698142; 
 Thu, 22 Sep 2022 05:28:18 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 a7-20020ac25e67000000b00499b57032c1sm916120lfr.144.2022.09.22.05.28.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 05:28:17 -0700 (PDT)
Message-ID: <d2af0a8e-63fe-221f-1c53-9fe1c43fa04d@linaro.org>
Date: Thu, 22 Sep 2022 14:28:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v7 05/12] dt-bindings: display/msm: move common MDSS
 properties to mdss-common.yaml
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
 <20220915133742.115218-6-dmitry.baryshkov@linaro.org>
 <02b60bf8-70ac-eb7b-33d7-1c9b7a6f0a54@linaro.org>
 <168a46c3-2c0e-cd5c-e6f1-1e072c67d162@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <168a46c3-2c0e-cd5c-e6f1-1e072c67d162@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/09/2022 13:46, Dmitry Baryshkov wrote:
>>> -  ranges: true
>>> +    maxItems: 2
>>>   
>>>     interconnects:
>>> -    items:
>>> -      - description: Interconnect path from mdp0 port to the data bus
>>> -      - description: Interconnect path from mdp1 port to the data bus
>>> +    maxItems: 2
>>
>> I think this is not equivalent now, because you have in total minItems:1
>> and maxItems:2, while in past minItems was 2.
> 
> This means that I should have minItems:2, maxItems:2, which, if I got it 
> right, is frowned upon. Let me doublecheck though if it works as expected.

It is frowned upon only if it is alone, because for missing minItems,
maxItems implies minItems. Here you have minItems in other schema, so
there is no such case

Best regards,
Krzysztof

