Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 359D173CA36
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 11:33:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1478110E196;
	Sat, 24 Jun 2023 09:33:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48FCC10E196
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jun 2023 09:33:12 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-51bdca52424so1619918a12.3
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jun 2023 02:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687599190; x=1690191190;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tj3h2F7PrfXgiEVSgcmcva0dTAsO+LbFtvUy3HlpOUM=;
 b=ic86rBDVlYcttew4/vob85e87FNpbbw8JM1F4OZp5nVBORwXNv4q2cTt9SNVFlD9m1
 dFi33g/gLFSWKIokJ9yYgX/tAQvFqVzaGb+REdj5S1pJg8PrdKReA0WIdwbevE9qKL9X
 jTb64bNYUQw0MrC41EE0O0A9p8khOb4xXzpmJeG9HS6yk9KoACeNybd0UTWCAMTDIW+h
 KDdKphFAbVxcyXlCNtts7L78DEmH/dMSIUyCQVoipTLDJWOgGB1FLejiUR8b146FM1N8
 zQFTl5lZGymUQd3VgWk49FEUwvT7wCpqn0SQ1lMbET9C6orZAQ1dEMjK8+eDWqCcdBdD
 dvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687599190; x=1690191190;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tj3h2F7PrfXgiEVSgcmcva0dTAsO+LbFtvUy3HlpOUM=;
 b=j5DMGI7tQt6znYRqIlouv/HKC5tIny5v2PQgtdJlwTy2XBChVGfZTS6jkVFrapTLIf
 7ozx8nVYcJRBE7ZxY6R7Y1+/K8syn5zPhhxP5kRnY2KXZOlAG2zueqF+5bgC8jsCdKG3
 zlTBj0+d21n3PuYIB9XcywwUw3+JlagGD0JB0MqHp0gcPqtKLt42UwQWj4qITMLQ4blj
 qsT5MiAfy4+M+UDiqUj5YmDYopPw39OYly7YTFzYbMTxoTQE9Sm/+4wPcm4laf5OtPdx
 54W5QPOZblmjk7ll1Znew+lKpKFhg6xrAgIR78Nh1pKYAC/YqeVN8FJWbi5g9QV2a9LJ
 RjGw==
X-Gm-Message-State: AC+VfDzQF1OFcPAhlJ5J1ZbdEL8541k4qU5TkVaLGpqHSStjLcDfV+eb
 g0TWIY07AZ9D8RVcUCRCQ7iOSw==
X-Google-Smtp-Source: ACHHUZ6bs/BxTDqMq4cvMfLXihVSFIJDim3qioOSXkCmAssN1V1E4/ail2H+MUzzE3JuAdSuXV/mmA==
X-Received: by 2002:aa7:d411:0:b0:51b:ece3:70d6 with SMTP id
 z17-20020aa7d411000000b0051bece370d6mr4079434edq.26.1687599190265; 
 Sat, 24 Jun 2023 02:33:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 b10-20020aa7c90a000000b0051bed090703sm481937edt.12.2023.06.24.02.33.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Jun 2023 02:33:09 -0700 (PDT)
Message-ID: <00cd9016-4b2d-b8b9-45da-49d1f82148a2@linaro.org>
Date: Sat, 24 Jun 2023 11:33:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 10/15] dt-bindings: msm: dsi-phy-14nm: Document SM6125
 variant
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-10-1d5a638cebf2@somainline.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230624-sm6125-dpu-v1-10-1d5a638cebf2@somainline.org>
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
Cc: devicetree@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lux Aliaga <they@mint.lgbt>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/06/2023 02:41, Marijn Suijten wrote:
> Document availability of the 14nm DSI PHY on SM6125.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> index a43e11d3b00d..60b590f21138 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> @@ -18,6 +18,7 @@ properties:
>        - qcom,dsi-phy-14nm
>        - qcom,dsi-phy-14nm-2290
>        - qcom,dsi-phy-14nm-660
> +      - qcom,dsi-phy-14nm-6125

If there is going to be next version:
Should be rather ordered alphanumeric, so before 660.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

