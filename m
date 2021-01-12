Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1417E2F2A2A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 09:43:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FAB06E12D;
	Tue, 12 Jan 2021 08:43:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 211016E12D
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 08:43:20 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id g8so1144727wme.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 00:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lg4GRq0ALQMIXzii3B026GylshEy17+aGFU65tmMgRY=;
 b=WXrvv416JSzlLsl8FMpKXQM5dKMYMsK93rAkr8IbJG3TmwZ7G38m7npZ3enA+uBcPn
 Ia/BKAJ4sEvZjw+Dz834miHv2CgLO6sR5NVznn8tZPQbOh4CSlC0vqYGW6KkYBeARfwu
 JGSJkgCUNKlwG80LBTtvocZR37/tuAUJc8xos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lg4GRq0ALQMIXzii3B026GylshEy17+aGFU65tmMgRY=;
 b=EFnV6xlcEJqN9hpgMIgNVjW8pbCDtxhWxBoAWAYQsGThROTbPYVGl1ZDigtDyy2D+J
 EomTRWhq6KAp4y26i419QfObyunCoAyh4J5rHc9Q2mtQ4hgBKYpkg3ProuWg7Df+fc60
 nc5BSjq4kQjuQ3y8URRaDc7K0aNEaPlKXs13hKPdRPBYnWwA8sTHDIepfVd7zxYy1UB0
 /EBC+bXfSgqJzxQ3qsGELDFdtEiJfYZW5Jm4UiyNlNKiy000w3k5iQIh1WoEkjZDtZKJ
 bi3MxcKPpLcfs4EpjxkYCrv0itEOeRHblEjDDGnOR5MiOHRrWq+LrDNzwm8BCkl64hii
 lTIA==
X-Gm-Message-State: AOAM531kLETjc9Mxcb3jO+9nacxbNNaZL0ZwBCfU/KOZyYwACBRFM0BS
 Q7JzcC1H3l7HQPSR24XvXobFuA==
X-Google-Smtp-Source: ABdhPJy7ljx3eYJu7V8hv47w0H/6rZqf73UhZezGvb8YxGBrIusx7End43H4VB2W+2z545922Q08vQ==
X-Received: by 2002:a1c:b4c4:: with SMTP id d187mr2434714wmf.38.1610440998872; 
 Tue, 12 Jan 2021 00:43:18 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 14sm2729906wmk.37.2021.01.12.00.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 00:43:18 -0800 (PST)
Date: Tue, 12 Jan 2021 09:43:16 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [PATCH] drm: arc: Use simple encoder
Message-ID: <X/1hJDwd79fg74s4@phenom.ffwll.local>
References: <1610417411-29661-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1610417411-29661-1-git-send-email-tiantao6@hisilicon.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: airlied@linux.ie, abrodkin@synopsys.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 12, 2021 at 10:10:11AM +0800, Tian Tao wrote:
> The arc driver uses empty implementations for its encoders. Replace
> the code with the generic simple encoder.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

I have an entire patch series to convert arc over to simple display pipe.
It's not seen much action (I sent it out in Sept last year), I'll send it
out again and cc: you.
-Daniel

> ---
>  drivers/gpu/drm/arc/arcpgu_hdmi.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arc/arcpgu_hdmi.c b/drivers/gpu/drm/arc/arcpgu_hdmi.c
> index 5283993..71ef75f 100644
> --- a/drivers/gpu/drm/arc/arcpgu_hdmi.c
> +++ b/drivers/gpu/drm/arc/arcpgu_hdmi.c
> @@ -9,13 +9,10 @@
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_device.h>
> +#include <drm/drm_simple_kms_helper.h>
>  
>  #include "arcpgu.h"
>  
> -static struct drm_encoder_funcs arcpgu_drm_encoder_funcs = {
> -	.destroy = drm_encoder_cleanup,
> -};
> -
>  int arcpgu_drm_hdmi_init(struct drm_device *drm, struct device_node *np)
>  {
>  	struct drm_encoder *encoder;
> @@ -34,8 +31,7 @@ int arcpgu_drm_hdmi_init(struct drm_device *drm, struct device_node *np)
>  
>  	encoder->possible_crtcs = 1;
>  	encoder->possible_clones = 0;
> -	ret = drm_encoder_init(drm, encoder, &arcpgu_drm_encoder_funcs,
> -			       DRM_MODE_ENCODER_TMDS, NULL);
> +	ret = drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
>  	if (ret)
>  		return ret;
>  
> -- 
> 2.7.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
