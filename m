Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C4BAA9A1C
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 19:08:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73BED10E0C5;
	Mon,  5 May 2025 17:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Ng16edtp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF4C10E0C5
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 17:08:15 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-4774611d40bso15921cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 10:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1746464894; x=1747069694;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Sl5qlzaLwkLoa7IyezxtoDVMCMI6oXTbeuYg/AGNhM=;
 b=Ng16edtpxsRI8fpi/yYPTC2uUb0BRlzJBUYj/EtKRrL+TL2qapzL1CxFBD+Cr6GBEJ
 dLSihXVooTg9raxe/P1pWwL5igKOFZPFqmRXUQVryyBlzpPsDDyyN7zIZ3PQlMlwmn32
 2PyCxh9bjKp+o9k0y8r8RVAf2GdSz8nKBZ4f4AceOTBEOBprV2yKA5NyRzKgIne988fa
 g5HaGv9ZjtIX2gmaN+yyuvYlo+wX2JmBeqrmNsr34qEH4Jz0+k4pT8SXDmfPu6yZN0VO
 15lcREBNT81PJ1snZV9BOiN3UWMGtgXWBMHeRLyyB84yyXe9HA+jmrY7eKG8ZI6R6d54
 N4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746464894; x=1747069694;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9Sl5qlzaLwkLoa7IyezxtoDVMCMI6oXTbeuYg/AGNhM=;
 b=mHmERgu90Q0XglWR0cUDvT8Pcxs8NR/Y6o4wUv4XZcCs4MGtQcchkwvV2cKzIcuehx
 tlLyllRt7UC/zNHvQHjb0O2fvNa4npaHW7U1hmv6yr1q/oNLoCbdRUklhop77LC0vyAn
 Dc8IF3odcAt8Zi640vBtQoF9s5LDBXh6gcLwx/MCqh/jouBumPrHSsPMKICNxwdWUBWI
 +3NCyuTuKSImJf7dVv1vNhFwr6PvlxQJZgvUmTEhxtzhD0Bp16TGj8o6icpuwArkGBQd
 Wu1dW2JLmlHKK4+Iv/fG55ecNIPvPvTWfDyMIOsUzKmCRg6b85nxjoUtLtcw8NZzma18
 VsjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUscX5CfwpgGckiXfmQ7VEn2pZs5k+Sv/myRBKFBD6yAQA4uC2SENbcJze4Ehd2pmODSeU3dm45nY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzBYXaYK2s2ftuqBU0Acc74O+UJmYtuFh06xG120RX+8D0NOWB
 w2aX14v4EvWScSnOTcyZa+kxvCdmHEMDcBBwjojdnmQDBhhP7nm1uPXmm24qIAE4B31J+9NWe0+
 aIc+9eYV2sMSmaUaxPXQXdE2ljZ68PbBEsXjf
X-Gm-Gg: ASbGncsPOPxEE1Vei8zxz4JtM5A+GRacw/2iyqutrJ9IDNon+1xNHBT/+KqezqzTDZr
 8teoOrCtJU9lJJxr372mgN6I6dkxv9utpRgNLf/htDWbU7HfcHHI9ciRp3pbSdt2i+M87u4B8Dl
 wc0+FAtmHpAZX/0wtv6rDM
X-Google-Smtp-Source: AGHT+IG9RbCE3tWojEKNPQx5yfnmDPTu6+mJWO90vxaZ+aQ1eZ9nWwk/u1wfl/9Tse3jgXBFSeLavdU4iiR/L3XP6AA=
X-Received: by 2002:a05:622a:586:b0:474:b44f:bb88 with SMTP id
 d75a77b69052e-490cdae6128mr590541cf.27.1746464894049; Mon, 05 May 2025
 10:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250504224149.1033867-1-tjmercier@google.com>
 <20250504224149.1033867-3-tjmercier@google.com>
 <26ca8ddf-0d78-462f-a47d-a1128b2e058f@amd.com>
 <CABdmKX2iNk22h-KxUr4yvZO80yeRRjMfoC7yjiZ-aR_f1k402g@mail.gmail.com>
 <ec43f447-095e-4baf-8610-8279b565f162@amd.com>
In-Reply-To: <ec43f447-095e-4baf-8610-8279b565f162@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 5 May 2025 10:07:59 -0700
X-Gm-Features: ATxdqUF0j9WeLA-MxEEKVNTEyhm3r86boN77kWA0rwIEETtFwZuRS9Ux9s2lLAY
Message-ID: <CABdmKX2Tpv8vpDDZ+wcdrWuijfC1wkNhJQxVSC9trPkzBLN4tA@mail.gmail.com>
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

On Mon, May 5, 2025 at 9:56=E2=80=AFAM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> On 5/5/25 18:33, T.J. Mercier wrote:
> > On Mon, May 5, 2025 at 4:17=E2=80=AFAM Christian K=C3=B6nig <christian.=
koenig@amd.com> wrote:
> >>
> >> On 5/5/25 00:41, T.J. Mercier wrote:
> >>> The dmabuf iterator traverses the list of all DMA buffers.
> >>>
> >>> DMA buffers are refcounted through their associated struct file. A
> >>> reference is taken on each buffer as the list is iterated to ensure e=
ach
> >>> buffer persists for the duration of the bpf program execution without
> >>> holding the list mutex.
> >>>
> >>> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> >>> ---
> >>>  kernel/bpf/Makefile      |   3 +
> >>>  kernel/bpf/dmabuf_iter.c | 134 +++++++++++++++++++++++++++++++++++++=
++
> >>>  2 files changed, 137 insertions(+)
> >>>  create mode 100644 kernel/bpf/dmabuf_iter.c
> >>>
> >>> diff --git a/kernel/bpf/Makefile b/kernel/bpf/Makefile
> >>> index 70502f038b92..3a335c50e6e3 100644
> >>> --- a/kernel/bpf/Makefile
> >>> +++ b/kernel/bpf/Makefile
> >>> @@ -53,6 +53,9 @@ obj-$(CONFIG_BPF_SYSCALL) +=3D relo_core.o
> >>>  obj-$(CONFIG_BPF_SYSCALL) +=3D btf_iter.o
> >>>  obj-$(CONFIG_BPF_SYSCALL) +=3D btf_relocate.o
> >>>  obj-$(CONFIG_BPF_SYSCALL) +=3D kmem_cache_iter.o
> >>> +ifeq ($(CONFIG_DMA_SHARED_BUFFER),y)
> >>> +obj-$(CONFIG_BPF_SYSCALL) +=3D dmabuf_iter.o
> >>> +endif
> >>>
> >>>  CFLAGS_REMOVE_percpu_freelist.o =3D $(CC_FLAGS_FTRACE)
> >>>  CFLAGS_REMOVE_bpf_lru_list.o =3D $(CC_FLAGS_FTRACE)
> >>> diff --git a/kernel/bpf/dmabuf_iter.c b/kernel/bpf/dmabuf_iter.c
> >>> new file mode 100644
> >>> index 000000000000..968762e11f73
> >>> --- /dev/null
> >>> +++ b/kernel/bpf/dmabuf_iter.c
> >>> @@ -0,0 +1,134 @@
> >>> +// SPDX-License-Identifier: GPL-2.0-only
> >>> +/* Copyright (c) 2025 Google LLC */
> >>> +#include <linux/bpf.h>
> >>> +#include <linux/btf_ids.h>
> >>> +#include <linux/dma-buf.h>
> >>> +#include <linux/kernel.h>
> >>> +#include <linux/seq_file.h>
> >>> +
> >>> +BTF_ID_LIST_SINGLE(bpf_dmabuf_btf_id, struct, dma_buf)
> >>> +DEFINE_BPF_ITER_FUNC(dmabuf, struct bpf_iter_meta *meta, struct dma_=
buf *dmabuf)
> >>> +
> >>> +static struct dma_buf *get_next_dmabuf(struct dma_buf *dmabuf)
> >>> +{
> >>> +     struct dma_buf *ret =3D NULL;
> >>> +
> >>> +     /*
> >>> +      * Look for the first/next buffer we can obtain a reference to.
> >>> +      *
> >>> +      * The list mutex does not protect a dmabuf's refcount, so it c=
an be
> >>> +      * zeroed while we are iterating. We cannot call get_dma_buf() =
since the
> >>> +      * caller of this program may not already own a reference to th=
e buffer.
> >>> +      */
> >>> +     mutex_lock(&dmabuf_list_mutex);
> >>> +     if (dmabuf) {
> >>
> >> That looks like you try to mangle the start and next functionality in =
just one function.
> >>
> >> I would just inline that into the dmabuf_iter_seq_start() and dmabuf_i=
ter_seq_next() functions.
> >
> > Primarily this is to share between the open coded iterator (next
> > patch) and this normal iterator since I didn't want to duplicate the
> > same list traversal code across both of them.
>
> Ah, ok that makes a bit more sense. It would still be nicer if it's in tw=
o functions since the logic doesn't share anything common except for taking=
 the lock as far as I can seee.
>
> >>
> >>
> >>> +             dma_buf_put(dmabuf);
> >>> +             list_for_each_entry_continue(dmabuf, &dmabuf_list, list=
_node) {
> >>
> >> That you can put the DMA-buf and then still uses it in list_for_each_e=
ntry_continue() only works because the mutex is locked in the destroy path.
> >
> > Yup, this was deliberate.
> >>
> >>
> >> I strongly suggest to just put those two functions into drivers/dma-bu=
f/dma-buf.c right next to the __dma_buf_debugfs_list_add() and __dma_buf_de=
bugfs_list_del() functions.
> >
> > By two functions, you mean a get_first_dmabuf(void) and a
> > get_next_dmabuf(struct dma_buf*)? To make the dma_buf_put() call a
> > little less scary since all the mutex ops are right there?
>
> Yes, exactly that's the idea. The comment above is good to have as well, =
but it only works one way.
>
> If somebody changes the DMA-buf code without looking at this here we are =
busted.

Sounds good, will do. Thanks.

>
> Regards,
> Christian.
>
> >>
> >>
> >> Apart from those style suggestions looks good to me from the technical=
 side, but I'm not an expert for the BPF stuff.
> >>
> >> Regards,
> >> Christian.
> >
> > Thanks for your comments and reviews!
> >
> >>> +                     if (file_ref_get(&dmabuf->file->f_ref)) {
> >>> +                             ret =3D dmabuf;
> >>> +                             break;
> >>> +                     }
> >>> +             }
> >>> +     } else {
> >>> +             list_for_each_entry(dmabuf, &dmabuf_list, list_node) {
> >>> +                     if (file_ref_get(&dmabuf->file->f_ref)) {
> >>> +                             ret =3D dmabuf;
> >>> +                             break;
> >>> +                     }
> >>> +             }
> >>> +     }
> >>> +     mutex_unlock(&dmabuf_list_mutex);
> >>> +     return ret;
> >>> +}
> >>> +
> >>> +static void *dmabuf_iter_seq_start(struct seq_file *seq, loff_t *pos=
)
> >>> +{
> >>> +     if (*pos)
> >>> +             return NULL;
> >>> +
> >>> +     return get_next_dmabuf(NULL);
> >>> +}
> >>> +
> >>> +static void *dmabuf_iter_seq_next(struct seq_file *seq, void *v, lof=
f_t *pos)
> >>> +{
> >>> +     struct dma_buf *dmabuf =3D v;
> >>> +
> >>> +     ++*pos;
> >>> +
> >>> +     return get_next_dmabuf(dmabuf);
> >>> +}
> >>> +
> >>> +struct bpf_iter__dmabuf {
> >>> +     __bpf_md_ptr(struct bpf_iter_meta *, meta);
> >>> +     __bpf_md_ptr(struct dma_buf *, dmabuf);
> >>> +};
> >>> +
> >>> +static int __dmabuf_seq_show(struct seq_file *seq, void *v, bool in_=
stop)
> >>> +{
> >>> +     struct bpf_iter_meta meta =3D {
> >>> +             .seq =3D seq,
> >>> +     };
> >>> +     struct bpf_iter__dmabuf ctx =3D {
> >>> +             .meta =3D &meta,
> >>> +             .dmabuf =3D v,
> >>> +     };
> >>> +     struct bpf_prog *prog =3D bpf_iter_get_info(&meta, in_stop);
> >>> +
> >>> +     if (prog)
> >>> +             return bpf_iter_run_prog(prog, &ctx);
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static int dmabuf_iter_seq_show(struct seq_file *seq, void *v)
> >>> +{
> >>> +     return __dmabuf_seq_show(seq, v, false);
> >>> +}
> >>> +
> >>> +static void dmabuf_iter_seq_stop(struct seq_file *seq, void *v)
> >>> +{
> >>> +     struct dma_buf *dmabuf =3D v;
> >>> +
> >>> +     if (dmabuf)
> >>> +             dma_buf_put(dmabuf);
> >>> +}
> >>> +
> >>> +static const struct seq_operations dmabuf_iter_seq_ops =3D {
> >>> +     .start  =3D dmabuf_iter_seq_start,
> >>> +     .next   =3D dmabuf_iter_seq_next,
> >>> +     .stop   =3D dmabuf_iter_seq_stop,
> >>> +     .show   =3D dmabuf_iter_seq_show,
> >>> +};
> >>> +
> >>> +static void bpf_iter_dmabuf_show_fdinfo(const struct bpf_iter_aux_in=
fo *aux,
> >>> +                                     struct seq_file *seq)
> >>> +{
> >>> +     seq_puts(seq, "dmabuf iter\n");
> >>> +}
> >>> +
> >>> +static const struct bpf_iter_seq_info dmabuf_iter_seq_info =3D {
> >>> +     .seq_ops                =3D &dmabuf_iter_seq_ops,
> >>> +     .init_seq_private       =3D NULL,
> >>> +     .fini_seq_private       =3D NULL,
> >>> +     .seq_priv_size          =3D 0,
> >>> +};
> >>> +
> >>> +static struct bpf_iter_reg bpf_dmabuf_reg_info =3D {
> >>> +     .target                 =3D "dmabuf",
> >>> +     .feature                =3D BPF_ITER_RESCHED,
> >>> +     .show_fdinfo            =3D bpf_iter_dmabuf_show_fdinfo,
> >>> +     .ctx_arg_info_size      =3D 1,
> >>> +     .ctx_arg_info           =3D {
> >>> +             { offsetof(struct bpf_iter__dmabuf, dmabuf),
> >>> +               PTR_TO_BTF_ID_OR_NULL },
> >>> +     },
> >>> +     .seq_info               =3D &dmabuf_iter_seq_info,
> >>> +};
> >>> +
> >>> +static int __init dmabuf_iter_init(void)
> >>> +{
> >>> +     bpf_dmabuf_reg_info.ctx_arg_info[0].btf_id =3D bpf_dmabuf_btf_i=
d[0];
> >>> +     return bpf_iter_reg_target(&bpf_dmabuf_reg_info);
> >>> +}
> >>> +
> >>> +late_initcall(dmabuf_iter_init);
> >>
>
