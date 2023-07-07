Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CADA74A7FC
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 02:07:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F5810E4E0;
	Fri,  7 Jul 2023 00:07:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0294F10E4DB
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 00:07:48 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b70bfc8db5so5680771fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 17:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688688467; x=1691280467;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F28CkGKtrRq/JphfDh7W7gy1EaRmjF7asRrwFDHSU+M=;
 b=u//N4ir1xng6mEM/eKQJ5eJvg5rAqP+U1AmMbhXJH4tsBRdMVb7BN7YcA9luS/TNWx
 HtcugFRngOELojkyPok/BOpic45TluwMwoOSDVH1KeA0DMoqDHe0PqGJAbr9J/+0K4jV
 Qj7ubBVTxCkM73QLP3xTWnaVR7TNHR2TJg82MIUl5DaU3XasRdVRmohd1okQ+TNBv8MI
 iOBAxjlup+FJ/pS0DC5YQq3j4fe5iy6EuQ8MjHNCuQ8fTXRIh5Py31nTWZHFjnK2OO3d
 sa3kfiDlSv9Fq7sLQhp+/OqyjhQsBLk0hF6A6GSh199HMIm3aul+2tb6rjRJRKwCR+3A
 IIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688688467; x=1691280467;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F28CkGKtrRq/JphfDh7W7gy1EaRmjF7asRrwFDHSU+M=;
 b=RqWF68KAcOfD+5ipTH8eY8WYe4OrVA440R2xvoYNt7fLnB4eXzACLgAKngfbxw8YZa
 ygSvOU8tfx+n1irOzjurJHG0FCDr7aR5PKYqnx2v/WohjabE4zdam40gCbWxmGUmECkk
 SBxxFJ40tQrheD6FQdlb+YW2gKTmjFvq0lXzZtAjjisNp+cpG4VO34K/tbzTn7HvjkF2
 T3IcX1NnD6Kf6OUyPSx6HRFcW1wDHmCIyrBRzzrJzHqotU+Efw5Uu87uFIK/S2HyQtKe
 kKL4joDiTpQ8e4YBBLQKbsatB8OcLGvIF4JsDMnSxXdshTfDdJF2B00oJsJTHv5mJ89u
 HjVg==
X-Gm-Message-State: ABy/qLbD5Nxe/YtnCyLR47iPVmy6Hg0MzamWyl0tGin7bv6lHnbykK0+
 09ze6x+fM4SuDtKJEGtS6KJ0mQ==
X-Google-Smtp-Source: APBJJlHXU91JXNbEGC9i57r6waY7jofkpsgKwMCjYlKv0bIz5bxi/IhwM6btGXEIQYBnwXvN56xuTA==
X-Received: by 2002:a2e:2405:0:b0:2b6:ce35:2e9e with SMTP id
 k5-20020a2e2405000000b002b6ce352e9emr2408610ljk.44.1688688467134; 
 Thu, 06 Jul 2023 17:07:47 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 x22-20020a2e8396000000b002b700952298sm530462ljg.33.2023.07.06.17.07.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 17:07:46 -0700 (PDT)
Message-ID: <deb38d54-bf7f-f42a-8b61-f6c8f46370b0@linaro.org>
Date: Fri, 7 Jul 2023 03:07:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 5/6] drm/msm/dpu: Refactor printing of main blocks in
 device core dump
Content-Language: en-GB
To: Ryan McCann <quic_rmccann@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230622-devcoredump_patch-v4-0-e304ddbe9648@quicinc.com>
 <20230622-devcoredump_patch-v4-5-e304ddbe9648@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230622-devcoredump_patch-v4-5-e304ddbe9648@quicinc.com>
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

On 06/07/2023 23:48, Ryan McCann wrote:
> Currently, the names of main blocks are hardcoded into the
> msm_disp_snapshot_add_block function rather than using the name that
> already exists in the catalog. Change this to take the name directly from
> the catalog instead of hardcoding it.
> 
> Signed-off-by: Ryan McCann <quic_rmccann@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 32 ++++++++++++++++----------------
>   1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index aa8499de1b9f..70dbb1204e6c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -899,38 +899,38 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
>   
>   	/* dump CTL sub-blocks HW regs info */
>   	for (i = 0; i < cat->ctl_count; i++)
> -		msm_disp_snapshot_add_block(disp_state, cat->ctl[i].len,
> -				dpu_kms->mmio + cat->ctl[i].base, "ctl_%d", i);
> +		msm_disp_snapshot_add_block(disp_state, cat->ctl[i].len, dpu_kms->mmio +
> +					    cat->ctl[i].base, cat->ctl[i].name);

Splitting on the `+' sign is a bad idea. It makes it harder to read the 
code. Please keep the first line as is, it is perfectly fine on its own, 
and do just what you have stated in the commit message: change printed 
block name.

>   
>   	/* dump DSPP sub-blocks HW regs info */
>   	for (i = 0; i < cat->dspp_count; i++)
> -		msm_disp_snapshot_add_block(disp_state, cat->dspp[i].len,
> -				dpu_kms->mmio + cat->dspp[i].base, "dspp_%d", i);
> +		msm_disp_snapshot_add_block(disp_state, cat->dspp[i].len, dpu_kms->mmio +
> +					    cat->dspp[i].base, cat->dspp[i].name);
>   
>   	/* dump INTF sub-blocks HW regs info */
>   	for (i = 0; i < cat->intf_count; i++)
> -		msm_disp_snapshot_add_block(disp_state, cat->intf[i].len,
> -				dpu_kms->mmio + cat->intf[i].base, "intf_%d", i);
> +		msm_disp_snapshot_add_block(disp_state, cat->intf[i].len, dpu_kms->mmio +
> +					    cat->intf[i].base, cat->intf[i].name);
>   
>   	/* dump PP sub-blocks HW regs info */
>   	for (i = 0; i < cat->pingpong_count; i++)
> -		msm_disp_snapshot_add_block(disp_state, cat->pingpong[i].len,
> -				dpu_kms->mmio + cat->pingpong[i].base, "pingpong_%d", i);
> +		msm_disp_snapshot_add_block(disp_state, cat->pingpong[i].len, dpu_kms->mmio +
> +					    cat->pingpong[i].base, cat->pingpong[i].name);
>   
>   	/* dump SSPP sub-blocks HW regs info */
>   	for (i = 0; i < cat->sspp_count; i++)
> -		msm_disp_snapshot_add_block(disp_state, cat->sspp[i].len,
> -				dpu_kms->mmio + cat->sspp[i].base, "sspp_%d", i);
> +		msm_disp_snapshot_add_block(disp_state, cat->sspp[i].len, dpu_kms->mmio +
> +					    cat->sspp[i].base, cat->sspp[i].name);
>   
>   	/* dump LM sub-blocks HW regs info */
>   	for (i = 0; i < cat->mixer_count; i++)
> -		msm_disp_snapshot_add_block(disp_state, cat->mixer[i].len,
> -				dpu_kms->mmio + cat->mixer[i].base, "lm_%d", i);
> +		msm_disp_snapshot_add_block(disp_state, cat->mixer[i].len, dpu_kms->mmio +
> +					    cat->mixer[i].base, cat->mixer[i].name);
>   
>   	/* dump WB sub-blocks HW regs info */
>   	for (i = 0; i < cat->wb_count; i++)
> -		msm_disp_snapshot_add_block(disp_state, cat->wb[i].len,
> -				dpu_kms->mmio + cat->wb[i].base, "wb_%d", i);
> +		msm_disp_snapshot_add_block(disp_state, cat->wb[i].len, dpu_kms->mmio +
> +					    cat->wb[i].base, cat->wb[i].name);
>   
>   	if (cat->mdp[0].features & BIT(DPU_MDP_PERIPH_0_REMOVED)) {
>   		msm_disp_snapshot_add_block(disp_state, MDP_PERIPH_TOP0,
> @@ -944,8 +944,8 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
>   
>   	/* dump DSC sub-blocks HW regs info */
>   	for (i = 0; i < cat->dsc_count; i++)
> -		msm_disp_snapshot_add_block(disp_state, cat->dsc[i].len,
> -				dpu_kms->mmio + cat->dsc[i].base, "dsc_%d", i);
> +		msm_disp_snapshot_add_block(disp_state, cat->dsc[i].len, dpu_kms->mmio +
> +					    cat->dsc[i].base, cat->dsc[i].name);
>   
>   	pm_runtime_put_sync(&dpu_kms->pdev->dev);
>   }
> 

-- 
With best wishes
Dmitry

