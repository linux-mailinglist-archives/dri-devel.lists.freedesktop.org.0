Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D7272340A
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 02:25:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D1DE10E06D;
	Tue,  6 Jun 2023 00:25:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0092410E0E7
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 00:25:47 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f62b552751so2069078e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jun 2023 17:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686011146; x=1688603146;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6pVDecfV/BYz9QMaz3qiB/Z106nCFvvqH4oCFzszVqo=;
 b=N7ZEF6Wkj+bZNrM2qtv7sDbfsw+hmChjhFwjUJba2Qo9s8RmpUwOOxnJ7c8vHpf+A8
 NA7O4tiebw8A1rK3EF05AbxtJ1YkvtAhVPtBpXGTcZTg8bO/TbP1OjkLxCddOGzjVLqJ
 5KMoXqzaFUUNy7NeXPjrG/Lez5PfbuJsFC5devTBTcoIQgBwfp79EjMGmmx4AqS6/sAH
 QvDxyYLG99A2QRwz/d6wVIHxvApnz8jHf+zLz/g91zXC5M4s/rHFCOXwgO9kxBJpHDjP
 1VUG/Ph3dEBnbAzZeZBybtvT+t6DCsH4tTCQKAXfgO4Wck8eGnnOg03ChGSCaPIaw/l/
 BUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686011146; x=1688603146;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6pVDecfV/BYz9QMaz3qiB/Z106nCFvvqH4oCFzszVqo=;
 b=bL+n6Uu5fa6fKXcCEyuR22q1a7SsdrQYO2lG/93hkGMByXF8eYA0wl6AZh3zHOjHM+
 15z04c4uZxG6awVOurv9jEvnrA7c0EJ08QEk3hjQNQmdxby1o0yvIaCNYtE8zXffgSIs
 TsG9RMfCgQP2VrTHJkHDe/gR/rQwldAxRoW+UpsDCxPFmjrzdwkUxlX3NCXDxbvSSR7r
 VhWXGDVMTjJQNL/GVeuDRy30RCKtUQwJr2KkeyMoSZJNnOEsnOPLktaXM1W/q1T7pXoS
 5CDwrdl66o0cAoh5MgKQlN78ZQ4+H+VCmLZFspjCbnSIU7tpZmC5B8HccDQYxW9yTxRp
 iHGA==
X-Gm-Message-State: AC+VfDw8+btUQnWjW9tLau+qnGCQizrZiO+KKIRmLBT9b9wwnZJm14rL
 AHDSyfI0d20H9VwZF5am1jiSVQ==
X-Google-Smtp-Source: ACHHUZ5scGBZR1QRRrZKXR6QfQndX4wHi2oXhUk7wNlJ2XP7wmi6Ugo/J8fNXMTFBRqRHTlIFpGjgg==
X-Received: by 2002:ac2:53bc:0:b0:4f6:13f1:38a4 with SMTP id
 j28-20020ac253bc000000b004f613f138a4mr239027lfh.41.1686011145891; 
 Mon, 05 Jun 2023 17:25:45 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a056512095000b004f38260f196sm1271670lft.218.2023.06.05.17.25.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jun 2023 17:25:45 -0700 (PDT)
Message-ID: <6be601ab-b5a4-3967-ea45-9965827e9f66@linaro.org>
Date: Tue, 6 Jun 2023 03:25:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v15] drm/msm/dpu: add DSC blocks to the catalog of MSM8998
 and SC8180X
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
 sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
 vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com, agross@kernel.org,
 andersson@kernel.org, marijn.suijten@somainline.org
References: <1686009494-25127-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1686009494-25127-1-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/06/2023 02:58, Kuogee Hsieh wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Some platforms have DSC blocks which have not been declared in the catalog.
> Complete DSC 1.1 support for all platforms by adding the missing blocks to
> MSM8998 and SC8180X.
> 
> Changes in v9:
> -- add MSM8998 and SC8180x to commit title
> 
> Changes in v10:
> -- fix grammar at commit text
> 
> Changes in v12:
> -- fix "titil" with "title" at changes in v9
> 
> Changes in v14:
> -- "dsc" tp "DSC" at commit title
> 
> Changes in v15:
> -- fix merge conflicts at dpu_5_1_sc8180x.h
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 7 +++++++
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 2 ++
>   2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> index 3c732a0..7d0d0e7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> @@ -126,6 +126,11 @@ static const struct dpu_pingpong_cfg msm8998_pp[] = {
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
>   };
>   
> +static const struct dpu_dsc_cfg msm8998_dsc[] = {
> +	DSC_BLK("dsc_0", DSC_0, 0x80000, 0),
> +	DSC_BLK("dsc_1", DSC_1, 0x80400, 0),
> +};
> +
>   static const struct dpu_dspp_cfg msm8998_dspp[] = {
>   	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
>   		 &msm8998_dspp_sblk),
> @@ -199,6 +204,8 @@ const struct dpu_mdss_cfg dpu_msm8998_cfg = {
>   	.dspp = msm8998_dspp,
>   	.pingpong_count = ARRAY_SIZE(msm8998_pp),
>   	.pingpong = msm8998_pp,
> +	.dsc_count = ARRAY_SIZE(msm8998_dsc),
> +	.dsc = msm8998_dsc,
>   	.intf_count = ARRAY_SIZE(msm8998_intf),
>   	.intf = msm8998_intf,
>   	.vbif_count = ARRAY_SIZE(msm8998_vbif),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index 8ed2b263..b5c575c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -230,6 +230,8 @@ const struct dpu_mdss_cfg dpu_sc8180x_cfg = {
>   	.dsc = sc8180x_dsc,
>   	.pingpong_count = ARRAY_SIZE(sc8180x_pp),
>   	.pingpong = sc8180x_pp,
> +	.dsc_count = ARRAY_SIZE(sc8180x_dsc),
> +	.dsc = sc8180x_dsc,

If you take a glance three lines above, you'll see .dsc assignment.

>   	.merge_3d_count = ARRAY_SIZE(sc8180x_merge_3d),
>   	.merge_3d = sc8180x_merge_3d,
>   	.intf_count = ARRAY_SIZE(sc8180x_intf),

-- 
With best wishes
Dmitry

