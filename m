Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 265CF661A58
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 23:08:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7075710E213;
	Sun,  8 Jan 2023 22:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B7E210E01F
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 22:08:11 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id bu8so10289217lfb.4
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jan 2023 14:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f6ubnZnnnm86vU9G8oTF7iYXAATguR/oQ9JcuOI4Xb4=;
 b=E+xc4iTYp/PLYZ+e4TrolV7ng//esyyQjPKtR4jEnokZyBcEKoAi4zhZ9ruWeypdcl
 7g2TtMyAcFsoPSX+Yvf4+c12wYd48f8B5l3P2tWT5A+AXV3pHriSyQtcSy8T3YNNfAma
 sNu04ApNLGnoAenyCgLrAD/EErt4sdwH8HZatJ3ygihxgbkzt6zikf9GT6KGvin4RzdR
 9xDqgcDJheBp2i6j5rF5mqxOPfH+dUhEZpRsZpAAZtOU4NkH3m7Zj51MbXIcL32m0c9Y
 SvT63U5SHBwQ9/45cAU6bd8zdczxxoj5PwyUmru5Ft3yIZZmJNVybor8tN83+n44YgM5
 9OWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f6ubnZnnnm86vU9G8oTF7iYXAATguR/oQ9JcuOI4Xb4=;
 b=8NT5k45OY9XZi2kiPALTvJ8zWl2CfsxNMcMBEkfWyu9Xn1nHDR7dbTxsoJbUvcT0AA
 9lWH6Eh8ZiNg+F59mJ0quHgXlaFO7B81fzROEeLW/0HEgh5pJkHnL/bZp68Thx7DAJd/
 wHWHp3d/JJEg2RHJBJuWpG3LoHtu8FjSlEkMZ2uKtvTfgGsjK3QHNCWiUqvgZDwnF8+p
 mVf0jk1IsOiRaTnIs/3rqe2KZq4BGpT4EnkkDxHdy1XY4MAWnxKtpQ/SSJZBwYnNBblq
 qbiz096GOKrC64OAe3ljqYQVV4WkatwF7aFdgFf2iU+61lrO/27dF6oaU184Ewgd8DjI
 W7XA==
X-Gm-Message-State: AFqh2krvWptAwDVGI80opxnju+5Ia7wGIZH4Vwe2CddmkpYvxNfsEHoP
 gbuowr+Bl+KrTgKb7/PMnOrQfw==
X-Google-Smtp-Source: AMrXdXsBReaMbutTRcZt/O0SaBsRbQ2XZpqlgv3sWb32zgktzJf0Rsigi+BnZVpThocB45KaI7TkPQ==
X-Received: by 2002:a05:6512:308f:b0:4cb:1189:2862 with SMTP id
 z15-20020a056512308f00b004cb11892862mr13486061lfd.13.1673215689664; 
 Sun, 08 Jan 2023 14:08:09 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a056512215100b0049876c1bb24sm1264699lfr.225.2023.01.08.14.08.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jan 2023 14:08:09 -0800 (PST)
Message-ID: <0b63ef49-7a59-0a72-503c-1de20a502c6a@linaro.org>
Date: Mon, 9 Jan 2023 00:08:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/msm/dpu: Add check for cstate
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, airlied@gmail.com,
 daniel@ffwll.ch, quic_jesszhan@quicinc.com, ville.syrjala@linux.intel.com,
 yang.lee@linux.alibaba.com
References: <20221206080517.43786-1-jiasheng@iscas.ac.cn>
 <e56c48c2-8439-c9c8-c735-95adece3c68d@linaro.org>
In-Reply-To: <e56c48c2-8439-c9c8-c735-95adece3c68d@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/01/2023 23:56, Dmitry Baryshkov wrote:
> On 06/12/2022 10:05, Jiasheng Jiang wrote:
>> As kzalloc may fail and return NULL pointer,
>> it should be better to check cstate
>> in order to avoid the NULL pointer dereference
>> in __drm_atomic_helper_crtc_reset.
>>
>> Fixes: 1cff7440a86e ("drm/msm: Convert to using 
>> __drm_atomic_helper_crtc_reset() for reset.")
>> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index 13ce321283ff..22c2787b7b38 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -968,7 +968,10 @@ static void dpu_crtc_reset(struct drm_crtc *crtc)
>>       if (crtc->state)
>>           dpu_crtc_destroy_state(crtc, crtc->state);
>> -    __drm_atomic_helper_crtc_reset(crtc, &cstate->base);
>> +    if (cstate)
>> +        __drm_atomic_helper_crtc_reset(crtc, &cstate->base);
>> +    else
>> +        __drm_atomic_helper_crtc_reset(crtc, NULL);
> 
> NAK.
> 
> The proper fix is to add the if() but to skip the else clause. We should 
> not reset the crtc's state if memory allocation failed.

On the other hand... Some of the drivers do exactly this ops.

With the message fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

