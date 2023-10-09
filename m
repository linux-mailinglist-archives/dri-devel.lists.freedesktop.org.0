Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D468D7BD710
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 11:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C25E10E253;
	Mon,  9 Oct 2023 09:30:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE47110E253
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 09:30:52 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5068dab8c00so2537256e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 02:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696843851; x=1697448651; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gmwAEQHUShD13Crz4Xqpp8bdUVorE1C8HPaXCwJ5RJ8=;
 b=QIFjZlVYgnpiQzrpOZplI7GjhCDBUzUhU6n/ngcrkKKlqLhU/R/rmnkDPazHi37ljD
 A7vo5h/s/8MR3jUurAVxEG4trKIhw47MbqixpGBMddOfmN6CAa0xva6FqQIpiwzaJX2z
 mML974DpQt8Mg4F90akT9OkRTLUEF2IuhdmhlITQ/Pb81dkDJFX0dQtxqfH1g7bAk4Sc
 IptfTQpp40U5VA6efObIMBp8YuKUgqSpWBmKq9/95bL6Nbzyv+AB9/V/FmO4iTeGad0Y
 SLp7FuBj1keMjcht96KeCQjRRmXpx2bqcwryU5oh6rmJwTN6tLREWJuwWFuXqGzWsOtR
 M1Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696843851; x=1697448651;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gmwAEQHUShD13Crz4Xqpp8bdUVorE1C8HPaXCwJ5RJ8=;
 b=oDjTOnU/yz5WloToQRfl8CAZDE+qGUX5pA97cl21MsOfrSQbMVYfGxnm0yoaqUYJhk
 Mpn0NufFJGaNFvDP5ucwKXtnmWtS+y83LJr8LVk7PPjU+ar4iU8i147/QrZSUhhHrjnX
 JrpYcPaL98u9Amf47l4pAH/gNPu/tDgtdiIVhshISYiH9NcUvb/F84Sx4CWzOZa+Q3la
 EX8ydniEO6cj4PXYLlhqfkIjvHokLS2v+FjdHKzkKxgjQIE09/GN1JHl6WNT+jNOgZm0
 NuzSZWTzKzwz99psNvmReVz6ynWpPiQjrv/kJJKAw19GoK2QLXTubiskrtcWWGHU9j65
 zNPw==
X-Gm-Message-State: AOJu0YyqfdciA0oYXtsEiHv78le9IEYRQeklIV3VsV5J1Bc0Cnd/4v7K
 /sw7JGNR0QWuw3vmxccgBe7EUkQhKf2mT88NV3ucjQ8Q
X-Google-Smtp-Source: AGHT+IGHTGAuOleZS6uYzYovcWRJPRlE6qvUjsDstd5ZAD/P+o5pTl57ppGEmoWHacjXimQyT7/PjA==
X-Received: by 2002:a05:6512:1245:b0:500:a7c8:1847 with SMTP id
 fb5-20020a056512124500b00500a7c81847mr16170277lfb.66.1696843851098; 
 Mon, 09 Oct 2023 02:30:51 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 h10-20020ac2596a000000b004fe26362d48sm1385178lfp.75.2023.10.09.02.30.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Oct 2023 02:30:50 -0700 (PDT)
Message-ID: <92377509-0f30-46ff-8b37-3b4b6fd53189@linaro.org>
Date: Mon, 9 Oct 2023 12:30:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] drm/ci: export kernel config
Content-Language: en-GB
To: Helen Koike <helen.koike@collabora.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20231009004953.203576-1-helen.koike@collabora.com>
 <20231009004953.203576-8-helen.koike@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231009004953.203576-8-helen.koike@collabora.com>
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
Cc: robdclark@chromium.org, vignesh.raman@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, david.heidelberg@collabora.com,
 quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/10/2023 03:49, Helen Koike wrote:
> Export the resultant kernel config, making it easier to verify if the
> resultant config was correctly generated.
> 
> Suggested-by: Rob Clark <robdclark@chromium.org>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


I'd even say:

Appreciated-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

It will help a lot to debug possible Kconfig changes and/or omissions.

> ---
>   drivers/gpu/drm/ci/build.sh       | 1 +
>   drivers/gpu/drm/ci/image-tags.yml | 2 +-
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
> index 8eec15143bfe..740b5008be2e 100644
> --- a/drivers/gpu/drm/ci/build.sh
> +++ b/drivers/gpu/drm/ci/build.sh
> @@ -148,6 +148,7 @@ mkdir -p artifacts/install/lib
>   mv install/* artifacts/install/.
>   rm -rf artifacts/install/modules
>   ln -s common artifacts/install/ci-common
> +cp .config artifacts/${CI_JOB_NAME}_config
>   
>   for image in ${KERNEL_IMAGE_NAME}; do
>       cp /lava-files/$image artifacts/install/.
> diff --git a/drivers/gpu/drm/ci/image-tags.yml b/drivers/gpu/drm/ci/image-tags.yml
> index df94d8fb348e..3e5cd4e8be24 100644
> --- a/drivers/gpu/drm/ci/image-tags.yml
> +++ b/drivers/gpu/drm/ci/image-tags.yml
> @@ -4,7 +4,7 @@ variables:
>      DEBIAN_BASE_TAG: "${CONTAINER_TAG}"
>   
>      DEBIAN_X86_64_BUILD_IMAGE_PATH: "debian/x86_64_build"
> -   DEBIAN_BUILD_TAG: "2023-10-08-igt"
> +   DEBIAN_BUILD_TAG: "2023-10-08-config"
>   
>      KERNEL_ROOTFS_TAG: "2023-10-06-amd"
>   

-- 
With best wishes
Dmitry

