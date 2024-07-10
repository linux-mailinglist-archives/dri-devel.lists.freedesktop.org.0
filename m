Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7939F92D692
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 18:35:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9267210E281;
	Wed, 10 Jul 2024 16:35:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="zbybybdx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490EF10E281
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 16:35:01 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-e03a6196223so6988948276.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 09:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1720629300; x=1721234100;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BF9ive2p9YXUMgbnwW6FuoRy0oF4ePAeLEyGAEOkhY0=;
 b=zbybybdxF+hPhK1UTKvGBdRc6jlwnwYEDAHThSPTkx+W6jgqB25fr3onFICtxwmksg
 m9+z/Sp/1lD8gtyacln6sXveKsCT+h9rVSJYFy7LUAJ3VulnVYnM8DTMLIn92CsWfJR9
 LyiQfNQ3pNZkcivfY+5BjPi0nDIm1NoJsnqgJRqtWkXM4Hp2Juo4Tnw0uLeMZCuzTcAH
 LahaROPrxtqlDV9lOH3YG7X7A162UQ+ogmbR0y+Qizn+JqSwDCrJ5iQqs5EnZy9/OusW
 eFNhRfwOOKJtTn/MYzwny9JatC/+5l2iXfscddJg/Qvv0jIiTmM7Lh9kg6w55v8C6FNt
 CetA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720629300; x=1721234100;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BF9ive2p9YXUMgbnwW6FuoRy0oF4ePAeLEyGAEOkhY0=;
 b=Tbfx89gj8ARQBbIgCsQ11kUzTk17n6uuOvOXCOvMkNDmPZNnE++c8ea7LoCSrCgJtg
 M3niNn74FS0g5fPSG4WqsZ5hNKiiyM285yArz6UMBLWEQdlYcbipB/i7tGVA7bdC7K0i
 y5AR8f+621wHXvDmDNRb8cjNbV3rYwD7M7Vct+JYqT2nScEBfK1kLeVBMxJkCjttCFIf
 OO6QWH47Wp8GdsiZzlC3liGmHs85S/v1FMeVQCHAzmhtPrhYquUQNuqrxc6hQP/s7c+A
 njCy9pPi+eYW48Pte6gqSng0mD8RJO5Qlq7V+m4/0fc5A9BYZcVsWnfSAMfXj4VCx5ia
 jarw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4wMmpgFP3l4jQBsoLpkCNz1Fn0DJ+OTyh4FF1zdzfwwNQpOihaMj6ATPOmpXyRplU9ktRTXLR3iq8PKZ9senBf+bfO8LUX/zJ8XbBcK0J
X-Gm-Message-State: AOJu0YzlhRDzwt/VTypGhI/jk4gRpAEPCFJp/I6CsCtDo/9u8NFewrRc
 iXSUeP/snyZ1o8xAgef0/gM9yQvgdMUphYdQCh/7MVtNYKaosvU2CfZjwh6t6bKElIckPEbFePt
 jAVL/5YEY5II4dvASo+x39+e5dcrvRasEmja0
X-Google-Smtp-Source: AGHT+IHZ5TRrLFlHZ0PUpr8ak7tkgpez+qbokWJEToBW1Plq4/Xn+bXBEL4Smbx2jz+0wQ10oMADhbvO2AMcGSXJNgc=
X-Received: by 2002:a25:26c8:0:b0:e03:5d07:e17a with SMTP id
 3f1490d57ef6-e041b17195bmr7050542276.56.1720629299714; Wed, 10 Jul 2024
 09:34:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240710135757.25786-1-liulei.rjpt@vivo.com>
 <5e5ee5d3-8a57-478a-9ce7-b40cab60b67d@amd.com>
 <d70cf558-cf34-4909-a33e-58e3a10bbc0c@vivo.com>
 <0393cf47-3fa2-4e32-8b3d-d5d5bdece298@amd.com>
 <e8bfe5ed-130a-4f32-a95a-01477cdd98ca@vivo.com>
In-Reply-To: <e8bfe5ed-130a-4f32-a95a-01477cdd98ca@vivo.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 10 Jul 2024 09:34:47 -0700
Message-ID: <CABdmKX26f+6m9Gh34Lb+rb2yQB--wSKP3GXRRri6Nxp3Hwxavg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Support direct I/O read and write for memory
 allocated by dmabuf
To: Lei Liu <liulei.rjpt@vivo.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>, 
 Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Andrei Vagin <avagin@google.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
 Daniel Vetter <daniel@ffwll.ch>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 opensource.kernel@vivo.com, 
 quic_sukadev@quicinc.com, quic_cgoldswo@quicinc.com, 
 Akilesh Kailash <akailash@google.com>
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

On Wed, Jul 10, 2024 at 8:08=E2=80=AFAM Lei Liu <liulei.rjpt@vivo.com> wrot=
e:
>
>
> on 2024/7/10 22:48, Christian K=C3=B6nig wrote:
> > Am 10.07.24 um 16:35 schrieb Lei Liu:
> >>
> >> on 2024/7/10 22:14, Christian K=C3=B6nig wrote:
> >>> Am 10.07.24 um 15:57 schrieb Lei Liu:
> >>>> Use vm_insert_page to establish a mapping for the memory allocated
> >>>> by dmabuf, thus supporting direct I/O read and write; and fix the
> >>>> issue of incorrect memory statistics after mapping dmabuf memory.
> >>>
> >>> Well big NAK to that! Direct I/O is intentionally disabled on DMA-buf=
s.
> >>
> >> Hello! Could you explain why direct_io is disabled on DMABUF? Is
> >> there any historical reason for this?
> >
> > It's basically one of the most fundamental design decision of DMA-Buf.
> > The attachment/map/fence model DMA-buf uses is not really compatible
> > with direct I/O on the underlying pages.
>
> Thank you! Is there any related documentation on this? I would like to
> understand and learn more about the fundamental reasons for the lack of
> support.

Hi Lei and Christian,

This is now the third request I've seen from three different companies
who are interested in this, but the others are not for reasons of read
performance that you mention in the commit message on your first
patch. Someone else at Google ran a comparison between a normal read()
and a direct I/O read() into a preallocated user buffer and found that
with large readahead (16 MB) the throughput can actually be slightly
higher than direct I/O. If you have concerns about read performance,
have you tried increasing the readahead size?

The other motivation is to load a gajillion byte file from disk into a
dmabuf without evicting the entire contents of pagecache while doing
so. Something like this (which does not currently work because read()
tries to GUP on the dmabuf memory as you mention):

static int dmabuf_heap_alloc(int heap_fd, size_t len)
{
    struct dma_heap_allocation_data data =3D {
        .len =3D len,
        .fd =3D 0,
        .fd_flags =3D O_RDWR | O_CLOEXEC,
        .heap_flags =3D 0,
    };
    int ret =3D ioctl(heap_fd, DMA_HEAP_IOCTL_ALLOC, &data);
    if (ret < 0)
        return ret;
    return data.fd;
}

int main(int, char **argv)
{
        const char *file_path =3D argv[1];
        printf("File: %s\n", file_path);
        int file_fd =3D open(file_path, O_RDONLY | O_DIRECT);

        struct stat st;
        stat(file_path, &st);
        ssize_t file_size =3D st.st_size;
        ssize_t aligned_size =3D (file_size + 4095) & ~4095;

        printf("File size: %zd Aligned size: %zd\n", file_size, aligned_siz=
e);
        int heap_fd =3D open("/dev/dma_heap/system", O_RDONLY);
        int dmabuf_fd =3D dmabuf_heap_alloc(heap_fd, aligned_size);

        void *vm =3D mmap(nullptr, aligned_size, PROT_READ | PROT_WRITE,
MAP_SHARED, dmabuf_fd, 0);
        printf("VM at 0x%lx\n", (unsigned long)vm);

        dma_buf_sync sync_flags { DMA_BUF_SYNC_START |
DMA_BUF_SYNC_READ | DMA_BUF_SYNC_WRITE };
        ioctl(dmabuf_fd, DMA_BUF_IOCTL_SYNC, &sync_flags);

        ssize_t rc =3D read(file_fd, vm, file_size);
        printf("Read: %zd %s\n", rc, rc < 0 ? strerror(errno) : "");

        sync_flags.flags =3D DMA_BUF_SYNC_END | DMA_BUF_SYNC_READ |
DMA_BUF_SYNC_WRITE;
        ioctl(dmabuf_fd, DMA_BUF_IOCTL_SYNC, &sync_flags);
}

Or replace the mmap() + read() with sendfile().

So I would also like to see the above code (or something else similar)
be able to work and I understand some of the reasons why it currently
does not, but I don't understand why we should actively prevent this
type of behavior entirely.

Best,
T.J.








> >
> >>>
> >>> We already discussed enforcing that in the DMA-buf framework and
> >>> this patch probably means that we should really do that.
> >>>
> >>> Regards,
> >>> Christian.
> >>
> >> Thank you for your response. With the application of AI large model
> >> edgeification, we urgently need support for direct_io on DMABUF to
> >> read some very large files. Do you have any new solutions or plans
> >> for this?
> >
> > We have seen similar projects over the years and all of those turned
> > out to be complete shipwrecks.
> >
> > There is currently a patch set under discussion to give the network
> > subsystem DMA-buf support. If you are interest in network direct I/O
> > that could help.
>
> Is there a related introduction link for this patch?
>
> >
> > Additional to that a lot of GPU drivers support userptr usages, e.g.
> > to import malloced memory into the GPU driver. You can then also do
> > direct I/O on that malloced memory and the kernel will enforce correct
> > handling with the GPU driver through MMU notifiers.
> >
> > But as far as I know a general DMA-buf based solution isn't possible.
>
> 1.The reason we need to use DMABUF memory here is that we need to share
> memory between the CPU and APU. Currently, only DMABUF memory is
> suitable for this purpose. Additionally, we need to read very large files=
.
>
> 2. Are there any other solutions for this? Also, do you have any plans
> to support direct_io for DMABUF memory in the future?
>
> >
> > Regards,
> > Christian.
> >
> >>
> >> Regards,
> >> Lei Liu.
> >>
> >>>
> >>>>
> >>>> Lei Liu (2):
> >>>>    mm: dmabuf_direct_io: Support direct_io for memory allocated by
> >>>> dmabuf
> >>>>    mm: dmabuf_direct_io: Fix memory statistics error for dmabuf
> >>>> allocated
> >>>>      memory with direct_io support
> >>>>
> >>>>   drivers/dma-buf/heaps/system_heap.c |  5 +++--
> >>>>   fs/proc/task_mmu.c                  |  8 +++++++-
> >>>>   include/linux/mm.h                  |  1 +
> >>>>   mm/memory.c                         | 15 ++++++++++-----
> >>>>   mm/rmap.c                           |  9 +++++----
> >>>>   5 files changed, 26 insertions(+), 12 deletions(-)
> >>>>
> >>>
> >
