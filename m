Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB872617E88
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 14:57:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A48B110E5F5;
	Thu,  3 Nov 2022 13:57:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21EC110E5F3
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 13:57:39 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id x15so1218650qtv.9
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 06:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+/kbu/rTJsotk1T/v0yErGccpI1lWEa56+Z8vRnAew8=;
 b=HML+OCBooh2H/+sBWodDoJfpV2vNjt8LpB7Ey/4FeHJuM9yFcAMU8cZqgrFZehOO4j
 Ug0W9MVn6AJqbM9VOoD/Ne//K9ZvGX9vWjmSuXOi8QngNqgZ0vBdHV0f12QGgiZj18yN
 YLSOWKk+oh1ueg2tKHqHZtnMdm0XjZvFOfQCBIpcoexe+Qi8RM42x837At2Sw1RhkYBC
 wWOqp60M+Ruqi8zGsSM0uGjTHEKPhapnbZ6q9IzVJfXoGc/JXfMgEozD7ZZgnIJLnbRG
 QAslBpU8a+ypCl6hi4+/8+KC9HUoO1nH1iFqtn0ffs1V6hMPoEGAkvzlkwTTyDxoGUZA
 wbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+/kbu/rTJsotk1T/v0yErGccpI1lWEa56+Z8vRnAew8=;
 b=twJiC3Uv6lbTPPcxY5jcIDHOw3pBRVZejIJ6I6tH3H/3LXh8W9bHkUtkaubFbqf8BF
 ZR5TpIaxvccIme6SN9G4EPfxOntuOpACP/TqbEoHXe3J833MxH1Jg4euIdtXeAIEVb1J
 lqEi8e6UwFz+5l/zFSv6GAmplvdnhqFMx9KWTWWMdrtMQ8+tBiTlDPG6at7aDZ3UMNTO
 5IH9PurEEGRyfT3MqasUIqW9jxFnJ+1t2yf8zkNthjlIDGv7EdnuOqpTdc3799KHNIfl
 RX6Sry2d8GiuL4wT9vt9afebPBnL+E47ZCDLrzd0ZpMZ5jf8WmCFWTDME0TfgfkAnsDX
 PD0w==
X-Gm-Message-State: ACrzQf35t1+I7yFc2r2PAEVopGug7NBxbAKezPUaepgUrpGUq6wdhm8M
 RN0sgrjqpHqyfqHCHBPKbXkzjQ==
X-Google-Smtp-Source: AMsMyM5S6KwJzpv2ZmHdDmyclRvj2EtvS6U90ilW1CUAkEh5dEIS3Zo6SMhfCQVOBz+TbcN+eME67Q==
X-Received: by 2002:ac8:6c9:0:b0:3a5:4109:b6a6 with SMTP id
 j9-20020ac806c9000000b003a54109b6a6mr10053786qth.648.1667483857178; 
 Thu, 03 Nov 2022 06:57:37 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:a35d:9f85:e3f7:d9fb?
 ([2601:586:5000:570:a35d:9f85:e3f7:d9fb])
 by smtp.gmail.com with ESMTPSA id
 h8-20020ac85148000000b003a50b501a01sm534826qtn.87.2022.11.03.06.57.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 06:57:36 -0700 (PDT)
Message-ID: <aa116367-9cc8-7888-84b6-d5f7814554c9@linaro.org>
Date: Thu, 3 Nov 2022 09:57:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 1/8] dt-bindings: display/msm/dsi-controller-main:
 allow defining opp-table
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221102231309.583587-1-dmitry.baryshkov@linaro.org>
 <20221102231309.583587-2-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221102231309.583587-2-dmitry.baryshkov@linaro.org>
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

On 02/11/2022 19:13, Dmitry Baryshkov wrote:
> Allow defining DSI OPP table inside the DSI controller node.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

