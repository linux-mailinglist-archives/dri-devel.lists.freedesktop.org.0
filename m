Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E1A6397F2
	for <lists+dri-devel@lfdr.de>; Sat, 26 Nov 2022 20:03:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD4810E168;
	Sat, 26 Nov 2022 19:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC3A10E173
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 19:01:56 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id l8so8652731ljh.13
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 11:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zQoHlC2Pdlwgfa2bUPL9C6broHykNZtXKHJwgg+dRIA=;
 b=V9YEua+Zk7h3HYX9vVyUNTFYeQN8e1KuNXcwoXqKcfcM8pb9C/iLWFgYTldTzR0F2x
 8SfBWdusXO2qS/GuV7GAWRBldelUF3idP/EgGzU8wLkG8Jn/lc0RnUhqatxk/koDYFbK
 1cgRC9+97XDhb8ImL0cigCDazc8NkqvikWu/EKtHoDXdSoOuHN6pai24F2Yy+7+8hh53
 JYMy8/cFn4wQQooN18fTmkes6yIl6MTbO20gt9wmw0IJpd9owtrJPJ5CifzSIha8i9un
 MLPtRcWVI//3jKHo60pCWbrDjw92+040AhliWyfQXNHAlFvn+nQdYW+VB6j1puYtTLZF
 fYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zQoHlC2Pdlwgfa2bUPL9C6broHykNZtXKHJwgg+dRIA=;
 b=1Q+NTXS6FaTMEVCfC1KklcOOsvlGS9Ely6brWrNZEKbJDglk3svMtLmABbScvxzKsY
 mlmNg/ge8RnUFnwj4fEG/W4+pP1Gog+wIckRX5+zq52bAqDFrbznCFmcjbS9wa6wmiLT
 aWQOTsAKA9G1vDU9yS4Kx/sRTqLi2dyHkV7m4VZ+JUPdsfxQTQWBk4TvKQBoY7KRMZ9x
 J35JDH9PmmB/hNdHYW/BNZq577R/LJ9f92vs6lQR+XSJyMGz/KaoWkZpCMG4PqtiOiY2
 rMuFr3Xu7TuQKn3uz+Pr/rlJqEOGEq7k39H3yns48GJ5UEMtBYjMZx5n3v1d1nt26kBF
 R4lg==
X-Gm-Message-State: ANoB5pkxS6XXXNjUJ7YbjMYe18q8JJW5xTeXZCHzMP2B2BWc+gwMC0ZK
 9AYKnasRa8WUKfGRwILzB5pg6Q==
X-Google-Smtp-Source: AA0mqf7Co0RbImgxBoz9uho2nQkc5quGSLc79FmN4jaZHLDR6BOFeLLrsWAnVZNzVyida3S7W9F9jQ==
X-Received: by 2002:a05:651c:1061:b0:26c:532e:3cc with SMTP id
 y1-20020a05651c106100b0026c532e03ccmr13754556ljm.66.1669489314425; 
 Sat, 26 Nov 2022 11:01:54 -0800 (PST)
Received: from [192.168.1.8] ([185.24.52.156])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a194f52000000b00494643db68fsm1009392lfk.81.2022.11.26.11.01.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Nov 2022 11:01:54 -0800 (PST)
Message-ID: <dde4b173-f9d6-3ef5-39ff-24c3eeb6b93a@linaro.org>
Date: Sat, 26 Nov 2022 21:01:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 15/18] arm64: dts: qcom: sdm630: Add compat
 qcom,sdm630-dsi-ctrl
Content-Language: en-GB
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
 <20221125123638.823261-16-bryan.odonoghue@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221125123638.823261-16-bryan.odonoghue@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robh+dt@kernel.org, agross@kernel.org, swboyd@chromium.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/11/2022 14:36, Bryan O'Donoghue wrote:
> Add silicon specific compatible qcom,sdm630-dsi-ctrl to the
> mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
> for sdm630 against the yaml documentation.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

