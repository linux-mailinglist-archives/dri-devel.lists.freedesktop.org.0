Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D106E851B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 00:43:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E28110EB31;
	Wed, 19 Apr 2023 22:43:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E90F10EB35
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 22:43:07 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2a8c51ba511so1236491fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 15:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681944186; x=1684536186;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z3M0LQ/ubafQ1XW2Zv3qTiRWHd+HBOU3Tg1nHSzKNd8=;
 b=zbdSu1J9YUL9VowkLx4U95DFv/zp5PDZulBCbPt6w2BS22oPberjtB1cwZ9fQQmN8M
 uQZ0ul91uhFb+edXU4k4IXKIrphayArufUc4Yto7b3HN8Y7dfQpogWZ94LDl2nCajtCz
 efyViB2H62hGf87IjEeU3rAOkqJ8Xzr+Jg5kmSolMkmUDbC6LU62qcK1PkRWV7HSe354
 M+T9kkEftGYxkXCx4E2x8+2NEWzRGXVV//FNKgzhM67mza3qUvLcnPxxDh7rcLqVMIhs
 lguIx11WgnxbDgBkd669sghB+scSSUaAJPhD1cxdFtOqrS24OdulQx8pNB+lSuRraLNU
 Bygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681944186; x=1684536186;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z3M0LQ/ubafQ1XW2Zv3qTiRWHd+HBOU3Tg1nHSzKNd8=;
 b=WpMEvzYaJlSHO9uXSzQDUA2y9TQnx8IsPdIT9MVP/GQgLctBz0p+6CBO7An9laPz4n
 JRsP3fQsNtnXFZI8ZVUnJq3D5pgzuEYOtKSCNV4tSpZj+CPYr4LeAF/FD1Ark3Qu+1tC
 TIiUeXdAJACyn3croaQC4RwpUGF+lvEPooHDV9IknNyhTlpD2pbkhFTkno91Bcx+vfwN
 +/l+4+gGKUROXzmIKmlXrE7ipd+AJp94lESYBeWyWw8aMT4Y7jwBKhqg/dk8BvZkUxT9
 cLhXsEpRKRyid/hIP4MnEQq9SFBLD+r9sI1UMdEvUVZPeLrJmdxWZrjfkRVuZq1bY7qG
 9P2g==
X-Gm-Message-State: AAQBX9fH44ixa1by2OcMEKTlRp6XLz4f9AJCkgB006VZBQM/ySqZJU5M
 P42/yAlZGKl4rYu1ZG0K85l8Rw==
X-Google-Smtp-Source: AKy350Y1xqJVOoCB8guyvKMrBoL1gbAg8S/n+fR3ZNRsELSU4n4JJtf31Iiet9DH7Du9ue1XVhHMiA==
X-Received: by 2002:a19:f50b:0:b0:4db:3e56:55c8 with SMTP id
 j11-20020a19f50b000000b004db3e5655c8mr4010253lfb.59.1681944185935; 
 Wed, 19 Apr 2023 15:43:05 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a056512024700b004e7fa99f3f4sm27542lfo.265.2023.04.19.15.43.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 15:43:05 -0700 (PDT)
Message-ID: <74c59560-8a79-150f-0c1e-13f22eb35cb2@linaro.org>
Date: Thu, 20 Apr 2023 01:43:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 04/11] drm/msm/dpu: allow using lm mixer base stage
Content-Language: en-GB
To: Arnaud Vrac <avrac@freebox.fr>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
 <20230419-dpu-tweaks-v1-4-d1bac46db075@freebox.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230419-dpu-tweaks-v1-4-d1bac46db075@freebox.fr>
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
> The dpu backend already handles applying alpha to the base stage, so we
> can use it to render the bottom plane in all cases. This allows mixing
> one additional plane with the hardware mixer.
> 
> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>

This might require additional changes. First, for the STAGE_BASE pipe 
in the source split mode (iow using two LMs) should programmed with 
respect to the right LM's x offset (rather than usual left top-left LM). 
See  mdss_mdp_pipe_position_update().

Also this might need some interaction with CTL_MIXER_BORDER_OUT being 
set or not. If I remember correctly, if there bottom plane is not 
fullscreen or if there are no planes at all, we should set 
CTL_MIXER_BORDER_OUT (which takes STAGE_BASE) and start assigning them 
from STAGE0. If not, we can use STAGE_BASE.

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 14b5cfe306113..148921ed62f85 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -881,7 +881,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>   	r_pipe->sspp = NULL;
>   
> -	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
> +	pstate->stage = DPU_STAGE_BASE + pstate->base.normalized_zpos;
>   	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
>   		DPU_ERROR("> %d plane stages assigned\n",
>   			  pdpu->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
> 

-- 
With best wishes
Dmitry

