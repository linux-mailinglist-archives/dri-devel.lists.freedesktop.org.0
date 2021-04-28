Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBBD36D19C
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 07:20:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 287AA6EA99;
	Wed, 28 Apr 2021 05:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A7D6EA99;
 Wed, 28 Apr 2021 05:20:06 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id t21so1055948plo.2;
 Tue, 27 Apr 2021 22:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0nJdSUOT2ZLHt/Ci8K1eVf9vho0jKv1jKO+dhCK1E9E=;
 b=mPLWdHvCyYsbQHkn5yiRL0XODthOi3hM/g10uHRf7gmYDUnAzuf8lj5HHRB5axLjgw
 9zZpwt85420BGFjOh4bQaC4ah1JADL759ohMShakr9+zSO6KHyP9GN9EGiG0KtMuBZzp
 kHXEwcrLSN8O3BBP0dNEPt9q084GNmJ1Im3W22/9ICMTGk1apEknFIQoNMGX/uT9ekNO
 CXf52PeU8WE4tJtKuNTwhEIZih6C6ZAHj7SluWbfLLAUxgCJ08gNzcQ61in4AkGItku4
 ydv4LknWSGtIJyMJmAQTnFvBoRE5lXUXS0FHQa5AlNvRhqtpiP8O+Lq/sbgVbBg7Vugs
 ccEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0nJdSUOT2ZLHt/Ci8K1eVf9vho0jKv1jKO+dhCK1E9E=;
 b=fxfIhWcFU1OBWOLI39QcolIWarC7uK6xHYKTWz8HdKPUXmvFxCgKBmlEsAY4T+O5R/
 FlQRsg81wpxPoO91VhtL45eAObM0WoT4lWI8THYFcLX29JdiNIB+0NU/l8bfkOaDjmkD
 bKoWXH+2jnAE/eDxWoD8zO74566h60Bqqx21RUnLQe8kM+v4IAmySsh5BBM6bGtYrBaz
 Ht1czoNs7haww4B4zGG1Njgdn7AHNyKEEtJ6BABfviTJhkJJDufEO4uKPC55RJf4rMnD
 3fv/u5armbcsGA9U7DVTxiSQDXdUdJzhrFFxMdwJf+yYFefJH1yRach+gk59/4WIRmwy
 kjPQ==
X-Gm-Message-State: AOAM531wLsD4VidcEt3CULf1AX9hVcVI8h5Kq65Oog8m2rc/YgaIAY3K
 UD2722uBQUQAhuwr8HNUScjZXuwX3468JRAc254DbyNR2pO1ww==
X-Google-Smtp-Source: ABdhPJwFnozyf5ZYCeLVE346Q1sQAmOmPO5eNJuvFkWiqC7bjcUiFOhxiVx8JbxjuU/tf/SlB6ZqzOSF3krGxKD+VxI=
X-Received: by 2002:a17:90b:3796:: with SMTP id
 mz22mr1994510pjb.80.1619587205567; 
 Tue, 27 Apr 2021 22:20:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
 <CAPj87rMn_gabTdZpHGQVa16Log8xFe8fvhcL_WSC6tyOMvmY=w@mail.gmail.com>
 <CAOFGe96c1SxHiUBzapbVFx1h0aOwF=X8hcStVZmrw4OjrrG+Zg@mail.gmail.com>
 <CAPj87rPSW13nxz2n5E+n0JYcwGR3mFWJAG2kYaaoav7A-ZVD2g@mail.gmail.com>
 <CAKMK7uHyTiFWwQWdxVk1am+KoFA9DsTnJ658CAhzBYOyg7AdsA@mail.gmail.com>
 <CAPj87rM=qf78kUvys1irnR8Djh=CLjRdQJt1V4je82-=+yPWYw@mail.gmail.com>
 <CAKMK7uEAu4FgYwN9t9AMCqD2nVbkSRbGP3tST4nY1nKP26+vxA@mail.gmail.com>
 <CAPj87rOfv0w8jF4CO8PUHQXTfq+2GE=BDmRRWjOMkQ0wH3CPAA@mail.gmail.com>
 <CAAxE2A5pJ-D7AFbDJLKPDztr=yzOSDSm=3HrnJOWr3r96_KOQQ@mail.gmail.com>
 <YIfFC3YST0cfzd3l@phenom.ffwll.local>
 <CAAxE2A6APcJBwnbq58HOqc5bkHMsrzpiNnrso85kfBkRowwz+g@mail.gmail.com>
 <fada1543-612d-369e-765c-f90b718c2cfa@gmail.com>
 <CAAxE2A7a5+q2j1txN-FxWBvKOoPSRKAZ9iPPeTSjMZDbgJCU-A@mail.gmail.com>
 <CAKMK7uHXSnDetsK1VG-X4ZwUZdA819wUKd=YMgqF=yvAQ6Y2vw@mail.gmail.com>
 <CAAxE2A4BhDZL2rrV1KEXPzmKnOq4DXmkFm=4K5XZoY-Cj0uT=Q@mail.gmail.com>
 <735e0d2e-f2c9-c546-ea6c-b5bbb0fe03a6@gmail.com>
 <CAAxE2A4FwZ11_opL++TPUViTOD6ZpV5b3MR+rTDUPvzqYz-oeQ@mail.gmail.com>
 <23ea06c825279c7a9f7678b335c7f89437d387ed.camel@pengutronix.de>
 <CAOFGe95C78mqV-8-o7PgZ1RZu-OJATVzK4wsS2k9ojXh6ba-tA@mail.gmail.com>
 <CAAxE2A7EwWqOVhKGEMhA3tvSUH-_J=tKf97kHa2VDEaRTfOxTA@mail.gmail.com>
 <CAOFGe94axHAg8aboDx5tmoVU7CpnspfKwOqdq_+PkDxhoiHTkg@mail.gmail.com>
In-Reply-To: <CAOFGe94axHAg8aboDx5tmoVU7CpnspfKwOqdq_+PkDxhoiHTkg@mail.gmail.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Wed, 28 Apr 2021 01:19:16 -0400
Message-ID: <CAAxE2A4xCPRqiFkZzmvknEMz0_QGqqD+PFRQVAJFrO4Q0mW75Q@mail.gmail.com>
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1695728040=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1695728040==
Content-Type: multipart/alternative; boundary="0000000000001217be05c1018801"

--0000000000001217be05c1018801
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed., Apr. 28, 2021, 00:01 Jason Ekstrand, <jason@jlekstrand.net> wrote:

> On Tue, Apr 27, 2021 at 4:59 PM Marek Ol=C5=A1=C3=A1k <maraeo@gmail.com> =
wrote:
> >
> > Jason, both memory-based signalling as well as interrupt-based
> signalling to the CPU would be supported by amdgpu. External devices don'=
t
> need to support memory-based sync objects. The only limitation is that th=
ey
> can't convert amdgpu sync objects to dma_fence.
>
> Sure.  I'm not worried about the mechanism.  We just need a word that
> means "the new fence thing" and I've been throwing "memory fence"
> around for that.  Other mechanisms may work as well.
>
> > The sad thing is that "external -> amdgpu" dependencies are really
> "external <-> amdgpu" dependencies due to mutually-exclusive access
> required by non-explicitly-sync'd buffers, so amdgpu-amdgpu interop is th=
e
> only interop that would initially work with those buffers. Explicitly
> sync'd buffers also won't work if other drivers convert explicit fences t=
o
> dma_fence. Thus, both implicit sync and explicit sync might not work with
> other drivers at all. The only interop that would initially work is
> explicit fences with memory-based waiting and signalling on the external
> device to keep the kernel out of the picture.
>
> Yup.  This is where things get hard.  That said, I'm not quite ready
> to give up on memory/interrupt fences just yet.
>
> One thought that came to mind which might help would be if we added an
> extremely strict concept of memory ownership.  The idea would be that
> any given BO would be in one of two states at any given time:
>
>  1. legacy: dma_fences and implicit sync works as normal but it cannot
> be resident in any "modern" (direct submission, ULLS, whatever you
> want to call it) context
>
>  2. modern: In this mode they should not be used by any legacy
> context.  We can't strictly prevent this, unfortunately, but maybe we
> can say reading produces garbage and writes may be discarded.  In this
> mode, they can be bound to modern contexts.
>
> In theory, when in "modern" mode, you could bind the same buffer in
> multiple modern contexts at a time.  However, when that's the case, it
> makes ownership really tricky to track.  Therefore, we might want some
> sort of dma-buf create flag for "always modern" vs. "switchable" and
> only allow binding to one modern context at a time when it's
> switchable.
>
> If we did this, we may be able to move any dma_fence shenanigans to
> the ownership transition points.  We'd still need some sort of "wait
> for fence and transition" which has a timeout.  However, then we'd be
> fairly well guaranteed that the application (not just Mesa!) has
> really and truly decided it's done with the buffer and we wouldn't (I
> hope!) end up with the accidental edges in the dependency graph.
>
> Of course, I've not yet proven any of this correct so feel free to
> tell me why it won't work. :-)  It was just one of those "about to go
> to bed and had a thunk" type thoughts.
>

We'd like to keep userspace outside of Mesa drivers intact and working
except for interop where we don't have much choice. At the same time,
future hw may remove support for kernel queues, so we might not have much
choice there either, depending on what the hw interface will look like.

The idea is to have an ioctl for querying a timeline semaphore buffer
associated with a shared BO, and an ioctl for querying the next wait and
signal number (e.g. n and n+1) for that semaphore. Waiting for n would be
like mutex lock and signaling would be like mutex unlock. The next process
would use the same ioctl and get n+1 and n+2, etc. There is a deadlock
condition because one process can do lock A, lock B, and another can do
lock B, lock A, which can be prevented such that the ioctl that returns the
numbers would return them for multiple buffers at once. This solution needs
no changes to userspace outside of Mesa drivers, and we'll also keep the BO
wait ioctl for GPU-CPU sync.

Marek


> --Jason
>
> P.S.  Daniel was 100% right when he said this discussion needs a glossary=
.
>
>
> > Marek
> >
> >
> > On Tue, Apr 27, 2021 at 3:41 PM Jason Ekstrand <jason@jlekstrand.net>
> wrote:
> >>
> >> Trying to figure out which e-mail in this mess is the right one to
> reply to....
> >>
> >> On Tue, Apr 27, 2021 at 12:31 PM Lucas Stach <l.stach@pengutronix.de>
> wrote:
> >> >
> >> > Hi,
> >> >
> >> > Am Dienstag, dem 27.04.2021 um 09:26 -0400 schrieb Marek Ol=C5=A1=C3=
=A1k:
> >> > > Ok. So that would only make the following use cases broken for now=
:
> >> > > - amd render -> external gpu
> >>
> >> Assuming said external GPU doesn't support memory fences.  If we do
> >> amdgpu and i915 at the same time, that covers basically most of the
> >> external GPU use-cases.  Of course, we'd want to convert nouveau as
> >> well for the rest.
> >>
> >> > > - amd video encode -> network device
> >> >
> >> > FWIW, "only" breaking amd render -> external gpu will make us pretty
> >> > unhappy, as we have some cases where we are combining an AMD APU wit=
h
> a
> >> > FPGA based graphics card. I can't go into the specifics of this use-
> >> > case too much but basically the AMD graphics is rendering content th=
at
> >> > gets composited on top of a live video pipeline running through the
> >> > FPGA.
> >>
> >> I think it's worth taking a step back and asking what's being here
> >> before we freak out too much.  If we do go this route, it doesn't mean
> >> that your FPGA use-case can't work, it just means it won't work
> >> out-of-the box anymore.  You'll have to separate execution and memory
> >> dependencies inside your FPGA driver.  That's still not great but it's
> >> not as bad as you maybe made it sound.
> >>
> >> > > What about the case when we get a buffer from an external device a=
nd
> >> > > we're supposed to make it "busy" when we are using it, and the
> >> > > external device wants to wait until we stop using it? Is it
> something
> >> > > that can happen, thus turning "external -> amd" into "external <->
> >> > > amd"?
> >> >
> >> > Zero-copy texture sampling from a video input certainly appreciates
> >> > this very much. Trying to pass the render fence through the various
> >> > layers of userspace to be able to tell when the video input can reus=
e
> a
> >> > buffer is a great experience in yak shaving. Allowing the video inpu=
t
> >> > to reuse the buffer as soon as the read dma_fence from the GPU is
> >> > signaled is much more straight forward.
> >>
> >> Oh, it's definitely worse than that.  Every window system interaction
> >> is bi-directional.  The X server has to wait on the client before
> >> compositing from it and the client has to wait on X before re-using
> >> that back-buffer.  Of course, we can break that later dependency by
> >> doing a full CPU wait but that's going to mean either more latency or
> >> reserving more back buffers.  There's no good clean way to claim that
> >> any of this is one-directional.
> >>
> >> --Jason
>

--0000000000001217be05c1018801
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Wed., Apr. 28, 2021, 00:01 Jason Ekstrand, &lt;<a href=3D"m=
ailto:jason@jlekstrand.net" target=3D"_blank" rel=3D"noreferrer">jason@jlek=
strand.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Tue, =
Apr 27, 2021 at 4:59 PM Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"mailto:maraeo@=
gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">maraeo@gmail.com=
</a>&gt; wrote:<br>
&gt;<br>
&gt; Jason, both memory-based signalling as well as interrupt-based signall=
ing to the CPU would be supported by amdgpu. External devices don&#39;t nee=
d to support memory-based sync objects. The only limitation is that they ca=
n&#39;t convert amdgpu sync objects to dma_fence.<br>
<br>
Sure.=C2=A0 I&#39;m not worried about the mechanism.=C2=A0 We just need a w=
ord that<br>
means &quot;the new fence thing&quot; and I&#39;ve been throwing &quot;memo=
ry fence&quot;<br>
around for that.=C2=A0 Other mechanisms may work as well.<br>
<br>
&gt; The sad thing is that &quot;external -&gt; amdgpu&quot; dependencies a=
re really &quot;external &lt;-&gt; amdgpu&quot; dependencies due to mutuall=
y-exclusive access required by non-explicitly-sync&#39;d buffers, so amdgpu=
-amdgpu interop is the only interop that would initially work with those bu=
ffers. Explicitly sync&#39;d buffers also won&#39;t work if other drivers c=
onvert explicit fences to dma_fence. Thus, both implicit sync and explicit =
sync might not work with other drivers at all. The only interop that would =
initially work is explicit fences with memory-based waiting and signalling =
on the external device to keep the kernel out of the picture.<br>
<br>
Yup.=C2=A0 This is where things get hard.=C2=A0 That said, I&#39;m not quit=
e ready<br>
to give up on memory/interrupt fences just yet.<br>
<br>
One thought that came to mind which might help would be if we added an<br>
extremely strict concept of memory ownership.=C2=A0 The idea would be that<=
br>
any given BO would be in one of two states at any given time:<br>
<br>
=C2=A01. legacy: dma_fences and implicit sync works as normal but it cannot=
<br>
be resident in any &quot;modern&quot; (direct submission, ULLS, whatever yo=
u<br>
want to call it) context<br>
<br>
=C2=A02. modern: In this mode they should not be used by any legacy<br>
context.=C2=A0 We can&#39;t strictly prevent this, unfortunately, but maybe=
 we<br>
can say reading produces garbage and writes may be discarded.=C2=A0 In this=
<br>
mode, they can be bound to modern contexts.<br>
<br>
In theory, when in &quot;modern&quot; mode, you could bind the same buffer =
in<br>
multiple modern contexts at a time.=C2=A0 However, when that&#39;s the case=
, it<br>
makes ownership really tricky to track.=C2=A0 Therefore, we might want some=
<br>
sort of dma-buf create flag for &quot;always modern&quot; vs. &quot;switcha=
ble&quot; and<br>
only allow binding to one modern context at a time when it&#39;s<br>
switchable.<br>
<br>
If we did this, we may be able to move any dma_fence shenanigans to<br>
the ownership transition points.=C2=A0 We&#39;d still need some sort of &qu=
ot;wait<br>
for fence and transition&quot; which has a timeout.=C2=A0 However, then we&=
#39;d be<br>
fairly well guaranteed that the application (not just Mesa!) has<br>
really and truly decided it&#39;s done with the buffer and we wouldn&#39;t =
(I<br>
hope!) end up with the accidental edges in the dependency graph.<br>
<br>
Of course, I&#39;ve not yet proven any of this correct so feel free to<br>
tell me why it won&#39;t work. :-)=C2=A0 It was just one of those &quot;abo=
ut to go<br>
to bed and had a thunk&quot; type thoughts.<br></blockquote></div></div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">We&#39;d like to keep userspace =
outside of Mesa drivers intact and working except for interop where we don&=
#39;t have much choice. At the same time, future hw may remove support for =
kernel queues, so we might not have much choice there either, depending on =
what the hw interface will look like.</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">The idea is to have an ioctl for querying a timeline semaphor=
e buffer associated with a shared BO, and an ioctl for querying the next wa=
it and signal number (e.g. n and n+1) for that semaphore. Waiting for n wou=
ld be like mutex lock and signaling would be like mutex unlock. The next pr=
ocess would use the same ioctl and get n+1 and n+2, etc. There is a deadloc=
k condition because one process can do lock A, lock B, and another can do l=
ock B, lock A, which can be prevented such that the ioctl that returns the =
numbers would return them for multiple buffers at once. This solution needs=
 no changes to userspace outside of Mesa drivers, and we&#39;ll also keep t=
he BO wait ioctl for GPU-CPU sync.</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">Marek</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div cl=
ass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
--Jason<br>
<br>
P.S.=C2=A0 Daniel was 100% right when he said this discussion needs a gloss=
ary.<br>
<br>
<br>
&gt; Marek<br>
&gt;<br>
&gt;<br>
&gt; On Tue, Apr 27, 2021 at 3:41 PM Jason Ekstrand &lt;<a href=3D"mailto:j=
ason@jlekstrand.net" rel=3D"noreferrer noreferrer" target=3D"_blank">jason@=
jlekstrand.net</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Trying to figure out which e-mail in this mess is the right one to=
 reply to....<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Apr 27, 2021 at 12:31 PM Lucas Stach &lt;<a href=3D"mailto=
:l.stach@pengutronix.de" rel=3D"noreferrer noreferrer" target=3D"_blank">l.=
stach@pengutronix.de</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hi,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Am Dienstag, dem 27.04.2021 um 09:26 -0400 schrieb Marek Ol=
=C5=A1=C3=A1k:<br>
&gt;&gt; &gt; &gt; Ok. So that would only make the following use cases brok=
en for now:<br>
&gt;&gt; &gt; &gt; - amd render -&gt; external gpu<br>
&gt;&gt;<br>
&gt;&gt; Assuming said external GPU doesn&#39;t support memory fences.=C2=
=A0 If we do<br>
&gt;&gt; amdgpu and i915 at the same time, that covers basically most of th=
e<br>
&gt;&gt; external GPU use-cases.=C2=A0 Of course, we&#39;d want to convert =
nouveau as<br>
&gt;&gt; well for the rest.<br>
&gt;&gt;<br>
&gt;&gt; &gt; &gt; - amd video encode -&gt; network device<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; FWIW, &quot;only&quot; breaking amd render -&gt; external gpu=
 will make us pretty<br>
&gt;&gt; &gt; unhappy, as we have some cases where we are combining an AMD =
APU with a<br>
&gt;&gt; &gt; FPGA based graphics card. I can&#39;t go into the specifics o=
f this use-<br>
&gt;&gt; &gt; case too much but basically the AMD graphics is rendering con=
tent that<br>
&gt;&gt; &gt; gets composited on top of a live video pipeline running throu=
gh the<br>
&gt;&gt; &gt; FPGA.<br>
&gt;&gt;<br>
&gt;&gt; I think it&#39;s worth taking a step back and asking what&#39;s be=
ing here<br>
&gt;&gt; before we freak out too much.=C2=A0 If we do go this route, it doe=
sn&#39;t mean<br>
&gt;&gt; that your FPGA use-case can&#39;t work, it just means it won&#39;t=
 work<br>
&gt;&gt; out-of-the box anymore.=C2=A0 You&#39;ll have to separate executio=
n and memory<br>
&gt;&gt; dependencies inside your FPGA driver.=C2=A0 That&#39;s still not g=
reat but it&#39;s<br>
&gt;&gt; not as bad as you maybe made it sound.<br>
&gt;&gt;<br>
&gt;&gt; &gt; &gt; What about the case when we get a buffer from an externa=
l device and<br>
&gt;&gt; &gt; &gt; we&#39;re supposed to make it &quot;busy&quot; when we a=
re using it, and the<br>
&gt;&gt; &gt; &gt; external device wants to wait until we stop using it? Is=
 it something<br>
&gt;&gt; &gt; &gt; that can happen, thus turning &quot;external -&gt; amd&q=
uot; into &quot;external &lt;-&gt;<br>
&gt;&gt; &gt; &gt; amd&quot;?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Zero-copy texture sampling from a video input certainly appre=
ciates<br>
&gt;&gt; &gt; this very much. Trying to pass the render fence through the v=
arious<br>
&gt;&gt; &gt; layers of userspace to be able to tell when the video input c=
an reuse a<br>
&gt;&gt; &gt; buffer is a great experience in yak shaving. Allowing the vid=
eo input<br>
&gt;&gt; &gt; to reuse the buffer as soon as the read dma_fence from the GP=
U is<br>
&gt;&gt; &gt; signaled is much more straight forward.<br>
&gt;&gt;<br>
&gt;&gt; Oh, it&#39;s definitely worse than that.=C2=A0 Every window system=
 interaction<br>
&gt;&gt; is bi-directional.=C2=A0 The X server has to wait on the client be=
fore<br>
&gt;&gt; compositing from it and the client has to wait on X before re-usin=
g<br>
&gt;&gt; that back-buffer.=C2=A0 Of course, we can break that later depende=
ncy by<br>
&gt;&gt; doing a full CPU wait but that&#39;s going to mean either more lat=
ency or<br>
&gt;&gt; reserving more back buffers.=C2=A0 There&#39;s no good clean way t=
o claim that<br>
&gt;&gt; any of this is one-directional.<br>
&gt;&gt;<br>
&gt;&gt; --Jason<br>
</blockquote></div></div></div>

--0000000000001217be05c1018801--

--===============1695728040==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1695728040==--
