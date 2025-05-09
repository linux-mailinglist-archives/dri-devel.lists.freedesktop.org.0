Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A35AB1B65
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 19:13:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3F410E0C2;
	Fri,  9 May 2025 17:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ROUV4TZx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7477710E0C2
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 17:13:24 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-43cf3192d8bso1725e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 10:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1746810803; x=1747415603;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fgW/S+IuQhDMqkGx/1B5fC/F8bX0uong/zoW2X+2nEA=;
 b=ROUV4TZxiwD5KxwXC2tg+B+8490BlnAaANCt3C5ntcuUSFADItS/PZyZXx24KPmuO3
 7UryUbl7sziUj6afCMtbw3V3EW7fZr3JRW9k92RxB203SMPfUmKikFtCkj7E1G3IADze
 jA7emYMxs7q20uiavZjOvB/lNbWVRSDxW76/tf9r4WYdV/kqV+A+256KEDuHeQLrLkmn
 Q4rM+UJY+gXVl0yV6sTmGbEpjXSCa5A4tz1MYJC7yZ/kcLIpgjyMf7NCzB8RWB6+T8TZ
 dXc6+ptQ1ibT4OMf4NlKZfBSQhCz528rPXpUVY0H0RnyQxn5sqp/4U5jgoG/cIZkGPi2
 6vqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746810803; x=1747415603;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fgW/S+IuQhDMqkGx/1B5fC/F8bX0uong/zoW2X+2nEA=;
 b=b88gtuTZEdYbwVAoWQ7x7buVTxU4YU1ZHB43CKdRqVMHEZIjw7vGDSs6YU9TsuoQRz
 o/rwBnA8v7LJfyW2rttnM/qDl/Tf1MkorKqEYEUMWD1uheTAoCwAi0Gn2hdq5AAz1Eo/
 NGTRNHsksCXvn5iXsvPwbsNHEaMvSL9hUBQF8PWOnL5BrXGEzG4xPGK43EIaq4U5tMwc
 ppohsnuBci9TDdd+wT175FKq3SAy2QMRXp/8PJnzNVXfVOKcU59zPvlbw4cq8Og/2wsC
 bR3lGZjjZaY7T0T8kM+HP2TLfPKhFOyywHY1vQ5QMyoeXgB9S8I0B2bsE94Gx7ABh29O
 TopA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZxTcF3zddjOWjXMA1JnbNSOVGhtcoLnzkJUTt2R+XGXJMAG8SNCn42E5McbyDJV1DGdXzUSeUMQQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4dpVOQW94jv5TmFtenDe+pTUq1WRe0RxgQEPvYQpgB8DFPINw
 BbPCLI/YBq/2NsHWEPlqksqiLh7bdEZIdC1OsrSYPYtkfuPhatbHolCdAVawoPGxC0Rd3P7hZMo
 8aI36X30L31w6iq9EF2Q1HhVXgyoHsEqh7Qk4
X-Gm-Gg: ASbGncuZzOEUEvdbSoNagXz1WlrEVmUZPf2WvItJavaDM2o/LSXyekp/U2HdOqiuuJE
 PNt85IwgZvAcvDqyozspVZneBmVuZvpS/j3UgzVquwIsd4tY2l6lRz0OzM3HJaWZbwqCfOF0prx
 oNF4e0ixNt6P2Jjj+sNWDomnjDLf6P3Wc=
X-Google-Smtp-Source: AGHT+IHGfe/tXiaZqmJana79QrqFFike9FzFdHOfCIOTaVJ+13CLjx45F20TFT7eQCOyZ/XfQXSyYaW53E9ARHmgIFs=
X-Received: by 2002:a05:600c:3c95:b0:43b:c2cc:5075 with SMTP id
 5b1f17b1804b1-442d7c3bfd6mr1645325e9.5.1746810802780; Fri, 09 May 2025
 10:13:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250508182025.2961555-1-tjmercier@google.com>
 <20250508182025.2961555-3-tjmercier@google.com>
 <CAPhsuW6cTCEwnbfRNX0KDGGs7M+N3xf+EP9FfS5Y_OHyXqs_Qw@mail.gmail.com>
In-Reply-To: <CAPhsuW6cTCEwnbfRNX0KDGGs7M+N3xf+EP9FfS5Y_OHyXqs_Qw@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 9 May 2025 10:13:10 -0700
X-Gm-Features: AX0GCFseXwp9JI9wID6QRkim2g6TRuMaRHnwPleWxRyNB1BiSXAGkZCVkEOBhEc
Message-ID: <CABdmKX1gxShJu3L11D0-hNMwRArJrzy1UMpuKJY-CSZvAfDh-Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 2/5] bpf: Add dmabuf iterator
To: Song Liu <song@kernel.org>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, ast@kernel.org, 
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
 skhan@linuxfoundation.org, alexei.starovoitov@gmail.com, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, android-mm@google.com, 
 simona@ffwll.ch, eddyz87@gmail.com, yonghong.song@linux.dev, 
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
 jolsa@kernel.org, mykolal@fb.com, shuah@kernel.org
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

On Thu, May 8, 2025 at 5:27=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> On Thu, May 8, 2025 at 11:20=E2=80=AFAM T.J. Mercier <tjmercier@google.co=
m> wrote:
> >
> > The dmabuf iterator traverses the list of all DMA buffers.
> >
> > DMA buffers are refcounted through their associated struct file. A
> > reference is taken on each buffer as the list is iterated to ensure eac=
h
> > buffer persists for the duration of the bpf program execution without
> > holding the list mutex.
> >
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Acked-by: Song Liu <song@kernel.org>
>
> With one nitpick below.

Thanks!

> > ---
> [...]
> > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > index 8ff4add71f88..7af2ea839f58 100644
> > --- a/include/linux/dma-buf.h
> > +++ b/include/linux/dma-buf.h
> > @@ -634,4 +634,6 @@ int dma_buf_vmap(struct dma_buf *dmabuf, struct ios=
ys_map *map);
> >  void dma_buf_vunmap(struct dma_buf *dmabuf, struct iosys_map *map);
> >  int dma_buf_vmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *ma=
p);
> >  void dma_buf_vunmap_unlocked(struct dma_buf *dmabuf, struct iosys_map =
*map);
> > +struct dma_buf *dma_buf_iter_begin(void);
> > +struct dma_buf *dma_buf_iter_next(struct dma_buf *dmbuf);
> >  #endif /* __DMA_BUF_H__ */
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
> > index 000000000000..96b4ba7f0b2c
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
>
> nit: It is better to move these two lines later, to where they
> are about to be used.

I've moved them both to just before dmabuf_iter_init() farther down.
