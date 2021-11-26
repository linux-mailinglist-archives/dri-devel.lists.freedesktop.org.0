Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7275845E858
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 08:16:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 716E06E9F7;
	Fri, 26 Nov 2021 07:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 044296E9F9
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 07:16:31 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso10003182wml.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 23:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DxMam6oENNqayKxosSeacotwQ1Du0QIrqIKplduK57E=;
 b=TLwKwMYKVUvp/kDIGB7n9o+gqcuUgyT4mMSlwQQLFlZShldbVcB7NjP6uEoxXYJtTu
 fX5nk98XSC5m7v8avXmGReJHb7rD1VB2JoESIYGq5nmpo7tI+U+/+0DyNLS6MtEMraF7
 ogIKdwmt7pmPlZfMdykSG1hyCoD3v0qQiONfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DxMam6oENNqayKxosSeacotwQ1Du0QIrqIKplduK57E=;
 b=JXdieJV6+cGdh1h9XfW0pz/cTnheX5KHnQvQv59fJdUSTFgbcNawf3cW1gOBqxgiQS
 X/JpCMhlWvMX1NdcfsCgZMvXx3hzMDrzzCt9x0+hWDD8OsRaH9fzjGQrzER+zgTb2/9g
 ap4KQwwwbLGH7BA2VMkwsldpUwXqzwn/wO0lr4rKMYVN+DTh3zwyRbF+7izHUJ0tgfps
 nhO5rZGb9v4xkrmWHDxXSzyWs6agBJk8xIfsT5Q28r729tV/5i2NhdY12wZsKVDs4nV2
 0B48ebdSsOfESqDrEezBYAWXhsfSn1KPFGEg6nZoK5FvbAXq+WMjw75wmMX0k8H8GAbt
 jbGQ==
X-Gm-Message-State: AOAM533b4jseMOLueMjVXqKRmgtvM8lgudc0kp8LgOg8uP2IVKsmQgP+
 +dcXhP/WiLj5DyFNTPNLY7koYw==
X-Google-Smtp-Source: ABdhPJxZ2jgbq6MAwLBhdCO5mBVEHxuMkqkvWKmyGrNEQLHwiRVuoT7sFM66hLccRiHDTEuYT25L+w==
X-Received: by 2002:a7b:cbd1:: with SMTP id n17mr13307817wmi.145.1637910990208; 
 Thu, 25 Nov 2021 23:16:30 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q24sm9668123wmj.21.2021.11.25.23.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 23:16:29 -0800 (PST)
Date: Fri, 26 Nov 2021 08:16:27 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [PATCH 0/2] virtgpu dummy events
Message-ID: <YaCJy9uoZJ0J3eNN@phenom.ffwll.local>
References: <20211122232210.602-1-gurchetansingh@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211122232210.602-1-gurchetansingh@google.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: dri-devel@lists.freedesktop.org, kraxel@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 22, 2021 at 03:22:08PM -0800, Gurchetan Singh wrote:
> From: Gurchetan Singh <gurchetansingh@chromium.org>
> 
> There was a desire to not have a virtgpu-specific implementation of
> poll(..), but there wasn't any real event to return either.
> 
> Solution: Dummy event with just event code
> 
> Context:
> 
> https://lists.freedesktop.org/archives/dri-devel/2021-November/330950.html
> 
> Userspace:
> 
> crrev.com/c/3296610
> 
> This series applies to drm-misc-fixes.

On the series:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I'm assuming someone from Google can push this to drm-misc-fixes for you?
-Daniel

> 
> Gurchetan Singh (2):
>   drm/virtgpu api: define a dummy fence signaled event
>   drm/virtio: use drm_poll(..) instead of virtio_gpu_poll(..)
> 
>  drivers/gpu/drm/virtio/virtgpu_drv.c   | 42 +-------------------------
>  drivers/gpu/drm/virtio/virtgpu_drv.h   |  1 -
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c |  2 +-
>  include/uapi/drm/virtgpu_drm.h         |  7 +++++
>  4 files changed, 9 insertions(+), 43 deletions(-)
> 
> -- 
> 2.34.0.rc2.393.gf8c9666880-goog
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
