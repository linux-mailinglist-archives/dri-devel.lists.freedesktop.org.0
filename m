Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8F267AD91
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 10:14:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE7710E744;
	Wed, 25 Jan 2023 09:14:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB8A110E744
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 09:14:27 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id bk16so16329153wrb.11
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 01:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=hc4egPtkQ64b0FEbo02Uoe7pc1GGb6uUcEvT9CW2GlM=;
 b=LgbgqtQsBGbOy2kKL/s2CXN7B0Va4kyOODgbHl7A68rPZg3Y+DfGPMbi2537c+uaN6
 3TuOYPtEvSvJeiSAkuuEUGpE5NuX01wqY55krQTAHIK7MnowYJC9uijfok3Kt5Id6Wul
 zt4Femiu06/arHYCCSNst1kQvA6t+29+xGx4+Wrc/x7Gr0FHzTUMA5a+yiynBIxwQ0WS
 RMnV6ZqJp/F1UcGfIsPY+q0rG6LnAQB4Uplq8d4P1pabfh7VABlgNquIzuDt4ErCIkbj
 /dCdQ2biMFEeeWM0vKxFHRlIFy3iUo3ue2QuJj9XGBmf3FxzT0uJ1vHY6LkrNQW022RC
 3H4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hc4egPtkQ64b0FEbo02Uoe7pc1GGb6uUcEvT9CW2GlM=;
 b=3ozjC3lEhuXjKWfEBV+XXjealAm7WqCAXzt4RtvEsN4xL2T3RdMla4KzLT0X1fYj9B
 DRHfaVnvmekKZ0Hv7tHFBfP2NMsqsdleBKnIXqe/oXoRZdmzZVFSm8FhJ9Aa9+I26/Pi
 oxAUay4I7bVIHComvd3TSFUT7VfI4DM7etuEtluw/C3UcmW+wl9WYVTlx+0vcyxjbHln
 QrAdwd9QZxEDSNKho0vmYVE72G6GIleNh8MOiRNhhc0xr6taPCZm+v0DNQ8Z7LfVThxY
 DJRro1LZT8xHjNkfx1EXkuuGX8hX9yHYkPv8F2VjojDevRNJ6zRCqeVqs3MadQaPIJTI
 bCww==
X-Gm-Message-State: AFqh2krnPWWOSC+PookAOJAm7C814zdeu+D+0CTjb7s15rgxKu5h8T3R
 D7OAZmysH85VRVQpcNLqcF5E0g==
X-Google-Smtp-Source: AMrXdXuwxHGrUcOdE1INuh713o6CIr/hcRn6h0E8yd3uD97y7b+mbl27OCR5aakJ9hopl5M/5G07yQ==
X-Received: by 2002:a5d:410b:0:b0:2bc:7fdd:9248 with SMTP id
 l11-20020a5d410b000000b002bc7fdd9248mr25106933wrp.9.1674638066212; 
 Wed, 25 Jan 2023 01:14:26 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:ad2f:6fa7:d25a:7047?
 ([2a01:e0a:982:cbb0:ad2f:6fa7:d25a:7047])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a5d6acd000000b002bc7f64efa3sm3770776wrw.29.2023.01.25.01.14.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 01:14:25 -0800 (PST)
Message-ID: <27c57fa8-8fcc-1339-8290-547ecceeb2f0@linaro.org>
Date: Wed, 25 Jan 2023 10:14:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/msm/dpu: Add DSC hardware blocks to register snapshot
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org
References: <20230125091315.133283-1-marijn.suijten@somainline.org>
Organization: Linaro Developer Services
In-Reply-To: <20230125091315.133283-1-marijn.suijten@somainline.org>
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
Reply-To: neil.armstrong@linaro.org
Cc: Liu Shixin <liushixin2@huawei.com>,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/01/2023 10:13, Marijn Suijten wrote:
> Add missing DSC hardware block register ranges to the snapshot utility
> to include them in dmesg (on MSM_DISP_SNAPSHOT_DUMP_IN_CONSOLE) and the
> kms debugfs file.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index ad08fb7e7105..44648da310f2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -930,6 +930,11 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
>   		msm_disp_snapshot_add_block(disp_state, cat->wb[i].len,
>   				dpu_kms->mmio + cat->wb[i].base, "wb_%d", i);
>   
> +	/* dump DSC sub-blocks HW regs info */
> +	for (i = 0; i < cat->dsc_count; i++)
> +		msm_disp_snapshot_add_block(disp_state, cat->dsc[i].len,
> +				dpu_kms->mmio + cat->dsc[i].base, "dsc_%d", i);
> +
>   	msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
>   			dpu_kms->mmio + cat->mdp[0].base, "top");
>   

Thanks for the addition, it was missing :-)

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
