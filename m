Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B73AD8C4978
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 00:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF1410E295;
	Mon, 13 May 2024 22:04:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Lubn51QI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9138910E295
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 22:04:42 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a59a0168c75so1272178066b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 15:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715637881; x=1716242681; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+0gk5sE+9z6u1bvtThXAEXcXoGXfYoS4SNzR6gH/Yac=;
 b=Lubn51QI7u3GT5/REtX7lSKG3jqOy+Gsiugn+kxauGnOOdEVTmrt9z0VTQt7VF6tsO
 LbMb+H96g6Lh7mV4P598acwNeqaLUAculGU768MtaAGG1PWTLuH8sobhacEFUp/dSMEl
 rYEQoxohnbb2gaDt+oJ3kwyylLoGIN8sKsnas4tu05kSBxzMhcRCqq2G+xUreO20Ditr
 zHdKzrnIMkw9tU6TBtMNvs20b/uLP958tcdOwhdMi1lIRv7alNwipAK7+AbDXvwDgIL7
 36Epx8o2uppZCQMnlhKRjBJbVZXgvdA5PLQiYXKW+6WI0yo3sMDldTa3lkW9k28Uavqg
 3eTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715637881; x=1716242681;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+0gk5sE+9z6u1bvtThXAEXcXoGXfYoS4SNzR6gH/Yac=;
 b=TUN5BY2EfHdV7o1axJd6vVQYgMuOWZOWTjqcZEL3iHX3IaV9/Ba1QLCNoeP8L1vuCx
 kV3gxSaj7f7qbQABKKuCWBPhtRwCr5IGLyWq7J2wvKVyMVEWke0tnIp8p5R1TINoF1Gr
 mZnLvA1+4jauF/NJLp97HorkEnEvtMrtmYlB4OvHuQBZSJWH9jA0p2oRvViECZrGTWx7
 yltC4Oe/jusE1qdZXVi6KxCgJNCuDC/FaCJue4zhQSkcdXwd3gkrbTWmgM7dtTUhg0mi
 OrR+s5xLBn3dCBzm+5J/EeNqDh+4lkVQ8LfPVAo1uNnqnPA8yjPcb/KHubcZdIQ03DG6
 //xA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWA1Qg4BjKbgpBJsgqJ/FKNSjHDlUtQakDGVlSZLm1/QVTbB4Dk2THCnFJKrOMs+vXnr9po8mIfVLzez6qM2CAZ7VT47v9RVGt4dRqPjMj6
X-Gm-Message-State: AOJu0Yzcdz0t2JLZ3pN/wUoOAZ7tfqRRZ3fjxgx19Tr61jhuoOmoSP/I
 pxjO4KPnZhsMGN0dPV7wlAq3vJajH8Ah03X0AWUqRBR0pE7J7EAM5aueBwEVZq1YwtnQnMtaQ+r
 pvZuNHBcqpxxxE3B/UjT/3wo79pv+2w==
X-Google-Smtp-Source: AGHT+IHXIGkY+GN3yrNinx8IwSkayBEpqu38CqL4pEdPdniXYCaie/XSqRAiER6yHDLE2rEn9+oZ52mLr0XtLxxsXxs=
X-Received: by 2002:a50:d7c8:0:b0:56e:2f39:c5d2 with SMTP id
 4fb4d7f45d1cf-5734d590143mr7512130a12.7.1715637880579; Mon, 13 May 2024
 15:04:40 -0700 (PDT)
MIME-Version: 1.0
References: <CABQX2QMVfsZZrHLktZ=MhJ5gG1ATRuSGa+E-CKfXATgU5BwMwQ@mail.gmail.com>
 <973b5119-0fca-4420-b5d2-b5b4862c77cc@amd.com>
In-Reply-To: <973b5119-0fca-4420-b5d2-b5b4862c77cc@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 13 May 2024 15:04:28 -0700
Message-ID: <CAF6AEGvm2VVQR7h2S5eM212q+AvrkdhsphAetp0ebM=t7PvN0Q@mail.gmail.com>
Subject: Re: dma-buf sg mangling
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Zack Rusin <zack.rusin@broadcom.com>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>
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

On Mon, May 13, 2024 at 11:27=E2=80=AFAM Christian K=C3=B6nig
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
>
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
>
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

It _think_ Zack is trying to map guest paged back buffers to the host
GPU?  Which would require sending the pfn's in some form to the host
vmm..

virtgpu goes the other direction with mapping host page backed GEM
buffers to guest as "vram" (although for various reasons I kinda want
to go in the other direction)

BR,
-R

> Regards,
> Christian.
>
> >
> > z
>
