Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A5474A7BE
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 01:32:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A72B10E4CD;
	Thu,  6 Jul 2023 23:32:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B8F10E4CD
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 23:32:08 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b708e49059so15789891fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 16:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688686326; x=1691278326;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uLEn00WjY5SCU/C4roxqJOMF3uwUL1rC1B9xNegkLOU=;
 b=bCpGonx5BTbCepDpBDMncKNP/fcIxYSNNaRqCSgg/F3dEj0cPngjuPwuSIk8AjPbBQ
 vJ/KH8WmIY02VIxdNsObaZO8E/ecy7UvpIfuCt2tRLWCgIhAJrGOgCcEQbMDzTt8IIJ5
 mpeZ4S6QtrnL6NLC1icpJQVduoOyR9c0iTls/GC+BHwKS1pmlw/uYNysSTHJ5VhAhAQv
 St9KrVX+krik1BbRFd1R388ZnLiSDHP9FzKgE8hHMVidQ+BMUq0HDs8+S5P6hnSBop4C
 SCKhKOdg7T66ZnnO6OH6Mx5etCqpTOcPDqvC4Fu59feCVt4QkibP/VP77S79olJMpxEq
 df0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688686326; x=1691278326;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uLEn00WjY5SCU/C4roxqJOMF3uwUL1rC1B9xNegkLOU=;
 b=dLaGZgZC3vuR8K+nqi/8huY//Wq5tRys2gtfHGkStFC/Xj7ZsEWk+4ITdPqr8JjtYe
 CokVA5JTx1F9Xpo9ayr8y7gSlo95ac/jyWSJnF9iEahuFLElzej9inip5ZAb0uek2ec1
 YVOMUhIMvmrgE0eGOVRC8eUyUaY9m+aT5EYqToF9RNR9YD1xviXbUhnn2ksbWWRk4n9+
 wWSfUqkh5cfw23kDq9T17ry5/oTFoKkO2PyZsCNfBHQU6R6+q+c5YyD+ZSp6CNxTCeQA
 gn3chq15fuzTya+a4fSuEn93roZ+PcEsfQ8Uh6W91UHLQePNpaOhvK+h2yVydOzRjmw0
 h4kw==
X-Gm-Message-State: ABy/qLYlzWjhP1NQFBbH37vuaBTOjSSVs1TD2wcgptBKlsxpLWnVsftc
 FhMEiG4eK5GX060Sf4FJDLvI9g==
X-Google-Smtp-Source: APBJJlGUGUf8XRPOOiTI7USN+4Y91eh0YruUHFRMK1sxztIL/clbcXUX/TqDswycYXLDX9uM6MORUg==
X-Received: by 2002:a2e:98c7:0:b0:2b6:9909:79cb with SMTP id
 s7-20020a2e98c7000000b002b6990979cbmr2665488ljj.42.1688686326343; 
 Thu, 06 Jul 2023 16:32:06 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a2eb043000000b002b6da1b49c6sm520279ljl.52.2023.07.06.16.32.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 16:32:06 -0700 (PDT)
Message-ID: <dcb7f183-be73-2239-1051-47b0cd431602@linaro.org>
Date: Fri, 7 Jul 2023 01:32:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 08/12] drm/msm/adreno: Bring the a630 family together
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-9-robdclark@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230706211045.204925-9-robdclark@gmail.com>
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
> All of these are derivatives of a630.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c   | 2 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 7 ++++---
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 5deb79924897..f1bb20574018 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1617,7 +1617,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  			SZ_256K - SZ_16K, 0x44000, "dcache");
>  		if (ret)
>  			goto err_memory;
> -	} else if (adreno_is_a630(adreno_gpu) || adreno_is_a615_family(adreno_gpu)) {
> +	} else if (adreno_is_a630_family(adreno_gpu)) {
>  		/* HFI v1, has sptprac */
>  		gmu->legacy = true;
>  
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 994ac26ce731..6066cfaaea52 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -335,10 +335,11 @@ static inline int adreno_is_a690(const struct adreno_gpu *gpu)
>  	/* The order of args is important here to handle ANY_ID correctly */
>  	return adreno_cmp_rev(ADRENO_REV(6, 9, 0, ANY_ID), gpu->rev);
>  };
> -/* check for a615, a616, a618, a619 or any derivatives */
> -static inline int adreno_is_a615_family(const struct adreno_gpu *gpu)
> +/* check for a615, a616, a618, a619 or any a630 derivatives */
> +static inline int adreno_is_a630_family(const struct adreno_gpu *gpu)
>  {
> -	return adreno_is_revn(gpu, 615) ||
> +	return adreno_is_revn(gpu, 630) ||
> +		adreno_is_revn(gpu, 615) ||
>  		adreno_is_revn(gpu, 616) ||
>  		adreno_is_revn(gpu, 618) ||
>  		adreno_is_revn(gpu, 619);
