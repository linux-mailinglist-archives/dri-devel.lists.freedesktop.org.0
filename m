Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D68C45E8AE4
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 11:31:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 807CD10E5B0;
	Sat, 24 Sep 2022 09:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 877EE10E5B7
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 09:31:41 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id j16so3735315lfg.1
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 02:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=5rscM5XvwmdOxNPQZNzAl1dOmorwIbTtRyq4vefSzdw=;
 b=I3AXROfcmn/zW+lyqq6w9e4NE06ugN5ta6kw5Egi/4FmWZhRw2eXUCNhvji1qW9OlM
 4RmWMYhNR1k8xR1lC5LDSpX8ufC/IRbVWjiM1YnuP0tR76YmcspCDvUYxEDXwMOmQ7Tf
 UsyLtgJ6+4BxtqZ3cCHUoc+cNd3jtBwnriOiSSXOsdffHjMSgvIaE92NvIs9UYCo3bkx
 1BQJnMhQpPx/vwKkQ6WJpJS550uhzZd6iSxqpGWG5wIMD8QG01NVNbRSgN9uEuGKJcKu
 OcheYCC/A1mSdiN1AxztvLckKQpEG97jnKtLHzbFgpourCCbt3D5Ue1RJjmlVX/PMxw7
 IjOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=5rscM5XvwmdOxNPQZNzAl1dOmorwIbTtRyq4vefSzdw=;
 b=2tcCa1Xo68300BeV5Vv7zg9aL8/kKoxlEqe7cl1xna6eD9u9+XCx/xBzfVTYFLnfnP
 OJAcxdji4xDU77o3LijLBKyCrNyrBO/SqjyeDTdz9zkx2GVkxuNDNc8qPCPZv7hjnnl7
 zZ7EoiFWOuQEZqdun2Q7t4F4YHL/8EUoPvNTWwhXi+eV9bJOm7UFmiAwJgvtV4fbBbfe
 NmvHnzVsRDqx3RwTiuFKyOd7q2Emf2usoideXmcDlOgyrXoJMwrsm/3n6jl28MkRRof9
 c8l/V3LY8eBDxxVworgeKbF6zjO9WlNjzQuJ15qL9cshpQ8gaujLC5t1V18Yj+wz6M6/
 tSng==
X-Gm-Message-State: ACrzQf0qYdsU6wJYXkUDWF2dHxb/6r5iFbSUvah+bioSvT1lLxKrKrdK
 eO2Sw0pWaRUjzJSgfB/qQZV/pg==
X-Google-Smtp-Source: AMsMyM4EC6wd5/bWnZTp6EeunB8JP70YVzB6TjbOfM1WCR3eV2z1G7Yauc1c1cLEz2Zz6asjx+JFIQ==
X-Received: by 2002:a05:6512:1191:b0:49f:220:b7d with SMTP id
 g17-20020a056512119100b0049f02200b7dmr4397551lfr.244.1664011899570; 
 Sat, 24 Sep 2022 02:31:39 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 a27-20020ac25e7b000000b004a03d5c2140sm948248lfr.136.2022.09.24.02.31.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 02:31:39 -0700 (PDT)
Message-ID: <1e7a38e7-0202-7a2a-6a41-4d4312fb76a9@linaro.org>
Date: Sat, 24 Sep 2022 11:31:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 6/9] arm64: dts: qcom: sdm630: change DSI PHY node name to
 generic one
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
 <20220924090108.166934-7-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220924090108.166934-7-dmitry.baryshkov@linaro.org>
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
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 2 +-


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

