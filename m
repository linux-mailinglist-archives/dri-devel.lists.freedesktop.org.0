Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32530867A74
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 16:40:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46BFF10E777;
	Mon, 26 Feb 2024 15:40:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="O17O3/Tb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35F410E777
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 15:40:50 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-6e4857d93ebso1005576a34.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 07:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1708962049; x=1709566849; darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pyMLvsyxekyA4CMwFKpfc+stHn46li+mS3qSIosHUgs=;
 b=O17O3/TbSmoBsq+wM83d2zygg6CyQhuqIW+LSnh0G8MYITbeUGg2DsXB5OitmL02XG
 W81guBkz/CmXrgtJNBurVW2cEZ6uvA6/LpBWRlZIuiSLCUEMPQtiHNb6o2U7e5DxUF3j
 fWtaNpmyuaBJ7DLcelx5CRi2a1aa0fesp/LR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708962049; x=1709566849;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pyMLvsyxekyA4CMwFKpfc+stHn46li+mS3qSIosHUgs=;
 b=vGipK/kYXKpzHgohWwpHu2W9p/6n5HWeFMPOBURBN/ogZfZS6eZJeJuLGbVmhfzADZ
 WQBjfX1WxHXsx06pHD6Bqg7+2vAuzlilAjODor65yHn8yqssmV4B+O+t8ZXlk7mtCzWB
 QRzfA87q/dk/hkBEWxcXtDxDV9MLxa+uJKVoyXOhQPpDuHgFXd3FI6Z5n7XEl3zosJ6y
 UdWu4lPZeYTuSigGMzkoDosgRdvWDb4f29qb2vYmGxwelOXHviqfLI4Kn+ua1rjw2KhQ
 +MeA2nCUuUvEmZmGdbft6xH/lQidj+Fj3rJHWM6dNouozARmPPTcK3C7iY21kPTkafvD
 T4hA==
X-Gm-Message-State: AOJu0Yx9XGB5Hh9PudGBtGIP6AunyondOkyh+B7eWB6NwfB8xbjDmusB
 f9fLXD4AEvmOhbonVZJ3E5KieT+DikeDAvcHj0HvNczbJpWq7/4QvYPRi3ehdJO/qmk07AE314p
 ySL6UpUuXcnFksU6hElnYHY1/gvZixkjFteDPyw==
X-Google-Smtp-Source: AGHT+IGOPKWjCteUOlp7izpTV1fiGMWHG1mpro9GvV57MswiPzrBaFi5AFwQTzqOqjIIuSP1wZw9YUcw3kkR+KTagSc=
X-Received: by 2002:a05:6870:c112:b0:21f:ccef:a4d1 with SMTP id
 f18-20020a056870c11200b0021fccefa4d1mr7252070oad.4.1708962049579; Mon, 26 Feb
 2024 07:40:49 -0800 (PST)
MIME-Version: 1.0
References: <20240226152123.131406-1-mripard@kernel.org>
In-Reply-To: <20240226152123.131406-1-mripard@kernel.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 26 Feb 2024 16:40:37 +0100
Message-ID: <CAKMK7uEKhtA9NO3X7PB9Kinsi7Rt9XmQZhVVjcm-DoQCy+uL1A@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update drm.git URL
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, 
 Daniel Stone <daniels@collabora.com>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 26 Feb 2024 at 16:21, Maxime Ripard <mripard@kernel.org> wrote:
>
> Now that the main DRM tree has moved to Gitlab, adjust the MAINTAINERS
> git trees to reflect the location change.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7e7e7c378913..00e8a8ff627e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -614,7 +614,7 @@ AGPGART DRIVER
>  M:     David Airlie <airlied@redhat.com>
>  L:     dri-devel@lists.freedesktop.org
>  S:     Maintained
> -T:     git git://anongit.freedesktop.org/drm/drm
> +T:     git https://gitlab.freedesktop.org/drm/kernel.git
>  F:     drivers/char/agp/
>  F:     include/linux/agp*
>  F:     include/uapi/linux/agp*
> @@ -6996,7 +6996,7 @@ L:        dri-devel@lists.freedesktop.org
>  S:     Maintained
>  B:     https://gitlab.freedesktop.org/drm
>  C:     irc://irc.oftc.net/dri-devel
> -T:     git git://anongit.freedesktop.org/drm/drm
> +T:     git https://gitlab.freedesktop.org/drm/kernel.git
>  F:     Documentation/devicetree/bindings/display/
>  F:     Documentation/devicetree/bindings/gpu/
>  F:     Documentation/gpu/
> --
> 2.43.2
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
