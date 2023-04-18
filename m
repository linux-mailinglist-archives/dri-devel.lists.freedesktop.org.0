Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8456E610A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 14:19:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D27A10E796;
	Tue, 18 Apr 2023 12:19:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07BEF10E78A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 12:19:01 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4ec817060cdso2174280e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 05:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681820340; x=1684412340;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tVUHv9GVSnBcu3oMPdI/NIopRwXK/wuVEPMQDh0yxqo=;
 b=hB4XIbeIGzdz2nJmfFOH4csRbqljl9PFshYQtDP3o1MCra1pA4BGNg8OluZ8TU3TNn
 xXgSQJ5Nb7AyRLY2ITfEGUFJb6Zix98/oulPJM869mgnT9DA8+zoeXoBhNCQ4I/7FzOo
 /0S4fbhRbJMnOx+wPTiQ+OaP7tdXoM+LBXwnlPmp2VWCUDt3wFmhJPZjwFR6fllYiLvH
 mZzvkx+doGa+jTh0/k8f9uAFFyiEKfmR/vpt86TctkLNGmMg1JHtcO3aGi5+Bcxjy5PL
 stO6XDkDloqdG3pIS26wKg4s6NpIjoFkrlFL0O1wugY+HSVKEFAy9dI0ix2lCP9Yy1Pa
 2/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681820340; x=1684412340;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tVUHv9GVSnBcu3oMPdI/NIopRwXK/wuVEPMQDh0yxqo=;
 b=BkmnPVdHn3fARvVAUSQPzaQOzCTQVOAz771wauZyz7e1j/X5q1xWpBL7sFT4kERpaq
 a0uAstx4i2sdY6O5u/v52roMc7AsMqwyzSDaXBM+S0AgcTZfbQFszAjAIMkuPGWwqGqy
 z1Eufa8sMMRGGhFI903uuEUEiJ8S9S5o3NOc3GpBq8TYF5JDpdOUrpyJX7KTbZzPvYim
 XdstEPA9B9IT2EkHpG6fUmFtPCxPK1rJysgxT3ADK+GNAm3yfRnZ+G7lttOdFQCK/Vci
 o97mzfl18drLsjzL2R1SndJGDjjOZj2X7PXMhYX0iH8T/SNTiu59PWpOF6UUeSNnRUs2
 4IAw==
X-Gm-Message-State: AAQBX9fxIXP5vPcLsc2sAvuHLxy08JzIAlDoY9e3ebX0WIHa2LzdTGkL
 cn+0g7HmESEQaPdGg87Y2tGEEA==
X-Google-Smtp-Source: AKy350ajegjWSo1YL9giSkWPjZI3mF0HFSGVnnXdrLqJeveDadl9IMChqknDvKeDavaiYXOKevOOsw==
X-Received: by 2002:a05:6512:11ce:b0:4eb:d20:b2ad with SMTP id
 h14-20020a05651211ce00b004eb0d20b2admr3485799lfr.63.1681820339982; 
 Tue, 18 Apr 2023 05:18:59 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
 by smtp.gmail.com with ESMTPSA id
 7-20020ac25687000000b004edc2a023ffsm936039lfr.36.2023.04.18.05.18.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 05:18:59 -0700 (PDT)
Message-ID: <20cdda24-58bc-7439-8bee-e558cf389f5b@linaro.org>
Date: Tue, 18 Apr 2023 14:18:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 07/17] drm/msm/dpu: Sort INTF registers numerically
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
 <20230411-dpu-intf-te-v2-7-ef76c877eb97@somainline.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v2-7-ef76c877eb97@somainline.org>
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
> A bunch of registers were appended at the end in e.g. 91143873a05d
> ("drm/msm/dpu: Add MISR register support for interface") rather than
> being inserted in a place that maintains numerical sorting.  Restore
> that.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 1d22d7dc99b8..1491568f86fc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -36,6 +36,10 @@
>  #define INTF_CONFIG2                    0x060
>  #define INTF_DISPLAY_DATA_HCTL          0x064
>  #define INTF_ACTIVE_DATA_HCTL           0x068
> +
> +#define INTF_DSI_CMD_MODE_TRIGGER_EN    0x084
> +#define INTF_PANEL_FORMAT               0x090
> +
>  #define INTF_FRAME_LINE_COUNT_EN        0x0A8
>  #define INTF_FRAME_COUNT                0x0AC
>  #define INTF_LINE_COUNT                 0x0B0
> @@ -44,8 +48,6 @@
>  #define INTF_DEFLICKER_STRNG_COEFF      0x0F4
>  #define INTF_DEFLICKER_WEAK_COEFF       0x0F8
>  
> -#define INTF_DSI_CMD_MODE_TRIGGER_EN    0x084
> -#define INTF_PANEL_FORMAT               0x090
>  #define INTF_TPG_ENABLE                 0x100
>  #define INTF_TPG_MAIN_CONTROL           0x104
>  #define INTF_TPG_VIDEO_CONFIG           0x108
> @@ -57,6 +59,9 @@
>  #define INTF_PROG_FETCH_START           0x170
>  #define INTF_PROG_ROT_START             0x174
>  
> +#define INTF_MISR_CTRL                  0x180
> +#define INTF_MISR_SIGNATURE             0x184
> +
>  #define INTF_MUX                        0x25C
>  #define INTF_STATUS                     0x26C
>  
> @@ -66,9 +71,6 @@
>  #define INTF_CFG2_DATABUS_WIDEN	BIT(0)
>  #define INTF_CFG2_DATA_HCTL_EN	BIT(4)
>  
> -#define INTF_MISR_CTRL			0x180
> -#define INTF_MISR_SIGNATURE		0x184
> -
>  static const struct dpu_intf_cfg *_intf_offset(enum dpu_intf intf,
>  		const struct dpu_mdss_cfg *m,
>  		void __iomem *addr,
> 
