Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D6E6EA070
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 02:07:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A5710ED63;
	Fri, 21 Apr 2023 00:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ECEE10ED66
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 00:07:35 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4ec81436975so1049301e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 17:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682035653; x=1684627653;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cLFXBTiLwMvaw8fy77PEa4Rr8nVXq3s6Busf4NAaQdk=;
 b=yrZDLELc1gqcOYTTzXMhdoTTRq0nU+ntXeER+fEQerHoNQfzf+kZ7usuJs7Qs8ScWs
 Ues22fDNrYj1hizTtV+oAGU8o/kQWS3DLzzln7kcdadLuSiYdAKNSta4lMSoR0ZgJ0W4
 7j1zysrCpIdvpTYU+ea+j/KUGxFRtddP173Nc7uxMyK2m1YFQksNE7U30p17p2obZi4Q
 XIQC+PiPYyg/CCgqG43PPbO3Gyy6Lxr0IYgzRjR52Dk/XfJalvcs3qyPkYFIaK4MVerQ
 XVyaLjo8S4sGRe3AEEWD9gD27XcK4+C3A3AS9mPxpAU9MS8Nnw5c8hurbdfldmlykoLQ
 K8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682035653; x=1684627653;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cLFXBTiLwMvaw8fy77PEa4Rr8nVXq3s6Busf4NAaQdk=;
 b=jRQNnAmGQnnA5zSLIwhkMAZ8KmiLTv1QTQ2L6vyZFXJM6hDFqhx67cnxJt0rKZLzlb
 NqS5dyXKAC+n0U0sz9sbsX2Tds0Rpl3jTnN6CDgqrW/LEb8Pk3MsfY6AcECDNz6CcXC3
 0a4bV9xi3f6Fn/7uUqxeNu9qnqSgNgxaSkSDqhiarn4YlxumsLed4JXWExsYdQssFbC5
 AFyfxqR//V4RSWJ8QM7l3+9ZcG4oSrnmpCQNtH+J0D3XDItnWZCQY2DzyfUF+FpU8f/p
 mGOYihye6FivnV4prU+IPtSof0G4E6sx5Kdnf9C20E9cwBqi4yiWJLNoCWKmeYFekP+K
 ix+Q==
X-Gm-Message-State: AAQBX9fVGxcRp1R0Hvv8q1FvOvFuDwcOSSSrYKB6gBWQzeXhBV1WyPwy
 m+CD6SCYO1zzKKH1jAj9wSVNrw==
X-Google-Smtp-Source: AKy350anHEOXvktSuJ20WISPKkbmPhBf8HkSslFqb7f0lANUI6JSvjgax7jzs5LOxFBwdwvcW6GRNg==
X-Received: by 2002:a2e:9e02:0:b0:2a8:ae13:cc31 with SMTP id
 e2-20020a2e9e02000000b002a8ae13cc31mr105168ljk.47.1682035653203; 
 Thu, 20 Apr 2023 17:07:33 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a2e864e000000b002a9f9c358d4sm195909ljj.111.2023.04.20.17.07.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 17:07:32 -0700 (PDT)
Message-ID: <b26dfb22-bf97-b65e-ef06-62098c4eafec@linaro.org>
Date: Fri, 21 Apr 2023 03:07:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 5/5] drm/msm/dpu: add DSC 1.2 hw blocks for relevant
 chipsets
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1682033114-28483-1-git-send-email-quic_khsieh@quicinc.com>
 <1682033114-28483-6-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1682033114-28483-6-git-send-email-quic_khsieh@quicinc.com>
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/04/2023 02:25, Kuogee Hsieh wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Add DSC 1.2 hardware blocks to the catalog with necessary
> sub-block and feature flag information.
> Each display compression engine (DCE) contains dual hard
> slice DSC encoders so both share same base address but with
> its own different sub block address.

Please correct line wrapping. 72-75 is usually the preferred width

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h  | 19 +++++++++++++++++++
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h  | 11 +++++++++++
>   .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h    | 21 +++++++++++++++++++++
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h  | 19 +++++++++++++++++++
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h  | 19 +++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c      | 12 ++++++++++--
>   6 files changed, 99 insertions(+), 2 deletions(-)
> 


[I commented on sm8550, it applies to all the rest of platforms]

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index 9e40303..72a7bcf 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -165,6 +165,23 @@ static const struct dpu_merge_3d_cfg sm8550_merge_3d[] = {
>   	MERGE_3D_BLK("merge_3d_3", MERGE_3D_3, 0x66700),
>   };
>   
> +static const struct dpu_dsc_sub_blks sm8550_dsc_sblk_0 = {
> +	.enc = {.base = 0x100, .len = 0x100},
> +	.ctl = {.base = 0xF00, .len = 0x10},
> +};
> +
> +static const struct dpu_dsc_sub_blks sm8550_dsc_sblk_1 = {
> +	.enc = {.base = 0x200, .len = 0x100},
> +	.ctl = {.base = 0xF80, .len = 0x10},
> +};

Please keep sblk in dpu_hw_catalog for now.

> +
> +static const struct dpu_dsc_cfg sm8550_dsc[] = {
> +	DSC_BLK_1_2("dsc_0", DSC_0, 0x80000, 0x100, 0, sm8550_dsc_sblk_0),
> +	DSC_BLK_1_2("dsc_0", DSC_1, 0x80000, 0x100, 0, sm8550_dsc_sblk_1),

Is there a reason why index in "dsc_N" doesn't match the DSC_n which 
comes next to it?

> +	DSC_BLK_1_2("dsc_1", DSC_2, 0x81000, 0x100, BIT(DPU_DSC_NATIVE_422_EN), sm8550_dsc_sblk_0),
> +	DSC_BLK_1_2("dsc_1", DSC_3, 0x81000, 0x100, BIT(DPU_DSC_NATIVE_422_EN), sm8550_dsc_sblk_1),
> +};
> +
>   static const struct dpu_intf_cfg sm8550_intf[] = {
>   	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>   	/* TODO TE sub-blocks for intf1 & intf2 */
> @@ -218,6 +235,8 @@ const struct dpu_mdss_cfg dpu_sm8550_cfg = {
>   	.dspp = sm8550_dspp,
>   	.pingpong_count = ARRAY_SIZE(sm8550_pp),
>   	.pingpong = sm8550_pp,
> +	.dsc = sm8550_dsc,
> +	.dsc_count = ARRAY_SIZE(sm8550_dsc),
>   	.merge_3d_count = ARRAY_SIZE(sm8550_merge_3d),
>   	.merge_3d = sm8550_merge_3d,
>   	.intf_count = ARRAY_SIZE(sm8550_intf),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 03f162a..be08158 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
> - * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2022-2023, Qualcomm Innovation Center, Inc. All rights reserved.
>    */
>   
>   #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
> @@ -540,7 +540,15 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
>   	{\
>   	.name = _name, .id = _id, \
>   	.base = _base, .len = 0x140, \
> -	.features = _features, \
> +	.features = BIT(DPU_DSC_HW_REV_1_1) | _features, \
> +	}
> +
> +#define DSC_BLK_1_2(_name, _id, _base, _len, _features, _sblk) \
> +	{\
> +	.name = _name, .id = _id, \
> +	.base = _base, .len = _len, \
> +	.features = BIT(DPU_DSC_HW_REV_1_2) | _features, \
> +	.sblk = &_sblk, \
>   	}
>   
>   /*************************************************************

-- 
With best wishes
Dmitry

