Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFB81DAC68
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 09:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 983C38991A;
	Wed, 20 May 2020 07:41:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C39DB8991A
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 07:41:03 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id s198so2132611oie.6
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 00:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LpMKcJcPIyUkgSF19bbGoDPgaZ1XzGyXi82PNT/ctlY=;
 b=TKbcKUG6JCI8WDzXTPnu3iMdLu6lSWh/j5wEsb+dTyzDPZNblQdtqfIJk8DgtZrBrF
 yJ8XR1gJiG+GMmsaSkkqamW3DXqceVss+nmmVaCxQVKWgoBqq+sDTGkKjNg7naqxXTsj
 P4nxl9lwID+u+FK40jPcv+n9BjqzgzrKi2Zmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LpMKcJcPIyUkgSF19bbGoDPgaZ1XzGyXi82PNT/ctlY=;
 b=awwXMTVaSdyyXNuTRkxkD4CQUTbTY4Wn/YosymlifyBYW5NY8jRMw5K704uulU+9fa
 WE2mbQ5cb3EtYljBdRgFd3ARQ351bOkYId690gCgaiJbYAfqUiqsJplXtmQQYCnOqTsj
 fdOkKHdC+tWyez8c/yTaZjooQci/cHDLTyhf+VWV4lflbDS3WMKZiMpuNWdzd4xbgMqX
 +LaWrmvdN/DUGVs3lreR47xZH4gddmfWw3sLg0Ys2VGMAqwKUlOelmdE+5Rxn3SCR0Es
 KYj743inQHN2Z/UgnYXocVArusyYXTpCDZFb533o+91s0Bbv3ePVZgk4AxzE5RrjB+OV
 AJmQ==
X-Gm-Message-State: AOAM531g18DWmpSPUmPG55O3v/WI5tcvcL3RV8mqJ+q67jbJFiGr0NGi
 5vXCKd260CQeaTbOsJiEecPMlWdx/TTdwT1dUad35w==
X-Google-Smtp-Source: ABdhPJx+XkE4D5+lKzzRr79WhQ5weZJb8Q56sYWIvWPRirV0qtTU9e8IaXtZ/4rFlKgGIj8RndQr1c2Ghk0Fh4z1tro=
X-Received: by 2002:a05:6808:282:: with SMTP id
 z2mr2109962oic.101.1589960462872; 
 Wed, 20 May 2020 00:41:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200519163234.226513-1-sashal@kernel.org>
 <CAPM=9txZpiCGkv3jiBC1F8pTe4A2pqWpQDyjRBXk2roFqw+0+Q@mail.gmail.com>
 <CAKMK7uEa0FH5_AyopVH+wpAXOOxoeo8Acck2qwzzyVnq0UuSZA@mail.gmail.com>
 <MWHPR21MB0287145CD511A2FF6DA502A9C7B60@MWHPR21MB0287.namprd21.prod.outlook.com>
In-Reply-To: <MWHPR21MB0287145CD511A2FF6DA502A9C7B60@MWHPR21MB0287.namprd21.prod.outlook.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 20 May 2020 09:40:51 +0200
Message-ID: <CAKMK7uFubAxtMEeCOYtvgjGYtmDVJeXcPFzmRD7t5BUm_GPP0w@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: [RFC PATCH 0/4] DirectX on Linux
To: Steve Pronovost <spronovo@microsoft.com>
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
Cc: Sasha Levin <sashal@kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Haiyang Zhang <haiyangz@microsoft.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Wei Liu <wei.liu@kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Iouri Tarassov <iourit@microsoft.com>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, KY Srinivasan <kys@microsoft.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: multipart/mixed; boundary="===============0814293622=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0814293622==
Content-Type: multipart/alternative; boundary="00000000000098d2bd05a60f8461"

--00000000000098d2bd05a60f8461
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steve,

Sounds all good, some more comments and details below.

On Wed, May 20, 2020 at 5:47 AM Steve Pronovost <spronovo@microsoft.com>
wrote:

> Hey guys,
>
> Thanks for the discussion. I may not be able to immediately answer all of
> your questions, but I'll do my best =F0=9F=98=8A.
>
> drivers/hyperv sounds like it could be a better location. We weren't too
> sure where to put this, we though /drivers/gpu would be appropriate given
> this deal with GPUs, but I get your point... this is a vGPU driver that
> really only works when being run under Hyper-V, so drivers/hyperv is like=
ly
> more appropriate.
>

I think "it's a virtual gpu" is the wrong sales pitch, as is "only runs on
$platform". We have lots of drm drivers in drivers/gpu that fit that bill.
The better pitch I think is "it's a not a gpu, it's a dx12 protocol pipe"
and "we actually do not want to integrate with the linux gpu ecosystem and
primitives, we want to integrate with dx12 ecosystem and primitives to make
the seamless rdp/rail/vail stuff work nicely". Below some more thoughts on
the technical said.

>
> In term of presentation, I need to clarify a few things. We announced
> today that we're also adding support for Linux GUI applications. The way
> this will work is roughly as follow. We're writing a Wayland compositor
> that will essentially bridge over RDP-RAIL (RAIL=3DRemote Application
> Integrated Locally). We're starting from a Weston base. Weston already ha=
s
> an RDP Backend, but that's for a full desktop remoting scheme. Weston dra=
ws
> a desktop and remote it over RDP... and then you can peek at that desktop
> using an rdp client on the Windows side. RAIL works differently. In that
> case our wayland compositor no longer paint a desktop... instead it simpl=
y
> forward individual visual / wl_surface over the RDP RAIL channel such tha=
t
> these visual can be displayed on the Windows desktop. The RDP client crea=
te
> proxy window for each of these top level visual and their content is fill=
ed
> with the data coming over the RDP channel. All pixels are owned by the RD=
P
> server/WSL... so these windows looks different than native window are the=
y
> are painted and themed by WSL. The proxy window on the host gather input
> and inject back over RDP... This is essentially how application remoting
> works on windows and this is all publicly documented as part of the vario=
us
> RDP protocol specification. As a matter of fact, for the RDP server on th=
e
> Weston side we are looking at continue to leverage FreeRDP (and provide
> fixes/enhancement as needed to the public project). Further, we're lookin=
g
> at further improvement down this path to avoid having to copy the content
> over the RAIL channel and instead just share/swap buffer between the gues=
t
> and the host. We have extension to the RDP protocol, called VAIL
> (Virtualized Application Integrated Locally) which does that today. Today
> this is only use in Windows on Windows for very specific scenario. We're
> looking at extending the public RDP protocol with these VAIL extension to
> make this an official Microsoft supported protocol which would allow us t=
o
> target this in WSL. We have finished designing this part in details. Our
> goal would be to leverage something along the line of wl_drm, dma-buf,
> dma-fence, etc... This compositor and all our contribution to FreeRDP wil=
l
> be fully open source, including our design doc. We're not quite sure yet
> whether this will be offered as a separate project entirely distinct from
> it's Weston root... or if we'll propose an extension to Weston to operate
> in this mode. We would like to build it such that in theory any Wayland
> compositor could add support for this mode of operation if they want to
> remote application to a Windows host (over the network, or on the same bo=
x).
>

Sounds like a solid plan for presentation. I think this is all up to
wayland/weston folks to figure out with you, from the kernel side I have
only one concern (and I discussed that with a few folks already on irc, I
think they're at least on this thread involved within microsoft too in some
form): If we do integrate with linux concepts like wl_drm/dma-buf/fence and
so on then we end up with a normal gpu driver, with with lots of blobby
components all around that can't be opened (since large chunks written by
hw vendors, so nothing microsoft can do about them). That's the awkward
exception (why microsoft but not other gpu hw vendors/plaforms/whatever?)
that we need to avoid.

But wayland doesn't really need dma-buf and the wl_drm protocols afaiui, as
long as the egl extensions work you can have whatever private wayland
protocol in your winsys code you want to shovel the buffers and syncobj
from client to the wayland-rdp-rail compositor. If that uses dx12 native
handles for these things we side-step the awkward exception question for
linux gpu stack since it all stays 100% contained in drivers/hv. Just try
to avoid the nvidia fail of insisting that you need your own set of egl
extensions (egl_streams and egl_drm_kms_reinvented_but_badly and a few
others iirc) for everything, that makes it very painful for all the
compositor projects since they need duplicated code for no good reason :-)

Also looking at the fun the virtio folks have right now trying to get virgl
dma-buf handles in the guest shared with other virtio devices or virgl
instance in some other guest and getting it working ... If you avoid the
dma-buf integration that might also sidestep a lot of technical headaches
and be the simpler solution. At least as long as we're talking about wsl2
only.


> We see /dev/dxg really as a projection of the GPU when running in WSL suc=
h
> that the GPU can be shared between WSL and the host... not something that
> would coexist "at the same time" with a real DRM GPU.
>
> We have consider the possibility of bringing DX to Linux with no Windows
> cord attached. I'm not ready to discuss this at this time =F0=9F=98=8A...=
 but in the
> hypothetical that we were do this, DX would be running on top of DRI/DRM =
on
> native Linux. We likely would be contributing some changes to DRM to
> address area of divergence and get better mapping for our user mode drive=
r,
> but we wouldn't try to shoehorn /dev/dxg into the picture. In that
> hypothetical world, we would essentially have DX target DRM on native Lin=
ux
> and DX continue to target DXG in WSL to share the GPU with the host. I
> think this further reinforce the point you guys were making that the righ=
t
> place for our current dxgkrnl driver to live in would be
> /drivers/hyperv/dxgkrnl. In insight, I totally agree =F0=9F=98=8A.
>

We had a pile of discussions on irc about some of the ideas floating around
for extending drm with some of the newer memory/sync concepts. So very much
interested, but that's indeed a different fish and most likely will look a
lot different to the dxgkrnl interface, while ofc still aiming to give the
same power to apps. At least that's the goal, but aside from some prototype
in some place this really doesn't exist yet anywhere.


> I think this cover all questions, let me know if I missed anything.
>

I think it's all good.

Cheers, Daniel


> Thanks,
> Steve
>
> -----Original Message-----
> From: Daniel Vetter <daniel@ffwll.ch>
> Sent: Tuesday, May 19, 2020 4:01 PM
> To: Dave Airlie <airlied@gmail.com>
> Cc: Sasha Levin <sashal@kernel.org>; linux-hyperv@vger.kernel.org;
> Stephen Hemminger <sthemmin@microsoft.com>; Ursulin, Tvrtko <
> tvrtko.ursulin@intel.com>; Greg Kroah-Hartman <gregkh@linuxfoundation.org=
>;
> Haiyang Zhang <haiyangz@microsoft.com>; LKML <linux-kernel@vger.kernel.or=
g>;
> dri-devel <dri-devel@lists.freedesktop.org>; Chris Wilson <
> chris@chris-wilson.co.uk>; Steve Pronovost <spronovo@microsoft.com>;
> Linux Fbdev development list <linux-fbdev@vger.kernel.org>; Iouri
> Tarassov <iourit@microsoft.com>; Deucher, Alexander <
> alexander.deucher@amd.com>; KY Srinivasan <kys@microsoft.com>; Wei Liu <
> wei.liu@kernel.org>; Hawking Zhang <Hawking.Zhang@amd.com>
> Subject: [EXTERNAL] Re: [RFC PATCH 0/4] DirectX on Linux
>
> On Wed, May 20, 2020 at 12:42 AM Dave Airlie <airlied@gmail.com> wrote:
> >
> > On Wed, 20 May 2020 at 02:33, Sasha Levin <sashal@kernel.org> wrote:
> > >
> > > There is a blog post that goes into more detail about the bigger
> > > picture, and walks through all the required pieces to make this
> > > work. It is available here:
> > > https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fd=
e
> > > vblogs.microsoft.com
> %2Fdirectx%2Fdirectx-heart-linux&amp;data=3D02%7C01%7Cspronovo%
> 40microsoft.com%7C3f18e46192b24cccf6a008d7fc489063%7C72f988bf86f141af91ab=
2d7cd011db47%7C1%7C0%7C637255260910730243&amp;sdata=3DIRRknzg%2F6Myzj3JXESN=
7GgmN6AcUV3DxhL95P%2ButtCw%3D&amp;reserved=3D0
> . The rest of this cover letter will focus on the Linux Kernel bits.
> > >
> > > Overview
> > > =3D=3D=3D=3D=3D=3D=3D=3D
> > >
> > > This is the first draft of the Microsoft Virtual GPU (vGPU) driver.
> > > The driver exposes a paravirtualized GPU to user mode applications
> > > running in a virtual machine on a Windows host. This enables
> > > hardware acceleration in environment such as WSL (Windows Subsystem
> > > for Linux) where the Linux virtual machine is able to share the GPU
> > > with the Windows host.
> > >
> > > The projection is accomplished by exposing the WDDM (Windows Display
> > > Driver Model) interface as a set of IOCTL. This allows APIs and user
> > > mode driver written against the WDDM GPU abstraction on Windows to
> > > be ported to run within a Linux environment. This enables the port
> > > of the
> > > D3D12 and DirectML APIs as well as their associated user mode driver
> > > to Linux. This also enables third party APIs, such as the popular
> > > NVIDIA Cuda compute API, to be hardware accelerated within a WSL
> environment.
> > >
> > > Only the rendering/compute aspect of the GPU are projected to the
> > > virtual machine, no display functionality is exposed. Further, at
> > > this time there are no presentation integration. So although the
> > > D3D12 API can be use to render graphics offscreen, there is no path
> > > (yet) for pixel to flow from the Linux environment back onto the
> > > Windows host desktop. This GPU stack is effectively side-by-side
> > > with the native Linux graphics stack.
> >
> > Okay I've had some caffiene and absorbed some more of this.
> >
> > This is a driver that connects a binary blob interface in the Windows
> > kernel drivers to a binary blob that you run inside a Linux guest.
> > It's a binary transport between two binary pieces. Personally this
> > holds little of interest to me, I can see why it might be nice to have
> > this upstream, but I don't forsee any other Linux distributor ever
> > enabling it or having to ship it, it's purely a WSL2 pipe. I'm not
> > saying I'd be happy to see this in the tree, since I don't see the
> > value of maintaining it upstream, but it probably should just exists
> > in a drivers/hyperv type area.
>
> Yup as-is (especially with the goal of this being aimed at ml/compute
> only) drivers/hyperv sounds a bunch more reasonable than drivers/gpu.
>
> > Having said that, I hit one stumbling block:
> > "Further, at this time there are no presentation integration. "
> >
> > If we upstream this driver as-is into some hyperv specific place, and
> > you decide to add presentation integration this is more than likely
> > going to mean you will want to interact with dma-bufs and dma-fences.
> > If the driver is hidden away in a hyperv place it's likely we won't
> > even notice that feature landing until it's too late.
>
> I've recently added regex matches to MAINTAINERS so we'll see
> dma_buf/fence/anything show up on dri-devel. So that part is solved
> hopefully.
>
> > I would like to see a coherent plan for presentation support (not
> > code, just an architectural diagram), because I think when you
> > contemplate how that works it will change the picture of how this
> > driver looks and intergrates into the rest of the Linux graphics
> > ecosystem.
>
> Yeah once we have the feature-creep to presentation support all the
> integration fun starts, with all the questions about "why does this not
> look like any other linux gpu driver". We have that already with nvidia
> insisting they just can't implement any of the upstream gpu uapi we have,
> but at least they're not in-tree, so not our problem from an upstream
> maintainership pov.
>
> But once this dx12 pipe is landed and then we want to extend it it's stil=
l
> going to have all the "we can't ever release the sources to any of the
> parts we usually expect to be open for gpu drivers in upstream"
> problems. Then we're stuck at a rather awkward point of why one vendor
> gets an exception and all the others dont.
>
> > As-is I'd rather this didn't land under my purview, since I don't see
> > the value this adds to the Linux ecosystem at all, and I think it's
> > important when putting a burden on upstream that you provide some
> > value.
>
> Well there is some in the form of "more hw/platform support". But given
> that gpus evolved rather fast, including the entire integration ecosystem
> (it's by far not just the hw drivers that move quickly). So that value
> deprecates a lot faster than for other kernel subsystems.
> And all that's left is the pain of not breaking anything without actually
> being able to evolve the overall stack in any meaningful way.
> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 -
> +https://nam06.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fblog.=
f
> +fwll.ch%2F&amp;data=3D02%7C01%7Cspronovo%40microsoft.com%7C3f18e46192b24=
c
> +ccf6a008d7fc489063%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C6372552
> <https://nam06.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fblog.=
f+fwll.ch%2F&amp;data=3D02%7C01%7Cspronovo%40microsoft.com%7C3f18e46192b24c=
+ccf6a008d7fc489063%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C6372552>
> +60910735230&amp;sdata=3DhAIV1wJ29WF9IXTvJm3dr4StCwPzF0GdO2iWPyfnElg%3D&a=
m
> +p;reserved=3D0
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch

--00000000000098d2bd05a60f8461
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Steve,<br></div><div><br></div><div>So=
unds all good, some more comments and details below.</div><div><br></div><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May =
20, 2020 at 5:47 AM Steve Pronovost &lt;<a href=3D"mailto:spronovo@microsof=
t.com" target=3D"_blank">spronovo@microsoft.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Hey guys,<br>
<br>
Thanks for the discussion. I may not be able to immediately answer all of y=
our questions, but I&#39;ll do my best =F0=9F=98=8A.<br>
<br>
drivers/hyperv sounds like it could be a better location. We weren&#39;t to=
o sure where to put this, we though /drivers/gpu would be appropriate given=
 this deal with GPUs, but I get your point... this is a vGPU driver that re=
ally only works when being run under Hyper-V, so drivers/hyperv is likely m=
ore appropriate.<br></blockquote><div><br></div><div>I think &quot;it&#39;s=
 a virtual gpu&quot; is the wrong sales pitch, as is &quot;only runs on $pl=
atform&quot;. We have lots of drm drivers in drivers/gpu that fit that bill=
. The better pitch I think is &quot;it&#39;s a not a gpu, it&#39;s a dx12 p=
rotocol pipe&quot; and &quot;we actually do not want to integrate with the =
linux gpu ecosystem and primitives, we want to integrate with dx12 ecosyste=
m and primitives to make the seamless rdp/rail/vail stuff work nicely&quot;=
. Below some more thoughts on the technical said.<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
In term of presentation, I need to clarify a few things. We announced today=
 that we&#39;re also adding support for Linux GUI applications. The way thi=
s will work is roughly as follow. We&#39;re writing a Wayland compositor th=
at will essentially bridge over RDP-RAIL (RAIL=3DRemote Application Integra=
ted Locally). We&#39;re starting from a Weston base. Weston already has an =
RDP Backend, but that&#39;s for a full desktop remoting scheme. Weston draw=
s a desktop and remote it over RDP... and then you can peek at that desktop=
 using an rdp client on the Windows side. RAIL works differently. In that c=
ase our wayland compositor no longer paint a desktop... instead it simply f=
orward individual visual / wl_surface over the RDP RAIL channel such that t=
hese visual can be displayed on the Windows desktop. The RDP client create =
proxy window for each of these top level visual and their content is filled=
 with the data coming over the RDP channel. All pixels are owned by the RDP=
 server/WSL... so these windows looks different than native window are they=
 are painted and themed by WSL. The proxy window on the host gather input a=
nd inject back over RDP... This is essentially how application remoting wor=
ks on windows and this is all publicly documented as part of the various RD=
P protocol specification. As a matter of fact, for the RDP server on the We=
ston side we are looking at continue to leverage FreeRDP (and provide fixes=
/enhancement as needed to the public project). Further, we&#39;re looking a=
t further improvement down this path to avoid having to copy the content ov=
er the RAIL channel and instead just share/swap buffer between the guest an=
d the host. We have extension to the RDP protocol, called VAIL (Virtualized=
 Application Integrated Locally) which does that today. Today this is only =
use in Windows on Windows for very specific scenario. We&#39;re looking at =
extending the public RDP protocol with these VAIL extension to make this an=
 official Microsoft supported protocol which would allow us to target this =
in WSL. We have finished designing this part in details. Our goal would be =
to leverage something along the line of wl_drm, dma-buf, dma-fence, etc... =
This compositor and all our contribution to FreeRDP will be fully open sour=
ce, including our design doc. We&#39;re not quite sure yet whether this wil=
l be offered as a separate project entirely distinct from it&#39;s Weston r=
oot... or if we&#39;ll propose an extension to Weston to operate in this mo=
de. We would like to build it such that in theory any Wayland compositor co=
uld add support for this mode of operation if they want to remote applicati=
on to a Windows host (over the network, or on the same box).<br></blockquot=
e><div><br></div><div>Sounds like a solid plan for presentation. I think th=
is is all up to wayland/weston folks to figure out with you, from the kerne=
l side I have only one concern (and I discussed that with a few folks alrea=
dy on irc, I think they&#39;re at least on this thread involved within micr=
osoft too in some form): If we do integrate with linux concepts like wl_drm=
/dma-buf/fence and so on then we end up with a normal gpu driver, with with=
 lots of blobby components all around that can&#39;t be opened (since large=
 chunks written by hw vendors, so nothing microsoft can do about them). Tha=
t&#39;s the awkward exception (why microsoft but not other gpu hw vendors/p=
laforms/whatever?) that we need to avoid.</div><div><br></div><div>But wayl=
and doesn&#39;t really need dma-buf and the wl_drm protocols afaiui, as lon=
g as the egl extensions work you can have whatever private wayland protocol=
 in your winsys code you want to shovel the buffers and syncobj from client=
 to the wayland-rdp-rail compositor. If that uses dx12 native handles for t=
hese things we side-step the awkward exception question for linux gpu stack=
 since it all stays 100% contained in drivers/hv. Just try to avoid the nvi=
dia fail of insisting that you need your own set of egl extensions (egl_str=
eams and egl_drm_kms_reinvented_but_badly and a few others iirc) for everyt=
hing, that makes it very painful for all the compositor projects since they=
 need duplicated code for no good reason :-)<br></div><div><br></div><div>A=
lso looking at the fun the virtio folks have right now trying to get virgl =
dma-buf handles in the guest shared with other virtio devices or virgl inst=
ance in some other guest and getting it working ... If you avoid the dma-bu=
f integration that might also sidestep a lot of technical headaches and be =
the simpler solution. At least as long as we&#39;re talking about wsl2 only=
.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
We see /dev/dxg really as a projection of the GPU when running in WSL such =
that the GPU can be shared between WSL and the host... not something that w=
ould coexist &quot;at the same time&quot; with a real DRM GPU.<br>
<br>
We have consider the possibility of bringing DX to Linux with no Windows co=
rd attached. I&#39;m not ready to discuss this at this time =F0=9F=98=8A...=
 but in the hypothetical that we were do this, DX would be running on top o=
f DRI/DRM on native Linux. We likely would be contributing some changes to =
DRM to address area of divergence and get better mapping for our user mode =
driver, but we wouldn&#39;t try to shoehorn /dev/dxg into the picture. In t=
hat hypothetical world, we would essentially have DX target DRM on native L=
inux and DX continue to target DXG in WSL to share the GPU with the host. I=
 think this further reinforce the point you guys were making that the right=
 place for our current dxgkrnl driver to live in would be /drivers/hyperv/d=
xgkrnl. In insight, I totally agree =F0=9F=98=8A.<br></blockquote><div>=C2=
=A0</div><div>We had a pile of discussions on irc about some of the ideas f=
loating=20
around for extending drm with some of the newer memory/sync concepts. So
 very much interested, but that&#39;s indeed a different fish and most=20
likely will look a lot different to the dxgkrnl interface, while ofc=20
still aiming to give the same power to apps. At least that&#39;s the goal,=
=20
but aside from some prototype in some place this really doesn&#39;t exist=
=20
yet anywhere.</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
I think this cover all questions, let me know if I missed anything.<br></bl=
ockquote><div><br></div>I think it&#39;s all good.<br></div><div class=3D"g=
mail_quote"><div><br></div><div>Cheers, Daniel</div><div><br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks,<br>
Steve<br>
<br>
-----Original Message-----<br>
From: Daniel Vetter &lt;<a href=3D"mailto:daniel@ffwll.ch" target=3D"_blank=
">daniel@ffwll.ch</a>&gt; <br>
Sent: Tuesday, May 19, 2020 4:01 PM<br>
To: Dave Airlie &lt;<a href=3D"mailto:airlied@gmail.com" target=3D"_blank">=
airlied@gmail.com</a>&gt;<br>
Cc: Sasha Levin &lt;<a href=3D"mailto:sashal@kernel.org" target=3D"_blank">=
sashal@kernel.org</a>&gt;; <a href=3D"mailto:linux-hyperv@vger.kernel.org" =
target=3D"_blank">linux-hyperv@vger.kernel.org</a>; Stephen Hemminger &lt;<=
a href=3D"mailto:sthemmin@microsoft.com" target=3D"_blank">sthemmin@microso=
ft.com</a>&gt;; Ursulin, Tvrtko &lt;<a href=3D"mailto:tvrtko.ursulin@intel.=
com" target=3D"_blank">tvrtko.ursulin@intel.com</a>&gt;; Greg Kroah-Hartman=
 &lt;<a href=3D"mailto:gregkh@linuxfoundation.org" target=3D"_blank">gregkh=
@linuxfoundation.org</a>&gt;; Haiyang Zhang &lt;<a href=3D"mailto:haiyangz@=
microsoft.com" target=3D"_blank">haiyangz@microsoft.com</a>&gt;; LKML &lt;<=
a href=3D"mailto:linux-kernel@vger.kernel.org" target=3D"_blank">linux-kern=
el@vger.kernel.org</a>&gt;; dri-devel &lt;<a href=3D"mailto:dri-devel@lists=
.freedesktop.org" target=3D"_blank">dri-devel@lists.freedesktop.org</a>&gt;=
; Chris Wilson &lt;<a href=3D"mailto:chris@chris-wilson.co.uk" target=3D"_b=
lank">chris@chris-wilson.co.uk</a>&gt;; Steve Pronovost &lt;<a href=3D"mail=
to:spronovo@microsoft.com" target=3D"_blank">spronovo@microsoft.com</a>&gt;=
; Linux Fbdev development list &lt;<a href=3D"mailto:linux-fbdev@vger.kerne=
l.org" target=3D"_blank">linux-fbdev@vger.kernel.org</a>&gt;; Iouri Tarasso=
v &lt;<a href=3D"mailto:iourit@microsoft.com" target=3D"_blank">iourit@micr=
osoft.com</a>&gt;; Deucher, Alexander &lt;<a href=3D"mailto:alexander.deuch=
er@amd.com" target=3D"_blank">alexander.deucher@amd.com</a>&gt;; KY Sriniva=
san &lt;<a href=3D"mailto:kys@microsoft.com" target=3D"_blank">kys@microsof=
t.com</a>&gt;; Wei Liu &lt;<a href=3D"mailto:wei.liu@kernel.org" target=3D"=
_blank">wei.liu@kernel.org</a>&gt;; Hawking Zhang &lt;<a href=3D"mailto:Haw=
king.Zhang@amd.com" target=3D"_blank">Hawking.Zhang@amd.com</a>&gt;<br>
Subject: [EXTERNAL] Re: [RFC PATCH 0/4] DirectX on Linux<br>
<br>
On Wed, May 20, 2020 at 12:42 AM Dave Airlie &lt;<a href=3D"mailto:airlied@=
gmail.com" target=3D"_blank">airlied@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Wed, 20 May 2020 at 02:33, Sasha Levin &lt;<a href=3D"mailto:sashal=
@kernel.org" target=3D"_blank">sashal@kernel.org</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; There is a blog post that goes into more detail about the bigger =
<br>
&gt; &gt; picture, and walks through all the required pieces to make this <=
br>
&gt; &gt; work. It is available here:<br>
&gt; &gt; <a href=3D"https://nam06.safelinks.protection.outlook.com/?url=3D=
https%3A%2F%2Fde" rel=3D"noreferrer" target=3D"_blank">https://nam06.safeli=
nks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fde</a><br>
&gt; &gt; <a href=3D"http://vblogs.microsoft.com" rel=3D"noreferrer" target=
=3D"_blank">vblogs.microsoft.com</a>%2Fdirectx%2Fdirectx-heart-linux&amp;am=
p;data=3D02%7C01%7Cspronovo%<a href=3D"http://40microsoft.com" rel=3D"noref=
errer" target=3D"_blank">40microsoft.com</a>%7C3f18e46192b24cccf6a008d7fc48=
9063%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637255260910730243&amp;am=
p;sdata=3DIRRknzg%2F6Myzj3JXESN7GgmN6AcUV3DxhL95P%2ButtCw%3D&amp;amp;reserv=
ed=3D0 . The rest of this cover letter will focus on the Linux Kernel bits.=
<br>
&gt; &gt;<br>
&gt; &gt; Overview<br>
&gt; &gt; =3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt;<br>
&gt; &gt; This is the first draft of the Microsoft Virtual GPU (vGPU) drive=
r. <br>
&gt; &gt; The driver exposes a paravirtualized GPU to user mode application=
s <br>
&gt; &gt; running in a virtual machine on a Windows host. This enables <br>
&gt; &gt; hardware acceleration in environment such as WSL (Windows Subsyst=
em <br>
&gt; &gt; for Linux) where the Linux virtual machine is able to share the G=
PU <br>
&gt; &gt; with the Windows host.<br>
&gt; &gt;<br>
&gt; &gt; The projection is accomplished by exposing the WDDM (Windows Disp=
lay <br>
&gt; &gt; Driver Model) interface as a set of IOCTL. This allows APIs and u=
ser <br>
&gt; &gt; mode driver written against the WDDM GPU abstraction on Windows t=
o <br>
&gt; &gt; be ported to run within a Linux environment. This enables the por=
t <br>
&gt; &gt; of the<br>
&gt; &gt; D3D12 and DirectML APIs as well as their associated user mode dri=
ver <br>
&gt; &gt; to Linux. This also enables third party APIs, such as the popular=
 <br>
&gt; &gt; NVIDIA Cuda compute API, to be hardware accelerated within a WSL =
environment.<br>
&gt; &gt;<br>
&gt; &gt; Only the rendering/compute aspect of the GPU are projected to the=
 <br>
&gt; &gt; virtual machine, no display functionality is exposed. Further, at=
 <br>
&gt; &gt; this time there are no presentation integration. So although the =
<br>
&gt; &gt; D3D12 API can be use to render graphics offscreen, there is no pa=
th <br>
&gt; &gt; (yet) for pixel to flow from the Linux environment back onto the =
<br>
&gt; &gt; Windows host desktop. This GPU stack is effectively side-by-side =
<br>
&gt; &gt; with the native Linux graphics stack.<br>
&gt;<br>
&gt; Okay I&#39;ve had some caffiene and absorbed some more of this.<br>
&gt;<br>
&gt; This is a driver that connects a binary blob interface in the Windows =
<br>
&gt; kernel drivers to a binary blob that you run inside a Linux guest.<br>
&gt; It&#39;s a binary transport between two binary pieces. Personally this=
 <br>
&gt; holds little of interest to me, I can see why it might be nice to have=
 <br>
&gt; this upstream, but I don&#39;t forsee any other Linux distributor ever=
 <br>
&gt; enabling it or having to ship it, it&#39;s purely a WSL2 pipe. I&#39;m=
 not <br>
&gt; saying I&#39;d be happy to see this in the tree, since I don&#39;t see=
 the <br>
&gt; value of maintaining it upstream, but it probably should just exists <=
br>
&gt; in a drivers/hyperv type area.<br>
<br>
Yup as-is (especially with the goal of this being aimed at ml/compute<br>
only) drivers/hyperv sounds a bunch more reasonable than drivers/gpu.<br>
<br>
&gt; Having said that, I hit one stumbling block:<br>
&gt; &quot;Further, at this time there are no presentation integration. &qu=
ot;<br>
&gt;<br>
&gt; If we upstream this driver as-is into some hyperv specific place, and =
<br>
&gt; you decide to add presentation integration this is more than likely <b=
r>
&gt; going to mean you will want to interact with dma-bufs and dma-fences.<=
br>
&gt; If the driver is hidden away in a hyperv place it&#39;s likely we won&=
#39;t <br>
&gt; even notice that feature landing until it&#39;s too late.<br>
<br>
I&#39;ve recently added regex matches to MAINTAINERS so we&#39;ll see dma_b=
uf/fence/anything show up on dri-devel. So that part is solved hopefully.<b=
r>
<br>
&gt; I would like to see a coherent plan for presentation support (not <br>
&gt; code, just an architectural diagram), because I think when you <br>
&gt; contemplate how that works it will change the picture of how this <br>
&gt; driver looks and intergrates into the rest of the Linux graphics <br>
&gt; ecosystem.<br>
<br>
Yeah once we have the feature-creep to presentation support all the integra=
tion fun starts, with all the questions about &quot;why does this not look =
like any other linux gpu driver&quot;. We have that already with nvidia ins=
isting they just can&#39;t implement any of the upstream gpu uapi we have, =
but at least they&#39;re not in-tree, so not our problem from an upstream m=
aintainership pov.<br>
<br>
But once this dx12 pipe is landed and then we want to extend it it&#39;s st=
ill going to have all the &quot;we can&#39;t ever release the sources to an=
y of the parts we usually expect to be open for gpu drivers in upstream&quo=
t;<br>
problems. Then we&#39;re stuck at a rather awkward point of why one vendor =
gets an exception and all the others dont.<br>
<br>
&gt; As-is I&#39;d rather this didn&#39;t land under my purview, since I do=
n&#39;t see <br>
&gt; the value this adds to the Linux ecosystem at all, and I think it&#39;=
s <br>
&gt; important when putting a burden on upstream that you provide some <br>
&gt; value.<br>
<br>
Well there is some in the form of &quot;more hw/platform support&quot;. But=
 given that gpus evolved rather fast, including the entire integration ecos=
ystem (it&#39;s by far not just the hw drivers that move quickly). So that =
value deprecates a lot faster than for other kernel subsystems.<br>
And all that&#39;s left is the pain of not breaking anything without actual=
ly being able to evolve the overall stack in any meaningful way.<br>
-Daniel<br>
--<br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
+41 (0) 79 365 57 48 - <br>
+<a href=3D"https://nam06.safelinks.protection.outlook.com/?url=3Dhttp%3A%2=
F%2Fblog.f+fwll.ch%2F&amp;amp;data=3D02%7C01%7Cspronovo%40microsoft.com%7C3=
f18e46192b24c+ccf6a008d7fc489063%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0=
%7C6372552" rel=3D"noreferrer" target=3D"_blank">https://nam06.safelinks.pr=
otection.outlook.com/?url=3Dhttp%3A%2F%2Fblog.f<br>
+fwll.ch%2F&amp;amp;data=3D02%7C01%7Cspronovo%40microsoft.com%7C3f18e46192b=
24c<br>
+ccf6a008d7fc489063%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C6372552</a=
><br>
+60910735230&amp;amp;sdata=3DhAIV1wJ29WF9IXTvJm3dr4StCwPzF0GdO2iWPyfnElg%3D=
&amp;am<br>
+p;reserved=3D0<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Daniel Vet=
ter<br>Software Engineer, Intel Corporation<br>+41 (0) 79 365 57 48 - <a hr=
ef=3D"http://blog.ffwll.ch" target=3D"_blank">http://blog.ffwll.ch</a></div=
></div>

--00000000000098d2bd05a60f8461--

--===============0814293622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0814293622==--
