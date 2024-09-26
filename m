Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96050987436
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 15:10:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C94EF10E0F9;
	Thu, 26 Sep 2024 13:09:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EFrZV3Xx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB75E10E0F9
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 13:09:47 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2f758f84dfbso9231771fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 06:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727356186; x=1727960986; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=k0SGTX2nctnE3KyD4azI9HnZaZaGIo1VmsjB0a2s02c=;
 b=EFrZV3XxG+k3noVezCzEq6w1rpu+oZX4qSMRo/bWimoWIfCZu0ZRcHv916G0KI/3tI
 uqfqvCr4NAjOZSaQ/VKslB8HmKi3e/fpwy1nrvkHlAw6XKLiXBE38/6BkRt0ak9t9TWK
 4XUx6q5DLJBUhr64OTvwoKXyc/SpL/Tqoy3mIUxWw/y6vlQf6YBGpuGxRBHZxgGgSN5k
 znSCZO7qtbrxRKVJiUBqd7FA+Lkngiezn33sCrUuAni4BtPnyobrDG9LeydFHCHBlN3I
 8hE7O6HJGBA9bkkHVd15VU+/IyoHiqZ9X9VeyvePa1JJt6Dk/BZBMPfUnSdCdvi0xD67
 HBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727356186; x=1727960986;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k0SGTX2nctnE3KyD4azI9HnZaZaGIo1VmsjB0a2s02c=;
 b=mVClutWS68xA8VQhEfG/9+3tUbFwn1Tk3bF4/GnLZ1PbqI6MOzYvxJUSt7TL9CzIrE
 AdSzO1DihotJbK1fzBQW9etSk31NZKra4WmB8pKyJ6sqzjxbFBXdTmflS1Wp2iuLJZqG
 wdJhC4Wab7FD0fKCFvXlLcnaccHJg9BqhCB4L01TBLOiXNsEWRODViRIX+JohtzrnDxs
 ZZCzb4VnQDGaoIRNtB3FNyg0s8MohtKEeH/L5okNARPd2EjSeFc71tivUc6JsMjGLSqh
 1ir+ewgICNTL+rQsjMC8w05jhlM1JiJJYvRJg+4Z56+iW0kjwig8nx3nVd0/WptRKW6m
 6aKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEjo/dPjIfJZ6UBmB7kjEY9uQBZuSeJO5xLEVUmIwFDQs8jYiVGx1nGjVu+PETONxVqjdt9s2OTEo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymkV4WDI6CGPV56ffYy3WP4NXQc5+6OYHkMpblVz4ymJRiLUUd
 JUqX8ap1v1D14HcpmwGqA2Ho/yLMYGGqZXyVeWdzoPg5J/65lxacaFBYTFI8i7E=
X-Google-Smtp-Source: AGHT+IFIZ8N2PzyIbt/P6m8oH4XHu1xxQSGSi1EgiBbvFKiw4ooio7bVELxIdaHYqsHU5DjpOpkmaw==
X-Received: by 2002:a2e:a9aa:0:b0:2ef:2490:46fb with SMTP id
 38308e7fff4ca-2f91ca45fd8mr43948201fa.37.1727356185641; 
 Thu, 26 Sep 2024 06:09:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f8d283c427sm7986751fa.53.2024.09.26.06.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 06:09:44 -0700 (PDT)
Date: Thu, 26 Sep 2024 16:09:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Mahadevan <quic_mahap@quicinc.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, swboyd@chromium.org, 
 konrad.dybcio@linaro.org, danila@jiaxyga.com, bigfoot@classfun.cn, 
 neil.armstrong@linaro.org, mailingradian@gmail.com, quic_jesszhan@quicinc.com, 
 andersson@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 quic_kalyant@quicinc.com, quic_jmadiset@quicinc.com, quic_vpolimer@quicinc.com
Subject: Re: [PATCH v2 4/5] drm/msm/dpu: Add SA8775P support
Message-ID: <w26xpuqeltoxjvewo4zesnjazw23onovcasltzcwrejdpgav2h@p6fj2lts2n4s>
References: <20240926110137.2200158-1-quic_mahap@quicinc.com>
 <20240926110137.2200158-5-quic_mahap@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926110137.2200158-5-quic_mahap@quicinc.com>
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

On Thu, Sep 26, 2024 at 04:31:36PM GMT, Mahadevan wrote:
> Add definitions for the display hardware used on the
> Qualcomm SA8775P platform.
> 
> Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
> ---

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Minor nit below.

> [v2]
> - Reorder compatible string of DPU based on alphabetical order.[Dmitry]
> 
> ---
>  .../msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h   | 485 ++++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   3 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   3 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   3 +-
>  4 files changed, 491 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> new file mode 100644
> index 000000000000..14d65b5d4093
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> @@ -0,0 +1,485 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.

What exactly is copyrighted by LF?

> + */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index dcb4fd85e73b..6f60fff2c9a6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
> - * Copyright (c) 2022-2023, Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2022-2024, Qualcomm Innovation Center, Inc. All rights reserved.

I am not a lawyer, but I don't think a single #include is copyrightable.
Neither are single data lines in other files.

>   */
>  
>  #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
> @@ -699,6 +699,7 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
>  
>  #include "catalog/dpu_8_0_sc8280xp.h"
>  #include "catalog/dpu_8_1_sm8450.h"
> +#include "catalog/dpu_8_4_sa8775p.h"
>  
>  #include "catalog/dpu_9_0_sm8550.h"
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 37e18e820a20..cff16dcf277f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
> - * Copyright (c) 2022-2023, Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2022-2024, Qualcomm Innovation Center, Inc. All rights reserved.
>   * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
>   */
>  
> @@ -850,6 +850,7 @@ extern const struct dpu_mdss_cfg dpu_sm8350_cfg;
>  extern const struct dpu_mdss_cfg dpu_sc7280_cfg;
>  extern const struct dpu_mdss_cfg dpu_sc8280xp_cfg;
>  extern const struct dpu_mdss_cfg dpu_sm8450_cfg;
> +extern const struct dpu_mdss_cfg dpu_sa8775p_cfg;
>  extern const struct dpu_mdss_cfg dpu_sm8550_cfg;
>  extern const struct dpu_mdss_cfg dpu_sm8650_cfg;
>  extern const struct dpu_mdss_cfg dpu_x1e80100_cfg;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 9bcae53c4f45..16a0b417435e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -2,7 +2,7 @@
>  /*
>   * Copyright (C) 2013 Red Hat
>   * Copyright (c) 2014-2018, The Linux Foundation. All rights reserved.
> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   *
>   * Author: Rob Clark <robdclark@gmail.com>
>   */
> @@ -1447,6 +1447,7 @@ static const struct dev_pm_ops dpu_pm_ops = {
>  static const struct of_device_id dpu_dt_match[] = {
>  	{ .compatible = "qcom,msm8998-dpu", .data = &dpu_msm8998_cfg, },
>  	{ .compatible = "qcom,qcm2290-dpu", .data = &dpu_qcm2290_cfg, },
> +	{ .compatible = "qcom,sa8775p-dpu", .data = &dpu_sa8775p_cfg, },
>  	{ .compatible = "qcom,sdm630-mdp5", .data = &dpu_sdm630_cfg, },
>  	{ .compatible = "qcom,sdm660-mdp5", .data = &dpu_sdm660_cfg, },
>  	{ .compatible = "qcom,sdm670-dpu", .data = &dpu_sdm670_cfg, },
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
