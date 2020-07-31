Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E25C5234388
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 11:46:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA5AF6EA4F;
	Fri, 31 Jul 2020 09:46:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 245F06EA4F
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 09:46:18 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id x5so8032002wmi.2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 02:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pTPgNb9U56vW2jAt7jmmZulhO3rUb6whGtqE3zx3i/s=;
 b=CdhA1dBxWkFqWXLf1zI0JkIb+OHQYtUe9dnsE2GJtYFSx+CKIZhPGnTgohnmzSeUlJ
 F0U4cPTvI0FR6aXSaiBObeOate6qyo7XlkY4l3I4u3LNjqkVpBUeRilpr8W2ISSEcS8M
 9qoQeuBVenoqpMMFb7kqFO1QSGpiqi7bb2YnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pTPgNb9U56vW2jAt7jmmZulhO3rUb6whGtqE3zx3i/s=;
 b=EtWtfOQi0Am/fxxd/8JWYe/D5Fh/42UCzBLZnoFfG5CkCeavfFoecwfcDQZ5ZSxRA3
 QoCyS69xeQFKnnaLCNxwlTeCpROKpotDzFjmI+41pnVGjvFvP7ViZ5JXLyfDDtVINyJy
 5GNnzFr9li8eB5FtpqAr8SnEcXDnS3tdcPGa3DBFcIkbojXam8ELzJDbaQpeBkrVm52Z
 UPMu6Ew97gmx7CFKShjzO9UoubflTzcRU8LDE0ohFubakFmIq9qxKScP0KUbCka5UpRn
 yiiB3vUY+ZOgEerB6fQSm6NDLzQIRXRmNE0ktktJnstIumJZ97HIfqr44f8jwD1X+JCc
 1M8w==
X-Gm-Message-State: AOAM532pw2yB46dtW4Fsy/fyeajDkXxF4sVuDY4C0+bkmrZ1QP9d5U6v
 wv9Q7Q9SMLtNcVVa3IvWhEq2rA==
X-Google-Smtp-Source: ABdhPJz0U1a0awJv53c45Io1Est+Ai4FuRjmh2+NR7E9B3WV1XMVoZBZ4b7SU6x4QSe6TLI0+jCfOQ==
X-Received: by 2002:a05:600c:2215:: with SMTP id
 z21mr3309937wml.159.1596188776761; 
 Fri, 31 Jul 2020 02:46:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s19sm15061964wrb.54.2020.07.31.02.46.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 02:46:16 -0700 (PDT)
Date: Fri, 31 Jul 2020 11:46:14 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 34/49] drm/ttm: make manager debug function optional
Message-ID: <20200731094614.GA6419@phenom.ffwll.local>
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-35-airlied@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200731040520.3701599-35-airlied@gmail.com>
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
Cc: kraxel@redhat.com, sroland@vmware.com, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 31, 2020 at 02:05:05PM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 92de8a6d7647..1e8fda1c9b3a 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -88,7 +88,7 @@ static void ttm_mem_type_debug(struct ttm_bo_device *bdev, struct drm_printer *p
>  	drm_printf(p, "    size: %llu\n", man->size);
>  	drm_printf(p, "    available_caching: 0x%08X\n", man->available_caching);
>  	drm_printf(p, "    default_caching: 0x%08X\n", man->default_caching);
> -	if (mem_type != TTM_PL_SYSTEM)
> +	if (mem_type != TTM_PL_SYSTEM && man->func->debug)
>  		(*man->func->debug)(man, p);
>  }

Bit a bikeshed, but what about exporting this function (maybe with the man
as argument, not the bdev, mem_type pair) and using it in the first 2
patches? Avoids surprises with optional func->debug.
-Daniel

>  
> -- 
> 2.26.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
