Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B826264B5
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 23:42:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DDDD10E1CF;
	Fri, 11 Nov 2022 22:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC0610E1CF
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 22:42:46 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id u2so6007257ljl.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 14:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EYyeXEw2VkS8JTm/IGpYyGpHzN8RIbHLXdxBYm9nzJY=;
 b=OXX3SrkF/GB7sHkGsEtlYfRljUpU9n5yxJVmyFS7yn3D8fRiz4az10Q2M2e2kHuM6O
 uyOUhijcBpQ+l3Bf+SegAhw+8NbxVPV1urQhS2akDjO9WG/ptwt4n2ZWjWAL5s3PHEXp
 kyzkyT9VGE1PHk6dgt6rRax1COvUGrIW0DHZQdchCveSjQUDS15RXiY1k3xpd9gE0FPN
 2QId2Jjkqbn9NCaoFJIOlJZNDJQJ+zXRo+O72awsaH8Ztcvmkod5q6Ce7onkphWgzcVC
 pAwmVwA+RcHLGDVLyuwlXN5RZItE6Uf2OW6bL918QMx3zYdDJFrdlxYsqRPlxd9YGf5b
 aF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EYyeXEw2VkS8JTm/IGpYyGpHzN8RIbHLXdxBYm9nzJY=;
 b=fdwey6LrOBzVPCPj3DHInd18bIWwoCfVzEy2K7c2JVQKG3x7ffPH+i0MEdvTSUHq5M
 Q/caVEfWlLIXAYvHab5u6Iv7KGD/nkF/CUu52343OJgVNsLk9CnvVjLM34Swo764k+Sl
 mH912APWKkXX/jElhgtssPAwGa8ZaQfyd/1VnE5ZE34DebWlmZ0bgZQUPBWpiYTYpHbZ
 gs0EXjx7fD+80mHcXl3vgGkjWjq2OUlwcROeGmOge0Nl0fWbV754+ig6kcG+vQX7t0+R
 AlPwH2FCQ0CUa5sg8YGMQJA/iXsoFzKLQET5vptatwvnA9viuM8C9C2WZ/NzJHDy+VFp
 gKAQ==
X-Gm-Message-State: ANoB5pk95wo41rR/bWhCHcuXeaH10ZgdxD8Dq201CDq1CTuMYlCB9dcC
 eXwUZvZSLY5Od5VZEJtU5QFTVw==
X-Google-Smtp-Source: AA0mqf4imwXxoFSAi/GceSo8/lQ2skPVasE29BXClQQ9Fx+80zMy+0jV4NWrX0lw0H7zYYpG2Cwtbg==
X-Received: by 2002:a2e:be23:0:b0:26e:494a:de3f with SMTP id
 z35-20020a2ebe23000000b0026e494ade3fmr1302151ljq.85.1668206564752; 
 Fri, 11 Nov 2022 14:42:44 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a056512214e00b0049735cec78dsm541719lfr.67.2022.11.11.14.42.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 14:42:44 -0800 (PST)
Message-ID: <8480ff54-0c5b-d6d1-eb48-8571257e69e5@linaro.org>
Date: Sat, 12 Nov 2022 01:42:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [v1] drm/msm/disp/dpu1: add color management support for the crtc
Content-Language: en-GB
To: Kalyan Thota <quic_kalyant@quicinc.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <1668175043-11028-1-git-send-email-quic_kalyant@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1668175043-11028-1-git-send-email-quic_kalyant@quicinc.com>
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
Cc: robdclark@chromium.org, dianders@chromium.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org, quic_vpolimer@quicinc.com, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/11/2022 16:57, Kalyan Thota wrote:
> Add color management support for the crtc provided there are
> enough dspps that can be allocated from the catalogue.
> 
> Changes in v1:
> - cache color enabled state in the dpu crtc obj (Dmitry)
> - simplify dspp allocation while creating crtc (Dmitry)
> - register for color when crtc is created (Dmitry)
> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  5 +--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  6 ++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  7 ++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 53 ++++++++++++++++++++++++++++-
>   4 files changed, 64 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 4170fbe..ca4c3b3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1571,7 +1571,7 @@ static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
>   
>   /* initialize crtc */
>   struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
> -				struct drm_plane *cursor)
> +				struct drm_plane *cursor, unsigned long features)
>   {
>   	struct drm_crtc *crtc = NULL;
>   	struct dpu_crtc *dpu_crtc = NULL;
> @@ -1583,6 +1583,7 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
>   
>   	crtc = &dpu_crtc->base;
>   	crtc->dev = dev;
> +	dpu_crtc->color_enabled = features & BIT(DPU_DSPP_PCC);
>   
>   	spin_lock_init(&dpu_crtc->spin_lock);
>   	atomic_set(&dpu_crtc->frame_pending, 0);
> @@ -1604,7 +1605,7 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
>   
>   	drm_crtc_helper_add(crtc, &dpu_crtc_helper_funcs);
>   
> -	drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
> +	drm_crtc_enable_color_mgmt(crtc, 0, dpu_crtc->color_enabled, 0);
>   
>   	/* save user friendly CRTC name for later */
>   	snprintf(dpu_crtc->name, DPU_CRTC_NAME_SIZE, "crtc%u", crtc->base.id);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> index 539b68b..342f9ae 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> @@ -136,6 +136,7 @@ struct dpu_crtc_frame_event {
>    * @enabled       : whether the DPU CRTC is currently enabled. updated in the
>    *                  commit-thread, not state-swap time which is earlier, so
>    *                  safe to make decisions on during VBLANK on/off work
> + * @color_enabled : whether crtc supports color management
>    * @feature_list  : list of color processing features supported on a crtc
>    * @active_list   : list of color processing features are active
>    * @dirty_list    : list of color processing features are dirty
> @@ -164,7 +165,7 @@ struct dpu_crtc {
>   	u64 play_count;
>   	ktime_t vblank_cb_time;
>   	bool enabled;
> -
> +	bool color_enabled;
>   	struct list_head feature_list;
>   	struct list_head active_list;
>   	struct list_head dirty_list;
> @@ -269,10 +270,11 @@ void dpu_crtc_complete_commit(struct drm_crtc *crtc);
>    * @dev: dpu device
>    * @plane: base plane
>    * @cursor: cursor plane
> + * @features: color features
>    * @Return: new crtc object or error
>    */
>   struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
> -			       struct drm_plane *cursor);
> +			       struct drm_plane *cursor, unsigned long features);
>   
>   /**
>    * dpu_crtc_register_custom_event - api for enabling/disabling crtc event
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index c9058aa..d72edb8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -579,6 +579,7 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
>   static struct msm_display_topology dpu_encoder_get_topology(
>   			struct dpu_encoder_virt *dpu_enc,
>   			struct dpu_kms *dpu_kms,
> +			struct dpu_crtc *dpu_crtc,
>   			struct drm_display_mode *mode)
>   {
>   	struct msm_display_topology topology = {0};
> @@ -607,7 +608,7 @@ static struct msm_display_topology dpu_encoder_get_topology(
>   	else
>   		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
>   
> -	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
> +	if (dpu_crtc->color_enabled) {
>   		if (dpu_kms->catalog->dspp &&
>   			(dpu_kms->catalog->dspp_count >= topology.num_lm))
>   			topology.num_dspp = topology.num_lm;
> @@ -642,6 +643,7 @@ static int dpu_encoder_virt_atomic_check(
>   	struct drm_display_mode *adj_mode;
>   	struct msm_display_topology topology;
>   	struct dpu_global_state *global_state;
> +	struct dpu_crtc *dpu_crtc;
>   	int i = 0;
>   	int ret = 0;
>   
> @@ -652,6 +654,7 @@ static int dpu_encoder_virt_atomic_check(
>   	}
>   
>   	dpu_enc = to_dpu_encoder_virt(drm_enc);
> +	dpu_crtc = to_dpu_crtc(crtc_state->crtc);
>   	DPU_DEBUG_ENC(dpu_enc, "\n");
>   
>   	priv = drm_enc->dev->dev_private;
> @@ -677,7 +680,7 @@ static int dpu_encoder_virt_atomic_check(
>   		}
>   	}
>   
> -	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode);
> +	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, dpu_crtc, adj_mode);
>   
>   	/* Reserve dynamic resources now. */
>   	if (!ret) {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 0709da2..ce6f5e6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -734,7 +734,54 @@ static int _dpu_kms_setup_displays(struct drm_device *dev,
>   	return rc;
>   }
>   
> +/**
> + * _dpu_kms_populate_dspp_features - Evaluate how many dspps pairs can be facilitated
> +                                     to enable color features for encoder and assign
> +				     color features prefering primary

preferring

> + * @dpu_kms:    Pointer to dpu kms structure
> + * @features:   Pointer to feature array
> + *
> + * Baring single entry, if atleast 2 dspps are available in the catalogue,

at least

> + * then color can be enabled for that crtc
> + */
> +static void _dpu_kms_populate_dspp_features(struct dpu_kms *dpu_kms,
> +	unsigned long *features)
> +{
> +	struct drm_encoder *encoder;
> +	u32 external_enc_mask = 0;
> +	u32 num_dspps = dpu_kms->catalog->dspp_count;
> +
> +	if (!num_dspps)
> +		return;
> +	else if (num_dspps > 1)
> +		num_dspps /= 2;
> +
> +	/* Ensure all primary encoders get first allocation of color */
> +	drm_for_each_encoder(encoder, dpu_kms->dev) {
> +		if(dpu_encoder_is_primary(encoder)) {
> +			if (num_dspps) {
> +				features[encoder->index] = dpu_kms->catalog->dspp->features;
> +				num_dspps--;
> +			}
> +		} else if(dpu_encoder_is_external(encoder)) {
> +			external_enc_mask |= drm_encoder_mask(encoder);
> +		}
> +	}
> +
> +	if(!num_dspps)
> +		return;
> +
> +	/* Allocate color for external encoders after primary */

Please. No "primary" encoders. You already have sense of internal vs 
external, plugable, or which ever way you would like to call them. You 
don't need to add another safety check, do you?

> +	drm_for_each_encoder_mask(encoder, dpu_kms->dev, external_enc_mask) {
> +		if (num_dspps) {
> +			features[encoder->index] = dpu_kms->catalog->dspp->features;
> +			num_dspps--;
> +		}
> +	}
> +}
> +
>   #define MAX_PLANES 20
> +#define MAX_ENCODERS 10
>   static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
>   {
>   	struct drm_device *dev;
> @@ -749,6 +796,8 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
>   
>   	int primary_planes_idx = 0, cursor_planes_idx = 0, i, ret;
>   	int max_crtc_count;
> +	unsigned long features[MAX_ENCODERS] = {0};
> +
>   	dev = dpu_kms->dev;
>   	priv = dev->dev_private;
>   	catalog = dpu_kms->catalog;
> @@ -798,12 +847,14 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
>   	}
>   
>   	max_crtc_count = min(max_crtc_count, primary_planes_idx);
> +	_dpu_kms_populate_dspp_features(dpu_kms, features);
>   
>   	/* Create one CRTC per encoder */
>   	i = 0;
>   	drm_for_each_encoder(encoder, dev) {
>   		if (i < max_crtc_count) {
> -			crtc = dpu_crtc_init(dev, primary_planes[i], cursor_planes[i]);
> +			crtc = dpu_crtc_init(dev, primary_planes[i], cursor_planes[i],
> +					features[encoder->index]);

A simple counter should be enough. You know the number of 'rich' CRTCs, 
which can get DSPP (or a pair of DSPPs). Then you can create a 
feature-rich CRTC provided the current encoder should use one and if the 
number of created 'rich' CRTCs is not greater than the 'possibly rich' 
number.

>   			if (IS_ERR(crtc)) {
>   				ret = PTR_ERR(crtc);
>   				return ret;

-- 
With best wishes
Dmitry

