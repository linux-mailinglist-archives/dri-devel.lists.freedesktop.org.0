Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8C964CFA9
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 19:43:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1B310E456;
	Wed, 14 Dec 2022 18:43:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBB2E10E455
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 18:43:31 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id cf42so11995612lfb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 10:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6QQ6vV3/AX81QrY5XJ0d2crbOoSDtkNQnoTsWCpJWRk=;
 b=ISjvRW3V/ctFcULn7Fo3o+1ZBwwGaI6F8ntFt3X5L7qua7FqP/CMBbfidj4S2LY/P7
 q2yrXRiwZ5YjFqk9U0IxRs/ue2Y4BXKXOdGaufzlfSi4lQWY4Xj2z7nU1WZ1BQAm7xKo
 AotAQGbwTqhP4aPDym18MANe2g5EaNV1kWbOohN62HrR7oA8s94LHglzFHoODyzYS8Fj
 y6WTM9fKUlsZb0ziCW2Sb/Zlb8AFURIHmvpu2mnFBHogAxkUIBEHdx2OBbESuSjAWH0d
 bRJF4n0q65baB133uWQMOxCzyW9nyQWHNVf9t9BlZbAC9tK/rrR0QZTUiQCbVGi51JRT
 mqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6QQ6vV3/AX81QrY5XJ0d2crbOoSDtkNQnoTsWCpJWRk=;
 b=LKItZVbbrptDRd/XTw8JUce6DEG/mRuzL6Nya2Je3X57VBeDlP6taRjZdyrEqmYusa
 2i/x+x7octGk+8EJC4zQsTXeJwsZZ0m0hbJizljRKCRxa0cFKaWBbBT6JYaRHkR6Irex
 OJe+mssIVEXWg410rK5FuCOiWXsoJa2nt4mUjMEAINDlQ8odIxKx2qrCZKEuyPLXgeZ3
 gtu0mwmmNJtF/bdHloWJ6c8GkFyNBFStMW90nk50TCgHypeNw8OnTIui/NZIuZag8pxe
 Qc/CeuSmc5YJ/NshbLHDo1GLZeSKzFWrE34HHhKFfDH6ho//kKwW+icPXMXSS0dQpq9f
 PfBg==
X-Gm-Message-State: ANoB5pl7JurPdIzkvQe0cAU4U5+1zEBa0VS8fecpBtVexS+6DliqDS9q
 v6Vrq/IWtN9OeBPUOLBf4oezkA==
X-Google-Smtp-Source: AA0mqf64jARPZqX/nQEHDDjC2qmaXxx0n0cHQCHNBt5xUMOWTX3J6MSBdNqMt0e2oZrhwzeUy6Lj3A==
X-Received: by 2002:a05:6512:2215:b0:4b5:4606:7ae3 with SMTP id
 h21-20020a056512221500b004b546067ae3mr9060707lfu.46.1671043410310; 
 Wed, 14 Dec 2022 10:43:30 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b16-20020a056512071000b004a8b9c68735sm898842lfs.102.2022.12.14.10.43.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 10:43:29 -0800 (PST)
Message-ID: <184d22f1-7ed1-4a67-1c25-9fafeb94db83@linaro.org>
Date: Wed, 14 Dec 2022 20:43:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH 3/6] drm/msm/dpu1: Wire up DSC mask for active CTL
 configuration
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Vinod Koul <vkoul@kernel.org>
References: <20221213232207.113607-1-marijn.suijten@somainline.org>
 <20221213232207.113607-4-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221213232207.113607-4-marijn.suijten@somainline.org>
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Haowen Bai <baihaowen@meizu.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, sunliming <sunliming@kylinos.cn>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/12/2022 01:22, Marijn Suijten wrote:
> Active CTLs have to configure what DSC block(s) have to be enabled, and
> what DSC block(s) have to be flushed; this value was initialized to zero
> resulting in the necessary register writes to never happen (or would
> write zero otherwise).  This seems to have gotten lost in the DSC v4->v5
> series while refactoring how the combination with merge_3d was handled.
> 
> Fixes: 58dca9810749 ("drm/msm/disp/dpu1: Add support for DSC in encoder")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c  | 2 ++
>   3 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index ae28b2b93e69..35791f93c33d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -61,6 +61,7 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>   	intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_CMD;
>   	intf_cfg.stream_sel = cmd_enc->stream_sel;
>   	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
> +	intf_cfg.dsc = dpu_encoder_helper_get_dsc(phys_enc);
>   	ctl->ops.setup_intf_cfg(ctl, &intf_cfg);
>   
>   	/* setup which pp blk will connect to this intf */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index 0f71e8fe7be7..9ee3a7306a5f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -274,6 +274,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
>   	intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_VID;
>   	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
>   	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
> +	intf_cfg.dsc = dpu_encoder_helper_get_dsc(phys_enc);
>   	if (phys_enc->hw_pp->merge_3d)
>   		intf_cfg.merge_3d = phys_enc->hw_pp->merge_3d->idx;
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index 7cbcef6efe17..92ddf9995b37 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -209,6 +209,7 @@ static void dpu_encoder_phys_wb_setup_cdp(struct dpu_encoder_phys *phys_enc)
>   
>   		intf_cfg.intf = DPU_NONE;
>   		intf_cfg.wb = hw_wb->idx;
> +		intf_cfg.dsc = dpu_encoder_helper_get_dsc(phys_enc);

We usually don't have DSC with the writeback, don't we?

>   		if (mode_3d && hw_pp && hw_pp->merge_3d)
>   			intf_cfg.merge_3d = hw_pp->merge_3d->idx;
> @@ -230,6 +231,7 @@ static void dpu_encoder_phys_wb_setup_cdp(struct dpu_encoder_phys *phys_enc)
>   		intf_cfg.wb = hw_wb->idx;
>   		intf_cfg.mode_3d =
>   			dpu_encoder_helper_get_3d_blend_mode(phys_enc);
> +		intf_cfg.dsc = dpu_encoder_helper_get_dsc(phys_enc);
>   		phys_enc->hw_ctl->ops.setup_intf_cfg(phys_enc->hw_ctl, &intf_cfg);
>   	}
>   }

-- 
With best wishes
Dmitry

