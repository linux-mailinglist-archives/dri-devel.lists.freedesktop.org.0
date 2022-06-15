Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C76F54C7C2
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 13:51:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3613910E165;
	Wed, 15 Jun 2022 11:51:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FAC510E11B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 11:51:00 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id 20so18475779lfz.8
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 04:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WO0nwIuovSMeFOh147VxfsRiP5jPmKwXeiabGncRUA4=;
 b=uCL41/ysCSOyXoQAz1ufqI209ZJM4qxeQjipG4DG7UySSHPWw0AsYR4vrWSlngpCB2
 dz5L61Ar4irJAUus4KHWAT7uZWuRv1WpsVHybi2/yefeHrORC6pi0+QMdGjyo7je/+ax
 LnpzkTi399ciawKc2eMYFSZt45O9u5vKQVjBqJcXCp4y0Z3ljAQPK8qGXBc301lMNVB1
 mX6UzLrW6X7dTWPx16KvcchRUnr+38U/jcnaIjgh6DNGkM5yEq8d8wPFMz6aQtxGjAAm
 ShTLjb3hUSkNaU7l+CuYvIJfKAlPYlwy+ezUiPC3cWYZ2neZfzx6uyglFfSWgQM78xvd
 p3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WO0nwIuovSMeFOh147VxfsRiP5jPmKwXeiabGncRUA4=;
 b=rry1yhHaDXmHGztJ7oSTvpIgNRf0MWOpawgE1YREPUAKZLgzVq+evSXmCGxt28UORi
 t961Ys8PliNQpgIxVoXF2lxLz3omZ1qu9mupo1OpQEMX9P8AQ8RCgyVG+/plFv4P90NA
 w9HXaX65jXNHOqMRGlQDXNltYn60WBP9C+VJnhQaxd1YiPe57I+IyBpDMjWL8fUMKDsz
 BgqX1VwuuWpNKj6SM5jWbmWBhCiBu/COwJW1ijrhJrhjS49GTJCRc0M3JjEWEAELpMh/
 5vtxyTYUzw6H+iUqDfVp2DlXBwoCIkoSPIiD09yc4Omt17SqKG37kUeHCaqN+Cu2noJw
 2GsQ==
X-Gm-Message-State: AJIora+j6e0cmDh0EITpHndaS5co5FsbdHchZvKuQwUKBcSjndmTA+Od
 9kWIMqUeiLHDLdxin/UpAWGGBQ==
X-Google-Smtp-Source: AGRyM1swwvjJTFIH/fHV1BdTuQ04yWwfcyDf1MvWtGNhk/I3H1OLQsh1eJj6aqcsEoVFyStGWhM5Vg==
X-Received: by 2002:ac2:48ab:0:b0:47d:af82:65e9 with SMTP id
 u11-20020ac248ab000000b0047daf8265e9mr5660443lfg.673.1655293858825; 
 Wed, 15 Jun 2022 04:50:58 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 27-20020ac24d5b000000b00478ee191091sm1767031lfp.153.2022.06.15.04.50.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 04:50:58 -0700 (PDT)
Message-ID: <576379dd-e5b0-3363-07a1-c623aeea6fee@linaro.org>
Date: Wed, 15 Jun 2022 14:50:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 3/4] drm/msm/disp/dpu1: use atomic enable/disable
 callbacks for encoder functions
Content-Language: en-GB
To: Vinod Polimera <quic_vpolimer@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, robdclark@gmail.com, seanpaul@chromium.org,
 swboyd@chromium.org, dianders@chromium.org,
 krzysztof.kozlowski@canonical.com, thierry.reding@gmail.com,
 sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch
References: <1645455086-9359-1-git-send-email-quic_vpolimer@quicinc.com>
 <1645455086-9359-4-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1645455086-9359-4-git-send-email-quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com,
 quic_vproddut@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/02/2022 17:51, Vinod Polimera wrote:
> Use atomic variants for encoder callback functions such that
> certain states like self-refresh can be accessed as part of
> enable/disable sequence.
> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> 
> Changes in v2:
> - As per review suggestion by Dmitry.
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 1e648db..6eac417 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1138,7 +1138,8 @@ void dpu_encoder_virt_runtime_resume(struct drm_encoder *drm_enc)
>   	mutex_unlock(&dpu_enc->enc_lock);
>   }
>   
> -static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
> +static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc,
> +				struct drm_atomic_state *state)
>   {
>   	struct dpu_encoder_virt *dpu_enc = NULL;
>   	int ret = 0;
> @@ -1176,7 +1177,8 @@ static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
>   	mutex_unlock(&dpu_enc->enc_lock);
>   }
>   
> -static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
> +static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc,
> +				struct drm_atomic_state *state)
>   {
>   	struct dpu_encoder_virt *dpu_enc = NULL;
>   	struct msm_drm_private *priv;
> @@ -2094,8 +2096,8 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
>   
>   static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
>   	.mode_set = dpu_encoder_virt_mode_set,
> -	.disable = dpu_encoder_virt_disable,
> -	.enable = dpu_encoder_virt_enable,
> +	.atomic_disable = dpu_encoder_virt_disable,
> +	.atomic_enable = dpu_encoder_virt_enable,

A small nit before you post the next iteration of PSR:

Please rename these functions to follow atomic_enable/atomic_disable names.

>   	.atomic_check = dpu_encoder_virt_atomic_check,
>   };
>   


-- 
With best wishes
Dmitry
