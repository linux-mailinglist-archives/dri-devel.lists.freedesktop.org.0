Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8CE5A24DE
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 11:49:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC54C10E811;
	Fri, 26 Aug 2022 09:49:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A48710E811
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 09:49:08 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id n15so1321247lfe.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 02:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=UN9UNIYBZ5uGaqYCoTZ9HAq/Y6zWrMkzm6pHK+dxe5A=;
 b=L5OXYT+liCL+/QGJXKJIyiz5VcXhwEDMb5oV0Pve/89FEkMLfV3mgowMShnYIC6CKG
 b0LHap0ys0CWPTK4HJCusslBIXgYoBy9EnQsUoUBy/9xoQNLDSivlfJdAP192l7qu2Ol
 Ymk2z1OwlXV7yoVbZYOHEF3PB4yy/c+BJ+ub38cvBeSMD4tVL8UZL9PRRCl1btg7hAwR
 D4lrN31eYUG4xEZwWSOFB8QSmG8EdPPmutENh90ugKark7fVWEUmQMNYgElpaKy01tLN
 QybG5XMkIqTG58E5N31Fb3uU8Q+e8k/JmkkKN4YCUgT1CQiYxoqP0Y8bezu9u4Ym+/ui
 iTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=UN9UNIYBZ5uGaqYCoTZ9HAq/Y6zWrMkzm6pHK+dxe5A=;
 b=kg4TB5+rv1lScwNSKVNnTmqqoNPbk8Tw93vxHpR3M6y7Qhbg0W1/WdHVKLnbmlB1mX
 wO7fWDtPtSRx8hyH0EgiMoVd0x8c2AygXUH1OLSvD0Sv52W3mT1SneESnJTKT9fiJn6O
 oDVkmlPmypcT6oyYZoZzeOq7VHg98Nr8j1cXGFPiikv/+b5OnVJ9TVtmhhetwgl9/NxH
 DLKGHXsXjyjGq0nFmbdZZm8YbjRPMNDuNX0Dl6Wccx+RanMbDxbDd8XMZQfRGE8eEgh/
 uDnNP0R2p0bPbTsqeWsydD/6/+KegyjbT86mU+gq/af9sE5yrq91W6HQxzfP4kTzsjec
 Gbdg==
X-Gm-Message-State: ACgBeo3Flztt/MQv4u0ulpSUJZ9MuebD11pBxppu5h/RuAPtj/3zi989
 ysjhAbAXBec6Bk+BkfeU0oe1sg==
X-Google-Smtp-Source: AA6agR6MpFJqQMrOTZPh3nHGr7fhGGF/zOA3ps/9gCfSND5LRAOU+SUC4fx2y97CPu544wYrT23ztQ==
X-Received: by 2002:a05:6512:3159:b0:492:d660:4dd7 with SMTP id
 s25-20020a056512315900b00492d6604dd7mr2101345lfi.204.1661507346709; 
 Fri, 26 Aug 2022 02:49:06 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 c6-20020ac25f66000000b0048afe02c925sm320409lfc.219.2022.08.26.02.49.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 02:49:06 -0700 (PDT)
Message-ID: <53c72da6-b632-058d-9e3d-b00c286d9e09@linaro.org>
Date: Fri, 26 Aug 2022 12:49:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v2 2/5] dt-bindings: display/msm: dpu-qcm2290: add missing
 DPU opp-table
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220817062059.18640-1-krzysztof.kozlowski@linaro.org>
 <20220817062059.18640-3-krzysztof.kozlowski@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220817062059.18640-3-krzysztof.kozlowski@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/08/2022 09:20, Krzysztof Kozlowski wrote:
> The 'display-controller' child (DPU) of Display SubSystem (MDSS) uses
> opp-table, so reference it which allows restricting DPU schema to fixed
> list of properties.
> 
> Fixes: 164f69d9d45a ("dt-bindings: msm: disp: add yaml schemas for QCM2290 DPU bindings")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

