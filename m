Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5782DC82A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 22:14:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48158897FF;
	Wed, 16 Dec 2020 21:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D123C897FF
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 21:14:07 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id y17so24507811wrr.10
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 13:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Iof78fr4H6xrISiB7H3iE1irWcuQNyqLfHfSHGkX3YQ=;
 b=V6NpJttyxDUfPF0vBvamHYkbanydw/lvksoVAWUsOSrtmPd6Eo547bM786OxRF0Tte
 6rLGNfzoE39dsvCAdhVAoD8wpfpZ8RADIeWuMU2bB0qPPOP8EsDM3XH0656zYN2ZfTYQ
 Z6UlErtODYCuDQgtnxUVKSZ7WTyGRe9sDoMDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Iof78fr4H6xrISiB7H3iE1irWcuQNyqLfHfSHGkX3YQ=;
 b=Tf4YRicgfp6PEUlYUeMdX4oK83QopDPTJQREg9Db2+Yo37QR6cHm9vNxXOgN66SiLy
 VCvnd6UaSyqUpwUQoBE9c65EVLI+Z090mm0m96B04jqgwxcwZmomPeUTiC93p7xj4SZ0
 ZSnYzlHCgC470hUrjeHkJck3LXUOrvcP1oSttyzCmtoaz6LQe250/8Se+vHcyPq96V+j
 gfvID6v6yic621lVHgwadN6IjP+yoFxwT7WE4gVlDlr8sXWkLSG9djc3fglZNpqwp2zN
 r/eqRlfqA50i0/6+vQhxgnaW1giiRWEHsfefdjo3F1qznJblPa0l7VzxatDCvR6nD1k4
 N3Lw==
X-Gm-Message-State: AOAM5312+SVu+PnoVO8bFGpHKivOAc6Rt2Dije/g+6hfO+lkasfxeCma
 3B6TRB6MQUtal9Z6wNMMXsZfVc51iLZ1OA==
X-Google-Smtp-Source: ABdhPJz6VA9dUrVEag2kQJkuRocxZeO7LXgEgz2BRUXA2I3VBQ2EQKwSdOuqhHOhKxRGoLGT14W6oA==
X-Received: by 2002:adf:828b:: with SMTP id 11mr625965wrc.180.1608153246580;
 Wed, 16 Dec 2020 13:14:06 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l7sm4744368wme.4.2020.12.16.13.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 13:14:05 -0800 (PST)
Date: Wed, 16 Dec 2020 22:14:03 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 4/8] drm/doc: move color management functions under CRTC
 section
Message-ID: <X9p4m6ZKGK4y3EqH@phenom.ffwll.local>
References: <20201216202222.48146-1-contact@emersion.fr>
 <20201216202222.48146-5-contact@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201216202222.48146-5-contact@emersion.fr>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 16, 2020 at 09:22:18PM +0100, Simon Ser wrote:
> Move drm_color_mgmt function reference from the KMS properties
> section to the CRTC abstraction section. This makes the KMS
> properties section more readable for user-space developers.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>

For patches 1-4: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  Documentation/gpu/drm-kms.rst | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> index e6329e7e638e..2f3efb63e5ba 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -319,6 +319,15 @@ CRTC Functions Reference
>  .. kernel-doc:: drivers/gpu/drm/drm_crtc.c
>     :export:
>  
> +Color Management Functions Reference
> +------------------------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_color_mgmt.c
> +   :export:
> +
> +.. kernel-doc:: include/drm/drm_color_mgmt.h
> +   :internal:
> +
>  Frame Buffer Abstraction
>  ========================
>  
> @@ -499,12 +508,6 @@ Color Management Properties
>  .. kernel-doc:: drivers/gpu/drm/drm_color_mgmt.c
>     :doc: overview
>  
> -.. kernel-doc:: drivers/gpu/drm/drm_color_mgmt.c
> -   :export:
> -
> -.. kernel-doc:: include/drm/drm_color_mgmt.h
> -   :internal:
> -
>  Tile Group Property
>  -------------------
>  
> -- 
> 2.29.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
