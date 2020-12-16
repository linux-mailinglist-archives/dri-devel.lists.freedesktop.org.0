Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 723DB2DC840
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 22:19:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2915289503;
	Wed, 16 Dec 2020 21:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D31DF89503
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 21:19:47 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id g185so3763119wmf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 13:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Niy/VH7yOs0n9tz16pNinr9x5NCNIRyQacqEd7P0Igw=;
 b=ZppZKNLFL439N3VstDH1Vzw4D1QUy+G9zHvzTFa2QkMJ0O/fyv1zIEsE+Bk6JamyUQ
 6kjlrYKYq/NLyhrjxh1LoWpfi8kTXdFjknAJRuZyJu7PgLEuhhzeiHU5myA9H5qgclz/
 ng71FdY0kUGS4l2aqwFN3M1YHVugLZxtLZ/OQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Niy/VH7yOs0n9tz16pNinr9x5NCNIRyQacqEd7P0Igw=;
 b=lnORuI3ttFoFU0aH/UuP4uk7EF2sjgvbEqxR1oCVjK3NL8IOIbhCJ56xTeXMFtv+Qt
 esngKz0jaArTNQ9V/1XcG2rZcxoF2++xNz2VjhqGYOWs474ImsbVpcns5ZlFXCYkQQqu
 PlM40THQs0ecgXx13/7JrWZviboGqPII7We3bJBOZ9riEGDpCLUNmVLY1YBNBOF78Kvm
 K9nQDLOFQO3kzOU6sQ4+TziSaAQg/YmOk3JsAyw/18ggQ5kGjHvw4XCkrQVQ/0MQKHVm
 WvpkQPhkYcdmTClmLf3lq4aZkMFEW/vLTAASUtl5vBjVFaWuRLHC7tVIvcvMMRGv5KlZ
 cgdg==
X-Gm-Message-State: AOAM531LpDqKuGm+eBWnSuAdEmJlJzdru5mMFbM5FGTIBNKX4WF1Ltp/
 xcJe81T+y1wsneWsA3PYjWe38g==
X-Google-Smtp-Source: ABdhPJyd5dQLWTvmHYIFXN1/Hp5i+Azt2sTfnEmFmcQWnGsbqctQ28H0NbjWubvMQLBWn1TRUHMn6A==
X-Received: by 2002:a1c:2155:: with SMTP id h82mr5211824wmh.132.1608153586549; 
 Wed, 16 Dec 2020 13:19:46 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i18sm4957540wrp.74.2020.12.16.13.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 13:19:45 -0800 (PST)
Date: Wed, 16 Dec 2020 22:19:44 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 6/8] drm/doc: introduce new section for standard plane
 properties
Message-ID: <X9p58HlIQ5ddw7kN@phenom.ffwll.local>
References: <20201216202222.48146-1-contact@emersion.fr>
 <20201216202222.48146-7-contact@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201216202222.48146-7-contact@emersion.fr>
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

On Wed, Dec 16, 2020 at 09:22:20PM +0100, Simon Ser wrote:
> Introduce a new "Standard Plane Properties" section for properties
> defined in drm_plane.c. Move the mis-placed IN_FORMATS docs there.

Yeah that's misplaced.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> ---
>  Documentation/gpu/drm-kms.rst |  6 ++++++
>  drivers/gpu/drm/drm_blend.c   |  6 ------
>  drivers/gpu/drm/drm_plane.c   | 12 ++++++++++++
>  3 files changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> index fcd4e15379b0..9cfaab4df21a 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -493,6 +493,12 @@ Standard CRTC Properties
>  .. kernel-doc:: drivers/gpu/drm/drm_crtc.c
>     :doc: standard CRTC properties
>  
> +Standard Plane Properties
> +-------------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_plane.c
> +   :doc: standard plane properties
> +
>  Plane Composition Properties
>  ----------------------------
>  
> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index 5c2141e9a9f4..26e2f2ffd255 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -185,12 +185,6 @@
>   *		 plane does not expose the "alpha" property, then this is
>   *		 assumed to be 1.0
>   *
> - * IN_FORMATS:
> - *	Blob property which contains the set of buffer format and modifier
> - *	pairs supported by this plane. The blob is a drm_format_modifier_blob
> - *	struct. Without this property the plane doesn't support buffers with
> - *	modifiers. Userspace cannot change this property.
> - *
>   * Note that all the property extensions described here apply either to the
>   * plane or the CRTC (e.g. for the background color, which currently is not
>   * exposed and assumed to be black).
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 49b0a8b9ac02..4c1a45ac18e6 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -61,6 +61,18 @@
>   * userspace too much.
>   */
>  
> +/**
> + * DOC: standard plane properties
> + *
> + * DRM planes have a few standardized properties:
> + *
> + * IN_FORMATS:
> + *     Blob property which contains the set of buffer format and modifier
> + *     pairs supported by this plane. The blob is a drm_format_modifier_blob
> + *     struct. Without this property the plane doesn't support buffers with
> + *     modifiers. Userspace cannot change this property.
> + */
> +
>  static unsigned int drm_num_planes(struct drm_device *dev)
>  {
>  	unsigned int num = 0;
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
