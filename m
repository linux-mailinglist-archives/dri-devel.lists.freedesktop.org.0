Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C23A0611636
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 17:46:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 897E610E85A;
	Fri, 28 Oct 2022 15:46:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2444410E85A
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 15:46:23 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id k4so774083qkj.8
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 08:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n7wg6m4y7Sr/W1sBFhmaKmHs4U8YNCLw4SZ7BN+yK98=;
 b=0bbFj9Obpxcoklo8vNPE0Bgt4zUKGxFsORf2drR0c4knS+xHVWQHkSWEddUcV1Mcmu
 K8xpyMVyVT/rQTq27xAsdT52y44JsJ0M5dMoRwy72qvI2RazkcDFKhvjk9KM65Hy60Yu
 zbNrRU4/Hx5DMj6bsL3hJAjl23YpFOm8r2z6lnP8VGR0ijDmG9wtnx2FkvIMV9Ee75gQ
 i+eY11MdkxTVv8oeUoFMBuHQnRj32ChxP77MUsNG3oJMQJlKcsRlv0boz3HYz171qctz
 /LL5T4t6h2tmR/k78Ot8XoVzIxczkznVHqlsqRbqW7upKfnuTtT7zCTpffYDrPNAZ9YJ
 WpIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=n7wg6m4y7Sr/W1sBFhmaKmHs4U8YNCLw4SZ7BN+yK98=;
 b=1L4oyp68ctkkwkEqem3UZaTCcBxO15qyT2HdVvsowUY2MvnLc0+zK5q3OmjbDZ7a/5
 ASF/eiaieUdfgUgd78LMELJ6MbK/xgkHnxmkPpcG5OUoZ4mVPtXrqVkQyIYdTIlN2dzD
 pigcLz5Q/Qudi595ew0v0VubFKGGKrR0ADjCpAgAwFfv5L1eA0ZittN49T+lGhWOJ4nl
 Y4YSjEp9yzVlcsc6u4oy7LHuENB4JkE8Mdb1Qhgg4P2NXdrvFD8wLxt+8pl6OaMCqG5o
 MRaZDQPA/7MsJe/CkquFkk6THVaznwT9IxwrF6basuhWA0rhsUtKTcPIYlLoDAYUM3IT
 H4JQ==
X-Gm-Message-State: ACrzQf0o7onYMAAlxXehXFVU0fsocmAYrhMMMv2kNCboATMMT8g/dogR
 Sv/WkzoWgnPoWqGbVOEK1Kd05A==
X-Google-Smtp-Source: AMsMyM5V6KnP58LswMcQx1GGoMOe1SYUi/Am/KiPpcS67WGvIO1VXZAVba1WRu+BfOuvx7owtphrXg==
X-Received: by 2002:a05:620a:2618:b0:6ea:908:120e with SMTP id
 z24-20020a05620a261800b006ea0908120emr38589170qko.645.1666971982084; 
 Fri, 28 Oct 2022 08:46:22 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net.
 [192.222.136.102]) by smtp.gmail.com with ESMTPSA id
 g11-20020ac8480b000000b0039cc665d60fsm2480985qtq.64.2022.10.28.08.46.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 08:46:21 -0700 (PDT)
Message-ID: <a53e5df51ec0f2f9d4c2d377c0cc5ba85f2e58ff.camel@ndufresne.ca>
Subject: Re: Try to address the DMA-buf coherency problem
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Lucas Stach <l.stach@pengutronix.de>, ppaalanen@gmail.com,
 sumit.semwal@linaro.org, daniel@ffwll.ch,  robdclark@gmail.com,
 dri-devel@lists.freedesktop.org,  linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org
Date: Fri, 28 Oct 2022 11:46:20 -0400
In-Reply-To: <e02cedc2-6741-8813-a7a5-f8769e301745@gmail.com>
References: <20221020121316.3946-1-christian.koenig@amd.com>
 <3d7353f3fa5905ce18e5b2d92f758f098189bc5a.camel@pengutronix.de>
 <7f5eff36-6886-bb06-061a-dd4263b61605@gmail.com>
 <f5de84cfe81fee828bbe0d47d379028d28ef6ca6.camel@pengutronix.de>
 <e02cedc2-6741-8813-a7a5-f8769e301745@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
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

Hi,

just dropping some real live use case, sorry I'm not really proposing solut=
ions,
I believe you are much more knowledgeable in this regard.

Le vendredi 28 octobre 2022 =C3=A0 16:26 +0200, Christian K=C3=B6nig a =C3=
=A9crit=C2=A0:
> Am 28.10.22 um 13:42 schrieb Lucas Stach:
> > Am Freitag, dem 28.10.2022 um 10:40 +0200 schrieb Christian K=C3=B6nig:
> > > But essentially the right thing to do. The only alternative I can see=
 is
> > > to reverse the role of exporter and importer.
> > >=20
> > I don't think that would work generally either, as buffer exporter and
> > importer isn't always a 1:1 thing. As soon as any attached importer has
> > a different coherency behavior than the others, things fall apart.
>=20
> I've just mentioned it because somebody noted that when you reverse the=
=20
> roles of exporter and importer with the V4L driver and i915 then the use=
=20
> case suddenly starts working.

Though, its not generically possible to reverse these roles. If you want to=
 do
so, you endup having to do like Android (gralloc) and ChromeOS (minigbm),
because you will have to allocate DRM buffers that knows about importer spe=
cific
requirements. See link [1] for what it looks like for RK3399, with Motion V=
ector
size calculation copied from the kernel driver into a userspace lib (arguab=
ly
that was available from V4L2 sizeimage, but this is technically difficult t=
o
communicate within the software layers). If you could let the decoder expor=
t
(with proper cache management) the non-generic code would not be needed.

Another case where reversing the role is difficult is for case where you ne=
ed to
multiplex the streams (let's use a camera to illustrate) and share that wit=
h
multiple processes. In these uses case, the DRM importers are volatile, whi=
ch
one do you abuse to do allocation from ? In multimedia server like PipeWire=
, you
are not really aware if the camera will be used by DRM or not, and if somet=
hing
"special" is needed in term of role inversion. It is relatively easy to dea=
l
with matching modifiers, but using downstream (display/gpu) as an exporter =
is
always difficult (and require some level of abuse and guessing).

[1]
https://android.googlesource.com/platform/external/minigbm/+/refs/heads/mas=
ter/rockchip.c#140

>=20
> > > > > For DRM and most V4L2 devices I then fill in the dma_coherent fla=
g based on the
> > > > > return value of dev_is_dma_coherent(). Exporting drivers are allo=
wed to clear
> > > > > the flag for their buffers if special handling like the USWC flag=
 in amdgpu or
> > > > > the uncached allocations for radeon/nouveau are in use.
> > > > >=20
> > > > I don't think the V4L2 part works for most ARM systems. The default
> > > > there is for devices to be noncoherent unless explicitly marked
> > > > otherwise. I don't think any of the "devices" writing the video buf=
fers
> > > > in cached memory with the CPU do this. While we could probably mark
> > > > them as coherent, I don't think this is moving in the right directi=
on.
> > > Well why not? Those devices are coherent in the sense of the DMA API
> > > that they don't need an extra CPU copy on sync_to_cpu/sync_to_device.
> > >=20
> > > We could come up with a better name for coherency, e.g. snooping for
> > > example. But that is just an documentation detail.
> > >=20
> > I agree that those devices copying data into a CPU cacheable buffer
> > should be marked as coherent, just not sure right now if other things
> > like DMA mappings are done on that device, which would require the
> > cache maintenance.
>=20
> Yeah, good point.
>=20
> > > And this the exact wrong approach as far as I can see. As Daniel note=
d
> > > as well we absolutely need some kind of coherency between exporter an=
d
> > > importer.
> > >=20
> > I think it's important that we are very specific about the thing we are
> > talking about here: I guess when you say coherency you mean hardware
> > enforced coherency on cacheable memory, which is the default on
> > x86/PCI.
>=20
> Well, no. What I mean with coherency is that the devices don't need=20
> insert special operation to access each others data.
>=20
> This can be archived by multiple approaches, e.g. by the PCI coherency=
=20
> requirements, device internal connections (XGMI, NVLink, CXL etc...) as=
=20
> well as using uncached system memory.
>=20
> The key point is what we certainly don't want is special operations=20
> which say: Ok, now device A can access the data, now device B.....=20
> because this breaks tons of use cases.

I'm coming back again with the multiplexing case. We keep having mixed uses=
 case
with multiple receiver. In some case, data may endup on CPU while being enc=
oded
in HW. Current approach of disabling cache does work, but CPU algorithm tru=
ly
suffer in performance. Doing a full memcpy to a cached buffer helps, but re=
mains
slower then if the cache had been snooped by the importer (encoder here) dr=
iver.

>=20
> > The other way to enforce coherency is to either insert cache
> > maintenance operations, or make sure that the buffer is not cacheable
> > by any device taking part in the sharing, including the CPU.
>=20
> Yes and no. When we want the devices to interact with each other without=
=20
> the CPU then we need some negotiated coherency between the two.
>=20
> > > This can either be provided by the PCI specification which makes it
> > > mandatory for device to snoop the caches or by platform devices agree=
ing
> > > that they only work on uncached memory.
> > What you disregard here is the fact that there are many systems out
> > there with mixed topologies, where some masters are part of the
> > coherency domain and some are not.
> >=20
> > We have two options here: either mandate that coherency for dma-bufs
> > need to be established by hardware, which is the option that you
> > strongly prefer, which means forcing all buffers to be uncacheable in a
> > system with masters that are not coherent, or allowing some form of
> > bracketed DMA access with cache maintenance ops.
>=20
> Well I don't prefer that option, it's just the only one I can see. One=
=20
> of the main goals of DMA-buf is to allow device to share data without=20
> the need for CPU interactions.
>=20
> In other words we negotiate the high level properties and then the=20
> device can talk to each other without explicitly noting who is accessing=
=20
> what.
>=20
> And this concept is completely incompatible with maintenance ops. We=20
> made that mistake with SWIOTLB for the DMA API and I don't really want=
=20
> to repeat that stunt.
>=20
> > > Explicit cache flush operations are simple not part of the design of
> > > DMA-buf because they are not part of the design of the higher level A=
PIs
> > > like Vulkan and OpenGL.
> > I'm aware that some graphics APIs have been living in a universe
> > blissfully unaware of systems without hardware enforced coherency. But
> > that isn't the only use for dma-bufs.
>=20
> Yeah, but the other use cases are extremely limited. As far as I can see
>=20
> >=20
> > I totally agree that some higher level API primitives aren't possible
> > without coherency at the hardware level and for those uses we should
> > require=C2=A0either HW enforced coherency or uncachable memory. But I d=
on't
> > think we should make things slow deliberately on systems that allow to
> > optimize things with the help of bracketed access.
> >=20
> > If I understood things right your amdgpu use-case even falls into this
> > category: normally you would want to use cacheable memory for
> > everything, but just make sure to clean the caches before using the
> > buffer with the non-coherent display engine.
>=20
> No, that won't work like this. The caching attributes must be coherent=
=20
> for the display engine to work correctly.
>=20
> > > Adding this to DMA-buf for the rather special use case would complete=
ly
> > > break that and make live much more complicated for everybody.
> > >=20
> > > > I also think that we should keep in mind that the world is moving i=
nto
> > > > a direction where DMA masters may not only snoop the CPU caches (wh=
at
> > > > is the definition of cache coherent on x86), but actually take part=
 in
> > > > the system coherence and are able to have writeback caches for shar=
ed
> > > > data on their own. I can only speculate, as I haven't seen the amdg=
pu
> > > > side yet, but I think this proposal is moving in the other directio=
n by
> > > > assuming a central system cache, where the importer has some magic =
way
> > > > to clean this central cache.
> > > What you mean is CXL: https://en.wikipedia.org/wiki/Compute_Express_L=
ink
> > Or ARM AMBA CHI.
> > > And yes we support that in a bunch of configurations and also have
> > > worked with that and amdgpu with DMA-buf based shared.
> > >=20
> > > This should not be a problem with this approach.
> > It works as long as all masters sharing the buffer are accessing the
> > buffer through the HW cache coherence facilities provided by CXL. As
> > soon as a master wants to bypass it (like your nosnoop scanout) you
> > need some way to force all other masters sharing access to the buffer
> > to clean their caches.
>=20
> That won't work like this. The problem is that this is an APU and so the=
=20
> display is part of the CPU. When either the MTRR or PAT says that the=20
> physical address is cacheable the engine might just hang on access.
>=20
> > > > Since I have a vested interest in seeing V4L2 UVC and non-coherent =
GPU
> > > > dma-buf sharing work on ARM systems and seem to hold some strong
> > > > opinions on how this should work, I guess I need to make some time
> > > > available to type it up, so we can discuss over coder rather than
> > > > abstract ideas. If I come up with something that works for my use-c=
ases
> > > > would you be up for taking a shot at a amdgpu implementation?
> > > Well, not really. As I said I see what you have in mind here as
> > > completely wrong approach we will certainly not support in any GPU dr=
iver.
> > >=20
> > > What we can do is to request the use case which won't work and this i=
s
> > > exactly what the patch here does.
> > >=20
> > Did you mean to write "prevent the use case which won't work" here?
>=20
> Oh, yes. To fast typing.
>=20
> Regards,
> Christian.
>=20
> >=20
> > Regards,
> > Lucas
> >=20
>=20

