Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BADC16CF84C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 02:40:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC1A310E2B7;
	Thu, 30 Mar 2023 00:40:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C096210E2B7
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 00:40:42 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id g17so22479308lfv.4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 17:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680136841;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Pzs23CSUNfR58h8azn4SLQJaZ05fHZPsWm9hVIQ3zMA=;
 b=ap2Hosz8ZdBwW+TlnilB0sw1KtncBYJ28yKEzadJ0H2At+i4eHDRKUJQv0Z0621G4K
 LflA1CmmTFG84JgT+OD25L0amQlUX5dfqs0IMSM1tD2z90NiDkDs2otSc9dbLfOYuZFI
 hRVzsAuTcn0EPndsxOwdGob203ScCB1OEIcUQ7qafG2rM1hHQE4pENscBMYhNf2QIT0Y
 GD0r12M09UAWnwvneY5vHxqqdbra3FE7CQq3U4BI/pCoLcItMQhGTJkMZSMSPcZwZQK8
 6xX6ExJELYKBcSucUY1YwzmuZxiUSVurULMtUKnQfW2ozFQexrQYJ1MOkXIjasm4A8xy
 5QZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680136841;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pzs23CSUNfR58h8azn4SLQJaZ05fHZPsWm9hVIQ3zMA=;
 b=795eqiW9BlbvSssPcaJj1songQkpB+SPEJDf74cmITI2XdRV9OWFj2YCUy3yeEgyAk
 PkLwD7f6cN5WQ0tqH3n7cNVgFy3uDBclcZTukQZolfHJYMyhO1tOP7m/tmwt5f3R3PIZ
 sreSdyloQVpaTFMy3HItGt/HBsBWylzbQknGy+XZotdjKkJgy9XWnb3yW/tEVSCq16Pg
 afpFS+M1XCJ9fbXVKKOiGMEN0LzRJ6dyFF9K5JAmgRwMMQK4ssliU4bnQukJAUSu9XZ0
 URl9askOyRPOT8YtSRAsQ670RWTZ2Q+IJPer5t4QgQbPwKS/qFHQRvA2lmmyvfrCINeH
 H8Cg==
X-Gm-Message-State: AAQBX9f8wtbYHlhBaEDccMbSukfGoHXRP0t8zMelkZzIHZMmHnS6Zdz0
 ILv/mQonZ/8x0ddCAZKVXvhoNw==
X-Google-Smtp-Source: AKy350ZUvHctkaVmril2wUQobR5Cpm1RbYdg6p6fwQmUmnFKZ+uHc2UselYQuuz9Q+J3VNrbyDeERQ==
X-Received: by 2002:ac2:5dcd:0:b0:4db:3e2d:3efc with SMTP id
 x13-20020ac25dcd000000b004db3e2d3efcmr6591819lfq.10.1680136840729; 
 Wed, 29 Mar 2023 17:40:40 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 y8-20020ac24208000000b004d40e22c1eesm5667449lfh.252.2023.03.29.17.40.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 17:40:40 -0700 (PDT)
Message-ID: <02a1e227-3aff-1b05-8171-2aa2f3872596@linaro.org>
Date: Thu, 30 Mar 2023 03:40:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC 2/5] drm/msm: Add MSM-specific DSC helper methods
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230329-rfc-msm-dsc-helper-v1-0-f3e479f59b6d@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v1-2-f3e479f59b6d@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v1-2-f3e479f59b6d@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/03/2023 02:18, Jessica Zhang wrote:
> Introduce MSM-specific DSC helper methods, as some calculations are
> common between DP and DSC.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/Makefile              |  1 +
>   drivers/gpu/drm/msm/disp/msm_dsc_helper.c | 74 +++++++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/msm_dsc_helper.h | 28 ++++++++++++
>   3 files changed, 103 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 7274c41228ed..897a5b1c88f6 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -90,6 +90,7 @@ msm-y += \
>   	disp/mdp_kms.o \
>   	disp/msm_disp_snapshot.o \
>   	disp/msm_disp_snapshot_util.o \
> +	disp/msm_dsc_helper.o \
>   	msm_atomic.o \
>   	msm_atomic_tracepoints.o \
>   	msm_debugfs.o \
> diff --git a/drivers/gpu/drm/msm/disp/msm_dsc_helper.c b/drivers/gpu/drm/msm/disp/msm_dsc_helper.c
> new file mode 100644
> index 000000000000..ec15c0d829e8
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/msm_dsc_helper.c
> @@ -0,0 +1,74 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/errno.h>
> +#include <drm/drm_fixed.h>
> +
> +#include "msm_drv.h"
> +#include "msm_dsc_helper.h"
> +
> +static int get_comp_ratio(struct drm_dsc_config *dsc, u32 src_bpp)
> +{
> +	return mult_frac(100, src_bpp, DSC_BPP(*dsc));
> +}
> +
> +static s64 get_bytes_per_soft_slice(struct drm_dsc_config *dsc, int intf_width, int comp_ratio)
> +{
> +	s64 comp_ratio_fp, num_bits_fp;
> +	s64 numerator_fp, denominator_fp;
> +
> +	comp_ratio_fp = drm_fixp_from_fraction(comp_ratio, 100);

Please inline comp_ration calculation here. Don't use mult_frac().

> +	num_bits_fp = drm_fixp_from_fraction(8, 1);

drm_int2fixp

> +
> +	numerator_fp = drm_fixp_from_fraction(dsc->slice_width * dsc->bits_per_component * 3, 1);

And here too.

> +	denominator_fp = drm_fixp_mul(comp_ratio_fp, num_bits_fp);

And num_bits_fp can be inlined too.
denominator_fp = drm_fixp_from_fraction(src_bpp * 8, DSC_BPP)

> +
> +	return drm_fixp_div(numerator_fp, denominator_fp);

dsc->slice_width * bpc * 3 / (8 * src_bpp / DSC_BPP), thus:

drm_fixp_from_fraction(dsc->slice_width * bpc * 3 * DSC_BPP, 8 * src_bpp)

but I will not insist on this one.

> +}
> +
> +u32 msm_dsc_get_eol_byte_num(struct drm_dsc_config *dsc, int intf_width, u32 src_bpp)
> +{
> +	u32 bytes_per_ss, extra_eol_bytes, bytes_per_intf;
> +	s64 bytes_per_ss_fp;
> +	int slice_per_intf = msm_dsc_get_slice_per_intf(dsc, intf_width);
> +	int comp_ratio = get_comp_ratio(dsc, src_bpp);
> +
> +	bytes_per_ss_fp = get_bytes_per_soft_slice(dsc, intf_width, comp_ratio);
> +	bytes_per_ss = drm_fixp2int_ceil(bytes_per_ss_fp);

s/_ss/_soft_slice/g

> +
> +	bytes_per_intf = bytes_per_ss * slice_per_intf;
> +	extra_eol_bytes = bytes_per_intf % 3;
> +	if (extra_eol_bytes != 0)
> +		extra_eol_bytes = 3 - extra_eol_bytes;
> +
> +	return extra_eol_bytes;
> +}
> +
> +u32 msm_dsc_get_dce_bytes_per_line(struct drm_dsc_config *dsc, int intf_width)
> +{
> +	u32 bpp;
> +	u32 dce_bytes_per_line;
> +
> +	bpp = DSC_BPP(*dsc);

Didn't this cause a warning on the unused-but-set variable?

> +	dce_bytes_per_line = DIV_ROUND_UP(dsc->bits_per_pixel * intf_width, 8);
> +
> +	return dce_bytes_per_line;
> +}

If you have msm_dsc_get_slice_per_intf() as a static inline, this 
function can be a static inline too. Nothing more than a single 
DIV_ROUND_UP.

> +
> +int msm_dsc_get_pclk_per_line(struct drm_dsc_config *dsc, int intf_width, u32 src_bpp)
> +{
> +	s64 data_width;
> +	int comp_ratio = get_comp_ratio(dsc, src_bpp);
> +
> +	if (!dsc->slice_width || (intf_width < dsc->slice_width))
> +		return -EINVAL;
> +
> +	data_width = get_bytes_per_soft_slice(dsc, intf_width, comp_ratio);
> +	data_width = drm_fixp_mul(dsc->slice_count, data_width);
> +	data_width = drm_fixp_from_fraction(data_width, 3);

Reusing a variable is a nice trick, but it can be confusing. Not to 
mention that the last call should probably be drm_fixp_div()

> +
> +	return drm_fixp2int_ceil(data_width);
> +}
> diff --git a/drivers/gpu/drm/msm/disp/msm_dsc_helper.h b/drivers/gpu/drm/msm/disp/msm_dsc_helper.h
> new file mode 100644
> index 000000000000..308069b2b5a4
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/msm_dsc_helper.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
> + */
> +
> +#ifndef MSM_DSC_HELPER_H_
> +#define MSM_DSC_HELPER_H_
> +
> +#include <drm/display/drm_dsc_helper.h>
> +#include <drm/drm_modes.h>
> +
> +/*
> + * Helper methods for MSM specific DSC calculations that are common between timing engine,
> + * DSI, and DP.
> + */
> +
> +#define MSM_DSC_SLICE_PER_PKT 1
> +#define DSC_BPP(config) ((config).bits_per_pixel >> 4)

Oh. Please. If you have used (config)->bits_per_pixel here, you wouldn't 
have to use clumsy DSC_BPP(*dsc). It might make sense to add:

static inline drm_dsc_get_bpp_int(struct drm_dsc_config *dsc)
{
     // most probably WARN_ON_ONCE is enough.
     WARN_ON(dsc->bits_per_fixel & 0xf);

     return dsc->bits_per_pixel >> 4;
}

> +
> +static inline int msm_dsc_get_slice_per_intf(struct drm_dsc_config *dsc, int intf_width)
> +{
> +	return DIV_ROUND_UP(intf_width, dsc->slice_width);
> +}
> +
> +u32 msm_dsc_get_eol_byte_num(struct drm_dsc_config *dsc, int intf_width, u32 src_bpp);
> +u32 msm_dsc_get_dce_bytes_per_line(struct drm_dsc_config *dsc, int intf_width);
> +int msm_dsc_get_pclk_per_line(struct drm_dsc_config *dsc, int intf_width, u32 src_bpp);
> +#endif /* MSM_DSC_HELPER_H_ */
> 

-- 
With best wishes
Dmitry

