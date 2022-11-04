Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AF76198C1
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 15:06:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 557F710E7E3;
	Fri,  4 Nov 2022 14:06:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E33F110E0C1
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 14:06:07 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id x21so3118873qkj.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Nov 2022 07:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uonN8nLloddhG+zjfTG2JodcK/vkMjXLFVPtg7RTwWU=;
 b=bHUgrJDiiUPKvAYNL1QAYnKS5yc0NP9689zoDl0d5eH4u/GM81pa/AzAmScwJv27HK
 sWENEgZ2Vs+ikknRhHhgc55AM+hm6KxgSklQKahiOMHgTraJMHF4SVLNqaWUvqwU6B8o
 jy63ynU8txB7Ri1NmClyahI84lm3Jt+0ClQ90+VMms7DIediHZvbU1b3ezGgm7fsHhhM
 p6yjhcXSs2xQZ4/WDr41xpQdlAXaZEbATINjKouS+hEjI+FmqG9whzslaTJqQJOzQJkh
 4dcA56xqp+l3v8+lSlkcEJpZcdLOjpL73K/qyoHs2kLOsyuIuu/wUra+6Zbg5NMIYr4e
 dqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uonN8nLloddhG+zjfTG2JodcK/vkMjXLFVPtg7RTwWU=;
 b=7p9EuVhrVpBWoTPv6ZDGJTPIRVDydQLdIlTvTgxW9GIYhOV09GzI7S4SQ7psvtFQp2
 +A7wtNnsfMOW2niVuL3EnMGTcMUMKfV0AxNBMgS1LGlKJHuGXklp62JWlYpb0gJyjZbf
 2CAXceZue5eXFrm6YxJm6jq1boQih1kzkTdDvS3t+gYLP2ILD4jDXVi1CKLlYFexX1FT
 pWP2ZLpF8YtgUcZhZ1QLYSBKumcMGtCjNyjmAEPZOrhz2zowq+sQKf/H8QUKGJOhCsnq
 rsHmpNPgeyu4Hio/8OSWmq8q5pXnTVlqGMSdX0GMiEPXQ1TEHzcXDAu2N1r8TKBjhtHO
 h2zQ==
X-Gm-Message-State: ACrzQf0KyFUQldUAeyIrHB3lJhXgysKrtNKzFKBYrpkH8YM6zAF0wh7c
 l6MhDWQKLLgMBssCqQ6l2jt2PA==
X-Google-Smtp-Source: AMsMyM5bwGeqbh2zIZuzZH/uSQDVIlrHtpKBpppr2G3iSgh4BjF2kRkQwYGsZb0VStA7G0pHxGsQpA==
X-Received: by 2002:ae9:f406:0:b0:6fa:395d:1480 with SMTP id
 y6-20020ae9f406000000b006fa395d1480mr17884072qkl.555.1667570766756; 
 Fri, 04 Nov 2022 07:06:06 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:aad6:acd8:4ed9:299b?
 ([2601:586:5000:570:aad6:acd8:4ed9:299b])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a05620a25d200b006fa32a26433sm3067660qko.38.2022.11.04.07.06.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 07:06:06 -0700 (PDT)
Message-ID: <2d4069f6-2c61-15e6-a7f8-64bddfc9fc1e@linaro.org>
Date: Fri, 4 Nov 2022 10:06:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] dt-bindings: qcom: add another exception to the device
 naming rule
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221104132316.1028137-1-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221104132316.1028137-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/11/2022 09:23, Dmitry Baryshkov wrote:
> The 'qcom,dsi-ctrl-6g-qcm2290' compatibility string was added in the
> commit ee1f09678f14 ("drm/msm/dsi: Add support for qcm2290 dsi
> controller") in February 2022, but was not properly documented in the
> bindings. Adding this compatibility string to
> display/msm/dsi-controller-main.yaml caused a warning from
> qcom-soc.yaml. Fix the warning by adding an exception to the mentioned
> file.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom-soc.yaml | 1 +
>  1 file changed, 1 insertion(+)

Thanks Dmitry!

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

