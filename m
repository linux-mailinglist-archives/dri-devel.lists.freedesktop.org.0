Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA1F74244A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 12:50:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6713210E119;
	Thu, 29 Jun 2023 10:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B68C010E119
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 10:50:40 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f865f0e16cso807264e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 03:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688035839; x=1690627839;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=guJGAnCCFO9fo+Q+lePAT4AatbNAwA3TFffGx0GvU2g=;
 b=FeYShU0DV1r0J9WSZmSnq9d2EoVzRoh5p49t+fWb/LGP8ECl+Gy3WSNWdZtVUJHBQv
 zqvtPfCyWiu7RTS6UJyBI4599ar9DmtwSdu/7fh/Vjtucc2wp5m5eXsuNeE5WuX1CAkp
 Ayx2t3b56TRAucWstatE2y1GNO2zkjRXci5Zb3ts9pP9lbOr+CgDBRCOkg5Jto9t9f30
 ftp5lkYdIuSlxkZLePjjCDcrrCm3LOSHoT46eKUjr+fpJfk1aIL33uCMTgNrWd3D1Kye
 jNWN84Kg2J44iAJuyMeLJenjkPuPXNv8JiBsCHnxwWciS/nIa3Db2EawhD3a8rQaStyv
 jx+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688035839; x=1690627839;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=guJGAnCCFO9fo+Q+lePAT4AatbNAwA3TFffGx0GvU2g=;
 b=TqRrSY4DfmwixiVUZcnbvOvLwqG6vpMxPliwVxp7aktZD9ZlkcGPhkgUplHzoBN/mw
 ftVh8CBauVwoiWYn8ugepeyJr2bD96S+G3DsTPE5+uZoVCwmgCnVZ2pIlXpWApc+KbWj
 ma2np0CDX7ShJQtJepLAuJyKf4hvIp50SxUgWDxvsgCHqZSAin+7eumKWyMrXpswUaAP
 BWXTWMoy1V5izKZSQ7WATmUziyidxqL0j5nzIJcIwJhGrmPbLzOKjV9qaQ77UOzuJae3
 U6KRCtqX0C4Es2739wzBBR+oxFfnqgtTdq2u3FMHp8VhNoE5L2lKa92kwWun0VHnQ46x
 yW1Q==
X-Gm-Message-State: AC+VfDwxe05hWwMaFFwV4i/g5pDxmJ2J95wEWGG+wkazeoSz3WgbWFZC
 o8+CFMeDc8x66TfUHR6pi1kDAA==
X-Google-Smtp-Source: ACHHUZ5r4m7KdWWjT77yGYOUnmn6vM0l13dgN6t/mdKe0fnH9Xe8pYvpvGlo4fSP5Eyx3hzgL0RLSg==
X-Received: by 2002:a05:6512:6f:b0:4fb:8987:734e with SMTP id
 i15-20020a056512006f00b004fb8987734emr4131316lfo.68.1688035838866; 
 Thu, 29 Jun 2023 03:50:38 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 v15-20020ac2592f000000b004ec6252aa37sm2297812lfi.116.2023.06.29.03.50.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 03:50:38 -0700 (PDT)
Message-ID: <0682f82e-0ca8-29c7-0ee6-e2438122bf5c@linaro.org>
Date: Thu, 29 Jun 2023 13:50:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 05/15] dt-bindings: display/msm: dsi-controller-main:
 Document SM6125
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20230627-sm6125-dpu-v2-0-03e430a2078c@somainline.org>
 <20230627-sm6125-dpu-v2-5-03e430a2078c@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230627-sm6125-dpu-v2-5-03e430a2078c@somainline.org>
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
Cc: devicetree@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lux Aliaga <they@mint.lgbt>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/06/2023 23:14, Marijn Suijten wrote:
> Document general compatibility of the DSI controller on SM6125.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

