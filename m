Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02945AA990A
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 18:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F9310E320;
	Mon,  5 May 2025 16:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="rdKIZjaU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF9C810E320
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 16:34:02 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43cfe808908so116255e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 09:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1746462841; x=1747067641;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cp9xG8IzZ6A+sCM3e//b/xF89Qt5DTbc6K0sQ70LgNM=;
 b=rdKIZjaUlZdl4mx7om9pD9uAggY8rPOs8UpL7XD08Kq/TXgyD4CLHbCb3lVbCH6VHu
 f7Qe/4MPG/tTFuE635jSABciCtITC6mwHoPFLltdKwOUCusfaiXMPRVixO9naczxUm8a
 MRkw9di58+jfHFloYyUEIq6umSQWGLlNURrVE2C2zrmZuQur3m/6jjdUjPiPp4ecg5Du
 ZUXrbRNmMkC8j4ZTLIzYw4jTtRt+VqFrkrYi6bjFKGLOiNvs6lEoTUIsTOo9bAXKMCaj
 73hY9jidOaSbORpHpS0bT5Avw/T/39KYH/2Ue3tmZV4TDnsMjpvDJq/cPdMNTXqy/JJ4
 k8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746462841; x=1747067641;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cp9xG8IzZ6A+sCM3e//b/xF89Qt5DTbc6K0sQ70LgNM=;
 b=wnOQtokP//D/UucvS5RG3Kd8AgEkXVeaK4XDZ0eR+seonaZUFhxSZj0iKMMaGyUPMQ
 VJbzpU5JsHsKIQWXHWOMDAAJaT2AqAhX9SGgF78sZx7Ez769sBlWiuwbmNFdIXYj6WMZ
 A7bVTnwOwdRSzsz9fezDfiJhEmneK3vILwY263IJ6b1V610T8xaMeud7D9Ew2NZaRJ4H
 +91xBjYW7hqp5+h599jqtVZLXtBaWLIpSA+n22aNNFzRGJ1wYZ2Wh7UWJfDto0SmCpvS
 HKYh9Q9zaDvbCKPhErDVX1Ljr/Tr41elHg2OrvI/95pSuaZcNZXzk3ytyRjUUtXkj26P
 tnfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4YLVCHgvYTceEdp9mtRVl+oSP1SjRO1uOB7e7ttuOXJ/Z7iXDmJUdIwVpqQtzohwzerbJ687B4Eg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyF3/C+fCyfUQwoQc6jDUiSDccT7fSf8ch/dmnGfmGgjIkzT6Zr
 NRNl0euB6LgVE+7tKI/B+3TUVP6c60OsJO6LK67FJ6PaQIRFzUKZAiaSdqEDfuXVV/I4Khel6/U
 DqW5hFco5eOnPVrXMauBMHUTmauSmovSSWFdL
X-Gm-Gg: ASbGncuMbyHTR78L6jluw75NJVeSVetirEwwcawBxONoTDaC+bFod2a79sHG7857XsD
 Q3tPJTN9+2rcbhg3u6q6GB02DRv2bys2MgEm49O3DRM8RtGogLrSirm7UgMpWB4JTZK5WFd7SqJ
 c+282NYDMhz8/2mjDdNtti
X-Google-Smtp-Source: AGHT+IGQyGO5uVSmpnPnkE3FDZ4KT+CnyY7gWk8P1H5yWIU1LA4t6+ZiezZ9eO866m7rRnEE4b46YYgj28ToiihwpHE=
X-Received: by 2002:a05:600c:3b82:b0:439:9434:1b6c with SMTP id
 5b1f17b1804b1-441cf9b141dmr171795e9.3.1746462840937; Mon, 05 May 2025
 09:34:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250504224149.1033867-1-tjmercier@google.com>
 <20250504224149.1033867-3-tjmercier@google.com>
 <26ca8ddf-0d78-462f-a47d-a1128b2e058f@amd.com>
In-Reply-To: <26ca8ddf-0d78-462f-a47d-a1128b2e058f@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 5 May 2025 09:33:48 -0700
X-Gm-Features: ATxdqUHRGgaUPb2TsqMguMaRajHe7gmAlhGQ8JWKvVw_IFJV369f1ssTaaa65I4
Message-ID: <CABdmKX2iNk22h-KxUr4yvZO80yeRRjMfoC7yjiZ-aR_f1k402g@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] bpf: Add dmabuf iterator
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: sumit.semwal@linaro.org, ast@kernel.org, daniel@iogearbox.net, 
 andrii@kernel.org, martin.lau@linux.dev, skhan@linuxfoundation.org, 
 song@kernel.org, alexei.starovoitov@gmail.com, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, android-mm@google.com, 
 simona@ffwll.ch, corbet@lwn.net, eddyz87@gmail.com, yonghong.song@linux.dev, 
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
 jolsa@kernel.org, mykolal@fb.com
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

On Mon, May 5, 2025 at 4:17=E2=80=AFAM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> On 5/5/25 00:41, T.J. Mercier wrote:
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
> >  kernel/bpf/Makefile      |   3 +
> >  kernel/bpf/dmabuf_iter.c | 134 +++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 137 insertions(+)
> >  create mode 100644 kernel/bpf/dmabuf_iter.c
> >
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
> > index 000000000000..968762e11f73
> > --- /dev/null
> > +++ b/kernel/bpf/dmabuf_iter.c
> > @@ -0,0 +1,134 @@
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
> > +static struct dma_buf *get_next_dmabuf(struct dma_buf *dmabuf)
> > +{
> > +     struct dma_buf *ret =3D NULL;
> > +
> > +     /*
> > +      * Look for the first/next buffer we can obtain a reference to.
> > +      *
> > +      * The list mutex does not protect a dmabuf's refcount, so it can=
 be
> > +      * zeroed while we are iterating. We cannot call get_dma_buf() si=
nce the
> > +      * caller of this program may not already own a reference to the =
buffer.
> > +      */
> > +     mutex_lock(&dmabuf_list_mutex);
> > +     if (dmabuf) {
>
> That looks like you try to mangle the start and next functionality in jus=
t one function.
>
> I would just inline that into the dmabuf_iter_seq_start() and dmabuf_iter=
_seq_next() functions.

Primarily this is to share between the open coded iterator (next
patch) and this normal iterator since I didn't want to duplicate the
same list traversal code across both of them.
>
>
> > +             dma_buf_put(dmabuf);
> > +             list_for_each_entry_continue(dmabuf, &dmabuf_list, list_n=
ode) {
>
> That you can put the DMA-buf and then still uses it in list_for_each_entr=
y_continue() only works because the mutex is locked in the destroy path.

Yup, this was deliberate.
>
>
> I strongly suggest to just put those two functions into drivers/dma-buf/d=
ma-buf.c right next to the __dma_buf_debugfs_list_add() and __dma_buf_debug=
fs_list_del() functions.

By two functions, you mean a get_first_dmabuf(void) and a
get_next_dmabuf(struct dma_buf*)? To make the dma_buf_put() call a
little less scary since all the mutex ops are right there?
>
>
> Apart from those style suggestions looks good to me from the technical si=
de, but I'm not an expert for the BPF stuff.
>
> Regards,
> Christian.

Thanks for your comments and reviews!

> > +                     if (file_ref_get(&dmabuf->file->f_ref)) {
> > +                             ret =3D dmabuf;
> > +                             break;
> > +                     }
> > +             }
> > +     } else {
> > +             list_for_each_entry(dmabuf, &dmabuf_list, list_node) {
> > +                     if (file_ref_get(&dmabuf->file->f_ref)) {
> > +                             ret =3D dmabuf;
> > +                             break;
> > +                     }
> > +             }
> > +     }
> > +     mutex_unlock(&dmabuf_list_mutex);
> > +     return ret;
> > +}
> > +
> > +static void *dmabuf_iter_seq_start(struct seq_file *seq, loff_t *pos)
> > +{
> > +     if (*pos)
> > +             return NULL;
> > +
> > +     return get_next_dmabuf(NULL);
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
