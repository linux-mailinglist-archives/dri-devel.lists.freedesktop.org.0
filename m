Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B9C1CA3D3
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 08:26:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA036E07D;
	Fri,  8 May 2020 06:26:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E45106E07D
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 06:26:39 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id v12so468704wrp.12
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 23:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=H8ZqC3GBUzt1/AqEuGm37gJAqTkD7DMHCS1QNdawOeM=;
 b=LtMIkI+joQJwN5j/ae9ZwyJUi6uky1+I+Nhgh5i/DEJ4hNhJcnbXuolQstXDJ1rcjv
 WioPgeWfO+AvuAYGlwrfNUuhg1TStT1NX8l+aktT9+BAbWfLxOz8bIyzhwpjraAAfDIA
 nKwJQSVte9+7XMJf9zi44a7hI/xy0BjXxxmoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=H8ZqC3GBUzt1/AqEuGm37gJAqTkD7DMHCS1QNdawOeM=;
 b=gvdd9XxTqeqKICU81Re0f+eGMX47cp2plTTisgBlN4c6cNf+GudY26N15CEmrp7Td0
 zxn26e7go5nPAGEO2V8UXbJCuMTCYfBu+k3++l65YnV15iOaiLlc4rO7UCN5nMhAzTWL
 udyawoE1bhjcYcPPDBvYY1HioMYDXzCmugjXOYPTD/wZI9vX0Y/p6biWJ6J681i6OGG5
 sQIMOt7cCsgK9NVuwMVQ2yyYa/K6jN31bbIOSnYdCpYnkso1PLT1LM0ahkShocQX9L7W
 Di2vHK7V04UHJMsPXlOBhLMTtl810m3FJhM+FQRaWIvtSK+gmhABTxug2ZP7KiY/749c
 cMzQ==
X-Gm-Message-State: AGi0PubvZ0KuZF5UQze8QJqFJB+Gdk6GHpuTe2gl9vS0dj/KX0DSnLoq
 P9gqp8B1Ej7o0RionAsHWfQGXg==
X-Google-Smtp-Source: APiQypIEF3sS0lXfJtYen51mklZfFAjga9JtWidZbf+IlJd9zDPS1+AA7LjOZwDm1PCLT63ttZtxtQ==
X-Received: by 2002:adf:a4c5:: with SMTP id h5mr1003864wrb.408.1588919198511; 
 Thu, 07 May 2020 23:26:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u127sm11611792wme.8.2020.05.07.23.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 23:26:37 -0700 (PDT)
Date: Fri, 8 May 2020 08:26:36 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 03/36] drm/todo: mention i915 in the struct_mutex section
Message-ID: <20200508062636.GB10381@phenom.ffwll.local>
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
 <20200507150822.114464-4-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200507150822.114464-4-emil.l.velikov@gmail.com>
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

On Thu, May 07, 2020 at 04:07:49PM +0100, Emil Velikov wrote:
> From: Emil Velikov <emil.velikov@collabora.com>
> 
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> ---
> i915 uses the _unlocked version of the grm_gem_object API. Yet makes an
> extensive use of the struct_mutex.
> 
> Did not check how exactly it all work though.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  Documentation/gpu/todo.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 658b52f7ffc6..2ce52c5917f8 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -157,8 +157,8 @@ private lock. The tricky part is the BO free functions, since those can't
>  reliably take that lock any more. Instead state needs to be protected with
>  suitable subordinate locks or some cleanup work pushed to a worker thread. For
>  performance-critical drivers it might also be better to go with a more
> -fine-grained per-buffer object and per-context lockings scheme. Currently only the
> -``msm`` driver still use ``struct_mutex``.
> +fine-grained per-buffer object and per-context lockings scheme. Currently only
> +the ``msm`` and `i915` drivers use ``struct_mutex``.
>  
>  Contact: Daniel Vetter, respective driver maintainers
>  
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
