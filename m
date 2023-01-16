Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED80066C3F4
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 16:32:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2AF610E45D;
	Mon, 16 Jan 2023 15:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3892910E45D
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 15:32:55 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 j16-20020a05600c1c1000b003d9ef8c274bso18076704wms.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 07:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=8bpel7kGKLHQHn4OeNNyIbXCW+3n7mjhMCA5OdKUwCI=;
 b=zTjgFSDTPfqa+bpVPJkM6+Y6Ms8SgFtWlHJx/RB4hlgC+KvvUnMJmYYLvQhQH6DjvA
 YwDB9L7tBXAFss4wJf1EppnvJnLMvHeNkqLmvJf13HKX4K/2+2DdYLsR9ewxnr7wG027
 L6KQuqZQktDdQw6/8GzZSbyNuq8QEKQBMBM2g1bdSvuRN5J6iA/isPD2r+WBvVEUzqib
 yRDc1I/Ni65O0tu7LI0T/8vhKhYIl8WL4b2PhlR6yCkjeXWp+ys5BuNecJMy8etz/hzN
 Za8hiNMWm4UtI8FVn93N7NVVZegpY0ms520Z/q31v+a53jNtgerdsxTNuxO0lF/0g/pv
 ch/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8bpel7kGKLHQHn4OeNNyIbXCW+3n7mjhMCA5OdKUwCI=;
 b=QX49q46623dcdbaY44wgqHWzJhkVOdbhTh/u1Ey14WeJ9yqrGG2d0B3cU1Dp0UKXpa
 g3evT1QnBSfcomV1Gjmg5LBCHMPHrALDQ4/LGwcppozlOhInSf/rlySIQCoMXFnq3nok
 50l8Ovn8NB4WX6Mh8LW+M3fM2O9g9ILhPaTkyNr5f3f1H5s7ElCsJM3B+P5E+WAq0eZZ
 V60xCsSbfAZ/gVfmqXAXa8FJOrr9LckhB5iM+SQhDw6kvSwBOa5T6XKajwCZwU/ML5mM
 G4ATgvE8p0rAcjDRNigh1QZ2qXzaiRG4cVbDS3OgnrswndBgbXAoEXtn5r1GstgqyS4k
 5BYg==
X-Gm-Message-State: AFqh2krRuBJlzLvNUheITc4rJ7JSjDTHQGBUikDH8Fou8hNrJY+KFctc
 JglEi2fNxl2+GDl80OCZBXmHAg==
X-Google-Smtp-Source: AMrXdXsmWA1xcburcX2LMZyVHZnLClsI7GWMPr1ccomYi4coWfoLFdlEn4h94ltBxSw97JOqJRmv/A==
X-Received: by 2002:a05:600c:4fd5:b0:3da:1d24:e6bf with SMTP id
 o21-20020a05600c4fd500b003da1d24e6bfmr13757890wmq.37.1673883173617; 
 Mon, 16 Jan 2023 07:32:53 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:ba0d:2f3a:c61d:3e0?
 ([2a01:e0a:982:cbb0:ba0d:2f3a:c61d:3e0])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a05600c4f0300b003a6125562e1sm36845822wmq.46.2023.01.16.07.32.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 07:32:53 -0800 (PST)
Message-ID: <a9421146-7993-0132-b3c5-1071ed8a5019@linaro.org>
Date: Mon, 16 Jan 2023 16:32:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/3] drm/msm/dpu: simplify ctl_setup_blendstage calculation
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230116063316.728496-1-dmitry.baryshkov@linaro.org>
 <20230116063316.728496-2-dmitry.baryshkov@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230116063316.728496-2-dmitry.baryshkov@linaro.org>
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
> Extract the common expression in the dpu_hw_ctl_setup_blendstage()
> function.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 38 +++++++++++-----------
>   1 file changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index f4fdf537616c..4d70dcd46c9d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -383,7 +383,8 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>   	enum dpu_lm lm, struct dpu_hw_stage_cfg *stage_cfg)
>   {
>   	struct dpu_hw_blk_reg_map *c = &ctx->hw;
> -	u32 mixercfg = 0, mixercfg_ext = 0, mix, ext;
> +	u32 mix, ext, mix_ext;
> +	u32 mixercfg = 0, mixercfg_ext = 0;
>   	u32 mixercfg_ext2 = 0, mixercfg_ext3 = 0;
>   	u32 mixercfg_ext4 = 0;
>   	int i, j;
> @@ -409,6 +410,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>   		/* overflow to ext register if 'i + 1 > 7' */
>   		mix = (i + 1) & 0x7;
>   		ext = i >= 7;
> +		mix_ext = (i + 1) & 0xf;
>   
>   		for (j = 0 ; j < pipes_per_stage; j++) {
>   			enum dpu_sspp_multirect_index rect_index =
> @@ -417,7 +419,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>   			switch (stage_cfg->stage[i][j]) {
>   			case SSPP_VIG0:
>   				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext3 |= ((i + 1) & 0xF) << 0;
> +					mixercfg_ext3 |= mix_ext << 0;
>   				} else {
>   					mixercfg |= mix << 0;
>   					mixercfg_ext |= ext << 0;
> @@ -425,7 +427,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>   				break;
>   			case SSPP_VIG1:
>   				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext3 |= ((i + 1) & 0xF) << 4;
> +					mixercfg_ext3 |= mix_ext << 4;
>   				} else {
>   					mixercfg |= mix << 3;
>   					mixercfg_ext |= ext << 2;
> @@ -433,7 +435,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>   				break;
>   			case SSPP_VIG2:
>   				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext3 |= ((i + 1) & 0xF) << 8;
> +					mixercfg_ext3 |= mix_ext << 8;
>   				} else {
>   					mixercfg |= mix << 6;
>   					mixercfg_ext |= ext << 4;
> @@ -441,7 +443,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>   				break;
>   			case SSPP_VIG3:
>   				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext3 |= ((i + 1) & 0xF) << 12;
> +					mixercfg_ext3 |= mix_ext << 12;
>   				} else {
>   					mixercfg |= mix << 26;
>   					mixercfg_ext |= ext << 6;
> @@ -465,7 +467,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>   				break;
>   			case SSPP_DMA0:
>   				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext2 |= ((i + 1) & 0xF) << 8;
> +					mixercfg_ext2 |= mix_ext << 8;
>   				} else {
>   					mixercfg |= mix << 18;
>   					mixercfg_ext |= ext << 16;
> @@ -473,7 +475,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>   				break;
>   			case SSPP_DMA1:
>   				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext2 |= ((i + 1) & 0xF) << 12;
> +					mixercfg_ext2 |= mix_ext << 12;
>   				} else {
>   					mixercfg |= mix << 21;
>   					mixercfg_ext |= ext << 18;
> @@ -481,39 +483,37 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>   				break;
>   			case SSPP_DMA2:
>   				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext2 |= ((i + 1) & 0xF) << 16;
> +					mixercfg_ext2 |= mix_ext << 16;
>   				} else {
> -					mix |= (i + 1) & 0xF;
> -					mixercfg_ext2 |= mix << 0;
> +					mixercfg_ext2 |= mix_ext << 0;
>   				}
>   				break;
>   			case SSPP_DMA3:
>   				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext2 |= ((i + 1) & 0xF) << 20;
> +					mixercfg_ext2 |= mix_ext << 20;
>   				} else {
> -					mix |= (i + 1) & 0xF;
> -					mixercfg_ext2 |= mix << 4;
> +					mixercfg_ext2 |= mix_ext << 4;
>   				}
>   				break;
>   			case SSPP_DMA4:
>   				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext4 |= ((i + 1) & 0xF) << 8;
> +					mixercfg_ext4 |= mix_ext << 8;
>   				} else {
> -					mixercfg_ext4 |= ((i + 1) & 0xF) << 0;
> +					mixercfg_ext4 |= mix_ext << 0;
>   				}
>   				break;
>   			case SSPP_DMA5:
>   				if (rect_index == DPU_SSPP_RECT_1) {
> -					mixercfg_ext4 |= ((i + 1) & 0xF) << 12;
> +					mixercfg_ext4 |= mix_ext << 12;
>   				} else {
> -					mixercfg_ext4 |= ((i + 1) & 0xF) << 4;
> +					mixercfg_ext4 |= mix_ext << 4;
>   				}
>   				break;
>   			case SSPP_CURSOR0:
> -				mixercfg_ext |= ((i + 1) & 0xF) << 20;
> +				mixercfg_ext |= mix_ext << 20;
>   				break;
>   			case SSPP_CURSOR1:
> -				mixercfg_ext |= ((i + 1) & 0xF) << 26;
> +				mixercfg_ext |= mix_ext << 26;
>   				break;
>   			default:
>   				break;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550
