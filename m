Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E844F752B39
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 21:53:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 958B310E77D;
	Thu, 13 Jul 2023 19:53:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DDF10E77B
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 19:53:08 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fba8f2197bso2002332e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 12:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689277986; x=1689882786;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tkSK4Hprfqvy1sXh7+UPS2V9p+xt/zZPx5zVI9IIj2A=;
 b=L7U6PT4gRJmUhzc3i7IRnueruqmsdNXGog/dPpUVMruUPYVb0oqU7SxON1iD4YQxAP
 vDkd9HkZi2gB0XGHa1rK2dqh8gze/DIz3KMcqb/RcvJlas9besq0hEp4/Ci/QE7Pwnv/
 qYsfXY57LEmSJ+MVyXub7Y/Lz12muLA8HN91GfTFUuji1Cg53XwqKHFm82kUbiKWztsw
 u0JayV0DURL81rR74Aa0PVq189o/XSYxpIIJC2if/0f1ri4SpEcpz3V01fdvourmNrkC
 /Z8cQ/2Zpsqg6j80zn7gnHjxkNazhOSsRaugR2PAfuU3dDWI6yI6pvmsehjHG+im3oDS
 zljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689277986; x=1689882786;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tkSK4Hprfqvy1sXh7+UPS2V9p+xt/zZPx5zVI9IIj2A=;
 b=EPtdUD0JuSNL9Oe939XxAXSgM16pZcss5X1NWhEmF0ePb8xeCEAYhGq4IgI3RisdvQ
 8omLBxoNsJTja/jh38p8wdfxZmC7VrzcwGSfWXewpl/h+LPliFSu9V8yRvsVLxZRCG3D
 yLuxfr3kDHMUAsojIdGcRf4U9Pu2ScrnbFZ0pZdpXKiVr9ZNcdedj4S922arz/evB0/K
 lZKL4X9MK9iGabUsmFAR+PVi7pMOGLLnQpUwTIJNLita0lnW7pyNfN2JHBDMktrpqAuX
 ORVYxj8zHz3V8Iblo7eCUfQMAMr3KXNB8Wu3E7NFQhrcjAp3bv0FZslCYlGGMXREflSz
 WAPw==
X-Gm-Message-State: ABy/qLbc0qhOpnvuSwx9XTIxwrVP9HPPYuyvgzqLOwv1sIBhirVs4IFm
 Sx9AjI7sw6AunMBHiTtgemojIA==
X-Google-Smtp-Source: APBJJlGVw6V+RP1LIbdt+ch7pPvJN+Jx/IZaclPER7QiiajPjn4MUP8U4h/rRIIgI0eVg2+9OrIxIw==
X-Received: by 2002:a05:6512:3f10:b0:4f7:6976:2070 with SMTP id
 y16-20020a0565123f1000b004f769762070mr2159598lfa.40.1689277986183; 
 Thu, 13 Jul 2023 12:53:06 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 i12-20020ac2522c000000b004fa52552c82sm1224452lfl.155.2023.07.13.12.53.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 12:53:05 -0700 (PDT)
Message-ID: <bf9439f1-4ae6-78db-95cb-b8cad84ff0ab@linaro.org>
Date: Thu, 13 Jul 2023 22:53:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/msm/adreno: Fix snapshot BINDLESS_DATA size
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230711175409.157800-1-robdclark@gmail.com>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230711175409.157800-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/07/2023 20:54, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The incorrect size was causing "CP | AHB bus error" when snapshotting
> the GPU state on a6xx gen4 (a660 family).
> 
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/26
> Signed-off-by: Rob Clark <robdclark@chromium.org>

What about:

Fixes: 1707add81551 ("drm/msm/a6xx: Add a6xx gpu state")

?

> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
> index 790f55e24533..e788ed72eb0d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
> @@ -206,7 +206,7 @@ static const struct a6xx_shader_block {
>   	SHADER(A6XX_SP_LB_3_DATA, 0x800),
>   	SHADER(A6XX_SP_LB_4_DATA, 0x800),
>   	SHADER(A6XX_SP_LB_5_DATA, 0x200),
> -	SHADER(A6XX_SP_CB_BINDLESS_DATA, 0x2000),
> +	SHADER(A6XX_SP_CB_BINDLESS_DATA, 0x800),
>   	SHADER(A6XX_SP_CB_LEGACY_DATA, 0x280),
>   	SHADER(A6XX_SP_UAV_DATA, 0x80),
>   	SHADER(A6XX_SP_INST_TAG, 0x80),

-- 
With best wishes
Dmitry

