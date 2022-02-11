Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C1B4B1BB5
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 02:58:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B395510E994;
	Fri, 11 Feb 2022 01:58:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3471B10E994
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 01:58:12 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id 13so13754943lfp.7
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 17:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=gamHH2XRTylhvnpesSgZb4MLgHOJXtNvgSBoVlaZkEI=;
 b=axTit6MZ8JevfejidD0uuSMhoc6TK0NFsQLJ0jrYJvdvFiGqCFO8wqcQiomHy1yhzh
 xTdbz8AvRF/U6lD92A0I2bWKuEKexGffBNam4Xsu8sh5OAlMVqgG0OY/YN9OjxYXJIra
 FYwOlLO8xVSyXZaYbLLN40HfOzX8/8L5nmZfKqsy+/2Q/aDxRNAgoGM1Vv8qdlRqp1VR
 IvhvnDGqBy6ytxSrGECCOX18B4KCVqLYEmh5o8zA10Ivj4xEA775Oyv4EQVfCEPn03Bf
 af5wDQcXoEI5STOF7rv1MF6gwZERigtsexXX2J2aOCFdHaKPktTsiD8S71NzmH9TgWym
 HYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gamHH2XRTylhvnpesSgZb4MLgHOJXtNvgSBoVlaZkEI=;
 b=FsyuZ5oGk+yAhK44XAJmNKAel0YTSfbhcvarqpC323zVEGm4Pj3lncm7ko0ysUFY7L
 nrPiDOuso/NCRks5IjZCYOLRA0wrLarDxlo2K7z/PlETbq2TP4/J2wedfa8fT3pjkj98
 qjLcVsrDQmQF7g0BOueC4fHTq930bznDqkJE3hEntl1fi5HrSRO7FMlHHzXoOkQUKm/L
 ipJaHW6yjldBMhpteRT489cLZ5VWymB8Hr980JA0XSV6se/RD/MJKl/JhYnGvo16CF8r
 VLbcXfxKbDyk8O0jbJPRcgFlIyd9cSGc7AM6n0hU7N7B1HOWKAxDSVeSfK8xw9D2J7IH
 N/qg==
X-Gm-Message-State: AOAM5311lfICyCR0YtrDzkjdzEokzeqf9rtW4AKTIWcs1poGgyahUlIg
 nmynOv9xf3zeOTOhNT51TXyxZg==
X-Google-Smtp-Source: ABdhPJyNVF6EHpX/FJ4wtTo5mfa3zXeG+RA9WaRc4cptEen5cejv2SgQ4zqhUXKN8rip2gX3CTeGqw==
X-Received: by 2002:a05:6512:158a:: with SMTP id
 bp10mr6949684lfb.407.1644544690570; 
 Thu, 10 Feb 2022 17:58:10 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id bt2sm1206999lfb.93.2022.02.10.17.58.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 17:58:10 -0800 (PST)
Message-ID: <16278118-e33b-44f6-e815-fdcab44641bd@linaro.org>
Date: Fri, 11 Feb 2022 04:58:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 1/3] drm/msm/dpu: Remove set but unused variables
Content-Language: en-GB
To: Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
References: <20220210114106.290669-1-vkoul@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220210114106.290669-1-vkoul@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Guenter Roeck <linux@roeck-us.net>, Mark Yacoub <markyacoub@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/02/2022 14:41, Vinod Koul wrote:
> We get warning:
> 
> In function ‘dpu_encoder_virt_enable’: drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1145:33:
> warning: variable ‘priv’ set but not used [-Wunused-but-set-variable]
>   1145 |         struct msm_drm_private *priv;
> 
> In function ‘dpu_encoder_virt_disable’: drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1182:33:
> warning: variable ‘priv’ set but not used [-Wunused-but-set-variable]
>   1182 |         struct msm_drm_private *priv;
> 
> Remove these unused but set variables
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 1e648db439f9..132844801e92 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1142,14 +1142,12 @@ static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
>   {
>   	struct dpu_encoder_virt *dpu_enc = NULL;
>   	int ret = 0;
> -	struct msm_drm_private *priv;
>   	struct drm_display_mode *cur_mode = NULL;
>   
>   	dpu_enc = to_dpu_encoder_virt(drm_enc);
>   
>   	mutex_lock(&dpu_enc->enc_lock);
>   	cur_mode = &dpu_enc->base.crtc->state->adjusted_mode;
> -	priv = drm_enc->dev->dev_private;
>   
>   	trace_dpu_enc_enable(DRMID(drm_enc), cur_mode->hdisplay,
>   			     cur_mode->vdisplay);
> @@ -1179,7 +1177,6 @@ static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
>   static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
>   {
>   	struct dpu_encoder_virt *dpu_enc = NULL;
> -	struct msm_drm_private *priv;
>   	int i = 0;
>   
>   	dpu_enc = to_dpu_encoder_virt(drm_enc);
> @@ -1188,8 +1185,6 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
>   	mutex_lock(&dpu_enc->enc_lock);
>   	dpu_enc->enabled = false;
>   
> -	priv = drm_enc->dev->dev_private;
> -
>   	trace_dpu_enc_disable(DRMID(drm_enc));
>   
>   	/* wait for idle */


-- 
With best wishes
Dmitry
