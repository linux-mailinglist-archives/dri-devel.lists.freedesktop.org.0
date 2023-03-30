Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAAB6D0471
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 14:14:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA3010E2C2;
	Thu, 30 Mar 2023 12:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A49710E2C2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 12:14:25 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id a11so19358023lji.6
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 05:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680178463;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SP2YlZyISHNewW8z8zBIMxcJaMHy1BeOtTXTgZeoKOw=;
 b=jKFFiNuAxfGXl2I67xHNM5wLyCpqP180X0VY/D1iaEd//84GfxoTumeEZjtDBYhA+r
 ZeXbGT5tqW6pjtZbtYtWBnR3S9+FRzQG/EhHcco5Qh1iJKN2EKJ0h/YtUsaaAb3N163m
 fs3gX/b33MUuYwzSH6dt7zXDyv3I+YjpuvM1wKd6pKnzxZrXg6xBUfp2An2jTOzjbyqc
 eMKMaxn3iEXUBGi6t/9vyVs3nnEzDzUp9yE/D6pcuMUhgwGYk/d4B5APtRaN7I91o5Fm
 YrAR2iDTuLmhgxUOZYsppACbPcR9L33XT8ZD2yz3l7CRM3qZQFGcNK9z/vYtJDT6hvq3
 I/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680178463;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SP2YlZyISHNewW8z8zBIMxcJaMHy1BeOtTXTgZeoKOw=;
 b=aJDC94UsliX8AqGLXbjDqlOO/YLHM12LT3Koc8M7zQl6i/U2NZbfjUO9ZzCMn6pFVN
 GziP37xZxLl0MjC80bUO8qY4fHym2pqnu/tR9Yv8Wv5QU8BApA78AkttmCBL0yK988nv
 ItnuhJ8wUchVNbhG/nWQ3RVrLnWCqn9O31UNIolHZoaJSaXElOJCzpgSbfjwa8x8kK7G
 T+tMSCtOY45nBPUAE35fZVE3gwo+yNZkfODg8TKyv/y2LSVt8uU2yxpocvh8cHFfwopA
 v98cNfWlvxFB0u/3HrquSX+e9xbvqngc9AfOXOtDNqF+ttBDekjCeQPFAZFRhIP3lW7L
 Vzww==
X-Gm-Message-State: AAQBX9dnFMWbeOHHSQijuqv6D+D2ftUpGo+K6jxdfPHQsukUJEhRJp3u
 xvFT0X5t7U50ZWx9pdZcFy06yA==
X-Google-Smtp-Source: AKy350bf++1ibezMHqQkNatUa3aTRWUnvgX+rsRoKTk7gkw5NlRvj/loztTNOxTUFJpNVNZBdrZ6xw==
X-Received: by 2002:a2e:86d9:0:b0:298:a1c3:287e with SMTP id
 n25-20020a2e86d9000000b00298a1c3287emr7581625ljj.47.1680178463163; 
 Thu, 30 Mar 2023 05:14:23 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 u3-20020a2e9f03000000b002a2b9d9429esm2925789ljk.117.2023.03.30.05.14.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 05:14:22 -0700 (PDT)
Message-ID: <a4d1aaea-e118-1c85-4766-c2f678ac0051@linaro.org>
Date: Thu, 30 Mar 2023 14:14:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,29/50] drm/msm/dpu: split MSM8998 catalog entry to the
 separate file
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-30-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230211231259.1308718-30-dmitry.baryshkov@linaro.org>
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
>  .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   | 189 +++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 191 +-----------------
>  2 files changed, 191 insertions(+), 189 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> new file mode 100644
> index 000000000000..c963365a9945
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> @@ -0,0 +1,189 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DPU_3_0_MSM8998_H
> +#define _DPU_3_0_MSM8998_H
> +
> +static const struct dpu_caps msm8998_dpu_caps = {
> +	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.max_mixer_blendstages = 0x7,
> +	.qseed_type = DPU_SSPP_SCALER_QSEED3,
> +	.smart_dma_rev = DPU_SSPP_SMART_DMA_V1,
Rebase

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

> +	.has_src_split = true,
> +	.has_dim_layer = true,
> +	.has_idle_pc = true,
> +	.has_3d_merge = true,
> +	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +	.max_hdeci_exp = MAX_HORZ_DECIMATION,
> +	.max_vdeci_exp = MAX_VERT_DECIMATION,
> +};
[...]

> +	.clk_inefficiency_factor = 200,
> +	.bw_inefficiency_factor = 120,
Sidenote: this seems weird.

