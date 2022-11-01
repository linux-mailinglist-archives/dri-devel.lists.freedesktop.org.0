Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D77256153C7
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 22:09:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F64C10E00D;
	Tue,  1 Nov 2022 21:09:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA34A10E00D
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Nov 2022 21:09:11 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id h10so11195004qvq.7
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Nov 2022 14:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=IA78CJUsz8GOnHJBNt5ObPfgEfWAR2skrXR8uIrX0HQ=;
 b=v7uEmbWVx03ktLI8on+6wIWk6Vll0iWOVY5lXjy338Zv72jaubeZiqWc6RQtuvPLay
 6JbN29YBORPGecaEF+HYLtQ/ER9rvlGtJd/ZoZaM9yUVZ8NbXwhgZY7XWCsZ6bcRBAdn
 3BNhl7CjkJzDkbGK72m38OzRPLA9VZ9UUsWKC50XKGQM2AUFnR+tiSUouQW3HRpPRM+K
 DaI4lWElYAB/OM/IkJB1VjAsBkhvXMLyK4E2ffU4zsNWhc3wF9hwmGRDahtUnwwAZfQy
 QACUYRFa0nXrAocoyeVpzWwznGw19E1YnK6f4uOk4Etr/fNmBbG3t1yRuvGRsbwS9IwW
 /szA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IA78CJUsz8GOnHJBNt5ObPfgEfWAR2skrXR8uIrX0HQ=;
 b=3Pcjh66fgCUK/Uw8IvLXOG1UsZK/VT7ZbE1LNK48KhyxREWqTOByIDeQ1zdnlobOBK
 apXAT8TQQcfaBBBzU1ZZcf/yPLXRDxiM01L/IpP7D9ZnOEIy2ViRa7VkO/+GLwbbAmEz
 WotewcIZCdnRgaHBYblO8yqXHob7D9ir8QmDi7rAdowbIqMLXb/5zvhjS2QN0sMXXw15
 ymzO7Zpv/f23gPIb6pd+2Vl9I9BZ7B+j8pm6LvrzxBwM9bFnOXinVMV81Cf/JvkgH9VD
 RkHaip4EHO0NTI/24pdmCsPxU8tFNnyRLupFsRJbB8JinbuM5FVK7Au0kZtFs0RYFJT2
 GOFA==
X-Gm-Message-State: ACrzQf3d6G2H9kucVX5CvNtNHi3Lwmq2WSKX170Dq1c+b7aG5PsVz00u
 0JFgAemv4fZjexT2gaB+9PpZTZ2Rw5uOIA==
X-Google-Smtp-Source: AMsMyM6ooCvg+13aovXYsuDwDkq2lJCsMs/kIa46o1ARLUxm0gAa20z3iaogTLGEQyI6NqlaUWfwpA==
X-Received: by 2002:a05:6214:27c8:b0:4bb:acd8:36bd with SMTP id
 ge8-20020a05621427c800b004bbacd836bdmr17821796qvb.96.1667336950606; 
 Tue, 01 Nov 2022 14:09:10 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net.
 [192.222.136.102]) by smtp.gmail.com with ESMTPSA id
 h22-20020ac85156000000b003a533886612sm1887823qtn.3.2022.11.01.14.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 14:09:10 -0700 (PDT)
Message-ID: <caf4d6b82843788db97555a58bc9e33915e5b50a.camel@ndufresne.ca>
Subject: Re: Try to address the DMA-buf coherency problem
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Daniel Stone <daniel@fooishbar.org>
Date: Tue, 01 Nov 2022 17:09:08 -0400
In-Reply-To: <11a6f97c-e45f-f24b-8a73-48d5a388a2cc@gmail.com>
References: <20221020121316.3946-1-christian.koenig@amd.com>
 <3d7353f3fa5905ce18e5b2d92f758f098189bc5a.camel@pengutronix.de>
 <7f5eff36-6886-bb06-061a-dd4263b61605@gmail.com>
 <f5de84cfe81fee828bbe0d47d379028d28ef6ca6.camel@pengutronix.de>
 <e02cedc2-6741-8813-a7a5-f8769e301745@gmail.com>
 <a53e5df51ec0f2f9d4c2d377c0cc5ba85f2e58ff.camel@ndufresne.ca>
 <9d716641-55c6-1590-26c2-1c3b14a28226@gmail.com>
 <CAPj87rMPkmimR_RJHhxYZokH__TVpPArk0h6drOUSx7Z9+oAHA@mail.gmail.com>
 <11a6f97c-e45f-f24b-8a73-48d5a388a2cc@gmail.com>
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
Cc: ppaalanen@gmail.com, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le mardi 01 novembre 2022 =C3=A0 18:40 +0100, Christian K=C3=B6nig a =C3=A9=
crit=C2=A0:
> Am 28.10.22 um 20:47 schrieb Daniel Stone:
> > Hi Christian,
> >=20
> > On Fri, 28 Oct 2022 at 18:50, Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> > > Am 28.10.22 um 17:46 schrieb Nicolas Dufresne:
> > > > Though, its not generically possible to reverse these roles. If you=
 want to do
> > > > so, you endup having to do like Android (gralloc) and ChromeOS (min=
igbm),
> > > > because you will have to allocate DRM buffers that knows about impo=
rter specific
> > > > requirements. See link [1] for what it looks like for RK3399, with =
Motion Vector
> > > > size calculation copied from the kernel driver into a userspace lib=
 (arguably
> > > > that was available from V4L2 sizeimage, but this is technically dif=
ficult to
> > > > communicate within the software layers). If you could let the decod=
er export
> > > > (with proper cache management) the non-generic code would not be ne=
eded.
> > > Yeah, but I can also reverse the argument:
> > >=20
> > > Getting the parameters for V4L right so that we can share the image i=
s
> > > tricky, but getting the parameters so that the stuff is actually
> > > directly displayable by GPUs is even trickier.
> > >=20
> > > Essentially you need to look at both sides and interference to get to=
 a
> > > common ground, e.g. alignment, pitch, width/height, padding, etc.....
> > >=20
> > > Deciding from which side to allocate from is just one step in this
> > > process. For example most dGPUs can't display directly from system
> > > memory altogether, but it is possible to allocate the DMA-buf through
> > > the GPU driver and then write into device memory with P2P PCI transfe=
rs.
> > >=20
> > > So as far as I can see switching importer and exporter roles and even
> > > having performant extra fallbacks should be a standard feature of use=
rspace.
> > >=20
> > > > Another case where reversing the role is difficult is for case wher=
e you need to
> > > > multiplex the streams (let's use a camera to illustrate) and share =
that with
> > > > multiple processes. In these uses case, the DRM importers are volat=
ile, which
> > > > one do you abuse to do allocation from ? In multimedia server like =
PipeWire, you
> > > > are not really aware if the camera will be used by DRM or not, and =
if something
> > > > "special" is needed in term of role inversion. It is relatively eas=
y to deal
> > > > with matching modifiers, but using downstream (display/gpu) as an e=
xporter is
> > > > always difficult (and require some level of abuse and guessing).
> > > Oh, very good point! Yeah we do have use cases for this where an inpu=
t
> > > buffer is both displayed as well as encoded.
> > This is the main issue, yeah.
> >=20
> > For a standard media player, they would try to allocate through V4L2
> > and decode through that into locally-allocated buffers. All they know
> > is that there's a Wayland server at the other end of a socket
> > somewhere which will want to import the FD. The server does give you
> > some hints along the way: it will tell you that importing into a
> > particular GPU target device is necessary as the ultimate fallback,
> > and importing into a particular KMS device is preferable as the
> > optimal path to hit an overlay.
> >=20
> > So let's say that the V4L2 client does what you're proposing: it
> > allocates a buffer chain, schedules a decode into that buffer, and
> > passes it along to the server to import. The server fails to import
> > the buffer into the GPU, and tells the client this. The client then
> > ... well, it doesn't know that it needs to allocate within the GPU
> > instead, but it knows that doing so might be one thing which would
> > make the request succeed.
> >=20
> > But the client is just a video player. It doesn't understand how to
> > allocate BOs for Panfrost or AMD or etnaviv. So without a universal
> > allocator (again ...), 'just allocate on the GPU' isn't a useful
> > response to the client.
>=20
> Well exactly that's the point I'm raising: The client *must* understand=
=20
> that!
>=20
> See we need to be able to handle all restrictions here, coherency of the=
=20
> data is just one of them.
>=20
> For example the much more important question is the location of the data=
=20
> and for this allocating from the V4L2 device is in most cases just not=
=20
> going to fly.

It feels like this is a generic statement and there is no reason it could n=
ot be
the other way around. I have colleague who integrated PCIe CODEC (Blaize Xp=
lorer
X1600P PCIe Accelerator) hosting their own RAM. There was large amount of w=
ays
to use it. Of course, in current state of DMABuf, you have to be an exporte=
r to
do anything fancy, but it did not have to be like this, its a design choice=
. I'm
not sure in the end what was the final method used, the driver isn't yet
upstream, so maybe that is not even final. What I know is that there is var=
ious
condition you may use the CODEC for which the optimal location will vary. A=
s an
example, using the post processor or not, see my next comment for more deta=
ils.

>=20
> The more common case is that you need to allocate from the GPU and then=
=20
> import that into the V4L2 device. The background is that all dGPUs I=20
> know of need the data inside local memory (VRAM) to be able to scan out=
=20
> from it.

The reality is that what is common to you, might not be to others. In my wo=
rk,
most ARM SoC have display that just handle direct scannout from cameras and
codecs. The only case the commonly fails is whenever we try to display UVC
created dmabuf, which have dirty CPU write cache and this is the type of th=
ing
we'd like to see solved. I think this series was addressing it in principle=
, but
failing the import and the raised point is that this wasn't the optimal way=
.

There is a community project called LibreELEC, if you aren't aware, they ru=
n
Khodi with direct scanout of video stream on a wide variety of SoC and they=
 use
the CODEC as exporter all the time. They simply don't have cases were the
opposite is needed (or any kind of remote RAM to deal with). In fact, FFMPE=
G
does not really offer you any API to reverse the allocation.

>=20
> > I fully understand your point about APIs like Vulkan not sensibly
> > allowing bracketing, and that's fine. On the other hand, a lot of
> > extant usecases (camera/codec -> GPU/display, GPU -> codec, etc) on
> > Arm just cannot fulfill complete coherency. On a lot of these
> > platforms, despite what you might think about the CPU/GPU
> > capabilities, the bottleneck is _always_ memory bandwidth, so
> > mandating extra copies is an absolute non-starter, and would instantly
> > cripple billions of devices. Lucas has been pretty gentle, but to be
> > more clear, this is not an option and won't be for at least the next
> > decade.
>=20
> Well x86 pretty much has the same restrictions.
>=20
> For example the scanout buffer is usually always in local memory because=
=20
> you often scan out at up to 120Hz while your recording is only 30fps and=
=20
> most of the time lower resolution.
>=20
> Pumping all that data 120 time a second over the PCIe bus would just not=
=20
> be doable in a lot of use cases.

This is good point for this case. Though, the effect of using remote RAM in
CODEC can be very dramatic. In some case, the buffer you are going to displ=
ay
are what we call the reference frames. That means that while you are displa=
ying
these, the CODEC needs to read from these in order to construct the followi=
ng
frames. Most of the time, reads are massively slower with remote RAM, and o=
ver-
uploading, like you describe here is going to be the most optimal path.

Note that in some other cases, the buffers are called secondary buffers, wh=
ich
is the outcome of a post processor embedded into the CODEC. In that case, r=
emote
RAM may be fine, it really depends on the write speed (though usually reall=
y
good compared to reads). So yes, in a case of high refresh rate, a CODEC wi=
th
post processor may do a better job (if you have a single display path for t=
hat
buffer).=C2=A0

p.s. Note that the reason we support reference frame display even if second=
ary
buffer is possible is often because we are limited on memory bandwidth. For
let's say 4K60, a secondary render will require an extra 18gb writes (on th=
e
best platform, might require equivalent reads on other platforms, like Medi=
atek,
Samsung Exynos and some other).
>=20
> > So we obviously need a third way at this point, because 'all devices
> > must always be coherent' vs. 'cache must be an unknown' can't work.
> > How about this as a suggestion: we have some unused flags in the PRIME
> > ioctls. Can we add a flag for 'import must be coherent'?
>=20
> That's pretty much exactly what my patch set does. It just keeps=20
> userspace out of the way and says that creating the initial connection=
=20
> between the devices fails if they can't talk directly with each other.
>=20
> Maybe we should move that into userspace so that the involved components=
=20
> know of hand that a certain approach won't work?

Anything that an be predict without trial and error is great idea for sure.
Though, we have to be realist, there is no guarantied way to be sure other =
then
trying. So I would not be too worried. Imho, I lacked the time to try it ou=
t,
but the current implementation should in theory make software like GStreame=
r
fallback to memcpy for simple cases like UVC Cameras. Very simple gstreamer
pipeline most folks can run (and that usually has produced artifacts for ye=
ars)
is:

gst-launch-1.0 v4l2src ! queue ! kmssink


p.s. you need to turn off any drm master, may not work on multi-display set=
up,
kmssink is very limited, but it does implement memcpy fallback if dmabuf im=
port
fails (just that it does not fail).

>=20
> > That flag wouldn't be set for the existing ecosystem
> > Lucas/Nicolas/myself are talking about, where we have explicit
> > handover points and users are fully able to perform cache maintenance.
> > For newer APIs where it's not possible to properly express that
> > bracketing, they would always set that flag (unless we add an API
> > carve-out where the client promises to do whatever is required to
> > maintain that).
> >=20
> > Would that be viable?
>=20
> No, as I said. Explicit handover points are just an absolutely no-go. We=
=20
> just have way to many use cases which don't work with that idea.
>=20
> As I said we made the same mistake with the DMA-Api and even more 20=20
> years later are still running into problems because of that.
>=20
> Just try to run any dGPU under a XEN hypervisor with memory=20
> fragmentation for a very good example why this is such a bad idea.
>=20
> Regards,
> Christian.
>=20
> >=20
> > Cheers,
> > Daniel
>=20

