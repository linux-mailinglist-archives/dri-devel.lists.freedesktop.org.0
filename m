Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E952A365929
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 14:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F8D89D5C;
	Tue, 20 Apr 2021 12:43:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A2389D4D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 12:43:14 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 f195-20020a1c1fcc0000b029012eb88126d7so9928733wmf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 05:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1A1FhbJ+FbSSw3BxOb3KkgKYWZqTXHZrqrCjcYwYJcs=;
 b=FoBmbyaTSxvXRlARvdCjwfAdLvRWE+NlUoFQthtrSkrnFPfUAPLR5RzQgIUI6G9AFG
 No+KXNYyIiGlkMP7ghXoOIFGjt0vpeo5ojPCh+yvOTXyxTOeyGVku7AMSKcANuho7oB2
 jJgXRgn2T+pAoWwdw7VEkgaPWSAjVWVclg0GUbUhuGmuc7+LzRAnzay9hW9m2b9pIgUZ
 ACyDGCwsAclKoup4xsmtfealiYOe70jQtRc9LNBhFrjBojFMWbY9+Dt0v5DccyhD/9O+
 t7tEunQ/IVXBfDcSfrWPyO3B6sG3Xg7V0Nam/MiayiGDyCR9H48Vz6zp59AYe8AAetD0
 tW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1A1FhbJ+FbSSw3BxOb3KkgKYWZqTXHZrqrCjcYwYJcs=;
 b=YFzA04P+wxXU/529OvydzDBCCGavuWN8t1jmNAkUR2Rif3xQEWHrlWsUe7Dn/uyI7M
 Y9aalxp5a1zTw20ZDPSZCwUXnsacb96rqS/fqH+C0wZczyTD0NEiM+Pju4X9Y37oXLtd
 b1kOtuljco+jAvezC4R6PTqIWg8YykR9bKRJfaqP+B7SI6+QUFyCmDoG0Y18h51hjwg2
 dbBs6a8W6uz0wA83Tql0PNdAoG5jch1/ZBYfAqn4VN8+Mn1ieTcXAbGh7Re2f5MF2j1P
 GSaw+lQkr+ViemX0D6BT1LLmaqOKviO+WjYYtbsaXTqxpdt/lFDaVgGkVsA5V/9BrKB4
 Cccg==
X-Gm-Message-State: AOAM533z7zkwi+ImThTMaW9CHqZtDe8q9x6qBXHL8Mtg+8JzqJxcEofp
 zte2nQ8M2OL1up17CUi+RA+34AGv3JIGzebPwvgGGA==
X-Google-Smtp-Source: ABdhPJzt31Lz1kyKa4Ugm7G+y8ERq/chnTmu1aPI9einVE4/n5INTR9dcPtzHUkm0f0HzoAlvcLEjrDY7M1g42UVICY=
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr4479123wmj.84.1618922592559;
 Tue, 20 Apr 2021 05:43:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
In-Reply-To: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 20 Apr 2021 13:42:26 +0100
Message-ID: <CAPj87rMn_gabTdZpHGQVa16Log8xFe8fvhcL_WSC6tyOMvmY=w@mail.gmail.com>
Subject: Re: [RFC] Linux Graphics Next: Explicit fences everywhere and no BO
 fences - initial proposal
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
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
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============2088955798=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2088955798==
Content-Type: multipart/alternative; boundary="0000000000000c7cd205c066caa3"

--0000000000000c7cd205c066caa3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Mon, 19 Apr 2021 at 11:48, Marek Ol=C5=A1=C3=A1k <maraeo@gmail.com> wrot=
e:

> *2. Explicit synchronization for window systems and modesetting*
>
> The producer is an application and the consumer is a compositor or a
> modesetting driver.
>
> *2.1. The Present request*
>

So the 'present request' is an ioctl, right? Not a userspace construct like
it is today? If so, how do we correlate the two?

The terminology is pretty X11-centric so I'll assume that's what you've
designed against, but Wayland and even X11 carry much more auxiliary
information attached to a present request than just 'this buffer, this
swapchain'. Wayland latches a lot of data on presentation, including
non-graphics data such as surface geometry (so we can have resizes which
don't suck), window state (e.g. fullscreen or not, also so we can have
resizes which don't suck), and these requests can also cascade through a
tree of subsurfaces (so we can have embeds which don't suck). X11 mostly
just carries timestamps, which is more tractable.

Given we don't want to move the entirety of Wayland into kernel-visible
objects, how do we synchronise the two streams so they aren't incoherent?
Taking a rough stab at it whilst assuming we do have
DRM_IOCTL_NONMODE_PRESENT, this would create a present object somewhere in
kernel space, which the producer would create and ?? export a FD from, that
the compositor would ?? import.

As part of the Present request, the producer will pass 2 fences (sync
> objects) to the consumer alongside the presented DMABUF BO:
> - The submit fence: Initially unsignalled, it will be signalled when the
> producer has finished drawing into the presented buffer.
>

We have already have this in Wayland through dma_fence. I'm relaxed about
this becoming drm_syncobj or drm_newmappedysncobjthing, it's just a matter
of typing. X11 has patches to DRI3 to support dma_fence, but they never got
merged because it was far too invasive to a server which is no longer
maintained.


> - The return fence: Initially unsignalled, it will be signalled when the
> consumer has finished using the presented buffer.
>

Currently in Wayland the return fence (again a dma_fence) is generated by
the compositor and sent as an event when it's done, because we can't have
speculative/empty/future fences. drm_syncobj would make this possible, but
so far I've been hesitant because I don't see the benefit to it (more
below).


> Deadlock mitigation to recover from segfaults:
> - The kernel knows which process is obliged to signal which fence. This
> information is part of the Present request and supplied by userspace.
>

Same as today with dma_fence. Less true with drm_syncobj if we're using
timelines.


> - If the producer crashes, the kernel signals the submit fence, so that
> the consumer can make forward progress.
>

This is only a change if the producer is now allowed to submit a fence
before it's flushed the work which would eventually fulfill that fence.
Using dma_fence has so far isolated us from this.


> - If the consumer crashes, the kernel signals the return fence, so that
> the producer can reclaim the buffer.
>

'The consumer' is problematic, per below. I think the wording you want is
'if no references are held to the submitted present object'.


> - A GPU hang signals all fences. Other deadlocks will be handled like GPU
> hangs.
>
> Other window system requests can follow the same idea.
>

Which other window system requests did you have in mind? Again, moving the
entirety of Wayland's signaling into the kernel is a total non-starter.
Partly because it means our entire protocol would be subject to the
kernel's ABI rules, partly because the rules and interdependencies between
the requests are extremely complex, but mostly because the kernel is just a
useless proxy: it would be forced to do significant work to reason about
what those requests do and when they should happen, but wouldn't be able to
make those decisions itself so would have to just punt everything to
userspace. Unless we have eBPF compositors.


> Merged fences where one fence object contains multiple fences will be
> supported. A merged fence is signalled only when its fences are signalled=
.
> The consumer will have the option to redefine the unsignalled return fenc=
e
> to a merged fence.
>

An elaboration of how this differed from drm_syncobj would be really
helpful here. I can make some guesses based on the rest of the mail, but
I'm not sure how accurate they are.


> *2.2. Modesetting*
>
> Since a modesetting driver can also be the consumer, the present ioctl
> will contain a submit fence and a return fence too. One small problem wit=
h
> this is that userspace can hang the modesetting driver, but in theory, an=
y
> later present ioctl can override the previous one, so the unsignalled
> presentation is never used.
>

This is also problematic. It's not just KMS, but media codecs too - V4L
doesn't yet have explicit fencing, but given the programming model of
codecs and how deeply they interoperate, but it will.

Rather than client (GPU) -> compositor (GPU) -> compositor (KMS), imagine
you're playing a Steam game on your Chromebook which you're streaming via
Twitch or whatever. The full chain looks like:
* Steam game renders with GPU
* Xwayland in container receives dmabuf, forwards dmabuf to Wayland server
(does not directly consume)
* Wayland server (which is actually Chromium) receives dmabuf, forwards
dmabuf to Chromium UI process
* Chromium UI process forwards client dmabuf to KMS for direct scanout
* Chromium UI process _also_ forwards client dmabuf to GPU process
* Chromium GPU process composites Chromium UI + client dmabuf + webcam
frame from V4L to GPU composition job
* Chromium GPU process forwards GPU composition dmabuf (not client dmabuf)
to media codec for streaming

So, we don't have a 1:1 producer:consumer relationship. Even if we accept
it's 1:n, your Chromebook is about to burst into flames and we're dropping
frames to try to keep up. Some of the consumers are FIFO (the codec wants
to push things through in order), and some of them are mailbox (the display
wants to get the latest content, not from half a second ago before the
other player started jumping around and now you're dead). You can't reason
about any of these dependencies ahead of time from a producer PoV, because
userspace will be making these decisions frame by frame. Also someone's
started using the Vulkan present-timing extension because life wasn't
confusing enough already.

As Christian and Daniel were getting at, there are also two 'levels' of
explicit synchronisation.

The first (let's call it 'blind') is plumbing a dma_fence through to be
passed with the dmabuf. When the client submits a buffer for presentation,
it submits a dma_fence as well. When the compositor is finished with it
(i.e. has flushed the last work which will source from that buffer), it
passes a dma_fence back to the client, or no fence if required (buffer was
never accessed, or all accesses are known to be fully retired e.g. the last
fence accessing it has already signaled). This is just a matter of typing,
and is supported by at least Weston. It implies no scheduling change over
implicit fencing in that the compositor can be held hostage by abusive
clients with a really long compute shader in their dependency chain: all
that's happening is that we're plumbing those synchronisation tokens
through userspace instead of having the kernel dig them up from dma_resv.
But we at least have a no-deadlock guarantee, because a dma_fence will
complete in bounded time.

The second (let's call it 'smart') is ... much more than that. Not only
does the compositor accept and generate explicit synchronisation points for
the client, but those synchronisation points aren't dma_fences, but may be
wait-before-signal, or may be wait-never-signal. So in order to avoid a
terminal deadlock, the compositor has to sit on every synchronisation point
and check before it flushes any dependent work that it has signaled, or
will at least signal in bounded time. If that guarantee isn't there, you
have to punt and see if anything happens at your next repaint point. We
don't currently have this support in any compositor, and it's a lot more
work than blind.

Given the interdependencies I've described above for Wayland - say a resize
case, or when a surface commit triggers a cascade of subsurface commits -
GPU-side conditional rendering is not always possible. In those cases, you
_must_ do CPU-side waits and keep both sets of state around. Pain.

Typing all that out has convinced me that the current proposal is a net
loss in every case.

Complex rendering uses (game engine with a billion draw calls, a billion
BOs, complex sync dependencies, wait-before-signal and/or conditional
rendering/descriptor indexing) don't need the complexity of a present ioctl
and checking whether other processes have crashed or whatever. They already
have everything plumbed through for this themselves, and need to implement
so much infrastructure around it that they don't need much/any help from
the kernel. Just give them a sync primitive with almost zero guarantees
that they can map into CPU & GPU address space, let them go wild with it.
drm_syncobj_plus_footgun. Good luck.

Simple presentation uses (desktop, browser, game) don't need the
hyperoptimisation of sync primitives. Frame times are relatively long, and
you can only have so many surfaces which aren't occluded. Either you have a
complex scene to composite, in which case the CPU overhead of something
like dma_fence is lower than the CPU overhead required to walk through a
single compositor repaint cycle anyway, or you have a completely trivial
scene to composite and you can absolutely eat the overhead of exporting and
scheduling like two fences in 10ms.

Complex presentation uses (out-streaming, media sources, deeper
presentation chains) make the trivial present ioctl so complex that its
benefits evaporate. Wait-before-signal pushes so much complexity into the
compositor that you have to eat a lot of CPU overhead there and lose your
ability to do pipelined draws because you have to hang around and see if
they'll ever complete. Cross-device usage means everyone just ends up
spinning on the CPU instead.

So, can we take a step back? What are the problems we're trying to solve?
If it's about optimising the game engine's internal rendering, how would
that benefit from a present ioctl instead of current synchronisation?

If it's about composition, how do we balance the complexity between the
kernel and userspace? What's the global benefit from throwing our hands in
the air and saying 'you deal with it' to all of userspace, given that
existing mailbox systems making frame-by-frame decisions already preclude
deep/speculative pipelining on the client side?

Given that userspace then loses all ability to reason about presentation if
wait-before-signal becomes a thing, do we end up with a global performance
loss by replacing the overhead of kernel dma_fence handling with userspace
spinning on a page? Even if we micro-optimise that by allowing userspace to
be notified on access, is the overhead of pagefault -> kernel signal
handler -> queue signalfd notification -> userspace event loop -> read page
& compare to expected value, actually better than dma_fence?

Cheers,
Daniel

--0000000000000c7cd205c066caa3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Marek,</div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 19 Apr 2021 at 11:48, Ma=
rek Ol=C5=A1=C3=A1k &lt;<a href=3D"mailto:maraeo@gmail.com" target=3D"_blan=
k">maraeo@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr"><div><b>2. Explicit synchronization for=
 window systems and modesetting</b><br></div><div><br></div><div>The produc=
er is an application and the consumer is a compositor or a modesetting driv=
er.<br></div><div><br></div><div><b>2.1. The Present request</b></div></div=
></blockquote><div><br></div><div>So the &#39;present request&#39; is an io=
ctl, right? Not a userspace construct like it is today? If so, how do we co=
rrelate the two?</div><div><br></div><div>The terminology is pretty X11-cen=
tric so I&#39;ll assume that&#39;s what you&#39;ve designed against, but Wa=
yland and even X11 carry much more auxiliary information attached to a pres=
ent request than just &#39;this buffer, this swapchain&#39;. Wayland latche=
s a lot of data on presentation,=C2=A0including non-graphics data such as s=
urface geometry (so we can have resizes which don&#39;t suck), window state=
 (e.g. fullscreen or not, also so we can have resizes which don&#39;t suck)=
, and these requests can also cascade through a tree of subsurfaces (so we =
can have embeds which don&#39;t suck).=C2=A0X11 mostly just carries timesta=
mps, which is more tractable.</div><div><br></div><div>Given we don&#39;t w=
ant to move the entirety of Wayland into kernel-visible objects, how do we =
synchronise the two streams so they aren&#39;t incoherent? Taking a rough s=
tab at it whilst assuming we do have DRM_IOCTL_NONMODE_PRESENT, this would =
create a present object somewhere in kernel space, which the producer would=
 create and ?? export a FD from, that the compositor would ?? import.</div>=
<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div>As part of the Present request, the producer will pass 2 fenc=
es (sync objects) to the consumer alongside the presented DMABUF BO:</div><=
div>- The submit fence: Initially unsignalled, it will be signalled when th=
e producer has finished drawing into the presented buffer.<br></div></div><=
/blockquote><div><br></div><div>We have already have this in Wayland throug=
h dma_fence. I&#39;m relaxed about this becoming drm_syncobj or drm_newmapp=
edysncobjthing, it&#39;s just a matter of typing. X11 has patches to DRI3 t=
o support dma_fence, but they never got merged because it was far too invas=
ive to a server which is no longer maintained.</div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div></div><di=
v>- The return fence: Initially unsignalled, it will be signalled when the =
consumer has finished using the presented buffer.</div></div></blockquote><=
div><br></div><div>Currently in Wayland the return fence (again a dma_fence=
) is generated by the compositor and sent as an event when it&#39;s done, b=
ecause we can&#39;t have speculative/empty/future fences. drm_syncobj would=
 make this possible, but so far I&#39;ve been hesitant because I don&#39;t =
see the benefit to it (more below).</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Deadlock mitigation =
to recover from segfaults:</div><div>- The kernel knows which process is ob=
liged to signal which fence. This information is part of the Present reques=
t and supplied by userspace.<br></div></div></blockquote><div><br></div><di=
v>Same as today with dma_fence. Less true with drm_syncobj if we&#39;re usi=
ng timelines.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div></div><div>- If the producer crashes, the =
kernel signals the submit fence, so that the consumer can make forward prog=
ress.</div></div></blockquote><div><br></div><div>This is only a change if =
the producer is now allowed to submit a fence before it&#39;s flushed the w=
ork which would eventually fulfill that fence. Using dma_fence has so far i=
solated us from this.</div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr"><div>- If the consumer crashes, the ker=
nel signals the return fence, so that the producer can reclaim the buffer.<=
/div></div></blockquote><div><br></div><div>&#39;The consumer&#39; is probl=
ematic, per below. I think the wording you want is &#39;if no references ar=
e held to the submitted present object&#39;.</div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>- A GPU han=
g signals all fences. Other deadlocks will be handled like GPU hangs.<br></=
div><div><br></div><div>Other window system requests can follow the same id=
ea.</div></div></blockquote><div><br></div><div>Which other window system r=
equests did you have in mind? Again, moving the entirety of Wayland&#39;s s=
ignaling into the kernel is a total non-starter. Partly because it means ou=
r entire protocol would be subject to the kernel&#39;s ABI rules, partly be=
cause the rules and interdependencies between the requests are extremely co=
mplex, but mostly because the kernel is just a useless proxy: it would be f=
orced to do significant work to reason about what those requests do and whe=
n they should happen, but wouldn&#39;t be able to make those decisions itse=
lf so would have to just punt everything to userspace. Unless we have eBPF =
compositors.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div><div>Merged fences where one fence object =
contains multiple fences will be supported. A merged fence is signalled onl=
y when its fences are signalled. The consumer will have the option to redef=
ine the unsignalled return fence to a merged fence.</div></div></div></bloc=
kquote><div><br></div><div>An elaboration of how this differed from drm_syn=
cobj would be really helpful here. I can make some guesses based on the res=
t of the mail, but I&#39;m not sure how accurate they are.</div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><d=
iv><b>2.2. Modesetting</b><br></div><div><br></div><div>Since a modesetting=
 driver can also be the consumer, the present ioctl will contain a submit f=
ence and a return fence too.  One small problem with this is that userspace=
 can hang the modesetting=20
driver, but in theory, any later present ioctl can override the previous on=
e, so the unsignalled presentation is never used.</div></div></blockquote><=
div><br></div><div>This is also problematic. It&#39;s not just KMS, but med=
ia codecs too - V4L doesn&#39;t yet have explicit fencing, but given the pr=
ogramming model of codecs and how deeply they interoperate, but it will.</d=
iv><div><br></div><div>Rather than client (GPU) -&gt; compositor (GPU) -&gt=
; compositor (KMS), imagine you&#39;re playing a Steam game on your Chromeb=
ook which you&#39;re streaming via Twitch or whatever. The full chain looks=
 like:</div><div>* Steam game renders with GPU</div><div>* Xwayland in cont=
ainer receives dmabuf, forwards dmabuf to Wayland server (does not directly=
 consume)</div><div>* Wayland server (which is actually Chromium) receives =
dmabuf, forwards dmabuf to Chromium UI process</div><div>* Chromium UI proc=
ess forwards client dmabuf to KMS for direct scanout</div><div>* Chromium U=
I process _also_ forwards client dmabuf to GPU process</div><div>* Chromium=
 GPU process composites Chromium UI=C2=A0+ client dmabuf=C2=A0+ webcam fram=
e from V4L to GPU composition job</div><div>* Chromium GPU process forwards=
 GPU composition dmabuf (not client dmabuf) to media codec for streaming</d=
iv><div><br></div><div>So, we don&#39;t have a 1:1 producer:consumer relati=
onship. Even if we accept it&#39;s 1:n, your Chromebook is about to burst i=
nto flames and we&#39;re dropping frames to try to keep up. Some of the con=
sumers are FIFO (the codec wants to push things through in order), and some=
 of them are mailbox (the display wants to get the latest content, not from=
 half a second ago before the other player started jumping around and now y=
ou&#39;re dead). You can&#39;t reason about any of these dependencies ahead=
 of time from a producer PoV, because userspace will be making these decisi=
ons frame by frame. Also someone&#39;s started using the Vulkan present-tim=
ing extension because life wasn&#39;t confusing enough already.</div><div><=
br></div><div>As Christian and Daniel were getting at, there are also two &=
#39;levels&#39; of explicit synchronisation.</div><div><br></div><div>The f=
irst (let&#39;s call it &#39;blind&#39;) is plumbing a dma_fence through to=
 be passed with the dmabuf. When the client submits a buffer for presentati=
on, it submits a dma_fence as well. When the compositor is finished with it=
 (i.e. has flushed the last work which will source from that buffer), it pa=
sses a dma_fence back to the client, or no fence if required (buffer was ne=
ver accessed, or all accesses are known to be fully retired e.g. the last f=
ence accessing it has already signaled). This is just a matter of typing, a=
nd is supported by at least Weston. It implies no scheduling change over im=
plicit fencing in that the compositor can be held hostage by abusive client=
s with a really long compute shader in their dependency chain: all that&#39=
;s happening is that we&#39;re plumbing those synchronisation tokens throug=
h userspace instead of having the kernel dig them up from dma_resv. But we =
at least have a no-deadlock guarantee, because a dma_fence will complete in=
 bounded time.</div><div><br></div><div>The second (let&#39;s call it &#39;=
smart&#39;) is ... much more than that. Not only does the compositor accept=
 and generate explicit synchronisation points for the client, but those syn=
chronisation points aren&#39;t dma_fences, but may be wait-before-signal, o=
r may be wait-never-signal. So in order to avoid a terminal deadlock, the c=
ompositor has to sit on every synchronisation point and check before it flu=
shes any dependent work that it has signaled, or will at least signal in bo=
unded time. If that guarantee isn&#39;t there, you have to punt and see if =
anything happens at your next repaint point. We don&#39;t currently have th=
is support in any compositor, and it&#39;s a lot more work than blind.</div=
><div><br></div><div>Given the interdependencies I&#39;ve described above f=
or Wayland - say a resize case, or when a surface commit triggers a cascade=
 of subsurface commits - GPU-side conditional rendering is not always possi=
ble. In those cases, you _must_ do CPU-side waits and keep both sets of sta=
te around. Pain.</div><div><br></div><div>Typing all that out has convinced=
 me that the current proposal is a net loss in every case.</div><div><br></=
div><div>Complex rendering uses (game engine with a billion draw calls, a b=
illion BOs, complex sync dependencies, wait-before-signal and/or conditiona=
l rendering/descriptor indexing) don&#39;t need the complexity of a present=
 ioctl and checking whether other processes have crashed or whatever. They =
already have everything plumbed through for this themselves, and need to im=
plement so much infrastructure around it that they don&#39;t need much/any =
help from the kernel. Just give them a sync primitive with almost zero guar=
antees that they can map into CPU &amp; GPU address space, let them go wild=
 with it. drm_syncobj_plus_footgun. Good luck.</div><div><br></div><div>Sim=
ple presentation uses (desktop, browser, game) don&#39;t need the hyperopti=
misation of sync primitives. Frame times are relatively long, and you can o=
nly have so many surfaces which aren&#39;t occluded. Either you have a comp=
lex scene to composite, in which case the CPU overhead of something like dm=
a_fence is lower than the CPU overhead required to walk through a single co=
mpositor repaint cycle anyway, or you have a completely trivial scene to co=
mposite and you can absolutely eat the overhead of exporting and scheduling=
 like two fences in 10ms.</div><div><span><br></span></div><div><span>Compl=
ex presentation uses (out-streaming, media sources, deeper presentation cha=
ins) make the trivial present ioctl so complex that its benefits evaporate.=
 Wait-before-signal pushes so much complexity into the compositor that you =
have to eat a lot of CPU overhead there and lose your ability to do pipelin=
ed draws because you have to hang around and see if they&#39;ll ever comple=
te. Cross-device usage means everyone just ends up spinning on the CPU inst=
ead.</span></div><div><span><br></span></div><div><span>So, can we take a s=
tep back? What are the problems we&#39;re trying to solve? If it&#39;s abou=
t optimising the game engine&#39;s internal rendering, how would that benef=
it from a present ioctl instead of current synchronisation?</span></div><di=
v><span><br></span></div><div><span>If it&#39;s about composition, how do w=
e balance the complexity between the kernel and userspace? What&#39;s the g=
lobal benefit from throwing our hands in the air and saying &#39;you deal w=
ith it&#39; to all of userspace, given that existing mailbox systems making=
 frame-by-frame decisions already preclude deep/speculative pipelining on t=
he client side?</span></div><div><span><br></span></div><div><span>Given th=
at userspace then loses all ability to reason about presentation if wait-be=
fore-signal becomes a thing, do we end up with a global performance loss by=
 replacing the overhead of kernel dma_fence handling with userspace spinnin=
g on a page? Even if we micro-optimise that by allowing userspace to be not=
ified on access, is the overhead of pagefault -&gt; kernel signal handler -=
&gt; queue signalfd notification -&gt; userspace event loop -&gt; read page=
 &amp; compare to expected value, actually better than dma_fence?</span></d=
iv><div><span><br></span></div><div><span>Cheers,</span></div><div><span>Da=
niel=C2=A0</span></div></div></div>

--0000000000000c7cd205c066caa3--

--===============2088955798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2088955798==--
