Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA93A717143
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 01:06:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E0910E440;
	Tue, 30 May 2023 23:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8097810E43D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 23:06:28 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f3bb395e69so6002999e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 16:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685487986; x=1688079986;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xoE1Va3lrsP1lB13pDuMNR1cXTdryjflT/7nlUUK6Rc=;
 b=b8/2G2fdB+56Tbp9PnkNRhs5zFlFXYvGJknohLMPNOc8uFbDoU7RrOpy1kpJmg62J2
 rpiEGcZb5E3uM0apJGYSHoKc79LHtMJK4iKqj8feuEdQKGe6HYTGghnT6fWUO4BojeIj
 kqsExpqKuk7NPJlRZ6MverGw+84MZ3hI722UbTviJx+de3ks7uwqsijSdfNZUqsOnXJ9
 QEVeHO66RRKg1fkOq31yvRLLsaWR30CmZmyQO1zHM9TEH4Mg/C3xw1+QO0lLpHVXgkeJ
 g3A9V6bXQztxaXY7JWnu27nqbRkUhRs4pB/YEF1qtin0twCYiJdNQMbuBmV41x0Q1CeS
 DW/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685487986; x=1688079986;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xoE1Va3lrsP1lB13pDuMNR1cXTdryjflT/7nlUUK6Rc=;
 b=imobmUW0T7/h34uwYMMXnIkTZsFLg0Bt2FXRgEJev202OdGD/Pkqm5nUJVsufsLXvb
 RYBU/rtOBup2ikG/F0JAyT3/pwpDKhFNphVdaiITb1fBNEsCkoQn//W/UxHL00uJz8Eh
 xPplUU8h9Epl7XjFpvC1Wbc5bmzfzxrC0ffg+40qjVYw2s3gg1m9JtbRpRjhZZVG+Cd/
 whQbZvTWQbUzn7jdRVc+eWqpNxNhZQ1HTzaG484QGs6ap1IMh8C2MnQpuojPnGtKE04D
 2oK/2NczYPRp6tX+4GAwu+WDY4IOD8UVw814e0GJ/CfqoYGZTQMewqoQuYW3hzKKkafh
 hFog==
X-Gm-Message-State: AC+VfDzjgUwU+L54JyCmol1Osj4QE4h4a4hQu98DhkME0kUEQLNvcHm6
 ffAzGwTuMZdRlIZxCarnApx/6g==
X-Google-Smtp-Source: ACHHUZ5vqEiOKQt+AwXDfF7NvKz9AQrvbyjiDTMb/5ktfTARtcQduzonA0aupU0Gc6Bo6oCvvzki8w==
X-Received: by 2002:ac2:5a0d:0:b0:4f3:aaea:6d48 with SMTP id
 q13-20020ac25a0d000000b004f3aaea6d48mr1515508lfn.63.1685487986417; 
 Tue, 30 May 2023 16:06:26 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a19ae0c000000b004f378fbb358sm483832lfc.112.2023.05.30.16.06.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 16:06:25 -0700 (PDT)
Message-ID: <dfa12c8b-ccec-261c-9c83-54536e17c02d@linaro.org>
Date: Wed, 31 May 2023 02:06:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1 2/3] drm/msm/dpu: retrieve DSI DSC struct at
 atomic_check()
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1685464318-25031-1-git-send-email-quic_khsieh@quicinc.com>
 <1685464318-25031-3-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1685464318-25031-3-git-send-email-quic_khsieh@quicinc.com>
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
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/05/2023 19:31, Kuogee Hsieh wrote:
> At current implementation, DSI DSC struct is populated at display setup
> during system bootup. This mechanism works fine with embedded display.
> But will run into problem with plugin/unplug oriented external display,
> such as DP, due to DSC struct will become stale once external display
> unplugged. New DSC struct has to be re populated to reflect newer external
> display which just plugged in. Move retrieving of DSI DSC struct to
> atomic_check() so that same mechanism will work for both embedded display
> and external plugin/unplug oriented display.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 15 ++++++++++++++-
>   drivers/gpu/drm/msm/msm_drv.h               |  6 ++++++
>   2 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 3b416e1..2927d20 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -16,6 +16,8 @@
>   #include <drm/drm_crtc.h>
>   #include <drm/drm_file.h>
>   #include <drm/drm_probe_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_fixed.h>
>   
>   #include "msm_drv.h"
>   #include "dpu_kms.h"
> @@ -639,6 +641,15 @@ static int dpu_encoder_virt_atomic_check(
>   		}
>   	}
>   
> +	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {

INTF_DSI

> +		struct drm_bridge *bridge;
> +
> +		if (!dpu_enc->dsc) {

This condition is not correct. We should be updating the DSC even if 
there is one.

> +			bridge = drm_bridge_chain_get_first_bridge(drm_enc);
> +			dpu_enc->dsc = msm_dsi_bridge_get_dsc_config(bridge);

This approach will not work for the hot-pluggable outputs. The dpu_enc 
is not a part of the state. It should not be touched before 
atomic_commit actually commits changes.

Also, I don't think I like the API. It makes it impossible for the 
driver to check that the bridge is the actually our DSI bridge or not.
Once you add DP here, the code will explode.

I think instead we should extend the drm_bridge API to be able to get 
the DSC configuration from it directly. Additional care should be put to 
design an assymetrical API. Theoretically a drm_bridge can be both DSC 
source and DSC sink. Imagine a DSI-to-DP or DSI-to-HDMI bridge, 
supporting DSC on the DSI side too.

> +		}
> +	}
> +
>   	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state);
>   
>   	/*
> @@ -2121,8 +2132,10 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>   					phys_enc->hw_pp->merge_3d->idx);
>   	}
>   
> -	if (dpu_enc->dsc)
> +	if (dpu_enc->dsc) {
>   		dpu_encoder_unprep_dsc(dpu_enc);
> +		dpu_enc->dsc = NULL;
> +	}
>   
>   	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
>   	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index e13a8cb..5a7c1f4 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -341,6 +341,7 @@ bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi);
>   bool msm_dsi_is_bonded_dsi(struct msm_dsi *msm_dsi);
>   bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi);
>   struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi);
> +struct drm_dsc_config *msm_dsi_bridge_get_dsc_config(struct drm_bridge *bridge);
>   #else
>   static inline void __init msm_dsi_register(void)
>   {
> @@ -374,6 +375,11 @@ static inline struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_
>   {
>   	return NULL;
>   }
> +
> +struct drm_dsc_config *msm_dsi_bridge_get_dsc_config(struct drm_bridge *bridge)
> +{
> +	return NULL;
> +}

These two chunks belong to the previous patch.

>   #endif
>   
>   #ifdef CONFIG_DRM_MSM_DP

-- 
With best wishes
Dmitry

