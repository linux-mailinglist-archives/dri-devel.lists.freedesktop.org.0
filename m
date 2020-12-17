Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BBD2DD122
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 13:14:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A20C86E33F;
	Thu, 17 Dec 2020 12:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D9516E33F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 12:14:24 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id r7so26373804wrc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 04:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ufSq8CLWO0gzFWhSJs4V+X3mXITz9j+eBQY6mKu/+3s=;
 b=DdwvRzRXwJkgPBrUjxAyg52sUeQviO18YLDv8q2e1aMRmtKgGgFsGV1G6LnMJIqNA5
 wKibV7tyeAWuY/vvw0rjd3kWJesB50z3sFXdsljAx5lUgO46KnFBmq5oW58xH2UvUjAH
 6oTLPJWN6+0B4L3B+1vZrD7dEtPEWbidOcZtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ufSq8CLWO0gzFWhSJs4V+X3mXITz9j+eBQY6mKu/+3s=;
 b=En3BZwATBxsS74mFIOl+peUns9IKbGE22SZTjfaoJXzRZ2Y+6cCXA6Y9gUGEudKCAx
 QKfd7LzWnaLGD2iNEF1FBdKljFKJ4A3d6m5qn1XbtuWpddp16DfPNeOm5Jc08em/mXzi
 EwOQVuG6TARqJUNqEAf5ETKbRRQunONfaREOFJferv/eUzB39qlI+lYLYZvh86j8zjSJ
 M6enmgZ9f5Bi6e+a1onZDA7vFrDkd6MZ6OdopUk8bIXdhV5/3VZpnq55J2YRVqBN4Pbb
 Y+hWTqNf/Jcq+K1HYxSjH3FaG1geEFtP5xsWmQowNbV8VPqrKzbqNqZReGMsyW/n4hRp
 gfbA==
X-Gm-Message-State: AOAM53271I1gRV6WXXeXpWzM/IkYKoj4VgsyYmgWEu0ZXfKuu2gutH+r
 ZCD98UICinYqW0w6q7C/tJVFwA==
X-Google-Smtp-Source: ABdhPJx/RwAcmtW+s0WtUGPVZ2l2rellTIzNYgS67uItqAxoyFYX9ZJZ8ADCQG+a49EBgWjpVapyvw==
X-Received: by 2002:adf:fdcc:: with SMTP id i12mr42986751wrs.317.1608207262846; 
 Thu, 17 Dec 2020 04:14:22 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x25sm7366647wmc.3.2020.12.17.04.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 04:14:22 -0800 (PST)
Date: Thu, 17 Dec 2020 13:14:20 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 9/9] drm/doc: render drm.h uapi docs
Message-ID: <X9tLnH5in/dlO7rZ@phenom.ffwll.local>
References: <20201217113220.102271-1-contact@emersion.fr>
 <20201217113220.102271-10-contact@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217113220.102271-10-contact@emersion.fr>
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

On Thu, Dec 17, 2020 at 12:32:20PM +0100, Simon Ser wrote:
> It doesn't seem like drm.h docs are included anywhere. Render them next
> to drm_mode.h, under the "Userspace API Structures" section.
> 
> This also allows references to e.g. DRM_CAP_* to be properly linkified
> elsewhere in our docs.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> ---

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  Documentation/gpu/drm-uapi.rst | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 7dce175f6d75..04bdc7a91d53 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -457,5 +457,8 @@ Userspace API Structures
>  .. kernel-doc:: include/uapi/drm/drm_mode.h
>     :doc: overview
>  
> +.. kernel-doc:: include/uapi/drm/drm.h
> +   :internal:
> +
>  .. kernel-doc:: include/uapi/drm/drm_mode.h
>     :internal:
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
