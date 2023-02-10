Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F71C6921D4
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 16:18:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61FFA10E254;
	Fri, 10 Feb 2023 15:18:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26CAE10E254
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 15:18:48 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id dr8so16661691ejc.12
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 07:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tTrO0+Hb16Dwx8dCNpH5NI+RsYPIYieTzZZe10P29jw=;
 b=ySY7RxpaqV2HY9FGqcE2zcSd+PgtI475d+BgkR5T6WcjQdYq77wgt4IQfz4ADfeeNR
 +d3iiSH+Ukt5Htj8Ij/E7xAStZNVEvTQYKJr2dNBAQQDOgWwmvbXeoOa6y5Z6zdnvAcn
 2utD1WW/rSGvhEiJP1tpUZbaaxfL0vNaC4kxukx3MJ5e/Ys5dHJkN2KTvaQVdZCPh+iO
 54hgQYe7XfY67Cv7Ld7xnDm6SBxhWgoLoWev+s4+4yJ3EWV+2b/TAHRglaD3G+oa4FX2
 27Z7Jnq7Jyw36KB8sTLvuLbPxaplzYiHlPpHzktEdKTYTMgmVgmcJgKJulqjMJjJjT5I
 JUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tTrO0+Hb16Dwx8dCNpH5NI+RsYPIYieTzZZe10P29jw=;
 b=5pLi3rHnkeg1UyTSVQHuT8NcbvudEnfzhG0YpOfwW3gXyhA3pARAisXxGFEwNFwdF2
 YidGIu8xp6J06az+lNeVRwUAmOGxYIDNWOuPKwDC7RM8nhY2sGnTqGY2PpK8xVa9nEiu
 nCrp2gAUlT4QbCsJwWV7RVDiEIBYzsseyJW7j0hnykZdsKYvkRfNWUgNcHO8GIXIp7j8
 Px/9OXia4DYyNmCjJrTzqtmRO0221c0ICZegbAPitHANVW9uIt020pgZav05e1DIx5Bl
 szD9vlnBXbLhLje/bwxt8BJDH7PvCCmcjM9iMiEQJvAGQQ1oyJLX39ckfNSa7s42DbOt
 6C3g==
X-Gm-Message-State: AO0yUKViTPeVYSRkGRBpJj0sNA8Uqm1ptznlMQn8jV6bEWlqZ+klFIf6
 gnHlRdQ6xm0m5vug3rmb2Swq1g==
X-Google-Smtp-Source: AK7set+wB2F1D1yafXt73sb47xKeVWVy5imjwfiTNYit/QK0pZoxEzn7pYyun3egopr92hzm3yYD7g==
X-Received: by 2002:a17:906:1614:b0:87b:dba1:1bf3 with SMTP id
 m20-20020a170906161400b0087bdba11bf3mr15955265ejd.30.1676042326666; 
 Fri, 10 Feb 2023 07:18:46 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 hf27-20020a1709072c5b00b0088cdb05f1d5sm2524339ejc.113.2023.02.10.07.18.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 07:18:46 -0800 (PST)
Message-ID: <d5dd4982-af33-6f9e-afd9-61d632df7c8a@linaro.org>
Date: Fri, 10 Feb 2023 17:18:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 4/5] arm64: dts: qcom: sm8450: switch to usb3/dp combo
 phy
Content-Language: en-GB
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v3-0-636ef9e99932@linaro.org>
 <20230206-topic-sm8450-upstream-dp-controller-v3-4-636ef9e99932@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v3-4-636ef9e99932@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/02/2023 16:44, Neil Armstrong wrote:
> The QMP PHY is a USB3/DP combo phy, switch to the newly
> documented bindings and register the clocks to the GCC
> and DISPCC controllers.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 42 +++++++++++++-----------------------
>   1 file changed, 15 insertions(+), 27 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

