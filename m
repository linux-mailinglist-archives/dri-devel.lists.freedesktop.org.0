Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA53676530
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 09:47:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5833010E29F;
	Sat, 21 Jan 2023 08:47:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D7B10E29A
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 08:47:28 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id f34so11239669lfv.10
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 00:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2YTLThmpv4cn2/MrHGWOqrwv4z8fZYWsyGoTrJwWTZ4=;
 b=pBZRz9QbNDbN6j3B8e7fgWAqnKS7AS3L1aWds0Je3Y0DC9zNHT3o3bOqZJI7ybIOlm
 gUipeAlS4bXUqmX6s3s2dXwXum7IW/4uD+B6+Fw1sbDcRhNpT43ZXWmBuKMewK15JetP
 POZ9U4vTSN91TVAkGc0SWqHKsmvLneFFJ4MMHnVPsYwtlTg3GYwODXNV10AIhA8plvXQ
 Rmp1JO3Tq5gB8NySMp4ScD+h8DGmkPPzgwMfWZXP1mcYlrjyFGp2sAvP/x9RYFRcJHmb
 X8I5TGPF1Za5WZhxwE8yvzapXYia9rxyCyD5GS+jf2FGyKq7KRZ2uk5VaYQ/cu4oZBAV
 ZLrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2YTLThmpv4cn2/MrHGWOqrwv4z8fZYWsyGoTrJwWTZ4=;
 b=NLZBan/f99Ax6hiunK4kolegwJi4zkEcapnkfBsZKLdjXOjoE5bk15rxLlEUUD4hnN
 5JA1Lv43uJzw1gTyi5onc6b11tqDTDehcomvYDVD21Vu3vDd2YvC+cQPrX7JrVg+82Z6
 9mdKhXQUWOoOJY4Yz8NLDiRXhZ5eE0EnqzfpplLplQPiRzAY3vmY2SqhmTJylOoFr6le
 aWf5CWUiTG1X+s9tVQtKftERICFMyzoFL2iInr9OR/1Jh8CFS8IXDy2JCf9fMTqX8Vyc
 g5Okw0qu6TU1ojr0NyfNQzEnwdryAXRtaLLL2b6JndeSN/HryzbYL5/DObRu7Bklcn9w
 lXoQ==
X-Gm-Message-State: AFqh2koJ/ngrJhxPQwSnFeMFnV+SesGlL9zJ5UPOxkM4l1tBMKvqiwSo
 o06y0bQRJUhFPTtKwYbWV7NXqw==
X-Google-Smtp-Source: AMrXdXuz4HheEdSEFU8haYbpupq3Tp4b+KV5QwfsX6By2llk+vFNZAkPAruXsOzpBen+K3Nga94zRw==
X-Received: by 2002:a05:6512:b84:b0:4cd:f060:d657 with SMTP id
 b4-20020a0565120b8400b004cdf060d657mr6659259lfv.51.1674290847647; 
 Sat, 21 Jan 2023 00:47:27 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a2eb4b0000000b002862cc92061sm4158704ljm.76.2023.01.21.00.47.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Jan 2023 00:47:27 -0800 (PST)
Message-ID: <78f53b83-25a8-748b-de78-c6931555f8b7@linaro.org>
Date: Sat, 21 Jan 2023 10:47:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 5/8] arm64: dts: qcom: sm8350: Fix DSI PHY compatibles
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org, krzysztof.kozlowski@linaro.org
References: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
 <20230120210101.2146852-5-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230120210101.2146852-5-konrad.dybcio@linaro.org>
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
> The compatibles were wrong, resulting in the driver not probing. Fix
> that.
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

