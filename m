Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 520BF662315
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 11:22:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63D910E3C7;
	Mon,  9 Jan 2023 10:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA2810E3C7
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 10:22:33 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 i17-20020a05600c355100b003d99434b1cfso6250141wmq.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 02:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NGY2WfIMH5NbDK2UFtX7kYF6wj0td7t4Uuxyfu/a2lY=;
 b=jRWsn90HOq4cs97PbbcUF8R/IEBTYbEMDPmQDemX+kuQE4QKg2cOYPCViC/8uQL5yK
 kgPr0nbVFqlalhNEiGmjR9po/azhbEJVETY8bvqo8fnzJqd96tuc7Wojt0yx9nX3qLIE
 xF1nFwVXDb8TJ2/vCESAAdmxO/bg28kX74JMWViD7HLOzP+2F2qhkzTq0y8lrbyHNNbh
 jWHOL1WrvDDdRYYezXyI7YDVilZ6aEYslC8vrrM2pe27UiS8sUuq5Twv3Ha7CeO7p3vf
 0uVEBVXnT5tyxI6IBv7OCTrqiAcp6xAqwm92kQtDYuVen6/XioPmpxqftV6Al5cD6K5B
 2mMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NGY2WfIMH5NbDK2UFtX7kYF6wj0td7t4Uuxyfu/a2lY=;
 b=ZDR9Pd2NCDhzb1rn5L9xdp8mdqX6pyn6a4/TzR4maV1+hnptRKQwHLDWEUyl8j1oaN
 PLiNmCD/MD+A1/l4fXxCJzAuUK6DO3YVSmaht44Z3aW91VkeS7mtykKNMxyltuQ1QMW6
 IHmR9bEa33Msk+qXCszSrK2soKjHp/EeBxjev8G0bmaPBxtV0YATBt5x2j4WFQzVIAgc
 WmsoeaP9Prd1Da/uwfzEhP9t0BmriGyNesVsrlHsd2NXTQUdOEdu/xVbTG21OAXQ8Brs
 SqJDL9NN6m4nW7H4manIsRanPUSWLX6IdNDEaRQ+RT+wwwQAj0PgtMiHVixFTZpuKJlD
 kyKw==
X-Gm-Message-State: AFqh2krQ4XMBZMGRKb96xhIKndZ3+1GVREd5APio574qXKsp3lTUYKya
 gyw/0IuTTj7KRmfS55hl3uFMyA==
X-Google-Smtp-Source: AMrXdXtwhS/Hw81Hf42gN976U+RfMh+Em2M2OULImNjiCySdiWW8ppb0AHe2ByEiCDwPUU8MBLXThg==
X-Received: by 2002:a05:600c:3b21:b0:3d9:bad8:4e9e with SMTP id
 m33-20020a05600c3b2100b003d9bad84e9emr18493818wms.40.1673259752038; 
 Mon, 09 Jan 2023 02:22:32 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a05600c4f8900b003d96b8e9bcasm16860567wmq.32.2023.01.09.02.22.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 02:22:31 -0800 (PST)
Message-ID: <a6330ecc-021a-9943-1bbd-61603f40f152@linaro.org>
Date: Mon, 9 Jan 2023 11:22:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] dt-bindings: display/msm: qcom, sdm845-mdss: document the
 DP device
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230109045458.316114-1-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230109045458.316114-1-dmitry.baryshkov@linaro.org>
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

On 09/01/2023 05:54, Dmitry Baryshkov wrote:
> Document the DP controller added to the sdm845 display subsystem.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml   | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

