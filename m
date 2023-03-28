Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 141636CCD98
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 00:40:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC1C10E4B4;
	Tue, 28 Mar 2023 22:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B4210E4B4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 22:40:54 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 f4-20020a9d0384000000b0069fab3f4cafso7254341otf.9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 15:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680043254;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qxcd4sgme6Bo4SoxKNObgmmhx9Tez4jxepBqb6+X46c=;
 b=pPT5I+iR3/kgp15tjer1n/wfCoyDWOUHPnYpJk7/ceAltSLy/K22qkY4wVDjD8wQmr
 IP0kWDoA3b3DQIubfB+Kmq5cK0Tlv+qinDctG4lBb3xh0wONcdmHNv5HdDdHXYyqAset
 cJoTrYZfYCOKj8zmJiTnzkdAYtWnVI7VENYlobCgtSuWe8O99FcDms8LvkClsAyH11EY
 PynrVCJ3KP9xT6HGwFNJ7TRtMT/O34Tz0LUeIrq3LMrkAbunfnHbJn9SnMrw4nob2pzh
 1USUwtRpCiMmW922sxBbVjQdysBcYvPGjrOKvEztnyNBcCR40xLfSJ0c+4NJNTNyzak+
 e1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680043254;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qxcd4sgme6Bo4SoxKNObgmmhx9Tez4jxepBqb6+X46c=;
 b=PH42NyA1EbX1wY9jCudxxHUbWIoGyv+/B2crfKl12krZgBg0H18KG+TADUPAJuk9uh
 ogutVi6/jrnZroUFZ2Wv0t47gfX0VZDKLIOKq/I13SqfPsorN/GM+cgf8vqIiYAfzw8p
 cSDcRdeiIJFJ7ySKZ+rCG2p7CkE2M4opoi5F3OqoA8K1LsHQGeMp+QmBdt04MSeBFpeI
 gLRmoVg9y3hrzPUA8xqEEbKejU0WJ2xSuWhinkEfTGr6xrcj45Pkk4DgfwbWrK0M0FSW
 nnBkOvpuGbv1PKO/HGgWXFVtCXkyuiKj6wn7ahiEvNOqP1jBa1IEKakfljlblBRIS0ZM
 pFUQ==
X-Gm-Message-State: AO0yUKXvfYgbZcwymJKqcLd/QvvKIi5c9bbMftkvjlVDAoiv68BP74kS
 OMZvlzhJrJqwycNryhLNQ7dY5xsysATCJ8c1nHUOv0nq
X-Google-Smtp-Source: AK7set9YaXISiZo+AYZxO37Flyf8eqfzhVjUjkODBzLXO9RrzD+PXnI3VxGGnkTALqoRjpyrwkSENMLsMB+Rff6O+cQ=
X-Received: by 2002:a9d:7301:0:b0:69f:abec:b057 with SMTP id
 e1-20020a9d7301000000b0069fabecb057mr5656784otk.7.1680043253802; Tue, 28 Mar
 2023 15:40:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAF6AEGvoP9_FERdL6U8S2O-BVt-oAUgAytbE6RvygsoAOwOHvw@mail.gmail.com>
 <ZCMhhToEdWVAEtBh@phenom.ffwll.local>
In-Reply-To: <ZCMhhToEdWVAEtBh@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 28 Mar 2023 15:40:42 -0700
Message-ID: <CAF6AEGu6gyPeo9kwxEYVHb9L=iPpitd6E3g3dXv_=okviSS6HQ@mail.gmail.com>
Subject: Re: [pull] drm: dma-fence-deadline-core for v6.4
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 28, 2023 at 10:19=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch> wr=
ote:
>
> On Sat, Mar 25, 2023 at 11:24:56AM -0700, Rob Clark wrote:
> > Hi Dave and Daniel,
> >
> > Here is the series for dma-fence deadline hint, without driver
> > specific patches, with the intent that it can be merged into drm-next
> > as well as -driver next trees to enable landing driver specific
> > support through their corresponding -next trees.
> >
> > The following changes since commit eeac8ede17557680855031c6f305ece2378a=
f326:
> >
> >   Linux 6.3-rc2 (2023-03-12 16:36:44 -0700)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.freedesktop.org/drm/msm.git tags/dma-fence-deadline-co=
re
> >
> > for you to fetch changes up to 0bcc8f52a8d9d1f9cd5af7f88c6599a89e64284a=
:
> >
> >   drm/atomic-helper: Set fence deadline for vblank (2023-03-25 10:55:08=
 -0700)
>
> Ok apparently there's only igts for the sync_file uabi and the only only
> userspace for syncobj is the mesa mr that is still under discussion :-/
>
> Yes I know there's a clearly established need for something like this, bu=
t
> also in drm we don't merge conjectured uabi. Especially with tricky stuff
> that's meant to improve best effort performance/tuning problems, where yo=
u
> really have to benchmark the entire thing and make sure you didn't screw
> up some interaction.
>
> To make sure this isn't stuck another full cycle, is there a way to wittl=
e
> this just down to the kms atomic flip boosting parts? That way we could a=
t
> least start landing the core&driver bits ...

I went ahead and sent a PR without the uapi bits.. IMHO I don't think
that any further discussion on the MR would change the uapi, but I
guess it doesn't hurt giving it some extra days while unblocking the
driver parts.  I still kinda hope that we can land at least the
syncobj UAPI this cycle.

BR,
-R

> -Daniel
>
> >
> > ----------------------------------------------------------------
> > Immutable branch with dma-fence deadline hint support between drm-next
> > and driver -next trees.
> >
> > ----------------------------------------------------------------
> > Rob Clark (11):
> >       dma-buf/dma-fence: Add deadline awareness
> >       dma-buf/fence-array: Add fence deadline support
> >       dma-buf/fence-chain: Add fence deadline support
> >       dma-buf/dma-resv: Add a way to set fence deadline
> >       dma-buf/sync_file: Surface sync-file uABI
> >       dma-buf/sync_file: Add SET_DEADLINE ioctl
> >       dma-buf/sw_sync: Add fence deadline support
> >       drm/scheduler: Add fence deadline support
> >       drm/syncobj: Add deadline support for syncobj waits
> >       drm/vblank: Add helper to get next vblank time
> >       drm/atomic-helper: Set fence deadline for vblank
> >
> >  Documentation/driver-api/dma-buf.rst    | 16 ++++++-
> >  drivers/dma-buf/dma-fence-array.c       | 11 +++++
> >  drivers/dma-buf/dma-fence-chain.c       | 12 +++++
> >  drivers/dma-buf/dma-fence.c             | 60 ++++++++++++++++++++++++
> >  drivers/dma-buf/dma-resv.c              | 22 +++++++++
> >  drivers/dma-buf/sw_sync.c               | 81 +++++++++++++++++++++++++=
++++++++
> >  drivers/dma-buf/sync_debug.h            |  2 +
> >  drivers/dma-buf/sync_file.c             | 19 ++++++++
> >  drivers/gpu/drm/drm_atomic_helper.c     | 37 +++++++++++++++
> >  drivers/gpu/drm/drm_syncobj.c           | 64 ++++++++++++++++++++-----=
-
> >  drivers/gpu/drm/drm_vblank.c            | 53 +++++++++++++++++----
> >  drivers/gpu/drm/scheduler/sched_fence.c | 46 +++++++++++++++++++
> >  drivers/gpu/drm/scheduler/sched_main.c  |  2 +-
> >  include/drm/drm_vblank.h                |  1 +
> >  include/drm/gpu_scheduler.h             | 17 +++++++
> >  include/linux/dma-fence.h               | 22 +++++++++
> >  include/linux/dma-resv.h                |  2 +
> >  include/uapi/drm/drm.h                  | 17 +++++++
> >  include/uapi/linux/sync_file.h          | 59 +++++++++++++++---------
> >  19 files changed, 496 insertions(+), 47 deletions(-)
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
