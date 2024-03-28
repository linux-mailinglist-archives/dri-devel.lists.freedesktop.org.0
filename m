Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6E4890B84
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 21:39:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB6710EF18;
	Thu, 28 Mar 2024 20:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CrTf6Yed";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4916E10EF18
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 20:39:09 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a450bedffdfso163188366b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 13:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711658347; x=1712263147; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vXXOSZfz8O5OKgyE9PyGnB12GSSexqRiRe1MSPJ2Dvs=;
 b=CrTf6YedA6ZlYJ6pxzUvHzAl7/wU3V4bYx1Jiw0s6brWT88PdG2rEjIoI15aZ+80w1
 3BiNjD7qbDgY0JRI5m+w8JANIp7SmOt5NcSYZhgIdhVGuJjARViDSuz+ELxupt6NJgrT
 4FrM4rWLccFmSsPwo8gATqp872w+/clQ1Vzqv11CJjV3tV+lWkRuLMqT7jnrUlEkBoX5
 yCuuFGASDorU56FDzDjR5gjJok+6/iotv28OAUuqOeeMyPdIghxlQxV/hdJtvqOijQg0
 Rjtow34gWKi90WxHfUMQtKq2OcFaaETMsPvyvMlYqh3QK1Ysazt1fzL/d+UqAVuyDwBj
 wr5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711658347; x=1712263147;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vXXOSZfz8O5OKgyE9PyGnB12GSSexqRiRe1MSPJ2Dvs=;
 b=U2+vWRmjmabxmjT9JWdJ5f7aWAU9YvpyI2bTOROmu32hmZyb9cJq3a7cSWdPKFK97m
 KbXoj7MOwQEDJI7xOgVA3ACvLsMRK/7nGNyjNKR/D+ZSz76ROtbRlscC8xgApE8kS7Iv
 4+75LdBICso/2KZbEd3eJrMcI3lnOD8kaAAbXNQUEaHFPNiRDu/pGLr4s2c9RvZPrirJ
 9nPwRChgG30KynBRX4ExwoBIRZsXdbi1ImWNMuU8x8ShGy/Mv+R0OgbYKNIIjlHWDmW8
 13cDM272BGGDrzNryBPmgAcq7Bs3rVEUj0vFpltqpF0LfK0hWCbsX+pQ8+EET0mjTaR1
 9SuA==
X-Gm-Message-State: AOJu0YwUcDlnK9Qf/YGToEkwutZLbOn/1Qgmww0KnPk8ovNcL7D8+z/s
 LBEcJYjGerI5TRHPeAix7Z76IUaoPhKVVxlv+IRpacvWIQ5otbT0Tcuk7eRtKHk=
X-Google-Smtp-Source: AGHT+IEfI6/ElqbxX011QI3EBz6Tqo72909UkKh+kFTHngulAL02ypmJA9aR2eFcAe+MhiuYzBH3uw==
X-Received: by 2002:a17:906:2654:b0:a4d:d356:fd69 with SMTP id
 i20-20020a170906265400b00a4dd356fd69mr219001ejc.12.1711658346886; 
 Thu, 28 Mar 2024 13:39:06 -0700 (PDT)
Received: from linaro.org ([79.114.172.194]) by smtp.gmail.com with ESMTPSA id
 mf9-20020a170906cb8900b00a46faaf7427sm1133467ejb.121.2024.03.28.13.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 13:39:06 -0700 (PDT)
Date: Thu, 28 Mar 2024 22:39:04 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run,
 swboyd@chromium.org, dianders@chromium.org, vkoul@kernel.org,
 daniel@ffwll.ch, airlied@gmail.com, agross@kernel.org,
 dmitry.baryshkov@linaro.org, andersson@kernel.org,
 quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com,
 quic_sbillaka@quicinc.com, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] drm/msm/dp: assign correct DP controller ID to
 interface table
Message-ID: <ZgXVaA6mbbUbVR0p@linaro.org>
References: <1711656246-3483-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1711656246-3483-1-git-send-email-quic_khsieh@quicinc.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24-03-28 13:04:05, Kuogee Hsieh wrote:
> At current x1e80100 interface table, interface #3 is wrongly
> connected to DP controller #0 and interface #4 wrongly connected
> to DP controller #2. Fix this problem by connect Interface #3 to
> DP controller #0 and interface #4 connect to DP controller #1.
> Also add interface #6, #7 and #8 connections to DP controller to
> complete x1e80100 interface table.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Nitpick: Probably mention the x1e80100 in the subject line somehow.

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

>  .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   | 34 ++++++++++++++++++++--
>  1 file changed, 31 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
> index 9a9f709..a3e60ac 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
> @@ -324,6 +324,7 @@ static const struct dpu_wb_cfg x1e80100_wb[] = {
>  	},
>  };
>  
> +/* TODO: INTF 3, 8 and 7 are used for MST, marked as INTF_NONE for now */
>  static const struct dpu_intf_cfg x1e80100_intf[] = {
>  	{
>  		.name = "intf_0", .id = INTF_0,
> @@ -358,8 +359,8 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
>  		.name = "intf_3", .id = INTF_3,
>  		.base = 0x37000, .len = 0x280,
>  		.features = INTF_SC7280_MASK,
> -		.type = INTF_DP,
> -		.controller_id = MSM_DP_CONTROLLER_1,
> +		.type = INTF_NONE,
> +		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
>  		.prog_fetch_lines_worst_case = 24,
>  		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
>  		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
> @@ -368,7 +369,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
>  		.base = 0x38000, .len = 0x280,
>  		.features = INTF_SC7280_MASK,
>  		.type = INTF_DP,
> -		.controller_id = MSM_DP_CONTROLLER_2,
> +		.controller_id = MSM_DP_CONTROLLER_1,
>  		.prog_fetch_lines_worst_case = 24,
>  		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 20),
>  		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 21),
> @@ -381,6 +382,33 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
>  		.prog_fetch_lines_worst_case = 24,
>  		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 22),
>  		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 23),
> +	}, {
> +		.name = "intf_6", .id = INTF_6,
> +		.base = 0x3A000, .len = 0x280,
> +		.features = INTF_SC7280_MASK,
> +		.type = INTF_DP,
> +		.controller_id = MSM_DP_CONTROLLER_2,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
> +	}, {
> +		.name = "intf_7", .id = INTF_7,
> +		.base = 0x3b000, .len = 0x280,
> +		.features = INTF_SC7280_MASK,
> +		.type = INTF_NONE,
> +		.controller_id = MSM_DP_CONTROLLER_2,	/* pair with intf_6 for DP MST */
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 18),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 19),
> +	}, {
> +		.name = "intf_8", .id = INTF_8,
> +		.base = 0x3c000, .len = 0x280,
> +		.features = INTF_SC7280_MASK,
> +		.type = INTF_NONE,
> +		.controller_id = MSM_DP_CONTROLLER_1,	/* pair with intf_4 for DP MST */
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
>  	},
>  };
>  
> -- 
> 2.7.4
> 
