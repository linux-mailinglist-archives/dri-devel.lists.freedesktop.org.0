Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F5173B1AD
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 09:30:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3923910E62C;
	Fri, 23 Jun 2023 07:30:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C3910E639
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 07:29:04 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-31126037f41so366609f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 00:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687505343; x=1690097343;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=74Pt8y9BLYayYvuaPPOjFJX++4vBERPSGc1K1bOgfPc=;
 b=Y4LcbyKKH4D6Sc646yqtnsdFR8fsUfhWH/1ZHEzwtdsJ2yk8zc1Id8XVlOltQkHnRw
 QOEMIZF8lARJZ6DwtHrkXJUM5ppaxzuno9eMOajvNiVVRauJQjgfI5z77h+YaaWHm0Pb
 LIT/8+VGo1gkux9Gm0eWNJy5t2FQLi4gwjAy+/ASpPay5cTlS+kJA/Is381aaoo+z1TY
 Bbq4uJmoUVRTHpOROfa+YIir1CtWiCJQBPgcqnIhQ42xSvYK2+2KRJtNbVv+Aq6b7+c/
 7MqkFZv+o4R2+ucZPy/9fmXkuqzADq6kWRKTrQ5dkRxIZZPM8eJLdvaj6Ooo80jPhybu
 VN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687505343; x=1690097343;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=74Pt8y9BLYayYvuaPPOjFJX++4vBERPSGc1K1bOgfPc=;
 b=fyy9F+3VH8yGi/9YP7HlmedeyJV1Nw37GGtHKxxEHA3rZm18rVmUMvLkkeuJa+fzBt
 PzPXHjJCmkJ+xnB7SKchjVaDIR+2UO5Ol3XnVnPYtHp0xsVT24MbRi+TMG0HlC4CcoXT
 DvuQu6lg7IER0ipQ18uYm2/NfVcLuzB5XyKYNIC2+w0/4eB+XCrMA79ZI2gZmA4eayLl
 hvDpVdz36vnvAIXi7KnvnRxKTJWC1maDtyO71SG8A205nK40np27ue3dEYMOOi+MIxM6
 Vmgk5oA4wQsKPJZaMRefTdZN6Q8LXloZQVECBy1QJ5/AwQuZ2v+Rh7Z/uBIF+YqzZdKk
 3e5g==
X-Gm-Message-State: AC+VfDxKIs57RJ2llWRuaG3aVpsCOuTkHOlzYZg+pAezDrsGLEiDBJDf
 29BY2b+2oT02PFNkKqps/7Gehg==
X-Google-Smtp-Source: ACHHUZ5R9hJ3wXhPhvbJVcGIHlACR3cX0dSORBCPRA3xKj+G+lmLhEIxWe2HnM4i26WPrqPkabi7bA==
X-Received: by 2002:adf:f6c8:0:b0:311:d7d:e831 with SMTP id
 y8-20020adff6c8000000b003110d7de831mr15478208wrp.48.1687505343048; 
 Fri, 23 Jun 2023 00:29:03 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
 by smtp.gmail.com with ESMTPSA id
 p9-20020adfcc89000000b003113f0ba414sm8822488wrj.65.2023.06.23.00.29.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jun 2023 00:29:02 -0700 (PDT)
Message-ID: <b4b1552d-67ab-3ab4-641a-1e190ed4a707@linaro.org>
Date: Fri, 23 Jun 2023 09:29:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: sm8350-mdss: document
 displayport controller subnode
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v1-0-8bf386b373eb@linaro.org>
 <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v1-1-8bf386b373eb@linaro.org>
 <xlr3rmz7wy5o3ka6cxo2tzl3hqbnk4vkm7jsgjdhyimiyyqnfr@pjjwjg37675s>
Organization: Linaro Developer Services
In-Reply-To: <xlr3rmz7wy5o3ka6cxo2tzl3hqbnk4vkm7jsgjdhyimiyyqnfr@pjjwjg37675s>
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
Reply-To: neil.armstrong@linaro.org
Cc: freedreno@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/06/2023 09:27, Marijn Suijten wrote:
> On 2023-06-21 11:26:25, Neil Armstrong wrote:
>> Document the optional document displayport controller subnode
> 
> document the optional *document*?  Same in the other patches IIRC.

oops, will re-spin with this fixed

thanks!

> 
> - Marijn
> 
>> of the SM8350 MDSS.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
>> index 79a226e4cc6a..f2cbeb435f1b 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
>> @@ -52,6 +52,12 @@ patternProperties:
>>         compatible:
>>           const: qcom,sm8350-dpu
>>   
>> +  "^displayport-controller@[0-9a-f]+$":
>> +    type: object
>> +    properties:
>> +      compatible:
>> +        const: qcom,sm8350-dp
>> +
>>     "^dsi@[0-9a-f]+$":
>>       type: object
>>       properties:
>>
>> -- 
>> 2.34.1
>>

