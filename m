Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9AF9FC05C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 17:33:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E1210E2A4;
	Tue, 24 Dec 2024 16:32:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="O0xBU6in";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1B6A10E2A4
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 16:32:43 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-53f22fd6832so5723232e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 08:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735057901; x=1735662701; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=x3MFOlRalG3Ekb8Hf1Tn9ELeWDSVPYov3HTEuP7yeXk=;
 b=O0xBU6inL0WFrew3EIcE7KeN4w94mC0z5Ah/qjAxHDQ0kgj8hvrVFP0UiBzW01yw+A
 jNMCdOF0piX8Z0xj9HOXXl1zO8JMhhKsvJ/bd/M33yWd7uG/LqrmdU/Yc8sVumsadsyd
 GWsGYN3pjigQm3lJ+yf1PDXsZIZ/Dg5OGgAQJCsGLz1QOWUbsf83dptLq3sruVXheHII
 gYVIpmH4B3Sz4VUAZ/X4Rpjkw66Q+KWDVLhIAgd59VwxC8AKfeapJDeiLB1hAxA+gROr
 uFfAMgd4KrL9ofJw+Yr5ePuxnXG4L7bxZcQy5zeC416rtXNWmPHccACOlRA/02vk07eZ
 DTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735057901; x=1735662701;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x3MFOlRalG3Ekb8Hf1Tn9ELeWDSVPYov3HTEuP7yeXk=;
 b=FcuUSmiP0iSzY9yhxT5+KYqcarqjDb+uryICoSX5wRvFIyEE0ShkcUtI5rgKDREaya
 6lsir9tQlxvEFevQWpZuEEvuvWYSD4MMyn6hBbFB6tD/UwUVccJj8Le6QfEzkYEfSnTR
 OEoDH5AbdeObO0AhuZFFqu3WmpwSIlmXY6Eov9LsUdVOUwj/3LuhdW9ZNxcf9gtza+ni
 YOofQdExhUSy0rON9zlRFh9m6urF+JH2XQuCz0Z+p2IO++tR2h/RJ8spys7XbEXaeje+
 wek1YrSg9hS1zziBJ60HtEO2SPbFrAZhHPfkUjgHts2WD/SSN6xYsTZt+hgewrU8VUU5
 Osug==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7qRd6d41QpXDqogzLNKr57PgcuJTI5ujUExltpvd2TIC9LnCd63dFIFvTc8rE9m80JcJilnuC+Xw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw26XBpjy+meAmofv2Zw/eVL8/M3eycIHvrukR7+VhBkDs1GEtD
 S1oHiPEUCo22HrxLXXEvPEqoEyAgwDJ8mEo3+cffQHFOTJcGpz1EyNUKAEUfp8Q=
X-Gm-Gg: ASbGncttlMlv7fpUt/DPG5qa55c2UIwpfsTqAviAcDBck1o++4HjaVTNwO++ZnO3N9B
 o/SdZ/H1rNbjAoWwPzbHEZIhj2i4j7wk/GL0biBJiQHFYe19HTkxIzd1ZAZJhICnWr0wSHFO7/M
 n5DEQXBvfWlt+vLn/OpL3RxrGzJ6Cdnv0sw8PTAkXuDT6OTPYNo2x+XMoDL4zulqFH7Ze8dyxrc
 g/+UYzsCPq21/P9LmwpM3+iKKQgRBCbS60NivQKL+qLdMKLSewfsORZgJd5UhZXtujCwu4e9iCN
 +UReGo4bwIJfZDT2YC6LNnkWnDLo6l4ifel3
X-Google-Smtp-Source: AGHT+IGXPwN2YrDgsQJ+IKq9Y23nso1YpIDMPGGmx60GJFPNz/bv/hGvqa9qI2WNe9cKJTy53cOZZQ==
X-Received: by 2002:a05:6512:2342:b0:540:1b7e:c900 with SMTP id
 2adb3069b0e04-54229532aecmr5319653e87.14.1735057901531; 
 Tue, 24 Dec 2024 08:31:41 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f6295sm1621702e87.22.2024.12.24.08.31.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Dec 2024 08:31:39 -0800 (PST)
Date: Tue, 24 Dec 2024 18:31:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v3 10/23] drm/msm/dpu: Add dpu_hw_cwb abstraction for CWB
 block
Message-ID: <pclx6u6vbdjgzarqxva2ivwlpmicrsbghdo644kp6mg5uvjnox@y5g4wssadqwy>
References: <20241016-concurrent-wb-v3-0-a33cf9b93835@quicinc.com>
 <20241016-concurrent-wb-v3-10-a33cf9b93835@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016-concurrent-wb-v3-10-a33cf9b93835@quicinc.com>
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

On Wed, Oct 16, 2024 at 06:21:16PM -0700, Jessica Zhang wrote:
> The CWB mux has its own registers and set of operations. Add dpu_hw_cwb
> abstraction to allow driver to configure the CWB mux.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/Makefile                |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.c  | 73 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.h  | 70 +++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  5 +-
>  4 files changed, 148 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index de7cf60d206241ac03d7e744e048cbfd845f6cc9..26bacd93a148288849d5076c73ef4f294ff2c188 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -78,6 +78,7 @@ msm-display-$(CONFIG_DRM_MSM_DPU) += \
>  	disp/dpu1/dpu_hw_catalog.o \
>  	disp/dpu1/dpu_hw_cdm.o \
>  	disp/dpu1/dpu_hw_ctl.o \
> +	disp/dpu1/dpu_hw_cwb.o \
>  	disp/dpu1/dpu_hw_dsc.o \
>  	disp/dpu1/dpu_hw_dsc_1_2.o \
>  	disp/dpu1/dpu_hw_interrupts.o \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..5fbf52906ea94847a8eb3fcaa372e582dce2357c
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.c
> @@ -0,0 +1,73 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved
> + */
> +
> +#include <drm/drm_managed.h>
> +#include "dpu_hw_cwb.h"
> +
> +#define CWB_MUX              0x000
> +#define CWB_MODE             0x004
> +
> +/* CWB mux block bit definitions */
> +#define CWB_MUX_MASK         GENMASK(3, 0)
> +#define CWB_MODE_MASK        GENMASK(2, 0)
> +
> +static void dpu_hw_cwb_config(struct dpu_hw_cwb *ctx,
> +			      struct dpu_hw_cwb_setup_cfg *cwb_cfg)
> +{
> +	struct dpu_hw_blk_reg_map *c = &ctx->hw;
> +	int cwb_mux_cfg = 0xF;
> +	enum dpu_pingpong pp;
> +	enum cwb_mode_input input;
> +
> +	if (!cwb_cfg)
> +		return;
> +
> +	input = cwb_cfg->input;
> +	pp = cwb_cfg->pp_idx;
> +
> +	if (input >= INPUT_MODE_MAX)
> +		return;
> +
> +	/*
> +	 * The CWB_MUX register takes the pingpong index for the real-time
> +	 * display
> +	 */
> +	if ((pp != PINGPONG_NONE) && (pp < PINGPONG_MAX))
> +		cwb_mux_cfg = FIELD_PREP(CWB_MUX_MASK, pp - PINGPONG_0);
> +
> +	input = FIELD_PREP(CWB_MODE_MASK, input);

Without #include <linux/bitfield.h> this triggers an error on some
platforms as reported by LKP. I'll fix that in place.

> +
> +	DPU_REG_WRITE(c, CWB_MUX, cwb_mux_cfg);
> +	DPU_REG_WRITE(c, CWB_MODE, input);
> +}
> +

-- 
With best wishes
Dmitry
