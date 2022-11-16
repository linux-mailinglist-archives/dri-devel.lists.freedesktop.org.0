Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AD262C1E5
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 16:08:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A2210E4B4;
	Wed, 16 Nov 2022 15:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F8610E4B4
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 15:08:41 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id c1so29967280lfi.7
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 07:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=adyqmGjM2/t88ETfaCdsoHxVWXhSjmQ/Vu2VudXPCUc=;
 b=c8VfFr4bwKX5GqribNfHQoZpMGRMbhtwz0/3nHn25OW7yTWV2y1hbIRp7ej30MKYEI
 B+EDI/dHDMS4GrpH2uiNdrlgvVWp0m9dwnQi6URa6cinXq9cgobrHeic3m8kVnFncLQX
 2ATypZjLaeMjPagjxdDbFnNKjv/tbAbfnrvq2mE+Od4SMmOemsvzJMGUbhNYp47WSh8U
 SQge65+D9h0WUnKgNB/QCdwh+EbJIXMJiWAKWPLhKvMQ8q96JbKmO7K61YxmKaXKmoiy
 Qq+kKcxfoN/nhm5Wx2Ei39iagnnr45S5pWe7qohShl0phcp+OmaDRt5oNqfDDcQznIM6
 yhAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=adyqmGjM2/t88ETfaCdsoHxVWXhSjmQ/Vu2VudXPCUc=;
 b=Jhlvk86BlfDpq+Jm8Rk5q977hr9XblU3X0g369rr068VjCWtntY4enVvPBS6jCFkST
 qgX7P2ZDCs/zmhPJxlJcasnPnpZFHiiRI2qASmOD152Xn25NJ+nuB1BugwLR42l7JRmE
 8M0bAvCoJa43kLEg7Z98Spb8UaIxg0t1F/S2D21owmaYMwR1ia5vLfWAY45uND3NcdyO
 EN4gys1ISrv3cfK8Lq9JXYZj9ejqwf4qhkBuV1H8BVi/lgZwksEE63Wkcm+EPPKjNsMd
 nTb1zVbCTwBOXFTqa2PHa5ArVqDd9leVfuO552aDzsZfFruhbJ91qVoX2A6Kx/DeW0YR
 oklg==
X-Gm-Message-State: ANoB5pmDxSvfSL5Jq0DauEa9aeuJtLJh/+FSbBJg5A42f6W1fruJ+/a9
 nUz9kLC5EF4CVZexXeXn5IjbEg==
X-Google-Smtp-Source: AA0mqf62VyZdW4auUMnIXeVYdnC6S01JYtnXZYf5j6edhD/d7LSZvVxnROe6RVTCDX1scp9U+j/H8g==
X-Received: by 2002:a05:6512:1308:b0:4b2:1e88:41bb with SMTP id
 x8-20020a056512130800b004b21e8841bbmr8370954lfu.117.1668611319711; 
 Wed, 16 Nov 2022 07:08:39 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b24-20020a056512071800b004b15bc0ff63sm2621645lfs.277.2022.11.16.07.08.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Nov 2022 07:08:39 -0800 (PST)
Message-ID: <e049f5b1-da41-6854-4731-b6697770ffde@linaro.org>
Date: Wed, 16 Nov 2022 18:08:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 2/3] drm/msm/disp/dpu1: add helper to know if display
 is pluggable
Content-Language: en-GB
To: Kalyan Thota <quic_kalyant@quicinc.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <1668609040-2549-1-git-send-email-quic_kalyant@quicinc.com>
 <1668609040-2549-3-git-send-email-quic_kalyant@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1668609040-2549-3-git-send-email-quic_kalyant@quicinc.com>
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

On 16/11/2022 17:30, Kalyan Thota wrote:
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
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 16 ++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  6 ++++++
>   2 files changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 9c6817b..be93269 100644
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
> @@ -217,6 +218,21 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
>   	15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
>   };
>   
> +bool dpu_encoder_is_pluggable(struct drm_encoder *encoder)
> +{
> +	struct drm_bridge *bridge;
> +	int ops = 0;
> +
> +	if (!encoder)
> +		return false;
> +
> +	/* Get last bridge in the chain to determine pluggable state */
> +	drm_for_each_bridge_in_chain(encoder, bridge)
> +		if (!drm_bridge_get_next_bridge(bridge))
> +			ops = bridge->ops;
> +
> +	return ops & DRM_BRIDGE_OP_HPD;

No. This is not what you should be checking (hint: polled connectors 
also can be pluggable).

Please check the type of the actual connector connected to this encoder.

> +}
>   
>   bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc)
>   {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 9e7236e..691ab57 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -224,4 +224,10 @@ void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
>    */
>   bool dpu_encoder_is_valid_for_commit(struct drm_encoder *drm_enc);
>   
> +/**
> + * dpu_encoder_is_pluggable - find if the encoder is of type pluggable
> + * @drm_enc:    Pointer to previously created drm encoder structure
> + */
> +bool dpu_encoder_is_pluggable(struct drm_encoder *drm_enc);
> +
>   #endif /* __DPU_ENCODER_H__ */

-- 
With best wishes
Dmitry

