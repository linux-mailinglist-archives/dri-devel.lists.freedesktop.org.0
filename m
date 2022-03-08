Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3BB4D1D27
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 17:29:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FB5910E49E;
	Tue,  8 Mar 2022 16:29:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194D810E49E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 16:29:05 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id t11so29430892wrm.5
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 08:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SYDOiiE/T/Y7VYsIB3p/zW4CbpW2wGMyym0vbgifcOE=;
 b=WNVHOSyNNfjEW9O3TED1BUUpsZlmtWZ5GMHSHHEVFGg7+rjPoN4aQMb1uneNNfYFmJ
 t6flvC3RMKFIUdsgeIjsapRQTl+EqkEfyUY61YObOG7prCe8glX8SziJdfhIhh9ntGtw
 5PYICSaCHkWCxD9iay5Qo/8n1YfjEmPAl5TY6IFLzCxewPS15FEJr6ImSYwI3RRgUul9
 d9JvnyrG3dWs1ImlSIkqz7bMqSZA+4UTu3JYiEOZaBJrz5b/y8MOqLgL3Glvr7MJ561P
 SaAw9NkYUHoo0W3dRhvxVTpr/NdQMotVJH1ht/KW0KosH4wu3toSK3wPypEvUgLGA8UK
 OAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SYDOiiE/T/Y7VYsIB3p/zW4CbpW2wGMyym0vbgifcOE=;
 b=bg9Bde7lZxYAf7a7kI9iGDClopoRzXd42xNoCDd+hySxBWMLh9yzBH7NEVc5vvM55s
 VIz/xdyVdz/igBc2wKavG+1f9dOpFMCkExL9NKo2n4qG+mgfNNkvFk4eIUkbb5oDg8rs
 o/V4FcCSWAVQrQ9VBnt0+CKU+jmUcgPPgwlPr1vbr9cT+cr+Sq33Ha+JrJ8EhPvmDSXH
 9AJO9jZSlHkJjW1tHxP6KyrkEuaT21sSpeKeGbSqB+eKrZW4WLcHN3COirKswTuocQ1R
 HP/b7ptUSSssKVuP5syOxdO9w2MQmMQrZmeXdZaAp4qA+uksMO1DSf9ZjCYUAl8qotTA
 +IwA==
X-Gm-Message-State: AOAM531j7zoEp1RW6nx5Map+Klr63h6opeceSXXDQzNqsd0ZF/tbjyfF
 86YibpLRZfFdwWZM5cRci+x64YqfYLjDYlDdsxA=
X-Google-Smtp-Source: ABdhPJyR74mrKbhqIZt8QWvM99w64IQ3UB0prHiSjO57e806D1kgvYf/kWL3XMCcUIHNTOXynsFWDPS+QJu3axJda3U=
X-Received: by 2002:a5d:5382:0:b0:1f0:2f64:5a5a with SMTP id
 d2-20020a5d5382000000b001f02f645a5amr12914704wrv.418.1646756943508; Tue, 08
 Mar 2022 08:29:03 -0800 (PST)
MIME-Version: 1.0
References: <20220308131725.60607-1-dmitry.osipenko@collabora.com>
In-Reply-To: <20220308131725.60607-1-dmitry.osipenko@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 8 Mar 2022 08:29:32 -0800
Message-ID: <CAF6AEGt=aVJ9nR+Wv+bJEFZrn-cNOSNXG1TaJr=Cx-FTgutwKA@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] Add memory shrinker to VirtIO-GPU DRM driver
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Gert Wollny <gert.wollny@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko <digetx@gmail.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 8, 2022 at 5:17 AM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> Hello,
>
> This patchset introduces memory shrinker for the VirtIO-GPU DRM driver.
> During OOM, the shrinker will release BOs that are marked as "not needed"
> by userspace using the new madvise IOCTL. The userspace in this case is
> the Mesa VirGL driver, it will mark the cached BOs as "not needed",
> allowing kernel driver to release memory of the cached shmem BOs on lowmem
> situations, preventing OOM kills.

Will host memory pressure already trigger shrinker in guest?  This is
something I'm quite interested in for "virtgpu native contexts" (ie.
native guest driver with new context type sitting on top of virtgpu),
since that isn't using host storage

BR,
-R

> This patchset includes couple fixes for problems I found while was working
> on the shrinker, it also includes prerequisite DMA API usage improvement
> needed by the shrinker.
>
> The Mesa and IGT patches will be kept on hold until this kernel series
> will be approved and applied.
>
> This patchset was tested using Qemu and crosvm, including both cases of
> IOMMU off/on.
>
> Mesa: https://gitlab.freedesktop.org/digetx/mesa/-/commits/virgl-madvise
> IGT:  https://gitlab.freedesktop.org/digetx/igt-gpu-tools/-/tree/virtio-madvise
>
> Dmitry Osipenko (5):
>   drm/virtio: Correct drm_gem_shmem_get_sg_table() error handling
>   drm/virtio: Check whether transferred 2D BO is shmem
>   drm/virtio: Unlock GEM reservations in error code path
>   drm/virtio: Improve DMA API usage for shmem BOs
>   drm/virtio: Add memory shrinker
>
>  drivers/gpu/drm/virtio/Makefile               |   3 +-
>  drivers/gpu/drm/virtio/virtgpu_drv.c          |  22 +++-
>  drivers/gpu/drm/virtio/virtgpu_drv.h          |  31 ++++-
>  drivers/gpu/drm/virtio/virtgpu_gem.c          |  84 ++++++++++++
>  drivers/gpu/drm/virtio/virtgpu_gem_shrinker.c | 124 ++++++++++++++++++
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c        |  37 ++++++
>  drivers/gpu/drm/virtio/virtgpu_kms.c          |  17 ++-
>  drivers/gpu/drm/virtio/virtgpu_object.c       |  63 +++------
>  drivers/gpu/drm/virtio/virtgpu_plane.c        |  17 ++-
>  drivers/gpu/drm/virtio/virtgpu_vq.c           |  30 +++--
>  include/uapi/drm/virtgpu_drm.h                |  14 ++
>  11 files changed, 373 insertions(+), 69 deletions(-)
>  create mode 100644 drivers/gpu/drm/virtio/virtgpu_gem_shrinker.c
>
> --
> 2.35.1
>
