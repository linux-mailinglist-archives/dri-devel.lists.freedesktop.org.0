Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC5056B119
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 05:49:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C3AB12B268;
	Fri,  8 Jul 2022 03:47:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A52FA12B263
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 03:47:47 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id e20so5549368lfq.11
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jul 2022 20:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BqnCXi3hFwX+gJLrgLBhrt7Qzd6TSa0MoJ61QYVzy4E=;
 b=RZ3Nk0ZROIPez1V5MMBryu6/7I8uXedhc6CeNeskxvfMC+l6AOmCzTxu0UXcyQE+WA
 hMwryQtgp+UcwA1qABUjq3ntw3q9LbOUwELgVnHeCVkFi8LTNBXG6mvbpoxfCwuwu2D1
 4FO7kcJLO8vy2hdPaJP5esItiGSysP0RdgtIemR/2NDpqsEUXfs8OCcW1zw8WzqiPONF
 VUvHidXWA9T4nOXzFtFibrkMB+ojfObaYVwBdOS83r9m8oyGO91wHj1I9sbiL+vc5KFb
 0Hqr+16h9qTBSQxsSS2m9HCCncsisED12QxGN5wq3vvL8JJF9bXgpRRz/5YY7WYgwDjZ
 BPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BqnCXi3hFwX+gJLrgLBhrt7Qzd6TSa0MoJ61QYVzy4E=;
 b=bsiHaXCDbYQU+Yh3GxfAb99JG7bmU+XzjJcZSkWZcAj4cEfWCtnQx6mNWciGd6gJzH
 i26LHjtFya/p6DN/yLnRg46RgFtYBzFi73CMmf1Ad7bjQqFrWpOYWcK3AROiOH+wu9nD
 4OStHFUG2D3+8UfdRdYnsnUWoFB2u5WY5CosrMDlwYn7r/jwncJYFDmFDp0pD8LVDCSR
 myHCjGtg6UjNMUA/yzsjWqqmGYKJNq3lD8rtzkejgGJ3G6i6ZZ1duFwBUATCNzGd/dKX
 SFd/DJVoqLOrkzX1lQs3iCK6vDP1w0aq+UOrIwm9XFS32vYc9OdGz36mF5/f+0eFlRR3
 sV5w==
X-Gm-Message-State: AJIora8K/zh3EvETqDMzUl/+cC39Iwxydjwy4/tszWkOCnGpkxhfNZVy
 VHxY/j9WHbKaToz6QjWg27NWcg==
X-Google-Smtp-Source: AGRyM1sKT8szMXfjnFBIEzhyqg49K4tUUgVw6UFCa270cKcbGYd7ZsszdH/U+2dGJ/fE2ZlA+H759g==
X-Received: by 2002:a05:6512:b96:b0:489:3a4:a267 with SMTP id
 b22-20020a0565120b9600b0048903a4a267mr944515lfv.18.1657252005333; 
 Thu, 07 Jul 2022 20:46:45 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 r25-20020ac25a59000000b0048355942defsm1892032lfn.249.2022.07.07.20.46.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jul 2022 20:46:44 -0700 (PDT)
Message-ID: <b8ee5a03-1168-d5ca-97fe-f82a9d7e453e@linaro.org>
Date: Fri, 8 Jul 2022 06:46:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/9] dt-bindings: msm/dp: drop extra p1 region
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
 <20220707213204.2605816-2-dmitry.baryshkov@linaro.org>
 <CAE-0n53zV2OjXxjJ_AwCDcAZvOY+BU0-xipxQkup3muHMRCPXA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n53zV2OjXxjJ_AwCDcAZvOY+BU0-xipxQkup3muHMRCPXA@mail.gmail.com>
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

On 08/07/2022 04:28, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-07-07 14:31:56)
>> The p1 region was probably added by mistake, none of the DTS files
>> provides one (and the driver source code also doesn't use one). Drop it
>> now.
> 
> Yes, looks like the driver doesn't use it.
> 
>>
>> Fixes: 687825c402f1 ("dt-bindings: msm/dp: Change reg definition")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> index 94bc6e1b6451..d6bbe58ef9e8 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> @@ -29,7 +29,6 @@ properties:
>>         - description: aux register block
>>         - description: link register block
>>         - description: p0 register block
>> -      - description: p1 register block
> 
> The p1 registers exist on sc7180. They start where the example starts,
> at 0xae91400.

Do they exist on e.g. sc7280? In other words, should we add the region 
to the DTS? For now I'm going to mark it as optional.

-- 
With best wishes
Dmitry
