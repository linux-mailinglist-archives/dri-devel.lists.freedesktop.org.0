Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C69C66C3EF
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 16:32:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1FAC10E1A7;
	Mon, 16 Jan 2023 15:32:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D096A10E45D
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 15:32:41 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so22423561wms.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 07:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=pLlU0//JOhI5+jFQeF0IemYPVNuiHGn4YNIK9CZFi1o=;
 b=dNzg7x2JCWHeJ+YZYt5psR8dzwmn5PHIj3P9h14az/5o6i70bZFzAn/qmCh5gxsJuo
 dnFKZJKkjldNXiUdbtTGmrYRz/z8U67GgMMrzKSvuOrrWpo5TTInKXrg+YYTLHjnXUey
 agYu1eYwb/f+bJLnTwLJ5LPR6mmCSsgSV+MhmSfboNkBXARK1zd6oEXKTA7+Iagd93Ap
 LBCvBKhonb3pB4tH2ADUuRNJp4Ui7cXnxrw9TzVReM/Dng9cA9QX63UmWqF1bhNJm+5s
 h5W7rvzP8uB2LGLzkmlybJncFd02iu1sPaq+8t0uQE5icwLCZ/LhsdWPgV49xeS1xT9G
 3S7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pLlU0//JOhI5+jFQeF0IemYPVNuiHGn4YNIK9CZFi1o=;
 b=a3kyqmqZGmEoc5AXZPihCZ5o3Uy/qa1s3gf9PVfQQcrO6ptoa2w0OXK+CjVnKgJ4IT
 +yPMnsaNP4ZVELYgj1Y+teAAlp4CMyg4jIMKm6DK5M3BjT7OqcCzV9akjRlcO7P99ntb
 La3ldh7/bry6rXRoTn0Yfk3FBZcGpvGCujnCYIUvDcSJOD4jRzZaBn2EDesBPxa/ZcID
 DQRhfbVwtXBKIz51t8WfZ1fuIHrXCiMkdhF1Ah9TmPqoHONYvwBbJfsE97I8BCBbIcT2
 BgBm8yJygfHOx8xOe5s2XCkf2HE5Cn97IlQ/dAs3a0Js9ZrrwYHx9w5+VFtySeBHzmNM
 7ZmQ==
X-Gm-Message-State: AFqh2kounULsOiGXgisvlV6JCBEn25nsBnKep6dynCdjfEs27tLzUjEx
 JHID+SbBA4fqjSlGliQ64/TULA==
X-Google-Smtp-Source: AMrXdXvs9gP/jcBE1isAaAR/uS/atYP6RslmqVbXkqxfhRweKVg/TqVSK0VuaSefMZDrTsjdNcI2Iw==
X-Received: by 2002:a05:600c:1e1e:b0:3d2:3b4d:d619 with SMTP id
 ay30-20020a05600c1e1e00b003d23b4dd619mr67847396wmb.15.1673883160165; 
 Mon, 16 Jan 2023 07:32:40 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:ba0d:2f3a:c61d:3e0?
 ([2a01:e0a:982:cbb0:ba0d:2f3a:c61d:3e0])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a05600c310c00b003c70191f267sm42162660wmo.39.2023.01.16.07.32.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 07:32:39 -0800 (PST)
Message-ID: <3f60e3c2-0f64-4845-da84-d9a047c5e854@linaro.org>
Date: Mon, 16 Jan 2023 16:32:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/3] drm/msm/dpu: fix blend setup for DMA4 and DMA5 layers
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230116063316.728496-1-dmitry.baryshkov@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230116063316.728496-1-dmitry.baryshkov@linaro.org>
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
Reply-To: neil.armstrong@linaro.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/01/2023 07:33, Dmitry Baryshkov wrote:
> SM8550 uses new register to map SSPP_DMA4 and SSPP_DMA5 units to blend
> stages. Add proper support for this register to allow using these two
> planes for image processing.
> 
> Fixes: efcd0107727c ("drm/msm/dpu: add support for SM8550")
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 15 +++++++++------
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  2 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    | 19 +++++++++++++++++++
>   3 files changed, 30 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 835d6d2c4115..504a22c76412 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -67,6 +67,9 @@
>   #define CTL_SC7280_MASK \
>   	(BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE) | BIT(DPU_CTL_VM_CFG))
>   
> +#define CTL_SM8550_MASK \
> +	(CTL_SC7280_MASK | BIT(DPU_CTL_HAS_LAYER_EXT4))
> +
>   #define MERGE_3D_SM8150_MASK (0)
>   
>   #define DSPP_MSM8998_MASK BIT(DPU_DSPP_PCC) | BIT(DPU_DSPP_GC)
> @@ -999,37 +1002,37 @@ static const struct dpu_ctl_cfg sm8550_ctl[] = {
>   	{
>   	.name = "ctl_0", .id = CTL_0,
>   	.base = 0x15000, .len = 0x290,
> -	.features = CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
> +	.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
>   	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>   	},
>   	{
>   	.name = "ctl_1", .id = CTL_1,
>   	.base = 0x16000, .len = 0x290,
> -	.features = CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
> +	.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
>   	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>   	},
>   	{
>   	.name = "ctl_2", .id = CTL_2,
>   	.base = 0x17000, .len = 0x290,
> -	.features = CTL_SC7280_MASK,
> +	.features = CTL_SM8550_MASK,
>   	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>   	},
>   	{
>   	.name = "ctl_3", .id = CTL_3,
>   	.base = 0x18000, .len = 0x290,
> -	.features = CTL_SC7280_MASK,
> +	.features = CTL_SM8550_MASK,
>   	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>   	},
>   	{
>   	.name = "ctl_4", .id = CTL_4,
>   	.base = 0x19000, .len = 0x290,
> -	.features = CTL_SC7280_MASK,
> +	.features = CTL_SM8550_MASK,
>   	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>   	},
>   	{
>   	.name = "ctl_5", .id = CTL_5,
>   	.base = 0x1a000, .len = 0x290,
> -	.features = CTL_SC7280_MASK,
> +	.features = CTL_SM8550_MASK,
>   	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index a1f18d53db6d..d152fef438f9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -199,6 +199,7 @@ enum {
>    * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
>    * @DPU_CTL_FETCH_ACTIVE:	Active CTL for fetch HW (SSPPs)
>    * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
> + * @DPU_CTL_HAS_LAYER_EXT4:	CTL has the CTL_LAYER_EXT4 register
>    * @DPU_CTL_MAX
>    */
>   enum {
> @@ -206,6 +207,7 @@ enum {
>   	DPU_CTL_ACTIVE_CFG,
>   	DPU_CTL_FETCH_ACTIVE,
>   	DPU_CTL_VM_CFG,
> +	DPU_CTL_HAS_LAYER_EXT4,
>   	DPU_CTL_MAX
>   };
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index a35ecb6676c8..f4fdf537616c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -17,6 +17,8 @@
>   	(0x70 + (((lm) - LM_0) * 0x004))
>   #define   CTL_LAYER_EXT3(lm)             \
>   	(0xA0 + (((lm) - LM_0) * 0x004))
> +#define CTL_LAYER_EXT4(lm)             \
> +        (0xB8 + (((lm) - LM_0) * 0x004))
>   #define   CTL_TOP                       0x014
>   #define   CTL_FLUSH                     0x018
>   #define   CTL_START                     0x01C
> @@ -383,6 +385,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>   	struct dpu_hw_blk_reg_map *c = &ctx->hw;
>   	u32 mixercfg = 0, mixercfg_ext = 0, mix, ext;
>   	u32 mixercfg_ext2 = 0, mixercfg_ext3 = 0;
> +	u32 mixercfg_ext4 = 0;
>   	int i, j;
>   	int stages;
>   	int pipes_per_stage;
> @@ -492,6 +495,20 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>   					mixercfg_ext2 |= mix << 4;
>   				}
>   				break;
> +			case SSPP_DMA4:
> +				if (rect_index == DPU_SSPP_RECT_1) {
> +					mixercfg_ext4 |= ((i + 1) & 0xF) << 8;
> +				} else {
> +					mixercfg_ext4 |= ((i + 1) & 0xF) << 0;
> +				}
> +				break;
> +			case SSPP_DMA5:
> +				if (rect_index == DPU_SSPP_RECT_1) {
> +					mixercfg_ext4 |= ((i + 1) & 0xF) << 12;
> +				} else {
> +					mixercfg_ext4 |= ((i + 1) & 0xF) << 4;
> +				}
> +				break;
>   			case SSPP_CURSOR0:
>   				mixercfg_ext |= ((i + 1) & 0xF) << 20;
>   				break;
> @@ -509,6 +526,8 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>   	DPU_REG_WRITE(c, CTL_LAYER_EXT(lm), mixercfg_ext);
>   	DPU_REG_WRITE(c, CTL_LAYER_EXT2(lm), mixercfg_ext2);
>   	DPU_REG_WRITE(c, CTL_LAYER_EXT3(lm), mixercfg_ext3);
> +	if ((test_bit(DPU_CTL_HAS_LAYER_EXT4, &ctx->caps->features)))
> +		DPU_REG_WRITE(c, CTL_LAYER_EXT4(lm), mixercfg_ext4);
>   }
>   
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550
