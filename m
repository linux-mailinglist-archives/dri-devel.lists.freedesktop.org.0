Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E68F74BB38
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 03:57:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00FFB10E058;
	Sat,  8 Jul 2023 01:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CAF110E053
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jul 2023 01:57:36 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b69dcf45faso41234101fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 18:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688781454; x=1691373454;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Wwkh8pKXmB000uFIXf7QzEd4TnjTv7TK1I8MwngSb1U=;
 b=cB0DDfVlNx81Qa+CdHuaDXkowhn0UIBmUijEi6/MK4yPEa5LPrIl5HUkqW9yOfi+Mj
 doGsz/KGFFXTl0+Ir/tAb8LAqdtRRZElhL4SOU/DiwFTJnd+1rwJrBJfQi3r4h8IkZFu
 b4yD7Uy69SEFgGgvHrzAt542Py0zA29Z2csDRAexDnt/4HncnOS1Q6ChYc0kxyoDddgS
 sVES9b9y1CFvAKw9wfIKtg3XD+welY86e7QwXV04tby9+P4vdcgWxuCrkl7DWxfU7HtS
 lazyUTHet/c79kSl5R7HDO2wt/FlfM68fEOeovmZ4M5R3tWdLXXmY3RNOF6j3GmZnghL
 3/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688781454; x=1691373454;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wwkh8pKXmB000uFIXf7QzEd4TnjTv7TK1I8MwngSb1U=;
 b=jh4rztvuhMOGubqEiDl9c/+3OTtjOoSLe9nv+2VLJSETUU5h9hX4ksdR8T1H5o1ToG
 eQOQH13J8dFcZ+5MvlzbgYcCrZJ74xvHHTP7LBY/i1Fm7ub7SYsgmN0iAPgz75mEIM0b
 7+VFBtmwvGGCVIbrAuyLznN3acgtZJXDqK4JYntWIo/Xn2wupWOJhPvoaFVBpF4ErYAy
 CFEjBBSPl68H7Ml70/VWVtQaR1G8SR0w9PfUhtXvcxTbXr5i4TMV2K6zRRjmDu783j/V
 Is+vK7+iIZuhEARaJLMCyULNTXUj6gxvD8ikcNRElJ4+5H3dPDBfRP7AEH6SLBot+/+u
 lVeg==
X-Gm-Message-State: ABy/qLbFx6T+VUHAdQzg7XACrj6LLBh44GNn+E87E/duIRD6l0B49JkJ
 fk6su6mblO8SoXWcjo+gfpODCQ==
X-Google-Smtp-Source: APBJJlFDVaBc1zEui+gCBg4MQrnljMQkMGLMJ5lft3Q2Ug4r1ftxh54PBw/phWz3nZmMH8jMFkZIpQ==
X-Received: by 2002:a2e:8295:0:b0:2b6:9ab8:9031 with SMTP id
 y21-20020a2e8295000000b002b69ab89031mr2673029ljg.16.1688781454254; 
 Fri, 07 Jul 2023 18:57:34 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a2e9bc4000000b002b475f087desm1022235ljj.56.2023.07.07.18.57.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 18:57:33 -0700 (PDT)
Message-ID: <014ed874-6481-ba22-c3d7-4c2b082e515d@linaro.org>
Date: Sat, 8 Jul 2023 04:57:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 6/6] drm/msm/dpu: Update dev core dump to dump
 registers of sub-blocks
Content-Language: en-GB
To: Ryan McCann <quic_rmccann@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230622-devcoredump_patch-v5-0-67e8b66c4723@quicinc.com>
 <20230622-devcoredump_patch-v5-6-67e8b66c4723@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230622-devcoredump_patch-v5-6-67e8b66c4723@quicinc.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/07/2023 04:24, Ryan McCann wrote:
> Currently, the device core dump mechanism does not dump registers of
> sub-blocks within the DSPP, SSPP, DSC, and PINGPONG blocks. Edit
> dpu_kms_mdp_snapshot function to account for sub-blocks.
> 
> Signed-off-by: Ryan McCann <quic_rmccann@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 66 +++++++++++++++++++++++++++------
>   1 file changed, 54 insertions(+), 12 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 7a2787279ba0..f7199a5c45ab 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -890,6 +890,7 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
>   	int i;
>   	struct dpu_kms *dpu_kms;
>   	const struct dpu_mdss_cfg *cat;
> +	void __iomem *base;
>   
>   	dpu_kms = to_dpu_kms(kms);
>   
> @@ -903,9 +904,16 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
>   				dpu_kms->mmio + cat->ctl[i].base, cat->ctl[i].name);
>   
>   	/* dump DSPP sub-blocks HW regs info */
> -	for (i = 0; i < cat->dspp_count; i++)
> -		msm_disp_snapshot_add_block(disp_state, cat->dspp[i].len,
> -				dpu_kms->mmio + cat->dspp[i].base, cat->dspp[i].name);
> +	for (i = 0; i < cat->dspp_count; i++) {
> +		base = dpu_kms->mmio + cat->dspp[i].base;
> +		msm_disp_snapshot_add_block(disp_state, cat->dspp[i].len, base, cat->dspp[i].name);
> +
> +		if (cat->dspp[i].sblk && cat->dspp[i].sblk->pcc.len > 0)
> +			msm_disp_snapshot_add_block(disp_state, cat->dspp[i].sblk->pcc.len,
> +						    base + cat->dspp[i].sblk->pcc.base, "%s_%s",
> +						    cat->dspp[i].name,
> +						    cat->dspp[i].sblk->pcc.name);

Nit (no need to resend to correct this): the "%s_%s" logically fits the 
next line, as it it related to the names rather than base address.

> +	}
>   
>   	/* dump INTF sub-blocks HW regs info */
>   	for (i = 0; i < cat->intf_count; i++)

-- 
With best wishes
Dmitry

