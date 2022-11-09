Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45682622B62
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 13:19:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD57E10E0A4;
	Wed,  9 Nov 2022 12:19:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3200E10E0A4
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 12:19:07 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id h12so25459343ljg.9
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Nov 2022 04:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ye8sH1zl6sSv9DGDAjB1eEzXhmWboI2vsCHxYwdnJz0=;
 b=ZybYS6nV5FlcTXdHMLqh4gUjeCEABntLlbBDQEVcOAR1CZiPzbrwizoLaTkmEBRDoB
 nlxOmUVmwDcNHB9sx27cVU8h2xk0UuRyv8dTsTHL9ZhMRfRnb9jKGr0RuovM/JgfmAZl
 lxUPM4QzTpDcZJfxMpf8n0omxEYk42BKMKNGGmQufJ1+vfgNulurWPIvCC68Cx18q6FC
 T/9FEZngmNYLRa7CRlwPJF260cUIr5/s/iQbWzhjlPFaNHvracynMpdkxg60nTsk4pTw
 UOc2Ls4pdJy6SmAR/FlX0w9/udujOo3QWnowkPJB/m+iwAFzn6yvCl4FfqCRAi/j0vPp
 gpng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ye8sH1zl6sSv9DGDAjB1eEzXhmWboI2vsCHxYwdnJz0=;
 b=mE4R1hhnr27ojomZcZsHGHKZt/iCLJ/G/n3rll6eO1D8AJxCc3pS0NrrslgVzoa4bh
 bOpwOJiF04NxInJRUk7SYD+aO2JY9aM1tz1CI77e6QQnJ9cWOLAjY9HA3R+4O3/qtkHy
 cAzNtrHwi8UAj4ntUkOQXS7cPO5A/6ZQfke1JXXC8UgtcyLMsz3R+5MFXlgRwH73f1eg
 EtOHa2U94VaFHBfTo0U8BUDAS2PNpqbu90vTP9h+jb/LcltohZVOuWs4nBZQaUuOTpCr
 BIzoc3hR0p1bEnFVmnDszQbFyrIflYv7OwCqOgmVkjuG0mG2oeWw1466dDl7/WJ7+szS
 MaVg==
X-Gm-Message-State: ANoB5pkCl6wly5N/MsfRviaFWhg3uL25ehbjx169r9W2reMgHw+7gf5l
 cbGLCgDDhm1SeR5YJhlEeet4Zg==
X-Google-Smtp-Source: AA0mqf6Qt3W69twHjBbljDgjSSNO7IveTjCXXa66ab4tN+ev2MwpKhm0I2pTcRY2KRSEbjJplOS3zQ==
X-Received: by 2002:a2e:544d:0:b0:278:ba60:d4f0 with SMTP id
 y13-20020a2e544d000000b00278ba60d4f0mr1986815ljd.351.1667996345347; 
 Wed, 09 Nov 2022 04:19:05 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a056512238f00b004979da67114sm2192382lfv.255.2022.11.09.04.19.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 04:19:04 -0800 (PST)
Message-ID: <414280e3-6954-6832-10fa-66cdcdbfac18@linaro.org>
Date: Wed, 9 Nov 2022 15:19:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 1/4] drm/msm/disp/dpu1: pin 1 crtc to 1 encoder
Content-Language: en-GB
To: Kalyan Thota <quic_kalyant@quicinc.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <1667996206-4153-1-git-send-email-quic_kalyant@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1667996206-4153-1-git-send-email-quic_kalyant@quicinc.com>
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

On 09/11/2022 15:16, Kalyan Thota wrote:
> Pin each crtc with one encoder. This arrangement will
> disallow crtc switching between encoders and also will
> facilitate to advertise certain features on crtc based
> on encoder type.
> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 7a5fabc..552a89c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -798,19 +798,19 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
>   	max_crtc_count = min(max_crtc_count, primary_planes_idx);
>   
>   	/* Create one CRTC per encoder */
> +	encoder = list_first_entry(&(dev)->mode_config.encoder_list,
> +		struct drm_encoder, head);

Please use drm_for_each_encoder() here.

>   	for (i = 0; i < max_crtc_count; i++) {
>   		crtc = dpu_crtc_init(dev, primary_planes[i], cursor_planes[i]);
> -		if (IS_ERR(crtc)) {
> +		if (IS_ERR(crtc) || IS_ERR_OR_NULL(encoder)) {

Why? Not to mention that the OR_NULL part is quite frequently a mistake.

>   			ret = PTR_ERR(crtc);
>   			return ret;
>   		}
>   		priv->crtcs[priv->num_crtcs++] = crtc;
> +		encoder->possible_crtcs = 1 << drm_crtc_index(crtc);
> +		encoder = list_next_entry(encoder, head);
>   	}
>   
> -	/* All CRTCs are compatible with all encoders */
> -	drm_for_each_encoder(encoder, dev)
> -		encoder->possible_crtcs = (1 << priv->num_crtcs) - 1;
> -
>   	return 0;
>   }
>   

-- 
With best wishes
Dmitry

