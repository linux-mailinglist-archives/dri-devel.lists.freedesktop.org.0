Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B782F6D04AD
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 14:28:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BBCA10E2C4;
	Thu, 30 Mar 2023 12:28:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E35010E2C4
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 12:28:18 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id y20so24314793lfj.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 05:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680179297;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OO+mjrMk1jZSB5RM1FlT3sMsdz1umFcmSSqhyUDz4Y0=;
 b=kYQ74xgu/wl6ASnsXCk6xcovXMJDtmH4WRlniuba2ED2fd4LE7rIRGInVeHrH1g0H6
 Bjf2mntZUZeXXJPV/et1JruvbOaywFG5qBIs7BaQcrgfLyZRwMnEH61TVX2xFM16RH7g
 Artj6zsJch6go+uWHcgoCTrxkl/hdyYStdsI7q9a7MThqBcKuz/bETKCGs1U/ohIgvp2
 ix+vsSMgjV6Mzdh6R+4P0icdjL3+OHukeZzWFG9tKvmcQf2ytN+epVFqc+jA6VMgbR/V
 QtKvksf/AzGJxCSH2fp5f2CX4u2mpSRo1C9K2WDYCxqAWobOtPWI1kHdSmLxT8w8CXwb
 Eq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680179297;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OO+mjrMk1jZSB5RM1FlT3sMsdz1umFcmSSqhyUDz4Y0=;
 b=EiDyjQdQqtwTI3SXGydZiPkgxC+UjF7A+zSfeM1aLElPvpCmE1TiAUTFvjFPq4KYwv
 oyvvX8f3f5U7X3x8bLfiKJ3IhRd1/5asF9rLNPIcHrEoVNUAoR21F5ldNXOGwpdQ19NB
 EYD1u/83msheFWuWLO3U1RlMSyCZX9jMtcvCLh1oYjU2C5WpcX6RkOvvq3xPuGTzbleF
 NS83oSMRgqEzpgQbYFj/yyCcU46Fq28lVXtLT7ifdEAY99AlNyqgStXH4iZbPXcIwTyH
 5Ty9JU26Kl9jm83M6FCZyY091A4l/spqGfcGcloS0AQUJQ6dFKyVXoVKrglX88cBD0DU
 gkwg==
X-Gm-Message-State: AAQBX9ef8Wst87+ZjImCT5/kvdBfXFdV/W0J4d2hTbV7AZagxa58/NS9
 3zWV9vtmeAmRjB3vdeeZpHvfjw==
X-Google-Smtp-Source: AKy350bJaOnCk23XOkj5bdXP6K2QEU2a+l6y74hptNST1qySDKDdqhATbo6GdG/qyNwhsY5SI25bnA==
X-Received: by 2002:a19:ad02:0:b0:4e8:5e39:6238 with SMTP id
 t2-20020a19ad02000000b004e85e396238mr6098835lfc.42.1680179297590; 
 Thu, 30 Mar 2023 05:28:17 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 m16-20020ac24290000000b004db508326c0sm5875815lfh.90.2023.03.30.05.28.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 05:28:17 -0700 (PDT)
Message-ID: <9ad6c0a7-ff10-54d9-e556-c9eeb66b9bc9@linaro.org>
Date: Thu, 30 Mar 2023 14:28:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,36/50] drm/msm/dpu: use defined symbol for sc8280xp's maxwidth
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-37-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230211231259.1308718-37-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12.02.2023 00:12, Dmitry Baryshkov wrote:
> Use defined name DEFAULT_DPU_OUTPUT_LINE_WIDTH instead of open coding
> the value.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index 0a5d6d9fe751..a3a79d908451 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -8,7 +8,7 @@
>  #define _DPU_8_0_SC8280XP_H
>  
>  static const struct dpu_caps sc8280xp_dpu_caps = {
> -	.max_mixer_width = 2560,
> +	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>  	.max_mixer_blendstages = 11,
>  	.qseed_type = DPU_SSPP_SCALER_QSEED4,
>  	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
