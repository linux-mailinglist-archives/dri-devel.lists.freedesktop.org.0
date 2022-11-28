Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5025463A6F0
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 12:18:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 261E210E201;
	Mon, 28 Nov 2022 11:17:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A5C110E203
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 11:17:50 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id s8so16803557lfc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 03:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tBmx5gM1HUSGFAXNgKvH4/Z5Wwc3nSXAxC+/qB18ydM=;
 b=d8P29DNgM6zk6DvP7foPnQjFiGLcCG93PrYsmwjoD8PgpUNBVhDBgt0/jB4jfO5EqJ
 zwd5pAIcXybs3emROmpUpWQa4JcAKQSq6m5VejGtL7+pS/AcM6C7HlCmgqBx4X+hdpI6
 NccIZqwOZln0jwHauWRITUW7BT1RwqzurcDPm+3RPqxlnoilCG2lMwc+2PHcjyQ8PIs3
 c3zGNfyCh0oI/aYqSzENtxM4vSeOC9F+AiZo3cdMbDzS6ccdXf4aIhMtbfJvWl6zOdp2
 LI4mxl4i0qUpKXtOZ/fgSKHIkicqaXcp7AlonvlUHTorWvcbLk2UOPLIc4nKCwo/GxJX
 RilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tBmx5gM1HUSGFAXNgKvH4/Z5Wwc3nSXAxC+/qB18ydM=;
 b=aoJRDAYCntUPG3QzomCXybfYArd4MbKeKUVne29npLH/RY+r+LD5XSQkj+8C5Rm92g
 eqOS3tUsQzYvduoedzvObKFAcDLn/mOE61rFW/0b/crWjDFva9tzBlGJRFIQuSFDtuJr
 TebZmmJnQ2T5bdVDEzjGYYusx0mbtcSfF13j3tu/XgvogQxCfQMfSAvwUOIWYEWRq4Us
 th6h2CDVNw8fZFQEOQ9dDhE+Ao8R1X9KlTJBVUr5g30Wk686sr6BNWOQeGYGNTYX93DO
 bnKyc1ISxEifb7Q59nYtbkguWlGxLrKkI+3N8/AC97iPkiQEeIkYMbTAKaEdCKbbSpQG
 qe2g==
X-Gm-Message-State: ANoB5pm/oafWbuEa2Lq/JOKzGcfcg8EXoLbb1VkOk0Z62in/TKYNMoO7
 CYg+SHBVmvrx7P6y7bxAaexDJQ==
X-Google-Smtp-Source: AA0mqf58DjNRcqLx332BX2KbrAmcyHS1EHrpnKwFkJJpWTuwx5iOEtDmizl4E6ASsmL2TwdG887eYg==
X-Received: by 2002:ac2:4189:0:b0:4b1:2447:6971 with SMTP id
 z9-20020ac24189000000b004b124476971mr11783136lfh.83.1669634268446; 
 Mon, 28 Nov 2022 03:17:48 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 h16-20020ac250d0000000b00498fe38ea0fsm1691138lfm.174.2022.11.28.03.17.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 03:17:47 -0800 (PST)
Message-ID: <f244d3c1-e52d-8226-0d6f-58f6b5503f47@linaro.org>
Date: Mon, 28 Nov 2022 12:17:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v5 04/10] dt-bindings: display/msm: add support for the
 display on SM8450
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221123210403.3593366-1-dmitry.baryshkov@linaro.org>
 <20221123210403.3593366-5-dmitry.baryshkov@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221123210403.3593366-5-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/11/2022 22:03, Dmitry Baryshkov wrote:
> Add DPU and MDSS schemas to describe MDSS and DPU blocks on the Qualcomm
> SM8450 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sm8450-dpu.yaml | 139 +++++++
>  .../display/msm/qcom,sm8450-mdss.yaml         | 343 ++++++++++++++++++
>  2 files changed, 482 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

