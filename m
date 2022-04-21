Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D921C50AB38
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 00:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B9AD10E313;
	Thu, 21 Apr 2022 22:09:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3287310E313
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 22:09:38 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id d6so3137137ede.8
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 15:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4vHclEhVo4/x2VW0sNlaZPniEpYxDL00DWLB9IRzX8A=;
 b=ZU7Tnl58qdSGGiOgV4VF4XAQ+zIdQUiEoeLd7SMOZjEw+Uhd4ApqtirQxnqxor3DkJ
 3U9tfd1cqyOyaV8wfHb9OXIL+PtIucjbeDkIqCEYuf/gKyQs5Q0eSQ95J4gIygexu1J8
 HrOAEBw500I+ueHWSxYR8bnYzIlkXt44O+7/QsS9rx3GAF4KvsDZDfXrvimdpNcIFCh4
 S5I4Nso0kcuGdUqI+Wintzmst7uRupkpzSoyGjulam2W8ILqCZylzKy5PARKxjA+h31W
 9qZAgxdRGlqiWsAcvU148YbptiW3w+C5Hgv6u/8J62Z+LvS0p6yU9CkGl4KQ2wgPxbK2
 bBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4vHclEhVo4/x2VW0sNlaZPniEpYxDL00DWLB9IRzX8A=;
 b=K60V58ByCGYSSEl6qGJx/2CVOAAVgJOmzcvYPEn+YuYguDhEtO6khQCKO9RqjSjncM
 zbbrGJcJsCy+BaZBCOK6qcLR0rr5zRU/s3W1sw+qcHnJCxIIEZ8ce0NBFrtSpTqN89hQ
 2151fL2y89fQeaRAQECY8QpSfJZYvWZzDWWAkgfm/JIGddsBF0XfYfyK7hbeyChSwNXt
 PvdbovyHu05j7zTuyd4N6hOCGZNhVuxSiPsd5X9O8HCTsevQ+1KhgzCfhUAE3zNNLHcr
 yqx1lGDpoBgz4sA3UG/uuzANTEEfKr4s/ve57AQAAxvU4a8tXDzqFX2AMOdiNOqMvweJ
 KX2g==
X-Gm-Message-State: AOAM531maxAWSvOxIsQPznVmy49aZaXoyIkvpqS5Nt+p4zOcTk34bYf7
 FA2/nkqacqxUIhRrWBaIbB+6qIQDewAC9haDVOtbuA==
X-Google-Smtp-Source: ABdhPJzTAMKJOrCjRwALFfI0Ja6eZdn+8Qp7RnZolejWvWeoVUGZtXYKEgo1ScW21O/2heJnywHc0N7UuYt8i/TuQIY=
X-Received: by 2002:aa7:c552:0:b0:424:27e6:d79e with SMTP id
 s18-20020aa7c552000000b0042427e6d79emr1786224edr.4.1650578976430; Thu, 21 Apr
 2022 15:09:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220420235228.2767816-1-tjmercier@google.com>
 <20220420235228.2767816-6-tjmercier@google.com> <YmGiNh0DDIcwcnVl@google.com>
In-Reply-To: <YmGiNh0DDIcwcnVl@google.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 21 Apr 2022 15:09:25 -0700
Message-ID: <CABdmKX08bNkRyLiLLL=b4=ZGZRoRFy5Hyx1HTxz5VFHsWNUN9Q@mail.gmail.com>
Subject: Re: [RFC v5 5/6] binder: Add flags to relinquish ownership of fds
To: Carlos Llamas <cmllamas@google.com>
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
Cc: dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>,
 Kalesh Singh <kaleshsingh@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Martijn Coenen <maco@android.com>,
 kernel-team@android.com, linux-media@vger.kernel.org,
 Todd Kjos <tkjos@android.com>, linaro-mm-sig@lists.linaro.org,
 Hridya Valsaraju <hridya@google.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Suren Baghdasaryan <surenb@google.com>, Christian Brauner <brauner@kernel.org>,
 Kenny.Ho@amd.com, linux-kernel@vger.kernel.org,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 21, 2022 at 11:28 AM Carlos Llamas <cmllamas@google.com> wrote:
>
> On Wed, Apr 20, 2022 at 11:52:23PM +0000, T.J. Mercier wrote:
> > From: Hridya Valsaraju <hridya@google.com>
> >
> > This patch introduces flags BINDER_FD_FLAG_SENDER_NO_NEED, and
> > BINDER_FDA_FLAG_SENDER_NO_NEED that a process sending an individual
> > fd or fd array to another process over binder IPC can set to relinquish
> > ownership of the fds being sent for memory accounting purposes. If the
> > flag is found to be set during the fd or fd array translation and the
> > fd is for a DMA-BUF, the buffer is uncharged from the sender's cgroup
> > and charged to the receiving process's cgroup instead.
> >
> > It is up to the sending process to ensure that it closes the fds
> > regardless of whether the transfer failed or succeeded.
> >
> > Most graphics shared memory allocations in Android are done by the
> > graphics allocator HAL process. On requests from clients, the HAL proce=
ss
> > allocates memory and sends the fds to the clients over binder IPC.
> > The graphics allocator HAL will not retain any references to the
> > buffers. When the HAL sets *_FLAG_SENDER_NO_NEED for fd arrays holding
> > DMA-BUF fds, or individual fd objects, the gpu cgroup controller will
> > be able to correctly charge the buffers to the client processes instead
> > of the graphics allocator HAL.
> >
> > Since this is a new feature exposed to userspace, the kernel and usersp=
ace
> > must be compatible for the accounting to work for transfers. In all cas=
es
> > the allocation and transport of DMA buffers via binder will succeed, bu=
t
> > only when both the kernel supports, and userspace depends on this featu=
re
> > will the transfer accounting work. The possible scenarios are detailed
> > below:
>
> New binder driver features which require userspace coordination can be
> "advertised" by the kernel via binderfs. You can see an example of how
> oneway_spam_detection is exposed in commit fc470abf54b2 ("binderfs: add
> support for feature files"). This is just an option to consider if it
> makes things easier in userspace. Although it seems that for the second
> scenario (old kernel + new userpsace) the flags would just be ignored.
>
This is a cool idea. You're right that the flags would be ignored.
Since this isn't a binder feature that can be toggled like
BINDER_ENABLE_ONEWAY_SPAM_DETECTION, I think the presence of the GPU
cgroup controller in the cgroup.controllers file would also tell us
the same thing from userspace.
> >
> > 1. new kernel + old userspace
> > The kernel supports the feature but userspace does not use it. The old
> > userspace won't mount the new cgroup controller, accounting is not
> > performed, charge is not transferred.
> >
> > 2. old kernel + new userspace
> > The new cgroup controller is not supported by the kernel, accounting is
> > not performed, charge is not transferred.
> >
> > 3. old kernel + old userspace
> > Same as #2
> >
> > 4. new kernel + new userspace
> > Cgroup is mounted, feature is supported and used.
> >
> > Signed-off-by: Hridya Valsaraju <hridya@google.com>
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> >
> > ---
> > v5 changes
> > Support both binder_fd_array_object and binder_fd_object. This is
> > necessary because new versions of Android will use binder_fd_object
> > instead of binder_fd_array_object, and we need to support both.
> >
> > Use the new, simpler dma_buf_transfer_charge API.
> >
> > v3 changes
> > Remove android from title per Todd Kjos.
> >
> > Use more common dual author commit message format per John Stultz.
> >
> > Include details on behavior for all combinations of kernel/userspace
> > versions in changelog (thanks Suren Baghdasaryan) per Greg Kroah-Hartma=
n.
> >
> > v2 changes
> > Move dma-buf cgroup charge transfer from a dma_buf_op defined by every
> > heap to a single dma-buf function for all heaps per Daniel Vetter and
> > Christian K=C3=B6nig.
> > ---
> >  drivers/android/binder.c            | 27 +++++++++++++++++++++++----
> >  drivers/dma-buf/dma-buf.c           |  4 ++--
> >  include/linux/dma-buf.h             |  2 +-
> >  include/uapi/linux/android/binder.h | 23 +++++++++++++++++++----
> >  4 files changed, 45 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> > index 8351c5638880..b07d50fe1c80 100644
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
> > @@ -2170,7 +2171,7 @@ static int binder_translate_handle(struct flat_bi=
nder_object *fp,
> >       return ret;
> >  }
> >
> > -static int binder_translate_fd(u32 fd, binder_size_t fd_offset,
> > +static int binder_translate_fd(u32 fd, binder_size_t fd_offset, __u32 =
flags,
> >                              struct binder_transaction *t,
> >                              struct binder_thread *thread,
> >                              struct binder_transaction *in_reply_to)
> > @@ -2208,6 +2209,23 @@ static int binder_translate_fd(u32 fd, binder_si=
ze_t fd_offset,
> >               goto err_security;
> >       }
> >
> > +     if (IS_ENABLED(CONFIG_CGROUP_GPU) && (flags & BINDER_FD_FLAG_SEND=
ER_NO_NEED)) {
> > +             if (is_dma_buf_file(file)) {
> > +                     struct dma_buf *dmabuf =3D file->private_data;
> > +
> > +                     ret =3D dma_buf_transfer_charge(dmabuf, target_pr=
oc->tsk);
> > +                     if (ret)
> > +                             pr_warn("%d:%d Unable to transfer DMA-BUF=
 fd charge to %d\n",
> > +                                     proc->pid, thread->pid, target_pr=
oc->pid);
>
> If we fail to transfer the charge, it seems we continue with the fixup
> allocation and then propagate the error. Shouldn't the translation be
> aborted at this point instead? Or is this supposed to be handled?
>
I took the position that it was better to have incorrect accounting
along with this log statement than potentially causing lots of crashes
due to failed transactions. However if limiting gets added for the GPU
cgroup, then we really should kill the transaction here. I'll go ahead
and add that goto now.

> > +             } else {
>
> nit: negating is_dma_buf_file() check eliminates the "else" here.
>
Thanks.
> > +                     binder_user_error(
> > +                             "%d:%d got transaction with SENDER_NO_NEE=
D for non-dmabuf fd, %d\n",
> > +                             proc->pid, thread->pid, fd);
> > +                     ret =3D -EINVAL;
> > +                     goto err_noneed;
> > +             }
> > +     }
> > +
> >       /*
> >        * Add fixup record for this transaction. The allocation
> >        * of the fd in the target needs to be done from a
> > @@ -2226,6 +2244,7 @@ static int binder_translate_fd(u32 fd, binder_siz=
e_t fd_offset,
> >       return ret;
> >
> >  err_alloc:
> > +err_noneed:
> >  err_security:
> >       fput(file);
> >  err_fget:
> > @@ -2528,7 +2547,7 @@ static int binder_translate_fd_array(struct list_=
head *pf_head,
> >
> >               ret =3D copy_from_user(&fd, sender_ufda_base + sender_uof=
fset, sizeof(fd));
> >               if (!ret)
> > -                     ret =3D binder_translate_fd(fd, offset, t, thread=
,
> > +                     ret =3D binder_translate_fd(fd, offset, fda->flag=
s, t, thread,
> >                                                 in_reply_to);
> >               if (ret)
> >                       return ret > 0 ? -EINVAL : ret;
> > @@ -3179,8 +3198,8 @@ static void binder_transaction(struct binder_proc=
 *proc,
> >                       struct binder_fd_object *fp =3D to_binder_fd_obje=
ct(hdr);
> >                       binder_size_t fd_offset =3D object_offset +
> >                               (uintptr_t)&fp->fd - (uintptr_t)fp;
> > -                     int ret =3D binder_translate_fd(fp->fd, fd_offset=
, t,
> > -                                                   thread, in_reply_to=
);
> > +                     int ret =3D binder_translate_fd(fp->fd, fd_offset=
, fp->flags,
> > +                                                   t, thread, in_reply=
_to);
> >
> >                       fp->pad_binder =3D 0;
> >                       if (ret < 0 ||
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index f3fb844925e2..36ed6cd4ddcc 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -31,7 +31,6 @@
> >
> >  #include "dma-buf-sysfs-stats.h"
> >
> > -static inline int is_dma_buf_file(struct file *);
> >
> >  struct dma_buf_list {
> >       struct list_head head;
> > @@ -400,10 +399,11 @@ static const struct file_operations dma_buf_fops =
=3D {
> >  /*
> >   * is_dma_buf_file - Check if struct file* is associated with dma_buf
> >   */
> > -static inline int is_dma_buf_file(struct file *file)
> > +int is_dma_buf_file(struct file *file)
> >  {
> >       return file->f_op =3D=3D &dma_buf_fops;
> >  }
> > +EXPORT_SYMBOL_NS_GPL(is_dma_buf_file, DMA_BUF);
> >
> >  static struct file *dma_buf_getfile(struct dma_buf *dmabuf, int flags)
> >  {
> > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > index 438ad8577b76..2b9812758fee 100644
> > --- a/include/linux/dma-buf.h
> > +++ b/include/linux/dma-buf.h
> > @@ -614,7 +614,7 @@ dma_buf_attachment_is_dynamic(struct dma_buf_attach=
ment *attach)
> >  {
> >       return !!attach->importer_ops;
> >  }
> > -
> > +int is_dma_buf_file(struct file *file);
> >  struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
> >                                         struct device *dev);
> >  struct dma_buf_attachment *
> > diff --git a/include/uapi/linux/android/binder.h b/include/uapi/linux/a=
ndroid/binder.h
> > index 11157fae8a8e..b263cbb603ea 100644
> > --- a/include/uapi/linux/android/binder.h
> > +++ b/include/uapi/linux/android/binder.h
> > @@ -91,14 +91,14 @@ struct flat_binder_object {
> >  /**
> >   * struct binder_fd_object - describes a filedescriptor to be fixed up=
.
> >   * @hdr:     common header structure
> > - * @pad_flags:       padding to remain compatible with old userspace c=
ode
>
> Does this mean we no longer need to keep the compatibility with the "old
> userspace code"? Maybe these old flags are all less than 0x2000?
>
This comes from before binder_fd{_array}_object existed as a distinct
type from flat_binder_object. With this layout, it's possible to cast
between flat_binder_object and the binder_fd{_array}_object types. I
don't think there were ever any binder_fd{_array}_object specific
flags before now, but yes the value of 0x2000 was chosen to be sure
that the FLAT_BINDER_* flags do not conflict. I did try smaller values
(0x02) but found that occasionally this bit was set when I was not
expecting it to be.

https://lore.kernel.org/lkml/1486161652-2612-2-git-send-email-john.stultz@l=
inaro.org/



> > + * @flags:   One or more BINDER_FD_FLAG_* flags
> >   * @pad_binder:      padding to remain compatible with old userspace c=
ode
> >   * @fd:              file descriptor
> >   * @cookie:  opaque data, used by user-space
> >   */
> >  struct binder_fd_object {
> >       struct binder_object_header     hdr;
> > -     __u32                           pad_flags;
> > +     __u32                           flags;
> >       union {
> >               binder_uintptr_t        pad_binder;
> >               __u32                   fd;
> > @@ -107,6 +107,17 @@ struct binder_fd_object {
> >       binder_uintptr_t                cookie;
> >  };
> >
> > +enum {
> > +     /**
> > +      * @BINDER_FD_FLAG_SENDER_NO_NEED
> > +      *
> > +      * When set, the sender of a binder_fd_object wishes to relinquis=
h ownership of the fd for
> > +      * memory accounting purposes. If the fd is for a DMA-BUF, the bu=
ffer is uncharged from the
> > +      * sender's cgroup and charged to the receiving process's cgroup =
instead.
> > +      */
> > +     BINDER_FD_FLAG_SENDER_NO_NEED =3D 0x2000,
>
> SENDER_NO_NEED wasn't straight-forward for me. Perhaps RELINQUISH or
> XFER_{OWNER|CHARGE|CGROUP} could be some other options to consider.
>
I'm happy to change this up. I like _XFER_CHARGE the best out of these.

> > +};
> > +
> >  /* struct binder_buffer_object - object describing a userspace buffer
> >   * @hdr:             common header structure
> >   * @flags:           one or more BINDER_BUFFER_* flags
> > @@ -141,7 +152,7 @@ enum {
> >
> >  /* struct binder_fd_array_object - object describing an array of fds i=
n a buffer
> >   * @hdr:             common header structure
> > - * @pad:             padding to ensure correct alignment
> > + * flags:            One or more BINDER_FDA_FLAG_* flags
> >   * @num_fds:         number of file descriptors in the buffer
> >   * @parent:          index in offset array to buffer holding the fd ar=
ray
> >   * @parent_offset:   start offset of fd array in the buffer
> > @@ -162,12 +173,16 @@ enum {
> >   */
> >  struct binder_fd_array_object {
> >       struct binder_object_header     hdr;
> > -     __u32                           pad;
> > +     __u32                           flags;
> >       binder_size_t                   num_fds;
> >       binder_size_t                   parent;
> >       binder_size_t                   parent_offset;
> >  };
> >
> > +enum {
> > +     BINDER_FDA_FLAG_SENDER_NO_NEED =3D BINDER_FD_FLAG_SENDER_NO_NEED,
> > +};
> > +
> >  /*
> >   * On 64-bit platforms where user code may run in 32-bits the driver m=
ust
> >   * translate the buffer (and local binder) addresses appropriately.
> > --
> > 2.36.0.rc0.470.gd361397f0d-goog
> >
>
> Other than included minor comments:
>
> Reviewed-by: Carlos Llamas <cmllamas@google.com>
>
> --
> Carlos Llamas
