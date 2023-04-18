Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF1C6E60FA
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 14:17:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43AAD10E786;
	Tue, 18 Apr 2023 12:17:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA0510E785
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 12:17:17 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2a776fb84a3so20210371fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 05:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681820236; x=1684412236;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GVRsjaRsIonMFl6duGqwi/hSLT82+JYeVQ472VvmnvA=;
 b=uSC5tADOilhzZ3cCvrYl5beBipKrfMF6mxHAalDeRqlF3I33Gj6ICma3sZx+0Q5mpF
 8QEBMwqojjKdUrnXRpXd7f7qMpsRNQ9dE3aVVE8fK+Nuhn3nmbyu6D6kwDpN9JMhRSeE
 RE/3jojZ0dbXQEBbOFCf0cPE9SOWWuMDqzk0cwfLhDDG3js0dKeanxkW+i9gfmo9uboj
 VP7+GIcvh3P1OQGn207NB+b63E76KGlIsV4YVA4Y2+CqSEA9kfycyeSt9BYgLdZvM0DI
 UtmwaDT13Ija+j3robnfPiLR17C5UKSLx/Fots8s0ZavsJMAQy0F5bGdMi16NeillLF7
 OBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681820236; x=1684412236;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GVRsjaRsIonMFl6duGqwi/hSLT82+JYeVQ472VvmnvA=;
 b=eIc6X6LcPoyeQjvlGZFVpqFXEKghRRO2yQRBeHlTzYbeBzUVcX8k/OzjhKaK8ZBC5U
 TFC1cD/XyKIZhwgMkMRY5uu/ls3E1xDeyzaJXPm9Q0/6S2KokzJS6yamppJ5OEoGUmiA
 +V2lucy6Xlzk07c80JkIMsFeV+D9T11zwoUMWIdXHFWtM0laixVNpe4u5zcYh2TZNmv8
 S6SD2PAV+M9u5zAh8wnA29JIUsFGSamJ78bZh3+ctwDrh62GvAuCQH45EVKEnXO6z9gD
 iR3aQPpmL/Hnmq3Pd+ziAY56ExvJ8RJidteoTphohSdVOQlsWuYrtebZgsliHzJfCErk
 LUmQ==
X-Gm-Message-State: AAQBX9fx7iebtQseZCirN8TUlHmwmFMaPaNGfyxihAvuzJldP3o8cDpg
 X85Q6GJ3NYunnTL9Xd8cXqTHKQ==
X-Google-Smtp-Source: AKy350YJba71ByK73D5tSNH7lhJ8kYY1bATGp9wNcQ8mHpzqKYvaXqYb5t+m1CVVN2h2CONtJ4DXMg==
X-Received: by 2002:ac2:4186:0:b0:4dd:ac8d:671f with SMTP id
 z6-20020ac24186000000b004ddac8d671fmr3154544lfh.34.1681820236212; 
 Tue, 18 Apr 2023 05:17:16 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
 by smtp.gmail.com with ESMTPSA id
 q13-20020ac25a0d000000b004eafa060a6fsm2351324lfn.145.2023.04.18.05.17.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 05:17:15 -0700 (PDT)
Message-ID: <49faf870-0445-6797-97be-890f94bfab60@linaro.org>
Date: Tue, 18 Apr 2023 14:17:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 04/17] drm/msm/dpu: Fix PP_BLK_DIPHER -> DITHER typo
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
 <20230411-dpu-intf-te-v2-4-ef76c877eb97@somainline.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v2-4-ef76c877eb97@somainline.org>
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
> SM8550 only comes with a DITHER subblock inside the PINGPONG block,
> hence the name and a block length of zero.  However, the PP_BLK macro
> name was typo'd to DIPHER rather than DITHER.
> 
> Fixes: efcd0107727c ("drm/msm/dpu: add support for SM8550")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
lol

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 16 ++++++++--------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c         |  2 +-
>  2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index 9e403034093f..d0ab351b6a8b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -132,28 +132,28 @@ static const struct dpu_dspp_cfg sm8550_dspp[] = {
>  		 &sm8150_dspp_sblk),
>  };
>  static const struct dpu_pingpong_cfg sm8550_pp[] = {
> -	PP_BLK_DIPHER("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sc7280_pp_sblk,
> +	PP_BLK_DITHER("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sc7280_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>  			-1),
> -	PP_BLK_DIPHER("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sc7280_pp_sblk,
> +	PP_BLK_DITHER("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sc7280_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>  			-1),
> -	PP_BLK_DIPHER("pingpong_2", PINGPONG_2, 0x6b000, MERGE_3D_1, sc7280_pp_sblk,
> +	PP_BLK_DITHER("pingpong_2", PINGPONG_2, 0x6b000, MERGE_3D_1, sc7280_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>  			-1),
> -	PP_BLK_DIPHER("pingpong_3", PINGPONG_3, 0x6c000, MERGE_3D_1, sc7280_pp_sblk,
> +	PP_BLK_DITHER("pingpong_3", PINGPONG_3, 0x6c000, MERGE_3D_1, sc7280_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>  			-1),
> -	PP_BLK_DIPHER("pingpong_4", PINGPONG_4, 0x6d000, MERGE_3D_2, sc7280_pp_sblk,
> +	PP_BLK_DITHER("pingpong_4", PINGPONG_4, 0x6d000, MERGE_3D_2, sc7280_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
>  			-1),
> -	PP_BLK_DIPHER("pingpong_5", PINGPONG_5, 0x6e000, MERGE_3D_2, sc7280_pp_sblk,
> +	PP_BLK_DITHER("pingpong_5", PINGPONG_5, 0x6e000, MERGE_3D_2, sc7280_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
>  			-1),
> -	PP_BLK_DIPHER("pingpong_6", PINGPONG_6, 0x66000, MERGE_3D_3, sc7280_pp_sblk,
> +	PP_BLK_DITHER("pingpong_6", PINGPONG_6, 0x66000, MERGE_3D_3, sc7280_pp_sblk,
>  			-1,
>  			-1),
> -	PP_BLK_DIPHER("pingpong_7", PINGPONG_7, 0x66400, MERGE_3D_3, sc7280_pp_sblk,
> +	PP_BLK_DITHER("pingpong_7", PINGPONG_7, 0x66400, MERGE_3D_3, sc7280_pp_sblk,
>  			-1,
>  			-1),
>  };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 03f162af1a50..ca8a02debda9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -491,7 +491,7 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
>  	.len = 0x20, .version = 0x20000},
>  };
>  
> -#define PP_BLK_DIPHER(_name, _id, _base, _merge_3d, _sblk, _done, _rdptr) \
> +#define PP_BLK_DITHER(_name, _id, _base, _merge_3d, _sblk, _done, _rdptr) \
>  	{\
>  	.name = _name, .id = _id, \
>  	.base = _base, .len = 0, \
> 
