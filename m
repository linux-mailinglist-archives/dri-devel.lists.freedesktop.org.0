Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8949299B4
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jul 2024 22:38:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD1E10E104;
	Sun,  7 Jul 2024 20:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xuh2dO9d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BCD710E069;
 Sun,  7 Jul 2024 20:38:19 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 46e09a7af769-7036b87752dso274444a34.2; 
 Sun, 07 Jul 2024 13:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720384698; x=1720989498; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+2NFmiLefKPK0Ol9z4KLx/URk/l4sdVApVH5mGNGYUM=;
 b=Xuh2dO9dsaOWiiDPRvpLAcDfnZ8NvG0dm6PxaW07+0OFbzy6+5qyiT7wMWBI5eOFEf
 V9rjsaRH4U7ZHIeUt6RQlV8hpKBgtr8PFNDFz99vKFWdIvkTSWm+iPkxsn0MTnPMTVkc
 9KgwEbIjw8U1dYGOe3uk5dPW2/9EAlkWLs3Fv0JaWoJq8chKRDuBQCXfXUlJqjW3Dw/5
 PSfEZ7ApABiyoUCeVkzWhSeQk5vcwkTDcNvDqmkTNNPhEyJcaeZ+fPC/ixrXCDOLCU0Q
 9o+5w8Qvm+Hgd2tZHYYZtJr098bWl5qm+K+NuQOK2qNQj5IbT+h52OGEPGRH0OvgdJvM
 7uXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720384698; x=1720989498;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+2NFmiLefKPK0Ol9z4KLx/URk/l4sdVApVH5mGNGYUM=;
 b=v1saWPRVmfTt/z6ucmZmaEFHKU6i5adZl4rE4LAH/elp0EaZ+DmJHFBTQQkyUreYTV
 GaAQrc9S8h8ux5Cxvx5q84nD9qDYPxp7Tc0csNhKO4VX1gHOaIjo9e2f6xTeobC+c7si
 oMwVcmDm0/WIbwT3Dp10IDfNR3MT3FzGXPhdlS7WiFy0FxLm9I0Irhvk9uYngYcB1nlg
 1I2MY2Vvz9Jx7BKxDEQ1y+BrK6BAOqu8lipoA8qk4K75YvtY8i/mrSRp0HHIm8wJ86hM
 OtrpQuSGSWcb8nSNq8E6tlQXWVhtV2lSyCt3zayDokoQex7Znvf3iZyQT7dLJJY1j1LV
 Q7Hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyCH9redQUAyR/bhnA776v55Jc8zEGPNHn/uUFpF+dR7PEGyZKWc3bL+0sgofQNGX1l4g4CyWoY8qFs0e59YXGw62v5tbJee8qCCP2haY4
X-Gm-Message-State: AOJu0Yyfn3q5qZhuOLSq1o12Qe7sF5mzCT5otl0Mc6N2A3tY5NfZhe6E
 BYFl4pL9O3MoKrob8HLAj0ayEoedpbMxjxQUeuciRPG6PouKmcxqE2LIrpvh7OvK7FAe2V4QJbh
 9C9l1pm0orQQoH/RLeWhgr9wAFZ6FlZhj
X-Google-Smtp-Source: AGHT+IHFHGyReqLbjIjhDRcVY/iGGoglrdehiknryamc+kGbgFBSzhvJagqvib04LgYBnkJP0Q2Hwy7huXvcIpBXr9w=
X-Received: by 2002:a05:6358:71f:b0:1aa:c73d:5a92 with SMTP id
 e5c5f4694b2df-1aac73d5cc8mr222300355d.2.1720384698385; Sun, 07 Jul 2024
 13:38:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240705200013.2656275-1-l.stach@pengutronix.de>
In-Reply-To: <20240705200013.2656275-1-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Sun, 7 Jul 2024 22:38:06 +0200
Message-ID: <CAH9NwWcK3aSL+7+zL=6K9+fFVkQBA4K_AQP9EFoMmFBYmS_LTA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] drm/etnaviv: hold GPU lock across perfmon sampling
To: Lucas Stach <l.stach@pengutronix.de>
Cc: etnaviv@lists.freedesktop.org, 
 Russell King <linux+etnaviv@armlinux.org.uk>, dri-devel@lists.freedesktop.org, 
 kernel@pengutronix.de, patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
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

>
> The perfmon sampling mutates shared GPU state (e.g. VIVS_HI_CLOCK_CONTROL
> to select the pipe for the perf counter reads). To avoid clashing with
> other functions mutating the same state (e.g. etnaviv_gpu_update_clock)
> the perfmon sampling needs to hold the GPU lock.
>
> Fixes: 68dc0b295dcb ("drm/etnaviv: use 'sync points' for performance monitor requests")
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
> v2: new patch
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index 7c7f97793ddd..2bd14d3501e2 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -1330,6 +1330,8 @@ static void sync_point_perfmon_sample_pre(struct etnaviv_gpu *gpu,
>  {
>         u32 val;
>
> +       mutex_lock(&gpu->lock);
> +
>         /* disable clock gating */
>         val = gpu_read_power(gpu, VIVS_PM_POWER_CONTROLS);
>         val &= ~VIVS_PM_POWER_CONTROLS_ENABLE_MODULE_CLOCK_GATING;
> @@ -1341,6 +1343,8 @@ static void sync_point_perfmon_sample_pre(struct etnaviv_gpu *gpu,
>         gpu_write(gpu, VIVS_HI_CLOCK_CONTROL, val);
>
>         sync_point_perfmon_sample(gpu, event, ETNA_PM_PROCESS_PRE);
> +
> +       mutex_unlock(&gpu->lock);
>  }
>
>  static void sync_point_perfmon_sample_post(struct etnaviv_gpu *gpu,
> @@ -1350,13 +1354,9 @@ static void sync_point_perfmon_sample_post(struct etnaviv_gpu *gpu,
>         unsigned int i;
>         u32 val;
>
> -       sync_point_perfmon_sample(gpu, event, ETNA_PM_PROCESS_POST);
> -
> -       for (i = 0; i < submit->nr_pmrs; i++) {
> -               const struct etnaviv_perfmon_request *pmr = submit->pmrs + i;
> +       mutex_lock(&gpu->lock);
>
> -               *pmr->bo_vma = pmr->sequence;
> -       }
> +       sync_point_perfmon_sample(gpu, event, ETNA_PM_PROCESS_POST);
>
>         /* disable debug register */
>         val = gpu_read(gpu, VIVS_HI_CLOCK_CONTROL);
> @@ -1367,6 +1367,14 @@ static void sync_point_perfmon_sample_post(struct etnaviv_gpu *gpu,
>         val = gpu_read_power(gpu, VIVS_PM_POWER_CONTROLS);
>         val |= VIVS_PM_POWER_CONTROLS_ENABLE_MODULE_CLOCK_GATING;
>         gpu_write_power(gpu, VIVS_PM_POWER_CONTROLS, val);
> +
> +       mutex_unlock(&gpu->lock);
> +
> +       for (i = 0; i < submit->nr_pmrs; i++) {
> +               const struct etnaviv_perfmon_request *pmr = submit->pmrs + i;
> +
> +               *pmr->bo_vma = pmr->sequence;
> +       }

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
