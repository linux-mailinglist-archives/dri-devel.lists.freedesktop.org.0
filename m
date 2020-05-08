Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 587A71CA3D6
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 08:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 775646E1D3;
	Fri,  8 May 2020 06:27:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE876E1D3
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 06:27:53 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id v8so9130705wma.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 23:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YxH8NotlPjqFUBjBoLKhXru8kUZPToI1EA+nXbTIGl4=;
 b=el+K0Jm17sNbIOUC3fd/4VUyp2k/t86NikqLqTUC3mQ4/N6lXkiFi5pLwYwgJnRpL9
 LP9rrykS6X84tSExBAJz7nTRypF7ozgPhKcr19UpIAoW0LsscxZFGk9g++PgfMFLxNIF
 yKo/AKGmwkZ2GRAoAy17c5MC3kyjYLm5k7IM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YxH8NotlPjqFUBjBoLKhXru8kUZPToI1EA+nXbTIGl4=;
 b=C0QCiN/J2G6vH0noRVzYGJGCTr10NtQOZJshEWV/pfifLjsbsEGAOAAN9i/9Gbl4Sh
 RqMByNA/QhfKiynuw7P1Ey8TU+kTwpOfYHfX5Bci9mwDZ57UDyFAr3Sn8DdtIvh1SGre
 gDUA53V6rgjgrsINEgRKXkTKtg0+9qrfoXngXoWr7JTm2H+IWreokTRzEhS2RmCQx8pw
 dx07qEJ1r7b3Cf7R56uKI97hMs5sp+X4zJRiPzC5Prko/ZYI4IPGY/+E0UVWrdZkt0xr
 3f71PunH53/YcgBCjH0qOV/bLjC4hQiE79wz4dtConIA6yUCJ/Q64L5XHwqlbaBeAjjA
 eUAQ==
X-Gm-Message-State: AGi0Pub9YHHytmaD+Nl5/94D6USQfvvm+xYoImJvFC3dKFlIVMb3R84t
 KKABB+9VeJEwcGj4XTb8QH6p7+M/8Uc=
X-Google-Smtp-Source: APiQypLyHrSYrbxN5rvFOPgGzuOtdJHjMT/7WNFbHU0Yz/BAaKRWI/TWorZhmd/hwwwjtAYI8efh1g==
X-Received: by 2002:a1c:e284:: with SMTP id z126mr15097657wmg.32.1588919272061; 
 Thu, 07 May 2020 23:27:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a67sm12353210wmc.30.2020.05.07.23.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 23:27:51 -0700 (PDT)
Date: Fri, 8 May 2020 08:27:49 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 04/36] drm/doc: drop struct_mutex references
Message-ID: <20200508062749.GC10381@phenom.ffwll.local>
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
 <20200507150822.114464-5-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200507150822.114464-5-emil.l.velikov@gmail.com>
X-Operating-System: Linux phenom 5.4.0-4-amd64 
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

On Thu, May 07, 2020 at 04:07:50PM +0100, Emil Velikov wrote:
> From: Emil Velikov <emil.velikov@collabora.com>
> 
> There's little point in providing partial and ancient information about
> the struct_mutex. Some drivers are using it, new ones should not.
> 
> As-it this only provides for confusion.
> 
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>

I think a doc patch to add a big warning for drm_device.struct_mutex would
also be good. The current text is kinda unhelpful.
-Daniel

> ---
>  Documentation/gpu/drm-mm.rst | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index 1839762044be..5ba2ead8f317 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -178,11 +178,8 @@ GEM Objects Lifetime
>  --------------------
>  
>  All GEM objects are reference-counted by the GEM core. References can be
> -acquired and release by calling drm_gem_object_get() and drm_gem_object_put()
> -respectively. The caller must hold the :c:type:`struct drm_device <drm_device>`
> -struct_mutex lock when calling drm_gem_object_get(). As a convenience, GEM
> -provides drm_gem_object_put_unlocked() functions that can be called without
> -holding the lock.
> +acquired and release by calling drm_gem_object_get() and drm_gem_object_put_unlocked()
> +respectively.
>  
>  When the last reference to a GEM object is released the GEM core calls
>  the :c:type:`struct drm_driver <drm_driver>` gem_free_object_unlocked
> -- 
> 2.25.1
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
