Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CD74BA58F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 17:18:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8716210EB4A;
	Thu, 17 Feb 2022 16:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6828510EF2B
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 16:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645114689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O1XVuLvtwL7hZLBTUfAxv8Zzj8JO9+xErDdAtjMrpgI=;
 b=JxVZRyUH3WNKBkjT3RM7iq6VoVTI2q70ucvertRxr+OvQVrFGNlGGt7nnO/vEgbdgu4BVa
 3rJ1fiRV261NJhaTXnyqKxe8wzjabiQI4KPtrShbInGy3e3MiNwa1G8lCcRvz4/t21nvsK
 zlG9/VF1c7pvEzw+noH+2K1Xza22o7Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-DufINoSWP-qNlwLr_rHrLg-1; Thu, 17 Feb 2022 11:18:08 -0500
X-MC-Unique: DufINoSWP-qNlwLr_rHrLg-1
Received: by mail-wm1-f70.google.com with SMTP id
 a17-20020a05600c069100b0037bb7eb6944so1037884wmn.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 08:18:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=O1XVuLvtwL7hZLBTUfAxv8Zzj8JO9+xErDdAtjMrpgI=;
 b=6KDYYnqcy7ssIgNmMtc+ESR9ieZVmsn8U9sB0f2ga4jhS0GKHGU358nZtOCyZVxTxn
 jc2Lkp76SLSszKaABnni4asvUILIDEY3e9ttXxcRuWSNM5zDzkY18KdAyJWgws78h0WZ
 iWMXz3VT9LSovyUkhD5TdW3fTsd0HQ/qz1Rp1/ZRe1K8t+LWmox9W/Ft5mqvH1exiOAo
 Nk86v3G+H5pJBryJD2XH3V2OGuNPKcFdW4lIcvVDTl/LieTOkXA4Epgb3mltY7T4C9Cp
 y0wDhm5An/V/EM2g/PXk3NqomO1I94jYkMZV1JTUmpKeV/ki2KKWlbCt6vXz9iH6+j8E
 vsFw==
X-Gm-Message-State: AOAM530zb0WlUzVVQqEw4dpQZXSAQ2ptBrL83WBpnSYrMn0s7uvJWiwL
 +4Yi3C2p26nN1D43f4qPSF+L6GACEV39KNtNGno6aWBwgoOA0z6U4RgDZCFPNOiWNKaMaSNb5MZ
 6CDTLMaPZ+5zd7KfidHhmT2Yy04Nz
X-Received: by 2002:adf:f146:0:b0:1e5:37bc:13ff with SMTP id
 y6-20020adff146000000b001e537bc13ffmr2766081wro.387.1645114686835; 
 Thu, 17 Feb 2022 08:18:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwneaS/4VARafRIrvaIrEAgieAfi6KrPu1pVSG87S+GOy7LveizzBsMeGOMKI3ZHEPqv5eQQg==
X-Received: by 2002:adf:f146:0:b0:1e5:37bc:13ff with SMTP id
 y6-20020adff146000000b001e537bc13ffmr2766058wro.387.1645114686611; 
 Thu, 17 Feb 2022 08:18:06 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id p16sm1885023wmq.18.2022.02.17.08.18.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 08:18:06 -0800 (PST)
Message-ID: <e46989fc-ea7d-20d8-c4a2-5efea75cc0cb@redhat.com>
Date: Thu, 17 Feb 2022 17:18:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/vc4: crtc: Fix runtime_pm reference counting
To: Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org
References: <20220203102003.1114673-1-maxime@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220203102003.1114673-1-maxime@cerno.tech>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Maxime,

On 2/3/22 11:20, Maxime Ripard wrote:
> At boot on the BCM2711, if the HDMI controllers are running, the CRTC
> driver will disable itself and its associated HDMI controller to work
> around a hardware bug that would leave some pixels stuck in a FIFO.
> 
> In order to avoid that issue, we need to run some operations in lockstep
> between the CRTC and HDMI controller, and we need to make sure the HDMI
> controller will be powered properly.
> 
> However, since we haven't enabled it through KMS, the runtime_pm state
> is off at this point so we need to make sure the device is powered
> through pm_runtime_resume_and_get, and once the operations are complete,
> we call pm_runtime_put.
> 
> However, the HDMI controller will do that itself in its
> post_crtc_powerdown, which means we'll end up calling pm_runtime_put for
> a single pm_runtime_get, throwing the reference counting off. Let's
> remove the pm_runtime_put call in the CRTC code in order to have the
> proper counting.
> 
> Fixes: bca10db67bda ("drm/vc4: crtc: Make sure the HDMI controller is powered when disabling")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_crtc.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> index 287dbc89ad64..799aaf8c1abf 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -525,9 +525,11 @@ int vc4_crtc_disable_at_boot(struct drm_crtc *crtc)
>  	if (ret)
>  		return ret;
>  
> -	ret = pm_runtime_put(&vc4_hdmi->pdev->dev);
> -	if (ret)
> -		return ret;
> +	/*
> +	 * post_crtc_powerdown will have called pm_runtime_put, so we
> +	 * don't need it here otherwise we'll get the reference counting
> +	 * wrong.
> +	 */
>

I'm not familiar with the BCM2711 SoC nor its HDMI controller but your
commit message clearly explain the issue and is nice to have a comment
here, to avoid someone trying to do a pm_runtime_put() again.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

