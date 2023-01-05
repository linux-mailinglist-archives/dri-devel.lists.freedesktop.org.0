Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1917765E2D9
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 03:17:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE4B110E08C;
	Thu,  5 Jan 2023 02:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3105410E625
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 02:16:59 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id s22so37399659ljp.5
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jan 2023 18:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zvSkLOiYSI8BTOeWAmpLO96acWHRQlaWwDJLFvoiyzo=;
 b=kCJ0lZ/vSr0gFJWUjWAkM2Xr8Bs9t2EselICDHG/YCZf9QqJrdzyTYfQS4PZ89VtD1
 VX+SUiNj6rpoN1ROpYXgGML/uCy4tTuGHLkGPgWOEiH7hhnQTK8Ap/rxskUR5CffJ6NT
 i1MjvBIBNzdrd5WzP3UgkyJhAWJOIIWESBptc0jkOsx7nnW2i/Zduk2Nk69XAKX4++rJ
 6rfsEZRw2NuOrEUMTNnF7AXeqIa50LkJcznPRWCfDYuHDIGAIKSoAvZaYVvPxviyniyS
 BquY4VyVsr/teFjMJZTV44AyCqyWKJkkvi00abnNtGnqhNZO4/4CJmSLp8HMS7vjggbG
 zJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zvSkLOiYSI8BTOeWAmpLO96acWHRQlaWwDJLFvoiyzo=;
 b=px+4fMgk+L9GNsiLWViAdaCAJqDfz9uu6DafjvbA6ntsBBYQBNt5CNNWsnWtOKhpKw
 TjNsEPhL+iZiG1AJamksYeBAk3x2hy4jM/oByjBSJ1ms4KO7DJC9mfbxQ+dWWmRODN3b
 D+m083kWVVLboTxvMJhYJ+jRbKYPdC2i4x4DqXFnY0YW7WUHw/5QV4agyICaX7NkM8DO
 keAPjLwp7CVMEczvTlKV0o9BOaL94hLMoRR40NpGJjxBkWJ4tLus05LZHXLCbyEcNxcC
 RZOe5iFzFQQP3bnlJEmaiyfu9Urqa/U43bRUuTUQ1p6jLoqpWniWsSK1VoHiruezLWCq
 vq9g==
X-Gm-Message-State: AFqh2kpgTo7/EzkpzsiHzxt5aY3p4XfRIP3cgng83VAbEOu0R/TzDcA/
 Lk6vMe3/t0HP3x+aPJ9rCUtgXg==
X-Google-Smtp-Source: AMrXdXuRfJOqnq/HoMg625beK0Jrb9cqNJh85x/2VJ4qoOyRQzUsAQI9A+/ihnqs+7pT2gjSbI20+w==
X-Received: by 2002:a2e:6e14:0:b0:27f:e171:b7cf with SMTP id
 j20-20020a2e6e14000000b0027fe171b7cfmr4644649ljc.48.1672885017381; 
 Wed, 04 Jan 2023 18:16:57 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 c14-20020a056512324e00b004cafe65883dsm4661837lfr.122.2023.01.04.18.16.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 18:16:56 -0800 (PST)
Message-ID: <d352312a-9916-934c-0a1c-e79b7eb3c7e6@linaro.org>
Date: Thu, 5 Jan 2023 04:16:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH v3 3/3] drm/msm/dpu: Use color_fill property for DPU
 planes
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230104234036.636-1-quic_jesszhan@quicinc.com>
 <20230104234036.636-4-quic_jesszhan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230104234036.636-4-quic_jesszhan@quicinc.com>
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
Cc: sebastian.wick@redhat.com, ppaalanen@gmail.com,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/01/2023 01:40, Jessica Zhang wrote:
> Initialize and use the color_fill properties for planes in DPU driver. In
> addition, relax framebuffer requirements within atomic commit path and
> add checks for NULL framebuffers. Finally, drop DPU_PLANE_COLOR_FILL_FLAG
> as it's unused.
> 
> Changes since V2:
> - Fixed dropped 'const' warning
> - Dropped use of solid_fill_format
> - Switched to using drm_plane_solid_fill_enabled helper method
> - Added helper to convert color fill to BGR888 (Rob)
> - Added support for solid fill on planes of varying sizes
> - Removed DPU_PLANE_COLOR_FILL_FLAG
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  9 +++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 65 ++++++++++++++---------
>   2 files changed, 49 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 13ce321283ff..0695b70ea1b7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -409,6 +409,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   	struct drm_plane_state *state;
>   	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc->state);
>   	struct dpu_plane_state *pstate = NULL;
> +	const struct msm_format *fmt;
>   	struct dpu_format *format;
>   	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
>   
> @@ -441,7 +442,13 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   				sspp_idx - SSPP_VIG0,
>   				state->fb ? state->fb->base.id : -1);
>   
> -		format = to_dpu_format(msm_framebuffer_format(pstate->base.fb));
> +		if (pstate->base.fb)
> +			fmt = msm_framebuffer_format(pstate->base.fb);
> +		else
> +			fmt = dpu_get_msm_format(&_dpu_crtc_get_kms(crtc)->base,
> +					DRM_FORMAT_ABGR8888, 0);
> +
> +		format = to_dpu_format(fmt);
>   
>   		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
>   			bg_alpha_enable = true;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 86719020afe2..51a7507373f7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -44,7 +44,6 @@
>   
>   #define DPU_NAME_SIZE  12
>   
> -#define DPU_PLANE_COLOR_FILL_FLAG	BIT(31)
>   #define DPU_ZPOS_MAX 255
>   
>   /* multirect rect index */
> @@ -105,7 +104,6 @@ struct dpu_plane {
>   	enum dpu_sspp pipe;
>   
>   	struct dpu_hw_pipe *pipe_hw;
> -	uint32_t color_fill;
>   	bool is_error;
>   	bool is_rt_pipe;
>   	const struct dpu_mdss_cfg *catalog;
> @@ -678,6 +676,17 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
>   				&scaler3_cfg);
>   }
>   
> +static uint32_t _dpu_plane_get_fill_color(struct drm_solid_fill solid_fill)
> +{
> +	uint32_t ret = 0;
> +
> +	ret |= ((uint8_t) solid_fill.b) << 16;
> +	ret |= ((uint8_t) solid_fill.g) << 8;
> +	ret |= ((uint8_t) solid_fill.r);
> +
> +	return ret;
> +}
> +
>   /**
>    * _dpu_plane_color_fill - enables color fill on plane
>    * @pdpu:   Pointer to DPU plane object
> @@ -1001,12 +1010,17 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   
>   	dst = drm_plane_state_dest(new_plane_state);
>   
> -	fb_rect.x2 = new_plane_state->fb->width;
> -	fb_rect.y2 = new_plane_state->fb->height;
> +	if (new_plane_state->fb) {
> +		fb_rect.x2 = new_plane_state->fb->width;
> +		fb_rect.y2 = new_plane_state->fb->height;
> +	}
>   
>   	max_linewidth = pdpu->catalog->caps->max_linewidth;
>   
> -	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
> +	if (new_plane_state->fb)
> +		fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
> +	else
> +		fmt = dpu_get_dpu_format(DRM_FORMAT_ABGR8888);

I think this should be more explicit:

if (solid_fill)
    fmt = dpu_get_dpu_format(...)
else
    fmt = to_dpu_format(msm_framebuffer_format(...).

And in the _dpu_crtc_blend_setup_mixer() too.

Maybe the code can be extracted to a helper.

>   
>   	min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
>   
> @@ -1018,7 +1032,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   		return -EINVAL;
>   
>   	/* check src bounds */
> -	} else if (!dpu_plane_validate_src(&src, &fb_rect, min_src_size)) {
> +	} else if (new_plane_state->fb && !dpu_plane_validate_src(&src, &fb_rect, min_src_size)) {
>   		DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
>   				DRM_RECT_ARG(&src));
>   		return -E2BIG;
> @@ -1086,9 +1100,10 @@ void dpu_plane_flush(struct drm_plane *plane)
>   	if (pdpu->is_error)
>   		/* force white frame with 100% alpha pipe output on error */
>   		_dpu_plane_color_fill(pdpu, 0xFFFFFF, 0xFF);
> -	else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
> +	else if (!(plane->state->fb) && drm_plane_solid_fill_enabled(plane->state))
>   		/* force 100% alpha */
> -		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
> +		_dpu_plane_color_fill(pdpu, _dpu_plane_get_fill_color(plane->state->solid_fill),
> +				0xFF);

I'd push alpha into _dpu_plane_get_fill_color(). Then adding alpha 
support would be more transparent.

>   	else if (pdpu->pipe_hw && pdpu->pipe_hw->ops.setup_csc) {
>   		const struct dpu_format *fmt = to_dpu_format(msm_framebuffer_format(plane->state->fb));
>   		const struct dpu_csc_cfg *csc_ptr = _dpu_plane_get_csc(pdpu, fmt);
> @@ -1127,23 +1142,30 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>   	struct drm_crtc *crtc = state->crtc;
>   	struct drm_framebuffer *fb = state->fb;
>   	bool is_rt_pipe, update_qos_remap;
> -	const struct dpu_format *fmt =
> -		to_dpu_format(msm_framebuffer_format(fb));
> +	const struct dpu_format *fmt;
>   	struct dpu_hw_pipe_cfg pipe_cfg;
>   
> -	memset(&pipe_cfg, 0, sizeof(struct dpu_hw_pipe_cfg));
> -
> -	_dpu_plane_set_scanout(plane, pstate, &pipe_cfg, fb);
> -
>   	pstate->pending = true;
>   
>   	is_rt_pipe = (dpu_crtc_get_client_type(crtc) != NRT_CLIENT);
>   	_dpu_plane_set_qos_ctrl(plane, false, DPU_PLANE_QOS_PANIC_CTRL);
>   
> -	DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
> -			", %4.4s ubwc %d\n", fb->base.id, DRM_RECT_FP_ARG(&state->src),
> -			crtc->base.id, DRM_RECT_ARG(&state->dst),
> -			(char *)&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
> +	/* override for color fill */
> +	if (!fb && drm_plane_solid_fill_enabled(plane->state)) {
> +		/* skip remaining processing on color fill */
> +		return;
> +	}
> +
> +	memset(&pipe_cfg, 0, sizeof(struct dpu_hw_pipe_cfg));
> +
> +	fmt = to_dpu_format(msm_framebuffer_format(fb));
> +	_dpu_plane_set_scanout(plane, pstate, &pipe_cfg, fb);

This change deserves a comment somewhere (in the commit message?). 
Beforehand the driver tried to set the scanout/layout for the COLOR_FILL 
case. You have changed this.

> +
> +	if (fb)
> +		DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
> +				", %4.4s ubwc %d\n", fb->base.id, DRM_RECT_FP_ARG(&state->src),
> +				crtc->base.id, DRM_RECT_ARG(&state->dst),
> +				(char *)&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
>   
>   	pipe_cfg.src_rect = state->src;
>   
> @@ -1155,12 +1177,6 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>   
>   	pipe_cfg.dst_rect = state->dst;
>   
> -	/* override for color fill */
> -	if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
> -		/* skip remaining processing on color fill */
> -		return;
> -	}
> -
>   	if (pdpu->pipe_hw->ops.setup_rects) {
>   		pdpu->pipe_hw->ops.setup_rects(pdpu->pipe_hw,
>   				&pipe_cfg,
> @@ -1511,6 +1527,7 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
>   		DPU_ERROR("failed to install zpos property, rc = %d\n", ret);
>   
>   	drm_plane_create_alpha_property(plane);
> +	drm_plane_create_solid_fill_property(plane);
>   	drm_plane_create_blend_mode_property(plane,
>   			BIT(DRM_MODE_BLEND_PIXEL_NONE) |
>   			BIT(DRM_MODE_BLEND_PREMULTI) |

-- 
With best wishes
Dmitry

