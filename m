Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 008FE188729
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:17:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE7836E185;
	Tue, 17 Mar 2020 14:16:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [IPv6:2607:f8b0:4864:20::e2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FEB16E42B;
 Mon, 16 Mar 2020 12:55:39 +0000 (UTC)
Received: by mail-vs1-xe2a.google.com with SMTP id m9so11179156vso.2;
 Mon, 16 Mar 2020 05:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XmnNf8bH8/iTc5G73IsLojOY+WJWJVaGVtrYwGYUb5E=;
 b=SOUeFEbzI/NADNE4l+xP7SvbJa2znMK/dZoAlIClp65ZC+yB2/yaFzqr4k/jdptsjR
 5AqmbPbRZ+9ZkN7hBW9Vr2A09SoraGFDtvjN5OHP0vEaMU38okH4dzh3qdzFWBAYH6UA
 NHm9N34Nc8/kutKzX2R8a/EgOIbZnDRtGr6nXfqxtgkHGzgNY0u1ltFdQ0hQuZF7pCpv
 wLSXxhntcXamkxBYTYtkLuJgkRJIux8FO3KIVSWPZGoLq/+w7iAG/Of0ZdpcfU6+FfyI
 CrBmAULVe5mYJAzyVyOmrVK9sydO+pAKCpggO+3lmvcxzFEjMGHRI/1Y2wKFC6scmgOU
 3TLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XmnNf8bH8/iTc5G73IsLojOY+WJWJVaGVtrYwGYUb5E=;
 b=ZPpdA61Rt9xDLVvWTtG82s3N3RXsukr7Pt/kt/14bYLI42osfODCwNNKId39w3E8kl
 fC3wJgdHtUmqbSFWcXdseqQu7dXsDpUtgbHLOI2Vda+1vtF++PFn4cCtfYOSMQq51TJ1
 Ycgj2RiT5zvOePQ8snygVXDU46sq83bkFhbKw2GFk6iKpQuTU3pg9qSTdqm9Y33N12lI
 DNHOgkph0gTDJTeoMP84A4I+bvTLG0c/jC3u2WrE0dA7behGHCkWGloNyrGoxcWm1n2B
 5d9MarD9w/BkBjfofK3Y4PH5FAo2oRF1/+nZUFgH2xE0lUh/NAoE//5PYlif8G0QfUnH
 zaoA==
X-Gm-Message-State: ANhLgQ1rJrXgBp5ePlk7XA1Rqq666vlNYomUjOrKpCqJR5JOCz4O6SzS
 dxaNQM4vVmQjOCS4SxP8KWDfXiWb/qQOrZ3RbnM=
X-Google-Smtp-Source: ADFU+vsYqxIbrr5RGQP8FTebeHutUbNPC6HMIu33/Zgf3kqKz3LZq8kg4nn28Dt6hf8Qq2EEn1PiHTlw/xwd6m/wz8E=
X-Received: by 2002:a67:ba16:: with SMTP id l22mr1039126vsn.210.1584363338319; 
 Mon, 16 Mar 2020 05:55:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
 <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
 <20200316102034.GA30883@pendragon.ideasonboard.com>
In-Reply-To: <20200316102034.GA30883@pendragon.ideasonboard.com>
From: Tomek Bury <tomek.bury@gmail.com>
Date: Mon, 16 Mar 2020 12:55:27 +0000
Message-ID: <CAO1ALz=us11a8=M6MWGdLwXakeR3Ltd=iyAN4G5-GkvNXctGeA@mail.gmail.com>
Subject: Re: Plumbing explicit synchronization through the Linux ecosystem
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Approved-At: Tue, 17 Mar 2020 14:16:40 +0000
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
 <gstreamer-devel@lists.freedesktop.org>, Jason Ekstrand <jason@jlekstrand.net>,
 ML mesa-dev <mesa-dev@lists.freedesktop.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1742691715=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1742691715==
Content-Type: multipart/alternative; boundary="000000000000f9ca0305a0f8550d"

--000000000000f9ca0305a0f8550d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jason,

I've been wrestling with the sync problems in Wayland some time ago, but
only with regards to 3D drivers.

The guarantee given by the GL/GLES spec is limited to a single graphics
context. If the same buffer is accessed by 2 contexts the outcome is
unspecified. The cross-context and cross-process synchronisation is not
guaranteed. It happens to work on Mesa, because the read/write locking is
implemented in the kernel space, but it didn't work on Broadcom driver,
which has read-write interlocks in user space.

 A Vulkan client makes it even worse because of conflicting requirements:
Vulkan's vkQueuePresentKHR() passes in a number of semaphores but disallows
waiting. Wayland WSI requires wl_surface_commit() to be called from
vkQueuePresentKHR() which does require a wait, unless a synchronisation
primitive representing Vulkan samaphores is passed between Vulkan client
and the compositor.

The most troublesome part was Wayland buffer release mechanism, as it only
involves a CPU signalling over Wayland IPC, without any 3D driver
involvement. The choices were: explicit synchronisation extension or a
buffer copy in the compositor (i.e. compositor textures from the copy, so
the client can re-write the original), or some implicit synchronisation in
kernel space (but that wasn't an option in Broadcom driver).

With regards to V4L2, I believe it could easily work the same way as 3D
drivers, i.e. pass a buffer+fence pair to the next stage. The encode always
succeeds, but for capture or decode, the main problem is the uncertain
outcome, I believe? If we're fine with rendering or displaying an
occasional broken frame, then buffer+fence pair would work too. The broken
frame will go into the pipeline, but application can drain the pipeline and
start over once the capture works again.

To answer some points raised by Laurent (although I'm unfamiliar with the
camera drivers):

> you don't know until capture complete in which buffer the frame has
been captured
Surely you do, you only don't know in advance if the capture will be
successful

> but if an error occurs during capture, they can be recycled internally
and put to the back of the queue.
That would have to change in order to use explicit synchronisation. Every
started capture becomes immediately available as a buffer+fence pair. Fence
is signalled once the capture is finished (successfully or otherwise). The
buffer must not be reused until it's released, possibly with another fence
- in that case the buffer must not be reused until the release fence is
signalled.

Cheers,
Tomek

On Mon, 16 Mar 2020 at 10:20, Laurent Pinchart <
laurent.pinchart@ideasonboard.com> wrote:

> On Wed, Mar 11, 2020 at 04:18:55PM -0400, Nicolas Dufresne wrote:
> > (I know I'm going to be spammed by so many mailing list ...)
> >
> > Le mercredi 11 mars 2020 =C3=A0 14:21 -0500, Jason Ekstrand a =C3=A9cri=
t :
> > > On Wed, Mar 11, 2020 at 12:31 PM Jason Ekstrand <jason@jlekstrand.net=
>
> wrote:
> > > > All,
> > > >
> > > > Sorry for casting such a broad net with this one. I'm sure most
> people
> > > > who reply will get at least one mailing list rejection.  However,
> this
> > > > is an issue that affects a LOT of components and that's why it's
> > > > thorny to begin with.  Please pardon the length of this e-mail as
> > > > well; I promise there's a concrete point/proposal at the end.
> > > >
> > > >
> > > > Explicit synchronization is the future of graphics and media.  At
> > > > least, that seems to be the consensus among all the graphics people
> > > > I've talked to.  I had a chat with one of the lead Android graphics
> > > > engineers recently who told me that doing explicit sync from the
> start
> > > > was one of the best engineering decisions Android ever made.  It's
> > > > also the direction being taken by more modern APIs such as Vulkan.
> > > >
> > > >
> > > > ## What are implicit and explicit synchronization?
> > > >
> > > > For those that aren't familiar with this space, GPUs, media encoder=
s,
> > > > etc. are massively parallel and synchronization of some form is
> > > > required to ensure that everything happens in the right order and
> > > > avoid data races.  Implicit synchronization is when bits of work (3=
D,
> > > > compute, video encode, etc.) are implicitly based on the absolute
> > > > CPU-time order in which API calls occur.  Explicit synchronization =
is
> > > > when the client (whatever that means in any given context) provides
> > > > the dependency graph explicitly via some sort of synchronization
> > > > primitives.  If you're still confused, consider the following
> > > > examples:
> > > >
> > > > With OpenGL and EGL, almost everything is implicit sync.  Say you
> have
> > > > two OpenGL contexts sharing an image where one writes to it and the
> > > > other textures from it.  The way the OpenGL spec works, the client
> has
> > > > to make the API calls to render to the image before (in CPU time) i=
t
> > > > makes the API calls which texture from the image.  As long as it do=
es
> > > > this (and maybe inserts a glFlush?), the driver will ensure that th=
e
> > > > rendering completes before the texturing happens and you get correc=
t
> > > > contents.
> > > >
> > > > Implicit synchronization can also happen across processes.  Wayland=
,
> > > > for instance, is currently built on implicit sync where the client
> > > > does their rendering and then does a hand-off (via
> wl_surface::commit)
> > > > to tell the compositor it's done at which point the compositor can
> now
> > > > texture from the surface.  The hand-off ensures that the client's
> > > > OpenGL API calls happen before the server's OpenGL API calls.
> > > >
> > > > A good example of explicit synchronization is the Vulkan API.  Ther=
e,
> > > > a client (or multiple clients) can simultaneously build command
> > > > buffers in different threads where one of those command buffers
> > > > renders to an image and the other textures from it and then submit
> > > > both of them at the same time with instructions to the driver for
> > > > which order to execute them in.  The execution order is described v=
ia
> > > > the VkSemaphore primitive.  With the new VK_KHR_timeline_semaphore
> > > > extension, you can even submit the work which does the texturing
> > > > BEFORE the work which does the rendering and the driver will sort i=
t
> > > > out.
> > > >
> > > > The #1 problem with implicit synchronization (which explicit solves=
)
> > > > is that it leads to a lot of over-synchronization both in client
> space
> > > > and in driver/device space.  The client has to synchronize a lot mo=
re
> > > > because it has to ensure that the API calls happen in a particular
> > > > order.  The driver/device have to synchronize a lot more because th=
ey
> > > > never know what is going to end up being a synchronization point as
> an
> > > > API call on another thread/process may occur at any time.  As we mo=
ve
> > > > to more and more multi-threaded programming this synchronization (o=
n
> > > > the client-side especially) becomes more and more painful.
> > > >
> > > >
> > > > ## Current status in Linux
> > > >
> > > > Implicit synchronization in Linux works via a the kernel's internal
> > > > dma_buf and dma_fence data structures.  A dma_fence is a tiny objec=
t
> > > > which represents the "done" status for some bit of work.  Typically=
,
> > > > dma_fences are created as a by-product of someone submitting some b=
it
> > > > of work (say, 3D rendering) to the kernel.  The dma_buf object has =
a
> > > > set of dma_fences on it representing shared (read) and exclusive
> > > > (write) access to the object.  When work is submitted which, for
> > > > instance renders to the dma_buf, it's queued waiting on all the
> fences
> > > > on the dma_buf and and a dma_fence is created representing the end =
of
> > > > said rendering work and it's installed as the dma_buf's exclusive
> > > > fence.  This way, the kernel can manage all its internal queues (3D
> > > > rendering, display, video encode, etc.) and know which things to
> > > > submit in what order.
> > > >
> > > > For the last few years, we've had sync_file in the kernel and it's
> > > > plumbed into some drivers.  A sync_file is just a wrapper around a
> > > > single dma_fence.  A sync_file is typically created as a by-product
> of
> > > > submitting work (3D, compute, etc.) to the kernel and is signaled
> when
> > > > that work completes.  When a sync_file is created, it is guaranteed
> by
> > > > the kernel that it will become signaled in finite time and, once it=
's
> > > > signaled, it remains signaled for the rest of time.  A sync_file is
> > > > represented in UAPIs as a file descriptor and can be used with norm=
al
> > > > file APIs such as dup().  It can be passed into another UAPI which
> > > > does some bit of queue'd work and the submitted work will wait for
> the
> > > > sync_file to be triggered before executing.  A sync_file also
> supports
> > > > poll() if  you want to wait on it manually.
> > > >
> > > > Unfortunately, sync_file is not broadly used and not all kernel GPU
> > > > drivers support it.  Here's a very quick overview of my understandi=
ng
> > > > of the status of various components (I don't know the status of
> > > > anything in the media world):
> > > >
> > > >  - Vulkan: Explicit synchronization all the way but we have to go
> > > > implicit as soon as we interact with a window-system.  Vulkan has
> APIs
> > > > to import/export sync_files to/from it's VkSemaphore and VkFence
> > > > synchronization primitives.
> > > >  - OpenGL: Implicit all the way.  There are some EGL extensions to
> > > > enable some forms of explicit sync via sync_file but OpenGL itself =
is
> > > > still implicit.
> > > >  - Wayland: Currently depends on implicit sync in the kernel
> (accessed
> > > > via EGL/OpenGL).  There is an unstable extension to allow passing
> > > > sync_files around but it's questionable how useful it is right now
> > > > (more on that later).
> > > >  - X11: With present, it has these "explicit" fence objects but
> > > > they're always a shmfence which lets the X server and client do a
> > > > userspace CPU-side hand-off without going over the socket (and
> > > > round-tripping through the kernel).  However, the only thing that
> > > > fence does is order the OpenGL API calls in the client and server a=
nd
> > > > the real synchronization is still implicit.
> > > >  - linux/i915/gem: Fully supports using sync_file or syncobj for
> explicit
> > > > sync.
> > > >  - linux/amdgpu: Supports sync_file and syncobj but it still
> > > > implicitly syncs sometimes due to it's internal memory residency
> > > > handling which can lead to over-synchronization.
> > > >  - KMS: Implicit sync all the way.  There are no KMS APIs which tak=
e
> > > > explicit sync primitives.
> > >
> > > Correction:  Apparently, I missed some things.  If you use atomic, KM=
S
> > > does have explicit in- and out-fences.  Non-atomic users (e.g. X11)
> > > are still in trouble but most Wayland compositors use atomic these
> > > days
> > >
> > > >  - v4l: ???
> > > >  - gstreamer: ???
> > > >  - Media APIs such as vaapi etc.:  ???
> >
> > GStreamer is consumer for V4L2, VAAPI and other stuff. Using
> asynchronous buffer
> > synchronisation is something we do already with GL (even if limited). W=
e
> place
> > GLSync object in the pipeline and attach that on related GstBuffer. We
> wait on
> > these GLSync as late as possible (or superseed the sync if we queue mor=
e
> work
> > into the same GL context). That requires a special mode of operation of
> course.
> > We don't usually like making lazy blocking call implicit, as it tends t=
o
> cause
> > random issues. If we need to wait, we think it's better to wait int he
> module
> > that is responsible, so in general, we try to negotiate and fallback
> locally
> > (it's plugin base, so this can be really messy otherwise).
> >
> > So basically this problem needs to be solved in V4L2, VAAPI and other
> lower
> > level APIs first. We need API that provides us these fence (in or out),
> and then
> > we can consider using them. For V4L2, there was an attempt, but it was =
a
> bit of
> > a miss-fit. Your proposal could work, need to be tested I guess, but it
> does not
> > solve some of other issues that was discussed. Notably for camera
> capture, were
> > the HW timestamp is capture about at the same time the frame is ready.
> But the
> > timestamp is not part of the paylaod, so you need an entire API
> asynchronously
> > deliver that metadata. It's the biggest pain point I've found, such an
> API would
> > be quite invasive or if made really generic, might just never be adopte=
d
> widely
> > enough.
>
> Another issue is that V4L2 doesn't offer any guarantee on job ordering.
> When you queue multiple buffers for camera capture for instance, you
> don't know until capture complete in which buffer the frame has been
> captured. In the normal case buffers are processed in sequence, but if
> an error occurs during capture, they can be recycled internally and put
> to the back of the queue. Unless I'm mistaken, this problem also exists
> with stateful codecs. And if you don't know in advance which buffer you
> will receive from the device, the usefulness of fences becomes very
> questionable :-)
>
> > There is other elements that would implement fencing, notably kmssink,
> but no
> > one actually dared porting it to atomic KMS, so clearly there is very
> little
> > comunity interest. glimagsink could clearly benifit. Right now if we
> import a
> > DMABuf, and that this DMAbuf is used for render, a implicit fence is
> attached,
> > which we are unaware. Philippe Zabbel is working on a patch, so V4L2
> QBUF would
> > wait, but waiting in QBUF is not allowed if O_NONBLOCK was set (which
> GStreamer
> > uses), so then the operation will just fail where it worked before
> (breaking
> > userspace). If it was an explcit fence, we could handle that in GStream=
er
> > cleanly as we do for new APIs.
> >
> > > > ## Chicken and egg problems
> > > >
> > > > Ok, this is where it starts getting depressing.  I made the claim
> > > > above that Wayland has an explicit synchronization protocol that's =
of
> > > > questionable usefulness.  I would claim that basically any bit of
> > > > plumbing we do through window systems is currently of questionable
> > > > usefulness.  Why?
> > > >
> > > > From my perspective, as a Vulkan driver developer, I have to deal
> with
> > > > the fact that Vulkan is an explicit sync API but Wayland and X11
> > > > aren't.  Unfortunately, the Wayland extension solves zero problems
> for
> > > > me because I can't really use it unless it's implemented in all of
> the
> > > > compositors.  Until every Wayland compositor I care about my users
> > > > being able to use (which is basically all of them) supports the
> > > > extension, I have to continue carry around my pile of hacks to keep
> > > > implicit sync and Vulkan working nicely together.
> > > >
> > > > From the perspective of a Wayland compositor (I used to play in thi=
s
> > > > space), they'd love to implement the new explicit sync extension bu=
t
> > > > can't.  Sure, they could wire up the extension, but the moment they
> go
> > > > to flip a client buffer to the screen directly, they discover that
> KMS
> > > > doesn't support any explicit sync APIs.
> > >
> > > As per the above correction, Wayland compositors aren't nearly as bad
> > > off as I initially thought.  There may still be weird screen capture
> > > cases but the normal cases of compositing and displaying via
> > > KMS/atomic should be in reasonably good shape.
> > >
> > > > So, yes, they can technically
> > > > implement the extension assuming the EGL stack they're running on h=
as
> > > > the sync_file extensions but any client buffers which come in using
> > > > the explicit sync Wayland extension have to be composited and can't
> be
> > > > scanned out directly.  As a 3D driver developer, I absolutely don't
> > > > want compositors doing that because my users will complain about
> > > > performance issues due to the extra blit.
> > > >
> > > > Ok, so let's say we get KMS wired up with implicit sync.  That solv=
es
> > > > all our problems, right?  It does, right up until someone decides
> that
> > > > they wan to screen capture their Wayland session via some hardware
> > > > media encoder that doesn't support explicit sync.  Now we have to
> > > > plumb it all the way through the media stack, gstreamer, etc.  Grea=
t,
> > > > so let's do that!  Oh, but gstreamer won't want to plumb it through
> > > > until they're guaranteed that they can use explicit sync when
> > > > displaying on X11 or Wayland.  Are you seeing the problem?
> > > >
> > > > To make matters worse, since most things are doing implicit
> > > > synchronization today, it's really easy to get your explicit
> > > > synchronization wrong and never notice.  If you forget to pass a
> > > > sync_file into one place (say you never notice KMS doesn't support
> > > > them), it will probably work anyway thanks to all the implicit sync
> > > > that's going on elsewhere.
> > > >
> > > > So, clearly, we all need to go write piles of code that we can't
> > > > actually properly test until everyone else has written their piece
> and
> > > > then we use explicit sync if and only if all components support it.
> > > > Really?  We're going to do multiple years of development and then
> just
> > > > hope it works when we finally flip the switch?  That doesn't sound
> > > > like a good plan to me.
> > > >
> > > >
> > > > ## A proposal: Implicit and explicit sync together
> > > >
> > > > How to solve all these chicken-and-egg problems is something I've
> been
> > > > giving quite a bit of thought (and talking with many others about) =
in
> > > > the last couple of years.  One motivation for this is that we have =
to
> > > > deal with a mismatch in Vulkan.  Another motivation is that I'm
> > > > becoming increasingly unhappy with the way that synchronization,
> > > > memory residency, and command submission are inherently intertwined
> in
> > > > i915 and would like to break things apart.  Towards that end, I hav=
e
> > > > an actual proposal.
> > > >
> > > > A couple weeks ago, I sent a series of patches to the dri-devel
> > > > mailing list which adds a pair of new ioctls to dma-buf which allow
> > > > userspace to manually import or export a sync_file from a dma-buf.
> > > > The idea is that something like a Wayland compositor can switch to
> > > > 100% explicit sync internally once the ioctl is available.  If it
> gets
> > > > buffers in from a client that doesn't use the explicit sync
> extension,
> > > > it can pull a sync_file from the dma-buf and use that exactly as it
> > > > would a sync_file passed via the explicit sync extension.  When it
> > > > goes to scan out a user buffer and discovers that KMS doesn't accep=
t
> > > > sync_files (or if it tries to use that pesky media encoder no one h=
as
> > > > converted), it can take it's sync_file for display and stuff it int=
o
> > > > the dma-buf before handing it to KMS.
> > > >
> > > > Along with the kernel patches, I've also implemented support for th=
is
> > > > in the Vulkan WSI code used by ANV and RADV.  With those patches, t=
he
> > > > only requirement on the Vulkan drivers is that you be able to expor=
t
> > > > any VkSemaphore as a sync_file and temporarily import a sync_file
> into
> > > > any VkFence or VkSemaphore.  As long as that works, the core Vulkan
> > > > driver only ever sees explicit synchronization via sync_file.  The
> WSI
> > > > code uses these new ioctls to translate the implicit sync of X11 an=
d
> > > > Wayland to the explicit sync the Vulkan driver wants.
> > > >
> > > > I'm hoping (and here's where I want a sanity check) that a simple A=
PI
> > > > like this will allow us to finally start moving the Linux ecosystem
> > > > over to explicit synchronization one piece at a time in a way that'=
s
> > > > actually correct.  (No Wayland explicit sync with compositors hopin=
g
> > > > KMS magically works even though it doesn't have a sync_file API.)
> > > > Once some pieces in the ecosystem start moving, there will be
> > > > motivation to start moving others and maybe we can actually build t=
he
> > > > momentum to get most everything converted.
> > > >
> > > > For reference, you can find the kernel RFC patches and mesa MR here=
:
> > > >
> > > >
> https://lists.freedesktop.org/archives/dri-devel/2020-March/258833.html
> > > >
> > > > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4037
> > > >
> > > > At this point, I welcome your thoughts, comments, objections, and
> > > > maybe even help/review. :-)
> > > >
> > > > --Jason Ekstrand
> >
>
> --
> Regards,
>
> Laurent Pinchart
> _______________________________________________
> wayland-devel mailing list
> wayland-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/wayland-devel
>

--000000000000f9ca0305a0f8550d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jason,<div><br></div><div>I&#39;ve been wrestling with =
the sync problems in Wayland some time ago,=C2=A0but only with regards to 3=
D drivers.</div><div><br></div><div>The guarantee given by the GL/GLES spec=
 is limited to a single graphics context. If the same buffer is accessed by=
 2 contexts the outcome is unspecified. The cross-context and cross-process=
 synchronisation is not guaranteed.=C2=A0It happens to work on Mesa, becaus=
e the read/write locking is implemented in the kernel space, but it didn&#3=
9;t work on Broadcom driver, which has read-write interlocks in user space.=
</div><div><br></div><div>=C2=A0A Vulkan client makes it even worse because=
 of conflicting requirements: Vulkan&#39;s=C2=A0vkQueuePresentKHR() passes =
in a number of semaphores but disallows waiting. Wayland WSI requires=C2=A0=
wl_surface_commit() to be called from vkQueuePresentKHR() which does requir=
e a wait, unless a synchronisation primitive representing Vulkan samaphores=
=C2=A0is passed between Vulkan client and the compositor.</div><div><br></d=
iv><div>The most troublesome part was Wayland buffer release mechanism, as =
it only involves a CPU signalling over Wayland IPC, without any 3D driver i=
nvolvement. The choices were: explicit synchronisation extension or a buffe=
r copy in the compositor (i.e. compositor textures from the copy, so the cl=
ient can re-write the original), or some=C2=A0implicit synchronisation in k=
ernel space (but that wasn&#39;t an option in Broadcom driver).</div><div><=
br></div><div>With regards to V4L2, I believe it could easily work the same=
 way as 3D drivers, i.e. pass a buffer+fence pair to the next stage. The en=
code always succeeds, but for capture or decode, the main problem is the un=
certain outcome, I believe? If we&#39;re fine with rendering or displaying =
an occasional broken frame, then buffer+fence pair would work too. The brok=
en frame will go into the pipeline, but application can drain the pipeline =
and start over once the capture works again.<br></div><div><br></div><div>T=
o answer some points raised by Laurent (although I&#39;m unfamiliar with th=
e camera drivers):</div><div><br></div><div>&gt; you=C2=A0don&#39;t know un=
til capture complete in which buffer the frame has been=C2=A0captured<br></=
div><div>Surely you do, you only don&#39;t know in advance if the capture w=
ill be successful</div><div><br></div><div>&gt; but if=C2=A0an error occurs=
 during capture, they can be recycled internally and put to the back of the=
 queue.<br></div><div>That would have to change in order to use explicit sy=
nchronisation. Every started capture becomes immediately available as a buf=
fer+fence pair. Fence is signalled once the capture is finished (successful=
ly or otherwise). The buffer must not be reused until it&#39;s released, po=
ssibly with another fence - in that case the buffer must not be reused unti=
l the release fence is signalled.=C2=A0</div><div><br></div><div>Cheers,</d=
iv><div>Tomek</div><div></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, 16 Mar 2020 at 10:20, Laurent Pinchar=
t &lt;<a href=3D"mailto:laurent.pinchart@ideasonboard.com" target=3D"_blank=
">laurent.pinchart@ideasonboard.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On Wed, Mar 11, 2020 at 04:18:55PM -0400=
, Nicolas Dufresne wrote:<br>
&gt; (I know I&#39;m going to be spammed by so many mailing list ...)<br>
&gt; <br>
&gt; Le mercredi 11 mars 2020 =C3=A0 14:21 -0500, Jason Ekstrand a =C3=A9cr=
it :<br>
&gt; &gt; On Wed, Mar 11, 2020 at 12:31 PM Jason Ekstrand &lt;<a href=3D"ma=
ilto:jason@jlekstrand.net" target=3D"_blank">jason@jlekstrand.net</a>&gt; w=
rote:<br>
&gt; &gt; &gt; All,<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Sorry for casting such a broad net with this one. I&#39;m su=
re most people<br>
&gt; &gt; &gt; who reply will get at least one mailing list rejection.=C2=
=A0 However, this<br>
&gt; &gt; &gt; is an issue that affects a LOT of components and that&#39;s =
why it&#39;s<br>
&gt; &gt; &gt; thorny to begin with.=C2=A0 Please pardon the length of this=
 e-mail as<br>
&gt; &gt; &gt; well; I promise there&#39;s a concrete point/proposal at the=
 end.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Explicit synchronization is the future of graphics and media=
.=C2=A0 At<br>
&gt; &gt; &gt; least, that seems to be the consensus among all the graphics=
 people<br>
&gt; &gt; &gt; I&#39;ve talked to.=C2=A0 I had a chat with one of the lead =
Android graphics<br>
&gt; &gt; &gt; engineers recently who told me that doing explicit sync from=
 the start<br>
&gt; &gt; &gt; was one of the best engineering decisions Android ever made.=
=C2=A0 It&#39;s<br>
&gt; &gt; &gt; also the direction being taken by more modern APIs such as V=
ulkan.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; ## What are implicit and explicit synchronization?<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; For those that aren&#39;t familiar with this space, GPUs, me=
dia encoders,<br>
&gt; &gt; &gt; etc. are massively parallel and synchronization of some form=
 is<br>
&gt; &gt; &gt; required to ensure that everything happens in the right orde=
r and<br>
&gt; &gt; &gt; avoid data races.=C2=A0 Implicit synchronization is when bit=
s of work (3D,<br>
&gt; &gt; &gt; compute, video encode, etc.) are implicitly based on the abs=
olute<br>
&gt; &gt; &gt; CPU-time order in which API calls occur.=C2=A0 Explicit sync=
hronization is<br>
&gt; &gt; &gt; when the client (whatever that means in any given context) p=
rovides<br>
&gt; &gt; &gt; the dependency graph explicitly via some sort of synchroniza=
tion<br>
&gt; &gt; &gt; primitives.=C2=A0 If you&#39;re still confused, consider the=
 following<br>
&gt; &gt; &gt; examples:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; With OpenGL and EGL, almost everything is implicit sync.=C2=
=A0 Say you have<br>
&gt; &gt; &gt; two OpenGL contexts sharing an image where one writes to it =
and the<br>
&gt; &gt; &gt; other textures from it.=C2=A0 The way the OpenGL spec works,=
 the client has<br>
&gt; &gt; &gt; to make the API calls to render to the image before (in CPU =
time) it<br>
&gt; &gt; &gt; makes the API calls which texture from the image.=C2=A0 As l=
ong as it does<br>
&gt; &gt; &gt; this (and maybe inserts a glFlush?), the driver will ensure =
that the<br>
&gt; &gt; &gt; rendering completes before the texturing happens and you get=
 correct<br>
&gt; &gt; &gt; contents.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Implicit synchronization can also happen across processes.=
=C2=A0 Wayland,<br>
&gt; &gt; &gt; for instance, is currently built on implicit sync where the =
client<br>
&gt; &gt; &gt; does their rendering and then does a hand-off (via wl_surfac=
e::commit)<br>
&gt; &gt; &gt; to tell the compositor it&#39;s done at which point the comp=
ositor can now<br>
&gt; &gt; &gt; texture from the surface.=C2=A0 The hand-off ensures that th=
e client&#39;s<br>
&gt; &gt; &gt; OpenGL API calls happen before the server&#39;s OpenGL API c=
alls.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; A good example of explicit synchronization is the Vulkan API=
.=C2=A0 There,<br>
&gt; &gt; &gt; a client (or multiple clients) can simultaneously build comm=
and<br>
&gt; &gt; &gt; buffers in different threads where one of those command buff=
ers<br>
&gt; &gt; &gt; renders to an image and the other textures from it and then =
submit<br>
&gt; &gt; &gt; both of them at the same time with instructions to the drive=
r for<br>
&gt; &gt; &gt; which order to execute them in.=C2=A0 The execution order is=
 described via<br>
&gt; &gt; &gt; the VkSemaphore primitive.=C2=A0 With the new VK_KHR_timelin=
e_semaphore<br>
&gt; &gt; &gt; extension, you can even submit the work which does the textu=
ring<br>
&gt; &gt; &gt; BEFORE the work which does the rendering and the driver will=
 sort it<br>
&gt; &gt; &gt; out.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; The #1 problem with implicit synchronization (which explicit=
 solves)<br>
&gt; &gt; &gt; is that it leads to a lot of over-synchronization both in cl=
ient space<br>
&gt; &gt; &gt; and in driver/device space.=C2=A0 The client has to synchron=
ize a lot more<br>
&gt; &gt; &gt; because it has to ensure that the API calls happen in a part=
icular<br>
&gt; &gt; &gt; order.=C2=A0 The driver/device have to synchronize a lot mor=
e because they<br>
&gt; &gt; &gt; never know what is going to end up being a synchronization p=
oint as an<br>
&gt; &gt; &gt; API call on another thread/process may occur at any time.=C2=
=A0 As we move<br>
&gt; &gt; &gt; to more and more multi-threaded programming this synchroniza=
tion (on<br>
&gt; &gt; &gt; the client-side especially) becomes more and more painful.<b=
r>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; ## Current status in Linux<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Implicit synchronization in Linux works via a the kernel&#39=
;s internal<br>
&gt; &gt; &gt; dma_buf and dma_fence data structures.=C2=A0 A dma_fence is =
a tiny object<br>
&gt; &gt; &gt; which represents the &quot;done&quot; status for some bit of=
 work.=C2=A0 Typically,<br>
&gt; &gt; &gt; dma_fences are created as a by-product of someone submitting=
 some bit<br>
&gt; &gt; &gt; of work (say, 3D rendering) to the kernel.=C2=A0 The dma_buf=
 object has a<br>
&gt; &gt; &gt; set of dma_fences on it representing shared (read) and exclu=
sive<br>
&gt; &gt; &gt; (write) access to the object.=C2=A0 When work is submitted w=
hich, for<br>
&gt; &gt; &gt; instance renders to the dma_buf, it&#39;s queued waiting on =
all the fences<br>
&gt; &gt; &gt; on the dma_buf and and a dma_fence is created representing t=
he end of<br>
&gt; &gt; &gt; said rendering work and it&#39;s installed as the dma_buf&#3=
9;s exclusive<br>
&gt; &gt; &gt; fence.=C2=A0 This way, the kernel can manage all its interna=
l queues (3D<br>
&gt; &gt; &gt; rendering, display, video encode, etc.) and know which thing=
s to<br>
&gt; &gt; &gt; submit in what order.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; For the last few years, we&#39;ve had sync_file in the kerne=
l and it&#39;s<br>
&gt; &gt; &gt; plumbed into some drivers.=C2=A0 A sync_file is just a wrapp=
er around a<br>
&gt; &gt; &gt; single dma_fence.=C2=A0 A sync_file is typically created as =
a by-product of<br>
&gt; &gt; &gt; submitting work (3D, compute, etc.) to the kernel and is sig=
naled when<br>
&gt; &gt; &gt; that work completes.=C2=A0 When a sync_file is created, it i=
s guaranteed by<br>
&gt; &gt; &gt; the kernel that it will become signaled in finite time and, =
once it&#39;s<br>
&gt; &gt; &gt; signaled, it remains signaled for the rest of time.=C2=A0 A =
sync_file is<br>
&gt; &gt; &gt; represented in UAPIs as a file descriptor and can be used wi=
th normal<br>
&gt; &gt; &gt; file APIs such as dup().=C2=A0 It can be passed into another=
 UAPI which<br>
&gt; &gt; &gt; does some bit of queue&#39;d work and the submitted work wil=
l wait for the<br>
&gt; &gt; &gt; sync_file to be triggered before executing.=C2=A0 A sync_fil=
e also supports<br>
&gt; &gt; &gt; poll() if=C2=A0 you want to wait on it manually.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Unfortunately, sync_file is not broadly used and not all ker=
nel GPU<br>
&gt; &gt; &gt; drivers support it.=C2=A0 Here&#39;s a very quick overview o=
f my understanding<br>
&gt; &gt; &gt; of the status of various components (I don&#39;t know the st=
atus of<br>
&gt; &gt; &gt; anything in the media world):<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 - Vulkan: Explicit synchronization all the way but we =
have to go<br>
&gt; &gt; &gt; implicit as soon as we interact with a window-system.=C2=A0 =
Vulkan has APIs<br>
&gt; &gt; &gt; to import/export sync_files to/from it&#39;s VkSemaphore and=
 VkFence<br>
&gt; &gt; &gt; synchronization primitives.<br>
&gt; &gt; &gt;=C2=A0 - OpenGL: Implicit all the way.=C2=A0 There are some E=
GL extensions to<br>
&gt; &gt; &gt; enable some forms of explicit sync via sync_file but OpenGL =
itself is<br>
&gt; &gt; &gt; still implicit.<br>
&gt; &gt; &gt;=C2=A0 - Wayland: Currently depends on implicit sync in the k=
ernel (accessed<br>
&gt; &gt; &gt; via EGL/OpenGL).=C2=A0 There is an unstable extension to all=
ow passing<br>
&gt; &gt; &gt; sync_files around but it&#39;s questionable how useful it is=
 right now<br>
&gt; &gt; &gt; (more on that later).<br>
&gt; &gt; &gt;=C2=A0 - X11: With present, it has these &quot;explicit&quot;=
 fence objects but<br>
&gt; &gt; &gt; they&#39;re always a shmfence which lets the X server and cl=
ient do a<br>
&gt; &gt; &gt; userspace CPU-side hand-off without going over the socket (a=
nd<br>
&gt; &gt; &gt; round-tripping through the kernel).=C2=A0 However, the only =
thing that<br>
&gt; &gt; &gt; fence does is order the OpenGL API calls in the client and s=
erver and<br>
&gt; &gt; &gt; the real synchronization is still implicit.<br>
&gt; &gt; &gt;=C2=A0 - linux/i915/gem: Fully supports using sync_file or sy=
ncobj for explicit<br>
&gt; &gt; &gt; sync.<br>
&gt; &gt; &gt;=C2=A0 - linux/amdgpu: Supports sync_file and syncobj but it =
still<br>
&gt; &gt; &gt; implicitly syncs sometimes due to it&#39;s internal memory r=
esidency<br>
&gt; &gt; &gt; handling which can lead to over-synchronization.<br>
&gt; &gt; &gt;=C2=A0 - KMS: Implicit sync all the way.=C2=A0 There are no K=
MS APIs which take<br>
&gt; &gt; &gt; explicit sync primitives.<br>
&gt; &gt; <br>
&gt; &gt; Correction:=C2=A0 Apparently, I missed some things.=C2=A0 If you =
use atomic, KMS<br>
&gt; &gt; does have explicit in- and out-fences.=C2=A0 Non-atomic users (e.=
g. X11)<br>
&gt; &gt; are still in trouble but most Wayland compositors use atomic thes=
e<br>
&gt; &gt; days<br>
&gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 - v4l: ???<br>
&gt; &gt; &gt;=C2=A0 - gstreamer: ???<br>
&gt; &gt; &gt;=C2=A0 - Media APIs such as vaapi etc.:=C2=A0 ???<br>
&gt; <br>
&gt; GStreamer is consumer for V4L2, VAAPI and other stuff. Using asynchron=
ous buffer<br>
&gt; synchronisation is something we do already with GL (even if limited). =
We place<br>
&gt; GLSync object in the pipeline and attach that on related GstBuffer. We=
 wait on<br>
&gt; these GLSync as late as possible (or superseed the sync if we queue mo=
re work<br>
&gt; into the same GL context). That requires a special mode of operation o=
f course.<br>
&gt; We don&#39;t usually like making lazy blocking call implicit, as it te=
nds to cause<br>
&gt; random issues. If we need to wait, we think it&#39;s better to wait in=
t he module<br>
&gt; that is responsible, so in general, we try to negotiate and fallback l=
ocally<br>
&gt; (it&#39;s plugin base, so this can be really messy otherwise).<br>
&gt; <br>
&gt; So basically this problem needs to be solved in V4L2, VAAPI and other =
lower<br>
&gt; level APIs first. We need API that provides us these fence (in or out)=
, and then<br>
&gt; we can consider using them. For V4L2, there was an attempt, but it was=
 a bit of<br>
&gt; a miss-fit. Your proposal could work, need to be tested I guess, but i=
t does not<br>
&gt; solve some of other issues that was discussed. Notably for camera capt=
ure, were<br>
&gt; the HW timestamp is capture about at the same time the frame is ready.=
 But the<br>
&gt; timestamp is not part of the paylaod, so you need an entire API asynch=
ronously<br>
&gt; deliver that metadata. It&#39;s the biggest pain point I&#39;ve found,=
 such an API would<br>
&gt; be quite invasive or if made really generic, might just never be adopt=
ed widely<br>
&gt; enough.<br>
<br>
Another issue is that V4L2 doesn&#39;t offer any guarantee on job ordering.=
<br>
When you queue multiple buffers for camera capture for instance, you<br>
don&#39;t know until capture complete in which buffer the frame has been<br=
>
captured. In the normal case buffers are processed in sequence, but if<br>
an error occurs during capture, they can be recycled internally and put<br>
to the back of the queue. Unless I&#39;m mistaken, this problem also exists=
<br>
with stateful codecs. And if you don&#39;t know in advance which buffer you=
<br>
will receive from the device, the usefulness of fences becomes very<br>
questionable :-)<br>
<br>
&gt; There is other elements that would implement fencing, notably kmssink,=
 but no<br>
&gt; one actually dared porting it to atomic KMS, so clearly there is very =
little<br>
&gt; comunity interest. glimagsink could clearly benifit. Right now if we i=
mport a<br>
&gt; DMABuf, and that this DMAbuf is used for render, a implicit fence is a=
ttached,<br>
&gt; which we are unaware. Philippe Zabbel is working on a patch, so V4L2 Q=
BUF would<br>
&gt; wait, but waiting in QBUF is not allowed if O_NONBLOCK was set (which =
GStreamer<br>
&gt; uses), so then the operation will just fail where it worked before (br=
eaking<br>
&gt; userspace). If it was an explcit fence, we could handle that in GStrea=
mer<br>
&gt; cleanly as we do for new APIs.<br>
&gt; <br>
&gt; &gt; &gt; ## Chicken and egg problems<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Ok, this is where it starts getting depressing.=C2=A0 I made=
 the claim<br>
&gt; &gt; &gt; above that Wayland has an explicit synchronization protocol =
that&#39;s of<br>
&gt; &gt; &gt; questionable usefulness.=C2=A0 I would claim that basically =
any bit of<br>
&gt; &gt; &gt; plumbing we do through window systems is currently of questi=
onable<br>
&gt; &gt; &gt; usefulness.=C2=A0 Why?<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; From my perspective, as a Vulkan driver developer, I have to=
 deal with<br>
&gt; &gt; &gt; the fact that Vulkan is an explicit sync API but Wayland and=
 X11<br>
&gt; &gt; &gt; aren&#39;t.=C2=A0 Unfortunately, the Wayland extension solve=
s zero problems for<br>
&gt; &gt; &gt; me because I can&#39;t really use it unless it&#39;s impleme=
nted in all of the<br>
&gt; &gt; &gt; compositors.=C2=A0 Until every Wayland compositor I care abo=
ut my users<br>
&gt; &gt; &gt; being able to use (which is basically all of them) supports =
the<br>
&gt; &gt; &gt; extension, I have to continue carry around my pile of hacks =
to keep<br>
&gt; &gt; &gt; implicit sync and Vulkan working nicely together.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; From the perspective of a Wayland compositor (I used to play=
 in this<br>
&gt; &gt; &gt; space), they&#39;d love to implement the new explicit sync e=
xtension but<br>
&gt; &gt; &gt; can&#39;t.=C2=A0 Sure, they could wire up the extension, but=
 the moment they go<br>
&gt; &gt; &gt; to flip a client buffer to the screen directly, they discove=
r that KMS<br>
&gt; &gt; &gt; doesn&#39;t support any explicit sync APIs.<br>
&gt; &gt; <br>
&gt; &gt; As per the above correction, Wayland compositors aren&#39;t nearl=
y as bad<br>
&gt; &gt; off as I initially thought.=C2=A0 There may still be weird screen=
 capture<br>
&gt; &gt; cases but the normal cases of compositing and displaying via<br>
&gt; &gt; KMS/atomic should be in reasonably good shape.<br>
&gt; &gt; <br>
&gt; &gt; &gt; So, yes, they can technically<br>
&gt; &gt; &gt; implement the extension assuming the EGL stack they&#39;re r=
unning on has<br>
&gt; &gt; &gt; the sync_file extensions but any client buffers which come i=
n using<br>
&gt; &gt; &gt; the explicit sync Wayland extension have to be composited an=
d can&#39;t be<br>
&gt; &gt; &gt; scanned out directly.=C2=A0 As a 3D driver developer, I abso=
lutely don&#39;t<br>
&gt; &gt; &gt; want compositors doing that because my users will complain a=
bout<br>
&gt; &gt; &gt; performance issues due to the extra blit.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Ok, so let&#39;s say we get KMS wired up with implicit sync.=
=C2=A0 That solves<br>
&gt; &gt; &gt; all our problems, right?=C2=A0 It does, right up until someo=
ne decides that<br>
&gt; &gt; &gt; they wan to screen capture their Wayland session via some ha=
rdware<br>
&gt; &gt; &gt; media encoder that doesn&#39;t support explicit sync.=C2=A0 =
Now we have to<br>
&gt; &gt; &gt; plumb it all the way through the media stack, gstreamer, etc=
.=C2=A0 Great,<br>
&gt; &gt; &gt; so let&#39;s do that!=C2=A0 Oh, but gstreamer won&#39;t want=
 to plumb it through<br>
&gt; &gt; &gt; until they&#39;re guaranteed that they can use explicit sync=
 when<br>
&gt; &gt; &gt; displaying on X11 or Wayland.=C2=A0 Are you seeing the probl=
em?<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; To make matters worse, since most things are doing implicit<=
br>
&gt; &gt; &gt; synchronization today, it&#39;s really easy to get your expl=
icit<br>
&gt; &gt; &gt; synchronization wrong and never notice.=C2=A0 If you forget =
to pass a<br>
&gt; &gt; &gt; sync_file into one place (say you never notice KMS doesn&#39=
;t support<br>
&gt; &gt; &gt; them), it will probably work anyway thanks to all the implic=
it sync<br>
&gt; &gt; &gt; that&#39;s going on elsewhere.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; So, clearly, we all need to go write piles of code that we c=
an&#39;t<br>
&gt; &gt; &gt; actually properly test until everyone else has written their=
 piece and<br>
&gt; &gt; &gt; then we use explicit sync if and only if all components supp=
ort it.<br>
&gt; &gt; &gt; Really?=C2=A0 We&#39;re going to do multiple years of develo=
pment and then just<br>
&gt; &gt; &gt; hope it works when we finally flip the switch?=C2=A0 That do=
esn&#39;t sound<br>
&gt; &gt; &gt; like a good plan to me.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; ## A proposal: Implicit and explicit sync together<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; How to solve all these chicken-and-egg problems is something=
 I&#39;ve been<br>
&gt; &gt; &gt; giving quite a bit of thought (and talking with many others =
about) in<br>
&gt; &gt; &gt; the last couple of years.=C2=A0 One motivation for this is t=
hat we have to<br>
&gt; &gt; &gt; deal with a mismatch in Vulkan.=C2=A0 Another motivation is =
that I&#39;m<br>
&gt; &gt; &gt; becoming increasingly unhappy with the way that synchronizat=
ion,<br>
&gt; &gt; &gt; memory residency, and command submission are inherently inte=
rtwined in<br>
&gt; &gt; &gt; i915 and would like to break things apart.=C2=A0 Towards tha=
t end, I have<br>
&gt; &gt; &gt; an actual proposal.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; A couple weeks ago, I sent a series of patches to the dri-de=
vel<br>
&gt; &gt; &gt; mailing list which adds a pair of new ioctls to dma-buf whic=
h allow<br>
&gt; &gt; &gt; userspace to manually import or export a sync_file from a dm=
a-buf.<br>
&gt; &gt; &gt; The idea is that something like a Wayland compositor can swi=
tch to<br>
&gt; &gt; &gt; 100% explicit sync internally once the ioctl is available.=
=C2=A0 If it gets<br>
&gt; &gt; &gt; buffers in from a client that doesn&#39;t use the explicit s=
ync extension,<br>
&gt; &gt; &gt; it can pull a sync_file from the dma-buf and use that exactl=
y as it<br>
&gt; &gt; &gt; would a sync_file passed via the explicit sync extension.=C2=
=A0 When it<br>
&gt; &gt; &gt; goes to scan out a user buffer and discovers that KMS doesn&=
#39;t accept<br>
&gt; &gt; &gt; sync_files (or if it tries to use that pesky media encoder n=
o one has<br>
&gt; &gt; &gt; converted), it can take it&#39;s sync_file for display and s=
tuff it into<br>
&gt; &gt; &gt; the dma-buf before handing it to KMS.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Along with the kernel patches, I&#39;ve also implemented sup=
port for this<br>
&gt; &gt; &gt; in the Vulkan WSI code used by ANV and RADV.=C2=A0 With thos=
e patches, the<br>
&gt; &gt; &gt; only requirement on the Vulkan drivers is that you be able t=
o export<br>
&gt; &gt; &gt; any VkSemaphore as a sync_file and temporarily import a sync=
_file into<br>
&gt; &gt; &gt; any VkFence or VkSemaphore.=C2=A0 As long as that works, the=
 core Vulkan<br>
&gt; &gt; &gt; driver only ever sees explicit synchronization via sync_file=
.=C2=A0 The WSI<br>
&gt; &gt; &gt; code uses these new ioctls to translate the implicit sync of=
 X11 and<br>
&gt; &gt; &gt; Wayland to the explicit sync the Vulkan driver wants.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; I&#39;m hoping (and here&#39;s where I want a sanity check) =
that a simple API<br>
&gt; &gt; &gt; like this will allow us to finally start moving the Linux ec=
osystem<br>
&gt; &gt; &gt; over to explicit synchronization one piece at a time in a wa=
y that&#39;s<br>
&gt; &gt; &gt; actually correct.=C2=A0 (No Wayland explicit sync with compo=
sitors hoping<br>
&gt; &gt; &gt; KMS magically works even though it doesn&#39;t have a sync_f=
ile API.)<br>
&gt; &gt; &gt; Once some pieces in the ecosystem start moving, there will b=
e<br>
&gt; &gt; &gt; motivation to start moving others and maybe we can actually =
build the<br>
&gt; &gt; &gt; momentum to get most everything converted.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; For reference, you can find the kernel RFC patches and mesa =
MR here:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <a href=3D"https://lists.freedesktop.org/archives/dri-devel/=
2020-March/258833.html" rel=3D"noreferrer" target=3D"_blank">https://lists.=
freedesktop.org/archives/dri-devel/2020-March/258833.html</a><br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/merge_=
requests/4037" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesk=
top.org/mesa/mesa/-/merge_requests/4037</a><br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; At this point, I welcome your thoughts, comments, objections=
, and<br>
&gt; &gt; &gt; maybe even help/review. :-)<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; --Jason Ekstrand<br>
&gt; <br>
<br>
-- <br>
Regards,<br>
<br>
Laurent Pinchart<br>
_______________________________________________<br>
wayland-devel mailing list<br>
<a href=3D"mailto:wayland-devel@lists.freedesktop.org" target=3D"_blank">wa=
yland-devel@lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/wayland-devel" re=
l=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/li=
stinfo/wayland-devel</a><br>
</blockquote></div>

--000000000000f9ca0305a0f8550d--

--===============1742691715==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1742691715==--
