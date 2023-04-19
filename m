Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6976E84DA
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 00:24:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A6A10EB2D;
	Wed, 19 Apr 2023 22:23:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A236D10EB2A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 22:23:56 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id a10so671497ljr.5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 15:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681943034; x=1684535034;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VCawUKvbpyJ/O3QCtYIFnEkGoYOHSsivpE+P/NmOeR0=;
 b=gBReHy/14DcmnMDI8++fMkHG+PPvn+g+AG1T9PQl171wpJIcWDtJZ8Yl/HYjgS2+Uq
 cnaNemaH9HMifkQEUNnoLLOmFqmwqfortgIUKhhRlx6doFaKz3mO7bPg/OD62Vjl+jfQ
 XTCqZUzy2zPnSD3txii2j0agx2w/sNad0F6pGDD5hQ54SyJgcVEdgsWduJRbGyobPRRK
 +wDmiTbu/TjuDahlWG+gKoA5YlKwsVg21tJhvuAEdYbx9a+wr8QemRSls9YpFVrZHSX/
 nm7wctkTx62O6FRWnznAyRuxVMWBGTGyvRw3x99dEPVfiT9lwO1c/kf/8TQtwWcRfbTW
 aY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681943034; x=1684535034;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VCawUKvbpyJ/O3QCtYIFnEkGoYOHSsivpE+P/NmOeR0=;
 b=As17DaDu2Y8Myk8zNKGos7cjiW6Kbl2x5P/4FYu/ImEsNcGq3kpPxdjNTYMmxP8458
 XNp4/UUJpYBaOYv7rosIntw8bUPtREMVpEHrFGnKj4+6HehFhyCghSM+5Vb+r24a2V6C
 PzKRobtWOCYm018qEPSA2bh5V+CRFaqYI8jKHequntEuXSpLvW1bO7V+6wbqmkPtonRy
 mpB4IbOJXsIGAhx860HUMUydR2Q5gtxglPEiPrjhzK33O7OPrDodVr9d1YeFmhi1lRkY
 GEjjjJqGf8v2pu0m6bhLoJIZ3HZCEL+5ABsa8smDGDyYD2kgJN+6+V1CbHL2pIAb+/YO
 bEIQ==
X-Gm-Message-State: AAQBX9f5kAysP/sj2kccdcc9bAze6NrB1jmw4VljIgT/7KpGrt49P/xB
 9IRUPZB/Ov83HKQiZOB4qGP/ZA==
X-Google-Smtp-Source: AKy350bMNNErl7bByeTgmpgjdePtabkJ+a2Vh6JpDEnLxmjvPvyv7daUPysh6Z+4C1DKcf7pk3Ip0A==
X-Received: by 2002:a2e:b0fc:0:b0:2a7:763e:f158 with SMTP id
 h28-20020a2eb0fc000000b002a7763ef158mr2213119ljl.19.1681943034546; 
 Wed, 19 Apr 2023 15:23:54 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 e26-20020a2e985a000000b00294692d8645sm3068589ljj.17.2023.04.19.15.23.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 15:23:53 -0700 (PDT)
Message-ID: <6e807c05-a990-5692-3f84-2e4153c8c278@linaro.org>
Date: Thu, 20 Apr 2023 01:23:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 02/11] drm/msm/dpu: use the actual lm maximum width
 instead of a hardcoded value
Content-Language: en-GB
To: Arnaud Vrac <avrac@freebox.fr>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
 <20230419-dpu-tweaks-v1-2-d1bac46db075@freebox.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230419-dpu-tweaks-v1-2-d1bac46db075@freebox.fr>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/04/2023 17:41, Arnaud Vrac wrote:
> This avoids using two LMs instead of one when the display width is lower
> than the maximum supported value. For example on MSM8996/MSM8998, the
> actual maxwidth is 2560, so we would use two LMs for 1280x720 or
> 1920x1080 resolutions, while one is enough.
> 
> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>

While this looks correct (and following what we have in 4.4), later 
vendor kernels specify the topology explicitly. Probably we should check 
this with the hw guys, because it might be the following case: even 
though a single LM can supply the mode, it will spend more power 
compared to two LMs.


> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 1dc5dbe585723..dd2914726c4f6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -53,8 +53,6 @@
>   
>   #define IDLE_SHORT_TIMEOUT	1
>   
> -#define MAX_HDISPLAY_SPLIT 1080
> -
>   /* timeout in frames waiting for frame done */
>   #define DPU_ENCODER_FRAME_DONE_TIMEOUT_FRAMES 5
>   
> @@ -568,10 +566,12 @@ static struct msm_display_topology dpu_encoder_get_topology(
>   	 */
>   	if (intf_count == 2)
>   		topology.num_lm = 2;
> -	else if (!dpu_kms->catalog->caps->has_3d_merge)
> -		topology.num_lm = 1;
> +	else if (dpu_kms->catalog->caps->has_3d_merge &&
> +		 dpu_kms->catalog->mixer_count > 0 &&
> +		 mode->hdisplay > dpu_kms->catalog->mixer[0].sblk->maxwidth)
> +		topology.num_lm = 2;
>   	else
> -		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
> +		topology.num_lm = 1;
>   
>   	if (crtc_state->ctm)
>   		topology.num_dspp = topology.num_lm;
> 

-- 
With best wishes
Dmitry

