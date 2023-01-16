Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F5F66C3FD
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 16:33:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF1B210E45F;
	Mon, 16 Jan 2023 15:33:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A93B10E45F
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 15:33:08 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id r30so3419842wrr.10
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 07:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=qtqZdBROkBky94C/LQ+25J07B9BTNHsS0Z6ioalX3YA=;
 b=afFUkbmAkbMTFaNJcbdGMkL29e8yJvOKjdES30ZvJdt5p0Gvm3XhlbfRjASaIKbOV6
 FPf30VrAoHEIGGT0QoIBzanMCKJsA5UGCx5LUsGHq5hwgQS5PT359ILkqowsW0Uz05QH
 1y1GavICB8h+wcQCbH5o/vQrq7xAMhFuY8ncEtmbqrhYVXC5qf3X5/Jf0jNkBlfxJkf4
 H7y2Sx779D07XT/uaI/qxdDjjRsCdJqmMuvgiqbhWs71qB5IrYYSjBdjvLVvUlaIJjVo
 1XTqJlmznoxPUY8/uS7tonuNpJXp0VUYn07gDU1dUxs+qVpKiY+CiGjdEZND1HJoAFgq
 1MNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qtqZdBROkBky94C/LQ+25J07B9BTNHsS0Z6ioalX3YA=;
 b=oxzRtPUO2CXhsdGi0ZYWgV/8J/EcNALX9M+qarfNjZlfKXgZcjVUVqTJiT/lAI24Rx
 wzQhOV8Hsm6QS0D0o/OLAAwyXN7H9RXVCyOopDm0RizbjABGxMFQ81nSmQR55bV2uxrj
 QfhLLuIyRdf/YpHmTUoNGC3GOLgto/objVyeqy7+smqULRuFkK7klPYVI3weaDkXh7mQ
 HAO3oZ8jQA0g2HrzX9Bav63kirE3uymYn3TSu+XPYnLDO3PD2GaEj9qtqnKnGPSHjrIc
 FmjvhKKPvpB9TMXh0XElLMeZogeQKjWe5w7z3dMxsxapo93Ny5SEX6CK23wegM/t1FJY
 3S1g==
X-Gm-Message-State: AFqh2kp+71FEUWXgdGwfkVM7K+zRK4sqo0hIJhDu3kT4fEnR/qW0zUtT
 um5AMOEJrDScIS7oxuvC3yJy9Q==
X-Google-Smtp-Source: AMrXdXsp4j0/ELwXCzyw5D5hbnV3JyIcKYvzKfM664c8iQCqK6bItYDViXiGko/MkKQTwK6d7Fx6xQ==
X-Received: by 2002:adf:fdc7:0:b0:2bb:1844:32a4 with SMTP id
 i7-20020adffdc7000000b002bb184432a4mr25391134wrs.48.1673883186579; 
 Mon, 16 Jan 2023 07:33:06 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:ba0d:2f3a:c61d:3e0?
 ([2a01:e0a:982:cbb0:ba0d:2f3a:c61d:3e0])
 by smtp.gmail.com with ESMTPSA id
 a10-20020adfdd0a000000b002bb6b45ab57sm24648957wrm.85.2023.01.16.07.33.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 07:33:06 -0800 (PST)
Message-ID: <1203a8e5-07a2-e760-f77d-7c037ac4affc@linaro.org>
Date: Mon, 16 Jan 2023 16:33:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 3/3] drm/msm/dpu: simplify blend configuration
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230116063316.728496-1-dmitry.baryshkov@linaro.org>
 <20230116063316.728496-3-dmitry.baryshkov@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230116063316.728496-3-dmitry.baryshkov@linaro.org>
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
> Rewrite dpu_hw_ctl_setup_blendstage() to use static data configuration
> rather than using a switch-case. This simplifies adding support for new
> pipes.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 156 ++++++---------------
>   1 file changed, 45 insertions(+), 111 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 4d70dcd46c9d..f3c15b5a2099 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -379,14 +379,37 @@ static void dpu_hw_ctl_clear_all_blendstages(struct dpu_hw_ctl *ctx)
>   	DPU_REG_WRITE(c, CTL_FETCH_PIPE_ACTIVE, 0);
>   }
>   
> +struct ctl_blend_config {
> +	int idx, shift, ext_shift;
> +};
> +
> +static const struct ctl_blend_config ctl_blend_config[][2] = {
> +	[SSPP_NONE] = { { -1 }, { -1 } },
> +	[SSPP_MAX] =  { { -1 }, { -1 } },
> +	[SSPP_VIG0] = { { 0, 0,  0  }, { 3, 0 } },
> +	[SSPP_VIG1] = { { 0, 3,  2  }, { 3, 4 } },
> +	[SSPP_VIG2] = { { 0, 6,  4  }, { 3, 8 } },
> +	[SSPP_VIG3] = { { 0, 26, 6  }, { 3, 12 } },
> +	[SSPP_RGB0] = { { 0, 9,  8  }, { -1 } },
> +	[SSPP_RGB1] = { { 0, 12, 10 }, { -1 } },
> +	[SSPP_RGB2] = { { 0, 15, 12 }, { -1 } },
> +	[SSPP_RGB3] = { { 0, 29, 14 }, { -1 } },
> +	[SSPP_DMA0] = { { 0, 18, 16 }, { 2, 8 } },
> +	[SSPP_DMA1] = { { 0, 21, 18 }, { 2, 12 } },
> +	[SSPP_DMA2] = { { 2, 0      }, { 2, 16 } },
> +	[SSPP_DMA3] = { { 2, 4      }, { 2, 20 } },
> +	[SSPP_DMA4] = { { 4, 0      }, { 4, 8 } },
> +	[SSPP_DMA5] = { { 4, 4      }, { 4, 12 } },
> +	[SSPP_CURSOR0] =  { { 1, 20 }, { -1 } },
> +	[SSPP_CURSOR1] =  { { 1, 26 }, { -1 } },
> +};
> +
>   static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>   	enum dpu_lm lm, struct dpu_hw_stage_cfg *stage_cfg)
>   {
>   	struct dpu_hw_blk_reg_map *c = &ctx->hw;
>   	u32 mix, ext, mix_ext;
> -	u32 mixercfg = 0, mixercfg_ext = 0;
> -	u32 mixercfg_ext2 = 0, mixercfg_ext3 = 0;
> -	u32 mixercfg_ext4 = 0;
> +	u32 mixercfg[5] = { 0 };
>   	int i, j;
>   	int stages;
>   	int pipes_per_stage;
> @@ -401,7 +424,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>   	else
>   		pipes_per_stage = 1;
>   
> -	mixercfg = CTL_MIXER_BORDER_OUT; /* always set BORDER_OUT */
> +	mixercfg[0] = CTL_MIXER_BORDER_OUT; /* always set BORDER_OUT */
>   
>   	if (!stage_cfg)
>   		goto exit;
> @@ -415,119 +438,30 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>   		for (j = 0 ; j < pipes_per_stage; j++) {
>   			enum dpu_sspp_multirect_index rect_index =
>   				stage_cfg->multirect_index[i][j];
> -
> -			switch (stage_cfg->stage[i][j]) {
> -			case SSPP_VIG0:
> -				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext3 |= mix_ext << 0;
> -				} else {
> -					mixercfg |= mix << 0;
> -					mixercfg_ext |= ext << 0;
> -				}
> -				break;
> -			case SSPP_VIG1:
> -				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext3 |= mix_ext << 4;
> -				} else {
> -					mixercfg |= mix << 3;
> -					mixercfg_ext |= ext << 2;
> -				}
> -				break;
> -			case SSPP_VIG2:
> -				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext3 |= mix_ext << 8;
> -				} else {
> -					mixercfg |= mix << 6;
> -					mixercfg_ext |= ext << 4;
> -				}
> -				break;
> -			case SSPP_VIG3:
> -				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext3 |= mix_ext << 12;
> -				} else {
> -					mixercfg |= mix << 26;
> -					mixercfg_ext |= ext << 6;
> -				}
> -				break;
> -			case SSPP_RGB0:
> -				mixercfg |= mix << 9;
> -				mixercfg_ext |= ext << 8;
> -				break;
> -			case SSPP_RGB1:
> -				mixercfg |= mix << 12;
> -				mixercfg_ext |= ext << 10;
> -				break;
> -			case SSPP_RGB2:
> -				mixercfg |= mix << 15;
> -				mixercfg_ext |= ext << 12;
> -				break;
> -			case SSPP_RGB3:
> -				mixercfg |= mix << 29;
> -				mixercfg_ext |= ext << 14;
> -				break;
> -			case SSPP_DMA0:
> -				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext2 |= mix_ext << 8;
> -				} else {
> -					mixercfg |= mix << 18;
> -					mixercfg_ext |= ext << 16;
> -				}
> -				break;
> -			case SSPP_DMA1:
> -				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext2 |= mix_ext << 12;
> -				} else {
> -					mixercfg |= mix << 21;
> -					mixercfg_ext |= ext << 18;
> -				}
> -				break;
> -			case SSPP_DMA2:
> -				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext2 |= mix_ext << 16;
> -				} else {
> -					mixercfg_ext2 |= mix_ext << 0;
> -				}
> -				break;
> -			case SSPP_DMA3:
> -				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext2 |= mix_ext << 20;
> -				} else {
> -					mixercfg_ext2 |= mix_ext << 4;
> -				}
> -				break;
> -			case SSPP_DMA4:
> -				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext4 |= mix_ext << 8;
> -				} else {
> -					mixercfg_ext4 |= mix_ext << 0;
> -				}
> -				break;
> -			case SSPP_DMA5:
> -				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext4 |= mix_ext << 12;
> -				} else {
> -					mixercfg_ext4 |= mix_ext << 4;
> -				}
> -				break;
> -			case SSPP_CURSOR0:
> -				mixercfg_ext |= mix_ext << 20;
> -				break;
> -			case SSPP_CURSOR1:
> -				mixercfg_ext |= mix_ext << 26;
> -				break;
> -			default:
> -				break;
> +			enum dpu_sspp pipe = stage_cfg->stage[i][j];
> +			const struct ctl_blend_config *cfg =
> +				&ctl_blend_config[pipe][rect_index == DPU_SSPP_RECT_1];
> +
> +			/*
> +			 * CTL_LAYER has 3-bit field (and extra bits in EXT register),
> +			 * all EXT registers has 4-bit fields.
> +			 */
> +			if (cfg->idx == 0) {
> +				mixercfg[0] |= mix << cfg->shift;
> +				mixercfg[1] |= ext << cfg->ext_shift;
> +			} else {
> +				mixercfg[cfg->idx] |= mix_ext << cfg->shift;
>   			}
>   		}
>   	}
>   
>   exit:
> -	DPU_REG_WRITE(c, CTL_LAYER(lm), mixercfg);
> -	DPU_REG_WRITE(c, CTL_LAYER_EXT(lm), mixercfg_ext);
> -	DPU_REG_WRITE(c, CTL_LAYER_EXT2(lm), mixercfg_ext2);
> -	DPU_REG_WRITE(c, CTL_LAYER_EXT3(lm), mixercfg_ext3);
> +	DPU_REG_WRITE(c, CTL_LAYER(lm), mixercfg[0]);
> +	DPU_REG_WRITE(c, CTL_LAYER_EXT(lm), mixercfg[1]);
> +	DPU_REG_WRITE(c, CTL_LAYER_EXT2(lm), mixercfg[2]);
> +	DPU_REG_WRITE(c, CTL_LAYER_EXT3(lm), mixercfg[3]);
>   	if ((test_bit(DPU_CTL_HAS_LAYER_EXT4, &ctx->caps->features)))
> -		DPU_REG_WRITE(c, CTL_LAYER_EXT4(lm), mixercfg_ext4);
> +		DPU_REG_WRITE(c, CTL_LAYER_EXT4(lm), mixercfg[4]);
>   }
>   
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550
