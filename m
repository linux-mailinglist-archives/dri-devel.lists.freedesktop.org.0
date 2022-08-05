Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF11958A99A
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 12:43:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A204B48FB;
	Fri,  5 Aug 2022 10:31:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86AFEB354C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 10:09:50 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id b18so1649980qtq.13
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Aug 2022 03:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8osKs3XHWs2tJshTy51ciuxCpaj0R2ycT8OfaZIOWNQ=;
 b=Wux8wYgJ+wtdOYj6/wLNTMNtVsjmK6vhZFf4SpuJ5w5bV7UGZQ1ODQTPVja2hW1nwv
 QgUs9HzuV1/ZtfI+iJGCQR5A4oz8ElXQKwCIjVPoecshhsQ+d4a9hjiRKIz2+KCoyBQ7
 49OwqChszzHDLl7bviXz2rTxmIKZvQAZCz+gU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8osKs3XHWs2tJshTy51ciuxCpaj0R2ycT8OfaZIOWNQ=;
 b=F5YKKcDgwzZDp0nk3mguTeEhbHr0I3vZi+y1FoRlhhWBkXM6Q4t7jFjv5SvB9kG1Rd
 o9cvw0VDkhjoCr8tAUpf5Z+YFE1Nq9oDxa3vWQ2/WwX9ase7enZlgFXgJ6d9HM61/wWA
 8oGz4GEKtQ7VhGCxDRINKEee5RVhBVAK1N4tl8NC/xxVqwMS6N1evhevjDVrGdbB2n3J
 EMK0PK6o5IW68LtkejoP0OfRQ4zFtc0Z21fb4wKr6igu7a1Hm1qok1vZC0jFJYV1We31
 K1F8/vOsjkN5DtXZ4NJ8DdQ+SiL4lYIyEZY/Oo4URGCweODvuSyaH7o8PM0ddoN5aFWK
 XI6w==
X-Gm-Message-State: ACgBeo0xsDhnSsrCGIvL6I2l3SJ3v//OBdB2JWECqyZePkmVo6j2Y/yH
 LqA7ZHQQRYASbQVxjknf6gncl9449WmGFw==
X-Google-Smtp-Source: AA6agR6tn1I/M4bO5Ash30sGRCvWjkiqABNc+x8DgfebWl78JMR9i3MCCruIL9RzhY2So2CYzploUg==
X-Received: by 2002:ac8:7d12:0:b0:31f:228d:89cb with SMTP id
 g18-20020ac87d12000000b0031f228d89cbmr5034541qtb.287.1659694188766; 
 Fri, 05 Aug 2022 03:09:48 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com.
 [209.85.219.176]) by smtp.gmail.com with ESMTPSA id
 d19-20020a05620a241300b006a6ab259261sm2844502qkn.29.2022.08.05.03.09.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 03:09:48 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 199so3068261ybl.9
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Aug 2022 03:09:47 -0700 (PDT)
X-Received: by 2002:a05:6902:1382:b0:66f:f9fe:79d6 with SMTP id
 x2-20020a056902138200b0066ff9fe79d6mr4625654ybu.493.1659694187287; Fri, 05
 Aug 2022 03:09:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAAFQd5AL=OejdaubnYDRF4M1EKyStZP_FAMPz4CJ=KCa_8QjaA@mail.gmail.com>
 <CF192A87-1664-45B2-B26C-A9B8B6A52523@soulik.info>
In-Reply-To: <CF192A87-1664-45B2-B26C-A9B8B6A52523@soulik.info>
From: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 5 Aug 2022 19:09:35 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DTNDkZ7W0Rs8Xfq-x+y+cmHZHkDYQys29aNt2YvCJc1A@mail.gmail.com>
Message-ID: <CAAFQd5DTNDkZ7W0Rs8Xfq-x+y+cmHZHkDYQys29aNt2YvCJc1A@mail.gmail.com>
Subject: Re: [PATCH] [Draft]: media: videobuf2-dma-heap: add a vendor defined
 memory runtine
To: ayaka <ayaka@soulik.info>
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
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
 Hsia-Jun Li <randy.li@synaptics.com>, linux-media@vger.kernel.org,
 christian.koenig@amd.com, m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 2, 2022 at 9:21 PM ayaka <ayaka@soulik.info> wrote:
>
> Sorry, the previous one contains html data.
>
> > On Aug 2, 2022, at 3:33 PM, Tomasz Figa <tfiga@chromium.org> wrote:
> >
> > =EF=BB=BFOn Mon, Aug 1, 2022 at 8:43 PM ayaka <ayaka@soulik.info> wrote=
:
> >> Sent from my iPad
> >>>> On Aug 1, 2022, at 5:46 PM, Tomasz Figa <tfiga@chromium.org> wrote:
> >>> =EF=BB=BFCAUTION: Email originated externally, do not click links or =
open attachments unless you recognize the sender and know the content is sa=
fe.
> >>>> On Mon, Aug 1, 2022 at 3:44 PM Hsia-Jun Li <Randy.Li@synaptics.com> =
wrote:
> >>>>> On 8/1/22 14:19, Tomasz Figa wrote:
> >>>> Hello Tomasz
> >>>>> ?Hi Randy,
> >>>>> On Mon, Aug 1, 2022 at 5:21 AM <ayaka@soulik.info> wrote:
> >>>>>> From: Randy Li <ayaka@soulik.info>
> >>>>>> This module is still at a early stage, I wrote this for showing wh=
at
> >>>>>> APIs we need here.
> >>>>>> Let me explain why we need such a module here.
> >>>>>> If you won't allocate buffers from a V4L2 M2M device, this module
> >>>>>> may not be very useful. I am sure the most of users won't know a
> >>>>>> device would require them allocate buffers from a DMA-Heap then
> >>>>>> import those buffers into a V4L2's queue.
> >>>>>> Then the question goes back to why DMA-Heap. From the Android's
> >>>>>> description, we know it is about the copyright's DRM.
> >>>>>> When we allocate a buffer in a DMA-Heap, it may register that buff=
er
> >>>>>> in the trusted execution environment so the firmware which is runn=
ing
> >>>>>> or could only be acccesed from there could use that buffer later.
> >>>>>> The answer above leads to another thing which is not done in this
> >>>>>> version, the DMA mapping. Although in some platforms, a DMA-Heap
> >>>>>> responses a IOMMU device as well. For the genernal purpose, we wou=
ld
> >>>>>> be better assuming the device mapping should be done for each devi=
ce
> >>>>>> itself. The problem here we only know alloc_devs in those DMAbuf
> >>>>>> methods, which are DMA-heaps in my design, the device from the que=
ue
> >>>>>> is not enough, a plane may requests another IOMMU device or table
> >>>>>> for mapping.
> >>>>>> Signed-off-by: Randy Li <ayaka@soulik.info>
> >>>>>> ---
> >>>>>> drivers/media/common/videobuf2/Kconfig        |   6 +
> >>>>>> drivers/media/common/videobuf2/Makefile       |   1 +
> >>>>>> .../common/videobuf2/videobuf2-dma-heap.c     | 350 ++++++++++++++=
++++
> >>>>>> include/media/videobuf2-dma-heap.h            |  30 ++
> >>>>>> 4 files changed, 387 insertions(+)
> >>>>>> create mode 100644 drivers/media/common/videobuf2/videobuf2-dma-he=
ap.c
> >>>>>> create mode 100644 include/media/videobuf2-dma-heap.h
> >>>>> First of all, thanks for the series.
> >>>>> Possibly a stupid question, but why not just allocate the DMA-bufs
> >>>>> directly from the DMA-buf heap device in the userspace and just imp=
ort
> >>>>> the buffers to the V4L2 device using V4L2_MEMORY_DMABUF?
> >>>> Sometimes the allocation policy could be very complex, let's suppose=
 a
> >>>> multiple planes pixel format enabling with frame buffer compression.
> >>>> Its luma, chroma data could be allocated from a pool which is delega=
ted
> >>>> for large buffers while its metadata would come from a pool which ma=
ny
> >>>> users could take some few slices from it(likes system pool).
> >>>> Then when we have a new users knowing nothing about this platform, i=
f we
> >>>> just configure the alloc_devs in each queues well. The user won't ne=
ed
> >>>> to know those complex rules.
> >>>> The real situation could be more complex, Samsung MFC's left and rig=
ht
> >>>> banks could be regarded as two pools, many devices would benefit fro=
m
> >>>> this either from the allocation times or the security buffers policy=
.
> >>>> In our design, when we need to do some security decoding(DRM video),
> >>>> codecs2 would allocate buffers from the pool delegated for that. Whi=
le
> >>>> the non-DRM video, users could not care about this.
> >>> I'm a little bit surprised about this, because on Android all the
> >>> graphics buffers are allocated from the system IAllocator and importe=
d
> >>> to the specific devices.
> >> In the non-tunnel mode, yes it is. While the tunnel mode is completely=
 vendor defined. Neither HWC nor codec2 cares about where the buffers comin=
g from, you could do what ever you want.
> >> Besides there are DRM video in GNU Linux platform, I heard the webkit =
has made huge effort here and Playready is one could work in non-Android Li=
nux.
> >>> Would it make sense to instead extend the UAPI to expose enough
> >>> information about the allocation requirements to the userspace, so it
> >>> can allocate correctly?
> >> Yes, it could. But as I said it would need the users to do more works.
> >>> My reasoning here is that it's not a driver's decision to allocate
> >>> from a DMA-buf heap (and which one) or not. It's the userspace which
> >>> knows that, based on the specific use case that it wants to fulfill.
> >> Although I would like to let the users decide that, users just can=E2=
=80=99t do that which would violate the security rules in some platforms.
> >> For example,  video codec and display device could only access a regio=
n of memory, any other device or trusted apps can=E2=80=99t access it. User=
s have to allocate the buffer from the pool the vendor decided.
> >> So why not we offer a quick way that users don=E2=80=99t need to try a=
nd error.
> >
> > In principle, I'm not against integrating DMA-buf heap with vb2,
> > however I see some problems I mentioned before:
> >
> > 1) How would the driver know if it should allocate from a DMA-buf heap =
or not?
>
> struct vb2_queue.mem_ops
>
> int (*queue_setup)(struct vb2_queue *q,unsigned int *num_buffers, unsigne=
d int *num_planes, unsigned int sizes[], struct device *alloc_devs[]);

Sorry, I don't understand what you mean here.

Just to make sure we're on the same page - what I'm referring to is
that whether DMA-buf heap is used or not is specific to a given use
case, which is controlled by the userspace. So the userspace must be
able to control whether the driver allocates from a DMA-buf heap or
the regular way.

>
> > 2) How would the driver know which heap to allocate from?
>
> From vb2_queue.alloc_devs
>
> What I did now is likes what MFC does, create some mem_alloc_devs.
> It would be better that we could retrieve the DMA-heaps=E2=80=99 devices =
from kernel, but that is not enough, we need a place to store the heap flag=
s although none of them are defined yet.
>
> From Android documents, I think it is unlikely we would have heap flags.
> =E2=80=9CStandardization: The DMA-BUF heaps framework offers a well-defin=
ed UAPI. ION allowed custom flags and heap IDs that prevented developing a =
common testing framework because each device=E2=80=99s ION implementation c=
ould behave differently.=E2=80=9D
>

alloc_devs is something that the driver sets and it's a struct device
for which the DMA API can be called to manage the DMA buffers for this
video device. It's not a way to select a use case-dependent allocation
method.

> > 3) How would the heap know how to allocate properly for the device?
> >
> Because =E2=80=9Ceach DMA-BUF heap is a separate character device=E2=80=
=9D.

Could you elaborate? Sorry, I'm not sure how this answers my question.

> But as I said in the first draft I am not sure about the DMA mapping part=
. alloc_devs responds for the heap, we have a device variable in the queue =
that mapping function could access, but that may not be enough. A plane may=
 apply a different mapping policy or IOMMU here.
>
> Would it be better that I create a interface here that creating a memdev =
with DMA-heap description ?

My intuition still tells me that it would be universally better to
just let the userspace allocate the buffers independently (like with
gralloc/Ion) and import to V4L2 using V4L2_MEM_DMABUF. It was possible
to do things this way nicely with regular Android graphics buffers, so
could you explain what difference of your use case makes it
impossible?

Best regards,
Tomasz
