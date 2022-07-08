Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BADF656B132
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 06:01:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF3611B7F2;
	Fri,  8 Jul 2022 04:00:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F0D12B3DD
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 04:00:05 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id t24so34377284lfr.4
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jul 2022 21:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=aAubjKUK2nvZa3+RCLOOAOMis1QabrjDrjrCRAE8h/E=;
 b=qww2OpEmxQcjgXhzyViRkvjf67EADqjJIy1LBy1nME9FLCw8/Q1HrvzxEdN7ReePYw
 QGB6qXnJFoPiR3CIdkO1UdR/aAmZ0tEgvs7EiisvvKTR8Sc9YuvWqDkHuN5TZ94Qt5Fl
 NlgUPJ+8kIXh6jzraFGtchfvszL+kDbg8R46P1nGKzHBoQQup/aId1wApLfj506VoAnW
 dEEKAhPyYRnILhMD9J3qwEH6kabuBGjqbg3uxRDFON0qoyhaelgMFcddBS2UER4VFOZT
 qOBGIHmOtJAtzjfzMqowtY+0D0niWmurk+rttHduGEW9noGdfgCnB1NcO2oVizoNyUC4
 7/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aAubjKUK2nvZa3+RCLOOAOMis1QabrjDrjrCRAE8h/E=;
 b=lC2ob44O9d9VsTMtH65dH1TQB/qii1JuJjJ6e/n+lLyr128iMq8heYlV35yy29+Iyd
 a5GE4Ulch9uBzGNL53QM0YNWkLGCYrL9QofseS4zu0rPFkJVrvtwxDp4C+cM5BPviFr+
 UBfvY3FQmvvr0YQodvdG7heomDDw0uVKDAu6H2tPzcj7C2r271qjMdjF1qRL9Wu6Z+km
 FiLbH9FT4z4jcHqcZMlFSGpb0uVJYZDS/l7n9vSuhjU9Tn80S+GxBUJLtqS3kS9JJdM7
 0oyrcQIjElYqW/JvGq/PmkRA7VgsPeXwbmKTB54DHBclquK7fxtclxQ5YH9hV5sDfJzX
 /6Vw==
X-Gm-Message-State: AJIora8OwuNGRpz0KjLUpaycYmnwm3qFUeZjOQeTLCl++RWA9nDbj1cN
 6x/EMJq2HhHjeuM/pjIYS7ZfUw==
X-Google-Smtp-Source: AGRyM1vzkVpTNli+0OYoyR5TM0tYAsic8Qhv+kQwSwdOh6zSfqRjoNSH4KsvEUsAI54nceW4y4w6Kw==
X-Received: by 2002:a05:6512:68b:b0:485:f4a1:c2db with SMTP id
 t11-20020a056512068b00b00485f4a1c2dbmr1023356lfe.119.1657252743410; 
 Thu, 07 Jul 2022 20:59:03 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 c7-20020a19e347000000b004791fc12f6asm7199835lfk.46.2022.07.07.20.59.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jul 2022 20:59:02 -0700 (PDT)
Message-ID: <36a3490f-5c94-0c54-caa4-1b381dae7745@linaro.org>
Date: Fri, 8 Jul 2022 06:59:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 5/9] dt-bindings: msm/dp: account for clocks specific for
 qcom,sc7280-edp
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
 <20220707213204.2605816-6-dmitry.baryshkov@linaro.org>
 <CAE-0n53An_S5H-jj7GPorLg0Q4jW=KqEn5CCrfqs6fn6LBtGNA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n53An_S5H-jj7GPorLg0Q4jW=KqEn5CCrfqs6fn6LBtGNA@mail.gmail.com>
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
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/07/2022 04:32, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-07-07 14:32:00)
>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> index f00eae66196f..1ef845005b14 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> @@ -119,6 +111,50 @@ required:
>>     - power-domains
>>     - ports
>>
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,sc7280-edp
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: XO clock
> 
> What is this for? I would guess it's for the eDP phy, but that isn't
> part of the eDP controller, so probably it can be removed.

Good question. I was documenting what is present in the sc7280-edp 
controller DT entry. Could you please check if we can drop them? I don't 
have the hardware at hand.

> 
>> +            - description: eDP reference clock
> 
> Same for this one, looking at the binding for qcom,sc7280-edp-phy. Can
> we simply remove these two clks from sc7280? I think it will be fine.


-- 
With best wishes
Dmitry
