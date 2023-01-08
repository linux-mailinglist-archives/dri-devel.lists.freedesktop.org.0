Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DA0661A38
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 22:56:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48EC610E034;
	Sun,  8 Jan 2023 21:56:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 225A310E213
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 21:56:10 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id y25so10241330lfa.9
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jan 2023 13:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6e8O8V82C5N5Vb0KJCfa+OtRNISoBAeakdYZbJjo70I=;
 b=raLWVm7qNmusfNaKZbuYvMr1H/R2jjVHDWBRtsuze6qnSAFV2T75dP0NSoc0b6/5Ad
 RfL+3pA28APIv55CCUkBN5AGuddLKduXNZ7kmbO0e9WQYgxbtEcsjHrv2QmG8wEtJ/GT
 MwCsH7tUzrPPSQ6mfqxOaEkKy2+6pGKbL/CR3tYOvEoM/xZ6JgEpn7X/L3dSS8UV9y+N
 zIh9hwxCorIIP9WXULKAkpj9uuZF0+0bWY+kDfHvEfROOgo+Z0uC3Nl/ytWUP0YGeaw9
 lkn4KykT94f5I/xRRFrJBW5qKoyNiDmXDYTxv6d1uCRmA6/tokgPPToci5a4WisrlunN
 +mww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6e8O8V82C5N5Vb0KJCfa+OtRNISoBAeakdYZbJjo70I=;
 b=c2nu2vIprmbtmAs69qvNOvhdCRTpG8Aqgz5mZpuIMIXbHjfSF0cpFmtq4IP9skakbu
 +QobGoAW24bEraYGEi7hRT3YZCAKfxv864T6xJPHV7T2bsiIK3hPqU818QIAjdxxaCE5
 cQCQss2oFKWZ04Fv7we+UokjecpjqItpuPMbwsxigfvpIXU7YBNh6x+7UrwVMF+crZAp
 fIrUbVETRJxMR0SrDXJ4h9+1WIlqT5oMzoKp66nETrpF0ld6L+h298uwIdf03x/C1ADY
 VLVjkAm28PGPSxdBEFcRKGRV36xJVRRlmsXv3fp027gvcMjiHRM6PTx9UtlSbfhj7WKS
 v1aQ==
X-Gm-Message-State: AFqh2kp3wvpwhDLU1ethPKO3kM5PXKloA4XhiWdjrSjvsxjefmr88YDJ
 HzY5IVog/RgRr1hWbhfdbi1Hxg==
X-Google-Smtp-Source: AMrXdXvKo2BtT7e7Uk53Mqd4oozSlCHiPGbx4Ag+iv04st1VBFMwsT1AQnDkXGlmcDc76falNTAJ7w==
X-Received: by 2002:ac2:482d:0:b0:4ba:555f:4799 with SMTP id
 13-20020ac2482d000000b004ba555f4799mr11450200lft.16.1673214968460; 
 Sun, 08 Jan 2023 13:56:08 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a056512075300b004b15bc0ff63sm1239096lfs.277.2023.01.08.13.56.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jan 2023 13:56:08 -0800 (PST)
Message-ID: <e56c48c2-8439-c9c8-c735-95adece3c68d@linaro.org>
Date: Sun, 8 Jan 2023 23:56:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/msm/dpu: Add check for cstate
Content-Language: en-GB
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, airlied@gmail.com,
 daniel@ffwll.ch, quic_jesszhan@quicinc.com, ville.syrjala@linux.intel.com,
 yang.lee@linux.alibaba.com
References: <20221206080517.43786-1-jiasheng@iscas.ac.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221206080517.43786-1-jiasheng@iscas.ac.cn>
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

On 06/12/2022 10:05, Jiasheng Jiang wrote:
> As kzalloc may fail and return NULL pointer,
> it should be better to check cstate
> in order to avoid the NULL pointer dereference
> in __drm_atomic_helper_crtc_reset.
> 
> Fixes: 1cff7440a86e ("drm/msm: Convert to using __drm_atomic_helper_crtc_reset() for reset.")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 13ce321283ff..22c2787b7b38 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -968,7 +968,10 @@ static void dpu_crtc_reset(struct drm_crtc *crtc)
>   	if (crtc->state)
>   		dpu_crtc_destroy_state(crtc, crtc->state);
>   
> -	__drm_atomic_helper_crtc_reset(crtc, &cstate->base);
> +	if (cstate)
> +		__drm_atomic_helper_crtc_reset(crtc, &cstate->base);
> +	else
> +		__drm_atomic_helper_crtc_reset(crtc, NULL);

NAK.

The proper fix is to add the if() but to skip the else clause. We should 
not reset the crtc's state if memory allocation failed.

>   }
>   
>   /**

-- 
With best wishes
Dmitry

