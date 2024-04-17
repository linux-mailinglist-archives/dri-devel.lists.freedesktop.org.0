Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AB78A8F60
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 01:33:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3515F10E27C;
	Wed, 17 Apr 2024 23:33:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pKYBZxtq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 366AF10E27C
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 23:33:08 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-516d264d0e4so1414226e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 16:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713396786; x=1714001586; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GytF7V18qJIXql1WNL67e4Efwso8d/2I3bcLgaa+9g4=;
 b=pKYBZxtqnila4mdeFLiWT2b8Iu7I+/hikat630oAiiMHPMHtpytIg3chOjcHqBc6i4
 qRznZb3bknsgf3afZYlPEdSD3oCGK6XNKlXlhzRIZHqsE4OXwSyodLzCMDh5vZGK2CXD
 F68jGl2llgGzTobUV8OudgobNXQhwWkEA2DMsIMEK9g2d2jtpakuJGQdbo1F5klwlRei
 CPxDvzAhkruWeLT+D8v8RJzvvoWF/Hkb+JSPPvyuCEsu12hZdpLYz+SRlj8i4KDj3k0F
 1RUJ1C1raO7XtDuvM5iz2zBCf/vdleF0OSNG1vtcFNGgurhUVMbH811AJTcz7l5L0eEu
 vhMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713396786; x=1714001586;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GytF7V18qJIXql1WNL67e4Efwso8d/2I3bcLgaa+9g4=;
 b=IVGm8vW3n6U5uOEJ/pP5cnVD2x2kzcOWlZ0C/kXeDfpJwtnE7Hc5HQ6vFE11ZfzUTq
 OydYvhqesz451saIUXQdPJq6OZHCbs3t5rWTKuBcBOjljUiMGmKiYiXjB3iOBoGg8qle
 iUwHYTIsHU3eQabOQi4qwZjX/wCYucEXWgGOohOMpSft52ZpqeMZOQjXBRO0XS1cKV9G
 khk9rPHijRcdkzdKC3xiiPZA/kVm7LVc+v/uwofEIPbz/1VaCy7dbt4LEdlHxItVzD+7
 ExsvWhOsDyMP/5dTW8feCHX5S9OEefkFCNe/xRZOB+o+So4iapIjwgF0hQ+IHbYShMh5
 zFoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzExsKyaldW179jerq0ef6lR+yaHtepCVJ6fTPsMr8oCIs4dqC3xvgwDL+Qk9RlbEXBDG6Jpv9XNNVQudSvR4XDr7zjU9Vgp/TQdAGFBvr
X-Gm-Message-State: AOJu0YxvfbY1OY7uHI3EMwV1cAAEUzket5K4q6ieWe9ZZ7wwx6nl7t6b
 inR+HpcFJw3cHHbsDCR07RndyvI5GfldUuvh5/IO4rnMA0qmwWbJ52csYKbARno=
X-Google-Smtp-Source: AGHT+IHb+xsUm4VWJnMlwMtid9HXu7fUVpDqeCABMYuWcpnukoEv8gokW3GsekdP+AHyE8ovJem9iw==
X-Received: by 2002:a19:914c:0:b0:519:5fb9:832b with SMTP id
 y12-20020a19914c000000b005195fb9832bmr122358lfj.12.1713396786144; 
 Wed, 17 Apr 2024 16:33:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 e4-20020ac25464000000b00515d1c97053sm33367lfn.223.2024.04.17.16.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 16:33:05 -0700 (PDT)
Date: Thu, 18 Apr 2024 02:33:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Archit Taneja <architt@codeaurora.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, Vinod Koul <vkoul@kernel.org>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jordan Crouse <jordan@cosmicpenguin.net>, Rajesh Yadav <ryadav@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>
Subject: Re: [PATCH 7/7] drm/msm/dpu: Rename `ctx` parameter to `intf` to
 match other functions
Message-ID: <er2p6zazlvc2okzbbqjkzy4mif3ukjes56nfow6kwybmkjxvtr@4ihyqymqzvit>
References: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-0-78ae3ee9a697@somainline.org>
 <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-7-78ae3ee9a697@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-7-78ae3ee9a697@somainline.org>
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

On Wed, Apr 17, 2024 at 01:57:47AM +0200, Marijn Suijten wrote:
> All other functions in dpu_hw_intf name the "self" parameter `intf`,
> except dpu_hw_intf_setup_timing_engine() and the recently added
> dpu_hw_intf_program_intf_cmd_cfg().  Clean that up for consistency.

I really have mixed feelings towards such patches. On one hand it
improves readability, on the other hand, it's just a name, it has no
specific value.

Still:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 965692ef7892..34d0c4e04d27 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -96,11 +96,11 @@
>  #define INTF_CFG2_DCE_DATA_COMPRESS     BIT(12)
>  
>  
> -static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
> +static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
>  		const struct dpu_hw_intf_timing_params *p,
>  		const struct dpu_format *fmt)
>  {
> -	struct dpu_hw_blk_reg_map *c = &ctx->hw;
> +	struct dpu_hw_blk_reg_map *c = &intf->hw;
>  	u32 hsync_period, vsync_period;
>  	u32 display_v_start, display_v_end;
>  	u32 hsync_start_x, hsync_end_x;
> @@ -118,7 +118,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>  	/* read interface_cfg */
>  	intf_cfg = DPU_REG_READ(c, INTF_CONFIG);
>  
> -	if (ctx->cap->type == INTF_DP)
> +	if (intf->cap->type == INTF_DP)
>  		dp_intf = true;
>  
>  	hsync_period = p->hsync_pulse_width + p->h_back_porch + p->width +
> @@ -223,7 +223,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>  	DPU_REG_WRITE(c, INTF_FRAME_LINE_COUNT_EN, 0x3);
>  	DPU_REG_WRITE(c, INTF_CONFIG, intf_cfg);
>  	DPU_REG_WRITE(c, INTF_PANEL_FORMAT, panel_format);
> -	if (ctx->cap->features & BIT(DPU_DATA_HCTL_EN)) {
> +	if (intf->cap->features & BIT(DPU_DATA_HCTL_EN)) {
>  		/*
>  		 * DATA_HCTL_EN controls data timing which can be different from
>  		 * video timing. It is recommended to enable it for all cases, except
> @@ -518,10 +518,10 @@ static void dpu_hw_intf_disable_autorefresh(struct dpu_hw_intf *intf,
>  
>  }
>  
> -static void dpu_hw_intf_program_intf_cmd_cfg(struct dpu_hw_intf *ctx,
> +static void dpu_hw_intf_program_intf_cmd_cfg(struct dpu_hw_intf *intf,
>  					     struct dpu_hw_intf_cmd_mode_cfg *cmd_mode_cfg)
>  {
> -	u32 intf_cfg2 = DPU_REG_READ(&ctx->hw, INTF_CONFIG2);
> +	u32 intf_cfg2 = DPU_REG_READ(&intf->hw, INTF_CONFIG2);
>  
>  	if (cmd_mode_cfg->data_compress)
>  		intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
> @@ -529,7 +529,7 @@ static void dpu_hw_intf_program_intf_cmd_cfg(struct dpu_hw_intf *ctx,
>  	if (cmd_mode_cfg->wide_bus_en)
>  		intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN;
>  
> -	DPU_REG_WRITE(&ctx->hw, INTF_CONFIG2, intf_cfg2);
> +	DPU_REG_WRITE(&intf->hw, INTF_CONFIG2, intf_cfg2);
>  }
>  
>  struct dpu_hw_intf *dpu_hw_intf_init(struct drm_device *dev,
> 
> -- 
> 2.44.0
> 

-- 
With best wishes
Dmitry
