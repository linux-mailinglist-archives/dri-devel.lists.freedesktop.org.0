Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 624D34F3D0F
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 19:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CB1110EE06;
	Tue,  5 Apr 2022 17:57:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E39B10EE06
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 17:57:04 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id p15so28298465ejc.7
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 10:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fWlXCTkYGyXzOu6P6awXX/6nfl84WYIZI9g+WSGOyw0=;
 b=jwx0XQUGCaRHrpcErZBCsWMj23/VXGgzoKqDbPSw2f+7F8N/d9igo6HIZ+sSRTWP9a
 hqVlvkcMJHhbv8xYnDkM7bGSTq93zYJVCDN/0Uym3PloU+pHINLS9cTw6XdP9ouh17le
 it2++ow9VO0gUkSzqvwdCeMBzqbqoP5MRFjfawj+UxJefktYATV0WZknO8TYNGxTGfMQ
 A4SEg3p8c2YD/MFhBiOnIcKNUo84CMezQUHC+Em+oj9ZjR24dmD358+boudl6sT0Vpem
 JS1XGjGYbGqUCc76nIevCdXkQ4b19TaL0abiCBotNqqN7PtVcy3R/zqZT3DhISco56Xk
 7VWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fWlXCTkYGyXzOu6P6awXX/6nfl84WYIZI9g+WSGOyw0=;
 b=18L3/yyjHBG9nxXokqP+affmQWqqj7PWEBmSFLU8mba9GWadl2P1u090spcaV+QrrS
 4apIiSq2CZd/csCNd4lfjNsgramK8VIL2Pk5pWIl4mU2sclCK9Js6EWT/CBjd8yYw3dK
 stkGelHDmcUK6+RUpBcgPYfd6SyMuxqyUuavhEtrEYJPIX+v/jgGaUKdj3R/g7nzWNRe
 K+gbQwvrEFAi7sA8vjEh+GwmmxgMz8AYGg8ZIDVTy1amzFkTExNqs8+N8+hbjQ8spsod
 4qUrKwhE26MP56Tl6yX/Pn7FHenQV6lQDrj7u6+GJgNgepB0Q0Pbwi8HP6BeVgxRNtNF
 lS6g==
X-Gm-Message-State: AOAM533u3VgU9lxIDtkFSL8PzpMW2x3M705SAKvfZOdCpndgzmoGYQ5y
 tBw6fg77dMeIcjAjOIGplKuXYfX8j5F7y/xdRPo=
X-Google-Smtp-Source: ABdhPJzNwJLndNEvf8of6myr8gcbYVYJMmeilk2VVKShekHBfh+c8nN7LVIdcrL0bjowhSiwuKS+l8gYahoKhGqXbFU=
X-Received: by 2002:a17:906:d10c:b0:6cd:4aa2:cd62 with SMTP id
 b12-20020a170906d10c00b006cd4aa2cd62mr4684858ejz.229.1649181422577; Tue, 05
 Apr 2022 10:57:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220405173918.1000846-1-robdclark@gmail.com>
In-Reply-To: <20220405173918.1000846-1-robdclark@gmail.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Tue, 5 Apr 2022 10:56:51 -0700
Message-ID: <CAPaKu7Tur-_Kf3Lb9U=98Yr_08onxPHNKTPh2anHU6zLPhr5ZQ@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: Add execbuf flag to request no fence-event
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 5, 2022 at 10:38 AM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> It would have been cleaner to have a flag to *request* the fence event.
> But that ship has sailed.  So add a flag so that userspace which doesn't
> care about the events can opt-out.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>

Might want to wait for Gurchetan to chime in as he added the mechanism.

> ---
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 8 +++++---
>  include/uapi/drm/virtgpu_drm.h         | 2 ++
>  2 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index 3a8078f2ee27..09f1aa263f91 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -225,9 +225,11 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
>                 goto out_unresv;
>         }
>
> -       ret = virtio_gpu_fence_event_create(dev, file, out_fence, ring_idx);
> -       if (ret)
> -               goto out_unresv;
> +       if (!(exbuf->flags & VIRTGPU_EXECBUF_NO_EVENT)) {
> +               ret = virtio_gpu_fence_event_create(dev, file, out_fence, ring_idx);
> +               if (ret)
> +                       goto out_unresv;
> +       }
>
>         if (out_fence_fd >= 0) {
>                 sync_file = sync_file_create(&out_fence->f);
> diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
> index 0512fde5e697..d06cac3407cc 100644
> --- a/include/uapi/drm/virtgpu_drm.h
> +++ b/include/uapi/drm/virtgpu_drm.h
> @@ -52,10 +52,12 @@ extern "C" {
>  #define VIRTGPU_EXECBUF_FENCE_FD_IN    0x01
>  #define VIRTGPU_EXECBUF_FENCE_FD_OUT   0x02
>  #define VIRTGPU_EXECBUF_RING_IDX       0x04
> +#define VIRTGPU_EXECBUF_NO_EVENT       0x08
>  #define VIRTGPU_EXECBUF_FLAGS  (\
>                 VIRTGPU_EXECBUF_FENCE_FD_IN |\
>                 VIRTGPU_EXECBUF_FENCE_FD_OUT |\
>                 VIRTGPU_EXECBUF_RING_IDX |\
> +               VIRTGPU_EXECBUF_NO_EVENT |\
>                 0)
>
>  struct drm_virtgpu_map {
> --
> 2.35.1
>
