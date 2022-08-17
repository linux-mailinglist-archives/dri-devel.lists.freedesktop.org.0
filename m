Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CE5596947
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 08:17:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA6210E1EF;
	Wed, 17 Aug 2022 06:17:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778F410F326
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 06:17:20 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id z20so12633289ljq.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 23:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=u4TyGnpFImFVWzeLtgSn9hdAlwn6xtuxeRH7ihJ09pc=;
 b=zoxAksbIBjky7k2llS1H0n9UlrANEmgCDtJqGToMTf4FNpc7pc5H/qMP8fidrb48Jz
 m9U/J/+lm6ZNP22mWbW5dKPuaBDcWtn+wgko5RkoKSFsxUmy7SN3iK57qdeP98emgtKW
 S1XnHdKOcFpaf9DKHfUsSUhwEBnZhIguQ2JDxInksCUl7JGg+G+ZXjtpQJpXFIDO2PwQ
 ukjZJp8tuF64s1a9e5Z/Q0uP+G8GQ+tZPb+Q1oKAET/JLKCUPlkgITECL96fonGaK/2Y
 cjmYkfg9/FygvwFaqPai90lxNVjwxzdEOuLQ5OTItxgS8QsKjvv/BFPrpxRMQwO6swIV
 IfMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=u4TyGnpFImFVWzeLtgSn9hdAlwn6xtuxeRH7ihJ09pc=;
 b=L4mSlnsnfAuhCNi6lnfMKheHEp2SqQyHZhyUn9uDkh6BDHYTUp61DBM2JKNqcLasra
 LGTG2phYLHaHGwPKSIDQPl5OUevUdcN71Ot3MVmBQK+lxolJo6sY38ax4WU+NHOyuvNw
 MN3KQNKwThmrdBCvSNxcZB9O6YzxLi6gDgNBKNm4DoWymPi/flgrH8oQ6ptxtLxVJsCz
 pSYZskAB6Gt2xthoMTLvchXPnRRoYqCZXgnZntcPrk4tCYEJPEFF3Cp8IJuTe15IPYLL
 PEgqBGJCNR5M3K6m2aG2MMFoFZs5xFt/doCcTEtjePZL1qbja8q4Q13c3X2Klw06RF1J
 BlVA==
X-Gm-Message-State: ACgBeo0J2cmkZtPiWEfHwh4FwzieoRb/MpvDVKjfuWfDsnuipz6gfz0T
 KFOP5TIYbYnTqsB6752uhCdCqQ==
X-Google-Smtp-Source: AA6agR4cxp1hoQnc8GR+guva3+Gp9Pvrn5cW9PIK9UFl/ZQ3hhX7zJlDtyitNNPx+HuzBRwQH0iXAA==
X-Received: by 2002:a2e:92c4:0:b0:25d:9d30:5d61 with SMTP id
 k4-20020a2e92c4000000b0025d9d305d61mr7847790ljh.202.1660717038843; 
 Tue, 16 Aug 2022 23:17:18 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1b1c:14b7:109b:ed76?
 (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi.
 [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
 by smtp.gmail.com with ESMTPSA id
 v8-20020ac25928000000b0048a918717c3sm1579654lfi.57.2022.08.16.23.17.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Aug 2022 23:17:18 -0700 (PDT)
Message-ID: <e20ebf8d-8efd-eb28-ccd1-07795feb63a0@linaro.org>
Date: Wed, 17 Aug 2022 09:17:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/5] dt-bindings: display/msm: dpu-msm8998: add missing
 DPU opp-table
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20220811084331.83715-1-krzysztof.kozlowski@linaro.org>
 <20220811084331.83715-2-krzysztof.kozlowski@linaro.org>
 <20220814212517.GA716652-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220814212517.GA716652-robh@kernel.org>
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
Cc: freedreno@lists.freedesktop.org, Loic Poulain <loic.poulain@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/08/2022 00:25, Rob Herring wrote:

>>      properties:
>>        compatible:
>> @@ -105,6 +106,8 @@ patternProperties:
>>          maxItems: 1
>>  
>>        operating-points-v2: true
>> +      opp-table: true
> 
> type: object
> 
> Otherwise, 'opp-table;' would be accepted.
> 

Thanks, I'll fix it.


Best regards,
Krzysztof
