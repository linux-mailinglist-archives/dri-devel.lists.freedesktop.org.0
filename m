Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04ACA1863E5
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 04:50:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E52136E329;
	Mon, 16 Mar 2020 03:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB98D6E0D0;
 Mon, 16 Mar 2020 03:50:42 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id ay11so7367277plb.0;
 Sun, 15 Mar 2020 20:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UW/HFQjKEah1qrbpQMFto5SQSC7poXNf/OZE4uJnndo=;
 b=CjUwz/S7Q50C55biq6IHl5/zxfi+2kzZ8axxTroi1D2Q/HwdCvW47blHDS2H0Stw9z
 NHL0leL9lJkQAoIiah8HC/G//7ROfS0pZMpKiA9o4y60t8K1n3d+S00dXxaTVTNnw86A
 WXKQKAGzsqGoKrUMNeYOuUT+bmDbQ3dDveN1U6NQ7qqaUBqMfkZscLxqAmfc/WFIaLjU
 t9fNrI/bRVswSsOcATjyCvMVLOdEj6M5KEdXqopJJHGdfLxLoQqFKJDQ9v3vggsKCjRM
 QIHaJgyK89whJuwPXZvbTZGtNRT0kd8+psUYBy8kuu+T7cxnq9sZx6IdzsNXmW+3oqWC
 ByLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UW/HFQjKEah1qrbpQMFto5SQSC7poXNf/OZE4uJnndo=;
 b=TvjkMYWqnmI5x3luO94btD0inDqGlClAhnhkbLZUF60WGB1Ef6+Lo7f7BvnvFWhLmy
 0e87et0Rihy5nZt0AG3mReY63JByFKsByZbCvKnpiePi2nFGc+L1UX87X7BkJTQi9iZb
 /2lz5LFRcUcxeA9XijuiP6Avdd2LW0p/sVfbJnFcGyKzbJm5PzlkKKYuT8y4PsCr4haM
 0+zOg56RE7IWrL0yHtMAeip7DOXuADiu/dBCJWeL3G9Xl9/oHHzBK3hw2k/KeDhx5G1Q
 9LT56Lx6D1moltRdkrewAMSSu9m+MMqnidc8+UTwZq9DmJ9Tp8s2cPblTGuKzJkeLiGp
 fQmQ==
X-Gm-Message-State: ANhLgQ3LtrtCZXfrPKeipgWd4trF0oCoe4MuS3PAEHOOstWQbGAQMQ4Y
 PmY0clom5g6GuojB3lEYjGFepltI+TncM6W3AqU=
X-Google-Smtp-Source: ADFU+vtCMJ69ttHvNywYvKgXOj/mFiG8nyOnRUJ9R6JiEI81YwDiejEG6kVEtag+OVzd/6kpiavpdX9VdY9OGXaDy94=
X-Received: by 2002:a17:90a:d350:: with SMTP id
 i16mr23193152pjx.38.1584330642266; 
 Sun, 15 Mar 2020 20:50:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAAxE2A4q9sZDz8vSLAvT0HH4BGukf8Ug68eqSV1ojqrm_5uFFg@mail.gmail.com>
 <170e13edbb0.27ad.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
In-Reply-To: <170e13edbb0.27ad.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Sun, 15 Mar 2020 23:50:29 -0400
Message-ID: <CAAxE2A6hMs2Ngd4zEv+hEJnEUKmPDuXmeWUaUU-4YCTRHNzr1w@mail.gmail.com>
Subject: Re: [Mesa-dev] Plumbing explicit synchronization through the Linux
 ecosystem
To: Jason Ekstrand <jason@jlekstrand.net>
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
Content-Type: multipart/mixed; boundary="===============0500380615=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0500380615==
Content-Type: multipart/alternative; boundary="000000000000239d9d05a0f0b952"

--000000000000239d9d05a0f0b952
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The synchronization works because the Mesa driver waits for idle (drains
the GFX pipeline) at the end of command buffers and there is only 1
graphics queue, so everything is ordered.

The GFX pipeline runs asynchronously to the command buffer, meaning the
command buffer only starts draws and doesn't wait for completion. If the
Mesa driver didn't wait at the end of the command buffer, the command
buffer would finish and a different process could start execution of its
own command buffer while shaders of the previous process are still running.

If the Mesa driver submits a command buffer internally (because it's full),
it doesn't wait, so the GFX pipeline doesn't notice that a command buffer
ended and a new one started.

The waiting at the end of command buffers happens only when the flush is
external (Swap buffers, glFlush).

It's a performance problem, because the GFX queue is blocked until the GFX
pipeline is drained at the end of every frame at least.

So explicit fences for SwapBuffers would help.

Marek

On Sun., Mar. 15, 2020, 22:49 Jason Ekstrand, <jason@jlekstrand.net> wrote:

> Could you elaborate. If there's something missing from my mental model of
> how implicit sync works, I'd like to have it corrected. People continue
> claiming that AMD is somehow special but I have yet to grasp what makes i=
t
> so.  (Not that anyone has bothered to try all that hard to explain it.)
>
>
> --Jason
>
> On March 13, 2020 21:03:21 Marek Ol=C5=A1=C3=A1k <maraeo@gmail.com> wrote=
:
>
>> There is no synchronization between processes (e.g. 3D app and
>> compositor) within X on AMD hw. It works because of some hacks in Mesa.
>>
>> Marek
>>
>> On Wed, Mar 11, 2020 at 1:31 PM Jason Ekstrand <jason@jlekstrand.net>
>> wrote:
>>
>>> All,
>>>
>>> Sorry for casting such a broad net with this one. I'm sure most people
>>> who reply will get at least one mailing list rejection.  However, this
>>> is an issue that affects a LOT of components and that's why it's
>>> thorny to begin with.  Please pardon the length of this e-mail as
>>> well; I promise there's a concrete point/proposal at the end.
>>>
>>>
>>> Explicit synchronization is the future of graphics and media.  At
>>> least, that seems to be the consensus among all the graphics people
>>> I've talked to.  I had a chat with one of the lead Android graphics
>>> engineers recently who told me that doing explicit sync from the start
>>> was one of the best engineering decisions Android ever made.  It's
>>> also the direction being taken by more modern APIs such as Vulkan.
>>>
>>>
>>> ## What are implicit and explicit synchronization?
>>>
>>> For those that aren't familiar with this space, GPUs, media encoders,
>>> etc. are massively parallel and synchronization of some form is
>>> required to ensure that everything happens in the right order and
>>> avoid data races.  Implicit synchronization is when bits of work (3D,
>>> compute, video encode, etc.) are implicitly based on the absolute
>>> CPU-time order in which API calls occur.  Explicit synchronization is
>>> when the client (whatever that means in any given context) provides
>>> the dependency graph explicitly via some sort of synchronization
>>> primitives.  If you're still confused, consider the following
>>> examples:
>>>
>>> With OpenGL and EGL, almost everything is implicit sync.  Say you have
>>> two OpenGL contexts sharing an image where one writes to it and the
>>> other textures from it.  The way the OpenGL spec works, the client has
>>> to make the API calls to render to the image before (in CPU time) it
>>> makes the API calls which texture from the image.  As long as it does
>>> this (and maybe inserts a glFlush?), the driver will ensure that the
>>> rendering completes before the texturing happens and you get correct
>>> contents.
>>>
>>> Implicit synchronization can also happen across processes.  Wayland,
>>> for instance, is currently built on implicit sync where the client
>>> does their rendering and then does a hand-off (via wl_surface::commit)
>>> to tell the compositor it's done at which point the compositor can now
>>> texture from the surface.  The hand-off ensures that the client's
>>> OpenGL API calls happen before the server's OpenGL API calls.
>>>
>>> A good example of explicit synchronization is the Vulkan API.  There,
>>> a client (or multiple clients) can simultaneously build command
>>> buffers in different threads where one of those command buffers
>>> renders to an image and the other textures from it and then submit
>>> both of them at the same time with instructions to the driver for
>>> which order to execute them in.  The execution order is described via
>>> the VkSemaphore primitive.  With the new VK_KHR_timeline_semaphore
>>> extension, you can even submit the work which does the texturing
>>> BEFORE the work which does the rendering and the driver will sort it
>>> out.
>>>
>>> The #1 problem with implicit synchronization (which explicit solves)
>>> is that it leads to a lot of over-synchronization both in client space
>>> and in driver/device space.  The client has to synchronize a lot more
>>> because it has to ensure that the API calls happen in a particular
>>> order.  The driver/device have to synchronize a lot more because they
>>> never know what is going to end up being a synchronization point as an
>>> API call on another thread/process may occur at any time.  As we move
>>> to more and more multi-threaded programming this synchronization (on
>>> the client-side especially) becomes more and more painful.
>>>
>>>
>>> ## Current status in Linux
>>>
>>> Implicit synchronization in Linux works via a the kernel's internal
>>> dma_buf and dma_fence data structures.  A dma_fence is a tiny object
>>> which represents the "done" status for some bit of work.  Typically,
>>> dma_fences are created as a by-product of someone submitting some bit
>>> of work (say, 3D rendering) to the kernel.  The dma_buf object has a
>>> set of dma_fences on it representing shared (read) and exclusive
>>> (write) access to the object.  When work is submitted which, for
>>> instance renders to the dma_buf, it's queued waiting on all the fences
>>> on the dma_buf and and a dma_fence is created representing the end of
>>> said rendering work and it's installed as the dma_buf's exclusive
>>> fence.  This way, the kernel can manage all its internal queues (3D
>>> rendering, display, video encode, etc.) and know which things to
>>> submit in what order.
>>>
>>> For the last few years, we've had sync_file in the kernel and it's
>>> plumbed into some drivers.  A sync_file is just a wrapper around a
>>> single dma_fence.  A sync_file is typically created as a by-product of
>>> submitting work (3D, compute, etc.) to the kernel and is signaled when
>>> that work completes.  When a sync_file is created, it is guaranteed by
>>> the kernel that it will become signaled in finite time and, once it's
>>> signaled, it remains signaled for the rest of time.  A sync_file is
>>> represented in UAPIs as a file descriptor and can be used with normal
>>> file APIs such as dup().  It can be passed into another UAPI which
>>> does some bit of queue'd work and the submitted work will wait for the
>>> sync_file to be triggered before executing.  A sync_file also supports
>>> poll() if  you want to wait on it manually.
>>>
>>> Unfortunately, sync_file is not broadly used and not all kernel GPU
>>> drivers support it.  Here's a very quick overview of my understanding
>>> of the status of various components (I don't know the status of
>>> anything in the media world):
>>>
>>>  - Vulkan: Explicit synchronization all the way but we have to go
>>> implicit as soon as we interact with a window-system.  Vulkan has APIs
>>> to import/export sync_files to/from it's VkSemaphore and VkFence
>>> synchronization primitives.
>>>  - OpenGL: Implicit all the way.  There are some EGL extensions to
>>> enable some forms of explicit sync via sync_file but OpenGL itself is
>>> still implicit.
>>>  - Wayland: Currently depends on implicit sync in the kernel (accessed
>>> via EGL/OpenGL).  There is an unstable extension to allow passing
>>> sync_files around but it's questionable how useful it is right now
>>> (more on that later).
>>>  - X11: With present, it has these "explicit" fence objects but
>>> they're always a shmfence which lets the X server and client do a
>>> userspace CPU-side hand-off without going over the socket (and
>>> round-tripping through the kernel).  However, the only thing that
>>> fence does is order the OpenGL API calls in the client and server and
>>> the real synchronization is still implicit.
>>>  - linux/i915/gem: Fully supports using sync_file or syncobj for
>>> explicit sync.
>>>  - linux/amdgpu: Supports sync_file and syncobj but it still
>>> implicitly syncs sometimes due to it's internal memory residency
>>> handling which can lead to over-synchronization.
>>>  - KMS: Implicit sync all the way.  There are no KMS APIs which take
>>> explicit sync primitives.
>>>  - v4l: ???
>>>  - gstreamer: ???
>>>  - Media APIs such as vaapi etc.:  ???
>>>
>>>
>>> ## Chicken and egg problems
>>>
>>> Ok, this is where it starts getting depressing.  I made the claim
>>> above that Wayland has an explicit synchronization protocol that's of
>>> questionable usefulness.  I would claim that basically any bit of
>>> plumbing we do through window systems is currently of questionable
>>> usefulness.  Why?
>>>
>>> From my perspective, as a Vulkan driver developer, I have to deal with
>>> the fact that Vulkan is an explicit sync API but Wayland and X11
>>> aren't.  Unfortunately, the Wayland extension solves zero problems for
>>> me because I can't really use it unless it's implemented in all of the
>>> compositors.  Until every Wayland compositor I care about my users
>>> being able to use (which is basically all of them) supports the
>>> extension, I have to continue carry around my pile of hacks to keep
>>> implicit sync and Vulkan working nicely together.
>>>
>>> From the perspective of a Wayland compositor (I used to play in this
>>> space), they'd love to implement the new explicit sync extension but
>>> can't.  Sure, they could wire up the extension, but the moment they go
>>> to flip a client buffer to the screen directly, they discover that KMS
>>> doesn't support any explicit sync APIs.  So, yes, they can technically
>>> implement the extension assuming the EGL stack they're running on has
>>> the sync_file extensions but any client buffers which come in using
>>> the explicit sync Wayland extension have to be composited and can't be
>>> scanned out directly.  As a 3D driver developer, I absolutely don't
>>> want compositors doing that because my users will complain about
>>> performance issues due to the extra blit.
>>>
>>> Ok, so let's say we get KMS wired up with implicit sync.  That solves
>>> all our problems, right?  It does, right up until someone decides that
>>> they wan to screen capture their Wayland session via some hardware
>>> media encoder that doesn't support explicit sync.  Now we have to
>>> plumb it all the way through the media stack, gstreamer, etc.  Great,
>>> so let's do that!  Oh, but gstreamer won't want to plumb it through
>>> until they're guaranteed that they can use explicit sync when
>>> displaying on X11 or Wayland.  Are you seeing the problem?
>>>
>>> To make matters worse, since most things are doing implicit
>>> synchronization today, it's really easy to get your explicit
>>> synchronization wrong and never notice.  If you forget to pass a
>>> sync_file into one place (say you never notice KMS doesn't support
>>> them), it will probably work anyway thanks to all the implicit sync
>>> that's going on elsewhere.
>>>
>>> So, clearly, we all need to go write piles of code that we can't
>>> actually properly test until everyone else has written their piece and
>>> then we use explicit sync if and only if all components support it.
>>> Really?  We're going to do multiple years of development and then just
>>> hope it works when we finally flip the switch?  That doesn't sound
>>> like a good plan to me.
>>>
>>>
>>> ## A proposal: Implicit and explicit sync together
>>>
>>> How to solve all these chicken-and-egg problems is something I've been
>>> giving quite a bit of thought (and talking with many others about) in
>>> the last couple of years.  One motivation for this is that we have to
>>> deal with a mismatch in Vulkan.  Another motivation is that I'm
>>> becoming increasingly unhappy with the way that synchronization,
>>> memory residency, and command submission are inherently intertwined in
>>> i915 and would like to break things apart.  Towards that end, I have
>>> an actual proposal.
>>>
>>> A couple weeks ago, I sent a series of patches to the dri-devel
>>> mailing list which adds a pair of new ioctls to dma-buf which allow
>>> userspace to manually import or export a sync_file from a dma-buf.
>>> The idea is that something like a Wayland compositor can switch to
>>> 100% explicit sync internally once the ioctl is available.  If it gets
>>> buffers in from a client that doesn't use the explicit sync extension,
>>> it can pull a sync_file from the dma-buf and use that exactly as it
>>> would a sync_file passed via the explicit sync extension.  When it
>>> goes to scan out a user buffer and discovers that KMS doesn't accept
>>> sync_files (or if it tries to use that pesky media encoder no one has
>>> converted), it can take it's sync_file for display and stuff it into
>>> the dma-buf before handing it to KMS.
>>>
>>> Along with the kernel patches, I've also implemented support for this
>>> in the Vulkan WSI code used by ANV and RADV.  With those patches, the
>>> only requirement on the Vulkan drivers is that you be able to export
>>> any VkSemaphore as a sync_file and temporarily import a sync_file into
>>> any VkFence or VkSemaphore.  As long as that works, the core Vulkan
>>> driver only ever sees explicit synchronization via sync_file.  The WSI
>>> code uses these new ioctls to translate the implicit sync of X11 and
>>> Wayland to the explicit sync the Vulkan driver wants.
>>>
>>> I'm hoping (and here's where I want a sanity check) that a simple API
>>> like this will allow us to finally start moving the Linux ecosystem
>>> over to explicit synchronization one piece at a time in a way that's
>>> actually correct.  (No Wayland explicit sync with compositors hoping
>>> KMS magically works even though it doesn't have a sync_file API.)
>>> Once some pieces in the ecosystem start moving, there will be
>>> motivation to start moving others and maybe we can actually build the
>>> momentum to get most everything converted.
>>>
>>> For reference, you can find the kernel RFC patches and mesa MR here:
>>>
>>> https://lists.freedesktop.org/archives/dri-devel/2020-March/258833.html
>>>
>>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4037
>>>
>>> At this point, I welcome your thoughts, comments, objections, and
>>> maybe even help/review. :-)
>>>
>>> --Jason Ekstrand
>>> _______________________________________________
>>> mesa-dev mailing list
>>> mesa-dev@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/mesa-dev
>>>
>>
>

--000000000000239d9d05a0f0b952
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">The synchronization works because the Mesa driver waits f=
or idle (drains the GFX pipeline) at the end of command buffers and there i=
s only 1 graphics queue, so everything is ordered.<div dir=3D"auto"><br></d=
iv><div dir=3D"auto">The GFX pipeline runs asynchronously to the command bu=
ffer, meaning the command buffer only starts draws and doesn&#39;t wait for=
 completion. If the Mesa driver didn&#39;t wait at the end of the command b=
uffer, the command buffer would finish and a different process could start =
execution of its own command buffer while shaders of the previous process a=
re still running.<br><div dir=3D"auto"><br></div><div dir=3D"auto">If the M=
esa driver submits a command buffer internally (because it&#39;s full), it =
doesn&#39;t wait, so the GFX pipeline doesn&#39;t notice that a command buf=
fer ended and a new one started.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">The waiting at the end of command buffers happens only when the f=
lush is external (Swap buffers, glFlush).</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">It&#39;s a performance problem, because the GFX queue is =
blocked until the GFX pipeline is drained at the end of every frame at leas=
t.</div><div dir=3D"auto"><br></div><div dir=3D"auto">So explicit fences fo=
r SwapBuffers would help.</div><div dir=3D"auto"><br></div><div dir=3D"auto=
">Marek</div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Sun., Mar. 15, 2020, 22:49 Jason Ekstrand, &lt;<a hre=
f=3D"mailto:jason@jlekstrand.net">jason@jlekstrand.net</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><u></u>

<div>
<div dir=3D"auto">
<div dir=3D"auto">Could you elaborate. If there&#39;s something missing fro=
m my mental model of how implicit sync works, I&#39;d like to have it corre=
cted. People continue claiming that AMD is somehow special but I have yet t=
o grasp what makes it so.=C2=A0 (Not that anyone has bothered to try all th=
at hard to explain it.)</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
<br></div><div dir=3D"auto">--Jason</div><div dir=3D"auto"><br></div>
<div id=3D"m_-2317530691431054281aqm-original" style=3D"color:black">

<div>
<div style=3D"color:black">
<p style=3D"color:black;font-size:10pt;font-family:sans-serif;margin:8pt 0"=
>On March 13, 2020 21:03:21 Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"mailto:mar=
aeo@gmail.com" target=3D"_blank" rel=3D"noreferrer">maraeo@gmail.com</a>&gt=
; wrote:</p>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin:0 0 0 0.75e=
x;border-left:1px solid #808080;padding-left:0.75ex">
<div dir=3D"ltr"><div>There is no synchronization between processes (e.g. 3=
D app and compositor) within X on AMD hw. It works because of some hacks in=
 Mesa.</div><div><br></div><div>Marek<br></div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 11, 2020 at 1:31=
 PM Jason Ekstrand &lt;<a href=3D"mailto:jason@jlekstrand.net" target=3D"_b=
lank" rel=3D"noreferrer">jason@jlekstrand.net</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">All,<br>
<br>
Sorry for casting such a broad net with this one. I&#39;m sure most people<=
br>
who reply will get at least one mailing list rejection.=C2=A0 However, this=
<br>
is an issue that affects a LOT of components and that&#39;s why it&#39;s<br=
>
thorny to begin with.=C2=A0 Please pardon the length of this e-mail as<br>
well; I promise there&#39;s a concrete point/proposal at the end.<br>
<br>
<br>
Explicit synchronization is the future of graphics and media.=C2=A0 At<br>
least, that seems to be the consensus among all the graphics people<br>
I&#39;ve talked to.=C2=A0 I had a chat with one of the lead Android graphic=
s<br>
engineers recently who told me that doing explicit sync from the start<br>
was one of the best engineering decisions Android ever made.=C2=A0 It&#39;s=
<br>
also the direction being taken by more modern APIs such as Vulkan.<br>
<br>
<br>
## What are implicit and explicit synchronization?<br>
<br>
For those that aren&#39;t familiar with this space, GPUs, media encoders,<b=
r>
etc. are massively parallel and synchronization of some form is<br>
required to ensure that everything happens in the right order and<br>
avoid data races.=C2=A0 Implicit synchronization is when bits of work (3D,<=
br>
compute, video encode, etc.) are implicitly based on the absolute<br>
CPU-time order in which API calls occur.=C2=A0 Explicit synchronization is<=
br>
when the client (whatever that means in any given context) provides<br>
the dependency graph explicitly via some sort of synchronization<br>
primitives.=C2=A0 If you&#39;re still confused, consider the following<br>
examples:<br>
<br>
With OpenGL and EGL, almost everything is implicit sync.=C2=A0 Say you have=
<br>
two OpenGL contexts sharing an image where one writes to it and the<br>
other textures from it.=C2=A0 The way the OpenGL spec works, the client has=
<br>
to make the API calls to render to the image before (in CPU time) it<br>
makes the API calls which texture from the image.=C2=A0 As long as it does<=
br>
this (and maybe inserts a glFlush?), the driver will ensure that the<br>
rendering completes before the texturing happens and you get correct<br>
contents.<br>
<br>
Implicit synchronization can also happen across processes.=C2=A0 Wayland,<b=
r>
for instance, is currently built on implicit sync where the client<br>
does their rendering and then does a hand-off (via wl_surface::commit)<br>
to tell the compositor it&#39;s done at which point the compositor can now<=
br>
texture from the surface.=C2=A0 The hand-off ensures that the client&#39;s<=
br>
OpenGL API calls happen before the server&#39;s OpenGL API calls.<br>
<br>
A good example of explicit synchronization is the Vulkan API.=C2=A0 There,<=
br>
a client (or multiple clients) can simultaneously build command<br>
buffers in different threads where one of those command buffers<br>
renders to an image and the other textures from it and then submit<br>
both of them at the same time with instructions to the driver for<br>
which order to execute them in.=C2=A0 The execution order is described via<=
br>
the VkSemaphore primitive.=C2=A0 With the new VK_KHR_timeline_semaphore<br>
extension, you can even submit the work which does the texturing<br>
BEFORE the work which does the rendering and the driver will sort it<br>
out.<br>
<br>
The #1 problem with implicit synchronization (which explicit solves)<br>
is that it leads to a lot of over-synchronization both in client space<br>
and in driver/device space.=C2=A0 The client has to synchronize a lot more<=
br>
because it has to ensure that the API calls happen in a particular<br>
order.=C2=A0 The driver/device have to synchronize a lot more because they<=
br>
never know what is going to end up being a synchronization point as an<br>
API call on another thread/process may occur at any time.=C2=A0 As we move<=
br>
to more and more multi-threaded programming this synchronization (on<br>
the client-side especially) becomes more and more painful.<br>
<br>
<br>
## Current status in Linux<br>
<br>
Implicit synchronization in Linux works via a the kernel&#39;s internal<br>
dma_buf and dma_fence data structures.=C2=A0 A dma_fence is a tiny object<b=
r>
which represents the &quot;done&quot; status for some bit of work.=C2=A0 Ty=
pically,<br>
dma_fences are created as a by-product of someone submitting some bit<br>
of work (say, 3D rendering) to the kernel.=C2=A0 The dma_buf object has a<b=
r>
set of dma_fences on it representing shared (read) and exclusive<br>
(write) access to the object.=C2=A0 When work is submitted which, for<br>
instance renders to the dma_buf, it&#39;s queued waiting on all the fences<=
br>
on the dma_buf and and a dma_fence is created representing the end of<br>
said rendering work and it&#39;s installed as the dma_buf&#39;s exclusive<b=
r>
fence.=C2=A0 This way, the kernel can manage all its internal queues (3D<br=
>
rendering, display, video encode, etc.) and know which things to<br>
submit in what order.<br>
<br>
For the last few years, we&#39;ve had sync_file in the kernel and it&#39;s<=
br>
plumbed into some drivers.=C2=A0 A sync_file is just a wrapper around a<br>
single dma_fence.=C2=A0 A sync_file is typically created as a by-product of=
<br>
submitting work (3D, compute, etc.) to the kernel and is signaled when<br>
that work completes.=C2=A0 When a sync_file is created, it is guaranteed by=
<br>
the kernel that it will become signaled in finite time and, once it&#39;s<b=
r>
signaled, it remains signaled for the rest of time.=C2=A0 A sync_file is<br=
>
represented in UAPIs as a file descriptor and can be used with normal<br>
file APIs such as dup().=C2=A0 It can be passed into another UAPI which<br>
does some bit of queue&#39;d work and the submitted work will wait for the<=
br>
sync_file to be triggered before executing.=C2=A0 A sync_file also supports=
<br>
poll() if=C2=A0 you want to wait on it manually.<br>
<br>
Unfortunately, sync_file is not broadly used and not all kernel GPU<br>
drivers support it.=C2=A0 Here&#39;s a very quick overview of my understand=
ing<br>
of the status of various components (I don&#39;t know the status of<br>
anything in the media world):<br>
<br>
=C2=A0- Vulkan: Explicit synchronization all the way but we have to go<br>
implicit as soon as we interact with a window-system.=C2=A0 Vulkan has APIs=
<br>
to import/export sync_files to/from it&#39;s VkSemaphore and VkFence<br>
synchronization primitives.<br>
=C2=A0- OpenGL: Implicit all the way.=C2=A0 There are some EGL extensions t=
o<br>
enable some forms of explicit sync via sync_file but OpenGL itself is<br>
still implicit.<br>
=C2=A0- Wayland: Currently depends on implicit sync in the kernel (accessed=
<br>
via EGL/OpenGL).=C2=A0 There is an unstable extension to allow passing<br>
sync_files around but it&#39;s questionable how useful it is right now<br>
(more on that later).<br>
=C2=A0- X11: With present, it has these &quot;explicit&quot; fence objects =
but<br>
they&#39;re always a shmfence which lets the X server and client do a<br>
userspace CPU-side hand-off without going over the socket (and<br>
round-tripping through the kernel).=C2=A0 However, the only thing that<br>
fence does is order the OpenGL API calls in the client and server and<br>
the real synchronization is still implicit.<br>
=C2=A0- linux/i915/gem: Fully supports using sync_file or syncobj for expli=
cit sync.<br>
=C2=A0- linux/amdgpu: Supports sync_file and syncobj but it still<br>
implicitly syncs sometimes due to it&#39;s internal memory residency<br>
handling which can lead to over-synchronization.<br>
=C2=A0- KMS: Implicit sync all the way.=C2=A0 There are no KMS APIs which t=
ake<br>
explicit sync primitives.<br>
=C2=A0- v4l: ???<br>
=C2=A0- gstreamer: ???<br>
=C2=A0- Media APIs such as vaapi etc.:=C2=A0 ???<br>
<br>
<br>
## Chicken and egg problems<br>
<br>
Ok, this is where it starts getting depressing.=C2=A0 I made the claim<br>
above that Wayland has an explicit synchronization protocol that&#39;s of<b=
r>
questionable usefulness.=C2=A0 I would claim that basically any bit of<br>
plumbing we do through window systems is currently of questionable<br>
usefulness.=C2=A0 Why?<br>
<br>
From my perspective, as a Vulkan driver developer, I have to deal with<br>
the fact that Vulkan is an explicit sync API but Wayland and X11<br>
aren&#39;t.=C2=A0 Unfortunately, the Wayland extension solves zero problems=
 for<br>
me because I can&#39;t really use it unless it&#39;s implemented in all of =
the<br>
compositors.=C2=A0 Until every Wayland compositor I care about my users<br>
being able to use (which is basically all of them) supports the<br>
extension, I have to continue carry around my pile of hacks to keep<br>
implicit sync and Vulkan working nicely together.<br>
<br>
From the perspective of a Wayland compositor (I used to play in this<br>
space), they&#39;d love to implement the new explicit sync extension but<br=
>
can&#39;t.=C2=A0 Sure, they could wire up the extension, but the moment the=
y go<br>
to flip a client buffer to the screen directly, they discover that KMS<br>
doesn&#39;t support any explicit sync APIs.=C2=A0 So, yes, they can technic=
ally<br>
implement the extension assuming the EGL stack they&#39;re running on has<b=
r>
the sync_file extensions but any client buffers which come in using<br>
the explicit sync Wayland extension have to be composited and can&#39;t be<=
br>
scanned out directly.=C2=A0 As a 3D driver developer, I absolutely don&#39;=
t<br>
want compositors doing that because my users will complain about<br>
performance issues due to the extra blit.<br>
<br>
Ok, so let&#39;s say we get KMS wired up with implicit sync.=C2=A0 That sol=
ves<br>
all our problems, right?=C2=A0 It does, right up until someone decides that=
<br>
they wan to screen capture their Wayland session via some hardware<br>
media encoder that doesn&#39;t support explicit sync.=C2=A0 Now we have to<=
br>
plumb it all the way through the media stack, gstreamer, etc.=C2=A0 Great,<=
br>
so let&#39;s do that!=C2=A0 Oh, but gstreamer won&#39;t want to plumb it th=
rough<br>
until they&#39;re guaranteed that they can use explicit sync when<br>
displaying on X11 or Wayland.=C2=A0 Are you seeing the problem?<br>
<br>
To make matters worse, since most things are doing implicit<br>
synchronization today, it&#39;s really easy to get your explicit<br>
synchronization wrong and never notice.=C2=A0 If you forget to pass a<br>
sync_file into one place (say you never notice KMS doesn&#39;t support<br>
them), it will probably work anyway thanks to all the implicit sync<br>
that&#39;s going on elsewhere.<br>
<br>
So, clearly, we all need to go write piles of code that we can&#39;t<br>
actually properly test until everyone else has written their piece and<br>
then we use explicit sync if and only if all components support it.<br>
Really?=C2=A0 We&#39;re going to do multiple years of development and then =
just<br>
hope it works when we finally flip the switch?=C2=A0 That doesn&#39;t sound=
<br>
like a good plan to me.<br>
<br>
<br>
## A proposal: Implicit and explicit sync together<br>
<br>
How to solve all these chicken-and-egg problems is something I&#39;ve been<=
br>
giving quite a bit of thought (and talking with many others about) in<br>
the last couple of years.=C2=A0 One motivation for this is that we have to<=
br>
deal with a mismatch in Vulkan.=C2=A0 Another motivation is that I&#39;m<br=
>
becoming increasingly unhappy with the way that synchronization,<br>
memory residency, and command submission are inherently intertwined in<br>
i915 and would like to break things apart.=C2=A0 Towards that end, I have<b=
r>
an actual proposal.<br>
<br>
A couple weeks ago, I sent a series of patches to the dri-devel<br>
mailing list which adds a pair of new ioctls to dma-buf which allow<br>
userspace to manually import or export a sync_file from a dma-buf.<br>
The idea is that something like a Wayland compositor can switch to<br>
100% explicit sync internally once the ioctl is available.=C2=A0 If it gets=
<br>
buffers in from a client that doesn&#39;t use the explicit sync extension,<=
br>
it can pull a sync_file from the dma-buf and use that exactly as it<br>
would a sync_file passed via the explicit sync extension.=C2=A0 When it<br>
goes to scan out a user buffer and discovers that KMS doesn&#39;t accept<br=
>
sync_files (or if it tries to use that pesky media encoder no one has<br>
converted), it can take it&#39;s sync_file for display and stuff it into<br=
>
the dma-buf before handing it to KMS.<br>
<br>
Along with the kernel patches, I&#39;ve also implemented support for this<b=
r>
in the Vulkan WSI code used by ANV and RADV.=C2=A0 With those patches, the<=
br>
only requirement on the Vulkan drivers is that you be able to export<br>
any VkSemaphore as a sync_file and temporarily import a sync_file into<br>
any VkFence or VkSemaphore.=C2=A0 As long as that works, the core Vulkan<br=
>
driver only ever sees explicit synchronization via sync_file.=C2=A0 The WSI=
<br>
code uses these new ioctls to translate the implicit sync of X11 and<br>
Wayland to the explicit sync the Vulkan driver wants.<br>
<br>
I&#39;m hoping (and here&#39;s where I want a sanity check) that a simple A=
PI<br>
like this will allow us to finally start moving the Linux ecosystem<br>
over to explicit synchronization one piece at a time in a way that&#39;s<br=
>
actually correct.=C2=A0 (No Wayland explicit sync with compositors hoping<b=
r>
KMS magically works even though it doesn&#39;t have a sync_file API.)<br>
Once some pieces in the ecosystem start moving, there will be<br>
motivation to start moving others and maybe we can actually build the<br>
momentum to get most everything converted.<br>
<br>
For reference, you can find the kernel RFC patches and mesa MR here:<br>
<br>
<a href=3D"https://lists.freedesktop.org/archives/dri-devel/2020-March/2588=
33.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.free=
desktop.org/archives/dri-devel/2020-March/258833.html</a><br>
<br>
<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4037" =
rel=3D"noreferrer noreferrer" target=3D"_blank">https://gitlab.freedesktop.=
org/mesa/mesa/-/merge_requests/4037</a><br>
<br>
At this point, I welcome your thoughts, comments, objections, and<br>
maybe even help/review. :-)<br>
<br>
--Jason Ekstrand<br>
_______________________________________________<br>
mesa-dev mailing list<br>
<a href=3D"mailto:mesa-dev@lists.freedesktop.org" target=3D"_blank" rel=3D"=
noreferrer">mesa-dev@lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/mesa-dev" rel=3D"=
noreferrer noreferrer" target=3D"_blank">https://lists.freedesktop.org/mail=
man/listinfo/mesa-dev</a><br>
</blockquote></div>
</blockquote>
</div>
</div>


</div><div dir=3D"auto"><br></div>
</div></div>

</blockquote></div>

--000000000000239d9d05a0f0b952--

--===============0500380615==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0500380615==--
