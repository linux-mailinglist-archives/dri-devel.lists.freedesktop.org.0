Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 582525539F0
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 21:00:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DA110E656;
	Tue, 21 Jun 2022 19:00:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5286410EA3A
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 19:00:04 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id y32so23928821lfa.6
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 12:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6fjMjr211YE9YcIQWwQaRZfIoF2o601X8To7eThZCiA=;
 b=JC/7niSPsJ0iKH+blG56YnE5G8oObtz7l5leDaLqSh1cPQixTKplCxrdd6G5g0aCag
 ixPCy7kMe/0pzU2aQ0dSVUnlBbp1lnHQrzXmbQfwZnxVwPyY4r3Elt3DOTISgMjM5l4D
 c773jMp0cVHVMoQWtthfGuCQX7clEaIhibW59mF2OazXxSZ7IhW8GNCEw3J4IRvE3jJy
 f3O8GvAkQBucJFFCDfXE4dsUauvHpp4s+Z1Ue5YbYAw7cf5p1pg0uEO1CoiQKxoqR9os
 ho0sxgdf13ftuAcYlpBffww6hUkLPUTj/zckqHgBQFhZClC94l07Q5bnPIJW62C9Fw90
 yHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6fjMjr211YE9YcIQWwQaRZfIoF2o601X8To7eThZCiA=;
 b=sNBDAWU7vR9fn08gooTzlhVLo41HfUkSEQBNisd5xkYLJfe/Z7mWk+TSk9vv5H5zla
 9TdrdQWQ+EkuxixxnoYtqyw1KthrItw9JHIDNhmfc/yZjaB4BkxU+IMBLMEHjVMb3tpl
 JlwuJ95d32+b853GUbW4bC4Z2FIB0vz3hcPj0IepSKpbRl8UqHshYHsrKD3e5WT9g298
 o9JU17ZP4CF3rK2uondTIlQLOr5eAeZ5VqJcIdicKJZ4xGO1ylGcOntubu6NrKtP50XB
 52EQUEtk9Oh+TIr0FoN0qzHUmUJc1c5IlGNWWDD91Gx6sDaB3bL+AUMrXILr6lL26Y+1
 WTxg==
X-Gm-Message-State: AJIora/13EXchT5zdSAi7mj59Vva6qAyBfD8PJTvKdOElMQ+ihBerWx9
 hPuxOxdQQNa7ENE9LChswO17aQ==
X-Google-Smtp-Source: AGRyM1tTwTGocDhWlMkEi3nkgXGoxnkT2ptk3Q/PpeJxeI6Wy1TAEbaq/L9tcVznRBBHUDnp7PiDpQ==
X-Received: by 2002:a19:5214:0:b0:47f:8f4e:9829 with SMTP id
 m20-20020a195214000000b0047f8f4e9829mr1025330lfb.161.1655838002612; 
 Tue, 21 Jun 2022 12:00:02 -0700 (PDT)
Received: from [192.168.43.7] ([188.162.64.230])
 by smtp.gmail.com with ESMTPSA id
 s25-20020a2e2c19000000b0024f3d1daed6sm2104748ljs.94.2022.06.21.12.00.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 12:00:02 -0700 (PDT)
Message-ID: <043d02d3-e03e-f19d-4692-237c43236744@linaro.org>
Date: Tue, 21 Jun 2022 22:00:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [v3 4/5] drm/msm/disp/dpu1: use atomic enable/disable callbacks
 for encoder functions
Content-Language: en-GB
To: Vinod Polimera <quic_vpolimer@quicinc.com>, y@qualcomm.com,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <y> <1655808800-3996-1-git-send-email-quic_vpolimer@quicinc.com>
 <1655808800-3996-5-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1655808800-3996-5-git-send-email-quic_vpolimer@quicinc.com>
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
 linux-kernel@vger.kernel.org, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/06/2022 13:53, Vinod Polimera wrote:
> Use atomic variants for encoder callback functions such that
> certain states like self-refresh can be accessed as part of
> enable/disable sequence.
> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 52516eb..cc2809b 100644
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
> @@ -2332,8 +2334,8 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
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
