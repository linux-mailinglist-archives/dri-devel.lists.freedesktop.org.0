Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D01742445
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 12:50:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC13D10E10B;
	Thu, 29 Jun 2023 10:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ABBB10E0E8
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 10:50:14 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4fb761efa7aso809940e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 03:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688035812; x=1690627812;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AlWKrukg5MkoBr6pmLqgyqkqs3HWwrV9mYN/fyCAiOY=;
 b=WBlfWCh+qhrVWdYpLZ45TxWD+z+z59deD4crcXaYxzldSoovleEsfQTWo8vQ+fEygu
 MknhUiiWRRkpolb/Yzvak/bdgHVGSmM0dLxUIA2eOCuaESZqD5gNPn2ZvQSM2AqHCiU1
 Skv5s73xK4dr6rLkqrmN/8w+WBBn4Ysp5Qks3qGcBN91lBrOEguZRKWyaI8BaZigtVqU
 HssxCXJRtl+KcFwdptvdA+hw6O2mhRpQuHTgd2ns1JpN54rm+n7Rbl/IUMfqls/YdAht
 0XOzm0qMxB3367Uzv2CJnsMthpbxHJ8/NM+m+GZic3sFYgsgJx49jR6H5RlZMSpHsGpa
 Zssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688035812; x=1690627812;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AlWKrukg5MkoBr6pmLqgyqkqs3HWwrV9mYN/fyCAiOY=;
 b=dpFhjDf3EHaiOtZKOJTYkff0DPmestErp564VXsmZ7YMz2Z/WQhYwKMMl/H95WfHNI
 e3+d+DioUi3yx03+rRGzwfeXnPxq9Y2LJlhlY83VzjE148xx02/Tk8xYISmeXbo3GuEt
 Hlc+B8YkJNOTyLzr9dYCsOZ7AxCa3x6dJifLxGVYrSxpoz0fklF4L5bzmVSAw4hkkdST
 sfnDpLT+TEulcWG3q8J9tGf4FJNeu/LBGw1XbDHmBatkICkqh8/p89eM26ERm/Y4fxeo
 N2vPObggnAMWhB2CFLiMOykiOs7rhbjDYaMkoc+1iEu13crP9Zj2fyNe4HYK77qGCY9S
 6c9Q==
X-Gm-Message-State: AC+VfDzVOGLXZOrAhaj3wphk18yp5eVkpwGvIxjngKOZC/UnFrQQTK4+
 VL8zR8H+eVS1jhjNnjisdCwLZA==
X-Google-Smtp-Source: ACHHUZ4MUaOhGLj+rMVCwGhuYzQmktcGM6s56V38iEDGRih5bps9QVtmpsk9PuqcaKJZSP1bMwcr+Q==
X-Received: by 2002:a19:5f44:0:b0:4f6:2317:f387 with SMTP id
 a4-20020a195f44000000b004f62317f387mr20026659lfj.35.1688035812045; 
 Thu, 29 Jun 2023 03:50:12 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a056512024c00b004f87571a5c8sm2264826lfo.48.2023.06.29.03.50.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 03:50:11 -0700 (PDT)
Message-ID: <bf82cadd-025d-58b9-15b0-5fd4d7a5603e@linaro.org>
Date: Thu, 29 Jun 2023 13:50:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 01/15] drm/msm/dsi: Drop unused regulators from QCM2290
 14nm DSI PHY config
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
 <20230627-sm6125-dpu-v2-1-03e430a2078c@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230627-sm6125-dpu-v2-1-03e430a2078c@somainline.org>
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
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lux Aliaga <they@mint.lgbt>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/06/2023 23:14, Marijn Suijten wrote:
> The regulator setup was likely copied from other SoCs by mistake.  Just
> like SM6125 the DSI PHY on this platform is not getting power from a
> regulator but from the MX power domain.
> 
> Fixes: 572e9fd6d14a ("drm/msm/dsi: Add phy configuration for QCM2290")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 2 --
>   1 file changed, 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

