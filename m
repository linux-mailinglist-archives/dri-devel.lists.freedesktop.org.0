Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0D06A2386
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 22:13:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4941B10E09C;
	Fri, 24 Feb 2023 21:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF2310E09C
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 21:13:35 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id bi9so838613lfb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 13:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jPPypH0+zMRs74IFMU8nhBKKQ29L3l1KuYY4woKJqkQ=;
 b=VLrdSjqP7eilPsWDa1pvazsL7eKvC4qe0P3m6FcOMcqYh8hQ1NMRhjEhZDCORSwA51
 xE96NhgfSOh4Q3x9j5AlkZVSlENi4mhZV5ZUzebRGew8Y/Yt+hbjYKV6jZYMERtc6OTm
 v7jHUEcmDsJSU32r9/dBFlPUCVP5nK8VI0sGNhC6LvnlKmxNIG6VfBSK/hWKtzoHwYgy
 sS3DE/2Uk9AhcVYdv/1uj1ndVOmjN0hJQNcCKzGauNAPVMDT7EqQEKTi74bc1R9Rgky+
 9wD7EXeFid1CDxoZw4Iy74A4Jyrx4G/TqEvcOx7rjc4rKTOeyQe0jXB38qkRlr187G75
 gm1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jPPypH0+zMRs74IFMU8nhBKKQ29L3l1KuYY4woKJqkQ=;
 b=CHEduxr7B9Wzc1TwNPHEpZZI7YI8dPFugfi1b2MgpedUs+Q5o1k2RbYlI4+IiMRliN
 RILWd+LsrleWjlvkXU/JGJfyavo3Fed1STOPSGH37CWsM22rK2rpS/8N+JNECA6bSkLk
 YdNzhzWO8e6qPAlx0WZeLQQ+YcOMiGBJbGv2fdjgTwC34eoR0f1AVEc6R54o7Va7HkKM
 QBY/WlaeM8xC2vG11ILpebaEHF8o0P27V8pex0OTtttjO2bO3x4H8x5FTHDCW1ZzJvGE
 tTlqdP8fXzpsx4DXjfsPdOC+7kumMcvewTVSvDQ2M5HZNa0hjqCAK/pjHLr2umrilfp9
 ICaQ==
X-Gm-Message-State: AO0yUKWxTN4H8kkM6Y54X8pULYyrdHskwBnToyttlbLRhf67ZsIzI/A9
 3SSY/tA5NeGjUcWUiNLduf0giQ==
X-Google-Smtp-Source: AK7set8MTxcQUbguFEo8WkqK9t0k7IjsT/xe62fovfbjcUJHYxNTS16/0n3P/JAvbI1PZgxWDMz13A==
X-Received: by 2002:a05:6512:244:b0:4db:d6a:dea9 with SMTP id
 b4-20020a056512024400b004db0d6adea9mr6630317lfo.68.1677273213254; 
 Fri, 24 Feb 2023 13:13:33 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 u8-20020ac251c8000000b004cc9042c9cfsm1545785lfm.158.2023.02.24.13.13.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 13:13:32 -0800 (PST)
Message-ID: <42b3c193-8897-cfe9-1cae-2f9a66f7983a@linaro.org>
Date: Fri, 24 Feb 2023 23:13:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [RFC PATCH 1/2] drm/msm/dpu: add dsc helper functions
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1677267647-28672-1-git-send-email-quic_khsieh@quicinc.com>
 <1677267647-28672-2-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1677267647-28672-2-git-send-email-quic_khsieh@quicinc.com>
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
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/02/2023 21:40, Kuogee Hsieh wrote:
> Add DSC helper functions based on DSC configuration profiles to produce
> DSC related runtime parameters through both table look up and runtime
> calculation to support DSC on DPU.
> 
> There are 6 different DSC configuration profiles are supported currently.
> DSC configuration profiles are differiented by 5 keys, DSC version (V1.1),
> chroma (444/422/420), colorspace (RGB/YUV), bpc(8/10),
> bpp (6/7/7.5/8/9/10/12/15) and SCR (0/1).
> 
> Only DSC version V1.1 added and V1.2 will be added later.

These helpers should go to drivers/gpu/drm/display/drm_dsc_helper.c
Also please check that they can be used for i915 or for amdgpu (ideally 
for both of them).

I didn't check the tables against the standard (or against the current 
source code), will do that later.

> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/Makefile                   |   1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.c | 209 +++++++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.h |  34 ++++
>   3 files changed, 244 insertions(+)
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.c
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.h
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 7274c412..28cf52b 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -65,6 +65,7 @@ msm-$(CONFIG_DRM_MSM_DPU) += \
>   	disp/dpu1/dpu_hw_catalog.o \
>   	disp/dpu1/dpu_hw_ctl.o \
>   	disp/dpu1/dpu_hw_dsc.o \
> +	disp/dpu1/dpu_dsc_helper.o \
>   	disp/dpu1/dpu_hw_interrupts.o \
>   	disp/dpu1/dpu_hw_intf.o \
>   	disp/dpu1/dpu_hw_lm.o \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.c
> new file mode 100644
> index 00000000..88207e9
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.c
> @@ -0,0 +1,209 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2023. Qualcomm Innovation Center, Inc. All rights reserved
> + */
> +
> +#include <drm/display/drm_dsc_helper.h>
> +#include "msm_drv.h"
> +#include "dpu_kms.h"
> +#include "dpu_hw_dsc.h"
> +#include "dpu_dsc_helper.h"
> +
> +

Extra empty line

> +#define DPU_DSC_PPS_SIZE       128
> +
> +enum dpu_dsc_ratio_type {
> +	DSC_V11_8BPC_8BPP,
> +	DSC_V11_10BPC_8BPP,
> +	DSC_V11_10BPC_10BPP,
> +	DSC_V11_SCR1_8BPC_8BPP,
> +	DSC_V11_SCR1_10BPC_8BPP,
> +	DSC_V11_SCR1_10BPC_10BPP,
> +	DSC_RATIO_TYPE_MAX
> +};
> +
> +
> +static u16 dpu_dsc_rc_buf_thresh[DSC_NUM_BUF_RANGES - 1] = {
> +		0x0e, 0x1c, 0x2a, 0x38, 0x46, 0x54,
> +		0x62, 0x69, 0x70, 0x77, 0x79, 0x7b, 0x7d, 0x7e

Weird indentation

> +};
> +
> +/*
> + * Rate control - Min QP values for each ratio type in dpu_dsc_ratio_type
> + */
> +static char dpu_dsc_rc_range_min_qp[DSC_RATIO_TYPE_MAX][DSC_NUM_BUF_RANGES] = {
> +	/* DSC v1.1 */
> +	{0, 0, 1, 1, 3, 3, 3, 3, 3, 3, 5, 5, 5, 7, 13},
> +	{0, 4, 5, 5, 7, 7, 7, 7, 7, 7, 9, 9, 9, 11, 17},
> +	{0, 4, 5, 6, 7, 7, 7, 7, 7, 7, 9, 9, 9, 11, 15},
> +	/* DSC v1.1 SCR and DSC v1.2 RGB 444 */

What is SCR? Is there any reason to use older min/max Qp params instead 
of always using the ones from the VESA-DSC-1.1 standard?

> +	{0, 0, 1, 1, 3, 3, 3, 3, 3, 3, 5, 5, 5, 9, 12},
> +	{0, 4, 5, 5, 7, 7, 7, 7, 7, 7, 9, 9, 9, 13, 16},
> +	{0, 4, 5, 6, 7, 7, 7, 7, 7, 7, 9, 9, 9, 11, 15},
> +};
> +
> +/*
> + * Rate control - Max QP values for each ratio type in dpu_dsc_ratio_type
> + */
> +static char dpu_dsc_rc_range_max_qp[DSC_RATIO_TYPE_MAX][DSC_NUM_BUF_RANGES] = {
> +	/* DSC v1.1 */
> +	{4, 4, 5, 6, 7, 7, 7, 8, 9, 10, 11, 12, 13, 13, 15},
> +	{4, 8, 9, 10, 11, 11, 11, 12, 13, 14, 15, 16, 17, 17, 19},
> +	{7, 8, 9, 10, 11, 11, 11, 12, 13, 13, 14, 14, 15, 15, 16},
> +	/* DSC v1.1 SCR and DSC v1.2 RGB 444 */
> +	{4, 4, 5, 6, 7, 7, 7, 8, 9, 10, 10, 11, 11, 12, 13},
> +	{8, 8, 9, 10, 11, 11, 11, 12, 13, 14, 14, 15, 15, 16, 17},
> +	{7, 8, 9, 10, 11, 11, 11, 12, 13, 13, 14, 14, 15, 15, 16},
> +};
> +
> +/*
> + * Rate control - bpg offset values for each ratio type in dpu_dsc_ratio_type
> + */
> +static char dpu_dsc_rc_range_bpg[DSC_RATIO_TYPE_MAX][DSC_NUM_BUF_RANGES] = {
> +	/* DSC v1.1 */
> +	{2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12},
> +	{2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12},
> +	{2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -10, -12, -12, -12},
> +	/* DSC v1.1 SCR and DSC V1.2 RGB 444 */
> +	{2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12},
> +	{2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12},
> +	{2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -10, -12, -12, -12},
> +};
> +
> +static struct dpu_dsc_rc_init_params_lut {
> +	u32 rc_quant_incr_limit0;
> +	u32 rc_quant_incr_limit1;
> +	u32 initial_fullness_offset;
> +	u32 initial_xmit_delay;
> +	u32 second_line_bpg_offset;
> +	u32 second_line_offset_adj;
> +	u32 flatness_min_qp;
> +	u32 flatness_max_qp;
> +}  dpu_dsc_rc_init_param_lut[] = {
> +	/* DSC v1.1 */
> +	{11, 11, 6144, 512, 0, 0, 3, 12}, /* DSC_V11_8BPC_8BPP */
> +	{15, 15, 6144, 512, 0, 0, 7, 16}, /* DSC_V11_10BPC_8BPP */
> +	{15, 15, 5632, 410, 0, 0, 7, 16}, /* DSC_V11_10BPC_10BPP */
> +	/* DSC v1.1 SCR and DSC v1.2 RGB 444 */
> +	{11, 11, 6144, 512, 0, 0, 3, 12}, /* DSC_V12_444_8BPC_8BPP or DSC_V11_SCR1_8BPC_8BPP */
> +	{15, 15, 6144, 512, 0, 0, 7, 16}, /* DSC_V12_444_10BPC_8BPP or DSC_V11_SCR1_10BPC_8BPP */
> +	{15, 15, 5632, 410, 0, 0, 7, 16}, /* DSC_V12_444_10BPC_10BPP or DSC_V11_SCR1_10BPC_10BPP */
> +};
> +
> +/**
> + * Maps to lookup the dpu_dsc_ratio_type index used in rate control tables
> + */
> +static struct dpu_dsc_table_index_lut {
> +	u32 fmt;
> +	u32 scr_ver;
> +	u32 minor_ver;
> +	u32 bpc;
> +	u32 bpp;
> +	u32 type;
> +} dpu_dsc_index_map[] = {
> +	/* DSC 1.1 formats - scr version is considered */
> +	{DPU_DSC_CHROMA_444, 0, 1, 8, 8, DSC_V11_8BPC_8BPP},
> +	{DPU_DSC_CHROMA_444, 0, 1, 10, 8, DSC_V11_10BPC_8BPP},
> +	{DPU_DSC_CHROMA_444, 0, 1, 10, 10, DSC_V11_10BPC_10BPP},
> +	{DPU_DSC_CHROMA_444, 1, 1, 8, 8, DSC_V11_SCR1_8BPC_8BPP},
> +	{DPU_DSC_CHROMA_444, 1, 1, 10, 8, DSC_V11_SCR1_10BPC_8BPP},
> +	{DPU_DSC_CHROMA_444, 1, 1, 10, 10, DSC_V11_SCR1_10BPC_10BPP},
> +};
> +
> +static int _get_rc_table_index(struct drm_dsc_config *dsc, int scr_ver)
> +{
> +	u32 bpp, bpc, i, fmt = DPU_DSC_CHROMA_444;
> +
> +	if (dsc->dsc_version_major != 0x1) {
> +		DPU_ERROR("unsupported major version %d\n",
> +				dsc->dsc_version_major);
> +		return -EINVAL;
> +	}
> +
> +	bpc = dsc->bits_per_component;
> +	bpp = DSC_BPP(*dsc);

Just inline the macro.

> +
> +	if (dsc->native_422)
> +		fmt = DPU_DSC_CHROMA_422;
> +	else if (dsc->native_420)
> +		fmt = DPU_DSC_CHROMA_420;
> +
> +
> +	for (i = 0; i < ARRAY_SIZE(dpu_dsc_index_map); i++) {
> +		if (dsc->dsc_version_minor == dpu_dsc_index_map[i].minor_ver &&
> +				fmt ==  dpu_dsc_index_map[i].fmt &&
> +				bpc == dpu_dsc_index_map[i].bpc &&
> +				bpp == dpu_dsc_index_map[i].bpp &&
> +				(dsc->dsc_version_minor != 0x1 ||
> +					scr_ver == dpu_dsc_index_map[i].scr_ver))
> +			return dpu_dsc_index_map[i].type;
> +	}
> +
> +	DPU_ERROR("unsupported DSC v%d.%dr%d, bpc:%d, bpp:%d, fmt:0x%x\n",
> +			dsc->dsc_version_major, dsc->dsc_version_minor,
> +			scr_ver, bpc, bpp, fmt);
> +	return -EINVAL;
> +}
> +
> +int dpu_dsc_populate_dsc_config(struct drm_dsc_config *dsc, int scr_ver)
> +{
> +	int bpp, bpc;
> +	struct dpu_dsc_rc_init_params_lut *rc_param_lut;
> +	int i, ratio_idx;
> +
> +	dsc->rc_model_size = 8192;
> +
> +	if ((dsc->dsc_version_major == 0x1) &&
> +			(dsc->dsc_version_minor == 0x1)) {

indent to the opening bracket please, so that '(dsc' on both lines start 
on the same position.

> +		if (scr_ver == 0x1)
> +			dsc->first_line_bpg_offset = 15;
> +		else
> +			dsc->first_line_bpg_offset = 12;
> +	}
> +
> +	dsc->rc_edge_factor = 6;
> +	dsc->rc_tgt_offset_high = 3;
> +	dsc->rc_tgt_offset_low = 3;
> +	dsc->simple_422 = 0;
> +	dsc->convert_rgb = !(dsc->native_422 | dsc->native_420);
> +	dsc->vbr_enable = 0;
> +
> +	bpp = DSC_BPP(*dsc);

inline the macro.

> +	bpc = dsc->bits_per_component;
> +
> +	ratio_idx = _get_rc_table_index(dsc, scr_ver);
> +	if ((ratio_idx < 0) || (ratio_idx >= DSC_RATIO_TYPE_MAX))
> +		return -EINVAL;
> +
> +
> +	for (i = 0; i < DSC_NUM_BUF_RANGES - 1; i++)
> +		dsc->rc_buf_thresh[i] = dpu_dsc_rc_buf_thresh[i];

Can we use memcpy?

> +
> +	for (i = 0; i < DSC_NUM_BUF_RANGES; i++) {
> +		dsc->rc_range_params[i].range_min_qp =
> +			dpu_dsc_rc_range_min_qp[ratio_idx][i];
> +		dsc->rc_range_params[i].range_max_qp =
> +			dpu_dsc_rc_range_max_qp[ratio_idx][i];
> +		dsc->rc_range_params[i].range_bpg_offset =
> +			dpu_dsc_rc_range_bpg[ratio_idx][i];
> +	}
> +
> +	rc_param_lut = &dpu_dsc_rc_init_param_lut[ratio_idx];
> +	dsc->rc_quant_incr_limit0 = rc_param_lut->rc_quant_incr_limit0;
> +	dsc->rc_quant_incr_limit1 = rc_param_lut->rc_quant_incr_limit1;
> +	dsc->initial_offset = rc_param_lut->initial_fullness_offset;
> +	dsc->initial_xmit_delay = rc_param_lut->initial_xmit_delay;
> +	dsc->second_line_bpg_offset = rc_param_lut->second_line_bpg_offset;
> +	dsc->second_line_offset_adj = rc_param_lut->second_line_offset_adj;
> +	dsc->flatness_min_qp = rc_param_lut->flatness_min_qp;
> +	dsc->flatness_max_qp = rc_param_lut->flatness_max_qp;
> +
> +
> +	dsc->line_buf_depth = bpc + 1;
> +	dsc->mux_word_size = bpc > 10 ? DSC_MUX_WORD_SIZE_12_BPC : DSC_MUX_WORD_SIZE_8_10_BPC;
> +
> +	dsc->initial_scale_value = 8 * dsc->rc_model_size /
> +			(dsc->rc_model_size - dsc->initial_offset);
> +
> +        return drm_dsc_compute_rc_parameters(dsc);

Indentation is wrong

> +}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.h
> new file mode 100644
> index 00000000..4a23e02
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.h
> @@ -0,0 +1,34 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2023. Qualcomm Innovation Center, Inc. All rights reserved
> + */
> +
> +#ifndef __DPU_DSC_HELPER_H__
> +#define __DPU_DSC_HELPER_H__
> +
> +#include "msm_drv.h"
> +
> +#define DSC_1_1_PPS_PARAMETER_SET_ELEMENTS   88

What is this? Does it need to be global?

> +
> +/**
> + * Bits/pixel target >> 4  (removing the fractional bits)
> + * returns the integer bpp value from the drm_dsc_config struct
> + */
> +#define DSC_BPP(config) ((config).bits_per_pixel >> 4)
> +
> +enum dpu_dsc_chroma {
> +	DPU_DSC_CHROMA_444,
> +	DPU_DSC_CHROMA_422,
> +	DPU_DSC_CHROMA_420,
> +};

I think this enum is also not used outside of your helpers.

> +
> +int dpu_dsc_populate_dsc_config(struct drm_dsc_config *dsc, int scr_ver);
> +
> +bool dpu_dsc_ich_reset_override_needed(bool pu_en, struct drm_dsc_config *dsc);

Unused

> +
> +int dpu_dsc_initial_line_calc( u32 num_active_ss_per_enc,
> +				struct drm_dsc_config *dsc,
> +				int enc_ip_width, int dsc_cmn_mode);

Unused

> +
> +#endif /* __DPU_DSC_HELPER_H__ */
> +

-- 
With best wishes
Dmitry

