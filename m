Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 253BF18783C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 04:37:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B50A96E038;
	Tue, 17 Mar 2020 03:37:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD9DD6E509
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 03:37:17 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id dc19so24625410edb.10
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 20:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BA+mdYeVMliYcBvVOu3TYqpgPCbaBApwen9ygdsVXws=;
 b=SeA7jctDBNLWq8LHxUZ8JjfNgv6uuc5vaJbU8OuGXDMaFT5YYwsEd4kcVpV9TfP8LS
 jvb66a1r66/wI6SEadg7r4NPaSbxPFa6IojzbOf8SrduVMti/kbCi+Wbj2z6lZrtNGge
 zDmLDrDo+SsDxx8KzQPDPH2POAhpLwllRYbmmSNihpyNiP4+Xk27GL0W1ULXhl0NX4lm
 6/O4yjpJa5CI51s7Fpxr4Sgr2r6Ao/JTVkvFNDxnGnETgjin5zkiK2Lc9LvLbN5TPQUw
 09w47FhPlrAKUo+wA6qNyN/GoZH7NMhBYwXD/REY0rPxLlERxjrd1Z0+4C99OvWKDZt3
 ZDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BA+mdYeVMliYcBvVOu3TYqpgPCbaBApwen9ygdsVXws=;
 b=K4z95yq9AiSlZBrP/YJBdP0ryw1IgkCKfwiNHl+XZXJkRnQEUAxn0SMqu0lxOdVvMz
 uufYI4hyDhu0Rf8MRHzy8w/9iTUbzl2FLlL4Hb2282vCLK6z2yiejMLWb4tPbYE5Hwll
 e3i2coDabihpqk3phQ9ZYzmewTx6F0MYphJlNycQwaT+FgwuzZ0tOvwlXoF0CI/782no
 ekuTWraX28kq32mBmNtFlw8Di+SWsBjYkpuvJ89uoCb5g2ENr22xRrCWh64nSMEAFuae
 A/W2Kbo7Q197PeREgodfmCZJ+GhawknmDTjl4KEKAFV66bbg0ed0WSVnaaQdTRUkKkEY
 0/rg==
X-Gm-Message-State: ANhLgQ1aD55eOscEgOpgDOs6lZDDag6yUUCTVKpPMpT3qwF/f5GQ5p2N
 dqnNnFzRAHk51YkPwEuDMuq5LBUCtVLE/rqzR4QLMg==
X-Google-Smtp-Source: ADFU+vuJfKhdWdImDdmo9nh8HhhAyszv47DoPF3ycOQJQxpHBCPgFhFYKulUPMCN9ChHlgqz3fivzaj0qXAu44sK/3g=
X-Received: by 2002:a17:906:5ad5:: with SMTP id
 x21mr2271180ejs.177.1584416235692; 
 Mon, 16 Mar 2020 20:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
 <CAJcyoys6FOsBmDe_rSeM8VSwPuB55a-v+3igaknQLyq=6aPa9A@mail.gmail.com>
In-Reply-To: <CAJcyoys6FOsBmDe_rSeM8VSwPuB55a-v+3igaknQLyq=6aPa9A@mail.gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 16 Mar 2020 22:37:04 -0500
Message-ID: <CAOFGe97O42ad5Q_P4RvYNFcgzZWy=LNB=tU2V5TkGaZ4=qbrCg@mail.gmail.com>
Subject: Re: Plumbing explicit synchronization through the Linux ecosystem
To: Roman Gilg <subdiff@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 16, 2020 at 6:39 PM Roman Gilg <subdiff@gmail.com> wrote:
>
> On Wed, Mar 11, 2020 at 8:21 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
> >
> > On Wed, Mar 11, 2020 at 12:31 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
> > >
> > > All,
> > >
> > > Sorry for casting such a broad net with this one. I'm sure most people
> > > who reply will get at least one mailing list rejection.  However, this
> > > is an issue that affects a LOT of components and that's why it's
> > > thorny to begin with.  Please pardon the length of this e-mail as
> > > well; I promise there's a concrete point/proposal at the end.
> > >
> > >
> > > Explicit synchronization is the future of graphics and media.  At
> > > least, that seems to be the consensus among all the graphics people
> > > I've talked to.  I had a chat with one of the lead Android graphics
> > > engineers recently who told me that doing explicit sync from the start
> > > was one of the best engineering decisions Android ever made.  It's
> > > also the direction being taken by more modern APIs such as Vulkan.
> > >
> > >
> > > ## What are implicit and explicit synchronization?
> > >
> > > For those that aren't familiar with this space, GPUs, media encoders,
> > > etc. are massively parallel and synchronization of some form is
> > > required to ensure that everything happens in the right order and
> > > avoid data races.  Implicit synchronization is when bits of work (3D,
> > > compute, video encode, etc.) are implicitly based on the absolute
> > > CPU-time order in which API calls occur.  Explicit synchronization is
> > > when the client (whatever that means in any given context) provides
> > > the dependency graph explicitly via some sort of synchronization
> > > primitives.  If you're still confused, consider the following
> > > examples:
> > >
> > > With OpenGL and EGL, almost everything is implicit sync.  Say you have
> > > two OpenGL contexts sharing an image where one writes to it and the
> > > other textures from it.  The way the OpenGL spec works, the client has
> > > to make the API calls to render to the image before (in CPU time) it
> > > makes the API calls which texture from the image.  As long as it does
> > > this (and maybe inserts a glFlush?), the driver will ensure that the
> > > rendering completes before the texturing happens and you get correct
> > > contents.
> > >
> > > Implicit synchronization can also happen across processes.  Wayland,
> > > for instance, is currently built on implicit sync where the client
> > > does their rendering and then does a hand-off (via wl_surface::commit)
> > > to tell the compositor it's done at which point the compositor can now
> > > texture from the surface.  The hand-off ensures that the client's
> > > OpenGL API calls happen before the server's OpenGL API calls.
> > >
> > > A good example of explicit synchronization is the Vulkan API.  There,
> > > a client (or multiple clients) can simultaneously build command
> > > buffers in different threads where one of those command buffers
> > > renders to an image and the other textures from it and then submit
> > > both of them at the same time with instructions to the driver for
> > > which order to execute them in.  The execution order is described via
> > > the VkSemaphore primitive.  With the new VK_KHR_timeline_semaphore
> > > extension, you can even submit the work which does the texturing
> > > BEFORE the work which does the rendering and the driver will sort it
> > > out.
> > >
> > > The #1 problem with implicit synchronization (which explicit solves)
> > > is that it leads to a lot of over-synchronization both in client space
> > > and in driver/device space.  The client has to synchronize a lot more
> > > because it has to ensure that the API calls happen in a particular
> > > order.  The driver/device have to synchronize a lot more because they
> > > never know what is going to end up being a synchronization point as an
> > > API call on another thread/process may occur at any time.  As we move
> > > to more and more multi-threaded programming this synchronization (on
> > > the client-side especially) becomes more and more painful.
> > >
> > >
> > > ## Current status in Linux
> > >
> > > Implicit synchronization in Linux works via a the kernel's internal
> > > dma_buf and dma_fence data structures.  A dma_fence is a tiny object
> > > which represents the "done" status for some bit of work.  Typically,
> > > dma_fences are created as a by-product of someone submitting some bit
> > > of work (say, 3D rendering) to the kernel.  The dma_buf object has a
> > > set of dma_fences on it representing shared (read) and exclusive
> > > (write) access to the object.  When work is submitted which, for
> > > instance renders to the dma_buf, it's queued waiting on all the fences
> > > on the dma_buf and and a dma_fence is created representing the end of
> > > said rendering work and it's installed as the dma_buf's exclusive
> > > fence.  This way, the kernel can manage all its internal queues (3D
> > > rendering, display, video encode, etc.) and know which things to
> > > submit in what order.
> > >
> > > For the last few years, we've had sync_file in the kernel and it's
> > > plumbed into some drivers.  A sync_file is just a wrapper around a
> > > single dma_fence.  A sync_file is typically created as a by-product of
> > > submitting work (3D, compute, etc.) to the kernel and is signaled when
> > > that work completes.  When a sync_file is created, it is guaranteed by
> > > the kernel that it will become signaled in finite time and, once it's
> > > signaled, it remains signaled for the rest of time.  A sync_file is
> > > represented in UAPIs as a file descriptor and can be used with normal
> > > file APIs such as dup().  It can be passed into another UAPI which
> > > does some bit of queue'd work and the submitted work will wait for the
> > > sync_file to be triggered before executing.  A sync_file also supports
> > > poll() if  you want to wait on it manually.
> > >
> > > Unfortunately, sync_file is not broadly used and not all kernel GPU
> > > drivers support it.  Here's a very quick overview of my understanding
> > > of the status of various components (I don't know the status of
> > > anything in the media world):
> > >
> > >  - Vulkan: Explicit synchronization all the way but we have to go
> > > implicit as soon as we interact with a window-system.  Vulkan has APIs
> > > to import/export sync_files to/from it's VkSemaphore and VkFence
> > > synchronization primitives.
> > >  - OpenGL: Implicit all the way.  There are some EGL extensions to
> > > enable some forms of explicit sync via sync_file but OpenGL itself is
> > > still implicit.
> > >  - Wayland: Currently depends on implicit sync in the kernel (accessed
> > > via EGL/OpenGL).  There is an unstable extension to allow passing
> > > sync_files around but it's questionable how useful it is right now
> > > (more on that later).
> > >  - X11: With present, it has these "explicit" fence objects but
> > > they're always a shmfence which lets the X server and client do a
> > > userspace CPU-side hand-off without going over the socket (and
> > > round-tripping through the kernel).  However, the only thing that
> > > fence does is order the OpenGL API calls in the client and server and
> > > the real synchronization is still implicit.
> > >  - linux/i915/gem: Fully supports using sync_file or syncobj for explicit sync.
> > >  - linux/amdgpu: Supports sync_file and syncobj but it still
> > > implicitly syncs sometimes due to it's internal memory residency
> > > handling which can lead to over-synchronization.
> > >  - KMS: Implicit sync all the way.  There are no KMS APIs which take
> > > explicit sync primitives.
> >
> > Correction:  Apparently, I missed some things.  If you use atomic, KMS
> > does have explicit in- and out-fences.  Non-atomic users (e.g. X11)
> > are still in trouble but most Wayland compositors use atomic these
> > days
>
> Hi Jason,
>
> thanks for pushing this forward and the comprehensive explanation on
> what it is about.
>
> My question would be what exactly do you now need from Wayland compositor devs?
> I understood a Wayland compositor needs to:
> * do atomic page flips,
> * support [1].

Yup, that's pretty much what's needed.  From the looks of
https://gitlab.gnome.org/GNOME/mutter/issues/548, it appears that
mutter is at least on their way to atomic though it also looks like a
long road.

> Is there something else? You described a mechanism to pull out and
> push in these sync_files to dma-bufs depending on what the client
> provides and what kind of output the compositor puts the final image
> onto. That's for now just an idea (plus your wip implementation in
> Vulkan/kernel) and there is not yet anything that can be done for this
> specifically in Wayland compositors, or is there?

The kernel patches I proposed are mostly a way for explicit-sync APIs
such as Vulkan to reasonably interop with the implicit sync world.
Right now, for instance, we have no real plan for Vulkan to be able to
handle synchronization when talking to a media encoder.  We have the
modifiers and dma-buf stuff which deals with image layout but
synchronization is currently an unsolved problem.  If we have a
mechanism for sync_file import/export from dma-buf then an app can use
implicit sync when talking to VAAPI (as an example) and turn that into
sync_files to talk to Vulkan.  Better yet, we could plumb VAAPI for
explicit sync but that's yet one more thing that needs to support
explicit sync.

Make sense?

--Jason


> Thanks
> Roman
>
> [1] https://gitlab.freedesktop.org/wayland/wayland-protocols/blob/master/unstable/linux-explicit-synchronization/linux-explicit-synchronization-unstable-v1.xml
>
>
> > >  - v4l: ???
> > >  - gstreamer: ???
> > >  - Media APIs such as vaapi etc.:  ???
> > >
> > >
> > > ## Chicken and egg problems
> > >
> > > Ok, this is where it starts getting depressing.  I made the claim
> > > above that Wayland has an explicit synchronization protocol that's of
> > > questionable usefulness.  I would claim that basically any bit of
> > > plumbing we do through window systems is currently of questionable
> > > usefulness.  Why?
> > >
> > > From my perspective, as a Vulkan driver developer, I have to deal with
> > > the fact that Vulkan is an explicit sync API but Wayland and X11
> > > aren't.  Unfortunately, the Wayland extension solves zero problems for
> > > me because I can't really use it unless it's implemented in all of the
> > > compositors.  Until every Wayland compositor I care about my users
> > > being able to use (which is basically all of them) supports the
> > > extension, I have to continue carry around my pile of hacks to keep
> > > implicit sync and Vulkan working nicely together.
> > >
> > > From the perspective of a Wayland compositor (I used to play in this
> > > space), they'd love to implement the new explicit sync extension but
> > > can't.  Sure, they could wire up the extension, but the moment they go
> > > to flip a client buffer to the screen directly, they discover that KMS
> > > doesn't support any explicit sync APIs.
> >
> > As per the above correction, Wayland compositors aren't nearly as bad
> > off as I initially thought.  There may still be weird screen capture
> > cases but the normal cases of compositing and displaying via
> > KMS/atomic should be in reasonably good shape.
> >
> > > So, yes, they can technically
> > > implement the extension assuming the EGL stack they're running on has
> > > the sync_file extensions but any client buffers which come in using
> > > the explicit sync Wayland extension have to be composited and can't be
> > > scanned out directly.  As a 3D driver developer, I absolutely don't
> > > want compositors doing that because my users will complain about
> > > performance issues due to the extra blit.
> > >
> > > Ok, so let's say we get KMS wired up with implicit sync.  That solves
> > > all our problems, right?  It does, right up until someone decides that
> > > they wan to screen capture their Wayland session via some hardware
> > > media encoder that doesn't support explicit sync.  Now we have to
> > > plumb it all the way through the media stack, gstreamer, etc.  Great,
> > > so let's do that!  Oh, but gstreamer won't want to plumb it through
> > > until they're guaranteed that they can use explicit sync when
> > > displaying on X11 or Wayland.  Are you seeing the problem?
> > >
> > > To make matters worse, since most things are doing implicit
> > > synchronization today, it's really easy to get your explicit
> > > synchronization wrong and never notice.  If you forget to pass a
> > > sync_file into one place (say you never notice KMS doesn't support
> > > them), it will probably work anyway thanks to all the implicit sync
> > > that's going on elsewhere.
> > >
> > > So, clearly, we all need to go write piles of code that we can't
> > > actually properly test until everyone else has written their piece and
> > > then we use explicit sync if and only if all components support it.
> > > Really?  We're going to do multiple years of development and then just
> > > hope it works when we finally flip the switch?  That doesn't sound
> > > like a good plan to me.
> > >
> > >
> > > ## A proposal: Implicit and explicit sync together
> > >
> > > How to solve all these chicken-and-egg problems is something I've been
> > > giving quite a bit of thought (and talking with many others about) in
> > > the last couple of years.  One motivation for this is that we have to
> > > deal with a mismatch in Vulkan.  Another motivation is that I'm
> > > becoming increasingly unhappy with the way that synchronization,
> > > memory residency, and command submission are inherently intertwined in
> > > i915 and would like to break things apart.  Towards that end, I have
> > > an actual proposal.
> > >
> > > A couple weeks ago, I sent a series of patches to the dri-devel
> > > mailing list which adds a pair of new ioctls to dma-buf which allow
> > > userspace to manually import or export a sync_file from a dma-buf.
> > > The idea is that something like a Wayland compositor can switch to
> > > 100% explicit sync internally once the ioctl is available.  If it gets
> > > buffers in from a client that doesn't use the explicit sync extension,
> > > it can pull a sync_file from the dma-buf and use that exactly as it
> > > would a sync_file passed via the explicit sync extension.  When it
> > > goes to scan out a user buffer and discovers that KMS doesn't accept
> > > sync_files (or if it tries to use that pesky media encoder no one has
> > > converted), it can take it's sync_file for display and stuff it into
> > > the dma-buf before handing it to KMS.
> > >
> > > Along with the kernel patches, I've also implemented support for this
> > > in the Vulkan WSI code used by ANV and RADV.  With those patches, the
> > > only requirement on the Vulkan drivers is that you be able to export
> > > any VkSemaphore as a sync_file and temporarily import a sync_file into
> > > any VkFence or VkSemaphore.  As long as that works, the core Vulkan
> > > driver only ever sees explicit synchronization via sync_file.  The WSI
> > > code uses these new ioctls to translate the implicit sync of X11 and
> > > Wayland to the explicit sync the Vulkan driver wants.
> > >
> > > I'm hoping (and here's where I want a sanity check) that a simple API
> > > like this will allow us to finally start moving the Linux ecosystem
> > > over to explicit synchronization one piece at a time in a way that's
> > > actually correct.  (No Wayland explicit sync with compositors hoping
> > > KMS magically works even though it doesn't have a sync_file API.)
> > > Once some pieces in the ecosystem start moving, there will be
> > > motivation to start moving others and maybe we can actually build the
> > > momentum to get most everything converted.
> > >
> > > For reference, you can find the kernel RFC patches and mesa MR here:
> > >
> > > https://lists.freedesktop.org/archives/dri-devel/2020-March/258833.html
> > >
> > > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4037
> > >
> > > At this point, I welcome your thoughts, comments, objections, and
> > > maybe even help/review. :-)
> > >
> > > --Jason Ekstrand
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
