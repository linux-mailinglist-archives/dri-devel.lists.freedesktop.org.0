Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F4E1CA3E4
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 08:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8646A891A1;
	Fri,  8 May 2020 06:31:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2BF6891A1
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 06:31:17 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id v12so479280wrp.12
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 23:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wZcvjNgeazZPh6K8L593opZ/XCurPqYPm796UJ24qUk=;
 b=P3bCfKDvGM/q1ELNpS5XCUrkUOnWzhoc+T8vKbp7n1Mgtuy3pioRUXnq/bMyUjhYrg
 yCGUv7bbkcos8NeTMNcihul6rcBWPr5Wq9Atcz362vI5Z1rxL+S7qfi6MzyDrdjyObuL
 ALl9Z7rxGfKLe9CANjnjznIlbBYR7Ix7j6nuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wZcvjNgeazZPh6K8L593opZ/XCurPqYPm796UJ24qUk=;
 b=Ulp1omevuN9vzfMzNJz/fyFytu40MxCF/LI6YUfY2efcggc02oR5wqlsrhcpDcf6AL
 W4sswUp2p+K+fDy4pzYlamq5j1laGoYW5xWxdzurzmWHHDgwyqjK+OyPx5brc5gEL+rh
 wc+IGyCUWIG14FQ8XhaD2he+Pgej2QHSG1g0tiTRwiAH2eeSJgY7dKnAyOdymlGyOLRU
 7j8O1g47aN3/P4bXvX6KhLL5Z013Oq/G6jUoKrbQzML8RzDIc6ZRzjDhQj9D/WmN3gM7
 v03W4dtAtt1vaO/dZeodyid6ihP6UAbwr9VPfOIn2AIUHs1mbIcE3l1ElTuA+903/BPi
 0JDA==
X-Gm-Message-State: AGi0PuYo2FPS8PpI3VAA3DXA+K7gHMgoqnN/E8SjDSjPjj1cQPK79iD+
 v/8T3y+tfYN/HW6sDCRwXz6Nzw==
X-Google-Smtp-Source: APiQypJKoJ6bsRR3fMqkaZKEmyL/Ge6QNOx/6lr54DVg44AxUQA7qrNkVV9Y+YuPOJH6xNme2R/OEg==
X-Received: by 2002:adf:ea09:: with SMTP id q9mr1033496wrm.399.1588919476652; 
 Thu, 07 May 2020 23:31:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a9sm11261155wmm.38.2020.05.07.23.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 23:31:16 -0700 (PDT)
Date: Fri, 8 May 2020 08:31:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 05/36] drm/doc: drop struct_mutex refernce for
 drm_gem_object_free
Message-ID: <20200508063110.GA1383626@phenom.ffwll.local>
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
 <20200507150822.114464-6-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200507150822.114464-6-emil.l.velikov@gmail.com>
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

On Thu, May 07, 2020 at 04:07:51PM +0100, Emil Velikov wrote:
> From: Emil Velikov <emil.velikov@collabora.com>
> 
> The comment that struct_mutex must be held is misleading. It is only
> required when .gem_free_object() is used.
> 
> Since that one is going with the next patches, drop the reference.
> 
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_gem.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 918d1ba25f63..12fa121d0966 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -965,7 +965,6 @@ EXPORT_SYMBOL(drm_gem_object_release);
>   * @kref: kref of the object to free
>   *
>   * Called after the last reference to the object has been lost.
> - * Must be called holding &drm_device.struct_mutex.
>   *
>   * Frees the object
>   */
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
