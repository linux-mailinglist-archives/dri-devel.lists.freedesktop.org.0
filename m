Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3B09D5CE5
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 11:07:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 487E010EB3A;
	Fri, 22 Nov 2024 10:07:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="URCsgubp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83FE10EB39
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 10:07:18 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-539ee1acb86so2130958e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 02:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732270037; x=1732874837; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GO7fVK+g5VXFiw6jUirAsxcaeR1tJ6lVtHXzxXnqFYQ=;
 b=URCsgubpsuoJ2HBqn9lMYqUy22fiRQoDgXD0ubcFiC4tG1PKoFAvLyWzyA6l7UWTiA
 51OwDel3y7bkynps26LzE97oOw1XEGF8TKrCQ8tyqg2VP0zX4Yhu/MEL9WDMIvRbmj1l
 kUai0dbQ+RFl5mto2hFiHHCvyhp34V1G/TCyhAJW9pfa7EyAHqhqQWKZRRiFDdvhVWWB
 3PhLkCniOopf5nGYWYLrwFKAd/zxsRVD5KKEYDcwFeXjwLS0Ix4s6OF+weiziFsSg5uu
 R5GRqhZkQOEDWH6z+DUbyImH0QdbwKMJjIYRcM+LvZItWcmSw+W1TfmtRy32Vsipqtk8
 BfxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732270037; x=1732874837;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GO7fVK+g5VXFiw6jUirAsxcaeR1tJ6lVtHXzxXnqFYQ=;
 b=peUfugV3lob6f1lA9U3lfoGL13I6LF1EUlnGTR7wOMODsqu3XvHYLXSz5cSb8VBkuB
 7/JU518cocIP2s17itfNKh12AUp5yJ6Y6URnWRrV31p1Vg4II+eQH88DCGLhn4eqQas0
 TldkyhKCoSaw9IGOm55zzKlrf05MZRxr13n/50PrIysImJSJwYt/RVHvNNTUpDgG8+xH
 Jd5CIDTWd7D57Pzp2XVp8zLSCO5ZivmOgFZLBEikXxuyY7I/+3SMsM/yUiTdjzUoK6tk
 MSfUPWHmlr3kp4BNdvGXEuoUIpYd9v2BdaiO6AXK72jyuPKsQtLGLz5JlSt62uYuXwyr
 PWnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3RPiF3Y85yx9osGQi7nDUTI0dB/q0Qp7SqrfczSZ8cfObF3BlRPH3Yi6MhILBT51GYI513/UNEzM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNpNP59L56xgzoDV4n9BYRTxkEUUWxecnliMGpxaWHCCGl5ixU
 2Z8RdQ6Q/jujbZuZxUzMvmEWR88kXSsvqvERmGPJxGdxNHK4ohxqfc26FnCD+iY=
X-Gm-Gg: ASbGnctn1L1GUo8i040geF7XIfSeRSpmdcAShRD8OwszBdPQ61NRryOzglrjptS7FMl
 WbrB5TbABrkHY77/d9aW342tYQouDS/tq+p9irKSq2o3xSo7/kTRijTVrEFHM5Z3d0tyycZNMYz
 56P//5p2V8fm2yMCU86FkZUhklx3O3tRJ7rMakg9WfytoKkMyOXZuoooHNRjzGC71HwtDEDIjfa
 y30AJ3qhs0uS1mKA6HA0Tcuje0EJirB9YQmR/GB8yJi+7SfkkyXrZ/6FYnNsdk1HbwlFUq0pwWp
 noqf4EJ1eoD3wRjGBUk8SzKCrFUOfQ==
X-Google-Smtp-Source: AGHT+IEAFmL7UZg1uTfDDRPoy0BBuksKzzgZGM3TutSiUK4Zl501M3PKPyCwG30hNRGeBsF6mBGDwg==
X-Received: by 2002:a05:6512:1110:b0:536:a695:942c with SMTP id
 2adb3069b0e04-53dd35a4f17mr1072878e87.7.1732270036793; 
 Fri, 22 Nov 2024 02:07:16 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd2445712sm314765e87.40.2024.11.22.02.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 02:07:16 -0800 (PST)
Date: Fri, 22 Nov 2024 12:07:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
 Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 5/9] drm/msm/dpu: Add SM6150 support
Message-ID: <bhylewwvztm7gsmkjwo6asceuph2jlqgvy2lhocdvg6r7y4i6w@duvbnsko3xg2>
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
 <20241122-add-display-support-for-qcs615-platform-v3-5-35252e3a51fe@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122-add-display-support-for-qcs615-platform-v3-5-35252e3a51fe@quicinc.com>
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

On Fri, Nov 22, 2024 at 05:56:48PM +0800, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Add definitions for the display hardware used on the Qualcomm SM6150
> platform.
> 
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h | 263 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  4 files changed, 266 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..e8b7f694b885d69a9bbfaa85b0faf0c7af677a75
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> @@ -0,0 +1,263 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _DPU_5_3_SM6150_H
> +#define _DPU_5_3_SM6150_H
> +
> +	}, {
> +		.name = "intf_2", .id = INTF_2,
> +		.base = 0x6b000, .len = 0x2c0,
> +		.features = INTF_SC7180_MASK,
> +		.type = INTF_NONE,
> +		.controller_id = 0,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),

Please drop. No need to declare missing blocks.

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> +	}, {
> +		.name = "intf_3", .id = INTF_3,
> +		.base = 0x6b800, .len = 0x280,
> +		.features = INTF_SC7180_MASK,
> +		.type = INTF_DP,
> +		.controller_id = MSM_DP_CONTROLLER_1,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
> +	},
> +};
> +

-- 
With best wishes
Dmitry
