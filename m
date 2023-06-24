Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E73273CB1A
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 15:48:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28AE710E139;
	Sat, 24 Jun 2023 13:48:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F6110E13D
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jun 2023 13:48:45 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4f954d7309fso2026773e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jun 2023 06:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687614523; x=1690206523;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d9YJLCIpYToQE57X7+5G5EtcnZ1RMPAgUeTIP11pd3U=;
 b=yHPJtC7Mp2cKx/Prulu7JGSmBR2bUP0DTFHIsXsdA5OrKiie2bdUh3DlzVcyickWop
 BrP9M9h3zu3fXX2393zawF/mVYsSPomYUzmEnxwy5CSLSa35xCek3z8sovdA7k1cyaSt
 95R8yiJ7phSb/skwB+BYeVTtus5kcH38LmZzGscMFWb0KIdWXrEDKZZOgr1LrVMCqqx0
 nhGTvmDPk4L+zv4yxSbzGg1OrVpAS2waKKVPVwSeXe6PCUhzZ1TU6zWgoC5NrutHz4yg
 5cpEvcNJVmDF2o+6GEjdfvsfarw2HIj7vS0HsSoTWELYkjYX7QwiXrvVsQ9GPsW8VTtO
 B4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687614523; x=1690206523;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d9YJLCIpYToQE57X7+5G5EtcnZ1RMPAgUeTIP11pd3U=;
 b=ZxGFDRxPCCngeIIPgAr+szIhqlFQE5myOCU2hXZjSWk3D/hEHcklCvDme5YNI6w4Oj
 NFqc3dt2qgxIiAbwH3Eiw5ksK3ENMpdJe93o/FRhKuOE89i6WzONhrF7gmp+bbuN1xai
 Bw7d6UZ/RiZGD2w/llEGZI/5T0QVUG/ahl4fqqyfsICsRF+RhqGRzz3CWOFOhAoUep8m
 jP/JM5CPGCAnR6EpjJYztT/o6ovRTk6oow1n+XDfUbifK2M3J6hDBAfKfBUL2GY7uh6u
 uzOLC9ZEOtlrAMp7rh8ACMobnJH2UbR+ANMFt8qnXiYw2KTWjZnt6I7JL20VTko9eIVa
 i9ng==
X-Gm-Message-State: AC+VfDxpV3v7bzLgOj0+R8330Oxe2uk7z3B/t6lEZ8r1ARLSV5YuhkXz
 Xp3q4+EOR6uVvRsXFjmjMJKYzQ==
X-Google-Smtp-Source: ACHHUZ42jKtX7W+P46oaiEZR1+/HWcRGkV+LXkEy7ADI+/OMe3SZiS9nVNJQHkJyEVtg3yvpJlSVwg==
X-Received: by 2002:a19:5007:0:b0:4f8:52a8:d123 with SMTP id
 e7-20020a195007000000b004f852a8d123mr8242945lfb.12.1687614523211; 
 Sat, 24 Jun 2023 06:48:43 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 x11-20020ac259cb000000b004f873e3282asm284858lfn.63.2023.06.24.06.48.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Jun 2023 06:48:42 -0700 (PDT)
Message-ID: <1b40b16e-025a-c10b-e99b-404246de73fe@linaro.org>
Date: Sat, 24 Jun 2023 16:48:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 10/15] dt-bindings: msm: dsi-phy-14nm: Document SM6125
 variant
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
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-10-1d5a638cebf2@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230624-sm6125-dpu-v1-10-1d5a638cebf2@somainline.org>
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

On 24/06/2023 03:41, Marijn Suijten wrote:
> Document availability of the 14nm DSI PHY on SM6125.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> index a43e11d3b00d..60b590f21138 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> @@ -18,6 +18,7 @@ properties:
>         - qcom,dsi-phy-14nm
>         - qcom,dsi-phy-14nm-2290
>         - qcom,dsi-phy-14nm-660
> +      - qcom,dsi-phy-14nm-6125

Should we start using standard scheme, so "qcom,sm6125-dsi-phy-14nm" ?

>         - qcom,dsi-phy-14nm-8953
-- 
With best wishes
Dmitry

