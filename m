Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 503326EB677
	for <lists+dri-devel@lfdr.de>; Sat, 22 Apr 2023 02:26:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E797710E1B4;
	Sat, 22 Apr 2023 00:25:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3998C10E1B4
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Apr 2023 00:25:58 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4ec8ce03818so2370868e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 17:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682123154; x=1684715154;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7OQWCpIJTAP1Ry3VsEerFVkfg5+LmukA8mKwvl4J2fQ=;
 b=hofCmIcOQV7vmT+uSPYmfnrarP9ImgW5VOyXN/GBZPHRTClLSUmQQ5VItaKz/ze67Y
 qrb2AYoT3SpmTopHd4nYKj9jNmsLi1Gh8BvkUuCMoaUp5wz63YJVAXiiFJcAIdClRuFm
 ep3L+zrUOGDG4VLjFzcxdLuoKld/BIvyKl8k7Ie9CG1cTFlz80h304tWXZSp4bEuWzqK
 okE+GJ8I6hVdyf5kGsVivUiqlUe/qhbtpo0hxqFyXpStaLbsWkv5LwdYpHaNuEOkz0cc
 zcRXhZZR7N+eXS04m7hbG0D66fXmPGXcHd5LniBhF1KFT5zv4Bpjsz+YvFL1Mi12QKqn
 q3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682123154; x=1684715154;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7OQWCpIJTAP1Ry3VsEerFVkfg5+LmukA8mKwvl4J2fQ=;
 b=fg5OThpV5b62E4bGs9mcC3LSieqQ8VQHCXh8ml3ohLFYrISbZUVCdYTpDG9g/BDiWu
 fPbLDtQbD0zus3c0f1ipcGHSkWwlYXjTDdrLd90tOKbjsVfAWuZPgRb+rvTceRPUkwDQ
 4kOsU0qlOBjnaoLQHHlvG4bvbQZJKJmkH0MurLzyj8C+JnbH08T/vemjR49CgEUYAZx0
 cUCGpoNyZSgQHGo7+6+NOPRzfy9hacCvUF2dc6JeMNZwLLZZLM6g3ovxEP8wA0Bi96AJ
 htciY4HKdcqPMvD25ToQm/SSKL3oVs+BqrzCqdtK8kvIDVr37ajS+Mg7aZlCvUQGSUXm
 oIHw==
X-Gm-Message-State: AAQBX9f8qv7JHYHYyRFvh/QOc0R9TLNsEpGZDN81OI92GdVs6Dz1sm07
 7PfUxN4VlbyM7UGJR1kMaPOMRTfdk2M6N9arqO8=
X-Google-Smtp-Source: AKy350ZWdFxJ2/AmpEAZfXikVOlUeKDpM+FXXIRP9U3RhsWAlAboixbX9MLOQe98xCfm16NMrQahCw==
X-Received: by 2002:ac2:59dc:0:b0:4eb:2d47:602 with SMTP id
 x28-20020ac259dc000000b004eb2d470602mr1762343lfn.59.1682123154123; 
 Fri, 21 Apr 2023 17:25:54 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 c19-20020ac244b3000000b004eed68a68efsm708285lfm.280.2023.04.21.17.25.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 17:25:53 -0700 (PDT)
Message-ID: <6a4bd978-14e4-4e15-49b4-6ce3e0e5d1a5@linaro.org>
Date: Sat, 22 Apr 2023 03:25:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 1/5] drm/msm/dpu: add support for DSC encoder v1.2
 engine
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1682033114-28483-1-git-send-email-quic_khsieh@quicinc.com>
 <1682033114-28483-2-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1682033114-28483-2-git-send-email-quic_khsieh@quicinc.com>
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

On 21/04/2023 02:25, Kuogee Hsieh wrote:
> Add support for DSC 1.2 by providing the necessary hooks to program
> the DPU DSC 1.2 encoder.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/Makefile                   |   1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  38 ++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h     |  17 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c | 388 +++++++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c         |   7 +-
>   5 files changed, 444 insertions(+), 7 deletions(-)
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
> 

[skipped]

> +static inline void _dsc_subblk_offset(struct dpu_hw_dsc *hw_dsc, int s_id,
> +		u32 *offset)
> +{
> +	const struct dpu_dsc_sub_blks *sblk;
> +
> +	sblk = hw_dsc->caps->sblk;
> +
> +	if (s_id == DPU_DSC_ENC)
> +		*offset = sblk->enc.base;
> +	else if (s_id == DPU_DSC_CTL)
> +		*offset = sblk->ctl.base;
> +	else
> +		DPU_ERROR("invalid DSC sub block=%d\n", s_id);
> +}

I have just sent a patchset removing the _sspp_subblk_offset. Could you 
please inline this function too?

> +
> +static void dpu_hw_dsc_disable_1_2(struct dpu_hw_dsc *hw_dsc)
> +{
> +	struct dpu_hw_blk_reg_map *hw;
> +	u32 offset;
> +
> +	if (!hw_dsc)
> +		return;
> +
> +	_dsc_subblk_offset(hw_dsc, DPU_DSC_CTL, &offset);
> +
> +	hw = &hw_dsc->hw;
> +	DPU_REG_WRITE(hw, offset + DSC_CFG, 0);
> +
> +	_dsc_subblk_offset(hw_dsc, DPU_DSC_ENC, &offset);
> +
> +	DPU_REG_WRITE(hw, offset + ENC_DF_CTRL, 0);
> +	DPU_REG_WRITE(hw, offset + DSC_MAIN_CONF, 0);
> +}
> +

-- 
With best wishes
Dmitry

