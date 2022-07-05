Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 844B756774E
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 21:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2538411BF46;
	Tue,  5 Jul 2022 19:07:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D597011BF26
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 19:07:32 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id j21so22222698lfe.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jul 2022 12:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DnKgC9sCIW8SXV8tcHv5kUM+QyY61ZZmZlUgZGKqW+Q=;
 b=f/FCG8yL4VOOTwO2rnIiAtzXPtS2mVuAe+XTDCGyoCaarSkKazd9ayjVL9aKwDZEip
 Hge9vP9wx1uromYafvl/X1WbtDWoqQwJnSDDRxWvUYlJk7/IIEJgwqm6L3kqIUNJRVXX
 uH/+Gtcyq+X8WA/OER4Gr1j9Xrklt89C6BCC/GQWhxSjmXDltPe22Ol/338WWA7Fl5+g
 XFQXG7OOJrZXEVFAN9NOP0/LHeBthQ6EAglyrN8O6uI49AJsVBkOrwzfWnK7nEum83As
 Xz4GajFeK/h1ezkCi5IQaNzhJeYb6oFeg8EpZXxgwaPX2TaoAoop/DKEfKssARrc3hJ2
 r2hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DnKgC9sCIW8SXV8tcHv5kUM+QyY61ZZmZlUgZGKqW+Q=;
 b=43pDJ/M7BlcdUVgl8jM3GsMvKP6Wos7icCkeXrpC3gUFIGg++BSOTev/u+M4ByuAry
 wog/fLZtfLG0dnttZq43xLb49L6ieF2CqThpufWkstWrt/2B/qZgUH3wt18tpHcrMd8W
 KDdiix/vk6c7FCHbLPXvZoxFZdYyA8WIhzLmdvKddjpEgkADtW9d8tNB8RJhrExF1AKc
 Kzo8ijH369ZUacARc9mqXGHTctedfnCfxKIKxPkSQuqwkcyYtLc3Ahq9eyfPG0aTZ3+q
 KRd5hZlkDUNb8Y6pWXsLFq84V0DkVNlJkoO6GZRYfYOoYolqfIkhwJI9OJiDtvF8WzO9
 UiKw==
X-Gm-Message-State: AJIora8dter8ndOExNnUkykkvYyBkexGCj/bbYbryn+K3NlT74hC+gMY
 IB3Qh9rsCDi9YMNsqthlOLxaHg==
X-Google-Smtp-Source: AGRyM1t0tljF3Ij4/4tcLOFFrqAsln9WIHlzzxsMkGOGWMfiIex4lo9Ypf2AWIcnRF1E4mgEv9Udkw==
X-Received: by 2002:a05:6512:22c3:b0:47f:9396:861a with SMTP id
 g3-20020a05651222c300b0047f9396861amr24766566lfu.230.1657048051185; 
 Tue, 05 Jul 2022 12:07:31 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 bj11-20020a2eaa8b000000b0025a72db0cf1sm5733629ljb.118.2022.07.05.12.07.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 12:07:30 -0700 (PDT)
Message-ID: <14283b06-d8d3-aa4c-6db8-eb34e597bef8@linaro.org>
Date: Tue, 5 Jul 2022 22:07:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 6/7] drm/msm/disp/dpu1: use atomic enable/disable
 callbacks for encoder functions
Content-Language: en-GB
To: Vinod Polimera <quic_vpolimer@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <1657040445-13067-1-git-send-email-quic_vpolimer@quicinc.com>
 <1657040445-13067-7-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1657040445-13067-7-git-send-email-quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com, dianders@chromium.org,
 quic_abhinavk@quicinc.com, quic_vproddut@quicinc.com,
 linux-kernel@vger.kernel.org, quic_khsieh@quicinc.com,
 bjorn.andersson@linaro.org, quic_aravindh@quicinc.com, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/07/2022 20:00, Vinod Polimera wrote:
> Use atomic variants for encoder callback functions such that
> certain states like self-refresh can be accessed as part of
> enable/disable sequence.
> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

No. Your sign off should be the last tag here. Also there should be no 
blank lines between tags.

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 5629c0b..f01a976 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1130,7 +1130,8 @@ void dpu_encoder_virt_runtime_resume(struct drm_encoder *drm_enc)
>   	mutex_unlock(&dpu_enc->enc_lock);
>   }
>   
> -static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
> +static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
> +					struct drm_atomic_state *state)
>   {
>   	struct dpu_encoder_virt *dpu_enc = NULL;
>   	int ret = 0;
> @@ -1166,7 +1167,8 @@ static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
>   	mutex_unlock(&dpu_enc->enc_lock);
>   }
>   
> -static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
> +static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
> +					struct drm_atomic_state *state)
>   {
>   	struct dpu_encoder_virt *dpu_enc = NULL;
>   	int i = 0;
> @@ -2320,8 +2322,8 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
>   
>   static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
>   	.atomic_mode_set = dpu_encoder_virt_atomic_mode_set,
> -	.disable = dpu_encoder_virt_disable,
> -	.enable = dpu_encoder_virt_enable,
> +	.atomic_disable = dpu_encoder_virt_atomic_disable,
> +	.atomic_enable = dpu_encoder_virt_atomic_enable,
>   	.atomic_check = dpu_encoder_virt_atomic_check,
>   };
>   


-- 
With best wishes
Dmitry
