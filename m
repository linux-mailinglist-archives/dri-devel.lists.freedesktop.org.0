Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D7C365EC5
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 19:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B3AE6E887;
	Tue, 20 Apr 2021 17:45:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BDC46E886
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 17:45:47 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 o21-20020a1c4d150000b029012e52898006so10838805wmh.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 10:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VgNo7btHeSBRZlPaQjH4uXQ4E4h1r5Mjn2SG0XkIqqU=;
 b=q8O3J5HFgr0deEjjZKqYb28onWrY7NUwjy9HXbxdsqafAtfyOr0FbXk1rf92lQDu6h
 kYQONd7uIhgZtsof2dhAe9ABKDJ4Tvbu+OIBZ3020kxqgFq37Tdar2geMdweVtgXA9mn
 yIDNIk3fmhswu8Ka6XLzy9LBswGwgs327z7YOVJ121wZEAT9zAApNI02/Po+UqVng+/h
 6EN50uxBQ2e+K3C6vKnYUnfw65gRgCFw2KlJoy9X32vJO/ofpC+d2uCk/aPCKQzLubc4
 qZStg7fKOlHf09fHIiiIxRG6lrD6vS337efUDtypECnYB6W95RDY37dChXiYheVDB53u
 4W6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VgNo7btHeSBRZlPaQjH4uXQ4E4h1r5Mjn2SG0XkIqqU=;
 b=poc7dpBsX/i3rlBfo93LNqg1jusPPDBn4pPo+GWAuw307k7ZfP7gTa8LCi5qBm9Zj2
 EGS7/NBDQ/CID+lfQS9vc0HgvYBNY+LaAPVXV/7KLFUiYKDLcFgo89CJ9Xj9TnAmyqT3
 2NVWOpZ/z+5S+kPYAu/1BA/lvFWwKGiiE9787OJ9nqYkzY45ByjNeVAzpB7SUu7egdNK
 qVS6FBNZP+121zL9W0RA9U7NLAf9SZaIXL7z+X9u3fVecO31681a28WaD60Qw7KPpJrg
 nlay2xpDL17XkVPoq1bc/96nW4I6GwBjx2qfg/PJQ+MfIpKgdkuhpvLpdALg+plcvh/n
 W5bQ==
X-Gm-Message-State: AOAM533CZIaZkUmmQzCigsn935ypwIj0/ouDPzXX1eBDsICcus9NpyN/
 6OFcQFGbiKUZsyVlVaj0vaGqDqKfl2HxOmdSFtPDkg==
X-Google-Smtp-Source: ABdhPJycfdyJVFFfP2UFbd3r56T9q36lxycZe4h5z+zC6RoKWtLvKcF6XhSmvGFM6zEU/nWIoU0oe8jTXCbqrWL9kcI=
X-Received: by 2002:a7b:cd98:: with SMTP id y24mr5611832wmj.52.1618940745908; 
 Tue, 20 Apr 2021 10:45:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
 <CAPj87rMn_gabTdZpHGQVa16Log8xFe8fvhcL_WSC6tyOMvmY=w@mail.gmail.com>
 <CAOFGe96c1SxHiUBzapbVFx1h0aOwF=X8hcStVZmrw4OjrrG+Zg@mail.gmail.com>
In-Reply-To: <CAOFGe96c1SxHiUBzapbVFx1h0aOwF=X8hcStVZmrw4OjrrG+Zg@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 20 Apr 2021 18:44:58 +0100
Message-ID: <CAPj87rPSW13nxz2n5E+n0JYcwGR3mFWJAG2kYaaoav7A-ZVD2g@mail.gmail.com>
Subject: Re: [RFC] Linux Graphics Next: Explicit fences everywhere and no BO
 fences - initial proposal
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
Cc: ML Mesa-dev <mesa-dev@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Content-Type: multipart/mixed; boundary="===============0642804068=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0642804068==
Content-Type: multipart/alternative; boundary="00000000000012982505c06b048b"

--00000000000012982505c06b048b
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, 20 Apr 2021 at 16:46, Jason Ekstrand <jason@jlekstrand.net> wrote:

> It's still early in the morning here and I'm not awake yet so sorry if
> this comes out in bits and pieces...
>

No problem, it's helpful. If I weren't on this thread I'd be attempting to
put together a 73-piece chest of drawers whose instructions are about as
clear as this so far, so I'm in the right head space anyway.


> IMO, there are two problems being solved here which are related in
> very subtle and tricky ways.  They're also, admittedly, driver
> problems, not really winsys problems.  Unfortunately, they may have
> winsys implications.
>

Yeah ... bingo.


> First, is better/real timelines for Vulkan and compute.  [...]
>
> We also want something like this for compute workloads.  [...]
>

Totally understand and agree with all of this. Memory fences seem like a
good and useful primitive here.


> The second biting issue is that, in the current kernel implementation
> of dma-fence and dma_resv, we've lumped internal synchronization for
> memory management together with execution synchronization for
> userspace dependency tracking.  And we have no way to tell the
> difference between the two internally.  Even if user space is passing
> around sync_files and trying to do explicit sync, once you get inside
> the kernel, they're all dma-fences and it can't tell the difference.
>

Funny, because 'lumped [the two] together' is exactly the crux of my issues
...


> If we move


Stop here, because ...


> to a more userspace-controlled synchronization model with
> wait-before-signal and no timeouts unless requested, regardless of the
> implementation, it plays really badly dma-fence.  And, by "badly" I
> mean the two are nearly incompatible.


I would go further than that, and say completely, fundamentally,
conceptually, incompatible.


> From a user space PoV, it means
> it's tricky to provide the finite time dma-fence guarantee.  From a
> kernel PoV, it's way worse.  Currently, the way dma-fence is
> constructed, it's impossible to deadlock assuming everyone follows the
> rules.  The moment we allow user space to deadlock itself and allow
> those deadlocks to leak into the kernel, we have a problem.  Even if
> we throw in some timeouts, we still have a scenario where user space
> has one linearizable dependency graph for execution synchronization
> and the kernel has a different linearizable dependency graph for
> memory management and, when you smash them together, you may have
> cycles in your graph.
>
> So how do we sort this all out?  Good question.  It's a hard problem.
> Probably the hardest problem here is the second one: the intermixing
> of synchronization types.  Solving that one is likely going to require
> some user space re-plumbing because all the user space APIs we have
> for explicit sync are built on dma-fence.
>

Gotcha.

Firstly, let's stop, as you say, lumping things together. Timeline
semaphores and compute's GPU-side spinlocks etc, are one thing. I accept
those now have a hard requirement on something like memory fences, where
any responsibility is totally abrogated. So let's run with that in our
strawman: Vulkan compute & graphics & transfer queues all degenerate to
something spinning (hopefully GPU-assisted gentle spin) on a uint64
somewhere. The kernel has (in the general case) no visibility or
responsibility into these things. Fine - that's one side of the story.

But winsys is something _completely_ different. Yes, you're using the GPU
to do things with buffers A, B, and C to produce buffer Z. Yes, you're
using vkQueuePresentKHR to schedule that work. Yes, Mutter's composition
job might depend on a Chromium composition job which depends on GTA's
render job which depends on GTA's compute job which might take a year to
complete. Mutter's composition job needs to complete in 'reasonable'
(again, FSVO) time, no matter what. The two are compatible.

How? Don't lump them together. Isolate them aggressively, and _predictably_
in a way that you can reason about.

What clients do in their own process space is their own business. Games can
deadlock themselves if they get wait-before-signal wrong. Compute jobs can
run for a year. Their problem. Winsys is not that, because you're crossing
every isolation boundary possible. Process, user, container, VM - every
kind of privilege boundary. Thus far, dma_fence has protected us from the
most egregious abuses by guaranteeing bounded-time completion; it also acts
as a sequencing primitive, but from the perspective of a winsys person
that's of secondary importance, which is probably one of the bigger
disconnects between winsys people and GPU driver people.

Anyway, one of the great things about winsys (there are some! trust me) is
we don't need to be as hopelessly general as for game engines, nor as
hyperoptimised. We place strict demands on our clients, and we literally
kill them every single time they get something wrong in a way that's
visible to us. Our demands on the GPU are so embarrassingly simple that you
can run every modern desktop environment on GPUs which don't have unified
shaders. And on certain platforms who don't share tiling formats between
texture/render-target/scanout ... and it all still runs fast enough that
people don't complain.

We're happy to bear the pain of being the ones setting strict and
unreasonable expectations. To me, this 'present ioctl' falls into the
uncanny valley of the kernel trying to bear too much of the weight to be
tractable, whilst not bearing enough of the weight to be useful for winsys.

So here's my principles for a counter-strawman:

Remove the 'return fence'. Burn it with fire, do not look back. Modern
presentation pipelines are not necessarily 1:1, they are not necessarily
FIFO (as opposed to mailbox), and they are not necessarily round-robin
either. The current proposal provides no tangible benefits to modern
userspace, and fixing that requires either hobbling userspace to remove
capability and flexibility (ironic given that the motivation for this is
all about userspace flexibility?), or pushing so much complexity into the
kernel that we break it forever (you can't compile Mutter's per-frame
decision tree into eBPF).

Give us a primitive representing work completion, so we can keep
optimistically pipelining operations. We're happy to pass around
explicit-synchronisation tokens (dma_fence, drm_syncobj, drm_newthing,
whatever it is): plumbing through a sync token to synchronise compositor
operations against client operations in both directions is just a matter of
boring typing.

Make that primitive something that is every bit as usable across subsystems
as it is across processes. It should be a lowest common denominator for
middleware that ultimately provokes GPU execbuf, KMS commit, and media
codec ops; currently that would be both wait and signal for all
of VkSemaphore, EGLSyncKHR, KMS fence, V4L (D)QBUF, and VA-API {en,de}code
ops. It must be exportable to and importable from an FD, which can be
poll()ed on and read(). GPU-side visibility for late binding is nice, but
not at all essential.

Make that primitive complete in 'reasonable' time, no matter what. There
will always be failures in extremis, no matter what the design: absent
hard-realtime principles from hardware all the way up to userspace,
something will always be able to fail somewhere: non-terminating GPU work,
actual GPU hang/reset, GPU queue DoSed, CPU scheduler, I/O DoSed. As long
as the general case is bounded-time completion, each of these can be
mitigated separately as long as userspace has enough visibility into the
underlying mechanics, and cares enough to take meaningful action on it.

And something more concrete:

dma_fence.

This already has all of the properties described above. Kernel-wise, it
already devolves to CPU-side signaling when it crosses device boundaries.
We need to support it roughly forever since it's been plumbed so far and so
wide. Any primitive which is acceptable for winsys-like usage which crosses
so many device/subsystem/process/security boundaries has to meet the same
requirements. So why reinvent something which looks so similar, and has the
same requirements of the kernel babysitting completion, providing little to
no benefit for that difference?

It's not usable for complex usecases, as we've established, but winsys is
not that usecase. We can draw a hard boundary between the two worlds. For
example, a client could submit an infinitely deep CS -> VS/FS/etc job chain
with potentially-infinite completion, with the FS output being passed to
the winsys for composition. Draw the line post-FS: export a dma_fence
against FS completion. But instead of this being based on monitoring the
_fence_ per se, base it on monitoring the job; if the final job doesn't
retire in reasonable time, signal the fence and signal (like, SIGKILL, or
just tear down the context and permanently -EIO, whatever) the client.
Maybe for future hardware that would be the same thing - the kernel setting
a timeout and comparing a read on a particular address against a particular
value - but the 'present fence' proposal seems like it requires exactly
this anyway.

That to me is the best compromise. We allow clients complete arbitrary
flexibility, but as soon as they vkQueuePresentKHR, they're crossing a
boundary out of happy fun GPU land and into strange hostile winsys land.
We've got a lot of practice at being the bad guys who hate users and are
always trying to ruin their dreams, so we'll happily wear the impact of
continuing to do that. In doing so, we collectively don't have to invent a
third new synchronisation primitive (to add to dma_fence and drm_syncobj)
and a third new synchronisation model (implicit sync, explicit-but-bounded
sync, explicit-and-maybe-unbounded sync) to support this, and we don't have
to do an NT4 where GDI was shoved into the kernel.

It doesn't help with the goal of ridding dma_fence from the kernel, but it
does very clearly segregate the two worlds. Drawing that hard boundary
would allow drivers to hyperoptimise for clients which want to be extremely
clever and agile and quick because they're sailing so close to the wind
that they cannot bear the overhead of dma_fence, whilst also providing the
guarantees we need when crossing isolation boundaries. In the latter case,
the overhead of bouncing into a less-optimised primitive is totally
acceptable because it's not even measurable: vkQueuePresentKHR requires
client CPU activity -> kernel IPC -> compositor CPU activity -> wait for
repaint cycle -> prepare scene -> composition, against which dma_fence
overhead isn't and will never be measurable (even if it doesn't cross
device/subsystem boundaries, which it probably does). And the converse for
vkAcquireNextImageKHR.

tl;dr: we don't need to move winsys into the kernel, winsys and compute
don't need to share sync primitives, the client/winsys boundary does need
to have a sync primitive does need strong and onerous guarantees, and that
transition can be several orders of magnitude less efficient than
intra-client sync primitives

Shoot me down. :)

Cheers,
Daniel

--00000000000012982505c06b048b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,</div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Tue, 20 Apr 2021 at 16:46, Jason Ek=
strand &lt;<a href=3D"mailto:jason@jlekstrand.net">jason@jlekstrand.net</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">It&#=
39;s still early in the morning here and I&#39;m not awake yet so sorry if<=
br>
this comes out in bits and pieces...<br></blockquote><div><br></div><div>No=
 problem, it&#39;s helpful. If I weren&#39;t on this thread I&#39;d be atte=
mpting to put together a 73-piece chest of drawers whose instructions are a=
bout as clear as this so far, so I&#39;m in the right head space anyway.</d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
IMO, there are two problems being solved here which are related in<br>
very subtle and tricky ways.=C2=A0 They&#39;re also, admittedly, driver<br>
problems, not really winsys problems.=C2=A0 Unfortunately, they may have<br=
>
winsys implications.<br></blockquote><div><br></div><div>Yeah ... bingo.</d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
First, is better/real timelines for Vulkan and compute.=C2=A0 [...]<br><br>
We also want something like this for compute workloads.=C2=A0 [...]<br></bl=
ockquote><div><br></div><div>Totally understand and agree with all of this.=
 Memory fences seem like a good and useful primitive here.</div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
The second biting issue is that, in the current kernel implementation<br>
of dma-fence and dma_resv, we&#39;ve lumped internal synchronization for<br=
>
memory management together with execution synchronization for<br>
userspace dependency tracking.=C2=A0 And we have no way to tell the<br>
difference between the two internally.=C2=A0 Even if user space is passing<=
br>
around sync_files and trying to do explicit sync, once you get inside<br>
the kernel, they&#39;re all dma-fences and it can&#39;t tell the difference=
.<br></blockquote><div><br></div><div>Funny, because &#39;lumped [the two] =
together&#39; is exactly the crux of my issues ...</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
If we move</blockquote><div><br></div><div>Stop here, because ...</div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">to a more us=
erspace-controlled synchronization model with<br>
wait-before-signal and no timeouts unless requested, regardless of the<br>
implementation, it plays really badly dma-fence.=C2=A0 And, by &quot;badly&=
quot; I<br>
mean the two are nearly incompatible.</blockquote><div><br></div><div>I wou=
ld go further than that, and say completely, fundamentally, conceptually, i=
ncompatible.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From a user space PoV, it means<br>
it&#39;s tricky to provide the finite time dma-fence guarantee.=C2=A0 From =
a<br>
kernel PoV, it&#39;s way worse.=C2=A0 Currently, the way dma-fence is<br>
constructed, it&#39;s impossible to deadlock assuming everyone follows the<=
br>
rules.=C2=A0 The moment we allow user space to deadlock itself and allow<br=
>
those deadlocks to leak into the kernel, we have a problem.=C2=A0 Even if<b=
r>
we throw in some timeouts, we still have a scenario where user space<br>
has one linearizable dependency graph for execution synchronization<br>
and the kernel has a different linearizable dependency graph for<br>
memory management and, when you smash them together, you may have<br>
cycles in your graph.<br>
<br>
So how do we sort this all out?=C2=A0 Good question.=C2=A0 It&#39;s a hard =
problem.<br>
Probably the hardest problem here is the second one: the intermixing<br>
of synchronization types.=C2=A0 Solving that one is likely going to require=
<br>
some user space re-plumbing because all the user space APIs we have<br>
for explicit sync are built on dma-fence.<br></blockquote><div><br></div><d=
iv>Gotcha.</div><div><br></div><div>Firstly, let&#39;s stop, as you say, lu=
mping things together. Timeline semaphores and compute&#39;s GPU-side spinl=
ocks etc, are one thing. I accept those now have a hard requirement on some=
thing like memory fences, where any responsibility is totally abrogated. So=
 let&#39;s run with that in our strawman: Vulkan compute &amp; graphics &am=
p; transfer queues all degenerate to something spinning (hopefully GPU-assi=
sted gentle spin) on a uint64 somewhere. The kernel has (in the general cas=
e) no visibility or responsibility into these things. Fine - that&#39;s one=
 side of the story.</div><div><br></div><div>But winsys is something _compl=
etely_ different. Yes, you&#39;re using the GPU to do things with buffers A=
, B, and C to produce buffer Z. Yes, you&#39;re using vkQueuePresentKHR to =
schedule that work. Yes, Mutter&#39;s composition job might depend on a Chr=
omium composition job which depends on GTA&#39;s render job which depends o=
n GTA&#39;s compute job which might take a year to complete. Mutter&#39;s c=
omposition job needs to complete in &#39;reasonable&#39; (again, FSVO) time=
, no matter what. The two are compatible.</div><div><br></div><div>How? Don=
&#39;t lump them together. Isolate them aggressively,=C2=A0and _predictably=
_ in a way that you can reason about.</div><div><br></div><div>What clients=
 do in their own process space is their own business.=C2=A0Games can deadlo=
ck themselves if they get wait-before-signal wrong. Compute jobs can run fo=
r a year. Their problem. Winsys is not that, because you&#39;re crossing ev=
ery isolation boundary possible. Process, user, container, VM - every kind =
of privilege boundary. Thus far, dma_fence has protected us from the most e=
gregious abuses by guaranteeing bounded-time completion; it also acts as a =
sequencing primitive, but from the perspective of a winsys person that&#39;=
s of secondary importance, which is probably one of the bigger disconnects =
between winsys people and GPU driver people.</div><div><br></div><div>Anywa=
y, one of the great things about winsys (there are some! trust me) is we do=
n&#39;t need to be as hopelessly general as for game engines, nor as hypero=
ptimised. We place strict demands on our clients, and we literally kill the=
m every single time they get something wrong in a way that&#39;s visible to=
 us. Our demands on the GPU are so embarrassingly simple that you can run e=
very modern desktop environment on GPUs which don&#39;t have unified shader=
s. And on certain=C2=A0platforms who don&#39;t share tiling formats between=
 texture/render-target/scanout ... and it all still runs fast enough that p=
eople don&#39;t complain.</div><div><br></div><div>We&#39;re happy to bear =
the pain of being the ones setting strict and unreasonable expectations. To=
 me, this &#39;present ioctl&#39; falls into the uncanny valley of the kern=
el trying to bear too much of the weight to be tractable, whilst not bearin=
g enough of the weight to be useful for winsys.</div><div><br></div><div>So=
 here&#39;s my principles for a counter-strawman:</div><div><br></div><div>=
Remove the &#39;return fence&#39;. Burn it with fire, do not look back. Mod=
ern presentation pipelines are not necessarily 1:1, they are not necessaril=
y FIFO (as opposed to mailbox), and they are not necessarily round-robin ei=
ther. The current proposal provides no tangible benefits to modern userspac=
e, and fixing that requires either hobbling userspace to remove capability =
and flexibility (ironic given that the motivation for this is all about use=
rspace flexibility?), or pushing so much complexity into the kernel that we=
 break it forever (you can&#39;t compile Mutter&#39;s per-frame decision tr=
ee into eBPF).</div><div><br></div><div>Give us a primitive representing wo=
rk completion, so we can keep optimistically pipelining operations. We&#39;=
re happy to pass around explicit-synchronisation tokens (dma_fence, drm_syn=
cobj, drm_newthing, whatever it is): plumbing through a sync token to synch=
ronise compositor operations against client operations in both directions i=
s just a matter of boring typing.</div><div><br></div><div>Make that primit=
ive something that is every bit as usable across subsystems as it is across=
 processes. It should be a lowest common denominator for middleware that ul=
timately provokes GPU execbuf, KMS commit, and media codec ops; currently t=
hat would be both wait and signal for all of=C2=A0VkSemaphore, EGLSyncKHR, =
KMS fence, V4L (D)QBUF, and VA-API {en,de}code ops. It must be exportable t=
o and importable from an FD, which can be poll()ed on and read(). GPU-side =
visibility for late binding is nice, but not at all essential.</div><div><b=
r></div><div>Make that primitive complete in &#39;reasonable&#39; time, no =
matter what. There will always be failures in extremis, no matter what the =
design: absent hard-realtime principles from hardware all the way up to use=
rspace, something will always be able to fail somewhere: non-terminating GP=
U work, actual GPU hang/reset, GPU queue DoSed, CPU scheduler, I/O DoSed. A=
s long as the general case is bounded-time completion, each of these can be=
 mitigated separately as long as userspace has enough visibility into the u=
nderlying mechanics, and cares enough to take meaningful action on it.</div=
><div><br></div><div>And something more concrete:</div><div><br></div><div>=
dma_fence.</div><div><br></div><div>This already has all of the properties =
described above. Kernel-wise, it already devolves to CPU-side signaling whe=
n it crosses device boundaries. We need to support it roughly forever since=
 it&#39;s been plumbed so far and so wide. Any primitive which is acceptabl=
e for winsys-like usage which crosses so many device/subsystem/process/secu=
rity boundaries has to meet the same requirements. So why reinvent somethin=
g which looks so similar, and has the same requirements of the kernel babys=
itting completion, providing little to no benefit for that difference?</div=
><div><br></div><div>It&#39;s not usable for complex usecases, as we&#39;ve=
 established, but winsys is not that usecase. We can draw a hard boundary b=
etween the two worlds. For example, a client could submit an infinitely dee=
p CS -&gt; VS/FS/etc job chain with potentially-infinite completion, with t=
he FS output being passed to the winsys for composition. Draw the line post=
-FS: export a dma_fence against FS completion. But instead of this being ba=
sed on monitoring the _fence_ per se, base it on monitoring the job; if the=
 final job doesn&#39;t retire in reasonable time, signal the fence and sign=
al (like, SIGKILL, or just tear down the context and permanently -EIO, what=
ever) the client. Maybe for future hardware that would be the same thing - =
the kernel setting a timeout and comparing a read on a particular address a=
gainst a particular value - but the &#39;present fence&#39; proposal seems =
like it requires exactly this anyway.</div><div><br></div><div>That to me i=
s the best compromise. We allow clients complete arbitrary flexibility, but=
 as soon as they vkQueuePresentKHR, they&#39;re crossing a boundary out of =
happy fun GPU land and into strange hostile winsys land. We&#39;ve got a lo=
t of practice at being the bad guys who hate users and are always trying to=
 ruin their dreams, so we&#39;ll happily wear the impact of continuing to d=
o that. In doing so, we collectively don&#39;t have to invent a third new s=
ynchronisation primitive (to add to dma_fence and drm_syncobj) and a third =
new synchronisation model (implicit sync, explicit-but-bounded sync, explic=
it-and-maybe-unbounded sync) to support this, and we don&#39;t have to do a=
n NT4 where GDI was shoved into the kernel.</div><div><br></div><div>It doe=
sn&#39;t help with the goal of ridding dma_fence from the kernel, but it do=
es very clearly segregate the two worlds. Drawing that hard boundary would =
allow drivers to hyperoptimise=C2=A0for clients which want to be extremely =
clever and agile and quick because they&#39;re sailing so close to the wind=
 that they cannot bear the overhead of dma_fence, whilst also providing the=
 guarantees we need when crossing isolation boundaries. In the latter case,=
 the overhead of bouncing into a less-optimised primitive is totally accept=
able because it&#39;s not even measurable: vkQueuePresentKHR requires clien=
t CPU activity -&gt; kernel IPC -&gt; compositor CPU activity -&gt; wait fo=
r repaint cycle -&gt; prepare scene -&gt; composition, against which dma_fe=
nce overhead isn&#39;t and will never be measurable (even if it doesn&#39;t=
 cross device/subsystem boundaries, which it probably does). And the conver=
se for vkAcquireNextImageKHR.</div><div><br></div><div>tl;dr: we don&#39;t =
need to move winsys=C2=A0into the kernel, winsys and compute don&#39;t need=
 to share sync primitives, the client/winsys boundary does need to have a s=
ync primitive does need strong and onerous guarantees, and that transition =
can be several orders of magnitude less efficient than intra-client sync pr=
imitives</div><div><br></div><div>Shoot me down. :)</div><div><br></div><di=
v>Cheers,</div><div>Daniel=C2=A0</div></div></div>

--00000000000012982505c06b048b--

--===============0642804068==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0642804068==--
