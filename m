Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6F2418FA3
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 09:01:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B918C6E834;
	Mon, 27 Sep 2021 07:01:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 699146E834;
 Mon, 27 Sep 2021 07:01:22 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id t8so49404874wrq.4;
 Mon, 27 Sep 2021 00:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=zQB26B5eWUnzl+964mpUpFb8aQd6/nGrTcRgYihaeWc=;
 b=hhkZKKfmY6xHACewDTWjOFBz4xjAdw6xepF6ktK90NO/v63YVfo3bclcJjktmyxKd9
 Z/c4igoFBRypdKeRup7kuFoUmC/X1Ve6oHCvfGuhIPEsLfcEPQw33+GPKhEzsaTZc8AB
 FRO4bjD10C8Oh8tk8cVFMIHRCrcV/nFhAVuQJwEXZYxXtzHVZWPwpH6WwM4X58xMxD3G
 ANTPz2NS8tzJLST011L1Ub4nsekD7rgLMNy021dE0rsoWx/yWUahwOlLMkjDzbTjLZyQ
 gg06B5E6Oq2eJ6mqcnpBhkZzaI05ZMPzkrFUOtTv6WPupPyIVVbHmiOWBJUuvTNXTRaP
 2vyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=zQB26B5eWUnzl+964mpUpFb8aQd6/nGrTcRgYihaeWc=;
 b=HjGfuglVhGBd8xEVGHYVO7xC7wJm8G0tgaLiXxxuiVvosuWgMBoJgQ3YO+Cbvo5NNI
 ryzS0PGdsN3IeSyT+YLOdEkvMn4wYFH0/lM82IsfRHJUwmPrWlycl0/H7yIzbL4dl1pB
 O022xFfyje4oL83zxS6pa3wWpOktpHKRIYuwRFO97gjZSXIDDNwR4U3ozrVmMM5wcoJo
 ImUiQpyl91lUyXvEKu8s/PV6A5xLdL86UYhB6fYIBtbfgEacsWkN5J40YwpkqbxcjiEF
 H+1Aj3u/J8WMBHnymq5U5/fGMuHI3cdC3GDCvDfp6w5YqtVyK2OyfeR/7RkbBPQfZgoo
 xAmw==
X-Gm-Message-State: AOAM531oQ+Vh7XKn5Nj/KPCCK3AF3x1QR1Yn2xjLctKmelhKl3tQH+Ku
 Q8s542RFbRawA0AXZ/9HICU=
X-Google-Smtp-Source: ABdhPJyKxcFSxLyjYTbrEPilQCvwXzB/i+kykltwhE6uBKLPaKa7c1AQMv9DtFoICMHeA7Ce1DlXbg==
X-Received: by 2002:a5d:6a08:: with SMTP id m8mr25303052wru.336.1632726080941; 
 Mon, 27 Sep 2021 00:01:20 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id w21sm2167288wmk.15.2021.09.27.00.01.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 00:01:20 -0700 (PDT)
Subject: Re: [PATCH 2/4] drm/msm: allow compile_test on !ARM
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, etnaviv@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Cc: l.stach@pengutronix.de, christian.gmeiner@gmail.com,
 linux+etnaviv@armlinux.org.uk, robdclark@gmail.com, sean@poorly.run
References: <20210924071759.22659-1-christian.koenig@amd.com>
 <20210924071759.22659-2-christian.koenig@amd.com>
Message-ID: <dbf6b324-511e-45d4-3316-f41f076c4f82@gmail.com>
Date: Mon, 27 Sep 2021 09:01:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210924071759.22659-2-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As long as nobody objects I'm going to push this one here to 
drm-misc-next with Rob's rb.

The other patches still need a bit more work, but being able to at least 
compile test MSM on x86 is really helpful.

Christian.

Am 24.09.21 um 09:17 schrieb Christian König:
> MSM is one of the few drivers which won't even compile
> test on !ARM platforms.
>
> Looking into this a bit more it turned out that there is
> actually not that much missing to at least let the driver
> compile on x86 as well.
>
> So this patch replaces the use of phys_to_page() with the
> open coded version and provides a dummy for of_drm_find_bridge().
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/msm/Kconfig   |  4 ++--
>   drivers/gpu/drm/msm/msm_gem.c |  2 +-
>   include/drm/drm_bridge.h      | 10 +++++++++-
>   3 files changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index e9c6af78b1d7..5879f67bc88c 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -3,9 +3,9 @@
>   config DRM_MSM
>   	tristate "MSM DRM"
>   	depends on DRM
> -	depends on ARCH_QCOM || SOC_IMX5 || (ARM && COMPILE_TEST)
> +	depends on ARCH_QCOM || SOC_IMX5 || COMPILE_TEST
>   	depends on IOMMU_SUPPORT
> -	depends on OF && COMMON_CLK
> +	depends on (OF && COMMON_CLK) || COMPILE_TEST
>   	depends on QCOM_OCMEM || QCOM_OCMEM=n
>   	depends on QCOM_LLCC || QCOM_LLCC=n
>   	depends on QCOM_COMMAND_DB || QCOM_COMMAND_DB=n
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 14907622769f..5bd511f07c07 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -85,7 +85,7 @@ static struct page **get_pages_vram(struct drm_gem_object *obj, int npages)
>   
>   	paddr = physaddr(obj);
>   	for (i = 0; i < npages; i++) {
> -		p[i] = phys_to_page(paddr);
> +		p[i] = pfn_to_page(__phys_to_pfn(paddr));
>   		paddr += PAGE_SIZE;
>   	}
>   
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 9cdbd209388e..a445298e1c25 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -790,11 +790,19 @@ drm_priv_to_bridge(struct drm_private_obj *priv)
>   
>   void drm_bridge_add(struct drm_bridge *bridge);
>   void drm_bridge_remove(struct drm_bridge *bridge);
> -struct drm_bridge *of_drm_find_bridge(struct device_node *np);
>   int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
>   		      struct drm_bridge *previous,
>   		      enum drm_bridge_attach_flags flags);
>   
> +#ifdef CONFIG_OF
> +struct drm_bridge *of_drm_find_bridge(struct device_node *np);
> +#else
> +static inline struct drm_bridge *of_drm_find_bridge(struct device_node *np)
> +{
> +	return NULL;
> +}
> +#endif
> +
>   /**
>    * drm_bridge_get_next_bridge() - Get the next bridge in the chain
>    * @bridge: bridge object

