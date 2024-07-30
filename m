Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84919941DA8
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 19:19:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0CE10E2D4;
	Tue, 30 Jul 2024 17:19:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="vWeumsey";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A933E10E2D4
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 17:19:48 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-e0878971aa9so82213276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 10:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1722359987; x=1722964787;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=50ihWq+OMt1qmXo9FIMuhD6DpSzfA1Idh4Ob7/5a+qo=;
 b=vWeumseyjtwtfVOIDVpavWzRYq36kPHomxxinFmPb23rDMW2UtkU+uOJpaVilV8Tff
 5MI8PQOh5C+EFJp1M2IbqknEYgfsVD3Tm0l2WZ8TIBjeKiTofDApOURgftIBXit6Mtig
 4mZYxv76EKMh9bv36h+dPjd5sO83DMGLmd4ErRvZf4yz6mxyR0WxCKxGArdsFmA4zGz9
 oBo2O1hkQrDQvm/Y5zLXcfdD3Id8q18Pvu5Mf3E/C+yuedWc2mrNwjABjBlimGgEDivj
 jojL4xWkhKHZn/d63sKSljkDV5OQ7OidbfiY27JZAZT9YbJ6McbLgPiOpshuBsG4AAVh
 DnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722359987; x=1722964787;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=50ihWq+OMt1qmXo9FIMuhD6DpSzfA1Idh4Ob7/5a+qo=;
 b=Ft4Q2FpTxp6uVlrPT13vtpk/rvXa4lqc5rbo1Wg8lz8ei2Zvid/4mrKyNefrrd48f/
 6cELBHWwTSJmBsz46fmoRAGS/tT875re83w73Q1889XFVGyVU4T+1HvP4h5/Xxurbn3l
 gIetdYYjVrjbb4U43EojHVOrzI2KvkC0WRYdTcy/920ut3b9g/GWs1MEEYZx3fHqz+9y
 +xpknG5FI1yG0pDqu9nhREGtTCMJ5kqWEeFKV14DHAxiFkRklLd75v8jSU9az+owSvZ8
 kTsIoSnHUNLdPhopnaUgTqVQq1vLkoOmIlvUjuoeqInrT/QRgICAVvaANqmdiAOvp1IB
 Jv1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUru5Yy8iEWfYOAsgAbIyxUaALcO4HZ3T8Li5sBwsEs/Bqp20bfK+LkCfYa1JrOzuw76bLwVKajgTnyvjNJsc0dLiKkz23w2GydoipYrhce
X-Gm-Message-State: AOJu0YwuYMFEcg7VrI48hyEKxAiSIzSpBx/yPZro4XJcx0H2DVpSdRyt
 LfjS951vEV7vLqc8OTsoG0awodG0mnigsJpF2kulFObk4qeHFnXXkzOt2HkQ8CxOYsw6ky+VX9y
 WYM74Xk/KyPpZcjec5JzT9skEeL+YNXSC5nSZ
X-Google-Smtp-Source: AGHT+IH4+GXSuMhyss48q+/b1wf32mVuSBC5miJhiV2nELU4EVTyprl1zzdaeYnXSTwMk9T/tXbSFNWGCO3iYK3XPzY=
X-Received: by 2002:a25:d3ca:0:b0:e0b:a699:bc9a with SMTP id
 3f1490d57ef6-e0ba699be3fmr2148560276.16.1722359987226; Tue, 30 Jul 2024
 10:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240730075755.10941-1-link@vivo.com>
 <d2f56198-a3c2-4f7b-9d10-616deb348351@amd.com>
 <966651c0-42fc-4827-bf3e-2170dcf4688c@vivo.com>
In-Reply-To: <966651c0-42fc-4827-bf3e-2170dcf4688c@vivo.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 30 Jul 2024 10:19:35 -0700
Message-ID: <CABdmKX3xoUwVbj1-G1Q7gyi-7r9J8PeW8Y92Od5epRKumYL-qA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Introduce DMA_HEAP_ALLOC_AND_READ_FILE heap flag
To: Huan Yang <link@vivo.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
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

On Tue, Jul 30, 2024 at 1:14=E2=80=AFAM Huan Yang <link@vivo.com> wrote:
>
>
> =E5=9C=A8 2024/7/30 16:03, Christian K=C3=B6nig =E5=86=99=E9=81=93:
> > Am 30.07.24 um 09:57 schrieb Huan Yang:
> >> Background
> >> =3D=3D=3D=3D
> >> Some user may need load file into dma-buf, current way is:
> >>    1. allocate a dma-buf, get dma-buf fd
> >>    2. mmap dma-buf fd into user vaddr
> >>    3. read(file_fd, vaddr, fsz)
> >> Due to dma-buf user map can't support direct I/O[1], the file read
> >> must be buffer I/O.
> >>
> >> This means that during the process of reading the file into dma-buf,
> >> page cache needs to be generated, and the corresponding content needs =
to
> >> be first copied to the page cache before being copied to the dma-buf.
> >>
> >> This way worked well when reading relatively small files before, as
> >> the page cache can cache the file content, thus improving performance.
> >>
> >> However, there are new challenges currently, especially as AI models a=
re
> >> becoming larger and need to be shared between DMA devices and the CPU
> >> via dma-buf.
> >>
> >> For example, our 7B model file size is around 3.4GB. Using the
> >> previous would mean generating a total of 3.4GB of page cache
> >> (even if it will be reclaimed), and also requiring the copying of 3.4G=
B
> >> of content between page cache and dma-buf.
> >>
> >> Due to the limited resources of system memory, files in the gigabyte
> >> range
> >> cannot persist in memory indefinitely, so this portion of page cache m=
ay
> >> not provide much assistance for subsequent reads. Additionally, the
> >> existence of page cache will consume additional system resources due t=
o
> >> the extra copying required by the CPU.
> >>
> >> Therefore, I think it is necessary for dma-buf to support direct I/O.
> >>
> >> However, direct I/O file reads cannot be performed using the buffer
> >> mmaped by the user space for the dma-buf.[1]
> >>
> >> Here are some discussions on implementing direct I/O using dma-buf:
> >>
> >> mmap[1]
> >> ---
> >> dma-buf never support user map vaddr use of direct I/O.
> >>
> >> udmabuf[2]
> >> ---
> >> Currently, udmabuf can use the memfd method to read files into
> >> dma-buf in direct I/O mode.
> >>
> >> However, if the size is large, the current udmabuf needs to adjust the
> >> corresponding size_limit(default 64MB).
> >> But using udmabuf for files at the 3GB level is not a very good
> >> approach.
> >> It needs to make some adjustments internally to handle this.[3] Or els=
e,
> >> fail create.
> >>
> >> But, it is indeed a viable way to enable dma-buf to support direct I/O=
.
> >> However, it is necessary to initiate the file read after the memory
> >> allocation
> >> is completed, and handle race conditions carefully.
> >>
> >> sendfile/splice[4]
> >> ---
> >> Another way to enable dma-buf to support direct I/O is by implementing
> >> splice_write/write_iter in the dma-buf file operations (fops) to adapt
> >> to the sendfile method.
> >> However, the current sendfile/splice calls are based on pipe. When usi=
ng
> >> direct I/O to read a file, the content needs to be copied to the buffe=
r
> >> allocated by the pipe (default 64KB), and then the dma-buf fops'
> >> splice_write needs to be called to write the content into the dma-buf.
> >> This approach requires serially reading the content of file pipe size
> >> into the pipe buffer and then waiting for the dma-buf to be written
> >> before reading the next one.(The I/O performance is relatively weak
> >> under direct I/O.)
> >> Moreover, due to the existence of the pipe buffer, even when using
> >> direct I/O and not needing to generate additional page cache,
> >> there still needs to be a CPU copy.
> >>
> >> copy_file_range[5]
> >> ---
> >> Consider of copy_file_range, It only supports copying files within the
> >> same file system. Similarly, it is not very practical.
> >>
> >>
> >> So, currently, there is no particularly suitable solution on VFS to
> >> allow dma-buf to support direct I/O for large file reads.
> >>
> >> This patchset provides an idea to complete file reads when requesting =
a
> >> dma-buf.
> >>
> >> Introduce DMA_HEAP_ALLOC_AND_READ_FILE heap flag
> >> =3D=3D=3D
> >> This patch provides a method to immediately read the file content afte=
r
> >> the dma-buf is allocated, and only returns the dma-buf file descriptor
> >> after the file is fully read.
> >>
> >> Since the dma-buf file descriptor is not returned, no other thread can
> >> access it except for the current thread, so we don't need to worry abo=
ut
> >> race conditions.
> >
> > That is a completely false assumption.
> Can you provide a detailed explanation as to why this assumption is
> incorrect? thanks.
> >
> >>
> >> Map the dma-buf to the vmalloc area and initiate file reads in kernel
> >> space, supporting both buffer I/O and direct I/O.
> >>
> >> This patch adds the DMA_HEAP_ALLOC_AND_READ heap_flag for user.
> >> When a user needs to allocate a dma-buf and read a file, they should
> >> pass this heap flag. As the size of the file being read is fixed,
> >> there is no
> >> need to pass the 'len' parameter. Instead, The file_fd needs to be
> >> passed to
> >> indicate to the kernel the file that needs to be read.
> >>
> >> The file open flag determines the mode of file reading.
> >> But, please note that if direct I/O(O_DIRECT) is needed to read the
> >> file,
> >> the file size must be page aligned. (with patch 2-5, no need)
> >>
> >> Therefore, for the user, len and file_fd are mutually exclusive,
> >> and they are combined using a union.
> >>
> >> Once the user obtains the dma-buf fd, the dma-buf directly contains th=
e
> >> file content.
> >
> > And I'm repeating myself, but this is a complete NAK from my side to
> > this approach.
> >
> > We pointed out multiple ways of how to implement this cleanly and not
> > by hacking functionality into the kernel which absolutely doesn't
> > belong there.
> In this patchset, I have provided performance comparisons of each of
> these methods.  Can you please provide more opinions?
> >
> > Regards,
> > Christian.
> >
> >>
> >> Patch 1 implement it.
> >>
> >> Patch 2-5 provides an approach for performance improvement.
> >>
> >> The DMA_HEAP_ALLOC_AND_READ_FILE heap flag patch enables us to
> >> synchronously read files using direct I/O.
> >>
> >> This approach helps to save CPU copying and avoid a certain degree of
> >> memory thrashing (page cache generation and reclamation)
> >>
> >> When dealing with large file sizes, the benefits of this approach beco=
me
> >> particularly significant.
> >>
> >> However, there are currently some methods that can improve performance=
,
> >> not just save system resources:
> >>
> >> Due to the large file size, for example, a AI 7B model of around
> >> 3.4GB, the
> >> time taken to allocate DMA-BUF memory will be relatively long. Waiting
> >> for the allocation to complete before reading the file will add to the
> >> overall time consumption. Therefore, the total time for DMA-BUF
> >> allocation and file read can be calculated using the formula
> >>     T(total) =3D T(alloc) + T(I/O)
> >>
> >> However, if we change our approach, we don't necessarily need to wait
> >> for the DMA-BUF allocation to complete before initiating I/O. In fact,
> >> during the allocation process, we already hold a portion of the page,
> >> which means that waiting for subsequent page allocations to complete
> >> before carrying out file reads is actually unfair to the pages that ha=
ve
> >> already been allocated.
> >>
> >> The allocation of pages is sequential, and the reading of the file is
> >> also sequential, with the content and size corresponding to the file.
> >> This means that the memory location for each page, which holds the
> >> content of a specific position in the file, can be determined at the
> >> time of allocation.
> >>
> >> However, to fully leverage I/O performance, it is best to wait and
> >> gather a certain number of pages before initiating batch processing.
> >>
> >> The default gather size is 128MB. So, ever gathered can see as a file
> >> read
> >> work, it maps the gather page to the vmalloc area to obtain a continuo=
us
> >> virtual address, which is used as a buffer to store the contents of th=
e
> >> corresponding file. So, if using direct I/O to read a file, the file
> >> content will be written directly to the corresponding dma-buf buffer
> >> memory
> >> without any additional copying.(compare to pipe buffer.)
> >>
> >> Consider other ways to read into dma-buf. If we assume reading after
> >> mmap
> >> dma-buf, we need to map the pages of the dma-buf to the user virtual
> >> address space. Also, udmabuf memfd need do this operations too.
> >> Even if we support sendfile, the file copy also need buffer, you must
> >> setup it.
> >> So, mapping pages to the vmalloc area does not incur any additional
> >> performance overhead compared to other methods.[6]
> >>
> >> Certainly, the administrator can also modify the gather size through
> >> patch5.
> >>
> >> The formula for the time taken for system_heap buffer allocation and
> >> file reading through async_read is as follows:
> >>
> >>    T(total) =3D T(first gather page) + Max(T(remain alloc), T(I/O))
> >>
> >> Compared to the synchronous read:
> >>    T(total) =3D T(alloc) + T(I/O)
> >>
> >> If the allocation time or I/O time is long, the time difference will b=
e
> >> covered by the maximum value between the allocation and I/O. The other
> >> party will be concealed.
> >>
> >> Therefore, the larger the size of the file that needs to be read, the
> >> greater the corresponding benefits will be.
> >>
> >> How to use
> >> =3D=3D=3D
> >> Consider the current pathway for loading model files into DMA-BUF:
> >>    1. open dma-heap, get heap fd
> >>    2. open file, get file_fd(can't use O_DIRECT)
> >>    3. use file len to allocate dma-buf, get dma-buf fd
> >>    4. mmap dma-buf fd, get vaddr
> >>    5. read(file_fd, vaddr, file_size) into dma-buf pages
> >>    6. share, attach, whatever you want
> >>
> >> Use DMA_HEAP_ALLOC_AND_READ_FILE JUST a little change:
> >>    1. open dma-heap, get heap fd
> >>    2. open file, get file_fd(buffer/direct)
> >>    3. allocate dma-buf with DMA_HEAP_ALLOC_AND_READ_FILE heap flag,
> >> set file_fd
> >>       instead of len. get dma-buf fd(contains file content)
> >>    4. share, attach, whatever you want
> >>
> >> So, test it is easy.
> >>
> >> How to test
> >> =3D=3D=3D
> >> The performance comparison will be conducted for the following
> >> scenarios:
> >>    1. normal
> >>    2. udmabuf with [3] patch
> >>    3. sendfile
> >>    4. only patch 1
> >>    5. patch1 - patch4.
> >>
> >> normal:
> >>    1. open dma-heap, get heap fd
> >>    2. open file, get file_fd(can't use O_DIRECT)
> >>    3. use file len to allocate dma-buf, get dma-buf fd
> >>    4. mmap dma-buf fd, get vaddr
> >>    5. read(file_fd, vaddr, file_size) into dma-buf pages
> >>    6. share, attach, whatever you want
> >>
> >> UDMA-BUF step:
> >>    1. memfd_create
> >>    2. open file(buffer/direct)
> >>    3. udmabuf create
> >>    4. mmap memfd
> >>    5. read file into memfd vaddr
> >>
> >> Sendfile step(need suit splice_write/write_iter, just use to compare):
> >>    1. open dma-heap, get heap fd
> >>    2. open file, get file_fd(buffer/direct)
> >>    3. use file len to allocate dma-buf, get dma-buf fd
> >>    4. sendfile file_fd to dma-buf fd
> >>    6. share, attach, whatever you want
> >>
> >> patch1/patch1-4:
> >>    1. open dma-heap, get heap fd
> >>    2. open file, get file_fd(buffer/direct)
> >>    3. allocate dma-buf with DMA_HEAP_ALLOC_AND_READ_FILE heap flag,
> >> set file_fd
> >>       instead of len. get dma-buf fd(contains file content)
> >>    4. share, attach, whatever you want
> >>
> >> You can create a file to test it. Compare the performance gap between
> >> the two.
> >> It is best to compare the differences in file size from KB to MB to GB=
.
> >>
> >> The following test data will compare the performance differences
> >> between 512KB,
> >> 8MB, 1GB, and 3GB under various scenarios.
> >>
> >> Performance Test
> >> =3D=3D=3D
> >>    12G RAM phone
> >>    UFS4.0(the maximum speed is 4GB/s. ),
> >>    f2fs
> >>    kernel 6.1 with patch[7] (or else, can't support kvec direct I/O
> >> read.)
> >>    no memory pressure.
> >>    drop_cache is used for each test.
> >>
> >> The average of 5 test results:
> >> | scheme-size         | 512KB(ns)  | 8MB(ns)    | 1GB(ns) |
> >> 3GB(ns)       |
> >> | ------------------- | ---------- | ---------- | ------------- |
> >> ------------- |
> >> | normal              | 2,790,861  | 14,535,784 | 1,520,790,492 |
> >> 3,332,438,754 |
> >> | udmabuf buffer I/O  | 1,704,046  | 11,313,476 | 821,348,000 |
> >> 2,108,419,923 |
> >> | sendfile buffer I/O | 3,261,261  | 12,112,292 | 1,565,939,938 |
> >> 3,062,052,984 |
> >> | patch1-4 buffer I/O | 2,064,538  | 10,771,474 | 986,338,800 |
> >> 2,187,570,861 |
> >> | sendfile direct I/O | 12,844,231 | 37,883,938 | 5,110,299,184 |
> >> 9,777,661,077 |
> >> | patch1 direct I/O   | 813,215    | 6,962,092  | 2,364,211,877 |
> >> 5,648,897,554 |
> >> | udmabuf direct I/O  | 1,289,554  | 8,968,138  | 921,480,784 |
> >> 2,158,305,738 |
> >> | patch1-4 direct I/O | 1,957,661  | 6,581,999  | 520,003,538 |
> >> 1,400,006,107 |
>
> With this test, sendfile can't give a good help base on pipe buffer.
>
> udmabuf is good, but I think our oem driver can't suit it. (And, AOSP do
> not open this feature)

Hi Huan,

We should be able to turn on udmabuf for the Android kernels. We don't
have CONFIG_UDMABUF because nobody has wanted it so far. It's
encouraging to see your latest results!

-T.J.


>
> Anyway, I am sending this patchset in the hope of further discussion.
>
> Thanks.
>
> >>
> >> So, based on the test results:
> >>
> >> When the file is large, the patchset has the highest performance.
> >> Compared to normal, patchset is a 50% improvement;
> >> Compared to normal, patch1 only showed a degradation of 41%.
> >> patch1 typical performance breakdown is as follows:
> >>    1. alloc cost 188,802,693 ns
> >>    2. vmap cost 42,491,385 ns
> >>    3. file read cost 4,180,876,702 ns
> >> Therefore, directly performing a single direct I/O read on a large fil=
e
> >> may not be the most optimal way for performance.
> >>
> >> The performance of direct I/O implemented by the sendfile method is
> >> the worst.
> >>
> >> When file size is small, The difference in performance is not
> >> significant. This is consistent with expectations.
> >>
> >>
> >>
> >> Suggested use cases
> >> =3D=3D=3D
> >>    1. When there is a need to read large files and system resources
> >> are scarce,
> >>       especially when the size of memory is limited.(GB level) In this
> >>       scenario, using direct I/O for file reading can even bring
> >> performance
> >>       improvements.(may need patch2-3)
> >>    2. For embedded devices with limited RAM, using direct I/O can
> >> save system
> >>       resources and avoid unnecessary data copying. Therefore, even
> >> if the
> >>       performance is lower when read small file, it can still be used
> >>       effectively.
> >>    3. If there is sufficient memory, pinning the page cache of the
> >> model files
> >>       in memory and placing file in the EROFS file system for
> >> read-only access
> >>       maybe better.(EROFS do not support direct I/O)
> >>
> >>
> >> Changlog
> >> =3D=3D=3D
> >>   v1 [8]
> >>   v1->v2:
> >>     Uses the heap flag method for alloc and read instead of adding a n=
ew
> >>     DMA-buf ioctl command. [9]
> >>     Split the patchset to facilitate review and test.
> >>       patch 1 implement alloc and read, offer heap flag into it.
> >>       patch 2-4 offer async read
> >>       patch 5 can change gather limit.
> >>
> >> Reference
> >> =3D=3D=3D
> >> [1]
> >> https://lore.kernel.org/all/0393cf47-3fa2-4e32-8b3d-d5d5bdece298@amd.c=
om/
> >> [2]
> >> https://lore.kernel.org/all/ZpTnzkdolpEwFbtu@phenom.ffwll.local/
> >> [3]
> >> https://lore.kernel.org/all/20240725021349.580574-1-link@vivo.com/
> >> [4]
> >> https://lore.kernel.org/all/Zpf5R7fRZZmEwVuR@infradead.org/
> >> [5]
> >> https://lore.kernel.org/all/ZpiHKY2pGiBuEq4z@infradead.org/
> >> [6]
> >> https://lore.kernel.org/all/9b70db2e-e562-4771-be6b-1fa8df19e356@amd.c=
om/
> >> [7]
> >> https://patchew.org/linux/20230209102954.528942-1-dhowells@redhat.com/=
20230209102954.528942-7-dhowells@redhat.com/
> >> [8]
> >> https://lore.kernel.org/all/20240711074221.459589-1-link@vivo.com/
> >> [9]
> >> https://lore.kernel.org/all/5ccbe705-883c-4651-9e66-6b452c414c74@amd.c=
om/
> >>
> >> Huan Yang (5):
> >>    dma-buf: heaps: Introduce DMA_HEAP_ALLOC_AND_READ_FILE heap flag
> >>    dma-buf: heaps: Introduce async alloc read ops
> >>    dma-buf: heaps: support alloc async read file
> >>    dma-buf: heaps: system_heap alloc support async read
> >>    dma-buf: heaps: configurable async read gather limit
> >>
> >>   drivers/dma-buf/dma-heap.c          | 552 ++++++++++++++++++++++++++=
+-
> >>   drivers/dma-buf/heaps/system_heap.c |  70 +++-
> >>   include/linux/dma-heap.h            |  53 ++-
> >>   include/uapi/linux/dma-heap.h       |  11 +-
> >>   4 files changed, 673 insertions(+), 13 deletions(-)
> >>
> >>
> >> base-commit: 931a3b3bccc96e7708c82b30b2b5fa82dfd04890
> >
