Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B41808C7059
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 04:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A82510E228;
	Thu, 16 May 2024 02:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="fIc9uCtv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ECF410E228
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 02:40:32 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-61e04fcf813so86720487b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 19:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1715827231; x=1716432031;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bqhSr8Swjhj6S9UuVvZnIBO4HqKetmaqFyiWrtYqYws=;
 b=fIc9uCtvKU2v2wlfKnKIY0mCKsugyxG4HIC6hwaCxvH6msfKmYr89CE1TcBM25SLKm
 H4Pp/s5RbzWFf3sd2h0JFUqn+KkE+ZQbvzi/C33+NMOACevb4+NybSGeEkN8pXrCvAMS
 ZHJeeDF8G1otUT+fvtTmC6/FI/o/tJADrZObY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715827231; x=1716432031;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bqhSr8Swjhj6S9UuVvZnIBO4HqKetmaqFyiWrtYqYws=;
 b=OEq+Jnpu12SCYwMhhjg8oJcy3fEX0npvKJqYLthExdr/Bt46jwRlbYzz6PaqWGi0YK
 E1fITH90XJn2cilxSNvtmviiF5/5Mu568STCK7fRy1CscXLBatu4S6ol6q/s8k4Ml1Ky
 zpv4A/QFDq0fXwlSLc1PzmyB/vMLv7J7TxDzUBS5ik148gaknDu1AMlfuIfpHaWZ/Ucn
 P5vt4NSHUZNeSgsGUDY2WAbax3xO1PduFFKJrSJ7WRJ4Zk1t8nsEsLxr3ua9fYYzvfgJ
 PdXSVP7qn/tGEdQcxqXSwsHeaR/hnZWXoKJTvPRnBadL2I5RbrGz7n79nn8oYErJiKYQ
 sj8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXos8zXnGKK5mZth2IjGMQLujAuE1VT27j3HFu7WVI4IEbShIwkaVLg0PJT1mr3e6bnhEM9GKRYl8xcLjU8y7QH6E/m0NRkwBVd2kkH4fQq
X-Gm-Message-State: AOJu0Yzb/vDZfye2mtXTPxzhGqiv6QtG2sqwq3pFVB7iZQVC0Cgdq3Om
 kpWcMAjYkUUtOc6MYmlcVj3lm7nynl6qr9svUH/vjUwybN+eyP4UCuXnHJcY+gLzacPa0UjccIB
 c01tUyLUXlPc1ChgMNh97NtibEsT/6ew9x8oK
X-Google-Smtp-Source: AGHT+IEKQliGi1mBScfkSyB2TRmJwIrP1qw9VmJjNRzq6zCYYU0MEgsnCtCKWAEeqqL4bmiI6pjcRAH72oE4o1Yze5E=
X-Received: by 2002:a05:690c:6c03:b0:61a:b573:65f4 with SMTP id
 00721157ae682-622affc5609mr183928967b3.6.1715827231062; Wed, 15 May 2024
 19:40:31 -0700 (PDT)
MIME-Version: 1.0
References: <CABQX2QMVfsZZrHLktZ=MhJ5gG1ATRuSGa+E-CKfXATgU5BwMwQ@mail.gmail.com>
 <973b5119-0fca-4420-b5d2-b5b4862c77cc@amd.com>
 <CABQX2QMj=JjJ=zHQ8UUkXtonOfZJqq-U8TAjrwk2-0zh-4ro=w@mail.gmail.com>
 <5c028e48-4482-4375-822b-e1018a98b7cb@amd.com>
In-Reply-To: <5c028e48-4482-4375-822b-e1018a98b7cb@amd.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Wed, 15 May 2024 22:40:20 -0400
Message-ID: <CABQX2QNd=k0T0um9LLZPqwWT2O=xLxRbXERVy=YCmvWp3+moZg@mail.gmail.com>
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

On Tue, May 14, 2024 at 3:00=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 14.05.24 um 06:15 schrieb Zack Rusin:
>
> On Mon, May 13, 2024 at 1:09=E2=80=AFPM Christian K=C3=B6nig
> <christian.koenig@amd.com> wrote:
>
> Am 10.05.24 um 18:34 schrieb Zack Rusin:
>
> Hey,
>
> so this is a bit of a silly problem but I'd still like to solve it
> properly. The tldr is that virtualized drivers abuse
> drm_driver::gem_prime_import_sg_table (at least vmwgfx and xen do,
> virtgpu and xen punt on it) because there doesn't seem to be a
> universally supported way of converting the sg_table back to a list of
> pages without some form of gart to do it.
>
> Well the whole point is that you should never touch the pages in the
> sg_table in the first place.
>
> The long term plan is actually to completely remove the pages from that
> interface.
>
> First let me clarify that I'm not arguing for access to those pages.
> What I'd like to figure out are precise semantics for all of this
> prime import/map business on drivers that don't have some dedicated
> hardware to turn dma_addr_t array into something readable. If the
> general consensus is that those devices are broken, so be it.
>
>
> Well that stuff is actually surprisingly well documented, see here: https=
://docs.kernel.org/driver-api/dma-buf.html#cpu-access-to-dma-buffer-objects
>
> It's just that the documentation is written from the perspective of the e=
xporter and userspace, so it's probably not that easy to understand what yo=
u should do as an importer.
>
> Maybe we should add a sentence or two to clarify this.
>
> drm_prime_sg_to_page_array is deprecated (for all the right reasons on
> actual hardware) but in our cooky virtualized world we don't have
> gart's so what are we supposed to do with the dma_addr_t from the
> imported sg_table? What makes it worse (and definitely breaks xen) is
> that with CONFIG_DMABUF_DEBUG the sg page_link is mangled via
> mangle_sg_table so drm_prime_sg_to_page_array won't even work.
>
> XEN and KVM were actually adjusted to not touch the struct pages any more=
.
>
> I'm not sure if that work is already upstream or not but I had to
> explain it over and over again why their approach doesn't work.
>
> I'd love to see those patches. Upstream xen definitely still uses it:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/gpu/drm/xen/xen_drm_front_gem.c#n263
> which looks pretty broken to me, especially with CONFIG_DMABUF_DEBUG
> because drm_gem_prime_import
> will call dma_buf_map_attachment_unlocked:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/gpu/drm/drm_prime.c#n940
> which will call __map_dma_buf
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/dma-buf/dma-buf.c#n1131
> which will mangle the sg's page_list before calling xen's
> gem_prime_import_sg_table. Which means the drm_prime_sg_to_page_array
> that's used in xen's gem_prime_import_sg_table is silently generating
> broken pages and the entire thing should just be a kernel oops (btw,
> it'd probably be a good idea to not have drm_prime_sg_to_page_array
> generate garbage with CONFIG_DMABUF_DEBUG and print some kind of a
> warning).
>
>
> I honestly didn't followed the discussion to the end, but both Sima and m=
e pointed that out to the XEN people and there were quite a bit of back and=
 forth how to fix it.
>
> Let me try to dig that up.
>
>
> The reason why I'm saying it's a bit of a silly problem is that afaik
> currently it only affects IGT testing with vgem (because the rest of
> external gem objects will be from the virtualized gpu itself which is
> different). But do you have any ideas on what we'd like to do with
> this long term? i.e. we have a virtualized gpus without iommu, we have
> sg_table with some memory and we'd like to import it. Do we just
> assume that the sg_table on those configs will always reference cpu
> accessible memory (i.e. if it's external it only comes through
> drm_gem_shmem_object) and just do some horrific abomination like:
> for (i =3D 0; i < bo->ttm->num_pages; ++i) {
>      phys_addr_t pa =3D dma_to_phys(vmw->drm.dev, bo->ttm->dma_address[i]=
);
>      pages[i] =3D pfn_to_page(PHYS_PFN(pa));
> }
> or add a "i know this is cpu accessible, please demangle" flag to
> drm_prime_sg_to_page_array or try to have some kind of more permanent
> solution?
>
> Well there is no solution for that. Accessing the underlying struct page
> through the sg_table is illegal in the first place.
>
> So the question is not how to access the struct page, but rather why do
> you want to do this?
>
> Rob mentioned one usecase, but to be honest, as I mentioned in the
> beginning I'd like to have a semantic clarity to the general problem
> of going from dma_addr_t to something readable on non iomem resources,
> e.g. get the IGT vgem<->vmwgfx tests running, i.e.:
> vgem_handle =3D dumb_buffer_create(vgem_fd, ....);
> dma_buf_fd =3D prime_handle_to_fd(vgem_fd, vgem_handle);
> vmw_handle =3D prime_fd_to_handle(vmw_fd, dma_buf_fd);
> void *ptr =3D vmw_map_bo(vmw_fd, vmw_handle, ...); <- crash
>
> trying to map that bo will crash because we'll endup in
> ttm_bo_vm_fault_reserved which will check whether
> bo->resource->bus.is_iomem, which it won't be because every vmwgfx
> buffer is just system memory and it will try to access the ttm pages
> which don't exist and crash:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/gpu/drm/ttm/ttm_bo_vm.c#n249
>
>
> Going through TTM for the VM fault is completely illegal to begin with. W=
hat you do instead is to re-route the mmap() request to the exporter, see h=
ow dma_buf_mmap() is being used by drm_gem_shmem_mmap() for an example.
>
> It was even discussed to do this generally in the GEM layer, but IIRC it =
was rejected because driver stacks should avoid doing this and use the orig=
inal exporter for the mmap() instead when possible.
>
> Sima and Thomas probably knew this better than me, but I think the proble=
m might be that VMWGFX didn't used that GEM layer until recently and so mos=
t likely never enforced some of the restrictions there.
>
> On our hypervisors that are less than 8 years old all of vmwgfx
> buffers are always system memory, and when we get an external buffer
> from vgem, which is also system memory we have no currently supported
> way of populating the ttm::pages to be able to map/read it.
>
> It's fine if the general consensus is "that's crazy, we can't fault on
> external buffers pages" and "without some gart like thing in your
> device we can not make prime work" but I do want to have some clarity
> on how/whether this is supposed to work.
>
>
> Short summary is that you redirect your mmap() call to the dma_buf_mmap()=
 instead of handling it yourself.
>
>
> Or to put it another way: imagine two different cpu vgem like drivers,
> how does one driver import the sg_table from another and convert it to
> something userspace readable?
>
>
> Well you don't touch the sg_table at all in that case.
>
> If you need an userspace mapping you use dma_buf_mmap(), if you need a ke=
rnel mapping you use the vmap interface.
>
> If you are a hypervisor like XEN, KVM and VMW you basically don't touch a=
ny of that and just mirror parts of an address space between host and guest=
 through an MMU notifier (include faults and invalidation).
>
> See the recent (~2 month old) discussion between Christoph Hellwig, the K=
VM people and me on the some mailing lists.

Ah, ok, that sounds great, thanks! So the bottom line is that it
doesn't matter if you know what the imported dma-buf actually is, the
contract is that you can only get dma_addr_t's from the imported
sgtable and if you don't have anything that would do some neat mapping
of those dma addresses for you, you just treat the entire thing like
an external entity and forward the mapping requests to the exporter.
That makes sense. I'll fix vmwgfx to properly follow those semantics.
Thanks!

z
