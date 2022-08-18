Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8379F5A019C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 20:53:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70207C1E57;
	Wed, 24 Aug 2022 18:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC53393785
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 05:50:50 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id m5so441864qkk.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 22:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=KnXVfj+T4u59u5J2KygjH6Rp2ec5Yoi6AW22Q/4H+6I=;
 b=gYFJGDKAZN34/WoR5EjsSipswRGwu4w7Ht8XDPDeVPSVtQHCznF5MPwovMhqc8OC8u
 8THI+3cp0xPYujus/2EiU0efdwxnIE5LnwRoH/V8aNGE7bdRG1C7p2AH6QjaM1p/3xVQ
 aYAT62RdhRis0COJDJJ5ZL5+dKJu7zqxUmYmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=KnXVfj+T4u59u5J2KygjH6Rp2ec5Yoi6AW22Q/4H+6I=;
 b=bg7sPYk1+FzM8wT+9imvoHM865BKVewQCmYAtgCPY/GpZsjJMJd2e5kQIZ3IEZu5SE
 jGYrwglH6EvOZrZoRBwU3TlkUWxLelkhr5mg58kNqzeEleVLApEtropgdoTMG+j4zPZt
 h5Dqi19UTDr7IrecHGJm6Oe7WAiLsh9d9s9dEnW+BMvPEjq1mU6QnUVTa1UQCBDPytIr
 coUcpfnj0Cz8oh0iETC0VAvMajJnAf+N3VJBSNT1NnVL5697KbU95ue1aqgsLDugNZeJ
 NH1FY9+PFZk7wwbhc8OvBf112o0mca2H7XAx5XZaY3aLRw7wbmkHtkftCS3mYv5Ns1j/
 zSfA==
X-Gm-Message-State: ACgBeo1an0wPyO4CKMC04Uc10LKdpHYrsgwCuCTbufC07vv0G2LHD3n0
 i37cs6nHTYJngyfgJj53V/aKacjYc19v1w==
X-Google-Smtp-Source: AA6agR42Q0zpZfyDxvxkHUVP0PvWBgOOWZsU7X9B/cTafOaiArrONNS07sDC0sm9zJnxEBtcvNdqPg==
X-Received: by 2002:a05:620a:4588:b0:6bb:50d4:7f7d with SMTP id
 bp8-20020a05620a458800b006bb50d47f7dmr983689qkb.244.1660801849177; 
 Wed, 17 Aug 2022 22:50:49 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com.
 [209.85.128.176]) by smtp.gmail.com with ESMTPSA id
 bn6-20020a05620a2ac600b006b5df4d2c81sm759016qkb.94.2022.08.17.22.50.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Aug 2022 22:50:48 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-335624d1e26so14590027b3.4
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 22:50:47 -0700 (PDT)
X-Received: by 2002:a25:6a46:0:b0:67b:66ad:ae40 with SMTP id
 f67-20020a256a46000000b0067b66adae40mr1387247ybc.261.1660801846946; Wed, 17
 Aug 2022 22:50:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAAFQd5AL=OejdaubnYDRF4M1EKyStZP_FAMPz4CJ=KCa_8QjaA@mail.gmail.com>
 <CF192A87-1664-45B2-B26C-A9B8B6A52523@soulik.info>
 <CAAFQd5DTNDkZ7W0Rs8Xfq-x+y+cmHZHkDYQys29aNt2YvCJc1A@mail.gmail.com>
 <7c7c2c49-a0e4-cda8-be29-0d143851b9fd@synaptics.com>
In-Reply-To: <7c7c2c49-a0e4-cda8-be29-0d143851b9fd@synaptics.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 18 Aug 2022 14:50:35 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BDWBwYH=hfQBmvuyB6xSgXhHKhv2093w2irz4C4_kX5w@mail.gmail.com>
Message-ID: <CAAFQd5BDWBwYH=hfQBmvuyB6xSgXhHKhv2093w2irz4C4_kX5w@mail.gmail.com>
Subject: Re: [PATCH] [Draft]: media: videobuf2-dma-heap: add a vendor defined
 memory runtine
To: Hsia-Jun Li <Randy.Li@synaptics.com>
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
Cc: ayaka <ayaka@soulik.info>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 christian.koenig@amd.com, m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Randy,

Sorry for the late reply, I went on vacation last week.

On Sun, Aug 7, 2022 at 12:23 AM Hsia-Jun Li <Randy.Li@synaptics.com> wrote:
>
>
>
> On 8/5/22 18:09, Tomasz Figa wrote:
> > CAUTION: Email originated externally, do not click links or open attach=
ments unless you recognize the sender and know the content is safe.
> >
> >
> > On Tue, Aug 2, 2022 at 9:21 PM ayaka <ayaka@soulik.info> wrote:
> >>
> >> Sorry, the previous one contains html data.
> >>
> >>> On Aug 2, 2022, at 3:33 PM, Tomasz Figa <tfiga@chromium.org> wrote:
> >>>
> >>> =EF=BB=BFOn Mon, Aug 1, 2022 at 8:43 PM ayaka <ayaka@soulik.info> wro=
te:
> >>>> Sent from my iPad
> >>>>>> On Aug 1, 2022, at 5:46 PM, Tomasz Figa <tfiga@chromium.org> wrote=
:
> >>>>> =EF=BB=BFCAUTION: Email originated externally, do not click links o=
r open attachments unless you recognize the sender and know the content is =
safe.
> >>>>>> On Mon, Aug 1, 2022 at 3:44 PM Hsia-Jun Li <Randy.Li@synaptics.com=
> wrote:
> >>>>>>> On 8/1/22 14:19, Tomasz Figa wrote:
> >>>>>> Hello Tomasz
> >>>>>>> ?Hi Randy,
> >>>>>>> On Mon, Aug 1, 2022 at 5:21 AM <ayaka@soulik.info> wrote:
> >>>>>>>> From: Randy Li <ayaka@soulik.info>
> >>>>>>>> This module is still at a early stage, I wrote this for showing =
what
> >>>>>>>> APIs we need here.
> >>>>>>>> Let me explain why we need such a module here.
> >>>>>>>> If you won't allocate buffers from a V4L2 M2M device, this modul=
e
> >>>>>>>> may not be very useful. I am sure the most of users won't know a
> >>>>>>>> device would require them allocate buffers from a DMA-Heap then
> >>>>>>>> import those buffers into a V4L2's queue.
> >>>>>>>> Then the question goes back to why DMA-Heap. From the Android's
> >>>>>>>> description, we know it is about the copyright's DRM.
> >>>>>>>> When we allocate a buffer in a DMA-Heap, it may register that bu=
ffer
> >>>>>>>> in the trusted execution environment so the firmware which is ru=
nning
> >>>>>>>> or could only be acccesed from there could use that buffer later=
.
> >>>>>>>> The answer above leads to another thing which is not done in thi=
s
> >>>>>>>> version, the DMA mapping. Although in some platforms, a DMA-Heap
> >>>>>>>> responses a IOMMU device as well. For the genernal purpose, we w=
ould
> >>>>>>>> be better assuming the device mapping should be done for each de=
vice
> >>>>>>>> itself. The problem here we only know alloc_devs in those DMAbuf
> >>>>>>>> methods, which are DMA-heaps in my design, the device from the q=
ueue
> >>>>>>>> is not enough, a plane may requests another IOMMU device or tabl=
e
> >>>>>>>> for mapping.
> >>>>>>>> Signed-off-by: Randy Li <ayaka@soulik.info>
> >>>>>>>> ---
> >>>>>>>> drivers/media/common/videobuf2/Kconfig        |   6 +
> >>>>>>>> drivers/media/common/videobuf2/Makefile       |   1 +
> >>>>>>>> .../common/videobuf2/videobuf2-dma-heap.c     | 350 ++++++++++++=
++++++
> >>>>>>>> include/media/videobuf2-dma-heap.h            |  30 ++
> >>>>>>>> 4 files changed, 387 insertions(+)
> >>>>>>>> create mode 100644 drivers/media/common/videobuf2/videobuf2-dma-=
heap.c
> >>>>>>>> create mode 100644 include/media/videobuf2-dma-heap.h
> >>>>>>> First of all, thanks for the series.
> >>>>>>> Possibly a stupid question, but why not just allocate the DMA-buf=
s
> >>>>>>> directly from the DMA-buf heap device in the userspace and just i=
mport
> >>>>>>> the buffers to the V4L2 device using V4L2_MEMORY_DMABUF?
> >>>>>> Sometimes the allocation policy could be very complex, let's suppo=
se a
> >>>>>> multiple planes pixel format enabling with frame buffer compressio=
n.
> >>>>>> Its luma, chroma data could be allocated from a pool which is dele=
gated
> >>>>>> for large buffers while its metadata would come from a pool which =
many
> >>>>>> users could take some few slices from it(likes system pool).
> >>>>>> Then when we have a new users knowing nothing about this platform,=
 if we
> >>>>>> just configure the alloc_devs in each queues well. The user won't =
need
> >>>>>> to know those complex rules.
> >>>>>> The real situation could be more complex, Samsung MFC's left and r=
ight
> >>>>>> banks could be regarded as two pools, many devices would benefit f=
rom
> >>>>>> this either from the allocation times or the security buffers poli=
cy.
> >>>>>> In our design, when we need to do some security decoding(DRM video=
),
> >>>>>> codecs2 would allocate buffers from the pool delegated for that. W=
hile
> >>>>>> the non-DRM video, users could not care about this.
> >>>>> I'm a little bit surprised about this, because on Android all the
> >>>>> graphics buffers are allocated from the system IAllocator and impor=
ted
> >>>>> to the specific devices.
> >>>> In the non-tunnel mode, yes it is. While the tunnel mode is complete=
ly vendor defined. Neither HWC nor codec2 cares about where the buffers com=
ing from, you could do what ever you want.
> >>>> Besides there are DRM video in GNU Linux platform, I heard the webki=
t has made huge effort here and Playready is one could work in non-Android =
Linux.
> >>>>> Would it make sense to instead extend the UAPI to expose enough
> >>>>> information about the allocation requirements to the userspace, so =
it
> >>>>> can allocate correctly?
> >>>> Yes, it could. But as I said it would need the users to do more work=
s.
> >>>>> My reasoning here is that it's not a driver's decision to allocate
> >>>>> from a DMA-buf heap (and which one) or not. It's the userspace whic=
h
> >>>>> knows that, based on the specific use case that it wants to fulfill=
.
> >>>> Although I would like to let the users decide that, users just can=
=E2=80=99t do that which would violate the security rules in some platforms=
.
> >>>> For example,  video codec and display device could only access a reg=
ion of memory, any other device or trusted apps can=E2=80=99t access it. Us=
ers have to allocate the buffer from the pool the vendor decided.
> >>>> So why not we offer a quick way that users don=E2=80=99t need to try=
 and error.
> >>>
> >>> In principle, I'm not against integrating DMA-buf heap with vb2,
> >>> however I see some problems I mentioned before:
> >>>
> >>> 1) How would the driver know if it should allocate from a DMA-buf hea=
p or not?
> >>
> >> struct vb2_queue.mem_ops
> >>
> >> int (*queue_setup)(struct vb2_queue *q,unsigned int *num_buffers, unsi=
gned int *num_planes, unsigned int sizes[], struct device *alloc_devs[]);
> >
> > Sorry, I don't understand what you mean here.
> >
> > Just to make sure we're on the same page - what I'm referring to is
> > that whether DMA-buf heap is used or not is specific to a given use
> > case, which is controlled by the userspace. So the userspace must be
> > able to control whether the driver allocates from a DMA-buf heap or
> > the regular way.
> No, it does not depend on the use case here. We don't accept any buffers
> beyond the region we decided. Even for the non-DRM, non-security video,
> our codec devices are running under the secure mode.
>
> You MUST allocate the buffer for a device from the DMA-heap we(SYNA)
> decided.

That's your use case, but there could be use cases which work
differently. In fact, in ChromeOS we only use the secure allocation
path for protected content, because it imposes some overhead.

>
> I believe some other devices may have much limitation for not the
> security reason, for example, it can't access the memory above 4 GiB or
> for the performance's reason.

For such limitations, there is the shared DMA pool or restricted DMA
pool functionality, which can be given to a device in DT and then the
DMA mapping API would just allocate within that area for that device.
Maybe that's what you need here?

> >
> >>
> >>> 2) How would the driver know which heap to allocate from?
> >>
> >>  From vb2_queue.alloc_devs
> >>
> >> What I did now is likes what MFC does, create some mem_alloc_devs.
> >> It would be better that we could retrieve the DMA-heaps=E2=80=99 devic=
es from kernel, but that is not enough, we need a place to store the heap f=
lags although none of them are defined yet.
> >>
> >>  From Android documents, I think it is unlikely we would have heap fla=
gs.
> >> =E2=80=9CStandardization: The DMA-BUF heaps framework offers a well-de=
fined UAPI. ION allowed custom flags and heap IDs that prevented developing=
 a common testing framework because each device=E2=80=99s ION implementatio=
n could behave differently.=E2=80=9D
> >>
> >
> > alloc_devs is something that the driver sets and it's a struct device
> > for which the DMA API can be called to manage the DMA buffers for this
> > video device. It's not a way to select a use case-dependent allocation
> > method.
> >
> I see, then move to the last question, we need to expand the V4L2
> framework's structure.
> >>> 3) How would the heap know how to allocate properly for the device?
> >>>
> >> Because =E2=80=9Ceach DMA-BUF heap is a separate character device=E2=
=80=9D.
> >
> > Could you elaborate? Sorry, I'm not sure how this answers my question.
> Because a DMA-heap, a heap device itself is enough here, may plus HEAP
> flag when there is.
>
> I don't know what else would be need to do here.
> If you allocate a buffer from a heap which is delegated for security
> memory of that device, the heap driver itself would inform the TEE the
> pages occupied by it or the memory allocated from the pool which is in a
> region of memory reserved for this purpose.

So the heap is only for the video device?

> >
> >> But as I said in the first draft I am not sure about the DMA mapping p=
art. alloc_devs responds for the heap, we have a device variable in the que=
ue that mapping function could access, but that may not be enough. A plane =
may apply a different mapping policy or IOMMU here.
> >>
> >> Would it be better that I create a interface here that creating a memd=
ev with DMA-heap description ?
> >
> > My intuition still tells me that it would be universally better to
> > just let the userspace allocate the buffers independently (like with
> > gralloc/Ion) and import to V4L2 using V4L2_MEM_DMABUF. It was possible
> > to do things this way nicely with regular Android graphics buffers, so
> > could you explain what difference of your use case makes it
> > impossible?
> Without keeping the backward compatibility, it won't have any problem IF
> we could tell the users the acceptable DMA-heap for each of planes and
> DMA-heap's heap flags.
>
> We don't have an ioctl for this yet, the most possible for the decoder
> is doing that at GET_FMT ioctl()?.

Do we need the kernel to tell the userspace which heap to use? As you
mentioned above, the heap would be specific for the video device and
the userspace would also be specific for your use case, so why
couldn't it just find the right heap on its own (e.g. by name)?

As for heap flags, could you elaborate on what kind of flags you
imagine could be decided by a V4L2 driver?

Best regards,
Tomasz
