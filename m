Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A363068BD06
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 13:37:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3DE10E3B2;
	Mon,  6 Feb 2023 12:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6666210E3B2
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 12:36:59 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 f47-20020a05600c492f00b003dc584a7b7eso10645995wmp.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Feb 2023 04:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=e1/W4vRspGFqPKyfZ9iLWstpJUiKCT/PotldFbMIbXE=;
 b=YpnQj+Qewd739lMDk8Qj0AGFdVsu+mcPOF7zxKNf5Mu0W1wJpDEhdV70krq140dGs8
 xQAEq02J6OJvKh1zfvqxZCcstAdsb2OS+mwZTj9gjpQ0OBY8+j+7Bz3fjnw7vj7iCc3K
 sSv1ESPOhOTx1A4ixr3Mj3GvfYbJTiiSXv+STuEfl5qfC1D792LBeleX+IsdT5A+WarZ
 rMviQdHyMMd58wSkcdRXurpJVAwF4HUu3+s+X+hC8so7QFqHaISxIUxw/HEsUA43BEqE
 h33LFR+MtNGlHwoEJhanuEP+2jy1LhiO/8St7QXD3TrppBL+vz2AYtUZguhrDKkL1ovn
 JAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e1/W4vRspGFqPKyfZ9iLWstpJUiKCT/PotldFbMIbXE=;
 b=xdtkI3mBY3/3CXEAmKbutZOjayW8bKFbvadxmFplzo+qae/oY2ZNRIJbxhY9SGpD75
 MW0dBIY9bnIAAjaYxtGKizQx921/w4JzKxWEMATcBcH8NAZhRrZ5F5lGA2jvb9nEsuvZ
 sk+eG+/8C81DGWbcKnafDCzfw7xUL8P1hez09IA9bdDjHg3yQEw0uMv56Oj62te6Eq/q
 yWHXMriHgkksVhRFuevXqIkoA//0NtkX1eDZqZrV2Vq3I2YTbY5rOMKPpUb41Xd2uxgb
 SiZChazZZy1JGoBJo/HZKdpnJlRClR/8r/UujmZqLJakaqqi8+rDgXPR2ucmo24T3KNM
 A5mQ==
X-Gm-Message-State: AO0yUKXSjZgwzUPWzB6swAMorosuPARaW/a9hEWLR02d+1JDAoCbPzBz
 R5JasEMjxfNDLRvZcaqhBLFloA==
X-Google-Smtp-Source: AK7set9fB0Ww3UvqTSLoPFgsNKMOmP1EKVTidKJRXRsxAwbBRtkjfrHPrMf9DpUSFF3AM0gXH+e+TQ==
X-Received: by 2002:a05:600c:1e89:b0:3dc:5b48:ee5 with SMTP id
 be9-20020a05600c1e8900b003dc5b480ee5mr19017077wmb.2.1675687017918; 
 Mon, 06 Feb 2023 04:36:57 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:f03f:3ced:a369:d884?
 ([2a01:e0a:982:cbb0:f03f:3ced:a369:d884])
 by smtp.gmail.com with ESMTPSA id
 bj24-20020a0560001e1800b002bded7da2b8sm8864067wrb.102.2023.02.06.04.36.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 04:36:57 -0800 (PST)
Message-ID: <56e3816e-c317-1772-1ef3-aeaa9ef0c890@linaro.org>
Date: Mon, 6 Feb 2023 13:36:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/5] dt-bindings: display: msm: dp-controller: document
 SM8450 compatible
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v1-0-f1345872ed19@linaro.org>
 <20230206-topic-sm8450-upstream-dp-controller-v1-1-f1345872ed19@linaro.org>
 <f1665a8f-5b5b-7d98-a94e-d1b1df04afdf@linaro.org>
 <a2ad7b78-d848-df9d-2646-476cb306c505@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <a2ad7b78-d848-df9d-2646-476cb306c505@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/02/2023 12:20, Dmitry Baryshkov wrote:
> On 06/02/2023 12:33, Krzysztof Kozlowski wrote:
>> On 06/02/2023 11:17, Neil Armstrong wrote:
>>> The SM8450 & SM350 shares the same DT TX IP version, use the
>>> SM8350 compatible as fallback for SM8450.
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>> index 0e8d8df686dc..98bae326e655 100644
>>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>> @@ -25,6 +25,10 @@ properties:
>>>         - qcom,sc8280xp-edp
>>>         - qcom,sdm845-dp
>>>         - qcom,sm8350-dp
>>> +      - items:
>>> +          - enum:
>>> +            - qcom,sm8450-dp
>>
>> Indentation looks wrong here. Testing should fail, did you test it?
> 
> Moreover it also breaks dt-schema, see https://github.com/devicetree-org/dt-schema/issues/98

Yep the change totally broke on rebase, will fix it

Sorry for the noise.

Neil

> 
>>
>> Best regards,
>> Krzysztof
>>
> 

