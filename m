Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B95E6E6102
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 14:18:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA1D10E134;
	Tue, 18 Apr 2023 12:18:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B0CE10E134
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 12:18:34 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id c3so6756690ljf.7
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 05:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681820312; x=1684412312;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s5cxVw9YSikx002hly9GEAsV567PP+kQP1sM6EfB2Co=;
 b=Tp2K1BX9OOUuGPhWUAu5PjFgtrEl6eOyccDkPCEAvfIa/2kgX8zh1hZWroSUnek4qO
 UjR2/u4yCP1MiWVBiG8kD9X0pyVfWIiW4b8XSEpQarcFTvRKZmeCD2dRcFE4HGE05c+p
 5mTyzCZD/XlsEfyN35kFfT09IeqVU7/oWojfy6Ol75sJAGLfuoBrjbjtn1/mM40nUiXD
 15mzuraHRGr0pMlBy5S5ni056qyM+8KZCMRXVKZfGHYukAuScJI4fR1iJNIhBY8CEcrM
 wA7B4SJRjaE8ZvXKmgM3qEbnQtZ6AOvnKNMC7kJVLyQRU3adS7Jj/qP36pwowxGGMN3h
 /VfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681820312; x=1684412312;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s5cxVw9YSikx002hly9GEAsV567PP+kQP1sM6EfB2Co=;
 b=lZsKsuHAp1/7OWUopdJMg/zegY0aGbBk5Awn+osK55XK/R3aOYj3UOh3oj00jGNyWN
 2wulL+Bf5acYCE8ScowEUXxVH1ukzSFG4s51UA6F8o5Anrr8fWW0d3V41ASrxiEJEFlw
 3SDwQMe1igGsqh/DNrcU39HutKVruthEMV7gPQqV17oLZdAEJjO16ofhYXjWikxhVoj3
 QyVn0K+bOhvNy93RUyiMILv5sxnjNn94ScCEb4YPjS/j+npWCp6ytkRCxwkPtj+U4fSC
 Nh48uG9ob2Ttca5YsExVSg1vDHVBz/ZQNJjT03XXWHJPo9FKUdqEB+M9MpWbFh5DxUrZ
 RUAg==
X-Gm-Message-State: AAQBX9dtY8PFX8AaxiTJ8UNnlzw6jJ05N7kG+6kJ9md0DF7N8WhMiIBY
 9NuR6qVYhg7FQMXQ/B77pjQxqA==
X-Google-Smtp-Source: AKy350av1XJ3jXQfSMjdRIlffK92NsVOt67SJ0ygIdBrTmoPvuEK8mAfNV5QJh2WF6ITbgmeWh0s2g==
X-Received: by 2002:a2e:8799:0:b0:2a7:9690:ca01 with SMTP id
 n25-20020a2e8799000000b002a79690ca01mr667734lji.18.1681820311894; 
 Tue, 18 Apr 2023 05:18:31 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
 by smtp.gmail.com with ESMTPSA id
 z21-20020a2e8e95000000b002a634bfa224sm2557662ljk.40.2023.04.18.05.18.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 05:18:31 -0700 (PDT)
Message-ID: <38478a18-d60f-924f-f8cd-3ba44d0f1c65@linaro.org>
Date: Tue, 18 Apr 2023 14:18:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 06/17] drm/msm/dpu: Remove extraneous register define
 indentation
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
 <20230411-dpu-intf-te-v2-6-ef76c877eb97@somainline.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v2-6-ef76c877eb97@somainline.org>
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
> A bunch of registers are indented with two extra spaces, looking as if
> these are values corresponding to the previous register which is not the
> case, rather these are simply also register offsets and should only have
> a single space separating them and the #define keyword.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 41 +++++++++++++++--------------
>  1 file changed, 21 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index b9dddf576c02..1d22d7dc99b8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -38,26 +38,27 @@
>  #define INTF_ACTIVE_DATA_HCTL           0x068
>  #define INTF_FRAME_LINE_COUNT_EN        0x0A8
>  #define INTF_FRAME_COUNT                0x0AC
> -#define   INTF_LINE_COUNT               0x0B0
> -
> -#define   INTF_DEFLICKER_CONFIG         0x0F0
> -#define   INTF_DEFLICKER_STRNG_COEFF    0x0F4
> -#define   INTF_DEFLICKER_WEAK_COEFF     0x0F8
> -
> -#define   INTF_DSI_CMD_MODE_TRIGGER_EN  0x084
> -#define   INTF_PANEL_FORMAT             0x090
> -#define   INTF_TPG_ENABLE               0x100
> -#define   INTF_TPG_MAIN_CONTROL         0x104
> -#define   INTF_TPG_VIDEO_CONFIG         0x108
> -#define   INTF_TPG_COMPONENT_LIMITS     0x10C
> -#define   INTF_TPG_RECTANGLE            0x110
> -#define   INTF_TPG_INITIAL_VALUE        0x114
> -#define   INTF_TPG_BLK_WHITE_PATTERN_FRAMES   0x118
> -#define   INTF_TPG_RGB_MAPPING          0x11C
> -#define   INTF_PROG_FETCH_START         0x170
> -#define   INTF_PROG_ROT_START           0x174
> -#define   INTF_MUX                      0x25C
> -#define   INTF_STATUS                   0x26C
> +#define INTF_LINE_COUNT                 0x0B0
> +
> +#define INTF_DEFLICKER_CONFIG           0x0F0
> +#define INTF_DEFLICKER_STRNG_COEFF      0x0F4
> +#define INTF_DEFLICKER_WEAK_COEFF       0x0F8
> +
> +#define INTF_DSI_CMD_MODE_TRIGGER_EN    0x084
> +#define INTF_PANEL_FORMAT               0x090
> +#define INTF_TPG_ENABLE                 0x100
> +#define INTF_TPG_MAIN_CONTROL           0x104
> +#define INTF_TPG_VIDEO_CONFIG           0x108
> +#define INTF_TPG_COMPONENT_LIMITS       0x10C
> +#define INTF_TPG_RECTANGLE              0x110
> +#define INTF_TPG_INITIAL_VALUE          0x114
> +#define INTF_TPG_BLK_WHITE_PATTERN_FRAMES 0x118
> +#define INTF_TPG_RGB_MAPPING            0x11C
> +#define INTF_PROG_FETCH_START           0x170
> +#define INTF_PROG_ROT_START             0x174
> +
> +#define INTF_MUX                        0x25C
> +#define INTF_STATUS                     0x26C
>  
>  #define INTF_CFG_ACTIVE_H_EN	BIT(29)
>  #define INTF_CFG_ACTIVE_V_EN	BIT(30)
> 
