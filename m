Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA927C8D8A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 21:11:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA64610E639;
	Fri, 13 Oct 2023 19:11:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CDA410E63A
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 19:11:09 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1c9c145bb5bso23845ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 12:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1697224269; x=1697829069;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OIApqMtAf+eEfCsXpXLPAMDeUbkWbPlPHXxQvDgA8ZU=;
 b=1yEd8lx+L/5+XDamlqXXUyMPTjFqeGAXHtoSiYzhDEovICyxcbIW1hmnBiTnGxLS8m
 H3PeCgVRVW/wXRGGkL/ITrY5UeDUJKy4GM5OUOwrtA0b9yi2ipCVEk5gLbNOUmgJWtvx
 RGOC4BHLiZvQdnLrZLJ/6XovGx48i4iETCS7AxzOPMKRkHDxAfwG5Bg5iMLa2MhwM6gC
 OE2GLc/vmBDfqJT3EvboS72Dd3ebKFw1n4YrazNxvgQkqHM4MVeF0gSzDLxmLz5gR7yd
 f0SPoIgH/IZa85aUFWMf5NOen1VriNTHf5jl8H1gfqwkbgjc4Q8U1HGBJmzPJYyzr92P
 n4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697224269; x=1697829069;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OIApqMtAf+eEfCsXpXLPAMDeUbkWbPlPHXxQvDgA8ZU=;
 b=negoXVDpTEF/JHxBxNwlvWSZmoOQHWpApenkOcYNiI2Wzqcom0FncQLpI0bu1Uo10t
 vQ1ZPMfDMiYd9wAfYNN4dxBp7IZvRXqNKkpCQOoylRxeJ1i7I1x1wAjsLMfO1SAXmqdJ
 aIJ/PR5gcllPhN8Rnx050sDt4WIMhmGPKc0X1aZi8C2eR3zzqIhV2/uILhGd2D+wDVPh
 f4pg2R7jFoeu/+1N5vcnZFat9132PFGKOEMMMi0KkDxax3PXX/UyeAAnUP5BHSmkMaX6
 AlLH1s+I7I/Z9n0UBe3IBtf/sP6KcdQzXVeRGY1AFUtqivvY9ka+iD/6hlgbpoSE3o9d
 T0YA==
X-Gm-Message-State: AOJu0YxXH3Sbt+h+aXD5C6re0AtHkHg+pHP3ryRTtv6KL9E2r0xybK1z
 L98wSrt6Tny21XPEFS/tiOCJnvlbJ6DTP2CGqCpG
X-Google-Smtp-Source: AGHT+IEbp+zs59rwJa1MDe1tv5wsWi8dFryOgKdUJ954CEvyw0oPHsE6G9aZGZSlQ2dzDzA0ijsFPKGAHWeYvLgdlco=
X-Received: by 2002:a17:902:d544:b0:1c5:ca8d:136b with SMTP id
 z4-20020a170902d54400b001c5ca8d136bmr14874plf.14.1697224268678; Fri, 13 Oct
 2023 12:11:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-6-yong.wu@mediatek.com>
 <d0373c02-9b22-661f-9930-ca720053c2a0@collabora.com>
 <a115a2a5d3ac218e6db65ccdb0a1876f9cfca02b.camel@mediatek.com>
 <d798b15b-6f35-96db-e3f7-5c0bcc5d46a2@collabora.com>
 <a4ecc2792f3a4d3159e34415be984ff7d5f5e263.camel@mediatek.com>
 <20230927134614.kp27moxdw72jiu4y@pop-os.localdomain>
 <3aaafe47-3733-a4d5-038d-a7e439309282@collabora.com>
 <CA+ddPcP4=p37cV5Tbn5zTUbiL4ou+Yqb=5rS+O_ff8ZUw64D3Q@mail.gmail.com>
 <80695726-1a98-12d4-ad7d-d731f2f3caeb@collabora.com>
 <CA+ddPcPES=4FcQRkvVnW=C9mL6hCxVfCcoLDJSjb58UiDmS_Mg@mail.gmail.com>
 <32e515e1-b7a2-de3c-723b-ade3ec760b4d@collabora.com>
In-Reply-To: <32e515e1-b7a2-de3c-723b-ade3ec760b4d@collabora.com>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Fri, 13 Oct 2023 12:10:56 -0700
Message-ID: <CA+ddPcNMBhXPNie3XUzbnCME_KccOxsNsWREmO80nwhSskN7JQ@mail.gmail.com>
Subject: Re: [PATCH 5/9] dma-buf: heaps: mtk_sec_heap: Initialise tee session
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?= <Jianjiao.Zeng@mediatek.com>,
 "tjmercier@google.com" <tjmercier@google.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "jstultz@google.com" <jstultz@google.com>,
 Joakim Bech <joakim.bech@linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry for the delayed reply, needed to get some more info. This really
wouldn't be possible due to the limitation on the number of
regions...for example only 32 regions can be defined on some SoCs, and
you'd run out of regions really fast trying to do this. That's why
this is creating heaps for those regions and then allocations are
performed within the defined region is the preferred strategy.


On Thu, Sep 28, 2023 at 11:54=E2=80=AFPM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
>
> Le 28/09/2023 =C3=A0 19:48, Jeffrey Kardatzke a =C3=A9crit :
> > On Thu, Sep 28, 2023 at 1:30=E2=80=AFAM Benjamin Gaignard
> > <benjamin.gaignard@collabora.com> wrote:
> >>
> >> Le 27/09/2023 =C3=A0 20:56, Jeffrey Kardatzke a =C3=A9crit :
> >>> On Wed, Sep 27, 2023 at 8:18=E2=80=AFAM Benjamin Gaignard
> >>> <benjamin.gaignard@collabora.com> wrote:
> >>>> Le 27/09/2023 =C3=A0 15:46, Joakim Bech a =C3=A9crit :
> >>>>> On Mon, Sep 25, 2023 at 12:49:50PM +0000, Yong Wu (=E5=90=B4=E5=8B=
=87) wrote:
> >>>>>> On Tue, 2023-09-12 at 11:32 +0200, AngeloGioacchino Del Regno wrot=
e:
> >>>>>>> Il 12/09/23 08:17, Yong Wu (=E5=90=B4=E5=8B=87) ha scritto:
> >>>>>>>> On Mon, 2023-09-11 at 11:29 +0200, AngeloGioacchino Del Regno
> >>>>>>>> wrote:
> >>>>>>>>> Il 11/09/23 04:30, Yong Wu ha scritto:
> >>>>>>>>>> The TEE probe later than dma-buf heap, and PROBE_DEDER doesn't
> >>>>>>>>>> work
> >>>>>>>>>> here since this is not a platform driver, therefore initialise
> >>>>>>>>>> the
> >>>>>>>>>> TEE
> >>>>>>>>>> context/session while we allocate the first secure buffer.
> >>>>>>>>>>
> >>>>>>>>>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> >>>>>>>>>> ---
> >>>>>>>>>>       drivers/dma-buf/heaps/mtk_secure_heap.c | 61
> >>>>>>>>>> +++++++++++++++++++++++++
> >>>>>>>>>>       1 file changed, 61 insertions(+)
> >>>>>>>>>>
> >>>>>>>>>> diff --git a/drivers/dma-buf/heaps/mtk_secure_heap.c
> >>>>>>>>>> b/drivers/dma-
> >>>>>>>>>> buf/heaps/mtk_secure_heap.c
> >>>>>>>>>> index bbf1c8dce23e..e3da33a3d083 100644
> >>>>>>>>>> --- a/drivers/dma-buf/heaps/mtk_secure_heap.c
> >>>>>>>>>> +++ b/drivers/dma-buf/heaps/mtk_secure_heap.c
> >>>>>>>>>> @@ -10,6 +10,12 @@
> >>>>>>>>>>       #include <linux/err.h>
> >>>>>>>>>>       #include <linux/module.h>
> >>>>>>>>>>       #include <linux/slab.h>
> >>>>>>>>>> +#include <linux/tee_drv.h>
> >>>>>>>>>> +#include <linux/uuid.h>
> >>>>>>>>>> +
> >>>>>>>>>> +#define TZ_TA_MEM_UUID          "4477588a-8476-11e2-ad15-
> >>>>>>>>>> e41f1390d676"
> >>>>>>>>>> +
> >>>>>>>>> Is this UUID the same for all SoCs and all TZ versions?
> >>>>>>>> Yes. It is the same for all SoCs and all TZ versions currently.
> >>>>>>>>
> >>>>>>> That's good news!
> >>>>>>>
> >>>>>>> Is this UUID used in any userspace component? (example: Android
> >>>>>>> HALs?)
> >>>>>> No. Userspace never use it. If userspace would like to allocate th=
is
> >>>>>> secure buffer, it can achieve through the existing dmabuf IOCTL vi=
a
> >>>>>> /dev/dma_heap/mtk_svp node.
> >>>>>>
> >>>>> In general I think as mentioned elsewhere in comments, that there i=
sn't
> >>>>> that much here that seems to be unique for MediaTek in this patch
> >>>>> series, so I think it worth to see whether this whole patch set can=
 be
> >>>>> made more generic. Having said that, the UUID is always unique for =
a
> >>>>> certain Trusted Application. So, it's not entirely true saying that=
 the
> >>>>> UUID is the same for all SoCs and all TrustZone versions. It might =
be
> >>>>> true for a family of MediaTek devices and the TEE in use, but not
> >>>>> generically.
> >>>>>
> >>>>> So, if we need to differentiate between different TA implementation=
s,
> >>>>> then we need different UUIDs. If it would be possible to make this =
patch
> >>>>> set generic, then it sounds like a single UUID would be sufficient,=
 but
> >>>>> that would imply that all TA's supporting such a generic UUID would=
 be
> >>>>> implemented the same from an API point of view. Which also means th=
at
> >>>>> for example Trusted Application function ID's needs to be the same =
etc.
> >>>>> Not impossible to achieve, but still not easy (different TEE follow=
s
> >>>>> different specifications) and it's not typically something we've do=
ne in
> >>>>> the past.
> >>>>>
> >>>>> Unfortunately there is no standardized database of TA's describing =
what
> >>>>> they implement and support.
> >>>>>
> >>>>> As an alternative, we could implement a query call in the TEE answe=
ring,
> >>>>> "What UUID does your TA have that implements secure unmapped heap?"=
.
> >>>>> I.e., something that reminds of a lookup table. Then we wouldn't ha=
ve to
> >>>>> carry this in UAPI, DT or anywhere else.
> >>>> Joakim does a TA could offer a generic API and hide the hardware spe=
cific
> >>>> details (like kernel uAPI does for drivers) ?
> >>> It would have to go through another layer (like the tee driver) to be
> >>> a generic API. The main issue with TAs is that they have UUIDs you
> >>> need to connect to and specific codes for each function; so we should
> >>> abstract at a layer above where those exist in the dma-heap code.
> >>>> Aside that question I wonder what are the needs to perform a 'secure=
' playback.
> >>>> I have in mind 2 requirements:
> >>>> - secure memory regions, which means configure the hardware to ensur=
e that only
> >>>> dedicated hardware blocks and read or write into it.
> >>>> - set hardware blocks in secure modes so they access to secure memor=
y.
> >>>> Do you see something else ?
> >>> This is more or less what is required, but this is out of scope for
> >>> the Linux kernel since it can't be trusted to do these things...this
> >>> is all done in firmware or the TEE itself.
> >> Yes kernel can't be trusted to do these things but know what we need c=
ould help
> >> to define a API for a generic TA.
> >>
> >> Just to brainstorm on mailing list:
> >> What about a TA API like
> >> TA_secure_memory_region() and TA_unsecure_memory_region() with paramet=
ers like:
> >> - device identifier (an ID or compatible string maybe)
> >> - memory region (physical address, size, offset)
> >> - requested access rights (read, write)
> >>
> >> and on kernel side a IOMMU driver because it basically have all this i=
nformation already
> >> (device attachment, kernel map/unmap).
> >>
> >> In my mind it sound like a solution to limit the impact (new controls,=
 new memory type)
> >> inside v4l2. Probably we won't need new heap either.
> >> All hardware dedicated implementations could live inside the TA which =
can offer a generic
> >> API.
> > The main problem with that type of design is the limitations of
> > TrustZone memory protection. Usually there is a limit to the number of
> > regions you can define for memory protection (and there is on
> > Mediatek). So you can't pass an arbitrary memory region and mark it
> > protected/unprotected at a given time. You need to establish these
> > regions in the firmware instead and then configure those regions for
> > protection in the firmware or the TEE.
>
> The TEE iommu could be aware of these limitations and merge the regions w=
hen possible
> plus we can define a CMA region for each device to limit the secured memo=
ry fragmentation.
>
> >
> >>>> Regards,
> >>>> Benjamin
> >>>>
