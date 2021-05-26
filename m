Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEBD39188D
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 15:10:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E12476E4DE;
	Wed, 26 May 2021 13:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9269A6E4DE
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 13:10:19 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id lg14so2345878ejb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 06:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=AUsJLuID9e1pol3RiOS0EQTXGuh7p/LFKL5pMET/qdM=;
 b=k8NO22C2JVeN3oYYB8/wYFehRe8VyAND1XHAGRWMTU5Mn52IfMEUo4TKhcziTjSiol
 ajMle9cmfQkn5UtI0zuJQKEg7T0BR53wh8MTYQevUGRY0oLgw8tgB9THtAkw/d71ByPA
 k5CQUTjOSd0eCD/aUy0PznHO9215g4bfZeixU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=AUsJLuID9e1pol3RiOS0EQTXGuh7p/LFKL5pMET/qdM=;
 b=cMzQ/XOw6ZQ6ifq1R9TrtWoJrnqnncLvbApbme5OacgcxyaTN3IuZPjjgRYekDx5V9
 s8yAJEFdN3kjgW6bEL4XmCottttR65Uj/SOe2yhOLVDBe6Efw/BRA88L6cF+wpR5cXWZ
 JLRgjaQibFlgo8AhySexZvPlKrgJ9yX7the0z61TO4fgTdNKn+AWNqZnlvNVNI6rdVWc
 vfMU8DiBGHqwPb87X3R/s9x0H9So34fJQXMXAMIycq3WypSTsGFAP1HRidrMNXu0yT/H
 +uSbdQUUfMGa+4g8PCa3XVOq87/hLKE4nyIjuCaLC4mZry693ASdxa/2MdQxyidbYmR2
 BnVg==
X-Gm-Message-State: AOAM530oHTnhSw7c1IwifIuGiIb3v0hyPnJyZ+CQFH9IxfVeeYbUndby
 6JsFxcg6hlf3B9Vbqhyi75Hvdw==
X-Google-Smtp-Source: ABdhPJwmdkY+oqxRRVXVQLIVhW6ISfuuutzmkODEclidb9s6n/KAGKJYcmP63SeNqDK4yFSFc1wLbQ==
X-Received: by 2002:a17:907:9612:: with SMTP id
 gb18mr7857293ejc.408.1622034618327; 
 Wed, 26 May 2021 06:10:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j17sm484768ejb.123.2021.05.26.06.10.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 06:10:17 -0700 (PDT)
Date: Wed, 26 May 2021 15:10:16 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 30/34] drm/vgem/vgem_drv: Standard comment blocks should
 not use kernel-doc format
Message-ID: <YK5IuNcHtPySAfoz@phenom.ffwll.local>
Mail-Followup-To: Lee Jones <lee.jones@linaro.org>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Adam Jackson <ajax@redhat.com>, Ben Widawsky <ben@bwidawsk.net>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20210526084726.552052-1-lee.jones@linaro.org>
 <20210526084726.552052-31-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210526084726.552052-31-lee.jones@linaro.org>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Ben Widawsky <ben@bwidawsk.net>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 26, 2021 at 09:47:22AM +0100, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/vgem/vgem_drv.c:47: warning: expecting prototype for This is vgem, a (non-hardware(). Prototype was for DRIVER_NAME() instead
> 
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Adam Jackson <ajax@redhat.com>
> Cc: Ben Widawsky <ben@bwidawsk.net>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Merged this one to drm-misc-next, thanks!
-Daniel
> ---
>  drivers/gpu/drm/vgem/vgem_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
> index a0e75f1d5d016..bf38a7e319d14 100644
> --- a/drivers/gpu/drm/vgem/vgem_drv.c
> +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> @@ -25,7 +25,7 @@
>   *	Ben Widawsky <ben@bwidawsk.net>
>   */
>  
> -/**
> +/*
>   * This is vgem, a (non-hardware-backed) GEM service.  This is used by Mesa's
>   * software renderer and the X server for efficient buffer sharing.
>   */
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
