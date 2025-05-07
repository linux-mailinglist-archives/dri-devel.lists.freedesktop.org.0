Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4000CAAE7F3
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 19:37:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED9710E86D;
	Wed,  7 May 2025 17:37:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="rWCuTZIi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C3C910E86D
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 17:36:58 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43cf3192d8bso4705e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 10:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1746639416; x=1747244216;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=03FmHmVwRxfth7UM0uyvuKw4PHYHU2rgW+H3gROBq00=;
 b=rWCuTZIiOpzpjJY+57SsWauYcfX7OVMAr1zPlIXov313HjvdeWRWIINO9zQRvl17l1
 VtKzu6/OBytI0QufpCP21ETEbAPEhpKvS9MV4e2tTgRIX3GD7FsdqDj321rItQ166zp/
 vytOGEeYSuuR9FFtecsWH6jxymM0nLzFoN+gJa6OK//luAccscwxN+5/J9L0s4zSZxaF
 PQaFZBuVDAckW2p72NFBg8hrgq7/37fWKN66+Yw768Wz1cb0vyBoDnypTzTUYo2qBOhm
 fSaJVv/ZYqUmkmsNAig3XBM2U5QbTQWrEjrvMOuPrK1lW1yquspeU9jyYAHjqjuCAIS3
 Elcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746639416; x=1747244216;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=03FmHmVwRxfth7UM0uyvuKw4PHYHU2rgW+H3gROBq00=;
 b=QEGOI/bMOm0sd/CmLy2Ceuw+7XNz6QdurXdn7M3+21MzTphsVPuszBQx3CBlyS2KAI
 J4F0FKlyL7XzvlJYDYviWQzTbaLQ4D5A4kwz/0+2q0mGpGx4JzSfq5i27/q6UXZ6wL/e
 mLjPbIMLAKVFa4suMw9c5tX08W9PrLBFysQICMvUyfbQMrusW2C8fHC3HU3xwA0DOhFQ
 qB780puE/6r1YB1iPGxYmears93YTco28zWspWUMRr71la3TZI/GatIqzXEwOZM0EEWp
 Hy0ZmSyITVjp2vxTHymwQ7tmaE8LHWuESm45v5jckM04vDY1Izvoj7WZ9HOS37SIT/qU
 dVxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEO6zzPzz61MI5SPm1IXYXMzXLr2VG+VIfsyAxUNtN169ljO2fhmnnnCxab2hkyW1gqeIIP44pBBY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFZpkt6qnGmNx6Eg0PgweTfjakdpxdYtM7nvDIHLs+aGgqc8YO
 HwWxy3MrlazBUyZ7uCooqvGYclaLXKil3EM8fYxrwqEbbRII7sQZnaUVQKNR4tDPaPEG0FY8SBf
 5BzMmofK+5fWlrdv7SGqr2wZYGysETqp21FdK
X-Gm-Gg: ASbGncvt7BBqtSASFzNQ573l3fVJ4sonup3QO4G3p+DDy0yUe5ImvBK8fZcSjlW45H9
 t5iQzvKA5h0JssDkZEwFwNdPio3JjmuxsBPObkIdw2ppvCoyndoTlAHxjCvB1CRe3le39pd9MEx
 1SnnmfP/EZQdAaJd0hDsx+X9Q/KdN89a8S40HbruCPNA/KtmSjvH8=
X-Google-Smtp-Source: AGHT+IGKbhcPfxwVvrgW43FQv40N2rrEsTU1IivmJdsBJWo8S+7OxJD2bAl6EjqGmDeLHxgFLqzxXA+EAi9MkW6sNwY=
X-Received: by 2002:a05:600c:4448:b0:43b:c2cc:5075 with SMTP id
 5b1f17b1804b1-441d4d4b8d4mr1461395e9.5.1746639416170; Wed, 07 May 2025
 10:36:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250507001036.2278781-1-tjmercier@google.com>
 <20250507001036.2278781-3-tjmercier@google.com>
 <01e0e545-f297-466c-a973-e479fcbd934f@amd.com>
In-Reply-To: <01e0e545-f297-466c-a973-e479fcbd934f@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 7 May 2025 10:36:44 -0700
X-Gm-Features: ATxdqUG9g5GsnlzWS3vqvD3-p3K7oOvmC_8NVlcrL_8D723R2O-jH8YctiUa3PQ
Message-ID: <CABdmKX3ZjeZmT=Fj_TYfpXouM6AGigcQPH7ygf3puFQip0DQ_g@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 2/5] bpf: Add dmabuf iterator
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: sumit.semwal@linaro.org, ast@kernel.org, daniel@iogearbox.net, 
 andrii@kernel.org, martin.lau@linux.dev, skhan@linuxfoundation.org, 
 alexei.starovoitov@gmail.com, song@kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, bpf@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, android-mm@google.com, simona@ffwll.ch, 
 eddyz87@gmail.com, yonghong.song@linux.dev, john.fastabend@gmail.com, 
 kpsingh@kernel.org, sdf@fomichev.me, jolsa@kernel.org, mykolal@fb.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 7, 2025 at 1:15=E2=80=AFAM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> On 5/7/25 02:10, T.J. Mercier wrote:
> > The dmabuf iterator traverses the list of all DMA buffers.
> >
> > DMA buffers are refcounted through their associated struct file. A
> > reference is taken on each buffer as the list is iterated to ensure eac=
h
> > buffer persists for the duration of the bpf program execution without
> > holding the list mutex.
> >
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > ---
> >  drivers/dma-buf/dma-buf.c |  64 ++++++++++++++++++++++++
> >  include/linux/dma-buf.h   |   3 ++
> >  kernel/bpf/Makefile       |   3 ++
> >  kernel/bpf/dmabuf_iter.c  | 102 ++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 172 insertions(+)
> >  create mode 100644 kernel/bpf/dmabuf_iter.c
> >
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index 8d151784e302..9fee2788924e 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -19,7 +19,9 @@
> >  #include <linux/anon_inodes.h>
> >  #include <linux/export.h>
> >  #include <linux/debugfs.h>
> > +#include <linux/list.h>
> >  #include <linux/module.h>
> > +#include <linux/mutex.h>
> >  #include <linux/seq_file.h>
> >  #include <linux/sync_file.h>
> >  #include <linux/poll.h>
> > @@ -55,6 +57,68 @@ static void __dma_buf_list_del(struct dma_buf *dmabu=
f)
> >       mutex_unlock(&dmabuf_list_mutex);
> >  }
> >
> > +/**
> > + * get_first_dmabuf - begin iteration through global list of DMA-bufs
>
> As far as I can see that looks really good.
>
> The only thing I'm questioning a little bit is that the name get_first_dm=
abuf() just doesn't sound so well to me.
>
> I'm a fan of keeping the object you work with first in the naming and it =
should somehow express that this iters over the global list of all buffers.=
 Maybe something like dmabuf_get_first_globally or dmabuf_get_first_instanc=
e.
>
> Feel free to add my rb if any of those suggestions are used, but I'm comp=
letely open other ideas as well.
>
> Regards,
> Christian.
>
Yeah you're right. "first" is actually a little misleading too, since
the most recently exported buffer will be at the list head, not the
oldest buffer. But buffer age or ordering doesn't really matter here
as long as we get through all of them.

So I'm thinking dma_buf_iter_begin() and dma_buf_iter_next() would be
better names. Similar to seq_start / seq_next or bpf's iter_<type>_new
/ iter_<type>_next.

> > + *
> > + * Returns the first buffer in the global list of DMA-bufs that's not =
in the
> > + * process of being destroyed. Increments that buffer's reference coun=
t to
> > + * prevent buffer destruction. Callers must release the reference, eit=
her by
> > + * continuing iteration with get_next_dmabuf(), or with dma_buf_put().
> > + *
> > + * Returns NULL If no active buffers are present.
> > + */
> > +struct dma_buf *get_first_dmabuf(void)
> > +{
> > +     struct dma_buf *ret =3D NULL, *dmabuf;
> > +
> > +     /*
> > +      * The list mutex does not protect a dmabuf's refcount, so it can=
 be
> > +      * zeroed while we are iterating. We cannot call get_dma_buf() si=
nce the
> > +      * caller may not already own a reference to the buffer.
> > +      */
> > +     mutex_lock(&dmabuf_list_mutex);
> > +     list_for_each_entry(dmabuf, &dmabuf_list, list_node) {
> > +             if (file_ref_get(&dmabuf->file->f_ref)) {
> > +                     ret =3D dmabuf;
> > +                     break;
> > +             }
> > +     }
> > +     mutex_unlock(&dmabuf_list_mutex);
> > +     return ret;
> > +}
> > +
> > +/**
> > + * get_next_dmabuf - continue iteration through global list of DMA-buf=
s
> > + * @dmabuf:  [in]    pointer to dma_buf
> > + *
> > + * Decrements the reference count on the provided buffer. Returns the =
next
> > + * buffer from the remainder of the global list of DMA-bufs with its r=
eference
> > + * count incremented. Callers must release the reference, either by co=
ntinuing
> > + * iteration with get_next_dmabuf(), or with dma_buf_put().
> > + *
> > + * Returns NULL If no additional active buffers are present.
> > + */
> > +struct dma_buf *get_next_dmabuf(struct dma_buf *dmabuf)
> > +{
> > +     struct dma_buf *ret =3D NULL;
> > +
> > +     /*
> > +      * The list mutex does not protect a dmabuf's refcount, so it can=
 be
> > +      * zeroed while we are iterating. We cannot call get_dma_buf() si=
nce the
> > +      * caller may not already own a reference to the buffer.
> > +      */
> > +     mutex_lock(&dmabuf_list_mutex);
> > +     dma_buf_put(dmabuf);
> > +     list_for_each_entry_continue(dmabuf, &dmabuf_list, list_node) {
> > +             if (file_ref_get(&dmabuf->file->f_ref)) {
> > +                     ret =3D dmabuf;
> > +                     break;
> > +             }
> > +     }
> > +     mutex_unlock(&dmabuf_list_mutex);
> > +     return ret;
> > +}
> > +
> >  static char *dmabuffs_dname(struct dentry *dentry, char *buffer, int b=
uflen)
> >  {
> >       struct dma_buf *dmabuf;
> > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > index 8ff4add71f88..1820f6db6e58 100644
> > --- a/include/linux/dma-buf.h
> > +++ b/include/linux/dma-buf.h
> > @@ -568,6 +568,9 @@ static inline void get_dma_buf(struct dma_buf *dmab=
uf)
> >       get_file(dmabuf->file);
> >  }
> >
> > +struct dma_buf *get_first_dmabuf(void);
> > +struct dma_buf *get_next_dmabuf(struct dma_buf *dmbuf);
> > +
> >  /**
> >   * dma_buf_is_dynamic - check if a DMA-buf uses dynamic mappings.
> >   * @dmabuf: the DMA-buf to check
> > diff --git a/kernel/bpf/Makefile b/kernel/bpf/Makefile
> > index 70502f038b92..3a335c50e6e3 100644
> > --- a/kernel/bpf/Makefile
> > +++ b/kernel/bpf/Makefile
> > @@ -53,6 +53,9 @@ obj-$(CONFIG_BPF_SYSCALL) +=3D relo_core.o
> >  obj-$(CONFIG_BPF_SYSCALL) +=3D btf_iter.o
> >  obj-$(CONFIG_BPF_SYSCALL) +=3D btf_relocate.o
> >  obj-$(CONFIG_BPF_SYSCALL) +=3D kmem_cache_iter.o
> > +ifeq ($(CONFIG_DMA_SHARED_BUFFER),y)
> > +obj-$(CONFIG_BPF_SYSCALL) +=3D dmabuf_iter.o
> > +endif
> >
> >  CFLAGS_REMOVE_percpu_freelist.o =3D $(CC_FLAGS_FTRACE)
> >  CFLAGS_REMOVE_bpf_lru_list.o =3D $(CC_FLAGS_FTRACE)
> > diff --git a/kernel/bpf/dmabuf_iter.c b/kernel/bpf/dmabuf_iter.c
> > new file mode 100644
> > index 000000000000..80bca8239c6d
> > --- /dev/null
> > +++ b/kernel/bpf/dmabuf_iter.c
> > @@ -0,0 +1,102 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/* Copyright (c) 2025 Google LLC */
> > +#include <linux/bpf.h>
> > +#include <linux/btf_ids.h>
> > +#include <linux/dma-buf.h>
> > +#include <linux/kernel.h>
> > +#include <linux/seq_file.h>
> > +
> > +BTF_ID_LIST_SINGLE(bpf_dmabuf_btf_id, struct, dma_buf)
> > +DEFINE_BPF_ITER_FUNC(dmabuf, struct bpf_iter_meta *meta, struct dma_bu=
f *dmabuf)
> > +
> > +static void *dmabuf_iter_seq_start(struct seq_file *seq, loff_t *pos)
> > +{
> > +     if (*pos)
> > +             return NULL;
> > +
> > +     return get_first_dmabuf();
> > +}
> > +
> > +static void *dmabuf_iter_seq_next(struct seq_file *seq, void *v, loff_=
t *pos)
> > +{
> > +     struct dma_buf *dmabuf =3D v;
> > +
> > +     ++*pos;
> > +
> > +     return get_next_dmabuf(dmabuf);
> > +}
> > +
> > +struct bpf_iter__dmabuf {
> > +     __bpf_md_ptr(struct bpf_iter_meta *, meta);
> > +     __bpf_md_ptr(struct dma_buf *, dmabuf);
> > +};
> > +
> > +static int __dmabuf_seq_show(struct seq_file *seq, void *v, bool in_st=
op)
> > +{
> > +     struct bpf_iter_meta meta =3D {
> > +             .seq =3D seq,
> > +     };
> > +     struct bpf_iter__dmabuf ctx =3D {
> > +             .meta =3D &meta,
> > +             .dmabuf =3D v,
> > +     };
> > +     struct bpf_prog *prog =3D bpf_iter_get_info(&meta, in_stop);
> > +
> > +     if (prog)
> > +             return bpf_iter_run_prog(prog, &ctx);
> > +
> > +     return 0;
> > +}
> > +
> > +static int dmabuf_iter_seq_show(struct seq_file *seq, void *v)
> > +{
> > +     return __dmabuf_seq_show(seq, v, false);
> > +}
> > +
> > +static void dmabuf_iter_seq_stop(struct seq_file *seq, void *v)
> > +{
> > +     struct dma_buf *dmabuf =3D v;
> > +
> > +     if (dmabuf)
> > +             dma_buf_put(dmabuf);
> > +}
> > +
> > +static const struct seq_operations dmabuf_iter_seq_ops =3D {
> > +     .start  =3D dmabuf_iter_seq_start,
> > +     .next   =3D dmabuf_iter_seq_next,
> > +     .stop   =3D dmabuf_iter_seq_stop,
> > +     .show   =3D dmabuf_iter_seq_show,
> > +};
> > +
> > +static void bpf_iter_dmabuf_show_fdinfo(const struct bpf_iter_aux_info=
 *aux,
> > +                                     struct seq_file *seq)
> > +{
> > +     seq_puts(seq, "dmabuf iter\n");
> > +}
> > +
> > +static const struct bpf_iter_seq_info dmabuf_iter_seq_info =3D {
> > +     .seq_ops                =3D &dmabuf_iter_seq_ops,
> > +     .init_seq_private       =3D NULL,
> > +     .fini_seq_private       =3D NULL,
> > +     .seq_priv_size          =3D 0,
> > +};
> > +
> > +static struct bpf_iter_reg bpf_dmabuf_reg_info =3D {
> > +     .target                 =3D "dmabuf",
> > +     .feature                =3D BPF_ITER_RESCHED,
> > +     .show_fdinfo            =3D bpf_iter_dmabuf_show_fdinfo,
> > +     .ctx_arg_info_size      =3D 1,
> > +     .ctx_arg_info           =3D {
> > +             { offsetof(struct bpf_iter__dmabuf, dmabuf),
> > +               PTR_TO_BTF_ID_OR_NULL },
> > +     },
> > +     .seq_info               =3D &dmabuf_iter_seq_info,
> > +};
> > +
> > +static int __init dmabuf_iter_init(void)
> > +{
> > +     bpf_dmabuf_reg_info.ctx_arg_info[0].btf_id =3D bpf_dmabuf_btf_id[=
0];
> > +     return bpf_iter_reg_target(&bpf_dmabuf_reg_info);
> > +}
> > +
> > +late_initcall(dmabuf_iter_init);
>
