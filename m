Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E5369D0ED
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 16:49:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FA210E68F;
	Mon, 20 Feb 2023 15:49:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [IPv6:2607:f8b0:4864:20::e35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD38210E68F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 15:49:47 +0000 (UTC)
Received: by mail-vs1-xe35.google.com with SMTP id j14so1163863vse.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 07:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cX0jaes1mpsyM+m1L+sZKXOmtVE9O3IfVCYvasDrc3I=;
 b=aAN41hbpZfjZkCgJpE84pramc8ntvO5PtuQnCUgk6Gsh7k4xJQFetHansKMutqs0hX
 ooA5LJKZdxWuG9HN/3f3zB23MTn5VZ0sj8Qif3tzPP1C+OMXa6z/EqsOImTW5ksD1KC3
 Xg43xNTePfPdCj2hr3/7IAbbiKmblSr5UuZEPqrFwYvyRst4ugL02IMM3UMw9jB2YvI2
 +n26HcOcj2GiNsa9Q3Y8dUl7k9xdMNODciDU7wjB4KYVqtrbs08J0cl2nVN/gbEsQTK8
 TtNd00U1jRoKf0RUSLXLsW3MuV+29YXUWNltBy2o7mF75rLGfcfYtnBLDqXbgW28OglD
 W0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cX0jaes1mpsyM+m1L+sZKXOmtVE9O3IfVCYvasDrc3I=;
 b=X8ZkU4enCUl6sEtQkqhF3XnBQjRFygZGlY+Kqn+KOJCLEo4VKQxP2d6M52DrG5eh/Z
 JqQzk4nvvPlDGILw/nxP6LTJFAnRGm7M2Sk9MhvA88mCCFW5R2aXbiITEqP0MJUEZvQh
 ArS5V0vav7q0mFsFxFxcxiYWXIS2F7gCYOnhL5OXhQqWhNCORuGEX2oOxDqeWh+PZlu8
 eG7alno2YGAsRJfTcX9hE17ZCCcD7mPd5hfwQRgdvwHnhA6XaeNyqtGYR0U3/o2STSyV
 bEfYfPxuCylNY/roVc3RkSEBhV1zFiirP6tlj3dtcqBZNy4CppGWJxPnR74F/Ny8qynD
 qrKA==
X-Gm-Message-State: AO0yUKUFtY0bElgutNJx3VwwDRiQ4XxfHo2gCpMc0XpjV1yzNsvbNBqz
 wzm51bCEVnlEpYcjeN3vFss2rqOF3RZh2UOQooGG4TThLbLkNMlQ
X-Google-Smtp-Source: AK7set8OXlvP7KLejxIFfBy8kWu8K8dCyrTVdEHwsCgdoUbSjHoea3TQf/aeHEGOOn6ABSbkCV0DZU6c9mlX7LONjGQ=
X-Received: by 2002:a05:6102:5088:b0:412:6281:6a38 with SMTP id
 bl8-20020a056102508800b0041262816a38mr288169vsb.48.1676908187029; Mon, 20 Feb
 2023 07:49:47 -0800 (PST)
MIME-Version: 1.0
References: <20230216130934.156541-1-contact@emersion.fr>
In-Reply-To: <20230216130934.156541-1-contact@emersion.fr>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 20 Feb 2023 15:49:31 +0000
Message-ID: <CAPY8ntBxsKgoaExW8BhbK8Z1VPY=BPGYdJ_r-K5gYhUwWr32Cw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: document DRM_IOCTL_PRIME_HANDLE_TO_FD and
 PRIME_FD_TO_HANDLE
To: Simon Ser <contact@emersion.fr>
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Simon

On Thu, 16 Feb 2023 at 13:09, Simon Ser <contact@emersion.fr> wrote:
>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Daniel Stone <daniel@fooishbar.org>
> ---
>  include/uapi/drm/drm.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 4cb956a52aee..54b2313c8332 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -1012,7 +1012,24 @@ extern "C" {
>  #define DRM_IOCTL_UNLOCK               DRM_IOW( 0x2b, struct drm_lock)
>  #define DRM_IOCTL_FINISH               DRM_IOW( 0x2c, struct drm_lock)
>
> +/**
> + * DRM_IOCTL_PRIME_HANDLE_TO_FD - Convert a GEM handle to a DMA-BUF FD.
> + *
> + * User-space sets &drm_prime_handle.handle with the GEM handle to export and
> + * &drm_prime_handle.flags, and gets back a DMA-BUF file descriptor in
> + * &drm_prime_handle.fd.
> + */
>  #define DRM_IOCTL_PRIME_HANDLE_TO_FD    DRM_IOWR(0x2d, struct drm_prime_handle)
> +/**
> + * DRM_IOCTL_PRIME_FD_TO_HANDLE - Convert a DMA-BUF FD to a GEM handle.
> + *
> + * User-space sets &drm_prime_handle.fd with a DMA-BUF file descriptor to
> + * import, and gets back a GEM handle in &drm_prime_handle.handle.
> + * &drm_prime_handle.flags is unused.

Is it worth explicitly stating that the handle would be released via
DRM_IOCTL_GEM_CLOSE? I've had userspace developers query how to
release imported handles in the past.

  Dave

> + *
> + * If an existing GEM handle refers to the memory object backing the DMA-BUF,
> + * that GEM handle is returned.
> + */
>  #define DRM_IOCTL_PRIME_FD_TO_HANDLE    DRM_IOWR(0x2e, struct drm_prime_handle)
>
>  #define DRM_IOCTL_AGP_ACQUIRE          DRM_IO(  0x30)
> --
> 2.39.1
>
>
