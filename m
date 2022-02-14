Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4F44B6444
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 08:25:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D57910E3B3;
	Tue, 15 Feb 2022 07:25:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68DBB10E2EE
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 21:26:10 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id m14so11930949lfu.4
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 13:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xB7MDihYGx4nWu/GuBF27GgwlKh3zzMd7sng4PC9OAg=;
 b=AlVXfUdq3X/vSQj1QADxlefqzYOIxjNWuIGVTNcQd90bTzHdMLXt1diiYfHcXmfDuo
 Aih+Ei5sv53Rvnfwr6T+Giffv/hPnsONKFFuY2MDaby2I/Gm/wkOK3W25ZFOa3QTswJK
 etjN6hFfrsFB0uHvKeOLdTbOErJPlMDj409uuOgjaLBCd7DDEDWC89ZjaA+b9qyZ40kj
 s0vZ3yX4ID2jYqbVwwVsaHm/Vvm4t/enqPFSc5JTB/j4R1JzwarD/mLvPFiGLs27GTHY
 OzNCXT4ZuoxDbUdaDSQpUyuqB1ItZusqu95/zc54s7Tn3oSLSHXezYPdHrPXDjs96Thu
 gSQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xB7MDihYGx4nWu/GuBF27GgwlKh3zzMd7sng4PC9OAg=;
 b=R0nYajtQ27o4s4kfJdAqLGcqJ1y8XWbegVlXxEUz0GtXdvQdUnUU6PnL9B9MTHg+Om
 is2Ihpld1r+SxL74opMFT4O7BuDibyi9mAGJ1S3ggtNkDLIMB/JdZYwuYObnjI5gJ9Q5
 3SoaQ+/tts4VANQ4Tbnd1WbJJfZ0L/YgNkLz7FgYeQIHCv13KRe38vdbZDWqFwWd95sl
 p/e1nYWpOBVROcxRuh9PJmEBsIBSSylslzLl4rUBVCM/5PnXpVOSKbBQS7VE1EJaniQ2
 Yl9R1rQhug3/rhpplfjymY+Mi+WnnsCbHJVJ7bZMOIHHKNRDKgpMPRBPsp4UXlxKDaz1
 Ch8g==
X-Gm-Message-State: AOAM533js+zTNFQNo0KW8Bk7mocTp+zOb6e4CFfAREBoJbPom3AtngjN
 Z7s6uujIADJG6eesyhKXzKVFQy0ABwsOIsvRixRi9g==
X-Google-Smtp-Source: ABdhPJy9LX4qMvZpJWEnI58VfURh6/MLmchoH4ymKbepXoxQzUy25zdnmOiESxtwDTq7E3tlrLuGpZ/EsyrQdVvZllE=
X-Received: by 2002:a05:6512:1699:: with SMTP id
 bu25mr695407lfb.403.1644873968216; 
 Mon, 14 Feb 2022 13:26:08 -0800 (PST)
MIME-Version: 1.0
References: <20220211161831.3493782-1-tjmercier@google.com>
 <20220211161831.3493782-7-tjmercier@google.com>
In-Reply-To: <20220211161831.3493782-7-tjmercier@google.com>
From: Todd Kjos <tkjos@google.com>
Date: Mon, 14 Feb 2022 13:25:55 -0800
Message-ID: <CAHRSSEwWEeW2+Pd17VUNrPYSWhOu-ao7rgnk-pNROcfH6abTzA@mail.gmail.com>
Subject: Re: [RFC v2 6/6] android: binder: Add a buffer flag to relinquish
 ownership of fds
To: "T.J. Mercier" <tjmercier@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 15 Feb 2022 07:25:06 +0000
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
Cc: linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Zefan Li <lizefan.x@bytedance.com>,
 kaleshsingh@google.com, Joel Fernandes <joel@joelfernandes.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Kenny.Ho@amd.com,
 Jonathan Corbet <corbet@lwn.net>, Martijn Coenen <maco@android.com>,
 linux-media@vger.kernel.org, Todd Kjos <tkjos@android.com>,
 linaro-mm-sig@lists.linaro.org, Tejun Heo <tj@kernel.org>,
 cgroups@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Liam Mark <lmark@codeaurora.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Johannes Weiner <hannes@cmpxchg.org>,
 Hridya Valsaraju <hridya@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 11, 2022 at 8:19 AM T.J. Mercier <tjmercier@google.com> wrote:
>
> This patch introduces a buffer flag BINDER_BUFFER_FLAG_SENDER_NO_NEED
> that a process sending an fd array to another process over binder IPC
> can set to relinquish ownership of the fds being sent for memory
> accounting purposes. If the flag is found to be set during the fd array
> translation and the fd is for a DMA-BUF, the buffer is uncharged from
> the sender's cgroup and charged to the receiving process's cgroup
> instead.
>
> It is up to the sending process to ensure that it closes the fds
> regardless of whether the transfer failed or succeeded.
>
> Most graphics shared memory allocations in Android are done by the
> graphics allocator HAL process. On requests from clients, the HAL process
> allocates memory and sends the fds to the clients over binder IPC.
> The graphics allocator HAL will not retain any references to the
> buffers. When the HAL sets the BINDER_BUFFER_FLAG_SENDER_NO_NEED for fd
> arrays holding DMA-BUF fds, the gpu cgroup controller will be able to
> correctly charge the buffers to the client processes instead of the
> graphics allocator HAL.
>
> From: Hridya Valsaraju <hridya@google.com>
> Signed-off-by: Hridya Valsaraju <hridya@google.com>
> Co-developed-by: T.J. Mercier <tjmercier@google.com>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> ---
> changes in v2
> - Move dma-buf cgroup charge transfer from a dma_buf_op defined by every
> heap to a single dma-buf function for all heaps per Daniel Vetter and
> Christian K=C3=B6nig.
>
>  drivers/android/binder.c            | 26 ++++++++++++++++++++++++++
>  include/uapi/linux/android/binder.h |  1 +
>  2 files changed, 27 insertions(+)
>
> diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> index 8351c5638880..f50d88ded188 100644
> --- a/drivers/android/binder.c
> +++ b/drivers/android/binder.c
> @@ -42,6 +42,7 @@
>
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>
> +#include <linux/dma-buf.h>
>  #include <linux/fdtable.h>
>  #include <linux/file.h>
>  #include <linux/freezer.h>
> @@ -2482,8 +2483,10 @@ static int binder_translate_fd_array(struct list_h=
ead *pf_head,

Is this only needed for the BINDER_TYPE_FDA case (multiple fds)? This
never needs to be done in the BINDER_TYPE_FD case (single fd)?

>  {
>         binder_size_t fdi, fd_buf_size;
>         binder_size_t fda_offset;
> +       bool transfer_gpu_charge =3D false;
>         const void __user *sender_ufda_base;
>         struct binder_proc *proc =3D thread->proc;
> +       struct binder_proc *target_proc =3D t->to_proc;
>         int ret;
>
>         fd_buf_size =3D sizeof(u32) * fda->num_fds;
> @@ -2521,8 +2524,15 @@ static int binder_translate_fd_array(struct list_h=
ead *pf_head,
>         if (ret)
>                 return ret;
>
> +       if (IS_ENABLED(CONFIG_CGROUP_GPU) &&
> +               parent->flags & BINDER_BUFFER_FLAG_SENDER_NO_NEED)
> +               transfer_gpu_charge =3D true;
> +
>         for (fdi =3D 0; fdi < fda->num_fds; fdi++) {
>                 u32 fd;
> +               struct dma_buf *dmabuf;
> +               struct gpucg *gpucg;
> +
>                 binder_size_t offset =3D fda_offset + fdi * sizeof(fd);
>                 binder_size_t sender_uoffset =3D fdi * sizeof(fd);
>
> @@ -2532,6 +2542,22 @@ static int binder_translate_fd_array(struct list_h=
ead *pf_head,
>                                                   in_reply_to);
>                 if (ret)
>                         return ret > 0 ? -EINVAL : ret;
> +
> +               if (!transfer_gpu_charge)
> +                       continue;
> +
> +               dmabuf =3D dma_buf_get(fd);
> +               if (IS_ERR(dmabuf))
> +                       continue;
> +
> +               gpucg =3D gpucg_get(target_proc->tsk);
> +               ret =3D dma_buf_charge_transfer(dmabuf, gpucg);
> +               if (ret) {
> +                       pr_warn("%d:%d Unable to transfer DMA-BUF fd char=
ge to %d",
> +                               proc->pid, thread->pid, target_proc->pid)=
;
> +                       gpucg_put(gpucg);
> +               }
> +               dma_buf_put(dmabuf);
>         }
>         return 0;
>  }
> diff --git a/include/uapi/linux/android/binder.h b/include/uapi/linux/and=
roid/binder.h
> index 3246f2c74696..169fd5069a1a 100644
> --- a/include/uapi/linux/android/binder.h
> +++ b/include/uapi/linux/android/binder.h
> @@ -137,6 +137,7 @@ struct binder_buffer_object {
>
>  enum {
>         BINDER_BUFFER_FLAG_HAS_PARENT =3D 0x01,
> +       BINDER_BUFFER_FLAG_SENDER_NO_NEED =3D 0x02,
>  };
>
>  /* struct binder_fd_array_object - object describing an array of fds in =
a buffer
> --
> 2.35.1.265.g69c8d7142f-goog
>
