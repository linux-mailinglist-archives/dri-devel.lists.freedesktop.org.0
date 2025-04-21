Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A41FFA9576A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 22:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C716110E4A3;
	Mon, 21 Apr 2025 20:40:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="NGigDt+n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5594110E4A3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 20:40:47 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43cfe808908so179835e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 13:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1745268045; x=1745872845;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/hk3KoCQ3cfNcS9T6WIJOvBbJ6pbk94kV2LEPNPjexo=;
 b=NGigDt+nZ+JxJxhv4mnCWo7V6ZRvk8eUwISSCmXG/9MZywIuErjXG0gN9QuMpd663F
 vgiMNgIWSm1PxL+o2C3VanX1HNmQNoDYqHmyD2E+kq5yUgB+JeY3bQUf/5XVfl4PqQcK
 J9Rq/vGsD6cuRQg/tOz6+ezQNuoAoJ7stasVlnqtVPbHdtCDvVJQ597Z2XYYKxpIUHUl
 Yq5GncQu08yhJd4VvxHb4gpdX7bghhcMPsRPFJ6QctnKfR9sXuCOOZ0c9T4z65z0dnpr
 Fj4flDKCfIHL7dwqMTz7W7HMRRQyn5kx9znnl8aGmyg5ICrwa2f2ifCqkDJbJt+EI86A
 Sohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745268045; x=1745872845;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/hk3KoCQ3cfNcS9T6WIJOvBbJ6pbk94kV2LEPNPjexo=;
 b=Y35TS2968J0GLphvv820iFiw9GT9H1uxkEUyBVH713i6zmz/DMIK6X8w09qLwG9opo
 RjuQOyJ+0odnsRBFlEO/oKwgpGE4lOUbGpEvG8F5PZe18iVA2lspfLTSVCzHsbGDqLzF
 BsXY4EzZCYl0KnNN6zGXOgfn3nwpJvuX4l+veYv6NjOEgaVoM+I2NbYRfhOd5FfUiwWh
 owqNRs8AnU5l9sb1BI5TNMkuBRR8iysHuXjyhJFJI2P0y+IqibD9+fSRluUlLMf9g1Zd
 H7gMdafWEX8xqZQmduqhlCfE70RNi8i4m/n3TqeYB86NK/rWslhxHJ/eMtMznPHk227q
 cWVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIpE1T8qT3PjuhUoN/vZ9QQt/iqqmjCL124exIBFSyLTHGuZvrpl5GdNM5CXt13YEQM3w649g4ygY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzn0azqmNJ4F3EvtdFOHqRm4An5GBCm3oCz5x8RO9Xd12muUyqJ
 FfhcLbHhdBdp1KNgmcVzCOVnhG5QUP2eraaqhFN1LtnRKhmZHdv76aLnHERe8q1neSGbHgV7VEc
 62t1zIhxPiE47Mbq27SEw2ilRSKqplE9uzoWV
X-Gm-Gg: ASbGncv3AWUn6NVgp0DJKs7xaEjGYuHp6FFHqIqw4jRdXEOUbWRt9q7efr8OTVG7QJb
 t7EXhGQ0lF3gtEJgCwkXpXO3EUB0zoJ3PtSIeNVfPEWCsiUUz6HQ2MF+KludY5S12ivByUqGyOu
 PG/6da32jr4IV8maYmF1keTVFJcGmTveXv
X-Google-Smtp-Source: AGHT+IGWcp45aLSZt8FM85c+hC9w5ExOa3HAud/x2yrnqew4c284QGEuar9sexOtbZfwcaDamqAvguiKQzmIHXztEi0=
X-Received: by 2002:a05:600c:4e47:b0:43d:169e:4d75 with SMTP id
 5b1f17b1804b1-4406b5e061dmr4739435e9.1.1745268045300; Mon, 21 Apr 2025
 13:40:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250414225227.3642618-1-tjmercier@google.com>
 <20250414225227.3642618-3-tjmercier@google.com>
 <CAPhsuW54g5YCmLVX=cc3m2nfQTZrMH+6ZMBgouEMMfqcccOtww@mail.gmail.com>
In-Reply-To: <CAPhsuW54g5YCmLVX=cc3m2nfQTZrMH+6ZMBgouEMMfqcccOtww@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 21 Apr 2025 13:40:32 -0700
X-Gm-Features: ATxdqUHzaEdOwMz7Tlm_8h9gjvDy0ZSo4bia9-RfsuFhcpdkvxrkrY5bpFAEPyo
Message-ID: <CABdmKX1OqLLsY5+LSMU-c=DDUxTFaivNcyXG3ntD8D0ty1Pwig@mail.gmail.com>
Subject: Re: [PATCH 2/4] bpf: Add dmabuf iterator
To: Song Liu <song@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
 martin.lau@linux.dev, skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, 
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

On Mon, Apr 21, 2025 at 10:58=E2=80=AFAM Song Liu <song@kernel.org> wrote:
>
> On Mon, Apr 14, 2025 at 3:53=E2=80=AFPM T.J. Mercier <tjmercier@google.co=
m> wrote:
> >
> > The dmabuf iterator traverses the list of all DMA buffers. The list is
> > maintained only when CONFIG_DEBUG_FS is enabled.
> >
> > DMA buffers are refcounted through their associated struct file. A
> > reference is taken on each buffer as the list is iterated to ensure eac=
h
> > buffer persists for the duration of the bpf program execution without
> > holding the list mutex.
> >
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > ---
> >  include/linux/btf_ids.h  |   1 +
> >  kernel/bpf/Makefile      |   3 +
> >  kernel/bpf/dmabuf_iter.c | 130 +++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 134 insertions(+)
> >  create mode 100644 kernel/bpf/dmabuf_iter.c
> >
> > diff --git a/include/linux/btf_ids.h b/include/linux/btf_ids.h
> > index 139bdececdcf..899ead57d89d 100644
> > --- a/include/linux/btf_ids.h
> > +++ b/include/linux/btf_ids.h
> > @@ -284,5 +284,6 @@ extern u32 bpf_cgroup_btf_id[];
> >  extern u32 bpf_local_storage_map_btf_id[];
> >  extern u32 btf_bpf_map_id[];
> >  extern u32 bpf_kmem_cache_btf_id[];
> > +extern u32 bpf_dmabuf_btf_id[];
>
> This is not necessary. See below.
>
> >
> >  #endif
> > diff --git a/kernel/bpf/Makefile b/kernel/bpf/Makefile
> > index 70502f038b92..5b30d37ef055 100644
> > --- a/kernel/bpf/Makefile
> > +++ b/kernel/bpf/Makefile
> > @@ -53,6 +53,9 @@ obj-$(CONFIG_BPF_SYSCALL) +=3D relo_core.o
> >  obj-$(CONFIG_BPF_SYSCALL) +=3D btf_iter.o
> >  obj-$(CONFIG_BPF_SYSCALL) +=3D btf_relocate.o
> >  obj-$(CONFIG_BPF_SYSCALL) +=3D kmem_cache_iter.o
> > +ifeq ($(CONFIG_DEBUG_FS),y)
> > +obj-$(CONFIG_BPF_SYSCALL) +=3D dmabuf_iter.o
> > +endif
> >
> >  CFLAGS_REMOVE_percpu_freelist.o =3D $(CC_FLAGS_FTRACE)
> >  CFLAGS_REMOVE_bpf_lru_list.o =3D $(CC_FLAGS_FTRACE)
> > diff --git a/kernel/bpf/dmabuf_iter.c b/kernel/bpf/dmabuf_iter.c
> > new file mode 100644
> > index 000000000000..b4b8be1d6aa4
> > --- /dev/null
> > +++ b/kernel/bpf/dmabuf_iter.c
>
> Maybe we should add this file to drivers/dma-buf. I would like to
> hear other folks thoughts on this.

This is fine with me, and would save us the extra
CONFIG_DMA_SHARED_BUFFER check that's currently needed in
kernel/bpf/Makefile but would require checking CONFIG_BPF instead.
Sumit / Christian any objections to moving the dmabuf bpf iterator
implementation into drivers/dma-buf?

> > @@ -0,0 +1,130 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/* Copyright (c) 2025 Google LLC */
> > +#include <linux/bpf.h>
> > +#include <linux/btf_ids.h>
> > +#include <linux/dma-buf.h>
> > +#include <linux/kernel.h>
> > +#include <linux/seq_file.h>
> > +
> > +BTF_ID_LIST_GLOBAL_SINGLE(bpf_dmabuf_btf_id, struct, dma_buf)
>
> Use BTF_ID_LIST_SINGLE(), then we don't need this in btf_ids.h
>
> > +DEFINE_BPF_ITER_FUNC(dmabuf, struct bpf_iter_meta *meta, struct dma_bu=
f *dmabuf)
> > +
> > +static void *dmabuf_iter_seq_start(struct seq_file *seq, loff_t *pos)
> > +{
> > +       struct dma_buf *dmabuf, *ret =3D NULL;
> > +
> > +       if (*pos) {
> > +               *pos =3D 0;
> > +               return NULL;
> > +       }
> > +       /* Look for the first buffer we can obtain a reference to.
> > +        * The list mutex does not protect a dmabuf's refcount, so it c=
an be
> > +        * zeroed while we are iterating. Therefore we cannot call get_=
dma_buf()
> > +        * since the caller of this program may not already own a refer=
ence to
> > +        * the buffer.
> > +        */
>
> We should use kernel comment style for new code. IOW,
> /*
>  * Look for ...
>  */
>
>
> Thanks,
> Song

Thanks, I have incorporated all of your comments and retested. I will
give some time for more feedback before sending a v2.
>
> [...]
