Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6727C8D81
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 21:10:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E21A10E4F9;
	Fri, 13 Oct 2023 19:10:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA9F310E639
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 19:10:08 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1c9c496c114so26745ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 12:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1697224208; x=1697829008;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4kEcF0Pcfb3BOdaB7b/Xf8KkE2huQcs4DQyBywMHROs=;
 b=Cv2XvP4et+tvoGWpfimu/0N6G4YJBoAzmIvbnJXVvcPe+JYiwhUDP+lzThju6I+QYJ
 4p5UU4RRUOOecIHVVr0ch1swItbb/KMuar+hwITOZu9tejKHZXWxix/YrtLf6GmItEIK
 WweTLLjtu1ixuKQ2yhDu3eYqYShi/j83x7OYt/n2Jbqn0/xNKXPelx15VKdsq2UVqcME
 gpNCOr7tJDh4SCq8yKriOFxzgE+DEWVwwALcZekojgP1IqTYi7yZy02scqvwhXlWn9VW
 A1un4IY/djRrRylQ0UjbAWbnCw42tPdcVs8fkSL1nCr8TvCCJ2mATdTjvd2g383Kfc1U
 AKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697224208; x=1697829008;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4kEcF0Pcfb3BOdaB7b/Xf8KkE2huQcs4DQyBywMHROs=;
 b=MCgzQt7dMSuaegOP26e4fnaroLqQccdDcIVx+HLsjP0kmZSs3Q7Y0UHljmVwKyC05F
 QRJGFCN+W3H9ZHn5/koOLuX/3yv7t9Gz+NZIFPMkav3wajcowqh5/E5/Rd50zjtzAPr8
 ZwmfBPo2vTA88XKscHSQitHXr0L7W/5cSGsstgvQhkpVk4PoFW3lcyTqjXPDx9s4enXd
 D8EcQKxsAOfaoAC38UUUnNf6ab2OMFD/6qcdGfdCPOW0TUvfqO1vzSzq8KqU7Q8mwSAN
 7WTm4ybjFt38utuuINNATFZFGv1c4DQ8iTPJIGhWn74fdSQo1JeXYV+rmKzMInBVM7/J
 R3Ww==
X-Gm-Message-State: AOJu0YysfNBcmJXevN3RLwAGAJNnJmljOhjD6gyZVc7o+j3ffzNsv2Q5
 e5QQedlbvp+GFr7EgjgD+wmKK56l7fRZm3aNC7Np
X-Google-Smtp-Source: AGHT+IGKN9LKa4pnWHe0J9IrDAa7S+BFquvJdvp9aBRfEmdsXiquMXBH6qQLs2Vcpz7mcrbh+QMIDresmbS3cWwl4OI=
X-Received: by 2002:a17:903:1344:b0:1c5:59ea:84c3 with SMTP id
 jl4-20020a170903134400b001c559ea84c3mr5340plb.21.1697224207613; Fri, 13 Oct
 2023 12:10:07 -0700 (PDT)
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
Date: Fri, 13 Oct 2023 12:09:55 -0700
Message-ID: <CA+ddPcM4cLKTwYkALGdo=VPG8bysXG55hCsfTx571jFyW6RGpA@mail.gmail.com>
Subject: Re: [PATCH 5/9] dma-buf: heaps: mtk_sec_heap: Initialise tee session
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Content-Type: multipart/alternative; boundary="00000000000000653a06079dce36"
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

--00000000000000653a06079dce36
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for the delayed reply, needed to get some more info. This really
wouldn't be possible due to the limitation on the number of regions...for
example only 32 regions can be defined on some SoCs, and you'd run out of
regions really fast trying to do this. That's why this is creating heaps
for those regions and then allocations are performed within the defined
region is the preferred strategy.

On Thu, Sep 28, 2023 at 11:54=E2=80=AFPM Benjamin Gaignard <
benjamin.gaignard@collabora.com> wrote:

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
> >>>>> In general I think as mentioned elsewhere in comments, that there
> isn't
> >>>>> that much here that seems to be unique for MediaTek in this patch
> >>>>> series, so I think it worth to see whether this whole patch set can
> be
> >>>>> made more generic. Having said that, the UUID is always unique for =
a
> >>>>> certain Trusted Application. So, it's not entirely true saying that
> the
> >>>>> UUID is the same for all SoCs and all TrustZone versions. It might =
be
> >>>>> true for a family of MediaTek devices and the TEE in use, but not
> >>>>> generically.
> >>>>>
> >>>>> So, if we need to differentiate between different TA implementation=
s,
> >>>>> then we need different UUIDs. If it would be possible to make this
> patch
> >>>>> set generic, then it sounds like a single UUID would be sufficient,
> but
> >>>>> that would imply that all TA's supporting such a generic UUID would
> be
> >>>>> implemented the same from an API point of view. Which also means th=
at
> >>>>> for example Trusted Application function ID's needs to be the same
> etc.
> >>>>> Not impossible to achieve, but still not easy (different TEE follow=
s
> >>>>> different specifications) and it's not typically something we've
> done in
> >>>>> the past.
> >>>>>
> >>>>> Unfortunately there is no standardized database of TA's describing
> what
> >>>>> they implement and support.
> >>>>>
> >>>>> As an alternative, we could implement a query call in the TEE
> answering,
> >>>>> "What UUID does your TA have that implements secure unmapped heap?"=
.
> >>>>> I.e., something that reminds of a lookup table. Then we wouldn't
> have to
> >>>>> carry this in UAPI, DT or anywhere else.
> >>>> Joakim does a TA could offer a generic API and hide the hardware
> specific
> >>>> details (like kernel uAPI does for drivers) ?
> >>> It would have to go through another layer (like the tee driver) to be
> >>> a generic API. The main issue with TAs is that they have UUIDs you
> >>> need to connect to and specific codes for each function; so we should
> >>> abstract at a layer above where those exist in the dma-heap code.
> >>>> Aside that question I wonder what are the needs to perform a 'secure=
'
> playback.
> >>>> I have in mind 2 requirements:
> >>>> - secure memory regions, which means configure the hardware to ensur=
e
> that only
> >>>> dedicated hardware blocks and read or write into it.
> >>>> - set hardware blocks in secure modes so they access to secure memor=
y.
> >>>> Do you see something else ?
> >>> This is more or less what is required, but this is out of scope for
> >>> the Linux kernel since it can't be trusted to do these things...this
> >>> is all done in firmware or the TEE itself.
> >> Yes kernel can't be trusted to do these things but know what we need
> could help
> >> to define a API for a generic TA.
> >>
> >> Just to brainstorm on mailing list:
> >> What about a TA API like
> >> TA_secure_memory_region() and TA_unsecure_memory_region() with
> parameters like:
> >> - device identifier (an ID or compatible string maybe)
> >> - memory region (physical address, size, offset)
> >> - requested access rights (read, write)
> >>
> >> and on kernel side a IOMMU driver because it basically have all this
> information already
> >> (device attachment, kernel map/unmap).
> >>
> >> In my mind it sound like a solution to limit the impact (new controls,
> new memory type)
> >> inside v4l2. Probably we won't need new heap either.
> >> All hardware dedicated implementations could live inside the TA which
> can offer a generic
> >> API.
> > The main problem with that type of design is the limitations of
> > TrustZone memory protection. Usually there is a limit to the number of
> > regions you can define for memory protection (and there is on
> > Mediatek). So you can't pass an arbitrary memory region and mark it
> > protected/unprotected at a given time. You need to establish these
> > regions in the firmware instead and then configure those regions for
> > protection in the firmware or the TEE.
>
> The TEE iommu could be aware of these limitations and merge the regions
> when possible
> plus we can define a CMA region for each device to limit the secured
> memory fragmentation.
>
> >
> >>>> Regards,
> >>>> Benjamin
> >>>>
>

--00000000000000653a06079dce36
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry for the delayed reply, needed to get some more info.=
 This really wouldn&#39;t be possible due to the limitation on the number o=
f regions...for example only 32 regions can be defined on some SoCs, and yo=
u&#39;d run out of regions really fast trying to do this. That&#39;s why th=
is is creating heaps for those regions and then allocations are performed w=
ithin the defined region is the preferred strategy.</div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 28, 2023 at =
11:54=E2=80=AFPM Benjamin Gaignard &lt;<a href=3D"mailto:benjamin.gaignard@=
collabora.com">benjamin.gaignard@collabora.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><br>
Le 28/09/2023 =C3=A0 19:48, Jeffrey Kardatzke a =C3=A9crit=C2=A0:<br>
&gt; On Thu, Sep 28, 2023 at 1:30=E2=80=AFAM Benjamin Gaignard<br>
&gt; &lt;<a href=3D"mailto:benjamin.gaignard@collabora.com" target=3D"_blan=
k">benjamin.gaignard@collabora.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Le 27/09/2023 =C3=A0 20:56, Jeffrey Kardatzke a =C3=A9crit :<br>
&gt;&gt;&gt; On Wed, Sep 27, 2023 at 8:18=E2=80=AFAM Benjamin Gaignard<br>
&gt;&gt;&gt; &lt;<a href=3D"mailto:benjamin.gaignard@collabora.com" target=
=3D"_blank">benjamin.gaignard@collabora.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt; Le 27/09/2023 =C3=A0 15:46, Joakim Bech a =C3=A9crit :<br>
&gt;&gt;&gt;&gt;&gt; On Mon, Sep 25, 2023 at 12:49:50PM +0000, Yong Wu (=E5=
=90=B4=E5=8B=87) wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt; On Tue, 2023-09-12 at 11:32 +0200, AngeloGioacchin=
o Del Regno wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Il 12/09/23 08:17, Yong Wu (=E5=90=B4=E5=8B=87=
) ha scritto:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; On Mon, 2023-09-11 at 11:29 +0200, AngeloG=
ioacchino Del Regno<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Il 11/09/23 04:30, Yong Wu ha scritto:=
<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; The TEE probe later than dma-buf h=
eap, and PROBE_DEDER doesn&#39;t<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; work<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; here since this is not a platform =
driver, therefore initialise<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; the<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; TEE<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; context/session while we allocate =
the first secure buffer.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Signed-off-by: Yong Wu &lt;<a href=
=3D"mailto:yong.wu@mediatek.com" target=3D"_blank">yong.wu@mediatek.com</a>=
&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0drivers/=
dma-buf/heaps/mtk_secure_heap.c | 61<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +++++++++++++++++++++++++<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A01 file c=
hanged, 61 insertions(+)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; diff --git a/drivers/dma-buf/heaps=
/mtk_secure_heap.c<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; b/drivers/dma-<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; buf/heaps/mtk_secure_heap.c<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; index bbf1c8dce23e..e3da33a3d083 1=
00644<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; --- a/drivers/dma-buf/heaps/mtk_se=
cure_heap.c<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +++ b/drivers/dma-buf/heaps/mtk_se=
cure_heap.c<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; @@ -10,6 +10,12 @@<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#include=
 &lt;linux/err.h&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#include=
 &lt;linux/module.h&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#include=
 &lt;linux/slab.h&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +#include &lt;linux/tee_drv.h&gt;<=
br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +#include &lt;linux/uuid.h&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +#define TZ_TA_MEM_UUID=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;4477588a-8476-11e2-ad15-<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; e41f1390d676&quot;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Is this UUID the same for all SoCs and=
 all TZ versions?<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Yes. It is the same for all SoCs and all T=
Z versions currently.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; That&#39;s good news!<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Is this UUID used in any userspace component? =
(example: Android<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; HALs?)<br>
&gt;&gt;&gt;&gt;&gt;&gt; No. Userspace never use it. If userspace would lik=
e to allocate this<br>
&gt;&gt;&gt;&gt;&gt;&gt; secure buffer, it can achieve through the existing=
 dmabuf IOCTL via<br>
&gt;&gt;&gt;&gt;&gt;&gt; /dev/dma_heap/mtk_svp node.<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; In general I think as mentioned elsewhere in comments,=
 that there isn&#39;t<br>
&gt;&gt;&gt;&gt;&gt; that much here that seems to be unique for MediaTek in=
 this patch<br>
&gt;&gt;&gt;&gt;&gt; series, so I think it worth to see whether this whole =
patch set can be<br>
&gt;&gt;&gt;&gt;&gt; made more generic. Having said that, the UUID is alway=
s unique for a<br>
&gt;&gt;&gt;&gt;&gt; certain Trusted Application. So, it&#39;s not entirely=
 true saying that the<br>
&gt;&gt;&gt;&gt;&gt; UUID is the same for all SoCs and all TrustZone versio=
ns. It might be<br>
&gt;&gt;&gt;&gt;&gt; true for a family of MediaTek devices and the TEE in u=
se, but not<br>
&gt;&gt;&gt;&gt;&gt; generically.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; So, if we need to differentiate between different TA i=
mplementations,<br>
&gt;&gt;&gt;&gt;&gt; then we need different UUIDs. If it would be possible =
to make this patch<br>
&gt;&gt;&gt;&gt;&gt; set generic, then it sounds like a single UUID would b=
e sufficient, but<br>
&gt;&gt;&gt;&gt;&gt; that would imply that all TA&#39;s supporting such a g=
eneric UUID would be<br>
&gt;&gt;&gt;&gt;&gt; implemented the same from an API point of view. Which =
also means that<br>
&gt;&gt;&gt;&gt;&gt; for example Trusted Application function ID&#39;s need=
s to be the same etc.<br>
&gt;&gt;&gt;&gt;&gt; Not impossible to achieve, but still not easy (differe=
nt TEE follows<br>
&gt;&gt;&gt;&gt;&gt; different specifications) and it&#39;s not typically s=
omething we&#39;ve done in<br>
&gt;&gt;&gt;&gt;&gt; the past.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Unfortunately there is no standardized database of TA&=
#39;s describing what<br>
&gt;&gt;&gt;&gt;&gt; they implement and support.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; As an alternative, we could implement a query call in =
the TEE answering,<br>
&gt;&gt;&gt;&gt;&gt; &quot;What UUID does your TA have that implements secu=
re unmapped heap?&quot;.<br>
&gt;&gt;&gt;&gt;&gt; I.e., something that reminds of a lookup table. Then w=
e wouldn&#39;t have to<br>
&gt;&gt;&gt;&gt;&gt; carry this in UAPI, DT or anywhere else.<br>
&gt;&gt;&gt;&gt; Joakim does a TA could offer a generic API and hide the ha=
rdware specific<br>
&gt;&gt;&gt;&gt; details (like kernel uAPI does for drivers) ?<br>
&gt;&gt;&gt; It would have to go through another layer (like the tee driver=
) to be<br>
&gt;&gt;&gt; a generic API. The main issue with TAs is that they have UUIDs=
 you<br>
&gt;&gt;&gt; need to connect to and specific codes for each function; so we=
 should<br>
&gt;&gt;&gt; abstract at a layer above where those exist in the dma-heap co=
de.<br>
&gt;&gt;&gt;&gt; Aside that question I wonder what are the needs to perform=
 a &#39;secure&#39; playback.<br>
&gt;&gt;&gt;&gt; I have in mind 2 requirements:<br>
&gt;&gt;&gt;&gt; - secure memory regions, which means configure the hardwar=
e to ensure that only<br>
&gt;&gt;&gt;&gt; dedicated hardware blocks and read or write into it.<br>
&gt;&gt;&gt;&gt; - set hardware blocks in secure modes so they access to se=
cure memory.<br>
&gt;&gt;&gt;&gt; Do you see something else ?<br>
&gt;&gt;&gt; This is more or less what is required, but this is out of scop=
e for<br>
&gt;&gt;&gt; the Linux kernel since it can&#39;t be trusted to do these thi=
ngs...this<br>
&gt;&gt;&gt; is all done in firmware or the TEE itself.<br>
&gt;&gt; Yes kernel can&#39;t be trusted to do these things but know what w=
e need could help<br>
&gt;&gt; to define a API for a generic TA.<br>
&gt;&gt;<br>
&gt;&gt; Just to brainstorm on mailing list:<br>
&gt;&gt; What about a TA API like<br>
&gt;&gt; TA_secure_memory_region() and TA_unsecure_memory_region() with par=
ameters like:<br>
&gt;&gt; - device identifier (an ID or compatible string maybe)<br>
&gt;&gt; - memory region (physical address, size, offset)<br>
&gt;&gt; - requested access rights (read, write)<br>
&gt;&gt;<br>
&gt;&gt; and on kernel side a IOMMU driver because it basically have all th=
is information already<br>
&gt;&gt; (device attachment, kernel map/unmap).<br>
&gt;&gt;<br>
&gt;&gt; In my mind it sound like a solution to limit the impact (new contr=
ols, new memory type)<br>
&gt;&gt; inside v4l2. Probably we won&#39;t need new heap either.<br>
&gt;&gt; All hardware dedicated implementations could live inside the TA wh=
ich can offer a generic<br>
&gt;&gt; API.<br>
&gt; The main problem with that type of design is the limitations of<br>
&gt; TrustZone memory protection. Usually there is a limit to the number of=
<br>
&gt; regions you can define for memory protection (and there is on<br>
&gt; Mediatek). So you can&#39;t pass an arbitrary memory region and mark i=
t<br>
&gt; protected/unprotected at a given time. You need to establish these<br>
&gt; regions in the firmware instead and then configure those regions for<b=
r>
&gt; protection in the firmware or the TEE.<br>
<br>
The TEE iommu could be aware of these limitations and merge the regions whe=
n possible<br>
plus we can define a CMA region for each device to limit the secured memory=
 fragmentation.<br>
<br>
&gt;<br>
&gt;&gt;&gt;&gt; Regards,<br>
&gt;&gt;&gt;&gt; Benjamin<br>
&gt;&gt;&gt;&gt;<br>
</blockquote></div>

--00000000000000653a06079dce36--
