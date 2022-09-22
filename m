Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC1D5E6181
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 13:43:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED5C10EACE;
	Thu, 22 Sep 2022 11:43:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 575DB10EACD
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 11:43:23 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id i26so14150539lfp.11
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 04:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=1lx7xaWN/VMT8/i11YzeCiwWdLaukKExWKWlWB5fc9Q=;
 b=Q1uZ08uW8GXrVjelhj6kNsxoS7+Tru8zfZNaf32otIOdeavcgrNWUq202SV4j99Ce2
 oxI9WGirhH/Wm3M6waJTC4RfaHwnOm0mOnIfRTJYsDGyr/SLUZRPz5xMb+b9IiW6PT91
 vAxuX1hLXb62hrN6uYe52WCR2hUPOCHSdJpx1mDbzOCpHdm1G4l9nKRMOqh7ykgFdfkG
 BJACWbDBbpdZo2F2JIvE24LBIAvQr6H+jUxv37rw8JLawmb3I592Ra/wC/EH8W0iraju
 qHf/mHh63xpRVfckZ5UbWnyoPEnmgkgcTHCP1R0PJsc59LQwA9rQS0GNlPy7rJbcZXqQ
 sDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=1lx7xaWN/VMT8/i11YzeCiwWdLaukKExWKWlWB5fc9Q=;
 b=hvAlBxx+4knnmlC4VqydbSpwSI0QZd6IfbrFYDQuZQ2pkoxhMXlkrYk3FSLBrQC8Ur
 CuwLvZ42vEn49RTKk5UVL5bJKVaD0xOB5q9U+hj/wFt2pFMwKW4i5FWyHS422Jaq17E0
 izwCHp1HE4Q88npo8R9yeCuhXqT5N1eH8rwKI/6/h2QO4IUhN70c9x2Aeh1ds02XHhJd
 LgCPVqz4OdxVhI178sgGBEbPz5eooO3jKzVX3MOMd7EC9CmAt7nSim2AtPB6Zvf6UhT5
 OCm7FiH/qNPkulaOfi2qqnBrVf5WVoJyCad5kDjl4o5yvstGbkYPHs3KSbxIwHwe1baK
 /rkQ==
X-Gm-Message-State: ACrzQf0Wh6RrEnTYopJCBHSWni25mS01H9f8mBDVnoboj8bi5vyDzIAg
 fDwAhEegh2I6ODWeQrPQc9BTuA==
X-Google-Smtp-Source: AMsMyM46dIlSnT/FPiZ4S2E2DFV1GZWwJCBpSvCVWpvp9jDqnOzHv2fDk5DIuwCTyqM/D5NNOBSN9w==
X-Received: by 2002:a05:6512:3295:b0:497:a156:795a with SMTP id
 p21-20020a056512329500b00497a156795amr998895lfe.345.1663847001671; 
 Thu, 22 Sep 2022 04:43:21 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 b20-20020a05651c033400b00261ccf566e3sm848937ljp.65.2022.09.22.04.43.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 04:43:21 -0700 (PDT)
Message-ID: <01baf27b-8257-aa08-d61f-a427c5056715@linaro.org>
Date: Thu, 22 Sep 2022 13:43:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v7 05/12] dt-bindings: display/msm: move common MDSS
 properties to mdss-common.yaml
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
 <20220915133742.115218-6-dmitry.baryshkov@linaro.org>
 <84c599c7-421a-78ed-b33e-ce1a4bd4356e@linaro.org>
 <CAA8EJpoZbNEiThZMaSCSML-x=TtXc8t8L-yvLZYDbR4hpvigXg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAA8EJpoZbNEiThZMaSCSML-x=TtXc8t8L-yvLZYDbR4hpvigXg@mail.gmail.com>
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
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/09/2022 09:53, Dmitry Baryshkov wrote:
> On Thu, 22 Sept 2022 at 10:05, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 15/09/2022 15:37, Dmitry Baryshkov wrote:
>>> Move properties common to all MDSS DT nodes to the mdss-common.yaml.
>>>
>>> This extends qcom,msm8998-mdss schema to allow interconnect nodes, which
>>> will be added later, once msm8998 gains interconnect support.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>  .../bindings/display/msm/dpu-msm8998.yaml     | 41 +--------
>>>  .../bindings/display/msm/dpu-qcm2290.yaml     | 51 ++----------
>>>  .../bindings/display/msm/dpu-sc7180.yaml      | 50 ++---------
>>>  .../bindings/display/msm/dpu-sc7280.yaml      | 50 ++---------
>>>  .../bindings/display/msm/dpu-sdm845.yaml      | 54 ++----------
>>>  .../bindings/display/msm/mdss-common.yaml     | 83 +++++++++++++++++++
>>>  6 files changed, 111 insertions(+), 218 deletions(-)
>>>  create mode 100644 Documentation/devicetree/bindings/display/msm/mdss-common.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
>>> index 200eeace1c71..67791dbc3b5d 100644
>>> --- a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
>>> +++ b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
>>> @@ -14,20 +14,13 @@ description: |
>>>    sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
>>>    bindings of MDSS and DPU are mentioned for MSM8998 target.
>>>
>>
>> missing allOf
> 
> Rob asked to remove this while reviewing v6 ([1]). And indeed the
> allOf's around a single $ref do not seem to be necessary

He commented on one of properties, not top-level, maybe it is different
case for dtschema. In the past it was required, so are you sure
something changed in dtschema?

Best regards,
Krzysztof

