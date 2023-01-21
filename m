Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BF4676524
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 09:46:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF2810E1B4;
	Sat, 21 Jan 2023 08:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB2B10E16C
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 08:46:31 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id d30so11235389lfv.8
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 00:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=krQY/969FJtYWSNWYDq7EkBXPaNsve6suYbHHlSWD4Y=;
 b=niUxbgfvngu3SYeCrOAmBYUehLL3bTJLrXmwfg6PkQEIzOjff39G1uXxZxwckPg57i
 siPdJQ/hajRp8gRdO8t6ihSszHzoZWztmz6YV8JrtuXCQCasAlPNNzG+9Opmjb6O8fmL
 ia0NFfzWPqbdqQGBFrFihis0qFP0FbjuGaQ2flpBWHqC5VutWvXyyMMScSgYZ05wzbwL
 XgRBydIfb2tmZFwpKpIfL9WquBtJjkEsgpJ7m3b+UFWcffWuH06rbi6U2UN+lQWAvkG0
 R8MR1hVj67I01lg2pfQxBWygAKTLfhLlPSMZoE+2nPD0lqc5eRuKiGXLI/nh3Sj8VHmx
 oONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=krQY/969FJtYWSNWYDq7EkBXPaNsve6suYbHHlSWD4Y=;
 b=EI6yJAr/ziK7xLDM6Jo/67hv1OSo8GAQxwkLedP/URIPUKGrXTAkDnHxAMhSNOxoT1
 d8lO6Esgj5bI+4RUZFiDeNKas5YWoFZ7++rJr5EKAGPkGEhQdluuoGhREg+CwigU3NXP
 TxRB8FM36Rwf/Wx09KH0IqvO8TCjtkjgZgHibGHTBSxT7waRYt6MJJExt7KLvKZ+Huzy
 /E5NzCpsVhPGldjWR2gZArk3QFGRH5+bA+vGTDZT4xMy19+UsAEOi575V3QmWGCsJ0yO
 44qXug/0TZDCyy7A3J4D/POmEGffav2eP1ZwoMON24JZ8xoh0377Pi+t0TFVpwKrvFTt
 OtdA==
X-Gm-Message-State: AFqh2koheRd7OCyqG9V6Zipnfu3Uh/AoqZEx6FUqKYc5WPX7vXiJqIiw
 DCLzARNhYdEM0UrOgTVxskBIAg==
X-Google-Smtp-Source: AMrXdXtNraARURIPPbSwdKyEz/j5o4k8+/2/+jY9832pJBk+L3TTDxjOHoCuePYVGIteN4T3u5JsRA==
X-Received: by 2002:a05:6512:b1e:b0:4d5:8f40:a467 with SMTP id
 w30-20020a0565120b1e00b004d58f40a467mr4246084lfu.15.1674290789946; 
 Sat, 21 Jan 2023 00:46:29 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 c7-20020a056512074700b004b551cdfe13sm6223991lfs.279.2023.01.21.00.46.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Jan 2023 00:46:29 -0800 (PST)
Message-ID: <995ea900-a80d-45b3-0d13-0998194d9cbc@linaro.org>
Date: Sat, 21 Jan 2023 10:46:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/8] arm64: dts: qcom: sm8350: Add missing
 #address/size-cells to DSIn
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org, krzysztof.kozlowski@linaro.org
References: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
 <20230120210101.2146852-2-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230120210101.2146852-2-konrad.dybcio@linaro.org>
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
 Loic Poulain <loic.poulain@linaro.org>,
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
> Panels/DRM bridges definitely don't need 64bits of address space and
> are usually not 32-bit wide. Set address-cells to 1 and size-cells to
> 0.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   arch/arm64/boot/dts/qcom/sm8350.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
-- 
With best wishes
Dmitry

