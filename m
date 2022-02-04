Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 448D14AA335
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 23:36:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3C5B10ECA3;
	Fri,  4 Feb 2022 22:36:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB6210ECA3
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Feb 2022 22:36:35 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id o17so10474549ljp.1
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Feb 2022 14:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=c7x/cvlOShTxU2gJe80KgOcsq6QIAA84CFY6qHZapHE=;
 b=yAtSvEMHAuKcx9GO/1aZqwwNTknxA1L7vce6ArzLQbnqULt7LUrkE0CDGvrJTwT+2q
 Opk0ugJBzAOgXCBlfKM4aLgLlYt25b07+9bcEn7oXJSHdomwWpzRDUrzXvYyYCoyVMil
 xM73zdZAHrTM+mJYpqk6Cr52kp7/eCdRTrjgAMvfr5sS99VYYNtdUH6xV7ZEJP/pZKXE
 iGZmh39HN0ZXMISDAoC7mWV/ULMDi7VzSnVDvuTOe9rfOvPHVg3QdEGKLQBL7Jn7riTe
 FxL4/XwYJJ/QR25B4iw9inaz0gs+I3UydgMxwLjOsV75gthBM0y6B3vO+npCt4syc5dl
 odjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=c7x/cvlOShTxU2gJe80KgOcsq6QIAA84CFY6qHZapHE=;
 b=iPpPdlKmL5JIHyScQcnxxRBQSIHf+QLsPTU8tDJAbBCPnsPGNwWjAeZKhV9oIAk+rI
 2HDamqDIQyN0hvliT4N28l6NJmDMA7QV3iyrbnqHnp+ayAZtAJ+qrOuIELw6Xy5W/Ycp
 mF/L2KUFTqrPtEuId9UQjX1Vvy4+vckTqlsigKaLnt/NwYN+BCYcOjT5w2RUZNoave/F
 Et25dxeYXjykXODOOlhGAvdBmnaacRrdoY/ffT/ZF7aFEd7zqqMqc1zMIzppQkVuzlSr
 ETJ1kmeBLkkLy8RjBxRPzYwTjghr3VvqslJrvOEnW6c4HonnBwWTiMV3QdzG/bwyDiKf
 QXoA==
X-Gm-Message-State: AOAM533eRmHY6+sZzu+6NXHi+8aZ8M1Qkt79xKxgUUbH/YLTAbbW4/xR
 PZOAz69XLGAcu34D/d3UTCG4TM0UGnM29g==
X-Google-Smtp-Source: ABdhPJza7guCeIafEsHqEj+4mjDnBcgDEeyjXetzyWRS8/qRpdN2KL/BqPWnHD4+5zgY4hI2FXDI4g==
X-Received: by 2002:a2e:9bd4:: with SMTP id w20mr697734ljj.324.1644014193996; 
 Fri, 04 Feb 2022 14:36:33 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id j2sm478643lfc.174.2022.02.04.14.36.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 14:36:33 -0800 (PST)
Message-ID: <06082678-f677-b4e4-67af-d45d11f81c26@linaro.org>
Date: Sat, 5 Feb 2022 01:36:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 12/12] drm/msm/dpu: add writeback blocks to the display
 snapshot
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org
References: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
 <1644009445-17320-13-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1644009445-17320-13-git-send-email-quic_abhinavk@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, swboyd@chromium.org, nganji@codeaurora.org,
 seanpaul@chromium.org, markyacoub@chromium.org, quic_jesszhan@quicinc.com,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/02/2022 00:17, Abhinav Kumar wrote:
> Add writeback block information while capturing the display
> snapshot.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 6327ba9..e227b35 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -987,6 +987,11 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
>   		msm_disp_snapshot_add_block(disp_state, cat->mixer[i].len,
>   				dpu_kms->mmio + cat->mixer[i].base, "lm_%d", i);
>   
> +	/* dump WB sub-blocks HW regs info */
> +	for (i = 0; i < cat->wb_count; i++)
> +		msm_disp_snapshot_add_block(disp_state, cat->wb[i].len,
> +				dpu_kms->mmio + cat->wb[i].base, "wb_%d", i);
> +
>   	msm_disp_snapshot_add_block(disp_state, top->hw.length,
>   			dpu_kms->mmio + top->hw.blk_off, "top");
>   


-- 
With best wishes
Dmitry
