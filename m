Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D88E51EDE3E
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 09:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB286E296;
	Thu,  4 Jun 2020 07:30:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF676E296
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jun 2020 07:30:54 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l10so4888983wrr.10
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jun 2020 00:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6D5SDOsKYoF65wEgrgDOtrw3/NMg3synHxEeoqmEmEg=;
 b=G47UYPyUybZC/6bCc7SyQuPZJQ/3lOdhI2460YROaYaQ+9EQ9Q+HIab7sIPoKqvQdm
 C8LiWbDGfmOnBHHF4Y6oIJGPLS9NGyJSCRX0qulg8wBfS77Z54/Uh13XZuiVgH9Fbupi
 tsA8m+FMyaTwVPhm5a3RuVrxYUes+IOtyuguc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6D5SDOsKYoF65wEgrgDOtrw3/NMg3synHxEeoqmEmEg=;
 b=QcXHc9wwEXaSADgdZ/uG/VgK1Dhn2yu/LjMPntHk+6R3HkTBqhPdnx1tdob9knaBm/
 tVOoquFHvQQPXWoWzd7e5Yl4/RPX83lzosaxWrXHC5wqllMwP9xhukz5Q9BGPf2mxz4z
 zhEA1H6Tgl+eIMtgTeNVJY4so+zBTRFlROA7z6z1Wnbt6VJe1tAVO278xGDP3OgT32wS
 6VG/EtisFU2yj/FjKRbM12JbQsPY3VqazPbLGBgiPOah7k1G4OV8i+GpGkb6XpDKzxyj
 lXAhMpXWJiMI7ZHZAviDHyp6esLXspWK7Z3O0o6JBx9Uv1f0FraSK/sH3gPEOUUpeNlA
 B3Dw==
X-Gm-Message-State: AOAM531Z7apdjkK2AvhcKba6oK7Fsd5XgkEQ7ZN6PigphH4Df4+gMF1f
 hlEdOm4Yt04rqZZvCgyE2hzo1A==
X-Google-Smtp-Source: ABdhPJzZVdtzob1GTiPSzJnMa5qmURIpcouIlwshvMI6NJflDSEILs9CgQd0EaSpWfDlgF4uw4cxLQ==
X-Received: by 2002:adf:ed87:: with SMTP id c7mr3051257wro.108.1591255852784; 
 Thu, 04 Jun 2020 00:30:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z22sm6133487wmf.9.2020.06.04.00.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 00:30:52 -0700 (PDT)
Date: Thu, 4 Jun 2020 09:30:49 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH] drm/todo: Add item about modeset properties
Message-ID: <20200604073049.GS20149@phenom.ffwll.local>
References: <20200603170434.2363446-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200603170434.2363446-1-emil.l.velikov@gmail.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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

On Wed, Jun 03, 2020 at 06:04:34PM +0100, Emil Velikov wrote:
> Add some information about pre-atomic modeset properties alongside a
> list of suggestions how to handle the different instances.
> 
> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> ---
>  Documentation/gpu/todo.rst | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 658b52f7ffc6..6648fd13cc1e 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -392,6 +392,38 @@ Contact: Laurent Pinchart, respective driver maintainers
>  
>  Level: Intermediate
>  
> +Consolidate custom driver modeset properties
> +--------------------------------------------
> +
> +Before atomic modeset took place, many drivers where creating their own 
> +properties. Among other things, atomic brought the requirement that custom,
> +driver specific properties should not be used.
> +
> +In for this task, we aim to introduce core helper or reuse the existing ones

s/In for/For/ I think ...

> +if available:
> +
> +A quick, unconfirmed, examples list.
> +
> +Introduce core helpers:
> +- audio (amdgpu, intel, gma500, radeon)
> +- brightness, contrast, etc (armada, nouveau) - overlay only (?)
> +- broadcast rgb (gma500, intel)
> +- colorkey (armada, nouveau, rcar) - overlay only (?)
> +- dither (amdgpu, nouveau, radeon) - varies across drivers
> +- underscan family (amdgpu, radeon, nouveau)
> +
> +Already in core:
> +- colorspace (sti)
> +- tv format names, enhancements (gma500, intel)
> +- tv overscan, margins, etc. (gma500, intel)
> +- zorder (omapdrm) - same as zpos (?)
> +
> +
> +Contact: Emil Velikov, respective driver maintainers
> +
> +Level: Intermediate

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> +
> +
>  Core refactorings
>  =================
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
