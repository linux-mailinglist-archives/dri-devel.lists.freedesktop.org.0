Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 846E14B5A8C
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 20:29:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F9DB10E2BE;
	Mon, 14 Feb 2022 19:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C143110E2BE
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 19:29:32 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id y6so49265880ybc.5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 11:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9iLzCF2TaMCSxVJ++G7B9k6oyEfu4Hb24dWcp9NavGo=;
 b=bvMGtJIya6i3kldlZ68PIkQqYQHrWh9etw576kRgvqubMe8pOdz7mPqNNyEWu0qYpu
 K2+jd6xSBx5ppv4DQhtAnJ/C1/ar+hoh3j4AET1ped77vG9F4QpStWrR5C/ynxDK3vKN
 F4ftSIe8zSlM/Ns0STbrln5QJiVtN8Mb1FflduG9ZT54+xcqp70wfp9WWIW2Zk6aDtuu
 Djv4CpRkBWIv6K7ZeB7+p1MAM8FavXkccQBC2frvBkJ2JfvUDXYUQVZoWaiMCLK08wlH
 BGwhSfln6q5TY9QJ0CXJOGeU35akaI0qKxsYbaroT2gei4kFJSaQtHAN9gq7j5k3cA9G
 1Q1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9iLzCF2TaMCSxVJ++G7B9k6oyEfu4Hb24dWcp9NavGo=;
 b=BR1uuZwXh/tiLSl78Se9yqUIBtUVH2xBrPZJ0/3sDHr20Os+zuqL1Vl/WePfQkqbQG
 dzSaXXCycbtztSNd4ht+DS1OQWCgt+b8Ldk/5ByCNTOnb+CtV5RtTchBELEzKoeLguKA
 +Oi1Db2xlDS1WoV1Ks8Oj6wyS4RgQHZ7fGhvr8TQEJwEL1f7MfKPi17tRs376e2XkLyp
 By5rZLqkpCwh4inVXiZVWyIdv8wln8tz8Q8JhUDIhViRfjA31tG9oAqH1QR0i71DFepT
 GrRfV8MsHzWYPsNve6tIIxOS6yGomASLHix2ZYPRAnHHUh824DoMSOW9oKbrYc8GaMUF
 21ng==
X-Gm-Message-State: AOAM530/P4mmoyczLqB/bqG7t5+hfqtusR8Phq/US13OknaUP1MphMgd
 Cv5HOOyzycG1Ppkcdj59+SGpOZYigdr7XhBxs9uY+A==
X-Google-Smtp-Source: ABdhPJyWwIYYnlk3ZSzKkARKSenDfxGIdF7NYMwdRVcMXb2jVKuNZSwS8LN5JTVoMgWsqXP9by8zlQbqgPKPiLNFFWE=
X-Received: by 2002:a25:6a55:: with SMTP id f82mr574637ybc.1.1644866971626;
 Mon, 14 Feb 2022 11:29:31 -0800 (PST)
MIME-Version: 1.0
References: <20220211161831.3493782-1-tjmercier@google.com>
 <20220211161831.3493782-7-tjmercier@google.com> <Ygdfe3XSvN8iFuUc@kroah.com>
 <CAHRSSEwoJ67Sr_=gtSaP91cbpjJjZdOo57cfAhv3r-ye0da7PA@mail.gmail.com>
In-Reply-To: <CAHRSSEwoJ67Sr_=gtSaP91cbpjJjZdOo57cfAhv3r-ye0da7PA@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 14 Feb 2022 11:29:20 -0800
Message-ID: <CAJuCfpHf=Ewm0e9kguY3MEGVHU_cyviVXByi0oQtq7kTtOOD=A@mail.gmail.com>
Subject: Re: [RFC v2 6/6] android: binder: Add a buffer flag to relinquish
 ownership of fds
To: Todd Kjos <tkjos@google.com>
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
Cc: Zefan Li <lizefan.x@bytedance.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Kalesh Singh <kaleshsingh@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Kenny.Ho@amd.com,
 Jonathan Corbet <corbet@lwn.net>, Laura Abbott <labbott@redhat.com>,
 linux-media <linux-media@vger.kernel.org>, Todd Kjos <tkjos@android.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Tejun Heo <tj@kernel.org>, cgroups mailinglist <cgroups@vger.kernel.org>,
 Martijn Coenen <maco@android.com>, "T.J. Mercier" <tjmercier@google.com>,
 Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Hridya Valsaraju <hridya@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 14, 2022 at 10:33 AM Todd Kjos <tkjos@google.com> wrote:
>
> On Fri, Feb 11, 2022 at 11:19 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Fri, Feb 11, 2022 at 04:18:29PM +0000, T.J. Mercier wrote:
>
> Title: "android: binder: Add a buffer flag to relinquish ownership of fds=
"
>
> Please drop the "android:" from the title.
>
> > > This patch introduces a buffer flag BINDER_BUFFER_FLAG_SENDER_NO_NEED
> > > that a process sending an fd array to another process over binder IPC
> > > can set to relinquish ownership of the fds being sent for memory
> > > accounting purposes. If the flag is found to be set during the fd arr=
ay
> > > translation and the fd is for a DMA-BUF, the buffer is uncharged from
> > > the sender's cgroup and charged to the receiving process's cgroup
> > > instead.
> > >
> > > It is up to the sending process to ensure that it closes the fds
> > > regardless of whether the transfer failed or succeeded.
> > >
> > > Most graphics shared memory allocations in Android are done by the
> > > graphics allocator HAL process. On requests from clients, the HAL pro=
cess
> > > allocates memory and sends the fds to the clients over binder IPC.
> > > The graphics allocator HAL will not retain any references to the
> > > buffers. When the HAL sets the BINDER_BUFFER_FLAG_SENDER_NO_NEED for =
fd
> > > arrays holding DMA-BUF fds, the gpu cgroup controller will be able to
> > > correctly charge the buffers to the client processes instead of the
> > > graphics allocator HAL.
> > >
> > > From: Hridya Valsaraju <hridya@google.com>
> > > Signed-off-by: Hridya Valsaraju <hridya@google.com>
> > > Co-developed-by: T.J. Mercier <tjmercier@google.com>
> > > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > > ---
> > > changes in v2
> > > - Move dma-buf cgroup charge transfer from a dma_buf_op defined by ev=
ery
> > > heap to a single dma-buf function for all heaps per Daniel Vetter and
> > > Christian K=C3=B6nig.
> > >
> > >  drivers/android/binder.c            | 26 ++++++++++++++++++++++++++
> > >  include/uapi/linux/android/binder.h |  1 +
> > >  2 files changed, 27 insertions(+)
> > >
> > > diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> > > index 8351c5638880..f50d88ded188 100644
> > > --- a/drivers/android/binder.c
> > > +++ b/drivers/android/binder.c
> > > @@ -42,6 +42,7 @@
> > >
> > >  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > >
> > > +#include <linux/dma-buf.h>
> > >  #include <linux/fdtable.h>
> > >  #include <linux/file.h>
> > >  #include <linux/freezer.h>
> > > @@ -2482,8 +2483,10 @@ static int binder_translate_fd_array(struct li=
st_head *pf_head,
> > >  {
> > >       binder_size_t fdi, fd_buf_size;
> > >       binder_size_t fda_offset;
> > > +     bool transfer_gpu_charge =3D false;
> > >       const void __user *sender_ufda_base;
> > >       struct binder_proc *proc =3D thread->proc;
> > > +     struct binder_proc *target_proc =3D t->to_proc;
> > >       int ret;
> > >
> > >       fd_buf_size =3D sizeof(u32) * fda->num_fds;
> > > @@ -2521,8 +2524,15 @@ static int binder_translate_fd_array(struct li=
st_head *pf_head,
> > >       if (ret)
> > >               return ret;
> > >
> > > +     if (IS_ENABLED(CONFIG_CGROUP_GPU) &&
> > > +             parent->flags & BINDER_BUFFER_FLAG_SENDER_NO_NEED)
> > > +             transfer_gpu_charge =3D true;
> > > +
> > >       for (fdi =3D 0; fdi < fda->num_fds; fdi++) {
> > >               u32 fd;
> > > +             struct dma_buf *dmabuf;
> > > +             struct gpucg *gpucg;
> > > +
> > >               binder_size_t offset =3D fda_offset + fdi * sizeof(fd);
> > >               binder_size_t sender_uoffset =3D fdi * sizeof(fd);
> > >
> > > @@ -2532,6 +2542,22 @@ static int binder_translate_fd_array(struct li=
st_head *pf_head,
> > >                                                 in_reply_to);
> > >               if (ret)
> > >                       return ret > 0 ? -EINVAL : ret;
> > > +
> > > +             if (!transfer_gpu_charge)
> > > +                     continue;
> > > +
> > > +             dmabuf =3D dma_buf_get(fd);
> > > +             if (IS_ERR(dmabuf))
> > > +                     continue;
> > > +
> > > +             gpucg =3D gpucg_get(target_proc->tsk);
> > > +             ret =3D dma_buf_charge_transfer(dmabuf, gpucg);
> > > +             if (ret) {
> > > +                     pr_warn("%d:%d Unable to transfer DMA-BUF fd ch=
arge to %d",
> > > +                             proc->pid, thread->pid, target_proc->pi=
d);
> > > +                     gpucg_put(gpucg);
> > > +             }
> > > +             dma_buf_put(dmabuf);
>
> Since we are creating a new gpu cgroup abstraction, couldn't this
> "transfer" be done in userspace by the target instead of in the kernel
> driver? Then this patch would reduce to just a flag on the buffer
> object.

Are you suggesting to have a userspace accessible cgroup interface for
transferring buffer charges and the target process to use that
interface for requesting the buffer to be charged to its cgroup?
I'm worried about the case when the target process does not request
the transfer after receiving the buffer with this flag set. The charge
would stay with the wrong process and accounting will be invalid.

Technically, since the proposed cgroup supports charge transfer from
the very beginning, the userspace can check if the cgroup is mounted
and if so then it knows this feature is supported.

> This also solves the issue that Greg brought up about
> userspace needing to know whether the kernel implements this feature
> (older kernel running with newer userspace). I think we could just
> reserve some flags for userspace to use (and since those flags are
> "reserved" for older kernels, this would enable this feature even for
> old kernels)
>
> > >       }
> > >       return 0;
> > >  }
> > > diff --git a/include/uapi/linux/android/binder.h b/include/uapi/linux=
/android/binder.h
> > > index 3246f2c74696..169fd5069a1a 100644
> > > --- a/include/uapi/linux/android/binder.h
> > > +++ b/include/uapi/linux/android/binder.h
> > > @@ -137,6 +137,7 @@ struct binder_buffer_object {
> > >
> > >  enum {
> > >       BINDER_BUFFER_FLAG_HAS_PARENT =3D 0x01,
> > > +     BINDER_BUFFER_FLAG_SENDER_NO_NEED =3D 0x02,
> > >  };
> > >
> > >  /* struct binder_fd_array_object - object describing an array of fds=
 in a buffer
> > > --
> > > 2.35.1.265.g69c8d7142f-goog
> > >
> >
> > How does userspace know that binder supports this new flag?  And where
> > is the userspace test for this new feature?  Isn't there a binder test
> > framework somewhere?
> >
> > thanks,
> >
> > greg k-h
