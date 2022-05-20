Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E83D52ECE9
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 15:14:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A638B10E929;
	Fri, 20 May 2022 13:14:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C2710E972;
 Fri, 20 May 2022 13:14:14 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id t144so6653490oie.7;
 Fri, 20 May 2022 06:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=J1TqYWvInWBNVGCPH/z2pZbWfdCQqeAMqP1BbNQTqhs=;
 b=dJTZzvLoQ/LOjQgXGJKHVj1eCw3vf2YVGrT7mIWG8OX78B1yXTJTcbxbjNz/NWlMGr
 YdI+WV2E3uR/ibEb/SgCUGfY6Mqj5g5X6/nXAFEd9SkKwYSuspKOAV49eIL7uC5BfrFD
 GlxOAy2821DPIsTeIKzTZNvb5Z2Lvf9vp4U6K0bdNC7rMgBLD+u33XM4GJkgHCM4o+pb
 pN+vPywZ1Jv25E50VjhVVSZDlg9NP5CGMQDliA8HWxZ/EO1VN0mmgeJQUZdKzXSmrhwV
 QzngA/A4HJbjNmeVlRrnJx2pBMEJ9pjn5V8yMDNN6DTXpBJGONru6kP7wlLfHlEJbkbs
 3Yzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=J1TqYWvInWBNVGCPH/z2pZbWfdCQqeAMqP1BbNQTqhs=;
 b=1jktSKVzLrvIRGQIk0K/p4Ga6gGwiITu/0XhCJq7fHxHUpnv4SbzHaY8eYeCmh8LSx
 I5ZJs5cZxGABy7/WowzZK5VEMIiiWoMtlCPlX4VrX8t0O/B1ggQ8puAj9Z4bpDVSpMhW
 J/gHp1C9e7BOF4dUvi87wKAoLhwr+TUwn4T28ObIf0yUwdOTkY+XfvFMcFQzd2bt/hF1
 nPV59phk5kkl/QN9LcUruo++LFMF6P5qzPsuDvArhm4Hms5EVr7zu4sjTXFcHcB+7NdN
 DkLplVK/Tp1DgKJtK19JHczoR1v1RZCCrfK7yzcRxUVFxNgyo4wv18a6Hr4UFXdUnW5p
 xbTA==
X-Gm-Message-State: AOAM533n2nTrZihkAlFDJPzqwZARY79RJjwQSeRCr73+yHmxPcTKqDm1
 jF0SzGv2sitv9Q1CMqEqTDg=
X-Google-Smtp-Source: ABdhPJzU22VIvkGyaVF3avLKa6ozH9kxgKgJqekRfWSD7N6WH8eRCArP/5ENzxPQFqJwygJBvySwOg==
X-Received: by 2002:a05:6808:1308:b0:326:8e54:e93f with SMTP id
 y8-20020a056808130800b003268e54e93fmr5436156oiv.274.1653052453675; 
 Fri, 20 May 2022 06:14:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 eq37-20020a056870a92500b000e686d13883sm959266oab.29.2022.05.20.06.14.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 May 2022 06:14:11 -0700 (PDT)
Message-ID: <f262df9e-ae89-f961-8b5e-1f4166eb1470@roeck-us.net>
Date: Fri, 20 May 2022 06:14:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] drm/msm/adreno: Do not propagate void return values
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <483795c4fb7d215a3f2089c55df29a0064eb021b.1653051029.git.geert@linux-m68k.org>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <483795c4fb7d215a3f2089c55df29a0064eb021b.1653051029.git.geert@linux-m68k.org>
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

On 5/20/22 05:53, Geert Uytterhoeven wrote:
> With sparse ("make C=2"), lots of
> 
>    error: return expression in void function
> 
> messages are seen.
> 
> Fix this by removing the return statements to propagate void return
> values.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 2 +-
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.h | 4 ++--
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
>   3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 3e325e2a2b1b68eb..d137136d93f3b4ca 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -504,7 +504,7 @@ static void a6xx_rpmh_stop(struct a6xx_gmu *gmu)
>   
>   static inline void pdc_write(void __iomem *ptr, u32 offset, u32 value)
>   {
> -	return msm_writel(value, ptr + (offset << 2));
> +	msm_writel(value, ptr + (offset << 2));
>   }
>   
>   static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> index 84bd516f01e895b2..e034935b3986f9f2 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> @@ -98,7 +98,7 @@ static inline u32 gmu_read(struct a6xx_gmu *gmu, u32 offset)
>   
>   static inline void gmu_write(struct a6xx_gmu *gmu, u32 offset, u32 value)
>   {
> -	return msm_writel(value, gmu->mmio + (offset << 2));
> +	msm_writel(value, gmu->mmio + (offset << 2));
>   }
>   
>   static inline void
> @@ -138,7 +138,7 @@ static inline u32 gmu_read_rscc(struct a6xx_gmu *gmu, u32 offset)
>   
>   static inline void gmu_write_rscc(struct a6xx_gmu *gmu, u32 offset, u32 value)
>   {
> -	return msm_writel(value, gmu->rscc + (offset << 2));
> +	msm_writel(value, gmu->rscc + (offset << 2));
>   }
>   
>   #define gmu_poll_timeout_rscc(gmu, addr, val, cond, interval, timeout) \
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index ccc4fcf7a630f49a..d671b75f3289fdff 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1446,7 +1446,7 @@ static void a6xx_llc_rmw(struct a6xx_gpu *a6xx_gpu, u32 reg, u32 mask, u32 or)
>   
>   static void a6xx_llc_write(struct a6xx_gpu *a6xx_gpu, u32 reg, u32 value)
>   {
> -	return msm_writel(value, a6xx_gpu->llc_mmio + (reg << 2));
> +	msm_writel(value, a6xx_gpu->llc_mmio + (reg << 2));
>   }
>   
>   static void a6xx_llc_deactivate(struct a6xx_gpu *a6xx_gpu)

