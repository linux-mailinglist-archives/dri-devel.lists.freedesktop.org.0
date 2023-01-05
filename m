Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EE065EA0D
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 12:37:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE9C10E056;
	Thu,  5 Jan 2023 11:37:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0DF10E056
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 11:36:58 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id bs20so33718400wrb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 03:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=G5DQyNzMSUkqJ+nmRTq4NM8zNyI1wC/TkazMLKW2pRQ=;
 b=hWZOSTCsaLYXoXjMKR9G0fJ7lN+/kTEc2iG/QOYUyCcBY1pEUgSKc/dlTut55OO1Ne
 e0yYWS1VputN6J5Y5z1zZp4y+fjq1bioeD6uCKo81ptlfli2Zf1hc4xJutpr7OOgQzPa
 u4nDTFdU2t07vAE6W+CyjfU+96E0kiPRJFCgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G5DQyNzMSUkqJ+nmRTq4NM8zNyI1wC/TkazMLKW2pRQ=;
 b=rhgc2v91W9WdtNz6vCXg9F9S+wmkJVJfC4cb8sFJHvkqvC71xAtiCwbLJtqDPBCF1E
 sdsPM/atotGp6n+y1PqP73hEG0XhwcHJMVTMqeSKO63AycGy3aCtIjVPHMrg3+rqI/hq
 Fd5Mn6DMgv7jx1URmYVouw6+8Ud8U62OttdTYRpGgaJ/os90eK31R35Ss/nhz03J9OAK
 iGj/jPt6wsgcqeYcd5DABxWhx1OjpuVvrw897sDRink9XaB9v03HkCm/XMdz1KhogdVJ
 k1mlFwYes3IfS4LpM3zgiFUkjo6KsS85I2lmBvH2E/3ppAsc5jHXNlbNboLnDMO9reLa
 xOfA==
X-Gm-Message-State: AFqh2kq7opVkTRzrkuhY1dc8OojMCdrAAZoP7eWF6dT7Nv6ebznANC0p
 MP4FVP0QeJy/mcKA0baykYuQyg==
X-Google-Smtp-Source: AMrXdXsWYEaaBAnkF4eIT8blzHkbGGEPq43XlitA+1GzusvOLp5ywKm1kbWQ64Q3D81kULj9azFDRQ==
X-Received: by 2002:adf:f28b:0:b0:274:357:6a12 with SMTP id
 k11-20020adff28b000000b0027403576a12mr30043646wro.55.1672918617479; 
 Thu, 05 Jan 2023 03:36:57 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 k4-20020adff284000000b00289bdda07b7sm21740887wro.92.2023.01.05.03.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 03:36:56 -0800 (PST)
Date: Thu, 5 Jan 2023 12:36:54 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Yi Xie <yixie@google.com>
Subject: Re: [PATCH] drm/vkms: Add a DRM render node to vkms
Message-ID: <Y7a2Viw/1RUNCGkD@phenom.ffwll.local>
References: <20230105052325.514970-1-yixie@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230105052325.514970-1-yixie@google.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com, lepton@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 05, 2023 at 02:23:25PM +0900, Yi Xie wrote:
> Some libraries including Mesa and virglrenderer require a render node to
> fully function. By adding a render node to vkms those libraries will
> work properly, supporting use cases like running crosvm with virgl GPU
> support via llvmpipe on a headless virtual machine.

This is what vgem exists for. More or less at least ... I'm honestly not
really understanding what you're trying to fix here, it sounds a bit like
userspace being stupid.
-Daniel

> 
> Signed-off-by: Yi Xie <yixie@google.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 293dbca50c31..8eea5d4dece8 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -113,7 +113,7 @@ static void vkms_config_debugfs_init(struct drm_minor *minor)
>  }
>  
>  static const struct drm_driver vkms_driver = {
> -	.driver_features	= DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
> +	.driver_features	= DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM | DRIVER_RENDER,
>  	.release		= vkms_release,
>  	.fops			= &vkms_driver_fops,
>  	DRM_GEM_SHMEM_DRIVER_OPS,
> -- 
> 2.39.0.314.g84b9a713c41-goog
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
