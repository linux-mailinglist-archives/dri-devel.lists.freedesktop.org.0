Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A68716216
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 15:35:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A004210E13B;
	Tue, 30 May 2023 13:35:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F2B10E159
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 13:35:14 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2af278ca45eso45710231fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 06:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685453712; x=1688045712;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=esrS2JrirWe4B7WnBE6lWhH7ic1H72jPQtf9dYjET/o=;
 b=eXw8hAtNcFEzRdbA87IlfYD/UEWIUiKRDrEOaqIW+Oh1wy/SbwTe74xg4Cw9oOZD44
 jxtu5hq28hAgiuJXHHlOCxSEZBOzKgamjrgtaq5RZExNE99V+2bL3CFDf0PNIuk+juZy
 Xy9eNTiEsloqmBsu9xvJSq2XsCjtNgJrKo8riJ6Yhxy5/gxUOl5iV+dnhvKjks7bE1+P
 QWKv6xbRj8HEL0Zh/CIVh9+XboOWcY/AOQrVQP0lQOonHr9X+1R7ibeEKHPZhckB0ubE
 P8P8EjOKhNlfQHmPCVWBQjsPz65DidJlM0WjyIc1jGg8yYq/tEWKPjb9DsxRyywwECyp
 JqSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685453712; x=1688045712;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=esrS2JrirWe4B7WnBE6lWhH7ic1H72jPQtf9dYjET/o=;
 b=Ffda1jf/LtCStreNwjBnAjwrIjMFVCmq3Blt19yCXfOYTWNFqwXgRYvpz9r+8tIFIC
 vUfwWIbTdkgyfj1KBj/+i/eKYegrUUAv7I3JAYSoUKtWLHJVJQH9BjFmvDMSnd6v+unh
 +uy99fn6N8/5k2s5YKDllrCyEOHaxgEK0mV0nsu8qP0n+hbfWr8qBXv5U6ia8fZfKn3f
 gNLuGoVnO2kT8dBCe6mvHl9UMQ769ptYqc88kRa/cs04jAGQBgR/IWHvZCEQJZeoZ8mv
 MlxAIkdmTTeuR7LTSEHih+VeoTMyp+YC8DnAFX3WRf7jfXpPryaAaN2oexggB3jw+60z
 SHoQ==
X-Gm-Message-State: AC+VfDzAEPLhD/e6LzPe0P1DuwGegqT0I/rkf99eBahCAc/I7MmUmvai
 Oum58uyndWR1EWFiKwDuwYqvdN3T4va3hviQnPg=
X-Google-Smtp-Source: ACHHUZ6xGZT7dZoyXIAnGa1T69qsx8GwAAc7QhVXrx+prNUPgYI6GaaLc4rWjbqmvjFDHNZ3LgrWog==
X-Received: by 2002:a2e:7301:0:b0:2ad:8f4a:1e52 with SMTP id
 o1-20020a2e7301000000b002ad8f4a1e52mr809175ljc.30.1685453712183; 
 Tue, 30 May 2023 06:35:12 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
 by smtp.gmail.com with ESMTPSA id
 m25-20020a2e97d9000000b002a8b9570403sm2866179ljj.31.2023.05.30.06.35.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 06:35:11 -0700 (PDT)
Message-ID: <1ceeb56e-3efd-6858-358a-bd1976c625b1@linaro.org>
Date: Tue, 30 May 2023 15:35:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v8 01/18] dt-bindings: display/msm: gpu: Document GMU
 wrapper-equipped A6xx
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
 <20230223-topic-gmuwrapper-v8-1-69c68206609e@linaro.org>
 <20230530122652.lct6tk6zseny6gxl@krzk-bin>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230530122652.lct6tk6zseny6gxl@krzk-bin>
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, freedreno@lists.freedesktop.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 30.05.2023 14:26, Krzysztof Kozlowski wrote:
> On Mon, 29 May 2023 15:52:20 +0200, Konrad Dybcio wrote:
>> The "GMU Wrapper" is Qualcomm's name for "let's treat the GPU blocks
>> we'd normally assign to the GMU as if they were a part of the GMU, even
>> though they are not". It's a (good) software representation of the GMU_CX
>> and GMU_GX register spaces within the GPUSS that helps us programatically
>> treat these de-facto GMU-less parts in a way that's very similar to their
>> GMU-equipped cousins, massively saving up on code duplication.
>>
>> The "wrapper" register space was specifically designed to mimic the layout
>> of a real GMU, though it rather obviously does not have the M3 core et al.
>>
>> GMU wrapper-equipped A6xx GPUs require clocks and clock-names to be
>> specified under the GPU node, just like their older cousins. Account
>> for that.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  .../devicetree/bindings/display/msm/gpu.yaml       | 61 ++++++++++++++++++----
>>  1 file changed, 52 insertions(+), 9 deletions(-)
>>
> 
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
I think it'd be beneficial if the bot diffed the output of checks pre-
and post- patch.

Konrad
> 
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
> 
> Full log is available here: https://patchwork.ozlabs.org/patch/1787121
> 
> 
> gpu@2c00000: compatible: 'oneOf' conditional failed, one must be fixed:
> 	arch/arm64/boot/dts/qcom/sm8150-hdk.dtb
> 	arch/arm64/boot/dts/qcom/sm8150-mtp.dtb
