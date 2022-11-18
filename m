Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C47762F50C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 13:38:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17CD410E723;
	Fri, 18 Nov 2022 12:38:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFAD210E725
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 12:38:39 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id a29so7969317lfj.9
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 04:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=92k8zjWPhsfe0rApEXv+Yvs9hh9Iy6qzDin6ZXpogUs=;
 b=CYZJTHEEpam0SbQB1ZDnEb6CoKT+8J/fPyXH2+Ukx13k540BvXB1FvjaCggI0r1c9q
 nwGXjhFdlbqDBcphCtPCoPUaW2Bh04qaB2Gj5Vbjb73NG7LM39wQGY2QOc1gtLsSMxW3
 PvzMocDatvQolTvCQBKAdaoKsl7WpMY0ImZzMw6PwFKm+WkaYgKQ3ERGeq/n/SODKypb
 qUlgEVbqetnZPxXZbyuCsQOAiZflayJduC0l8B/q6KAsqMSlDcqQUv520SnT0ioMelJf
 L4CX16wis8wgvVFFKQrShVHPHN1riKUN8ikVy1N9gb6EIl/NPrYHjN5MPZasuPdLcaXt
 8fow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=92k8zjWPhsfe0rApEXv+Yvs9hh9Iy6qzDin6ZXpogUs=;
 b=Fh9tTHswdZkGSXSZ/pE5nF6w2k3hjX63Vr0b9i0jyAPbz6Xh/6IbwOKgSMh3x5jMqK
 M8gR4BeomaqP6UVYsvDKpoNbs6xwOua0WQwS4YFf9vpOHzLGK68eAhlPaFQjEQcYA14O
 AGcyYy6R6CUIlrqFrrTWoCdJRao3IEV5Yjg/accOd/wSt4TAX3OVZF+VAcXv0rgP8SBO
 jOYzOXbTTwolU8TR135GMYHLGDt3qsVDzMnxuPp578PtfXsgLhwA0x6sE0CDl9CHZHw/
 a9vaUd9j7xBNAFYSWvPSl1jCnOht36MGge94LBfa1mn/xYqNiaDYYeTP8DNnSaPnHrK5
 yjew==
X-Gm-Message-State: ANoB5pko0INN5fEGLY0pqTpaAkx88YTJr0FZFHe1FxQFf7UgM9PGJ0ax
 /kDGUE5Xi4+TCQvduUranBEnJQ==
X-Google-Smtp-Source: AA0mqf6hFqZTKEPYIQUeAu5R4Lj5+myz5gX+auuNUFHZ4OrOcQPaAjX0A8pMeU4WXvxk5m03gCtozw==
X-Received: by 2002:a05:6512:2096:b0:498:ec56:8311 with SMTP id
 t22-20020a056512209600b00498ec568311mr2504959lfr.153.1668775118174; 
 Fri, 18 Nov 2022 04:38:38 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f26-20020a05651c02da00b0026dee5476d5sm630307ljo.113.2022.11.18.04.38.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 04:38:37 -0800 (PST)
Message-ID: <5dddeaa9-aab1-e437-a3ed-8ad242d50171@linaro.org>
Date: Fri, 18 Nov 2022 14:38:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 2/3] drm/msm/disp/dpu1: add helper to know if display
 is builtin
Content-Language: en-GB
To: Kalyan Thota <quic_kalyant@quicinc.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <1668773807-19598-1-git-send-email-quic_kalyant@quicinc.com>
 <1668773807-19598-3-git-send-email-quic_kalyant@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1668773807-19598-3-git-send-email-quic_kalyant@quicinc.com>
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

On 18/11/2022 15:16, Kalyan Thota wrote:
> Since DRM encoder type for few encoders can be similar
> (like eDP and DP) find out if the interface supports HPD
> from encoder bridge to differentiate between builtin
> and pluggable displays.
> 
> Changes in v1:
> - add connector type in the disp_info (Dmitry)
> - add helper functions to know encoder type
> - update commit text reflecting the change
> 
> Changes in v2:
> - avoid hardcode of connector type for DSI as it may not be true (Dmitry)
> - get the HPD information from encoder bridge
> 
> Changes in v3:
> - use bridge type instead of bridge ops in determining connector (Dmitry)
> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 27 +++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  6 ++++++
>   2 files changed, 33 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 9c6817b..574f2b0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -15,6 +15,7 @@
>   #include <drm/drm_crtc.h>
>   #include <drm/drm_file.h>
>   #include <drm/drm_probe_helper.h>
> +#include <drm/drm_bridge.h>
>   
>   #include "msm_drv.h"
>   #include "dpu_kms.h"
> @@ -217,6 +218,32 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
>   	15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
>   };
>   
> +bool dpu_encoder_is_builtin(struct drm_encoder *encoder)
> +{
> +	struct drm_bridge *bridge;
> +	int ops = 0;
> +
> +	if (!encoder)
> +		return false;
> +
> +	/* Get last bridge in the chain to determine connector type */
> +	drm_for_each_bridge_in_chain(encoder, bridge)
> +		if (!drm_bridge_get_next_bridge(bridge))
> +			ops = bridge->type;

Why don't we check the connector type directly? You should not assume 
that connector's type is equal to the latest bridge's type.

> +
> +	switch (ops) {
> +	case DRM_MODE_CONNECTOR_Unknown:
> +	case DRM_MODE_CONNECTOR_LVDS:
> +	case DRM_MODE_CONNECTOR_eDP:
> +	case DRM_MODE_CONNECTOR_DSI:
> +	case DRM_MODE_CONNECTOR_DPI:
> +	case DRM_MODE_CONNECTOR_WRITEBACK:
> +	case DRM_MODE_CONNECTOR_VIRTUAL:

Unknown, WRITEBACK and VIRTUAL are not builtin (for the point of CTM at 
least).

> +		return true;
> +	default:
> +		return false;
> +	}
> +}
>   
>   bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc)
>   {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 9e7236e..7f3d823 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -224,4 +224,10 @@ void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
>    */
>   bool dpu_encoder_is_valid_for_commit(struct drm_encoder *drm_enc);
>   
> +/**
> + * dpu_encoder_is_builtin - find if the encoder is of type builtin
> + * @drm_enc:    Pointer to previously created drm encoder structure
> + */
> +bool dpu_encoder_is_builtin(struct drm_encoder *drm_enc);
> +
>   #endif /* __DPU_ENCODER_H__ */

-- 
With best wishes
Dmitry

