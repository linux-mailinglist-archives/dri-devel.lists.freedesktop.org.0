Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E94587B1046
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 03:13:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDDA510E19F;
	Thu, 28 Sep 2023 01:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8355910E09B;
 Thu, 28 Sep 2023 01:12:57 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5046bf37ec1so10710275e87.1; 
 Wed, 27 Sep 2023 18:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695863575; x=1696468375; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QHGxG+9ZXUN0gUfg6eH9YeYCPJPDBENkMMk2+KZM+m4=;
 b=XpXNkUw7sXd+DG4X95iZW8wxFJST8PxGiw5ov6xMohLy8t10SKj0u6uW3qwRcRAteC
 cP2QWmx6ssJpE8fr2B4N+T+l7gft8J43gh31DDXuZRSrI9tNV8RviK2PCEXlaYsfC12v
 wrAwGt9uDQb9MAnYADTSi6sIMKTRkE9F3eTNooi3MJsNm+ublJ6QasSFi91HCn02+3MD
 jMsoYH41gSH1Jy6I28FQRP08xuPp85VD6uQbCN1oWYDykrJog37oAcOc727lOofb+kAc
 xpwePDGP/s7byV90qdbPJycOHjbvBV9atDTw6ZoJFV3efKt/HWsjEdi7ogLzXUaXDfQL
 kOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695863575; x=1696468375;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QHGxG+9ZXUN0gUfg6eH9YeYCPJPDBENkMMk2+KZM+m4=;
 b=TQYSyz22TCCWFO0ValmLUORE3a8cHzqNgre+OByUZEiZmsYol3VE9NfWpQ+v09wRq6
 bh4fGwg4+CY8iZ82oXpXhPR0YoCjmq3BdyGWyo8i4ZZ5R1R+Kx3MYKyFrRy9A59FNQw9
 VGAnvTZNjU/4HnXKqCc3xxBoHe+4UzxXYQIBvmQxaBd5SBgS8ncwNxuC0E3IJZ0SfT+w
 JRIJYefAmV4aBHL6tU7vq2jblPzWsEauIcQkSjS6638TetsWx6lbPeoExZRvGQJyWPEk
 BqLMRDUM7UDKDY1HHPh8n4BQDdtPZiHA4CWk+PSd/u3DrjIWfV7pIQLCO9ujpfaFA2YD
 BzLQ==
X-Gm-Message-State: AOJu0YygLfzQA9qB8jUX+J1PM7fmUJk/vgzcdGn0U2XdpA5R8ntU383h
 QHWPrZjJXsLlut07CFhz0Yx7myiFyUtWmWqlPUk=
X-Google-Smtp-Source: AGHT+IEgEpJn0XtBt3HjCgcnkDCy2PwqyGVEzUXJdK11tlfwzOyascycwOADAIhDXaOt/gcOfLbbztp2dNowUU8ZnmA=
X-Received: by 2002:a19:6409:0:b0:4fb:8948:2b28 with SMTP id
 y9-20020a196409000000b004fb89482b28mr2622279lfb.63.1695863575103; Wed, 27 Sep
 2023 18:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230927012303.23525-1-dakr@redhat.com>
 <20230927012303.23525-3-dakr@redhat.com>
 <75bef0bd769c139b647335ba2e3c341928442740.camel@collabora.com>
In-Reply-To: <75bef0bd769c139b647335ba2e3c341928442740.camel@collabora.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 28 Sep 2023 11:12:11 +1000
Message-ID: <CAPM=9twT+Kvmyv2GxnZ=Y6FPnwc9xzTcWyeykL0rjGmOu4FONA@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/nouveau: exec: report max pushs through getparam
To: Faith Ekstrand <faith.ekstrand@collabora.com>
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
Cc: nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 dri-devel@lists.freedesktop.org, kherbst@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 28 Sept 2023 at 07:55, Faith Ekstrand
<faith.ekstrand@collabora.com> wrote:
>
> On Wed, 2023-09-27 at 03:22 +0200, Danilo Krummrich wrote:
> > Report the maximum number of IBs that can be pushed with a single
> > DRM_IOCTL_NOUVEAU_EXEC through DRM_IOCTL_NOUVEAU_GETPARAM.
> >
> > While the maximum number of IBs per ring might vary between chipsets,
> > the kernel will make sure that userspace can only push a fraction of
> > the
> > maximum number of IBs per ring per job, such that we avoid a
> > situation
> > where there's only a single job occupying the ring, which could
> > potentially lead to the ring run dry.
> >
> > Using DRM_IOCTL_NOUVEAU_GETPARAM to report the maximum number of IBs
> > that can be pushed with a single DRM_IOCTL_NOUVEAU_EXEC implies that
> > all channels of a given device have the same ring size.
>
> There's a bunch of nouveau kernel details I don't know here but the
> interface looks good and I prefer it to a #define in the header.
>
> Acked-by: Faith Ekstrand <faith.ekstrand@collabora.com>

For the series

Reviewed-by: Dave Airlie <airlied@redhat.com>

we should probably land this in drm-misc-fixes, since it would be good
to have in 6.6

Dave.

>
>
> > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_abi16.c | 19 +++++++++++++++++++
> >  drivers/gpu/drm/nouveau/nouveau_chan.c  |  2 +-
> >  drivers/gpu/drm/nouveau/nouveau_dma.h   |  3 +++
> >  drivers/gpu/drm/nouveau/nouveau_exec.c  |  7 ++++---
> >  drivers/gpu/drm/nouveau/nouveau_exec.h  |  5 +++++
> >  include/uapi/drm/nouveau_drm.h          | 10 ++++++++++
> >  6 files changed, 42 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> > b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> > index 30afbec9e3b1..1a198689b391 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> > @@ -31,6 +31,7 @@
> >
> >  #include "nouveau_drv.h"
> >  #include "nouveau_dma.h"
> > +#include "nouveau_exec.h"
> >  #include "nouveau_gem.h"
> >  #include "nouveau_chan.h"
> >  #include "nouveau_abi16.h"
> > @@ -183,6 +184,20 @@ nouveau_abi16_fini(struct nouveau_abi16 *abi16)
> >         cli->abi16 = NULL;
> >  }
> >
> > +static inline unsigned int
> > +getparam_dma_ib_max(struct nvif_device *device)
> > +{
> > +       const struct nvif_mclass dmas[] = {
> > +               { NV03_CHANNEL_DMA, 0 },
> > +               { NV10_CHANNEL_DMA, 0 },
> > +               { NV17_CHANNEL_DMA, 0 },
> > +               { NV40_CHANNEL_DMA, 0 },
> > +               {}
> > +       };
> > +
> > +       return nvif_mclass(&device->object, dmas) < 0 ?
> > NV50_DMA_IB_MAX : 0;
> > +}
> > +
> >  int
> >  nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
> >  {
> > @@ -247,6 +262,10 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
> >         case NOUVEAU_GETPARAM_GRAPH_UNITS:
> >                 getparam->value = nvkm_gr_units(gr);
> >                 break;
> > +       case NOUVEAU_GETPARAM_EXEC_PUSH_MAX:
> > +               getparam->value = getparam_dma_ib_max(device) /
> > +                                 NOUVEAU_EXEC_PUSH_MAX_DIV;
> > +               break;
> >         default:
> >                 NV_PRINTK(dbg, cli, "unknown parameter %lld\n",
> > getparam->param);
> >                 return -EINVAL;
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c
> > b/drivers/gpu/drm/nouveau/nouveau_chan.c
> > index ac56f4689ee3..c3c2ab887978 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_chan.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
> > @@ -456,7 +456,7 @@ nouveau_channel_init(struct nouveau_channel
> > *chan, u32 vram, u32 gart)
> >                 chan->user_get = 0x44;
> >                 chan->user_get_hi = 0x60;
> >                 chan->dma.ib_base =  0x10000 / 4;
> > -               chan->dma.ib_max  = (0x02000 / 8) - 1;
> > +               chan->dma.ib_max  = NV50_DMA_IB_MAX;
> >                 chan->dma.ib_put  = 0;
> >                 chan->dma.ib_free = chan->dma.ib_max - chan-
> > >dma.ib_put;
> >                 chan->dma.max = chan->dma.ib_base;
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.h
> > b/drivers/gpu/drm/nouveau/nouveau_dma.h
> > index 1744d95b233e..c52cda82353e 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_dma.h
> > +++ b/drivers/gpu/drm/nouveau/nouveau_dma.h
> > @@ -49,6 +49,9 @@ void nv50_dma_push(struct nouveau_channel *, u64
> > addr, u32 length,
> >  /* Maximum push buffer size. */
> >  #define NV50_DMA_PUSH_MAX_LENGTH 0x7fffff
> >
> > +/* Maximum IBs per ring. */
> > +#define NV50_DMA_IB_MAX ((0x02000 / 8) - 1)
> > +
> >  /* Object handles - for stuff that's doesn't use handle == oclass.
> > */
> >  enum {
> >         NvDmaFB         = 0x80000002,
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c
> > b/drivers/gpu/drm/nouveau/nouveau_exec.c
> > index ba6913a3efb6..5b5c4a77b8e6 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_exec.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
> > @@ -346,7 +346,7 @@ nouveau_exec_ioctl_exec(struct drm_device *dev,
> >         struct nouveau_channel *chan = NULL;
> >         struct nouveau_exec_job_args args = {};
> >         struct drm_nouveau_exec *req = data;
> > -       int ret = 0;
> > +       int push_max, ret = 0;
> >
> >         if (unlikely(!abi16))
> >                 return -ENOMEM;
> > @@ -371,9 +371,10 @@ nouveau_exec_ioctl_exec(struct drm_device *dev,
> >         if (!chan->dma.ib_max)
> >                 return nouveau_abi16_put(abi16, -ENOSYS);
> >
> > -       if (unlikely(req->push_count > NOUVEAU_GEM_MAX_PUSH)) {
> > +       push_max = chan->dma.ib_max / NOUVEAU_EXEC_PUSH_MAX_DIV;
> > +       if (unlikely(req->push_count > push_max)) {
> >                 NV_PRINTK(err, cli, "pushbuf push count exceeds
> > limit: %d max %d\n",
> > -                        req->push_count, NOUVEAU_GEM_MAX_PUSH);
> > +                         req->push_count, push_max);
> >                 return nouveau_abi16_put(abi16, -EINVAL);
> >         }
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.h
> > b/drivers/gpu/drm/nouveau/nouveau_exec.h
> > index b815de2428f3..c6270452e4b5 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_exec.h
> > +++ b/drivers/gpu/drm/nouveau/nouveau_exec.h
> > @@ -6,6 +6,11 @@
> >  #include "nouveau_drv.h"
> >  #include "nouveau_sched.h"
> >
> > +/* Divider to limit the number of IBs per job to half the size of
> > the ring in
> > + * order to avoid the ring running dry between submissions.
> > + */
> > +#define NOUVEAU_EXEC_PUSH_MAX_DIV 2
> > +
> >  struct nouveau_exec_job_args {
> >         struct drm_file *file_priv;
> >         struct nouveau_sched_entity *sched_entity;
> > diff --git a/include/uapi/drm/nouveau_drm.h
> > b/include/uapi/drm/nouveau_drm.h
> > index 8d7402c13e56..eaf9f248619f 100644
> > --- a/include/uapi/drm/nouveau_drm.h
> > +++ b/include/uapi/drm/nouveau_drm.h
> > @@ -44,6 +44,16 @@ extern "C" {
> >  #define NOUVEAU_GETPARAM_PTIMER_TIME     14
> >  #define NOUVEAU_GETPARAM_HAS_BO_USAGE    15
> >  #define NOUVEAU_GETPARAM_HAS_PAGEFLIP    16
> > +
> > +/**
> > + * @NOUVEAU_GETPARAM_EXEC_PUSH_MAX
> > + *
> > + * Query the maximum amount of IBs that can be pushed through a
> > single
> > + * &drm_nouveau_exec structure and hence a single
> > &DRM_IOCTL_NOUVEAU_EXEC
> > + * ioctl().
> > + */
> > +#define NOUVEAU_GETPARAM_EXEC_PUSH_MAX   17
> > +
> >  struct drm_nouveau_getparam {
> >         __u64 param;
> >         __u64 value;
>
