Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A11F9BDB39
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 02:31:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 972E710E184;
	Wed,  6 Nov 2024 01:31:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Kt7FwDct";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C42810E184
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 01:31:41 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-3a6ababa9f7so20097055ab.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Nov 2024 17:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730856700; x=1731461500; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1ZEdQ5A4rc3P9ZMICWLA+PiCJDpmRtuPvoqRfEkgQC0=;
 b=Kt7FwDctJe2ZloKkjlLoJ4aMPnH6Aqu/6EgABJ2Wc3Oi30vVAiOp/1cORfqPOPcsfN
 v0EZ4B1C4gGnEkG1yV1C5uRdknfGfC+sQMnbHUfyt4XOv39L6Z7cDU8p3F8XhLh6Mfdh
 rVuv37aegeIfXnaJgtjOfJJnWbEBRpEKLfCFQHXb5LXosWWQjXvnVbCcSGIxCVkO5o+5
 Yq0QMHGqIXNcXS+MCyOHKTSm0TDTzhw9eUCjKbwmEXq9YpupInTzcYJsjwwMEv6knrPT
 85sJyRaQQEUyC2aTEXkrziHDejN4RXRnqPWamMJy+f+IysADTpN7HQssUDRbqNz0xyfK
 D88A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730856701; x=1731461501;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1ZEdQ5A4rc3P9ZMICWLA+PiCJDpmRtuPvoqRfEkgQC0=;
 b=utyQt6wrNbg85LPnIVzepnowUPHcCNI3xhqy/iwDAyjOSKSntl+hMMXxcXYDAtmgzZ
 +xr4ERlPwhZaLobjy9oCZxCCKS0If43Ob1RgJFyw3wWa2P1js6fNqIarvt3f19zA6PgZ
 SvK3paZDXJG7P89b1JghCYSSwHeh6FCwBnqhWT3+wznZgEsVtqrwCc+QQD+WKDWKmO3l
 hXzkUAEUxfwlJaowdxJMr1t2ZL6PhzHRuY1eUdYhSg49c2tERFpszi1XqGcYTQD2m+6C
 Xz0zXw78/2tcDXXykob5qLaKnfZRRG+Y6ni7mwN2vkqXq/WcZrsRo9kRQ3Uo+Md6eOiC
 c6AA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4z3+jMddLPlwvJcmHA0WE1oEMOH9CsgaOuSSCFIfHRZLC/5vAkV8AeaJHH0oRHfEv8pK+QrZDrNw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxttT/CCH6+p5U6QBp25wF/6lMS0tUmuij87RHFeaFyk49ovgnv
 Zu1Me4E6Q0t7libz5AEEAbZUyu7VDOAPwNTqOgylQRcnHXCn4/Tpap9BQfZSVlIhFesMImYV+eN
 IoMof/fkIoTXo7wLDcNcKH6d4hE4=
X-Google-Smtp-Source: AGHT+IEKU8XnaFKdqE7nB8aAs1Qbr/FQljqOuyQsSN6+XX2borSTMs1XTeUygH5VgMPHRf3Wtb671mQbzY159BQ9UUU=
X-Received: by 2002:a05:6e02:148a:b0:3a6:b37c:6a12 with SMTP id
 e9e14a558f8ab-3a6b37c6cc2mr189320995ab.7.1730856700682; Tue, 05 Nov 2024
 17:31:40 -0800 (PST)
MIME-Version: 1.0
References: <20241020224725.179937-1-dmitry.osipenko@collabora.com>
In-Reply-To: <20241020224725.179937-1-dmitry.osipenko@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 5 Nov 2024 17:31:28 -0800
Message-ID: <CAF6AEGs2+gPtqOw=LMwVxNkzWgYc11u0VN3DnQOyQc2MPhsJig@mail.gmail.com>
Subject: Re: [PATCH v1] drm/virtio: Don't create a context with default param
 if context_init is supported
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, 
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sun, Oct 20, 2024 at 3:49=E2=80=AFPM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>
> Xorg context creation fails for native contexts that use
> VIRTGPU_CONTEXT_INIT because context is already initialized implicitly
> when dumb buffer is created. Fix it by not creating default vrend context
> if context_init is supported.
>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd=
.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/virtio/virtgpu_gem.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virti=
o/virtgpu_gem.c
> index 7db48d17ee3a..67f557e058b4 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_gem.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
> @@ -127,15 +127,17 @@ int virtio_gpu_gem_object_open(struct drm_gem_objec=
t *obj,
>         /* the context might still be missing when the first ioctl is
>          * DRM_IOCTL_MODE_CREATE_DUMB or DRM_IOCTL_PRIME_FD_TO_HANDLE
>          */
> -       virtio_gpu_create_context(obj->dev, file);
> +       if (!vgdev->has_context_init)
> +               virtio_gpu_create_context(obj->dev, file);
>
>         objs =3D virtio_gpu_array_alloc(1);
>         if (!objs)
>                 return -ENOMEM;
>         virtio_gpu_array_add_obj(objs, obj);
>
> -       virtio_gpu_cmd_context_attach_resource(vgdev, vfpriv->ctx_id,
> -                                              objs);
> +       if (vfpriv->ctx_id)
> +               virtio_gpu_cmd_context_attach_resource(vgdev, vfpriv->ctx=
_id, objs);
> +
>  out_notify:
>         virtio_gpu_notify(vgdev);
>         return 0;
> --
> 2.47.0
>
