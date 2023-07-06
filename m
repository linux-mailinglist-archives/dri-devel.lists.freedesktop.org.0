Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 779B474A785
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 01:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E28A10E117;
	Thu,  6 Jul 2023 23:21:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E03010E043
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 23:21:17 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2b63e5f94f1so15801271fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 16:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688685675; x=1691277675;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eHrUtEEGgILOI5mEdHCSitrHO24/cMaqcjfdzWxD7p8=;
 b=uC35L9ExDc/bK4YEsE0j6nLInTvfijmxi6LKAa03/t2dpuxisZJinaePDDy7/a6Oau
 zQrG5rZ6Infda2CgCuLnQrYOIIaG+IEC7fVhLNmXvTciG2Rbo50/n9kOV54D/Ubg8DSp
 IdM+vvJuy9ePGwyFUAUbyg1AOQD6pKMpjspigPFUUaaPo+xq7+1+1DvYCS7zjMHjlJZf
 2ABTeMATs+BFqMfS7gHazfsGByaUomAi67vL+sou5nYZvvWyCZBUH0s7GPK1vplBLw3v
 oxMz27FaKVFvJwqI3fFjWwF0A5DK8/e+v0SoC/9otdQ03EHn5PgDwjE8uDStxWZVFK1T
 L3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688685675; x=1691277675;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eHrUtEEGgILOI5mEdHCSitrHO24/cMaqcjfdzWxD7p8=;
 b=D3neG7NmDQuTtmJaJU1M6etwPS9CCeYQLZpEzDsgfIw5JfoF1ZDgE4powm8uE6n/GK
 dzU6i0SakacyiBGLz4XiUA6JduHHkfSe3zZj+Ak8MFbNyEvpwsMkG+2QCA31ju71N8i+
 Mugo4z2+pX/evVDHxsHUw5mYJsE3Vn6z6vbtFxnI+NCJAfUTa2dhi35ALrXoTd2OSh6k
 FvuF+eJHTKcZ3NUva2XH5K7adPny7kdLgM8VKseeMrvksSsGDj4ojBisRAQqRlKQq/x2
 1srvM/OGheE215vzEj+oFmPx867u9UDa2Fx8gTgM6qCHfw7aB9myqSJ8jpH7lnE59yRO
 r0IQ==
X-Gm-Message-State: ABy/qLbD4l4cJQ+0MZXrtv/Z4TJS7XePd8dcOEv++nL+/HpdFiEx7tcN
 7Z419YXzHNQt6B8b51/U0X8VQGrB4bFc22G9KhGQEw==
X-Google-Smtp-Source: APBJJlFmzQz27h2D7FyX9IHdloaS8l7VIZn38s/RUHOkPzmFAtI2iw3LtCjKZOq0CXmkWh9nvxOgsg==
X-Received: by 2002:a2e:990b:0:b0:2b4:6a06:4c26 with SMTP id
 v11-20020a2e990b000000b002b46a064c26mr1356525lji.2.1688685675139; 
 Thu, 06 Jul 2023 16:21:15 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a05651c020b00b002b6e7f3a3eesm500778ljn.62.2023.07.06.16.21.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 16:21:14 -0700 (PDT)
Message-ID: <c5246b95-ab88-d99e-f099-18c0ea1ab712@linaro.org>
Date: Fri, 7 Jul 2023 01:21:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 01/12] drm/msm/adreno: Remove GPU name
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-2-robdclark@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230706211045.204925-2-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6.07.2023 23:10, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> No real need to have marketing names in the kernel.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

[...]

> -	gpu_name = adreno_gpu->info->name;
> -	if (!gpu_name) {
> -		gpu_name = devm_kasprintf(dev, GFP_KERNEL, "%d.%d.%d.%d",
> -				rev->core, rev->major, rev->minor,
> -				rev->patchid);
> -		if (!gpu_name)
> -			return -ENOMEM;
> -	}
> +	gpu_name = devm_kasprintf(dev, GFP_KERNEL, "%d.%d.%d.%d",
> +			rev->core, rev->major, rev->minor,
> +			rev->patchid);
nit: great opportunity to align indentation with the opening brace

Konrad
> +	if (!gpu_name)
> +		return -ENOMEM;
>  
>  	adreno_gpu_config.ioname = "kgsl_3d0_reg_memory";
>  
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index cf45007400c8..6830c3776c2d 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -61,7 +61,6 @@ extern const struct adreno_reglist a660_hwcg[], a690_hwcg[];
>  struct adreno_info {
>  	struct adreno_rev rev;
>  	uint32_t revn;
> -	const char *name;
>  	const char *fw[ADRENO_FW_MAX];
>  	uint32_t gmem;
>  	u64 quirks;
