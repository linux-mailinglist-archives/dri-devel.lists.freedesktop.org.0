Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 715D78C4BA5
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 06:15:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA27A10E14B;
	Tue, 14 May 2024 04:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="b/6uXfJr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ABD110E14B
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 04:15:23 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-622f5a0badcso14231077b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 21:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1715660122; x=1716264922;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y6V8BG6QQlqYcGHqqa0MJf7apWQPaMn+4tUN8PXlbSo=;
 b=b/6uXfJr6CwLJolibfzAYQwz5sd1f2yq3stCnnKR4WFo12nRVjHa+KD9ZOYndszlE1
 dskObCEsrvUtejKY/R2bjpJPaYc37fcbiAdHz7hU2NzMKJXzB5rXWq2/XrwhWdFE35Ul
 7t5BixUGqVXNKR5FIpa+UN2uvUR9d36Wvj4G0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715660122; x=1716264922;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y6V8BG6QQlqYcGHqqa0MJf7apWQPaMn+4tUN8PXlbSo=;
 b=lIuhUtRqv5PdtAw8EVArPDagOfVrZU0iUVzwoXVRP72ezK/bmbnWB5+K2890UPAaSN
 kXAIT0Fe4U7zO30pgNA3VVOEIW72rUlcCHzlq1Fg03Zo+pXXIQoZpAfrAoPmAqsTeWP5
 Xfr0nWlumWQjE1Z6sAvxAvE2QdY1WJkISodeVKpoQX8m8QvI3yJiMsDDimfmddy21e+N
 e0tCBdBN2+/TeQKcD/ud/3bOVEizMgrvVZ3M7cPjzKbo/qFi6XM+q8av73hj2fGP5DHi
 zjx4eGKQHSpcnvsr4PPcDjLZo1Pkfa7xlcGcZN3ZAMLzPpiabmdNyiYccdRl8n6jo5dQ
 G6Ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNdovMNxrdH7Fs/rNRLaaY9+HTFndHCNRJrZZWorm/Ay+uUMKkDJAmJjD7Z0PC7Gb1Y/dQXlq89agWF9p4bQs81J5CpRZUAvkI3vp1+Tds
X-Gm-Message-State: AOJu0YxJCUwv6jjb67jxoTRf/t+ggUiR10J45qU7lcntvGA23+9pXKxG
 JZOfM1Zb5BEg9sIOttEVKKfGHdUws8zJKk/Hg+0iJXLHThRQOJtQNXDq4SYxVzme9CUUGuYd1DV
 pfXAkYr18z4xpeisPB6s3GYcRqP2HBOgifeb8
X-Google-Smtp-Source: AGHT+IGuSGI6VCCKulNxKzR3XmtToE9E6BqfSt4rLPU/9Cnp0QJOhgusySEmvDAU1g7GfDfQfVifJgbztmPat1xY8bE=
X-Received: by 2002:a05:690c:6c87:b0:61b:33c8:7bce with SMTP id
 00721157ae682-622afff705emr120705187b3.31.1715660121838; Mon, 13 May 2024
 21:15:21 -0700 (PDT)
MIME-Version: 1.0
References: <CABQX2QMVfsZZrHLktZ=MhJ5gG1ATRuSGa+E-CKfXATgU5BwMwQ@mail.gmail.com>
 <973b5119-0fca-4420-b5d2-b5b4862c77cc@amd.com>
In-Reply-To: <973b5119-0fca-4420-b5d2-b5b4862c77cc@amd.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Tue, 14 May 2024 00:15:10 -0400
Message-ID: <CABQX2QMj=JjJ=zHQ8UUkXtonOfZJqq-U8TAjrwk2-0zh-4ro=w@mail.gmail.com>
Subject: Re: dma-buf sg mangling
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
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

On Mon, May 13, 2024 at 1:09=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 10.05.24 um 18:34 schrieb Zack Rusin:
> > Hey,
> >
> > so this is a bit of a silly problem but I'd still like to solve it
> > properly. The tldr is that virtualized drivers abuse
> > drm_driver::gem_prime_import_sg_table (at least vmwgfx and xen do,
> > virtgpu and xen punt on it) because there doesn't seem to be a
> > universally supported way of converting the sg_table back to a list of
> > pages without some form of gart to do it.
>
> Well the whole point is that you should never touch the pages in the
> sg_table in the first place.
>
> The long term plan is actually to completely remove the pages from that
> interface.

First let me clarify that I'm not arguing for access to those pages.
What I'd like to figure out are precise semantics for all of this
prime import/map business on drivers that don't have some dedicated
hardware to turn dma_addr_t array into something readable. If the
general consensus is that those devices are broken, so be it.

> > drm_prime_sg_to_page_array is deprecated (for all the right reasons on
> > actual hardware) but in our cooky virtualized world we don't have
> > gart's so what are we supposed to do with the dma_addr_t from the
> > imported sg_table? What makes it worse (and definitely breaks xen) is
> > that with CONFIG_DMABUF_DEBUG the sg page_link is mangled via
> > mangle_sg_table so drm_prime_sg_to_page_array won't even work.
>
> XEN and KVM were actually adjusted to not touch the struct pages any more=
.
>
> I'm not sure if that work is already upstream or not but I had to
> explain it over and over again why their approach doesn't work.

I'd love to see those patches. Upstream xen definitely still uses it:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/gpu/drm/xen/xen_drm_front_gem.c#n263
which looks pretty broken to me, especially with CONFIG_DMABUF_DEBUG
because drm_gem_prime_import
will call dma_buf_map_attachment_unlocked:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/gpu/drm/drm_prime.c#n940
which will call __map_dma_buf
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/dma-buf/dma-buf.c#n1131
which will mangle the sg's page_list before calling xen's
gem_prime_import_sg_table. Which means the drm_prime_sg_to_page_array
that's used in xen's gem_prime_import_sg_table is silently generating
broken pages and the entire thing should just be a kernel oops (btw,
it'd probably be a good idea to not have drm_prime_sg_to_page_array
generate garbage with CONFIG_DMABUF_DEBUG and print some kind of a
warning).

> > The reason why I'm saying it's a bit of a silly problem is that afaik
> > currently it only affects IGT testing with vgem (because the rest of
> > external gem objects will be from the virtualized gpu itself which is
> > different). But do you have any ideas on what we'd like to do with
> > this long term? i.e. we have a virtualized gpus without iommu, we have
> > sg_table with some memory and we'd like to import it. Do we just
> > assume that the sg_table on those configs will always reference cpu
> > accessible memory (i.e. if it's external it only comes through
> > drm_gem_shmem_object) and just do some horrific abomination like:
> > for (i =3D 0; i < bo->ttm->num_pages; ++i) {
> >      phys_addr_t pa =3D dma_to_phys(vmw->drm.dev, bo->ttm->dma_address[=
i]);
> >      pages[i] =3D pfn_to_page(PHYS_PFN(pa));
> > }
> > or add a "i know this is cpu accessible, please demangle" flag to
> > drm_prime_sg_to_page_array or try to have some kind of more permanent
> > solution?
>
> Well there is no solution for that. Accessing the underlying struct page
> through the sg_table is illegal in the first place.
>
> So the question is not how to access the struct page, but rather why do
> you want to do this?

Rob mentioned one usecase, but to be honest, as I mentioned in the
beginning I'd like to have a semantic clarity to the general problem
of going from dma_addr_t to something readable on non iomem resources,
e.g. get the IGT vgem<->vmwgfx tests running, i.e.:
vgem_handle =3D dumb_buffer_create(vgem_fd, ....);
dma_buf_fd =3D prime_handle_to_fd(vgem_fd, vgem_handle);
vmw_handle =3D prime_fd_to_handle(vmw_fd, dma_buf_fd);
void *ptr =3D vmw_map_bo(vmw_fd, vmw_handle, ...); <- crash

trying to map that bo will crash because we'll endup in
ttm_bo_vm_fault_reserved which will check whether
bo->resource->bus.is_iomem, which it won't be because every vmwgfx
buffer is just system memory and it will try to access the ttm pages
which don't exist and crash:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/gpu/drm/ttm/ttm_bo_vm.c#n249

On our hypervisors that are less than 8 years old all of vmwgfx
buffers are always system memory, and when we get an external buffer
from vgem, which is also system memory we have no currently supported
way of populating the ttm::pages to be able to map/read it.

It's fine if the general consensus is "that's crazy, we can't fault on
external buffers pages" and "without some gart like thing in your
device we can not make prime work" but I do want to have some clarity
on how/whether this is supposed to work.

Or to put it another way: imagine two different cpu vgem like drivers,
how does one driver import the sg_table from another and convert it to
something userspace readable?

z
