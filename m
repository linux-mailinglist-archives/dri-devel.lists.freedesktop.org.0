Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C615837216D
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 22:37:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F996E15D;
	Mon,  3 May 2021 20:37:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5557C6E15D;
 Mon,  3 May 2021 20:37:33 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id i14so4608014pgk.5;
 Mon, 03 May 2021 13:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y9oo+mUfvjBQPDETheiclJxE8tqzhR2227yLm6iBQDM=;
 b=LmjnSHjx+ndsXLa1A5Vc6sDYca3WmMmd59kU5K+DfshUcYXZjTukv23negVApb4dBM
 r/GLsYgUPC59MawiueGIskR40+58BdGrJ2bz1QaucYZpWHD0gYfVwKM2A2ZGJeR/ZuIN
 +PfR9Kq8x8a8ijMh/JLWX+LnvENB7g2Y6zVEoDuX/4GCRilaxx3E30CxHtwUubdvYAyD
 YiT3fABSufS8q+IBW6CkFl22SZtkBIvvNqxIz6B6gldGjrKo902lk+d5CUEZvn93OU+f
 gbi0eBJ5lYfkXExbOkrdlVfXriLd62oDpmj6ik6bQ3+3Oe0HVD7kj7xegUQapcIr1aPL
 Lebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y9oo+mUfvjBQPDETheiclJxE8tqzhR2227yLm6iBQDM=;
 b=EQOQnNnQxv1xAHxp2Hu6bAgyid/JKBHkowOhC0V7yEzwTEesw2AtbxlHOHYvQEgZW1
 CW6+z+s+8Ehtcv6oeOEwlhUmeMbXHnXZS0ZO5OGgT8bRLDxMOJAtj8WIkreea++hyJx/
 FLVMky2w0qX+y0+OhhY1FIW6zAYSePZFqeGPyz60txig7aI/3nbQ2sfar15wTflROhec
 x/0PBQVrNPLn7VEBxq369MemCTaeHkSEVg9QLbIRTQveQJ9lYTfQpB+cBkfqkk0UI/N+
 jWypkC1xMnhXvgGWZmUAanHFK6z3+HkaGpJGO/N9ke2IQiRwlNkgdiQ+Kc0HTLOjatq3
 5rQA==
X-Gm-Message-State: AOAM5317wfW06d27PgQ4ljYYwK5v42vjHmVR+7UDxAg9+Osl/npeXExT
 FLJ4/M58oM1RAgqGgkAdIUpNWD/vBEFg+2nvMXMq1DM4Fcs=
X-Google-Smtp-Source: ABdhPJxjZFX0brNTGE+A2JPBM2ToO+gjGWTb7psurczE9moiWXe53WQAM5MjcVcVEOA3fohR0tiOQpi73A4auFVtJ/0=
X-Received: by 2002:a17:90b:3796:: with SMTP id
 mz22mr546122pjb.80.1620074252785; 
 Mon, 03 May 2021 13:37:32 -0700 (PDT)
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
 <CAPM=9tzz2u_qUXU9LMvtH_NDr1_wzunPo7Mt6NkrwAuowWTp7Q@mail.gmail.com>
 <CAAxE2A55Te6DjabYH8ELyfM03x2ZDaLsCsNC4Zqkrq0ExdpeHA@mail.gmail.com>
 <153487a3-082b-faf7-2a4d-ae15993b2a5d@gmail.com>
 <d6fbc1a3-ee69-d53e-0a60-9a313be19cac@daenzer.net>
 <CAAxE2A5V2YPRnPSue6cjsMWiWHoabmBiFEAsPXykO5-CCyunwQ@mail.gmail.com>
 <CADnq5_N7Wi0qzMmyVMY_PqM=BBF8mH7o1jcGRYNYB-StsM4uOA@mail.gmail.com>
 <CAOFGe961tB38dE=gzte4OTGNMOpUsW2ikrB03+t=eh4pDYFh5g@mail.gmail.com>
 <CAP+8YyGkP2n9v2mJM5UH4NJrA6bE9+2Bgs1-6HrPPPMCrFz9dw@mail.gmail.com>
 <CAOFGe94JAO0OBiiwp8+hd=XCsrGLA1fVxqxePtPdHFg+YBB0dg@mail.gmail.com>
In-Reply-To: <CAOFGe94JAO0OBiiwp8+hd=XCsrGLA1fVxqxePtPdHFg+YBB0dg@mail.gmail.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Mon, 3 May 2021 16:36:56 -0400
Message-ID: <CAAxE2A50Lg+ehW3LSiTnvGRqHTR8tW77V7wES1PaCnbHVkzMug@mail.gmail.com>
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
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0065320585=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0065320585==
Content-Type: multipart/alternative; boundary="00000000000058dc7105c172ee2f"

--00000000000058dc7105c172ee2f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

What about direct submit from the kernel where the process still has write
access to the GPU ring buffer but doesn't use it? I think that solves your
preemption example, but leaves a potential backdoor for a process to
overwrite the signal commands, which shouldn't be a problem since we are OK
with timeouts.

Marek

On Mon, May 3, 2021 at 11:23 AM Jason Ekstrand <jason@jlekstrand.net> wrote=
:

> On Mon, May 3, 2021 at 10:16 AM Bas Nieuwenhuizen
> <bas@basnieuwenhuizen.nl> wrote:
> >
> > On Mon, May 3, 2021 at 5:00 PM Jason Ekstrand <jason@jlekstrand.net>
> wrote:
> > >
> > > Sorry for the top-post but there's no good thing to reply to here...
> > >
> > > One of the things pointed out to me recently by Daniel Vetter that I
> > > didn't fully understand before is that dma_buf has a very subtle
> > > second requirement beyond finite time completion:  Nothing required
> > > for signaling a dma-fence can allocate memory.  Why?  Because the act
> > > of allocating memory may wait on your dma-fence.  This, as it turns
> > > out, is a massively more strict requirement than finite time
> > > completion and, I think, throws out all of the proposals we have so
> > > far.
> > >
> > > Take, for instance, Marek's proposal for userspace involvement with
> > > dma-fence by asking the kernel for a next serial and the kernel
> > > trusting userspace to signal it.  That doesn't work at all if
> > > allocating memory to trigger a dma-fence can blow up.  There's simply
> > > no way for the kernel to trust userspace to not do ANYTHING which
> > > might allocate memory.  I don't even think there's a way userspace ca=
n
> > > trust itself there.  It also blows up my plan of moving the fences to
> > > transition boundaries.
> > >
> > > Not sure where that leaves us.
> >
> > Honestly the more I look at things I think userspace-signalable fences
> > with a timeout sound like they are a valid solution for these issues.
> > Especially since (as has been mentioned countless times in this email
> > thread) userspace already has a lot of ways to cause timeouts and or
> > GPU hangs through GPU work already.
> >
> > Adding a timeout on the signaling side of a dma_fence would ensure:
> >
> > - The dma_fence signals in finite time
> > -  If the timeout case does not allocate memory then memory allocation
> > is not a blocker for signaling.
> >
> > Of course you lose the full dependency graph and we need to make sure
> > garbage collection of fences works correctly when we have cycles.
> > However, the latter sounds very doable and the first sounds like it is
> > to some extent inevitable.
> >
> > I feel like I'm missing some requirement here given that we
> > immediately went to much more complicated things but can't find it.
> > Thoughts?
>
> Timeouts are sufficient to protect the kernel but they make the fences
> unpredictable and unreliable from a userspace PoV.  One of the big
> problems we face is that, once we expose a dma_fence to userspace,
> we've allowed for some pretty crazy potential dependencies that
> neither userspace nor the kernel can sort out.  Say you have marek's
> "next serial, please" proposal and a multi-threaded application.
> Between time time you ask the kernel for a serial and get a dma_fence
> and submit the work to signal that serial, your process may get
> preempted, something else shoved in which allocates memory, and then
> we end up blocking on that dma_fence.  There's no way userspace can
> predict and defend itself from that.
>
> So I think where that leaves us is that there is no safe place to
> create a dma_fence except for inside the ioctl which submits the work
> and only after any necessary memory has been allocated.  That's a
> pretty stiff requirement.  We may still be able to interact with
> userspace a bit more explicitly but I think it throws any notion of
> userspace direct submit out the window.
>
> --Jason
>
>
> > - Bas
> > >
> > > --Jason
> > >
> > > On Mon, May 3, 2021 at 9:42 AM Alex Deucher <alexdeucher@gmail.com>
> wrote:
> > > >
> > > > On Sat, May 1, 2021 at 6:27 PM Marek Ol=C5=A1=C3=A1k <maraeo@gmail.=
com> wrote:
> > > > >
> > > > > On Wed, Apr 28, 2021 at 5:07 AM Michel D=C3=A4nzer <michel@daenze=
r.net>
> wrote:
> > > > >>
> > > > >> On 2021-04-28 8:59 a.m., Christian K=C3=B6nig wrote:
> > > > >> > Hi Dave,
> > > > >> >
> > > > >> > Am 27.04.21 um 21:23 schrieb Marek Ol=C5=A1=C3=A1k:
> > > > >> >> Supporting interop with any device is always possible. It
> depends on which drivers we need to interoperate with and update them.
> We've already found the path forward for amdgpu. We just need to find out
> how many other drivers need to be updated and evaluate the cost/benefit
> aspect.
> > > > >> >>
> > > > >> >> Marek
> > > > >> >>
> > > > >> >> On Tue, Apr 27, 2021 at 2:38 PM Dave Airlie <airlied@gmail.co=
m
> <mailto:airlied@gmail.com>> wrote:
> > > > >> >>
> > > > >> >>     On Tue, 27 Apr 2021 at 22:06, Christian K=C3=B6nig
> > > > >> >>     <ckoenig.leichtzumerken@gmail.com <mailto:
> ckoenig.leichtzumerken@gmail.com>> wrote:
> > > > >> >>     >
> > > > >> >>     > Correct, we wouldn't have synchronization between devic=
e
> with and without user queues any more.
> > > > >> >>     >
> > > > >> >>     > That could only be a problem for A+I Laptops.
> > > > >> >>
> > > > >> >>     Since I think you mentioned you'd only be enabling this o=
n
> newer
> > > > >> >>     chipsets, won't it be a problem for A+A where one A is a
> generation
> > > > >> >>     behind the other?
> > > > >> >>
> > > > >> >
> > > > >> > Crap, that is a good point as well.
> > > > >> >
> > > > >> >>
> > > > >> >>     I'm not really liking where this is going btw, seems like
> a ill
> > > > >> >>     thought out concept, if AMD is really going down the road
> of designing
> > > > >> >>     hw that is currently Linux incompatible, you are going to
> have to
> > > > >> >>     accept a big part of the burden in bringing this support
> in to more
> > > > >> >>     than just amd drivers for upcoming generations of gpu.
> > > > >> >>
> > > > >> >
> > > > >> > Well we don't really like that either, but we have no other
> option as far as I can see.
> > > > >>
> > > > >> I don't really understand what "future hw may remove support for
> kernel queues" means exactly. While the per-context queues can be mapped =
to
> userspace directly, they don't *have* to be, do they? I.e. the kernel
> driver should be able to either intercept userspace access to the queues,
> or in the worst case do it all itself, and provide the existing
> synchronization semantics as needed?
> > > > >>
> > > > >> Surely there are resource limits for the per-context queues, so
> the kernel driver needs to do some kind of virtualization / multi-plexing
> anyway, or we'll get sad user faces when there's no queue available for
> <current hot game>.
> > > > >>
> > > > >> I'm probably missing something though, awaiting enlightenment. :=
)
> > > > >
> > > > >
> > > > > The hw interface for userspace is that the ring buffer is mapped
> to the process address space alongside a doorbell aperture (4K page) that
> isn't real memory, but when the CPU writes into it, it tells the hw
> scheduler that there are new GPU commands in the ring buffer. Userspace
> inserts all the wait, draw, and signal commands into the ring buffer and
> then "rings" the doorbell. It's my understanding that the ring buffer and
> the doorbell are always mapped in the same GPU address space as the
> process, which makes it very difficult to emulate the current protected
> ring buffers in the kernel. The VMID of the ring buffer is also not
> changeable.
> > > > >
> > > >
> > > > The doorbell does not have to be mapped into the process's GPU
> virtual
> > > > address space.  The CPU could write to it directly.  Mapping it int=
o
> > > > the GPU's virtual address space would allow you to have a device ki=
ck
> > > > off work however rather than the CPU.  E.g., the GPU could kick off
> > > > it's own work or multiple devices could kick off work without CPU
> > > > involvement.
> > > >
> > > > Alex
> > > >
> > > >
> > > > > The hw scheduler doesn't do any synchronization and it doesn't se=
e
> any dependencies. It only chooses which queue to execute, so it's really
> just a simple queue manager handling the virtualization aspect and not mu=
ch
> else.
> > > > >
> > > > > Marek
> > > > > _______________________________________________
> > > > > dri-devel mailing list
> > > > > dri-devel@lists.freedesktop.org
> > > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > > > _______________________________________________
> > > > mesa-dev mailing list
> > > > mesa-dev@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/mesa-dev
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--00000000000058dc7105c172ee2f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>What about direct submit from the kernel where the pr=
ocess still has write access to the GPU ring buffer but doesn&#39;t use it?=
 I think that solves your preemption example, but leaves a potential backdo=
or for a process to overwrite the signal commands, which shouldn&#39;t be a=
 problem since we are OK with timeouts.<br></div><div><br></div><div>Marek<=
br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Mon, May 3, 2021 at 11:23 AM Jason Ekstrand &lt;<a href=3D"mail=
to:jason@jlekstrand.net" target=3D"_blank">jason@jlekstrand.net</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, May =
3, 2021 at 10:16 AM Bas Nieuwenhuizen<br>
&lt;<a href=3D"mailto:bas@basnieuwenhuizen.nl" target=3D"_blank">bas@basnie=
uwenhuizen.nl</a>&gt; wrote:<br>
&gt;<br>
&gt; On Mon, May 3, 2021 at 5:00 PM Jason Ekstrand &lt;<a href=3D"mailto:ja=
son@jlekstrand.net" target=3D"_blank">jason@jlekstrand.net</a>&gt; wrote:<b=
r>
&gt; &gt;<br>
&gt; &gt; Sorry for the top-post but there&#39;s no good thing to reply to =
here...<br>
&gt; &gt;<br>
&gt; &gt; One of the things pointed out to me recently by Daniel Vetter tha=
t I<br>
&gt; &gt; didn&#39;t fully understand before is that dma_buf has a very sub=
tle<br>
&gt; &gt; second requirement beyond finite time completion:=C2=A0 Nothing r=
equired<br>
&gt; &gt; for signaling a dma-fence can allocate memory.=C2=A0 Why?=C2=A0 B=
ecause the act<br>
&gt; &gt; of allocating memory may wait on your dma-fence.=C2=A0 This, as i=
t turns<br>
&gt; &gt; out, is a massively more strict requirement than finite time<br>
&gt; &gt; completion and, I think, throws out all of the proposals we have =
so<br>
&gt; &gt; far.<br>
&gt; &gt;<br>
&gt; &gt; Take, for instance, Marek&#39;s proposal for userspace involvemen=
t with<br>
&gt; &gt; dma-fence by asking the kernel for a next serial and the kernel<b=
r>
&gt; &gt; trusting userspace to signal it.=C2=A0 That doesn&#39;t work at a=
ll if<br>
&gt; &gt; allocating memory to trigger a dma-fence can blow up.=C2=A0 There=
&#39;s simply<br>
&gt; &gt; no way for the kernel to trust userspace to not do ANYTHING which=
<br>
&gt; &gt; might allocate memory.=C2=A0 I don&#39;t even think there&#39;s a=
 way userspace can<br>
&gt; &gt; trust itself there.=C2=A0 It also blows up my plan of moving the =
fences to<br>
&gt; &gt; transition boundaries.<br>
&gt; &gt;<br>
&gt; &gt; Not sure where that leaves us.<br>
&gt;<br>
&gt; Honestly the more I look at things I think userspace-signalable fences=
<br>
&gt; with a timeout sound like they are a valid solution for these issues.<=
br>
&gt; Especially since (as has been mentioned countless times in this email<=
br>
&gt; thread) userspace already has a lot of ways to cause timeouts and or<b=
r>
&gt; GPU hangs through GPU work already.<br>
&gt;<br>
&gt; Adding a timeout on the signaling side of a dma_fence would ensure:<br=
>
&gt;<br>
&gt; - The dma_fence signals in finite time<br>
&gt; -=C2=A0 If the timeout case does not allocate memory then memory alloc=
ation<br>
&gt; is not a blocker for signaling.<br>
&gt;<br>
&gt; Of course you lose the full dependency graph and we need to make sure<=
br>
&gt; garbage collection of fences works correctly when we have cycles.<br>
&gt; However, the latter sounds very doable and the first sounds like it is=
<br>
&gt; to some extent inevitable.<br>
&gt;<br>
&gt; I feel like I&#39;m missing some requirement here given that we<br>
&gt; immediately went to much more complicated things but can&#39;t find it=
.<br>
&gt; Thoughts?<br>
<br>
Timeouts are sufficient to protect the kernel but they make the fences<br>
unpredictable and unreliable from a userspace PoV.=C2=A0 One of the big<br>
problems we face is that, once we expose a dma_fence to userspace,<br>
we&#39;ve allowed for some pretty crazy potential dependencies that<br>
neither userspace nor the kernel can sort out.=C2=A0 Say you have marek&#39=
;s<br>
&quot;next serial, please&quot; proposal and a multi-threaded application.<=
br>
Between time time you ask the kernel for a serial and get a dma_fence<br>
and submit the work to signal that serial, your process may get<br>
preempted, something else shoved in which allocates memory, and then<br>
we end up blocking on that dma_fence.=C2=A0 There&#39;s no way userspace ca=
n<br>
predict and defend itself from that.<br>
<br>
So I think where that leaves us is that there is no safe place to<br>
create a dma_fence except for inside the ioctl which submits the work<br>
and only after any necessary memory has been allocated.=C2=A0 That&#39;s a<=
br>
pretty stiff requirement.=C2=A0 We may still be able to interact with<br>
userspace a bit more explicitly but I think it throws any notion of<br>
userspace direct submit out the window.<br>
<br>
--Jason<br>
<br>
<br>
&gt; - Bas<br>
&gt; &gt;<br>
&gt; &gt; --Jason<br>
&gt; &gt;<br>
&gt; &gt; On Mon, May 3, 2021 at 9:42 AM Alex Deucher &lt;<a href=3D"mailto=
:alexdeucher@gmail.com" target=3D"_blank">alexdeucher@gmail.com</a>&gt; wro=
te:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Sat, May 1, 2021 at 6:27 PM Marek Ol=C5=A1=C3=A1k &lt;<a =
href=3D"mailto:maraeo@gmail.com" target=3D"_blank">maraeo@gmail.com</a>&gt;=
 wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Wed, Apr 28, 2021 at 5:07 AM Michel D=C3=A4nzer &lt;=
<a href=3D"mailto:michel@daenzer.net" target=3D"_blank">michel@daenzer.net<=
/a>&gt; wrote:<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; On 2021-04-28 8:59 a.m., Christian K=C3=B6nig wrote=
:<br>
&gt; &gt; &gt; &gt;&gt; &gt; Hi Dave,<br>
&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; Am 27.04.21 um 21:23 schrieb Marek Ol=C5=A1=C3=
=A1k:<br>
&gt; &gt; &gt; &gt;&gt; &gt;&gt; Supporting interop with any device is alwa=
ys possible. It depends on which drivers we need to interoperate with and u=
pdate them. We&#39;ve already found the path forward for amdgpu. We just ne=
ed to find out how many other drivers need to be updated and evaluate the c=
ost/benefit aspect.<br>
&gt; &gt; &gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt;&gt; Marek<br>
&gt; &gt; &gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt;&gt; On Tue, Apr 27, 2021 at 2:38 PM Dave Airli=
e &lt;<a href=3D"mailto:airlied@gmail.com" target=3D"_blank">airlied@gmail.=
com</a> &lt;mailto:<a href=3D"mailto:airlied@gmail.com" target=3D"_blank">a=
irlied@gmail.com</a>&gt;&gt; wrote:<br>
&gt; &gt; &gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0On Tue, 27 Apr 2021 at =
22:06, Christian K=C3=B6nig<br>
&gt; &gt; &gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:c=
koenig.leichtzumerken@gmail.com" target=3D"_blank">ckoenig.leichtzumerken@g=
mail.com</a> &lt;mailto:<a href=3D"mailto:ckoenig.leichtzumerken@gmail.com"=
 target=3D"_blank">ckoenig.leichtzumerken@gmail.com</a>&gt;&gt; wrote:<br>
&gt; &gt; &gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; Correct, we wouldn=
&#39;t have synchronization between device with and without user queues any=
 more.<br>
&gt; &gt; &gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; That could only be=
 a problem for A+I Laptops.<br>
&gt; &gt; &gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0Since I think you menti=
oned you&#39;d only be enabling this on newer<br>
&gt; &gt; &gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0chipsets, won&#39;t it =
be a problem for A+A where one A is a generation<br>
&gt; &gt; &gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0behind the other?<br>
&gt; &gt; &gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; Crap, that is a good point as well.<br>
&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0I&#39;m not really liki=
ng where this is going btw, seems like a ill<br>
&gt; &gt; &gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0thought out concept, if=
 AMD is really going down the road of designing<br>
&gt; &gt; &gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0hw that is currently Li=
nux incompatible, you are going to have to<br>
&gt; &gt; &gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0accept a big part of th=
e burden in bringing this support in to more<br>
&gt; &gt; &gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0than just amd drivers f=
or upcoming generations of gpu.<br>
&gt; &gt; &gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; Well we don&#39;t really like that either, but=
 we have no other option as far as I can see.<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; I don&#39;t really understand what &quot;future hw =
may remove support for kernel queues&quot; means exactly. While the per-con=
text queues can be mapped to userspace directly, they don&#39;t *have* to b=
e, do they? I.e. the kernel driver should be able to either intercept users=
pace access to the queues, or in the worst case do it all itself, and provi=
de the existing synchronization semantics as needed?<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; Surely there are resource limits for the per-contex=
t queues, so the kernel driver needs to do some kind of virtualization / mu=
lti-plexing anyway, or we&#39;ll get sad user faces when there&#39;s no que=
ue available for &lt;current hot game&gt;.<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; I&#39;m probably missing something though, awaiting=
 enlightenment. :)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; The hw interface for userspace is that the ring buffer =
is mapped to the process address space alongside a doorbell aperture (4K pa=
ge) that isn&#39;t real memory, but when the CPU writes into it, it tells t=
he hw scheduler that there are new GPU commands in the ring buffer. Userspa=
ce inserts all the wait, draw, and signal commands into the ring buffer and=
 then &quot;rings&quot; the doorbell. It&#39;s my understanding that the ri=
ng buffer and the doorbell are always mapped in the same GPU address space =
as the process, which makes it very difficult to emulate the current protec=
ted ring buffers in the kernel. The VMID of the ring buffer is also not cha=
ngeable.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The doorbell does not have to be mapped into the process&#39=
;s GPU virtual<br>
&gt; &gt; &gt; address space.=C2=A0 The CPU could write to it directly.=C2=
=A0 Mapping it into<br>
&gt; &gt; &gt; the GPU&#39;s virtual address space would allow you to have =
a device kick<br>
&gt; &gt; &gt; off work however rather than the CPU.=C2=A0 E.g., the GPU co=
uld kick off<br>
&gt; &gt; &gt; it&#39;s own work or multiple devices could kick off work wi=
thout CPU<br>
&gt; &gt; &gt; involvement.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Alex<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; The hw scheduler doesn&#39;t do any synchronization and=
 it doesn&#39;t see any dependencies. It only chooses which queue to execut=
e, so it&#39;s really just a simple queue manager handling the virtualizati=
on aspect and not much else.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Marek<br>
&gt; &gt; &gt; &gt; _______________________________________________<br>
&gt; &gt; &gt; &gt; dri-devel mailing list<br>
&gt; &gt; &gt; &gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org" targ=
et=3D"_blank">dri-devel@lists.freedesktop.org</a><br>
&gt; &gt; &gt; &gt; <a href=3D"https://lists.freedesktop.org/mailman/listin=
fo/dri-devel" rel=3D"noreferrer" target=3D"_blank">https://lists.freedeskto=
p.org/mailman/listinfo/dri-devel</a><br>
&gt; &gt; &gt; _______________________________________________<br>
&gt; &gt; &gt; mesa-dev mailing list<br>
&gt; &gt; &gt; <a href=3D"mailto:mesa-dev@lists.freedesktop.org" target=3D"=
_blank">mesa-dev@lists.freedesktop.org</a><br>
&gt; &gt; &gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/me=
sa-dev" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/=
mailman/listinfo/mesa-dev</a><br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; dri-devel mailing list<br>
&gt; &gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_bla=
nk">dri-devel@lists.freedesktop.org</a><br>
&gt; &gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-dev=
el" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mail=
man/listinfo/dri-devel</a><br>
</blockquote></div>

--00000000000058dc7105c172ee2f--

--===============0065320585==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0065320585==--
