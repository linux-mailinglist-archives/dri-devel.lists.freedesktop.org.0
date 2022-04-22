Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 720A050C0E7
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 23:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C919310E694;
	Fri, 22 Apr 2022 21:05:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3108310E694
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 21:05:05 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 r187-20020a1c44c4000000b0038ccb70e239so8730245wma.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 14:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gmRkt5N52LVAcW5jIpeF1Nn5yhhAyoF29FUFsd01Fns=;
 b=brYIpV1+gbZnACdgtobiaHYB0nSPaEQY0ScB0C1CEeIsPotvLvC9d7oCAEPCZgA89C
 uxr4XWWt08JrUjRW2taPLwIBI0l08LIQ+tdBDD3Dcvl2N+LHeNiiWLLSiJ/2nAXSmxbW
 5V6Qt8AQIHi92IOyOLysC7CDhQRUu7lZDi7hKcHVobTK+mt9yg3GXLl1gnF6CUN511k8
 2dACgkZB0zdoeD223DTUdfjYRFediBrQ/WkFCx20AwAddSmuDegIlAyVpQMaA+YkJeVl
 i9/jYTuvmZKVUkEHz5l8/VZdcoi46D7lI/zvaAmJgrcM3qXnC1vMcqvjxQtND51sdUpm
 7npA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gmRkt5N52LVAcW5jIpeF1Nn5yhhAyoF29FUFsd01Fns=;
 b=2RY18HllyQGGQ51ipQz2KhtC0TOuovQ7a4CpMf1+ozZv+VkPOz/PD21YtDvQ/Jp3Zp
 w+KqN3FGw13hrqlelGNS/83jbiIfjfUVb4sFUc7QJBRFz2xUeA0RbBEbBCyl03GijIOn
 kqMaRjZ2g2P8SQX3Bft0rBGAdF4x8QNp34GBhaJcRXdmBC6kL+L+nSnnkGABL8mO7nFu
 J9YHMUaeZ0OZU5pg4RD3YUZ9KcPT6le1J1jMqgVk9KeqNVbGXescfV0nKF0M/RzrnPvd
 ZWHhnXEcXYA57p8NN6WniEA7ZFkWOqnWefrsiokxNm6N4HrTefMMamAAjzqKFe6aF+jA
 AOuw==
X-Gm-Message-State: AOAM533/hrY1ckBRw9bAEAkJEHZg0ukeGjbaobBRGxU8OgpM5HSHXpgR
 hcmIWqCHrlQ65Auu8GBelQgFVd9CNFaFfXNVvHM=
X-Google-Smtp-Source: ABdhPJwKs/6J6K59SHxPCUJVmRs3c/Et02MftfleiTfkZ7qpvT/EN+91VaTZjZn+ojcG4yAIgaCF1NrTLKUqpfpuOBY=
X-Received: by 2002:a05:600c:3011:b0:38e:ba57:8b79 with SMTP id
 j17-20020a05600c301100b0038eba578b79mr14709846wmh.26.1650661503393; Fri, 22
 Apr 2022 14:05:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220405173918.1000846-1-robdclark@gmail.com>
 <CAPaKu7Tur-_Kf3Lb9U=98Yr_08onxPHNKTPh2anHU6zLPhr5ZQ@mail.gmail.com>
In-Reply-To: <CAPaKu7Tur-_Kf3Lb9U=98Yr_08onxPHNKTPh2anHU6zLPhr5ZQ@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 22 Apr 2022 14:06:08 -0700
Message-ID: <CAF6AEGsUVDbqYOeDBXBOySfs+7ftVf5_86CiFGOLfY9fmQuEVQ@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: Add execbuf flag to request no fence-event
To: Chia-I Wu <olvaffe@gmail.com>
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

On Tue, Apr 5, 2022 at 10:57 AM Chia-I Wu <olvaffe@gmail.com> wrote:
>
> On Tue, Apr 5, 2022 at 10:38 AM Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > It would have been cleaner to have a flag to *request* the fence event.
> > But that ship has sailed.  So add a flag so that userspace which doesn't
> > care about the events can opt-out.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
>
> Might want to wait for Gurchetan to chime in as he added the mechanism.

It turns out this patch is unnecessary.. I can simply not set
VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK instead

so self-nak for this patch ;-)

BR,
-R

> > ---
> >  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 8 +++++---
> >  include/uapi/drm/virtgpu_drm.h         | 2 ++
> >  2 files changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> > index 3a8078f2ee27..09f1aa263f91 100644
> > --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> > +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> > @@ -225,9 +225,11 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
> >                 goto out_unresv;
> >         }
> >
> > -       ret = virtio_gpu_fence_event_create(dev, file, out_fence, ring_idx);
> > -       if (ret)
> > -               goto out_unresv;
> > +       if (!(exbuf->flags & VIRTGPU_EXECBUF_NO_EVENT)) {
> > +               ret = virtio_gpu_fence_event_create(dev, file, out_fence, ring_idx);
> > +               if (ret)
> > +                       goto out_unresv;
> > +       }
> >
> >         if (out_fence_fd >= 0) {
> >                 sync_file = sync_file_create(&out_fence->f);
> > diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
> > index 0512fde5e697..d06cac3407cc 100644
> > --- a/include/uapi/drm/virtgpu_drm.h
> > +++ b/include/uapi/drm/virtgpu_drm.h
> > @@ -52,10 +52,12 @@ extern "C" {
> >  #define VIRTGPU_EXECBUF_FENCE_FD_IN    0x01
> >  #define VIRTGPU_EXECBUF_FENCE_FD_OUT   0x02
> >  #define VIRTGPU_EXECBUF_RING_IDX       0x04
> > +#define VIRTGPU_EXECBUF_NO_EVENT       0x08
> >  #define VIRTGPU_EXECBUF_FLAGS  (\
> >                 VIRTGPU_EXECBUF_FENCE_FD_IN |\
> >                 VIRTGPU_EXECBUF_FENCE_FD_OUT |\
> >                 VIRTGPU_EXECBUF_RING_IDX |\
> > +               VIRTGPU_EXECBUF_NO_EVENT |\
> >                 0)
> >
> >  struct drm_virtgpu_map {
> > --
> > 2.35.1
> >
