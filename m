Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0925E8AF1
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 11:32:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1236210E5BF;
	Sat, 24 Sep 2022 09:32:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC9710E5B7
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 09:32:35 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id p5so2409858ljc.13
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 02:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=UhfSf2CMm4aexoQYjsSQyZk7bwSh8tin0SfTbWRZyJk=;
 b=eG+FiDWiXDILhdt2T5wwU6v6nOoldLYauzCBreGoqTOEP86dJrJ/0Ameg5TWcLPNT7
 eVPHgVYQqoY9ByHNPsNKodEE8eLQK9rxHq+Z0lBbbo/gTvGWtGiDHSuDQKJF8dluYDs7
 HBJoivDCZxCHjGyHZjBhiQiYVbiaEQxe7yfAg+HyJmQFbe41aSuaIwbOKQNp6BuIxaDV
 L02anBuSUTtFr2VkyBUI7VMQSCAfsrUcSNzsr2s7gF0eI1BOjRqAs37hhSAsgWKsnW0a
 uKtKjs/ta+HCGE8i3BLrcLOOlZlkKfOHUc4rt5Bi/ISAf07sttdS0W8dEadJNqP+CVXK
 mpMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=UhfSf2CMm4aexoQYjsSQyZk7bwSh8tin0SfTbWRZyJk=;
 b=ev9kOTSgPFNcQnEVk7wIE3fVA7ohf7Kt3jM0QQpXWrRZs0CkwqBWAR98H21YeqZMm/
 3Vs7M7+iQAml222Xxff54O7cRyEMTO6uL9OjWQ74RE5CHCtGY9lDRjRPRB2MIfbCneza
 0Hn7BfzBMBi0aXjJl9VA4dbAxnLLYDJHoW7rwf9Y5JNZQ4M4gLMsQSjZdWj9aRWCYSMu
 ZVJ2WykIxLAYpiFyNEfBFJFSKJZg8b3GTGtxMiLHqR5s3TzcHnYjvSzYN1FQcIAnrB6v
 LwTP2AqfANdpwUKOFzu9Y8ZKbJImxQ8Ipu7XuyxE9ObpmfLUexJsGGsg3+fPndOBsJ49
 v9eQ==
X-Gm-Message-State: ACrzQf0XufyLoNf9c98AXjp7O6RhgCd82I0p4Y0AozB/JysrvLuldhH0
 hxbeyVdBcvfe1wUnqy6S8F8N0w==
X-Google-Smtp-Source: AMsMyM7N1dwXNw/7q6ugVHeYBN9H8X5Ecb3R5C2y44tiRaC/BlIhfA/m0WqD9TEQf7puKdFubvub0w==
X-Received: by 2002:a2e:9c2:0:b0:26a:cbe5:21ae with SMTP id
 185-20020a2e09c2000000b0026acbe521aemr4418978ljj.354.1664011953866; 
 Sat, 24 Sep 2022 02:32:33 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 k4-20020a05651239c400b0049908e21e26sm1830317lfu.253.2022.09.24.02.32.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 02:32:33 -0700 (PDT)
Message-ID: <4eabf0bf-cae0-5457-7b0e-3a9991402de6@linaro.org>
Date: Sat, 24 Sep 2022 11:32:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 9/9] arm64: dts: qcom: sm8250: change DSI PHY node name to
 generic one
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
 <20220924090108.166934-10-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220924090108.166934-10-dmitry.baryshkov@linaro.org>
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
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/09/2022 11:01, Dmitry Baryshkov wrote:
> Change DSI PHY node names from custom 'dsi-phy' to the generic 'phy'.
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

