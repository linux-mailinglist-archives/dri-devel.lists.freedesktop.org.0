Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDE56E60F5
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 14:17:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7216010E205;
	Tue, 18 Apr 2023 12:16:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3120D10E785
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 12:16:56 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4ec8eca56cfso2171433e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 05:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681820213; x=1684412213;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cSPjkwXrQ/5Q2DOZIZBvyFYJuatqkXIjg6jGdvedRys=;
 b=LUCVOcv6DmUDBjQ4R+22BPhUOHNtFxSlaq/NsdorfkSxJVX8jkPYEjVzroC6ZG6Z6R
 Qrrd3ef/WSCCYaWwayqF8N7yWYiieAlQTpnB4JOkdUebbvDvTIFHuRT6hWie9eQ6ru5i
 wRhwvXIX3mXm8v57oGoY2VP7+Q1FnlDP9oY1QkE4e+VqSLKyLPomfA0nWPPAQUM/KDG0
 cmQ1Ab77/W0AcszA0V3L6EXPFp/5BkCG4kmzB9aGKxb4oaATbImSsUn0vaDre2u13KYZ
 dGqo0Wzzif+aGaKm/kCS3wGM/4tjmPjqRzLGmiW565Dh4ZDEevNHLT2jLa2i30GsjHsQ
 DBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681820213; x=1684412213;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cSPjkwXrQ/5Q2DOZIZBvyFYJuatqkXIjg6jGdvedRys=;
 b=GzLlW0fMzojevUNZ1f5nlwlam35pzThFf46hjxhjqdm35oyVueoROzF9yioUQYRqIQ
 cXVF53vvb+uvg/3gGTCyJOyJXwlAWSiAzP/mf9VuEZ3KIqRvqXJKRdJxMRzmqecm9WnQ
 Mid2uMPXqFh1zSEHUexkxW+4YBxXUEJKQvctwycAxHkrXwVD9imyAUvzLvKdkIOGShgP
 cWrXg8tolJYkutWSguyg0hopnoq2QGG5VyqhVLbK/BHd5GJGfi0XjdbxmXoCZd6bgLy1
 1P7SDFKohfAsPpSwAsiKB0PbVFcKKn47EBkGBGG71ceZ1PrAflhCrGzjqEdywUHfN4ZL
 OeGg==
X-Gm-Message-State: AAQBX9cX/GASnHo6MOMrwGnuF7HtOM16mg/FficIHclZ1uwY+giDSJQh
 NLToNPRfszCwBlImiFSwqPQetA==
X-Google-Smtp-Source: AKy350a4RukmMdttuvhLrku73yObrOs3Usaj340YEO08FQAohtiLVmAMrXDJpWdpc1sd1o8FMewzJA==
X-Received: by 2002:a19:ac48:0:b0:4dd:cb1d:b3cc with SMTP id
 r8-20020a19ac48000000b004ddcb1db3ccmr2789051lfc.11.1681820213659; 
 Tue, 18 Apr 2023 05:16:53 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
 by smtp.gmail.com with ESMTPSA id
 a13-20020ac2520d000000b004edc72be17csm522583lfl.2.2023.04.18.05.16.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 05:16:53 -0700 (PDT)
Message-ID: <ac2ea79a-c20b-c50d-11b6-2785e1cecfc5@linaro.org>
Date: Tue, 18 Apr 2023 14:16:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 03/17] drm/msm/dpu: Move non-MDP_TOP INTF_INTR offsets
 out of hwio header
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Adam Skladowski <a39.skl@gmail.com>, Loic Poulain <loic.poulain@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Rajesh Yadav <ryadav@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
References: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
 <20230411-dpu-intf-te-v2-3-ef76c877eb97@somainline.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v2-3-ef76c877eb97@somainline.org>
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
Cc: Archit Taneja <architt@codeaurora.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 freedreno@lists.freedesktop.org,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 17.04.2023 22:21, Marijn Suijten wrote:
> These offsets do not fall under the MDP TOP block and do not fit the
> comment right above.  Move them to dpu_hw_interrupts.c next to the
> repsective MDP_INTF_x_OFF interrupt block offsets.
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 5 ++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h          | 3 ---
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 53326f25e40e..85c0bda3ff90 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -15,7 +15,7 @@
>  
>  /*
>   * Register offsets in MDSS register file for the interrupt registers
> - * w.r.t. to the MDP base
> + * w.r.t. the MDP base
>   */
>  #define MDP_SSPP_TOP0_OFF		0x0
>  #define MDP_INTF_0_OFF			0x6A000
> @@ -24,6 +24,9 @@
>  #define MDP_INTF_3_OFF			0x6B800
>  #define MDP_INTF_4_OFF			0x6C000
>  #define MDP_INTF_5_OFF			0x6C800
> +#define INTF_INTR_EN			0x1c0
> +#define INTF_INTR_STATUS		0x1c4
> +#define INTF_INTR_CLEAR			0x1c8
>  #define MDP_AD4_0_OFF			0x7C000
>  #define MDP_AD4_1_OFF			0x7D000
>  #define MDP_AD4_INTR_EN_OFF		0x41c
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
> index feb9a729844a..5acd5683d25a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
> @@ -21,9 +21,6 @@
>  #define HIST_INTR_EN                    0x01c
>  #define HIST_INTR_STATUS                0x020
>  #define HIST_INTR_CLEAR                 0x024
> -#define INTF_INTR_EN                    0x1C0
> -#define INTF_INTR_STATUS                0x1C4
> -#define INTF_INTR_CLEAR                 0x1C8
>  #define SPLIT_DISPLAY_EN                0x2F4
>  #define SPLIT_DISPLAY_UPPER_PIPE_CTRL   0x2F8
>  #define DSPP_IGC_COLOR0_RAM_LUTN        0x300
> 
