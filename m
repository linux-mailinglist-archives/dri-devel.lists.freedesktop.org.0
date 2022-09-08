Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 369025B1F86
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 15:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E99610EAF4;
	Thu,  8 Sep 2022 13:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 282E010EAF4
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 13:45:12 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id i26so12060430lfp.11
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 06:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=K1xmDVRthzjWOyGdohyh7MTbGHYJ56y8iv2a+1Z9WWA=;
 b=glmTnUvQVW1uqDE+SIQR6OQTqacwnemf/++69ByqHqFoPKpvfWKjnVXG693OpsVwCz
 evrZ9cHAUSR15MD3Qhxlxm6aKc6BS2rwbcD1L0n/peFMwzKOY2Wn6j7cyYf5RWoYkNfw
 kZy5tNDdvljlF1lqn0shBkeFtWThGify00/LQQM+V7fJzy1zBzAk4Qxfmxx29pKhXK2X
 RP0GzqcFPAYABc2ClmW8KcNTI7xs8ZwBPTcKGtCX/4IOSjQabQnSxKzd87MYyAO6GE3w
 4LLqOdTT6uSf5f2cktCrzaZ8O8mMVixqHenirGCoHiLFupS1cYx+15sq4Pz7O1dQ+5s5
 YIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=K1xmDVRthzjWOyGdohyh7MTbGHYJ56y8iv2a+1Z9WWA=;
 b=JQEzvla0/89enDQNL5USoz4omjCd+IaKQ3X2EELB5Iw8SxQwB++4VRF6sXSUFuoaIB
 CMAK/VrIg5J4Ke7RWAOEj1ZjCVwH6si2+7cHze1s3O3CCVEw2byq8trVm+1Vm8qgCgyv
 Uy3a3n3LpPltQukZFYSrbeJgndMAf9obBEZpq87b2zPn/1daz3FlgLPMPp8RcrOfI4v1
 zfOPOkRKVzXf0X4O/4XSmMbKnlqvwTN+LCq6Eo4mrSiqliXmOPtx/MMht63YI89zSEhZ
 11asSYmLmK0ULFifBZcIK3iB5SXt2NS8lUV1HbGndsN8ZbklPMyBoAvCZ7LX06lg9XQD
 9qbA==
X-Gm-Message-State: ACgBeo0QLg8Exy4hikfpl8pylYtNq9uMr+GcDhh0SgrfhvM2YzI3g15A
 7JVx5xvGsfFrC1UhfJdy6+cJyQ==
X-Google-Smtp-Source: AA6agR5CtptxXfFJSh01xzHCz5Gl5OhOa7Mv2/Z7XGiY7IevgY0ma0fyIsjVbbpb86bTnvY5hu89xA==
X-Received: by 2002:a19:d611:0:b0:492:8e15:ba18 with SMTP id
 n17-20020a19d611000000b004928e15ba18mr2710698lfg.524.1662644709634; 
 Thu, 08 Sep 2022 06:45:09 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 m3-20020a194343000000b00497817b8ebbsm1672669lfj.134.2022.09.08.06.45.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 06:45:09 -0700 (PDT)
Message-ID: <d8f173e6-3c0f-f7d7-573d-db91d9cfdb75@linaro.org>
Date: Thu, 8 Sep 2022 15:45:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v6 06/12] dt-bindings: display/msm: split dpu-sc7180 into
 DPU and MDSS parts
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
 <20220901102312.2005553-7-dmitry.baryshkov@linaro.org>
 <92e18257-9a95-9366-ffff-416d27039c3b@linaro.org>
In-Reply-To: <92e18257-9a95-9366-ffff-416d27039c3b@linaro.org>
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
Cc: devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/09/2022 15:44, Krzysztof Kozlowski wrote:
>> +  interconnects:
>> +    maxItems: 1
>> +
>> +  interconnect-names:
>> +    maxItems: 1
>> +
>> +patternProperties:
>> +  "^display-controller@[0-9a-f]+$":
>> +    type: object
>> +    properties:
>> +      compatible:
>> +        const: qcom,sc7180-dpu
> 
> You have now schema for qcom,sc7180-dpu so just reference it here instead.

OTOH, I think it fits your other uses, so it's ok.

Best regards,
Krzysztof
