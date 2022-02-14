Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 266564B5D94
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 23:26:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6343B10E22B;
	Mon, 14 Feb 2022 22:26:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17EBB10E326
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 22:26:00 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id lw4so9499553ejb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 14:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IHISBmUOI/ikE6WItRpq9TFUbX44lb92b2lXd2BONMg=;
 b=kXzDIbeon23MHLMt55FkUQMNMzpbUwjF4pGEHQVVR8kxY9f8bNkaLn7jE0kbUtbn3L
 b9kl4UwC8flsLgF3qVMkSmkvmdF1Jt9Kjef1jBBpf5/Zf+a+E7tm2ei87Qd5NbmIKrOF
 N82gD75TFZH0mtC5IYIsG8oT11N0ErdMbUQ+vDx4iQdPDduvByEYqq0+N85F+cKyEzjH
 qAJ9CPKDgzdEdqLPAEum3T8FIlDiMJQUosPgAeySYE6owzXoDc9a5wNuN0Re5wGSB2JK
 +J/lWvtMVPoSlQn5X6RkXil8/6Lfo9tlft0Vb/pupOfjNdjHeBjWfIslcuL+R2HeH5L/
 d/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IHISBmUOI/ikE6WItRpq9TFUbX44lb92b2lXd2BONMg=;
 b=F/f3XMRdZbIboNtr/HkT1N8qUTBl9TD2oZilTcsP1ZN1R01Z1z2nPGEqkQd5U6TvUy
 IeLcmaJc6BwupyCAA9ToBstvCNOy6oUQU+XbkkDlP409DMYUltn/0P2334l/C2S76Iy8
 tFAZ3V1CDrVB3+PQOwhTlbG11JpXmzh9/HkotvGWPdMxbrVbwT5mYx8+V/Pz5QCBEWdU
 wCftj+1VZe6oph5VTVysJK7RUsWMGR6vFKaPOF5XVEpTvTJqFY83y0dbf7FUclHw9Jyk
 qRtM8nqz/C21eS+69NL54GUcJ9wPzGwknpluHE1usVZcwB7tHr7yOOdd5/uc0zdbNoIR
 hyKA==
X-Gm-Message-State: AOAM531LJdAOnC3NY9ohb4Sbb3+bTGyOZyXPX/7zW0chXOZXv0BlTsYh
 ES0xngTzVdrXg5sffoSVPKJug8YxV3zNyS2ORBukvA==
X-Google-Smtp-Source: ABdhPJzGACGFNq1BPwRwv23eE84sjRC0d54XfeIYewn82JWldVK/PTYDHJp5HG1XHJwLS3IoON1Lvd3AWtka9GIbv0c=
X-Received: by 2002:a17:906:51d6:: with SMTP id
 v22mr734664ejk.446.1644877558320; 
 Mon, 14 Feb 2022 14:25:58 -0800 (PST)
MIME-Version: 1.0
References: <20220211161831.3493782-1-tjmercier@google.com>
 <20220211161831.3493782-7-tjmercier@google.com> <Ygdfe3XSvN8iFuUc@kroah.com>
In-Reply-To: <Ygdfe3XSvN8iFuUc@kroah.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 14 Feb 2022 14:25:47 -0800
Message-ID: <CABdmKX1eKZZ9809uxnzT_Bm+mdNuK2AObLRxyBpdDF3yE76Hrg@mail.gmail.com>
Subject: Re: [RFC v2 6/6] android: binder: Add a buffer flag to relinquish
 ownership of fds
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: Zefan Li <lizefan.x@bytedance.com>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Kalesh Singh <kaleshsingh@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Martijn Coenen <maco@android.com>, Laura Abbott <labbott@redhat.com>,
 linux-media@vger.kernel.org, Todd Kjos <tkjos@android.com>,
 linaro-mm-sig@lists.linaro.org, Tejun Heo <tj@kernel.org>,
 cgroups@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 Christian Brauner <brauner@kernel.org>, Kenny.Ho@amd.com,
 linux-kernel@vger.kernel.org, Liam Mark <lmark@codeaurora.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Johannes Weiner <hannes@cmpxchg.org>,
 Hridya Valsaraju <hridya@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 11, 2022 at 11:19 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Feb 11, 2022 at 04:18:29PM +0000, T.J. Mercier wrote:
> > This patch introduces a buffer flag BINDER_BUFFER_FLAG_SENDER_NO_NEED
> > that a process sending an fd array to another process over binder IPC
> > can set to relinquish ownership of the fds being sent for memory
> > accounting purposes. If the flag is found to be set during the fd array
> > translation and the fd is for a DMA-BUF, the buffer is uncharged from
> > the sender's cgroup and charged to the receiving process's cgroup
> > instead.
> >
> > It is up to the sending process to ensure that it closes the fds
> > regardless of whether the transfer failed or succeeded.
> >
> > Most graphics shared memory allocations in Android are done by the
> > graphics allocator HAL process. On requests from clients, the HAL proce=
ss
> > allocates memory and sends the fds to the clients over binder IPC.
> > The graphics allocator HAL will not retain any references to the
> > buffers. When the HAL sets the BINDER_BUFFER_FLAG_SENDER_NO_NEED for fd
> > arrays holding DMA-BUF fds, the gpu cgroup controller will be able to
> > correctly charge the buffers to the client processes instead of the
> > graphics allocator HAL.
> >
> > From: Hridya Valsaraju <hridya@google.com>
> > Signed-off-by: Hridya Valsaraju <hridya@google.com>
> > Co-developed-by: T.J. Mercier <tjmercier@google.com>
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > ---
> > changes in v2
> > - Move dma-buf cgroup charge transfer from a dma_buf_op defined by ever=
y
> > heap to a single dma-buf function for all heaps per Daniel Vetter and
> > Christian K=C3=B6nig.
> >
> >  drivers/android/binder.c            | 26 ++++++++++++++++++++++++++
> >  include/uapi/linux/android/binder.h |  1 +
> >  2 files changed, 27 insertions(+)
> >
> > diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> > index 8351c5638880..f50d88ded188 100644
> > --- a/drivers/android/binder.c
> > +++ b/drivers/android/binder.c
> > @@ -42,6 +42,7 @@
> >
> >  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> >
> > +#include <linux/dma-buf.h>
> >  #include <linux/fdtable.h>
> >  #include <linux/file.h>
> >  #include <linux/freezer.h>
> > @@ -2482,8 +2483,10 @@ static int binder_translate_fd_array(struct list=
_head *pf_head,
> >  {
> >       binder_size_t fdi, fd_buf_size;
> >       binder_size_t fda_offset;
> > +     bool transfer_gpu_charge =3D false;
> >       const void __user *sender_ufda_base;
> >       struct binder_proc *proc =3D thread->proc;
> > +     struct binder_proc *target_proc =3D t->to_proc;
> >       int ret;
> >
> >       fd_buf_size =3D sizeof(u32) * fda->num_fds;
> > @@ -2521,8 +2524,15 @@ static int binder_translate_fd_array(struct list=
_head *pf_head,
> >       if (ret)
> >               return ret;
> >
> > +     if (IS_ENABLED(CONFIG_CGROUP_GPU) &&
> > +             parent->flags & BINDER_BUFFER_FLAG_SENDER_NO_NEED)
> > +             transfer_gpu_charge =3D true;
> > +
> >       for (fdi =3D 0; fdi < fda->num_fds; fdi++) {
> >               u32 fd;
> > +             struct dma_buf *dmabuf;
> > +             struct gpucg *gpucg;
> > +
> >               binder_size_t offset =3D fda_offset + fdi * sizeof(fd);
> >               binder_size_t sender_uoffset =3D fdi * sizeof(fd);
> >
> > @@ -2532,6 +2542,22 @@ static int binder_translate_fd_array(struct list=
_head *pf_head,
> >                                                 in_reply_to);
> >               if (ret)
> >                       return ret > 0 ? -EINVAL : ret;
> > +
> > +             if (!transfer_gpu_charge)
> > +                     continue;
> > +
> > +             dmabuf =3D dma_buf_get(fd);
> > +             if (IS_ERR(dmabuf))
> > +                     continue;
> > +
> > +             gpucg =3D gpucg_get(target_proc->tsk);
> > +             ret =3D dma_buf_charge_transfer(dmabuf, gpucg);
> > +             if (ret) {
> > +                     pr_warn("%d:%d Unable to transfer DMA-BUF fd char=
ge to %d",
> > +                             proc->pid, thread->pid, target_proc->pid)=
;
> > +                     gpucg_put(gpucg);
> > +             }
> > +             dma_buf_put(dmabuf);
> >       }
> >       return 0;
> >  }
> > diff --git a/include/uapi/linux/android/binder.h b/include/uapi/linux/a=
ndroid/binder.h
> > index 3246f2c74696..169fd5069a1a 100644
> > --- a/include/uapi/linux/android/binder.h
> > +++ b/include/uapi/linux/android/binder.h
> > @@ -137,6 +137,7 @@ struct binder_buffer_object {
> >
> >  enum {
> >       BINDER_BUFFER_FLAG_HAS_PARENT =3D 0x01,
> > +     BINDER_BUFFER_FLAG_SENDER_NO_NEED =3D 0x02,
> >  };
> >
> >  /* struct binder_fd_array_object - object describing an array of fds i=
n a buffer
> > --
> > 2.35.1.265.g69c8d7142f-goog
> >
>
> How does userspace know that binder supports this new flag?

Sorry, I don't completely follow even after Todd's comment. Doesn't
the presence of BINDER_BUFFER_FLAG_SENDER_NO_NEED in the header do
this? So wouldn't userspace need to be compiled against the wrong
kernel headers for there to be a problem? In that case the allocation
would still succeed, but there would be no charge transfer and
unfortunately no error code.

> And where is the userspace test for this new feature?

I tested this on a Pixel after modifying the gralloc implementation to
mark allocated buffers as not used by the sender. This required
setting the BINDER_BUFFER_FLAG_SENDER_NO_NEED in libhwbinder. That
code can be found here:
https://android-review.googlesource.com/c/platform/system/libhwbinder/+/191=
0752/1/Parcel.cpp
https://android-review.googlesource.com/c/platform/system/libhidl/+/1910611=
/

Then by inspecting gpu.memory.current files in sysfs I was able to see
the memory attributed to processes other than the graphics allocator
service. Before this change, several megabytes of memory were
attributed to the graphics allocator service but those buffers are
actually used by other processes like surfaceflinger, the camera, etc.
After the change, the gpu.memory.current amount for the graphics
allocator service was 0 and the charges showed up in the
gpu.memory.current files for those other processes like this:

PID: 764 Process Name: zygote64
system 8192
system-uncached 23191552

PID: 529 Process Name: /system/bin/surfaceflinger
system-uncached 109535232
system 92196864

PID: 530 Process Name:
/vendor/bin/hw/android.hardware.graphics.allocator@4.0-service
system-uncached 0
system 0
sensor_direct_heap 0

PID: 806 Process Name:
/apex/com.google.pixel.camera.hal/bin/hw/android.hardware.camera.provider@2=
.7-service-google
system 1196032

PID: 4608 Process Name: com.google.android.GoogleCamera
system 2408448
system-uncached 38887424
sensor_direct_heap 0

PID: 32102 Process Name: com.google.android.googlequicksearchbox:search
system-uncached 91279360
system 20480

PID: 2758 Process Name: com.google.android.youtube
system-uncached 1662976
system 8192

PID: 2517 Process Name: com.google.android.apps.nexuslauncher
system-uncached 115662848
system 122880

PID: 2066 Process Name: com.android.systemui
system 86016
system-uncached 37957632

>  Isn't there a binder test framework somewhere?

Android has the Vendor Test Suite where automated tests could be added
for this. Is that what you're thinking of?

>
> thanks,
>
> greg k-h
