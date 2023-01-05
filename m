Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F9D65EB1C
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 13:52:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE9910E706;
	Thu,  5 Jan 2023 12:52:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40AF810E706
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 12:52:39 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id 3so37934154vsq.7
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 04:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2CRm7bk9DTpojIaX1q1B2ElokleMNyF1cDSFRq+rJv0=;
 b=BrfC+PtkVxf2aCUyUKwg7G7EMBPTNCWsieKyNkTaE1INnnwE/uR+jH+fZpE0pAq9Jh
 lquwxCy8gPOcgZHUiaQdFwMLH7oXHs0NpOHJ1+mLfcxAIqsx38MpP+ZrJ00ibNRxIeYl
 +I5oEgAGVyuRqJfkh/DuZ1P+8GeNr1LlrCfS6UOYUrevfWx+M8iY6EyvdS2l44MZGTLt
 kDoB6EldJKh6hmm49s0/BKYGtL2aS0enL3u4//C+2Qh0DPCk8uU9wUgQi0usqhEiQUjD
 xD8SyLP1IKlOMctzUvVQeV0LpMGvThb/nTnsBpOxDj1ysG9ubHarYmIbcN5UQ4MZDJph
 dtzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2CRm7bk9DTpojIaX1q1B2ElokleMNyF1cDSFRq+rJv0=;
 b=23izt/y6ZZWdYjL7cAl5P+qummkKc0ICKXsnVE6kGQ4i6Oz6CKOK2SHYHz5qp5NoSN
 fU0Z2GaEgMUv1h2gieIshhr+5v07Kn5zDv27kWzDULK5PA0LK3gyYpXdPueq7stglGJ/
 fvEaeQmRo+Ixy6M2lqODiSKDUDhEwvT3SG1nRT9EllKVCtgR8GIFP/jk4Rj7AzqfBhkE
 vJlOT+Xq5tIgwTZ2wCcZJ2ySYDZqHrJz1UbT/rTxYOSUiUBnKQrCpUFFh99K22lB63Io
 IeWFKgVdItpEvEoTT5cn6+XE565t8z4cP6cLvWCZpFjLwocefnbhcm65JCThW/yhNAsW
 vgrg==
X-Gm-Message-State: AFqh2kr/hxiRhoF6K/H2DtJ57prEXLua1zxIPZ6evE3jtylpdm1iWm/e
 Oyfq7hWMFpB8IBpEE3uc7BRVIc6jtoy3271cTJ8ikQ==
X-Google-Smtp-Source: AMrXdXtZxxI6MDy7cZcAA/lnlcaPsrREkbq/DfgvwxXLtUJMu6DSN3bZFEwUhdIu4emutckh5vADRqoxx6EPgi2hQe4=
X-Received: by 2002:a05:6102:45b:b0:3cb:ebf:ba6e with SMTP id
 e27-20020a056102045b00b003cb0ebfba6emr3275813vsq.54.1672923158126; Thu, 05
 Jan 2023 04:52:38 -0800 (PST)
MIME-Version: 1.0
References: <20230105052325.514970-1-yixie@google.com>
 <Y7a2Viw/1RUNCGkD@phenom.ffwll.local>
In-Reply-To: <Y7a2Viw/1RUNCGkD@phenom.ffwll.local>
From: Yi Xie <yixie@google.com>
Date: Thu, 5 Jan 2023 21:52:26 +0900
Message-ID: <CAHf1YQ4AZoOd=Q7KVqb1gQm3=TtiS_8-uxFY93syov1AgUT=CQ@mail.gmail.com>
Subject: Re: [PATCH] drm/vkms: Add a DRM render node to vkms
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: melissa.srw@gmail.com, hamohammed.sa@gmail.com,
 dri-devel@lists.freedesktop.org, rodrigosiqueiramelo@gmail.com,
 lepton@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> This doesn't sound like a good idea to me. Devices without render
> capabilities should not fake it.
>
> User-space (e.g. wlroots) relies on "no render node" to enable
> software rendering (Pixman instead of GL).

We have virtgpu driver that exports a render node even when virgl is
not supported.
Mesa has special code path to enable software rendering on it:
https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/egl/drivers/dri2/platform_device.c#L296
We can do the same for vkms to force software rendering.

On Thu, Jan 5, 2023 at 8:36 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, Jan 05, 2023 at 02:23:25PM +0900, Yi Xie wrote:
> > Some libraries including Mesa and virglrenderer require a render node to
> > fully function. By adding a render node to vkms those libraries will
> > work properly, supporting use cases like running crosvm with virgl GPU
> > support via llvmpipe on a headless virtual machine.
>
> This is what vgem exists for. More or less at least ... I'm honestly not
> really understanding what you're trying to fix here, it sounds a bit like
> userspace being stupid.
> -Daniel
The problem with vgem is that it crashes llvmpipe while working with vkms.
Looks like it's due to the same reason as described in this thread in Mesa:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/5830

Importing buffers allocated by vgem to vkms seems to be unexpected and
causes the crash. If we create a render node on vkms then llvmpipe will use
vkms to allocate buffers and it no longer crashes.

> >
> > Signed-off-by: Yi Xie <yixie@google.com>
> > ---
> >  drivers/gpu/drm/vkms/vkms_drv.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> > index 293dbca50c31..8eea5d4dece8 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > @@ -113,7 +113,7 @@ static void vkms_config_debugfs_init(struct drm_minor *minor)
> >  }
> >
> >  static const struct drm_driver vkms_driver = {
> > -     .driver_features        = DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
> > +     .driver_features        = DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM | DRIVER_RENDER,
> >       .release                = vkms_release,
> >       .fops                   = &vkms_driver_fops,
> >       DRM_GEM_SHMEM_DRIVER_OPS,
> > --
> > 2.39.0.314.g84b9a713c41-goog
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
