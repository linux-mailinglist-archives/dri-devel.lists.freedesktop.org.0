Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A186354C8B5
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 14:38:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DBEF10E568;
	Wed, 15 Jun 2022 12:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228CE10E568
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 12:38:25 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id a2so18700863lfg.5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 05:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Rw2dVfvPL9GGTobqrWo57cZxV8BooWeg78sTBvMCYRc=;
 b=kQS4zHJbDwNqI6+cmWZgfMiCd/E985oQ0mVhGb8D4gwpBQ8uG1uT0td8w+SXR/COUw
 7Oe3hI1+D3PbmkJnQ2h81wdGEseYoHlG+Ir5ZEiVLrVQNA7nveQU20E12RQqX5zhR6j6
 B7U6bCEsbWP+JiO1XzrqeSDwHmbcKskVupKUw6tRFmWCBob3OM11BZ+Du6i5XJVnWpec
 CySuezgr7dPF8VokiAK5eMsWr6+9LxzreN+kyO3ZBhwGrrOSHDPROMXCqBQiDXUCKt5f
 oSacWMbaeKzpZQCImGZdErumA5yUoSufEYXD6J6gAc/HfmNh6XWQl+2VYXS8ru+qmZ79
 qx/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Rw2dVfvPL9GGTobqrWo57cZxV8BooWeg78sTBvMCYRc=;
 b=kjep9Im4juQ1dEQrBUMXI++djXVNWP8ZdSBO3QitU7QvNEpjyKAYG+b7KgO/+S+8AS
 MpRTAXkFq1N1zXmQxuTBt1OxLcue3P+skFLDQvW1/eiWD8hCmGkG9ZMMTUSHxRjprcpo
 7bJP64yr3If8co/tRTx8cnBQXYxtLSObJDMjjAIsQA0iZ+ggXIfc+cpdAwE5KoX3wB8J
 Rl4gGaLiNoYcfvVC8pcvY7gX0Es1TMK20Dj1Ha+PgOEARFE9H5WfSR2Vr1gQVBkokGPU
 JtMgLfmf3YqI/WrmcSO3IkZuX3S14Ls0PovHFyDHlZQ6ljcpekoa4rfH2l/mvE63ntsH
 n3Kg==
X-Gm-Message-State: AJIora98TsqopT4ytGHSFpaFKIyK7fMOx54/b2JLHcT3uXBZa/KwB5lN
 Xgei9pl1T1ZZLftQWAhuzbeFUw==
X-Google-Smtp-Source: AGRyM1shUdkm/ojyGggab68nHxnA99BayqFxMrwdGn8pwl1la/sCKkGHCl88z7CwV8NNL0VMRkvjvQ==
X-Received: by 2002:a05:6512:3183:b0:479:3e62:2cb with SMTP id
 i3-20020a056512318300b004793e6202cbmr6155606lfe.459.1655296703503; 
 Wed, 15 Jun 2022 05:38:23 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 j23-20020a2e8517000000b0025561ce1275sm1679202lji.135.2022.06.15.05.38.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 05:38:23 -0700 (PDT)
Message-ID: <55b328f4-f62c-14c5-b02f-614d04df48a1@linaro.org>
Date: Wed, 15 Jun 2022 15:38:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 3/3] drm/msm/dpu: remove hard-coded linewidth limit for
 writeback
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <1655235140-16424-1-git-send-email-quic_abhinavk@quicinc.com>
 <1655235140-16424-3-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1655235140-16424-3-git-send-email-quic_abhinavk@quicinc.com>
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
Cc: dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 quic_jesszhan@quicinc.com, quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/06/2022 22:32, Abhinav Kumar wrote:
> Remove the hard-coded limit for writeback and lets start using
> the one from catalog instead.
> 
> Fixes: d7d0e73f7de3 ("introduce the dpu_encoder_phys_* for writeback")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index 59da348ff339..fc1d4fda69b5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -20,8 +20,6 @@
>   #include "dpu_crtc.h"
>   #include "disp/msm_disp_snapshot.h"
>   
> -#define DEFAULT_MAX_WRITEBACK_WIDTH 2048
> -
>   #define to_dpu_encoder_phys_wb(x) \
>   	container_of(x, struct dpu_encoder_phys_wb, base)
>   
> @@ -278,9 +276,9 @@ static int dpu_encoder_phys_wb_atomic_check(
>   		DPU_ERROR("invalid fb h=%d, mode h=%d\n", fb->height,
>   				  mode->vdisplay);
>   		return -EINVAL;
> -	} else if (fb->width > DEFAULT_MAX_WRITEBACK_WIDTH) {
> +	} else if (fb->width > phys_enc->hw_wb->caps->maxlinewidth) {
>   		DPU_ERROR("invalid fb w=%d, maxlinewidth=%u\n",
> -				  fb->width, DEFAULT_MAX_WRITEBACK_WIDTH);
> +				  fb->width, phys_enc->hw_wb->caps->maxlinewidth);
>   		return -EINVAL;
>   	}
>   


-- 
With best wishes
Dmitry
