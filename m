Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B95E599DFA
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 17:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B0610E442;
	Fri, 19 Aug 2022 15:14:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3000710E6F1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 15:13:57 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id g16so3432059qkl.11
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 08:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
 bh=nr8rrMVNiWjbEMsQN+8tx5Aw+8LLAcLghfGpTh/DJgw=;
 b=5nvP9M5Wh8IYYhZVJKc2Oil4ZK2LMQGsrk0Wh0yM2uyzwONdTlmAKiw0w/GNLRYA7M
 OTM9tisDyr5QHkdmU0u5CzFlDjrkubLL3JVPTKXqBx/2uKS5fuMU68tpMFhmnsjPt3aq
 +hd0BfqjCM6gxUO9J2JZRQOWSVxHB8IHiAhXVFtBQ8QA87JtpddvsED8dUlYzHy3Ia0A
 MymngRgRf5NT8GpoX5PmEwaJ0A4XE4bypuod4FAfaAAHXhjmM8/V89k40+DrTN6QnhT4
 IQWQEgVKCzz59J0tOKHgEdor7QYFEIzAYvt4z2zuq5b8sF2rNqBUQ2LtwhlNrLwr4nJf
 VEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc;
 bh=nr8rrMVNiWjbEMsQN+8tx5Aw+8LLAcLghfGpTh/DJgw=;
 b=sbKz5VcjHqS9oGeKWsyDYN40Q/rVYRRtqWBzrdUoEn71WUo0sBfaX5NjbYvkSV+PSJ
 Xx8cLaReyXXmY67UvNaLOS33CrB1ZYHL/h5HglDIvec/M4l9+P+ZSIE3UBZJYwJN6dJ+
 8DM7x6JkMktLwImy/5PjdyeyR1/uAmpkLce1T1AWkJixjn5RTEMZg13B8ToF5cX39/Pu
 kq2YqjI/hLHIHxbhLWHN+28Qg4jvyZgE2URyVejn/tADst9QH1JSOeJ6OfNZimxsLuC/
 Le0Id9qtO5UDpb+QPAVlF+hTDO3+aLE0SBFjP2DHugEzN5ZR3UYTCIrNTlBq7RCBZr++
 /oow==
X-Gm-Message-State: ACgBeo2F6m08FcfZ9aZLdlZNXrdkFaTRj/NInVlC8UfY4bAZ5F873yjJ
 JvBl6Gh/Mg6hEGHh3XVLs376Ag==
X-Google-Smtp-Source: AA6agR4eWfFB1Bowm5gYk7Q6tOCoL/CkVKWvfNXsd5Spa4qHQiSXId5pZrh+uvQgAccJn15Tb5qZUA==
X-Received: by 2002:a05:620a:1289:b0:6ba:e98f:d2b0 with SMTP id
 w9-20020a05620a128900b006bae98fd2b0mr5628589qki.509.1660922036185; 
 Fri, 19 Aug 2022 08:13:56 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net.
 [192.222.136.102]) by smtp.gmail.com with ESMTPSA id
 q4-20020ac87344000000b00342f960d26esm3208762qtp.15.2022.08.19.08.13.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 08:13:55 -0700 (PDT)
Message-ID: <09942d325e3b3c3149ebd9787794b065554f6064.camel@ndufresne.ca>
Subject: Re: [EXT] Re: [PATCH 1/3] dma-buf: heaps: add Linaro secure dmabuf
 heap support
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Cyrille Fleury <cyrille.fleury@nxp.com>, Olivier Masse
 <olivier.masse@nxp.com>, "brian.starkey@arm.com" <brian.starkey@arm.com>
Date: Fri, 19 Aug 2022 11:13:53 -0400
In-Reply-To: <AS8PR04MB75119C61E3222786A5BBF1D6886D9@AS8PR04MB7511.eurprd04.prod.outlook.com>
References: <20220805135330.970-1-olivier.masse@nxp.com>
 <20220805135330.970-2-olivier.masse@nxp.com>
 <20220805154139.2qkqxwklufjpsfdx@000377403353>
 <7e61668164f8bf02f6c4ee166e85abc42b5ee958.camel@nxp.com>
 <20220812163922.v7sf3havi5dpgi5u@000377403353>
 <de46324d8fa8fb6a8dda4641e531d30842410744.camel@nxp.com>
 <eef2fc413695cb96a5071627bfe44830f80cfe9e.camel@ndufresne.ca>
 <fb022db983aa44a5b1a8478d340198ecc52c4e11.camel@nxp.com>
 <AS8PR04MB75119C61E3222786A5BBF1D6886D9@AS8PR04MB7511.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
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
Cc: =?ISO-8859-1?Q?Cl=E9ment?= Faure <clement.faure@nxp.com>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "nd@arm.com" <nd@arm.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

thanks for the additional information, we are starting to have a (still par=
tial)
overview of your team goals.

Le jeudi 18 ao=C3=BBt 2022 =C3=A0 05:25 +0000, Cyrille Fleury a =C3=A9crit=
=C2=A0:
> Hi Nicolas, all,
>=20
>  The short reply:
>       - For DRM, gstreamer, ffmeg, ... we don't use anymore NXP VPU
> proprietary API=20
>       - We need secure dma-buf heaps to replace secure ion heaps
>=20
>   The more detailed reply to address concerns below in the thread:
>       - NXP doesn't design VPU, but rely on third party VPU hardware IP w=
e
> integrate in our soc.  NXP proprietary API are for legacy applications ou=
r
> customers did without using gstreamer or ffmpeg, but we are now relying o=
n
> V4L2 API for WPE/gstreamer, chromium/ffmpeg ...
>       - Even with NXP legacy BSP, there was no API impact for WPE (or
> chromium) due to NXP VPU API. We use WPE/gstreamer, then a gstreamer plug=
ing
> relying on NXP VPU proprietary API. But now we use V4L2. So we can forget=
 NXP
> VPU proprietary API, and I'm very happy with that.
>       - We have moved from ion buffer to dma buff to manage secure memory
> management. This is why we need secure dma-buf heaps, we protect with NXP
> hardware as we did with ion heaps in the presentation Olivier shared.    =
   =20
>       - For secure video playback, the changes we need to do are in user =
space
> world (gstreamer, WPE, ...), to update our patches managing secure ion he=
aps
> by secure dma-buf heaps. But dma-buf is file descriptor based as ion heap=
 are.

Do you have some links to these changes to user-space code that demonstrate=
 the
usage of this new heap in its real context ?

>       - What will change between platforms, is how memory is protected. T=
his
> is why we requested to have dtb in OPTEE for secure memory, to be able to
> provide a common API to secure DDR memory, and  then to rely on proprieta=
ry
> code in OPTEE to secure it.
>       - We don't have a display controller or VPU decoder running in TEE.=
 They
> remain under the full control of Linux/REE Word. If Linux/REE ask somethi=
ng
> breaking Widevine/PlayReady security rules, for example decode secure mem=
ory
> to non-secure memory, read from secure memory will return 0, write to sec=
ure
> memory will be ignored. Same with keys, certificates ...

Can you explain how you would manage to make VP9 stateless decoding work ? =
On
IMX8MQ you have a chip that will produce a feedback binary, which contains =
the
probability data. The mainline driver will merge the forward probability to
prepare the probability for the next decode.

This basically means at least 1 output of the decoder needs to be non-secur=
e
(for CPU read-back). That breaks the notion of secure memory domain, which =
is
global to the HW. One could think you could just ask the TEE to copy it bac=
k for
you, but to do that safely, the TEE would need to control the CODEC program=
ming,
hence have a CODEC driver in the secure OS.

I'm not familiar with it, but may that have impact on HDMI receivers, which=
 may
need some buffers for CPU usage (perhaps HDR metadata, EDID, etc.).

>       - i.MX8 socs have a stateless VPU and there is no VPU firmware. i.M=
X9
> socs have a stateful VPU with firmware. In secure memory context, with se=
cure
> memory, at software level, stateful VPU are even more simple to manage ->=
=20
> less read/write operations performed by Linux world to parse the stream, =
so
> less patch to be done in the video framework. But for memory management,
> stateful/stateless, same concern: we  need  to provide support of secure =
dma
> heaps to Linux, to allocate secure memory for the VPU and the display
> controller, so it is just a different dma-buf heaps, so a different file
> descriptor.

i.MX8 boards may have stateless or stateful CODEC (Hantro chips are used in
stateless fashion, while Amphion chips are driven by a stateful firmware). =
I
would have hoped NXP folks would know that, as this is what their users hav=
e to
deal with on day-to-day.

May I interpret this as NXP is giving up on i.MX8 memory protection (or per=
haps
your team is only caring about i.MX9 ?), and this solution is on usable for
stateful (less flexible) CODECs ?

>       - i.MX9 VPU will support "Virtual Machine VPU". Till now I don't se=
e why
> it will not work. I'm not an expert in VM, but from what I understood fro=
m my
> discussions with NXP VPU team integrating the new VPU hardware IP, from
> outside world, VPU is seen as multiple VPUs, with multiple register banks=
. So
> virtualized OS will continue to read/write registers as today, and at sof=
tware
> level, secure memory is as non-secure memory, I mean at this end, it is
> physical DDR memory. Of course hardware shall be able to read/write it, b=
ut
> this is not software related, this is hardware concern. And even without =
VM,
> we target to dedicate one virtual VPU to DRM,  so one register bank, to s=
etup
> dedicated security rules for DRM.

What you wrote here is about as much as I heard about the new security mode=
l
coming in newer chips (this is not NXP specific). I think in order to push
forward designs and APIs, it would be logical to first present about these
mechanism, now they work and how they affect drivers and user space. Its no=
t
clear how this mechanism inforces usage of non-mappable to kernel mmu memor=
y.
Providing Open Source kernel and userland to demonstrate and use this featu=
re is
also very helpful for reviewers and adopters, but also a requirement in the=
 drm
tree.

regards,
Nicolas

>      =20
>   I'm on vacation until end of this week. I can setup a call next week to=
 discuss this topic if more clarifications are needed.
>=20
> Regards.
>=20
> -----Original Message-----
> From: Olivier Masse <olivier.masse@nxp.com>=20
> Sent: Wednesday, August 17, 2022 4:52 PM
> To: nicolas@ndufresne.ca; Cyrille Fleury <cyrille.fleury@nxp.com>; brian.=
starkey@arm.com
> Cc: sumit.semwal@linaro.org; linux-kernel@vger.kernel.org; linaro-mm-sig@=
lists.linaro.org; christian.koenig@amd.com; linux-media@vger.kernel.org; nd=
@arm.com; Cl=C3=A9ment Faure <clement.faure@nxp.com>; dri-devel@lists.freed=
esktop.org; benjamin.gaignard@collabora.com
> Subject: Re: [EXT] Re: [PATCH 1/3] dma-buf: heaps: add Linaro secure dmab=
uf heap support
>=20
> +Cyrille
>=20
> Hi Nicolas,
>=20
> On mer., 2022-08-17 at 10:29 -0400, Nicolas Dufresne wrote:
> > Caution: EXT Email
> >=20
> > Hi Folks,
> >=20
> > Le mardi 16 ao=C3=BBt 2022 =C3=A0 11:20 +0000, Olivier Masse a =C3=A9cr=
it :
> > > Hi Brian,
> > >=20
> > >=20
> > > On ven., 2022-08-12 at 17:39 +0100, Brian Starkey wrote:
> > > > Caution: EXT Ema
> > > >=20
> >=20
> > [...]
> >=20
> > > >=20
> > > > Interesting, that's not how the devices I've worked on operated.
> > > >=20
> > > > Are you saying that you have to have a display controller driver=
=20
> > > > running in the TEE to display one of these buffers?
> > >=20
> > > In fact the display controller is managing 3 plans : UI, PiP and=20
> > > video. The video plan is protected in secure as you can see on slide
> > > 11:
> > >=20
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fstati=
c.linaro.org%2Fconnect%2Fsan19%2Fpresentations%2Fsan19-107.pdf&amp;data=3D0=
5%7C01%7Colivier.masse%40nxp.com%7Ce0e00be789a54dff8e5208da805ce2f6%7C686ea=
1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C637963433695707516%7CUnknown%7CTWFpbG=
Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C=
3000%7C%7C%7C&amp;sdata=3DGHjEfbgqRkfHK16oyNaYJob4LRVqvoffRElKR%2F7Rtes%3D&=
amp;reserved=3D0
> >=20
> >=20
> >=20
> > just wanted to highlight that all the WPE/GStreamer bit in this=20
> > presentation is based on NXP Vendor Media CODEC design, which rely on=
=20
> > their own i.MX VPU API. I don't see any effort to extend this to a=20
> > wider audience. It is not explaining how this can work with a mainline=
=20
> > kernel with v4l2 stateful or stateless drivers and generic=20
> > GStreamer/FFMPEG/Chromium support.
>=20
> Maybe Cyrille can explain what it is currently done at NXP level regardin=
g the integration of v4l2 with NXP VPU.
>=20
> >=20
> > I'm raising this, since I'm worried that no one cares of solving that=
=20
> > high level problem from a generic point of view. In that context, any=
=20
> > additions to the mainline Linux kernel can only be flawed and will=20
> > only serves specific vendors and not the larger audience.
> >=20
> > Another aspect, is that this design might be bound to a specific (NXP
> > ?)
> > security design. I've learn recently that newer HW is going to use=20
> > multiple level of MMU (like virtual machines do) to protect the memory=
=20
> > rather then marking pages. Will all this work for that too ?
>=20
> our fire-walling hardware is protecting memory behind the MMU and so rely=
 on physical memory layout.
> this work is only relying on a reserved physical memory.
>=20
> Regards,
> Olivier
>=20
> >=20
> > regards,
> > Nicolas

