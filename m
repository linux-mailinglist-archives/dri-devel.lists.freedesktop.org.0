Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 445B718636C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 03:49:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D0276E32A;
	Mon, 16 Mar 2020 02:49:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC886E31E
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 02:49:24 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id z8so9579560qto.12
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 19:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:date:message-id:in-reply-to:references:user-agent
 :subject:mime-version;
 bh=DRhi5Rt66e5uV9au2Nrt87f/BHCznlXhuMrwG0SNHic=;
 b=v+9iut/w5jai+mtM8RxaflzHXX3DFzXH7Z7Sh6io+ZxPUd0/NuHganfhjoVp2dIx9Y
 cLFLToOEN4tFGz4RGwBsph10EMj7Huqv+9RirUOXZUIK4JIRXXR9Mspmmj7hu6yJTeGW
 GAE/aIKI/Lj7crsNuFrBpaSTROhzR1w+nSDiuqepwuFudEySp+/QzSlAliJUrB2XqJet
 rQvUweQT2raQzBq66t2w2fuh5JMBtHATkkKMRpzt+e1Waal7Uqnbyw9dku/MeWHvLLpj
 gxO582lJWgplMgXl4PMAc5B5QdWpuyhh3gMYhPaUAfcWWNWIfyu7ue4xiEC7Bt1mSYth
 4LLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
 :references:user-agent:subject:mime-version;
 bh=DRhi5Rt66e5uV9au2Nrt87f/BHCznlXhuMrwG0SNHic=;
 b=TLeLo9E/Ig9HL0+84DyqNex3nHijTyFwRR61NjnW/iGhozSRaLR7H/xR0MoT43Z1dr
 gqVgUmVw4f886nqXTj2TQ04R1xTB+qDUX2BrkivQB6ro8oCTolqxpNF04XFbmoOosluy
 UcOCzGLC0LwiRViNi/0oJBfPCAsWBn2fO9x5wvNr0di4Z3ZDOAQb6VH1rC/Feo0F5SI1
 d8zqE0dpJnRqNLvCuP9kUIMrMnkKpaWQdCPOBWpGMHrVTVxR/mvwH0DpsJ/mHkIp2do0
 nMtAs2odlDiukCTu6/df7wU42EGn6PByDA+sPHJo40ZyUXkxNUr5EV8yVXMqtjHzLYUH
 r85w==
X-Gm-Message-State: ANhLgQ3kGuEfRNORLOV+DqKJWRQ4JZ3aCMRWgijJa0X92Yirjnvw6e8o
 Vf7SAlPLaMJW/u8ZLEmj4KOpjw==
X-Google-Smtp-Source: ADFU+vv6aRNivstKjn8UT5J85IhLvextZY0kYTZvXmdS4iBNHZBm+yhHmZScU6IS+XZwIGMKmSmNcQ==
X-Received: by 2002:ac8:440c:: with SMTP id j12mr22778378qtn.142.1584326963791; 
 Sun, 15 Mar 2020 19:49:23 -0700 (PDT)
Received: from [100.96.181.133] ([209.107.189.137])
 by smtp.gmail.com with ESMTPSA id k13sm8488516qtm.11.2020.03.15.19.49.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 15 Mar 2020 19:49:22 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Sun, 15 Mar 2020 21:49:18 -0500
Message-ID: <170e13edbb0.27ad.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
In-Reply-To: <CAAxE2A4q9sZDz8vSLAvT0HH4BGukf8Ug68eqSV1ojqrm_5uFFg@mail.gmail.com>
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAAxE2A4q9sZDz8vSLAvT0HH4BGukf8Ug68eqSV1ojqrm_5uFFg@mail.gmail.com>
User-Agent: AquaMail/1.23.0-1556 (build: 102300002)
Subject: Re: [Mesa-dev] Plumbing explicit synchronization through the Linux
 ecosystem
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, xorg-devel <xorg-devel@lists.x.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "wayland-devel @ lists . freedesktop . org"
 <wayland-devel@lists.freedesktop.org>,
 Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>,
 ML mesa-dev <mesa-dev@lists.freedesktop.org>, linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0770957121=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0770957121==
Content-Type: multipart/alternative; boundary="----------170e13ede5f641527adc80923a"

This is a multi-part message in MIME format.
------------170e13ede5f641527adc80923a
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Could you elaborate. If there's something missing from my mental model of 
how implicit sync works, I'd like to have it corrected. People continue 
claiming that AMD is somehow special but I have yet to grasp what makes it 
so.  (Not that anyone has bothered to try all that hard to explain it.)


--Jason

On March 13, 2020 21:03:21 Marek Olšák <maraeo@gmail.com> wrote:
> There is no synchronization between processes (e.g. 3D app and compositor) 
> within X on AMD hw. It works because of some hacks in Mesa.
>
> Marek
>
> On Wed, Mar 11, 2020 at 1:31 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
> All,
>
> Sorry for casting such a broad net with this one. I'm sure most people
> who reply will get at least one mailing list rejection.  However, this
> is an issue that affects a LOT of components and that's why it's
> thorny to begin with.  Please pardon the length of this e-mail as
> well; I promise there's a concrete point/proposal at the end.
>
>
> Explicit synchronization is the future of graphics and media.  At
> least, that seems to be the consensus among all the graphics people
> I've talked to.  I had a chat with one of the lead Android graphics
> engineers recently who told me that doing explicit sync from the start
> was one of the best engineering decisions Android ever made.  It's
> also the direction being taken by more modern APIs such as Vulkan.
>
>
> ## What are implicit and explicit synchronization?
>
> For those that aren't familiar with this space, GPUs, media encoders,
> etc. are massively parallel and synchronization of some form is
> required to ensure that everything happens in the right order and
> avoid data races.  Implicit synchronization is when bits of work (3D,
> compute, video encode, etc.) are implicitly based on the absolute
> CPU-time order in which API calls occur.  Explicit synchronization is
> when the client (whatever that means in any given context) provides
> the dependency graph explicitly via some sort of synchronization
> primitives.  If you're still confused, consider the following
> examples:
>
> With OpenGL and EGL, almost everything is implicit sync.  Say you have
> two OpenGL contexts sharing an image where one writes to it and the
> other textures from it.  The way the OpenGL spec works, the client has
> to make the API calls to render to the image before (in CPU time) it
> makes the API calls which texture from the image.  As long as it does
> this (and maybe inserts a glFlush?), the driver will ensure that the
> rendering completes before the texturing happens and you get correct
> contents.
>
> Implicit synchronization can also happen across processes.  Wayland,
> for instance, is currently built on implicit sync where the client
> does their rendering and then does a hand-off (via wl_surface::commit)
> to tell the compositor it's done at which point the compositor can now
> texture from the surface.  The hand-off ensures that the client's
> OpenGL API calls happen before the server's OpenGL API calls.
>
> A good example of explicit synchronization is the Vulkan API.  There,
> a client (or multiple clients) can simultaneously build command
> buffers in different threads where one of those command buffers
> renders to an image and the other textures from it and then submit
> both of them at the same time with instructions to the driver for
> which order to execute them in.  The execution order is described via
> the VkSemaphore primitive.  With the new VK_KHR_timeline_semaphore
> extension, you can even submit the work which does the texturing
> BEFORE the work which does the rendering and the driver will sort it
> out.
>
> The #1 problem with implicit synchronization (which explicit solves)
> is that it leads to a lot of over-synchronization both in client space
> and in driver/device space.  The client has to synchronize a lot more
> because it has to ensure that the API calls happen in a particular
> order.  The driver/device have to synchronize a lot more because they
> never know what is going to end up being a synchronization point as an
> API call on another thread/process may occur at any time.  As we move
> to more and more multi-threaded programming this synchronization (on
> the client-side especially) becomes more and more painful.
>
>
> ## Current status in Linux
>
> Implicit synchronization in Linux works via a the kernel's internal
> dma_buf and dma_fence data structures.  A dma_fence is a tiny object
> which represents the "done" status for some bit of work.  Typically,
> dma_fences are created as a by-product of someone submitting some bit
> of work (say, 3D rendering) to the kernel.  The dma_buf object has a
> set of dma_fences on it representing shared (read) and exclusive
> (write) access to the object.  When work is submitted which, for
> instance renders to the dma_buf, it's queued waiting on all the fences
> on the dma_buf and and a dma_fence is created representing the end of
> said rendering work and it's installed as the dma_buf's exclusive
> fence.  This way, the kernel can manage all its internal queues (3D
> rendering, display, video encode, etc.) and know which things to
> submit in what order.
>
> For the last few years, we've had sync_file in the kernel and it's
> plumbed into some drivers.  A sync_file is just a wrapper around a
> single dma_fence.  A sync_file is typically created as a by-product of
> submitting work (3D, compute, etc.) to the kernel and is signaled when
> that work completes.  When a sync_file is created, it is guaranteed by
> the kernel that it will become signaled in finite time and, once it's
> signaled, it remains signaled for the rest of time.  A sync_file is
> represented in UAPIs as a file descriptor and can be used with normal
> file APIs such as dup().  It can be passed into another UAPI which
> does some bit of queue'd work and the submitted work will wait for the
> sync_file to be triggered before executing.  A sync_file also supports
> poll() if  you want to wait on it manually.
>
> Unfortunately, sync_file is not broadly used and not all kernel GPU
> drivers support it.  Here's a very quick overview of my understanding
> of the status of various components (I don't know the status of
> anything in the media world):
>
> - Vulkan: Explicit synchronization all the way but we have to go
> implicit as soon as we interact with a window-system.  Vulkan has APIs
> to import/export sync_files to/from it's VkSemaphore and VkFence
> synchronization primitives.
> - OpenGL: Implicit all the way.  There are some EGL extensions to
> enable some forms of explicit sync via sync_file but OpenGL itself is
> still implicit.
> - Wayland: Currently depends on implicit sync in the kernel (accessed
> via EGL/OpenGL).  There is an unstable extension to allow passing
> sync_files around but it's questionable how useful it is right now
> (more on that later).
> - X11: With present, it has these "explicit" fence objects but
> they're always a shmfence which lets the X server and client do a
> userspace CPU-side hand-off without going over the socket (and
> round-tripping through the kernel).  However, the only thing that
> fence does is order the OpenGL API calls in the client and server and
> the real synchronization is still implicit.
> - linux/i915/gem: Fully supports using sync_file or syncobj for explicit sync.
> - linux/amdgpu: Supports sync_file and syncobj but it still
> implicitly syncs sometimes due to it's internal memory residency
> handling which can lead to over-synchronization.
> - KMS: Implicit sync all the way.  There are no KMS APIs which take
> explicit sync primitives.
> - v4l: ???
> - gstreamer: ???
> - Media APIs such as vaapi etc.:  ???
>
>
> ## Chicken and egg problems
>
> Ok, this is where it starts getting depressing.  I made the claim
> above that Wayland has an explicit synchronization protocol that's of
> questionable usefulness.  I would claim that basically any bit of
> plumbing we do through window systems is currently of questionable
> usefulness.  Why?
>
> From my perspective, as a Vulkan driver developer, I have to deal with
> the fact that Vulkan is an explicit sync API but Wayland and X11
> aren't.  Unfortunately, the Wayland extension solves zero problems for
> me because I can't really use it unless it's implemented in all of the
> compositors.  Until every Wayland compositor I care about my users
> being able to use (which is basically all of them) supports the
> extension, I have to continue carry around my pile of hacks to keep
> implicit sync and Vulkan working nicely together.
>
> From the perspective of a Wayland compositor (I used to play in this
> space), they'd love to implement the new explicit sync extension but
> can't.  Sure, they could wire up the extension, but the moment they go
> to flip a client buffer to the screen directly, they discover that KMS
> doesn't support any explicit sync APIs.  So, yes, they can technically
> implement the extension assuming the EGL stack they're running on has
> the sync_file extensions but any client buffers which come in using
> the explicit sync Wayland extension have to be composited and can't be
> scanned out directly.  As a 3D driver developer, I absolutely don't
> want compositors doing that because my users will complain about
> performance issues due to the extra blit.
>
> Ok, so let's say we get KMS wired up with implicit sync.  That solves
> all our problems, right?  It does, right up until someone decides that
> they wan to screen capture their Wayland session via some hardware
> media encoder that doesn't support explicit sync.  Now we have to
> plumb it all the way through the media stack, gstreamer, etc.  Great,
> so let's do that!  Oh, but gstreamer won't want to plumb it through
> until they're guaranteed that they can use explicit sync when
> displaying on X11 or Wayland.  Are you seeing the problem?
>
> To make matters worse, since most things are doing implicit
> synchronization today, it's really easy to get your explicit
> synchronization wrong and never notice.  If you forget to pass a
> sync_file into one place (say you never notice KMS doesn't support
> them), it will probably work anyway thanks to all the implicit sync
> that's going on elsewhere.
>
> So, clearly, we all need to go write piles of code that we can't
> actually properly test until everyone else has written their piece and
> then we use explicit sync if and only if all components support it.
> Really?  We're going to do multiple years of development and then just
> hope it works when we finally flip the switch?  That doesn't sound
> like a good plan to me.
>
>
> ## A proposal: Implicit and explicit sync together
>
> How to solve all these chicken-and-egg problems is something I've been
> giving quite a bit of thought (and talking with many others about) in
> the last couple of years.  One motivation for this is that we have to
> deal with a mismatch in Vulkan.  Another motivation is that I'm
> becoming increasingly unhappy with the way that synchronization,
> memory residency, and command submission are inherently intertwined in
> i915 and would like to break things apart.  Towards that end, I have
> an actual proposal.
>
> A couple weeks ago, I sent a series of patches to the dri-devel
> mailing list which adds a pair of new ioctls to dma-buf which allow
> userspace to manually import or export a sync_file from a dma-buf.
> The idea is that something like a Wayland compositor can switch to
> 100% explicit sync internally once the ioctl is available.  If it gets
> buffers in from a client that doesn't use the explicit sync extension,
> it can pull a sync_file from the dma-buf and use that exactly as it
> would a sync_file passed via the explicit sync extension.  When it
> goes to scan out a user buffer and discovers that KMS doesn't accept
> sync_files (or if it tries to use that pesky media encoder no one has
> converted), it can take it's sync_file for display and stuff it into
> the dma-buf before handing it to KMS.
>
> Along with the kernel patches, I've also implemented support for this
> in the Vulkan WSI code used by ANV and RADV.  With those patches, the
> only requirement on the Vulkan drivers is that you be able to export
> any VkSemaphore as a sync_file and temporarily import a sync_file into
> any VkFence or VkSemaphore.  As long as that works, the core Vulkan
> driver only ever sees explicit synchronization via sync_file.  The WSI
> code uses these new ioctls to translate the implicit sync of X11 and
> Wayland to the explicit sync the Vulkan driver wants.
>
> I'm hoping (and here's where I want a sanity check) that a simple API
> like this will allow us to finally start moving the Linux ecosystem
> over to explicit synchronization one piece at a time in a way that's
> actually correct.  (No Wayland explicit sync with compositors hoping
> KMS magically works even though it doesn't have a sync_file API.)
> Once some pieces in the ecosystem start moving, there will be
> motivation to start moving others and maybe we can actually build the
> momentum to get most everything converted.
>
> For reference, you can find the kernel RFC patches and mesa MR here:
>
> https://lists.freedesktop.org/archives/dri-devel/2020-March/258833.html
>
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4037
>
> At this point, I welcome your thoughts, comments, objections, and
> maybe even help/review. :-)
>
> --Jason Ekstrand
> _______________________________________________
> mesa-dev mailing list
> mesa-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/mesa-dev


------------170e13ede5f641527adc80923a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body>
<div dir=3D"auto">
<div dir=3D"auto">Could you elaborate. If there's something missing from my=
 mental model of how implicit sync works, I'd like to have it corrected. Pe=
ople continue claiming that AMD is somehow special but I have yet to grasp =
what makes it so.&nbsp; (Not that anyone has bothered to try all that hard =
to explain it.)</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">--Jason</div><div dir=3D'auto'><br></div>
<div id=3D"aqm-original" style=3D"color: black;">
<!-- body start -->
<div class=3D"aqm-original-body">
<div style=3D"color: black;">
<p style=3D"color: black; font-size: 10pt; font-family: sans-serif; margin:=
 8pt 0;">On March 13, 2020 21:03:21 Marek Ol=C5=A1=C3=A1k &lt;maraeo@gmail.=
com&gt; wrote:</p>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"ltr"><div>There is no synchronization between processes (e.g. 3=
D app and compositor) within X on AMD hw. It works because of some hacks in=
 Mesa.</div><div><br></div><div>Marek<br></div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 11, 2020 at 1:31=
 PM Jason Ekstrand &lt;<a href=3D"mailto:jason@jlekstrand.net">jason@jlekst=
rand.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">All,<br>
<br>
Sorry for casting such a broad net with this one. I'm sure most people<br>
who reply will get at least one mailing list rejection.&nbsp; However, this=
<br>
is an issue that affects a LOT of components and that's why it's<br>
thorny to begin with.&nbsp; Please pardon the length of this e-mail as<br>
well; I promise there's a concrete point/proposal at the end.<br>
<br>
<br>
Explicit synchronization is the future of graphics and media.&nbsp; At<br>
least, that seems to be the consensus among all the graphics people<br>
I've talked to.&nbsp; I had a chat with one of the lead Android graphics<br=
>
engineers recently who told me that doing explicit sync from the start<br>
was one of the best engineering decisions Android ever made.&nbsp; It's<br>
also the direction being taken by more modern APIs such as Vulkan.<br>
<br>
<br>
## What are implicit and explicit synchronization?<br>
<br>
For those that aren't familiar with this space, GPUs, media encoders,<br>
etc. are massively parallel and synchronization of some form is<br>
required to ensure that everything happens in the right order and<br>
avoid data races.&nbsp; Implicit synchronization is when bits of work (3D,<=
br>
compute, video encode, etc.) are implicitly based on the absolute<br>
CPU-time order in which API calls occur.&nbsp; Explicit synchronization is<=
br>
when the client (whatever that means in any given context) provides<br>
the dependency graph explicitly via some sort of synchronization<br>
primitives.&nbsp; If you're still confused, consider the following<br>
examples:<br>
<br>
With OpenGL and EGL, almost everything is implicit sync.&nbsp; Say you have=
<br>
two OpenGL contexts sharing an image where one writes to it and the<br>
other textures from it.&nbsp; The way the OpenGL spec works, the client has=
<br>
to make the API calls to render to the image before (in CPU time) it<br>
makes the API calls which texture from the image.&nbsp; As long as it does<=
br>
this (and maybe inserts a glFlush?), the driver will ensure that the<br>
rendering completes before the texturing happens and you get correct<br>
contents.<br>
<br>
Implicit synchronization can also happen across processes.&nbsp; Wayland,<b=
r>
for instance, is currently built on implicit sync where the client<br>
does their rendering and then does a hand-off (via wl_surface::commit)<br>
to tell the compositor it's done at which point the compositor can now<br>
texture from the surface.&nbsp; The hand-off ensures that the client's<br>
OpenGL API calls happen before the server's OpenGL API calls.<br>
<br>
A good example of explicit synchronization is the Vulkan API.&nbsp; There,<=
br>
a client (or multiple clients) can simultaneously build command<br>
buffers in different threads where one of those command buffers<br>
renders to an image and the other textures from it and then submit<br>
both of them at the same time with instructions to the driver for<br>
which order to execute them in.&nbsp; The execution order is described via<=
br>
the VkSemaphore primitive.&nbsp; With the new VK_KHR_timeline_semaphore<br>
extension, you can even submit the work which does the texturing<br>
BEFORE the work which does the rendering and the driver will sort it<br>
out.<br>
<br>
The #1 problem with implicit synchronization (which explicit solves)<br>
is that it leads to a lot of over-synchronization both in client space<br>
and in driver/device space.&nbsp; The client has to synchronize a lot more<=
br>
because it has to ensure that the API calls happen in a particular<br>
order.&nbsp; The driver/device have to synchronize a lot more because they<=
br>
never know what is going to end up being a synchronization point as an<br>
API call on another thread/process may occur at any time.&nbsp; As we move<=
br>
to more and more multi-threaded programming this synchronization (on<br>
the client-side especially) becomes more and more painful.<br>
<br>
<br>
## Current status in Linux<br>
<br>
Implicit synchronization in Linux works via a the kernel's internal<br>
dma_buf and dma_fence data structures.&nbsp; A dma_fence is a tiny object<b=
r>
which represents the "done" status for some bit of work.&nbsp; Typically,<b=
r>
dma_fences are created as a by-product of someone submitting some bit<br>
of work (say, 3D rendering) to the kernel.&nbsp; The dma_buf object has a<b=
r>
set of dma_fences on it representing shared (read) and exclusive<br>
(write) access to the object.&nbsp; When work is submitted which, for<br>
instance renders to the dma_buf, it's queued waiting on all the fences<br>
on the dma_buf and and a dma_fence is created representing the end of<br>
said rendering work and it's installed as the dma_buf's exclusive<br>
fence.&nbsp; This way, the kernel can manage all its internal queues (3D<br=
>
rendering, display, video encode, etc.) and know which things to<br>
submit in what order.<br>
<br>
For the last few years, we've had sync_file in the kernel and it's<br>
plumbed into some drivers.&nbsp; A sync_file is just a wrapper around a<br>
single dma_fence.&nbsp; A sync_file is typically created as a by-product of=
<br>
submitting work (3D, compute, etc.) to the kernel and is signaled when<br>
that work completes.&nbsp; When a sync_file is created, it is guaranteed by=
<br>
the kernel that it will become signaled in finite time and, once it's<br>
signaled, it remains signaled for the rest of time.&nbsp; A sync_file is<br=
>
represented in UAPIs as a file descriptor and can be used with normal<br>
file APIs such as dup().&nbsp; It can be passed into another UAPI which<br>
does some bit of queue'd work and the submitted work will wait for the<br>
sync_file to be triggered before executing.&nbsp; A sync_file also supports=
<br>
poll() if&nbsp; you want to wait on it manually.<br>
<br>
Unfortunately, sync_file is not broadly used and not all kernel GPU<br>
drivers support it.&nbsp; Here's a very quick overview of my understanding<=
br>
of the status of various components (I don't know the status of<br>
anything in the media world):<br>
<br>
&nbsp;- Vulkan: Explicit synchronization all the way but we have to go<br>
implicit as soon as we interact with a window-system.&nbsp; Vulkan has APIs=
<br>
to import/export sync_files to/from it's VkSemaphore and VkFence<br>
synchronization primitives.<br>
&nbsp;- OpenGL: Implicit all the way.&nbsp; There are some EGL extensions t=
o<br>
enable some forms of explicit sync via sync_file but OpenGL itself is<br>
still implicit.<br>
&nbsp;- Wayland: Currently depends on implicit sync in the kernel (accessed=
<br>
via EGL/OpenGL).&nbsp; There is an unstable extension to allow passing<br>
sync_files around but it's questionable how useful it is right now<br>
(more on that later).<br>
&nbsp;- X11: With present, it has these "explicit" fence objects but<br>
they're always a shmfence which lets the X server and client do a<br>
userspace CPU-side hand-off without going over the socket (and<br>
round-tripping through the kernel).&nbsp; However, the only thing that<br>
fence does is order the OpenGL API calls in the client and server and<br>
the real synchronization is still implicit.<br>
&nbsp;- linux/i915/gem: Fully supports using sync_file or syncobj for expli=
cit sync.<br>
&nbsp;- linux/amdgpu: Supports sync_file and syncobj but it still<br>
implicitly syncs sometimes due to it's internal memory residency<br>
handling which can lead to over-synchronization.<br>
&nbsp;- KMS: Implicit sync all the way.&nbsp; There are no KMS APIs which t=
ake<br>
explicit sync primitives.<br>
&nbsp;- v4l: ???<br>
&nbsp;- gstreamer: ???<br>
&nbsp;- Media APIs such as vaapi etc.:&nbsp; ???<br>
<br>
<br>
## Chicken and egg problems<br>
<br>
Ok, this is where it starts getting depressing.&nbsp; I made the claim<br>
above that Wayland has an explicit synchronization protocol that's of<br>
questionable usefulness.&nbsp; I would claim that basically any bit of<br>
plumbing we do through window systems is currently of questionable<br>
usefulness.&nbsp; Why?<br>
<br>
From my perspective, as a Vulkan driver developer, I have to deal with<br>
the fact that Vulkan is an explicit sync API but Wayland and X11<br>
aren't.&nbsp; Unfortunately, the Wayland extension solves zero problems for=
<br>
me because I can't really use it unless it's implemented in all of the<br>
compositors.&nbsp; Until every Wayland compositor I care about my users<br>
being able to use (which is basically all of them) supports the<br>
extension, I have to continue carry around my pile of hacks to keep<br>
implicit sync and Vulkan working nicely together.<br>
<br>
From the perspective of a Wayland compositor (I used to play in this<br>
space), they'd love to implement the new explicit sync extension but<br>
can't.&nbsp; Sure, they could wire up the extension, but the moment they go=
<br>
to flip a client buffer to the screen directly, they discover that KMS<br>
doesn't support any explicit sync APIs.&nbsp; So, yes, they can technically=
<br>
implement the extension assuming the EGL stack they're running on has<br>
the sync_file extensions but any client buffers which come in using<br>
the explicit sync Wayland extension have to be composited and can't be<br>
scanned out directly.&nbsp; As a 3D driver developer, I absolutely don't<br=
>
want compositors doing that because my users will complain about<br>
performance issues due to the extra blit.<br>
<br>
Ok, so let's say we get KMS wired up with implicit sync.&nbsp; That solves<=
br>
all our problems, right?&nbsp; It does, right up until someone decides that=
<br>
they wan to screen capture their Wayland session via some hardware<br>
media encoder that doesn't support explicit sync.&nbsp; Now we have to<br>
plumb it all the way through the media stack, gstreamer, etc.&nbsp; Great,<=
br>
so let's do that!&nbsp; Oh, but gstreamer won't want to plumb it through<br=
>
until they're guaranteed that they can use explicit sync when<br>
displaying on X11 or Wayland.&nbsp; Are you seeing the problem?<br>
<br>
To make matters worse, since most things are doing implicit<br>
synchronization today, it's really easy to get your explicit<br>
synchronization wrong and never notice.&nbsp; If you forget to pass a<br>
sync_file into one place (say you never notice KMS doesn't support<br>
them), it will probably work anyway thanks to all the implicit sync<br>
that's going on elsewhere.<br>
<br>
So, clearly, we all need to go write piles of code that we can't<br>
actually properly test until everyone else has written their piece and<br>
then we use explicit sync if and only if all components support it.<br>
Really?&nbsp; We're going to do multiple years of development and then just=
<br>
hope it works when we finally flip the switch?&nbsp; That doesn't sound<br>
like a good plan to me.<br>
<br>
<br>
## A proposal: Implicit and explicit sync together<br>
<br>
How to solve all these chicken-and-egg problems is something I've been<br>
giving quite a bit of thought (and talking with many others about) in<br>
the last couple of years.&nbsp; One motivation for this is that we have to<=
br>
deal with a mismatch in Vulkan.&nbsp; Another motivation is that I'm<br>
becoming increasingly unhappy with the way that synchronization,<br>
memory residency, and command submission are inherently intertwined in<br>
i915 and would like to break things apart.&nbsp; Towards that end, I have<b=
r>
an actual proposal.<br>
<br>
A couple weeks ago, I sent a series of patches to the dri-devel<br>
mailing list which adds a pair of new ioctls to dma-buf which allow<br>
userspace to manually import or export a sync_file from a dma-buf.<br>
The idea is that something like a Wayland compositor can switch to<br>
100% explicit sync internally once the ioctl is available.&nbsp; If it gets=
<br>
buffers in from a client that doesn't use the explicit sync extension,<br>
it can pull a sync_file from the dma-buf and use that exactly as it<br>
would a sync_file passed via the explicit sync extension.&nbsp; When it<br>
goes to scan out a user buffer and discovers that KMS doesn't accept<br>
sync_files (or if it tries to use that pesky media encoder no one has<br>
converted), it can take it's sync_file for display and stuff it into<br>
the dma-buf before handing it to KMS.<br>
<br>
Along with the kernel patches, I've also implemented support for this<br>
in the Vulkan WSI code used by ANV and RADV.&nbsp; With those patches, the<=
br>
only requirement on the Vulkan drivers is that you be able to export<br>
any VkSemaphore as a sync_file and temporarily import a sync_file into<br>
any VkFence or VkSemaphore.&nbsp; As long as that works, the core Vulkan<br=
>
driver only ever sees explicit synchronization via sync_file.&nbsp; The WSI=
<br>
code uses these new ioctls to translate the implicit sync of X11 and<br>
Wayland to the explicit sync the Vulkan driver wants.<br>
<br>
I'm hoping (and here's where I want a sanity check) that a simple API<br>
like this will allow us to finally start moving the Linux ecosystem<br>
over to explicit synchronization one piece at a time in a way that's<br>
actually correct.&nbsp; (No Wayland explicit sync with compositors hoping<b=
r>
KMS magically works even though it doesn't have a sync_file API.)<br>
Once some pieces in the ecosystem start moving, there will be<br>
motivation to start moving others and maybe we can actually build the<br>
momentum to get most everything converted.<br>
<br>
For reference, you can find the kernel RFC patches and mesa MR here:<br>
<br>
<a href=3D"https://lists.freedesktop.org/archives/dri-devel/2020-March/2588=
33.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org=
/archives/dri-devel/2020-March/258833.html</a><br>
<br>
<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4037" =
rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/mesa/me=
sa/-/merge_requests/4037</a><br>
<br>
At this point, I welcome your thoughts, comments, objections, and<br>
maybe even help/review. :-)<br>
<br>
--Jason Ekstrand<br>
_______________________________________________<br>
mesa-dev mailing list<br>
<a href=3D"mailto:mesa-dev@lists.freedesktop.org" target=3D"_blank">mesa-de=
v@lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/mesa-dev" rel=3D"=
noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listinf=
o/mesa-dev</a><br>
</blockquote></div>
</blockquote>
</div>
</div>
<!-- body end -->

</div><div dir=3D"auto"><br></div>
</div></body>
</html>

------------170e13ede5f641527adc80923a--


--===============0770957121==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0770957121==--

