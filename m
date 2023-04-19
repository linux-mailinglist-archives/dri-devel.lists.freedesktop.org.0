Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC176E85C4
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 01:19:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD2C10EB3E;
	Wed, 19 Apr 2023 23:19:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5156810EB3E
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 23:19:00 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2a8b082d6feso1424611fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 16:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681946338; x=1684538338;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+wdq0P8U8MGiTGVZIVQ7vaI+OvTE8h6U0BpG3f9uUAk=;
 b=IJigncWb9EWcQl3A6d88q5mSsCJYdQmggTgHA1WKw3mvBEnyhf4PJNWk22ZQ7R+cZE
 1NrH9cfHNyIjR5OkOuKptJlKDJDEKZn5bkG95BOlTeALMtnewj83sj1hyhjY6F6K93W7
 yrEsGy68U468ViQpfgbxyl3rrOLxwo0uuko3AbPOiVVMCSKlZhdp70Ec3CGDfVgFaQOk
 YIta8MciphZXh+JZt/nEfDhHruKkdDAYfxpDalB27ppKvOrxkhODIEV0aLV1wgL2YwiV
 Ageb9gKryWJTnh3XZOg6DRIcv9pSDRVvgQpbywD2XuSXo80QT+rnQGBNo/5G2wNFDYO/
 rKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681946338; x=1684538338;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+wdq0P8U8MGiTGVZIVQ7vaI+OvTE8h6U0BpG3f9uUAk=;
 b=azWI6u6jIAz6+1cr3FsU2Vnr8iYNzNUFrZOj+09zTBSwwMgeseeEjnxW9ocmfsXKJG
 MYiBTuxx5XdyQrYtNkUOl7LeuCz7X5FWiqdy3vo3l+jheNrUq27RNqv4WBM8t76C6cP/
 IMvKfYB6usVENNOL/lC6c0yggTvev4BjRgXurfK5Ux1DHeHvm9dzHlOSP2UDLQziG7dQ
 W2T+4nYWLmkcic0W6vooxgv7IxdxATe1eCvi+EkkWPs4u60XI+CuE1y51ACQGyqkA99Z
 2lC7t/w8ZMaEtchc73qhth1TH3CaO2UojTzOLa8j9P93E2Wpq1P+qgjOKm5HtYPTR5m5
 UJpA==
X-Gm-Message-State: AAQBX9cb5VKrLczS+YSjWrxjfqCuJH8h+DVFrqKP7T9w4+kmxdceqzB7
 lWLUVsGQyO2VacnptQe7wqSZww==
X-Google-Smtp-Source: AKy350bOIyYXKa0fdwi85GvVfLkfqOtAP38hPIJi97ZpdTN8D/CTgttmmrFWABpVOGmBJJEY7o3qBw==
X-Received: by 2002:a19:760e:0:b0:4cb:13d7:77e2 with SMTP id
 c14-20020a19760e000000b004cb13d777e2mr5274677lff.26.1681946337815; 
 Wed, 19 Apr 2023 16:18:57 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a19520a000000b0048a982ad0a8sm40430lfb.23.2023.04.19.16.18.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 16:18:57 -0700 (PDT)
Message-ID: <08e79278-ad30-73e3-a56c-f569b3fea407@linaro.org>
Date: Thu, 20 Apr 2023 02:18:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 11/11] drm/msm/dpu: do not use mixer that supports dspp
 when not required
Content-Language: en-GB
To: Arnaud Vrac <avrac@freebox.fr>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
 <20230419-dpu-tweaks-v1-11-d1bac46db075@freebox.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230419-dpu-tweaks-v1-11-d1bac46db075@freebox.fr>
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
> This avoids using lm blocks that support DSPP when not needed, to
> keep those resources available.

This will break some of the platforms. Consider qcm2290 which has a 
single LM with DSPP. So, _dpu_rm_check_lm_and_get_connected_blks should 
be performed in two steps: first skip non-DSPP-enabled LMs when DSPP is 
not required. Then, if the LM (pair) is not found, look for any suitable 
LM(pair).

> 
> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index f4dda88a73f7d..4b393d46c743f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -362,7 +362,7 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
>   	*pp_idx = idx;
>   
>   	if (!reqs->topology.num_dspp)
> -		return true;
> +		return !lm_cfg->dspp;
>   
>   	idx = lm_cfg->dspp - DSPP_0;
>   	if (idx < 0 || idx >= ARRAY_SIZE(rm->dspp_blks)) {
> 

-- 
With best wishes
Dmitry

