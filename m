Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEC4676536
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 09:47:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 735E510E2BF;
	Sat, 21 Jan 2023 08:47:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D93D510E29A
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 08:47:43 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id bp15so11200527lfb.13
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 00:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rUIakY5manILdEo4pQ4cOFFCkXw/ibly5tWVD00hd1Y=;
 b=W5owJGCIo19xG0s4TWPnTP5L2WRmNRoDLz98R8+5Ee3JtEa++A4mEiwOIdqcu1G+WY
 1hIPpzdDTyQi6YpB047N9YC0Y1e2qZKb3Keh4rY07d6oF2Av3y3pOkc9DnSjLrYPrp6P
 fx5h2mN6RTcwydiP4fBM3KR7PZn6y0DStj0kG91UK9ZOAn2euxr8tXEg+52SmO97QUAt
 J4eWvHbtEXZtWFh0Qv9XJoBRujX59h737j+hkTT5/Ee/d0dyq0TDZZj9H2einZWHBDL9
 jlBMe3MKNYm3N2mWQ9K8SA90x/iXDg4ohZ4fv19TjDYkL3T3y+J7qpT6Q2DP09r5PuYS
 NH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rUIakY5manILdEo4pQ4cOFFCkXw/ibly5tWVD00hd1Y=;
 b=hdF9PzWUTT1asSer5meY76bfndT77l9RktBX6hlJHU3eNT33Eiu2ZZZrwd+0CgaYgI
 fjS9/s5IeGKtWjfCIwCiIkI6FF22Ygb4Gb+mIrI6CoyVuemxB2Y8Ttb+I6EMMyXBSsai
 JKFKKUaSpk4+CGjkns5w5QJstWPtfT2oXbuylBuXmkBRFG0iB8n1ctFTQY7mHlFkYLRy
 O2JDE00kB0SbB/RcjxzMqZvno3zwNwIDlvtdXPKYF2L/qkFHxCWbCqT2fx4O2nP2DEjg
 LTRMuAyNblqbWHsbtVBWk+A1eP/A13hSXQfpKJBp3W63cuaRnJaLXSOBVpi/KoE5FVay
 i98g==
X-Gm-Message-State: AFqh2kp7u/UVgjv7PU/+/cgKcgKrVHwYx4bl57idZB7hN0/wuQCEwMab
 uOVhMSfxMyeqwgswxFRXcqxs+A==
X-Google-Smtp-Source: AMrXdXup3aeZB7gxcaRq1cbDz6dQNOHgNRDof1U3LkTjlihG8wz/4mKtuTiCJJ7YlMFIBXiCMWag6g==
X-Received: by 2002:a05:6512:1046:b0:4b5:2cf4:cc1d with SMTP id
 c6-20020a056512104600b004b52cf4cc1dmr6256085lfb.68.1674290862243; 
 Sat, 21 Jan 2023 00:47:42 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a056512130200b004a8f824466bsm6234855lfu.188.2023.01.21.00.47.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Jan 2023 00:47:41 -0800 (PST)
Message-ID: <f324aa87-8df9-25be-d6b6-6341460993d2@linaro.org>
Date: Sat, 21 Jan 2023 10:47:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 6/8] arm64: dts: qcom: sm8350: Fix DSI PLL size
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org, krzysztof.kozlowski@linaro.org
References: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
 <20230120210101.2146852-6-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230120210101.2146852-6-konrad.dybcio@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>, marijn.suijten@somainline.org,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/01/2023 23:00, Konrad Dybcio wrote:
> As downstream indicates, DSI PLL is actually 0x27c and not 0x260-
> wide. Fix that to reserve the correct registers.
> 
> Fixes: d4a4410583ed ("arm64: dts: qcom: sm8350: Add display system nodes")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8350.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

