Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0234E6ADD0B
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 12:14:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A67F310E428;
	Tue,  7 Mar 2023 11:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E7D10E471
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 11:14:55 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id z42so12705357ljq.13
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 03:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678187693;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yT7vGhUXWJk9HYJN6I+M8kwXMyH9EI24q/vmlgWv3m8=;
 b=CR/0+YSacYaMRbzWtuZLaj7mlcFerMdCQTGypTHtRsDDH/7zP+jryAMCIGgtkZj1nB
 cp7IWqzXNdM6M0RUuwFnjx7g5YHlc6Bg6zv898iLDdEVsw837xpoJufcrRzh2KRdJoW0
 lhx+4qSdJ6+YDj8o2nMSp+dhubOcpK4u9izJvnZ1nEcqm7DY9rnMRqxQUzGrPdobjKCP
 zWWDFDIdU/6ma2QAo137K5aeIYiLvPZU2SyvRK5CeuIEWnnU41t67WruJXecCVyXSbXw
 d081WmAqY29Ia63TpYuTJ1TkoswHKWmnk3oVq4/+AnAojdz7L0jDHV31Hxtthf4HCP7T
 5CZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678187693;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yT7vGhUXWJk9HYJN6I+M8kwXMyH9EI24q/vmlgWv3m8=;
 b=xmca+LPkR7o20wUi5tqvC6fdHO+S4ZIpQhCRtFTMBbDZ1f0k9UuxQkD6d3NnFsjW90
 B4rWRqKspTI8edoLh6ilwWI9sHvu+BVRJg0b6QTNmEDTCIl7mB3N+xWFFPCN7IvqMUXZ
 fnAzsrcA/4lNFeCDxtbG7BiOIY1WpkBa4Te2grPZABFrsDL8HNETqHPf/cwsce2rmr1R
 ZawWy7k/QidlpmMeysE6oKHLrW4NXqxV/B+dTGav+oix19hBMCR5FSKS3fZlU1/fdEln
 a4xRZRYMbNQwakB8By+OMgbcXOFuPFmBPbcMtyVLKzczQCbdDY+QN0AmJ0/NC/Mq3O4M
 ypKw==
X-Gm-Message-State: AO0yUKVKdg75rmH3a0k7dKr1o4d5pFJ7A/03KFSBcDSRCukjpxKeKq/R
 D2q6toONHmMciFmgarmclrO54Q==
X-Google-Smtp-Source: AK7set/Wz0Rx9XUBw7YxwDmwy1KllOxzRErdeKK9Kj5JqFHHN2PNAGXEpEi5nSFHpUfQzppg5PLKFA==
X-Received: by 2002:a2e:710b:0:b0:295:a969:d225 with SMTP id
 m11-20020a2e710b000000b00295a969d225mr3924432ljc.1.1678187693642; 
 Tue, 07 Mar 2023 03:14:53 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 198-20020a2e05cf000000b00295a02569ebsm2167222ljf.124.2023.03.07.03.14.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 03:14:53 -0800 (PST)
Message-ID: <22970751-8bc0-9cbd-eec1-cbc92f0b4ea7@linaro.org>
Date: Tue, 7 Mar 2023 12:14:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 8/9] dt-bindings: display/msm: dsi-controller-main: Add
 SM6115
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org
References: <20230213121012.1768296-1-konrad.dybcio@linaro.org>
 <20230213121012.1768296-9-konrad.dybcio@linaro.org>
 <bcb5c17f-da78-9d68-66eb-b620ee583602@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <bcb5c17f-da78-9d68-66eb-b620ee583602@linaro.org>
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7.03.2023 10:17, Krzysztof Kozlowski wrote:
> On 13/02/2023 13:10, Konrad Dybcio wrote:
>> Add a compatible for the DSI on SM6115.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> index 2494817c1bd6..f195530ae964 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> @@ -25,6 +25,7 @@ properties:
>>                - qcom,sc7280-dsi-ctrl
>>                - qcom,sdm660-dsi-ctrl
>>                - qcom,sdm845-dsi-ctrl
>> +              - qcom,sm6115-dsi-ctrl
> 
> This looks incomplete. You also need to add it to MDSS binding.
https://lore.kernel.org/linux-arm-msm/145066db-5723-6baa-237d-7c2b8fd476d9@linaro.org/

Does this.. but I guess I'll resend this as one series, as it only
makes sense.

Konrad
> 
> Best regards,
> Krzysztof
> 
