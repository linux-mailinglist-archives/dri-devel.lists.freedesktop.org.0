Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF0A661AF2
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 00:09:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44FE410E217;
	Sun,  8 Jan 2023 23:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C80310E041
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 23:09:15 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id m6so10413187lfj.11
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jan 2023 15:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aHTsVemuZVdFBAOVhXekZDJCYjSFOYswDw57t68u+B0=;
 b=E2SiNKam01JLHyR4YRcH3H1AOyoxfAJhrsUEL3HMNuBD+T7O86muHUbPIhyNqZQBoO
 1x/8Cw6EqmvH06RHDUxYKdOzGPVvE/xCzYBt06+jNisp5GFGBCG6lqt5mSO2Rpw+DXlC
 r3eI8fWwaZaUuXyG8DfTWFX4LNaVIgFcmz89idXaf+yDGRPAR04KNrGX/+qx2kdJ2XXT
 cD51OX9AHyyVCX+66fWArOO5tf4UlR9o5d3NQwyN9X9VwgzmEGcvugECShDPCzEE9WWH
 flF6GB0BesE07Jh1AXla68inOUmM4U/QE1/LsBR+Wh+5wC57CisuUJqrxQk0pcXMPZeH
 v5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aHTsVemuZVdFBAOVhXekZDJCYjSFOYswDw57t68u+B0=;
 b=hAYv/J0Rb+CzHGMsoGwuGZsErtek3DbmJe5cix+4Yk+FcjkmOTCAXvyjyjLtXVi4hR
 AJUZ0sJ4A3EM+lcYehxaL+d4nE2S4P+OfSy4qkPuo1KXqLJeCYJcxjSSjokdLwKVRo/A
 Ugon+9hNO6e84qtz38GE08UdKuC3MJJd0jQej6Z6ayxSg/LLoCeI609M6UBdjuC+3IXD
 WF5WjdmQ6mIl+xJ9BiuCRxXK/Usj9VjXTI7jMvmsHPEbMzsQ94jW4uPI1mwcsMkhcdM+
 c/yNZuaJ9oOJwjlSgDVknFxktajqIsAxj0PDJqH6+gGEiKvhetoQTxD4fp4flZxipgkv
 W9FQ==
X-Gm-Message-State: AFqh2koEF9Ff5I1ixSdgjJoltNuybUpXQGkE4CWbNzWdt+z5ve2rMXB7
 eGA0Bvd6GqUin1jvHA9LwiCMVQ==
X-Google-Smtp-Source: AMrXdXt81nlX2Mx4LeY8PwzwnMFJQKhvqwBI2Cbzu5dcQTpAyBJCqJ+hXQu2QCpa6S1il70ht/ItqQ==
X-Received: by 2002:a05:6512:2344:b0:4cb:90d:41b1 with SMTP id
 p4-20020a056512234400b004cb090d41b1mr15158956lfu.56.1673219353295; 
 Sun, 08 Jan 2023 15:09:13 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 s9-20020ac24649000000b004cb02ed464esm1256597lfo.196.2023.01.08.15.09.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jan 2023 15:09:12 -0800 (PST)
Message-ID: <5f1a846b-d536-f013-f311-2773945317bb@linaro.org>
Date: Mon, 9 Jan 2023 01:09:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/6] dt-bindings: display/msm: document the SM8550 DSI PHY
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v1-0-9ccd7e652fcd@linaro.org>
 <20230103-topic-sm8550-upstream-mdss-dsi-v1-1-9ccd7e652fcd@linaro.org>
 <f8c8076e-2ac3-f67b-7641-d0c324784cb5@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <f8c8076e-2ac3-f67b-7641-d0c324784cb5@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/01/2023 17:41, Krzysztof Kozlowski wrote:
> On 04/01/2023 10:08, Neil Armstrong wrote:
>> Document the SM8550 DSI PHY which is very close from the 7nm
>> and 5nm DSI PHYs found in earlier platforms.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
>> index bffd161fedfd..f72727f81076 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
>> @@ -15,6 +15,7 @@ allOf:
>>   properties:
>>     compatible:
>>       enum:
>> +      - qcom,dsi-phy-4nm-8550
>>         - qcom,dsi-phy-5nm-8350
>>         - qcom,dsi-phy-5nm-8450
> 
> Poor patterns once allowed like to keep growing... I commented here:
> https://lore.kernel.org/all/ccbb47e4-d780-0b1d-814e-27e86b6c369c@linaro.org/
> 
> so let's wait for response about other compatibles.

I have fixed 8350 & 8450 while applying. Please rebase on top of 
msm-next-lumag-next with fixed compatibles.

Note: the DPU changes are not yet part of the msm-lumag-next.

> 
>>         - qcom,dsi-phy-7nm
>>
> 
> Best regards,
> Krzysztof
> 

-- 
With best wishes
Dmitry

