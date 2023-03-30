Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3C46D03E1
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 13:50:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 341B110E291;
	Thu, 30 Mar 2023 11:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB8510E2A1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 11:50:42 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id h25so24137675lfv.6
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 04:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680177040;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QoRibiTVAEYFvsFZ+MHEldaKUvmO7+7wNLBYVYPwddU=;
 b=AeMnkfVTBTQEnhRn3sXANAC7+gLDc5YUzcCUC+CwLkWHdSGoiMLF71IX44rgmCpi6r
 Y2M9mauL5GcqKUe9E7SxqzfWXkaI8Ro7U8SVAst0q6ECreJ4sLSYXSNm/KBLNbhmh1t7
 hh3dK3ZYkuIKr3ror2bRR6JVi+Q++DoXFEC/2Ru9iGaE5lwtMGtDcJGj1kQvDH/R95Is
 2ZLrNBbnv0Pm0looZeIFCeMWHRu26YGWsPPA3r4cGeeNeMoWhVQDuL/8WdvqokD9oo9K
 fPrC998qewwgOTOHGCwEG39cP6mCrGzZlowEVUSnWpKqAm0TUaI5bNARn9jhrEoV2Upj
 79kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680177040;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QoRibiTVAEYFvsFZ+MHEldaKUvmO7+7wNLBYVYPwddU=;
 b=j/aPkoapQHz/FQLkyJOVyPl9z9CvaEkEFJMw7PNOLPr1i7TBx6kSyQ5epYyPdw4Xgl
 PCm4xS3T42nYgFZjETvbxlepumpBJhwhczLS8FLpBSTIUDT1/3s3kj28QDrn4ETJo4qs
 5bx0yuk3+UGjuX9LeXSx1XKLvdx+jlJY0h42BSU1oyOrDxE/QpxSfFfRYI5oOsRl0cHA
 W5R03lXshIxplD7HfcPAa04ljzpHgp5haMHhXOvY2L0cS3VppJMkBCSDMntHT7RvRlzI
 WTfgwLd6bpXYMy7eGl4WUKSDVumrAsr80okF8yiAlKm8tRfV/E+lwU2zKG5aLS+uzJo+
 NXtA==
X-Gm-Message-State: AAQBX9eTqHaB4yXZWs5gprJT+NVribmzkY5ayJI+wVJ9nHBeTI01WeMV
 pPk1QgjEAiiALkgeOAJU3Zrfnw==
X-Google-Smtp-Source: AKy350YLkkxBXNGuqKnX4Ig0cjte1KaDqpvlBqeFM//qvA76db5DQmNsS+g7Ouofo3DXqOvDrBAGCQ==
X-Received: by 2002:a05:6512:51b:b0:4e9:60a4:b038 with SMTP id
 o27-20020a056512051b00b004e960a4b038mr6954674lfb.5.1680177040268; 
 Thu, 30 Mar 2023 04:50:40 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a05651211e200b004e83fbba141sm5821493lfs.164.2023.03.30.04.50.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 04:50:39 -0700 (PDT)
Message-ID: <a282b382-2e75-7f13-03ca-6e85169817d2@linaro.org>
Date: Thu, 30 Mar 2023 13:50:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,24/50] drm/msm/dpu: split QCM2290 catalog entry to the
 separate file
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-25-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230211231259.1308718-25-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12.02.2023 00:12, Dmitry Baryshkov wrote:
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   | 116 ++++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 108 +---------------
>  2 files changed, 117 insertions(+), 107 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> new file mode 100644
> index 000000000000..48e7d4c641cd
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> @@ -0,0 +1,116 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DPU_6_5_QCM2290_H
> +#define _DPU_6_5_QCM2290_H
> +
> +static const struct dpu_caps qcm2290_dpu_caps = {
> +	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
> +	.max_mixer_blendstages = 0x4,
> +	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
Rebase

> +	.has_dim_layer = true,
> +	.has_idle_pc = true,
> +	.max_linewidth = 2160,
> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +};
> +

[...]

> +#include "catalog/dpu_6_5_qcm2290.h"
>  #include "catalog/dpu_6_3_sm6115.h"
I will not ask you to do redo it now, as it will mess with 50 patches
(unless you fix that in the following ones that I didn't get to yet),
but please rename qcm2290 things to sm6115 or whatever the case may be
so that we can keep the dpu_x_y_abcd sorted.

With that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  
>  #include "catalog/dpu_7_0_sm8350.h"
