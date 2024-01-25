Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAEB83CE4D
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 22:15:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52E6A10EC78;
	Thu, 25 Jan 2024 21:15:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE9C10EC78
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 21:15:15 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2cf206e4d56so23383341fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 13:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706217254; x=1706822054; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xyDnPMOWxwzgswtw0IMgKlEsX3lHL6hISWqA0RropHw=;
 b=P6UUFjYwsAhi9M7wgmQXy5iR/muvXOSGvsA8OBfi1pkXCGVVFaGTqHhzY3EGlYp/nA
 FSTcyHD4yKc+86ZtpvSEnpStMrJ7gq24Vz/IwxR2IbkYwaBDdhUIWNL6sOunk2+tLV8z
 npDxHD+wsaA406RCFPZOCiPToJRRbsWh5JLW/57slnG/kLLirkZ50WMEocn5kK+7NmG9
 R/3asXrvGvUL9AANTbYF1r+JHW4TiBQjeAK7sTIbX1rPkYFAC+mYf71JGNHZvSKTKo7E
 gbgrmznbo5qCSWcwoaRTwepSSubXroWhqSZ+6QJhvrIFekRj91Hk07Z/ZYROHk8lhq++
 M2vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706217254; x=1706822054;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xyDnPMOWxwzgswtw0IMgKlEsX3lHL6hISWqA0RropHw=;
 b=F/MhwfmP5w1+hVDgCJVY4kIxwXDERbg2AgVuAA3PGrypdT4r83EC99nZ1QEUCZ25Oj
 Di5ZlRWXBqy8TBX8+A3Gr3xlQ0+wH2yh4lKoS29iWzVoTtUTRUiLzPibf23YlZQM2bGo
 OXQw63Uodve7hG/2vEyCEaL3OiKCxYxiaJzh76t4TQ5sZM0Qsf/KyNIF2OrJ4QVCduTM
 DmughVO6iXKQP/8k59nsmfuS79/tP8LtYLsGa36+SIy5H93PWpMbPYcttR+kTRWgzOz4
 y8gYXGxtthHYkO5DnvUjRD/UhsFOqM7UAqGXKC8vjZcS4KanfniRWCLZIfOmPqI6VP4Z
 2BKQ==
X-Gm-Message-State: AOJu0YwpXISqWKxzZtv+4HLRL26haL8vSvcWPfBNHdXZf4nQeKLslt4d
 wZnb5o/nRgkFN9QKhCJ5GAt7yAf2nPxtT+OZKhaq7TGP8oV71rcKOvR2UOIZ/Vw=
X-Google-Smtp-Source: AGHT+IE2HyxddBJniXLkFHulFfzdu16urepUJYrm6JJvIKaAFhUjdIcp5G5LqZUmlwTbTkcpwvYv7w==
X-Received: by 2002:a2e:b60f:0:b0:2cf:13c1:6a4 with SMTP id
 r15-20020a2eb60f000000b002cf13c106a4mr90822ljn.75.1706217253929; 
 Thu, 25 Jan 2024 13:14:13 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x17-20020a2e9c91000000b002ce070a5141sm382497lji.11.2024.01.25.13.14.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 13:14:13 -0800 (PST)
Message-ID: <31e4a033-1779-450c-980e-63c8567837ed@linaro.org>
Date: Thu, 25 Jan 2024 23:14:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/17] drm/msm/dpu: allow
 dpu_encoder_helper_phys_setup_cdm to work for DP
To: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-2-quic_parellan@quicinc.com>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240125193834.7065-2-quic_parellan@quicinc.com>
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
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, marijn.suijten@somainline.org,
 quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/01/2024 21:38, Paloma Arellano wrote:
> Generalize dpu_encoder_helper_phys_setup_cdm to be compatible with DP.
> 
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  4 +--
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 31 ++++++++++---------
>   2 files changed, 18 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index 993f263433314..37ac385727c3b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -153,6 +153,7 @@ enum dpu_intr_idx {
>    * @hw_intf:		Hardware interface to the intf registers
>    * @hw_wb:		Hardware interface to the wb registers
>    * @hw_cdm:		Hardware interface to the CDM registers
> + * @cdm_cfg:	CDM block config needed to store WB/DP block's CDM configuration

Please realign the description.

>    * @dpu_kms:		Pointer to the dpu_kms top level
>    * @cached_mode:	DRM mode cached at mode_set time, acted on in enable
>    * @vblank_ctl_lock:	Vblank ctl mutex lock to protect vblank_refcount
> @@ -183,6 +184,7 @@ struct dpu_encoder_phys {
>   	struct dpu_hw_intf *hw_intf;
>   	struct dpu_hw_wb *hw_wb;
>   	struct dpu_hw_cdm *hw_cdm;
> +	struct dpu_hw_cdm_cfg cdm_cfg;

It might be slightly better to move it after all the pointers, so after 
the dpu_kms.

>   	struct dpu_kms *dpu_kms;
>   	struct drm_display_mode cached_mode;
>   	struct mutex vblank_ctl_lock;
> @@ -213,7 +215,6 @@ static inline int dpu_encoder_phys_inc_pending(struct dpu_encoder_phys *phys)
>    * @wbirq_refcount:     Reference count of writeback interrupt
>    * @wb_done_timeout_cnt: number of wb done irq timeout errors
>    * @wb_cfg:  writeback block config to store fb related details
> - * @cdm_cfg: cdm block config needed to store writeback block's CDM configuration
>    * @wb_conn: backpointer to writeback connector
>    * @wb_job: backpointer to current writeback job
>    * @dest:   dpu buffer layout for current writeback output buffer
> @@ -223,7 +224,6 @@ struct dpu_encoder_phys_wb {
>   	atomic_t wbirq_refcount;
>   	int wb_done_timeout_cnt;
>   	struct dpu_hw_wb_cfg wb_cfg;
> -	struct dpu_hw_cdm_cfg cdm_cfg;
>   	struct drm_writeback_connector *wb_conn;
>   	struct drm_writeback_job *wb_job;
>   	struct dpu_hw_fmt_layout dest;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index 4cd2d9e3131a4..072fc6950e496 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -269,28 +269,21 @@ static void dpu_encoder_phys_wb_setup_ctl(struct dpu_encoder_phys *phys_enc)
>    *                                     This API does not handle DPU_CHROMA_H1V2.
>    * @phys_enc:Pointer to physical encoder
>    */
> -static void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc)
> +static void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc,
> +					      const struct dpu_format *dpu_fmt,
> +					      u32 output_type)
>   {
>   	struct dpu_hw_cdm *hw_cdm;
>   	struct dpu_hw_cdm_cfg *cdm_cfg;
>   	struct dpu_hw_pingpong *hw_pp;
> -	struct dpu_encoder_phys_wb *wb_enc;
> -	const struct msm_format *format;
> -	const struct dpu_format *dpu_fmt;
> -	struct drm_writeback_job *wb_job;
>   	int ret;
>   
>   	if (!phys_enc)
>   		return;
>   
> -	wb_enc = to_dpu_encoder_phys_wb(phys_enc);
> -	cdm_cfg = &wb_enc->cdm_cfg;
> +	cdm_cfg = &phys_enc->cdm_cfg;
>   	hw_pp = phys_enc->hw_pp;
>   	hw_cdm = phys_enc->hw_cdm;
> -	wb_job = wb_enc->wb_job;
> -
> -	format = msm_framebuffer_format(wb_enc->wb_job->fb);
> -	dpu_fmt = dpu_get_dpu_format_ext(format->pixel_format, wb_job->fb->modifier);
>   
>   	if (!hw_cdm)
>   		return;
> @@ -306,10 +299,10 @@ static void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc)
>   
>   	memset(cdm_cfg, 0, sizeof(struct dpu_hw_cdm_cfg));
>   
> -	cdm_cfg->output_width = wb_job->fb->width;
> -	cdm_cfg->output_height = wb_job->fb->height;
> +	cdm_cfg->output_width = phys_enc->cached_mode.hdisplay;
> +	cdm_cfg->output_height = phys_enc->cached_mode.vdisplay;

This is a semantic change. Instead of passing the FB size, this passes 
the mode dimensions. They are not guaranteed to be the same, especially 
for the WB case.

>   	cdm_cfg->output_fmt = dpu_fmt;
> -	cdm_cfg->output_type = CDM_CDWN_OUTPUT_WB;
> +	cdm_cfg->output_type = output_type;
>   	cdm_cfg->output_bit_depth = DPU_FORMAT_IS_DX(dpu_fmt) ?
>   			CDM_CDWN_OUTPUT_10BIT : CDM_CDWN_OUTPUT_8BIT;
>   	cdm_cfg->csc_cfg = &dpu_csc10_rgb2yuv_601l;
> @@ -462,6 +455,14 @@ static void dpu_encoder_phys_wb_setup(
>   	struct dpu_hw_wb *hw_wb = phys_enc->hw_wb;
>   	struct drm_display_mode mode = phys_enc->cached_mode;
>   	struct drm_framebuffer *fb = NULL;
> +	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys_enc);
> +	struct drm_writeback_job *wb_job;
> +	const struct msm_format *format;
> +	const struct dpu_format *dpu_fmt;
> +
> +	wb_job = wb_enc->wb_job;
> +	format = msm_framebuffer_format(wb_enc->wb_job->fb);
> +	dpu_fmt = dpu_get_dpu_format_ext(format->pixel_format, wb_job->fb->modifier);
>   
>   	DPU_DEBUG("[mode_set:%d, \"%s\",%d,%d]\n",
>   			hw_wb->idx - WB_0, mode.name,
> @@ -475,7 +476,7 @@ static void dpu_encoder_phys_wb_setup(
>   
>   	dpu_encoder_phys_wb_setup_fb(phys_enc, fb);
>   
> -	dpu_encoder_helper_phys_setup_cdm(phys_enc);
> +	dpu_encoder_helper_phys_setup_cdm(phys_enc, dpu_fmt, CDM_CDWN_OUTPUT_WB);
>   
>   	dpu_encoder_phys_wb_setup_ctl(phys_enc);
>   }

-- 
With best wishes
Dmitry

