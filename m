Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C44673CEE0
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jun 2023 09:16:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E908510E0DE;
	Sun, 25 Jun 2023 07:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED24810E144
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 07:16:31 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-51d884a22e7so1478513a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 00:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687677386; x=1690269386;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uIrahwiJfRblkW3SQe71HLoNxiAeifXwVotzPF1COO8=;
 b=SLN/+lBuA+L4hOibaG99ROPhT2q+4Zk1BkcUiRXl4SmMBXbIW7ZDZeuRWDY1cBg38Z
 ds8IN6Tf2v7H77bI5N82BPsA6p+sb1Lj+PSR0P8pInIDV1RTT6vqMpSWO9KEJ0hHzfC9
 PstfvAk+/fjKU2B0e7eYYEH2W3iBHla9soKb01tYlDCjDXbBy2hscxufKR4AS0Pqb0fw
 xW/pU4+OdDUQISR5H5kuYf4bnneam72K/FNMC6qv8UwrAGSJsMpE/MizlpDV4DdZLRUJ
 CLXPt0bN46dNwZB1ey2SqK6RPM+T8D3l2FMCfWMHk6CSE+YuPcm2jgpBH2tceoFZhhEK
 CXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687677386; x=1690269386;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uIrahwiJfRblkW3SQe71HLoNxiAeifXwVotzPF1COO8=;
 b=Cb7BImFO473kpE9N9So1d0j417qOaHpnGLjNeDaLp9Af4OcteFPr8KCP/0C+UEC01T
 CoFIR+NK6V9UxQ8gAo0KMOib7+bPZs9Gui69qqns9JC1S+rsDqRK3z78+52tRsSXq6Yr
 N9BN6hmsFo/ZmNyGbPm9Xzq32+qKRlyaqQu+3/AtJBzAcIUS1+mlwDYqsmvHtg3DllBH
 2av89ZDZfvuwxKJwN0ZXopP8hDMcZGPF1xd4kEpH4DL5DdLKHgMi0RncD2yzET9+Nke5
 X0GHOc5YvdUgVo6OpJdV0Q8Px5U9ijBmSrZee1mzPMJXFT1A/kHcO0TgLznSa/ENiP17
 UsLQ==
X-Gm-Message-State: AC+VfDy29v00kbbDCjjcAs6HQox74OYioQQna1HBhqZmle576M7MVW8P
 QiKl/SwxS2LxmSTT5gFngWXEHQ==
X-Google-Smtp-Source: ACHHUZ7yWmteCJ2ASXP6XlOddI/EKOWOLbTyVMMVtsIAE32VSvu1Ve67QKpbz2Drqglycme6vQHnYQ==
X-Received: by 2002:a05:6402:517:b0:51a:53e0:843f with SMTP id
 m23-20020a056402051700b0051a53e0843fmr15138396edv.37.1687677386589; 
 Sun, 25 Jun 2023 00:16:26 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 k21-20020aa7d8d5000000b0051bf6318fd7sm1440765eds.97.2023.06.25.00.16.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 00:16:25 -0700 (PDT)
Message-ID: <6be00ec7-2fab-7da0-ab47-fcaf3a1ce042@linaro.org>
Date: Sun, 25 Jun 2023 09:16:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 10/15] dt-bindings: msm: dsi-phy-14nm: Document SM6125
 variant
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-10-1d5a638cebf2@somainline.org>
 <1b40b16e-025a-c10b-e99b-404246de73fe@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1b40b16e-025a-c10b-e99b-404246de73fe@linaro.org>
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
Cc: devicetree@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lux Aliaga <they@mint.lgbt>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/06/2023 15:48, Dmitry Baryshkov wrote:
> On 24/06/2023 03:41, Marijn Suijten wrote:
>> Document availability of the 14nm DSI PHY on SM6125.
>>
>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>> ---
>>   Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
>> index a43e11d3b00d..60b590f21138 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
>> @@ -18,6 +18,7 @@ properties:
>>         - qcom,dsi-phy-14nm
>>         - qcom,dsi-phy-14nm-2290
>>         - qcom,dsi-phy-14nm-660
>> +      - qcom,dsi-phy-14nm-6125
> 
> Should we start using standard scheme, so "qcom,sm6125-dsi-phy-14nm" ?

I guess the earlier the better.

Best regards,
Krzysztof

