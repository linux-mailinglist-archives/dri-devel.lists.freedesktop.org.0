Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA82490ABD
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 15:50:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F7089B06;
	Mon, 17 Jan 2022 14:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0CA889B06;
 Mon, 17 Jan 2022 14:50:48 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 n16-20020a17090a091000b001b46196d572so29625pjn.5; 
 Mon, 17 Jan 2022 06:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u3CfPmV8p9gp3S1fYQvKsUINoEAb4hU+7FlXdlh97oM=;
 b=YLsgUGTuMLHvjuZnalnizlaq5kPGD37C+1fWkwjeB8Cu8aFDSomYJPY2FjAjZh774Q
 Iq8vmN+wdVLWf9VkiWjjyyqsqrOj6aNdaCKrSPnkeod91PIA11ZcYx7BM6r+6lc4IrLg
 WqbNOPEvpnPPfzJKuZCOItiWN7ypXkhHZ9VSOxCCzLn69HFGRS0taqKWVpwaBkfGAQMG
 HYRMUXdOWKx+a89IatDFpmz+XoQmhoy0EGYroKx8jnJ0FZ5xK8FIhcD7/e+daX7O4txz
 3SV6U7HuATqV4qJzFVkrDWTIeMYdnrZ2LJoNQpv0VjoYl3vk8jW7ZMZqnjC83JOJm9Y5
 0QBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u3CfPmV8p9gp3S1fYQvKsUINoEAb4hU+7FlXdlh97oM=;
 b=fA2D6Hl0/BMY5B5PNrzhXDr+j2M/ZjTmhJRamcaKH8so/9CqyFltgTqBVpNs7JJGYy
 5aNbGsf2pYqjn343PuRUmQLsEPZzSlFKW39q9/OZCbVc65QkYjfFw6CaqhuQl+5E04Xm
 +/OU4GX/cjt1Vtmey41xVqAJ3KY08GP3pvxPmHmmKXxa+KV3TclpbE/1zUOSmi+lnK++
 W2M/0Df7gWqO4f4yrdZydiTs770aaAg86o4iQDQKFBK3gPPvkzHXYoX7/PevJR/NJVEU
 cQfvTk+0G9UgPVX0PnmqkVbdlx/O/k6Iu/gxEc1Q+3xBUiJNLb18W4uYEdaCAGpwmMhY
 V9ow==
X-Gm-Message-State: AOAM53328cHgYm99Ipg5goIjRhmifw2/2Y8N1sCZ8IGZrAVphEk98Ann
 Gv7WUIqOPuG1LpbEiCPXqBXWYF80tMmz0fmyKaSn24Hx
X-Google-Smtp-Source: ABdhPJyRu9o3AUt9ZUW3nOfScNg8w5m5Bou/48YnvdiQvhCfa7NaFEMOxizWwfHjJn1jaDZC/k07R5EflTS4GddQ5O0=
X-Received: by 2002:a17:90a:4d48:: with SMTP id
 l8mr34682268pjh.106.1642431048519; 
 Mon, 17 Jan 2022 06:50:48 -0800 (PST)
MIME-Version: 1.0
References: <a5c769fd-7eac-2628-a36d-fedddfb7d398@amd.com>
 <279c7ffc-99e5-f052-5de1-9b957c455d85@amd.com>
 <1ab2558b-1af0-3319-dce6-b805320a49d0@gmail.com>
 <60760210-3b3d-952c-2637-4d70fab1a857@amd.com>
 <fd95f1c0-7550-0497-7284-64a5257304ca@amd.com>
 <ddb344cc-48ec-7323-4494-4e1cb8323585@amd.com>
 <071fbdc1-38ce-d1e8-0e11-25204a3cc217@amd.com>
 <af705589-a601-9774-ec55-d1c244f756a9@amd.com>
 <386142cc-1df5-228c-af24-2187998d9307@amd.com>
 <b80efca2-4a51-7ac9-cc9e-e497ac7c9c7c@amd.com>
 <YeGoVhLgMDOJS15K@phenom.ffwll.local>
 <92f1cc2b-d4db-6c50-d8a3-cdcd31127d15@amd.com>
 <63c48a97-aa76-0a3c-0c68-97de628b864c@amd.com>
 <387a53c6-8ec0-ff6b-aaa2-34398f36a369@gmail.com>
 <0210e651-cc71-c1d2-5166-7473f664f405@amd.com>
 <d0e694a7-4a16-7e9f-7058-beec32ab1717@amd.com>
 <3028607c-59be-6c23-73e2-0136f5d01ce4@amd.com>
In-Reply-To: <3028607c-59be-6c23-73e2-0136f5d01ce4@amd.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Mon, 17 Jan 2022 09:50:12 -0500
Message-ID: <CAAxE2A5XrPUJD2QJHBcF1Gd5cw6T=EmEEuVvNT3SjasSy9E8yg@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: Don't inherit GEM object VMAs in child process
To: Felix Kuehling <felix.kuehling@amd.com>
Content-Type: multipart/alternative; boundary="00000000000037139e05d5c847fb"
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
 "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 David Yat Sin <david.yatsin@amd.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Adrian Reber <adrian@lisas.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000037139e05d5c847fb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I don't think fork() would work with userspace where all buffers are
shared. It certainly doesn't work now. The driver needs to be notified that
a buffer or texture is shared to ensure data coherency between processes,
and the driver must execute decompression and other render passes when a
buffer or texture is being shared for the first time. Those aren't called
when fork() is called.

Marek

On Mon, Jan 17, 2022 at 9:34 AM Felix Kuehling <felix.kuehling@amd.com>
wrote:

> Am 2022-01-17 um 9:21 a.m. schrieb Christian K=C3=B6nig:
> > Am 17.01.22 um 15:17 schrieb Felix Kuehling:
> >> Am 2022-01-17 um 6:44 a.m. schrieb Christian K=C3=B6nig:
> >>> Am 14.01.22 um 18:40 schrieb Felix Kuehling:
> >>>> Am 2022-01-14 um 12:26 p.m. schrieb Christian K=C3=B6nig:
> >>>>> Am 14.01.22 um 17:44 schrieb Daniel Vetter:
> >>>>>> Top post because I tried to catch up on the entire discussion here=
.
> >>>>>>
> >>>>>> So fundamentally I'm not opposed to just close this fork() hole
> >>>>>> once and
> >>>>>> for all. The thing that worries me from a upstream/platform pov is
> >>>>>> really
> >>>>>> only if we don't do it consistently across all drivers.
> >>>>>>
> >>>>>> So maybe as an idea:
> >>>>>> - Do the original patch, but not just for ttm but all gem renderno=
de
> >>>>>>      drivers at least (or maybe even all gem drivers, no idea), wi=
th
> >>>>>> the
> >>>>>>      below discussion cleaned up as justification.
> >>>>> I know of at least one use case which this will break.
> >>>>>
> >>>>> A couple of years back we had a discussion on the Mesa mailing list
> >>>>> because (IIRC) Marek introduced a background thread to push command
> >>>>> submissions to the kernel.
> >>>>>
> >>>>> That broke because some compositor used to initialize OpenGL and th=
en
> >>>>> do a fork(). This indeed worked previously (no GPUVM at that time),
> >>>>> but with the addition of the backround thread obviously broke.
> >>>>>
> >>>>> The conclusion back then was that the compositor is broken and need=
s
> >>>>> fixing, but it still essentially means that there could be people o=
ut
> >>>>> there with really old userspace where this setting would just break
> >>>>> the desktop.
> >>>>>
> >>>>> I'm not really against that change either, but at least in theory w=
e
> >>>>> could make fork() work perfectly fine even with VMs and background
> >>>>> threads.
> >>>> You may regret this if you ever try to build a shared virtual addres=
s
> >>>> space between GPU and CPU. Then you have two processes (parent and
> >>>> child) sharing the same render context and GPU VM address space.
> >>>> But the
> >>>> CPU address spaces are different. You can't maintain consistent shar=
ed
> >>>> virtual address spaces for both processes when the GPU address
> >>>> space is
> >>>> shared between them.
> >>> That's actually not much of a problem.
> >>>
> >>> All you need to do is to use pthread_atfork() and do the appropriate
> >>> action in parent/child to clean up your context:
> >>> https://man7.org/linux/man-pages/man3/pthread_atfork.3.html
> >> Thunk already does that. However, it's not foolproof. pthread_atfork
> >> hanlders aren't called when the process is forked with a clone call.
> >
> > Yeah, but that's perfectly intentional. clone() is usually used to
> > create threads.
>
> Clone can be used to create new processes. Maybe not the common use today=
.
>
>
> >
> >>> The rest is just to make sure that all shared and all private data ar=
e
> >>> kept separate all the time. Sharing virtual memory is already done fo=
r
> >>> decades this way, it's just that nobody ever did it with a statefull
> >>> device like GPUs.
> >> My concern is not with sharing or not sharing data. It's with sharing
> >> the address space itself. If you share the render node, you share GPU
> >> virtual address space. However CPU address space is not shared between
> >> parent and child. That's a fundamental mismatch between the CPU world
> >> and current GPU driver implementation.
> >
> > Correct, but even that is easily solvable. As I said before you can
> > hang this state on a VMA and let it be cloned together with the CPU
> > address space.
>
> I'm not following. The address space I'm talking about is struct
> amdgpu_vm. It's associated with the render node file descriptor.
> Inheriting and using that file descriptor in the child inherits the
> amdgpu_vm. I don't see how you can hang that state on any one VMA.
>
> To be consistent with the CPU, you'd need to clone the GPU address space
> (struct amdgpu_vm) in the child process. That means you need a new
> render node file descriptor that imports all the BOs from the parent
> address space. It's a bunch of extra work to fork a process, that you're
> proposing to immediately undo with an atfork handler. So I really don't
> see the point.
>
> Regards,
>   Felix
>
>
> >
> > Since VMAs are informed about their cloning (in opposite to file
> > descriptors) it's trivial to even just clone kernel data on first acces=
s.
> >
> > Regards,
> > Christian.
> >
> >>
> >> Regards,
> >>    Felix
> >>
> >>
> >>> Regards,
> >>> Christian.
> >>>
> >>>> Regards,
> >>>>     Felix
> >>>>
> >
>

--00000000000037139e05d5c847fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I don&#39;t think fork() would work with userspace wh=
ere all buffers are shared. It certainly doesn&#39;t work now. The driver n=
eeds to be notified that a buffer or texture is shared to ensure data coher=
ency between processes, and the driver must execute decompression and other=
 render passes when a buffer or texture is being shared for the first time.=
 Those aren&#39;t called when fork() is called.</div><div><br></div><div>Ma=
rek<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Mon, Jan 17, 2022 at 9:34 AM Felix Kuehling &lt;<a href=3D"=
mailto:felix.kuehling@amd.com">felix.kuehling@amd.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">Am 2022-01-17 um 9:21 =
a.m. schrieb Christian K=C3=B6nig:<br>
&gt; Am 17.01.22 um 15:17 schrieb Felix Kuehling:<br>
&gt;&gt; Am 2022-01-17 um 6:44 a.m. schrieb Christian K=C3=B6nig:<br>
&gt;&gt;&gt; Am 14.01.22 um 18:40 schrieb Felix Kuehling:<br>
&gt;&gt;&gt;&gt; Am 2022-01-14 um 12:26 p.m. schrieb Christian K=C3=B6nig:<=
br>
&gt;&gt;&gt;&gt;&gt; Am 14.01.22 um 17:44 schrieb Daniel Vetter:<br>
&gt;&gt;&gt;&gt;&gt;&gt; Top post because I tried to catch up on the entire=
 discussion here.<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; So fundamentally I&#39;m not opposed to just close=
 this fork() hole<br>
&gt;&gt;&gt;&gt;&gt;&gt; once and<br>
&gt;&gt;&gt;&gt;&gt;&gt; for all. The thing that worries me from a upstream=
/platform pov is<br>
&gt;&gt;&gt;&gt;&gt;&gt; really<br>
&gt;&gt;&gt;&gt;&gt;&gt; only if we don&#39;t do it consistently across all=
 drivers.<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; So maybe as an idea:<br>
&gt;&gt;&gt;&gt;&gt;&gt; - Do the original patch, but not just for ttm but =
all gem rendernode<br>
&gt;&gt;&gt;&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 drivers at least (or mayb=
e even all gem drivers, no idea), with<br>
&gt;&gt;&gt;&gt;&gt;&gt; the<br>
&gt;&gt;&gt;&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 below discussion cleaned =
up as justification.<br>
&gt;&gt;&gt;&gt;&gt; I know of at least one use case which this will break.=
<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; A couple of years back we had a discussion on the Mesa=
 mailing list<br>
&gt;&gt;&gt;&gt;&gt; because (IIRC) Marek introduced a background thread to=
 push command<br>
&gt;&gt;&gt;&gt;&gt; submissions to the kernel.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; That broke because some compositor used to initialize =
OpenGL and then<br>
&gt;&gt;&gt;&gt;&gt; do a fork(). This indeed worked previously (no GPUVM a=
t that time),<br>
&gt;&gt;&gt;&gt;&gt; but with the addition of the backround thread obviousl=
y broke.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; The conclusion back then was that the compositor is br=
oken and needs<br>
&gt;&gt;&gt;&gt;&gt; fixing, but it still essentially means that there coul=
d be people out<br>
&gt;&gt;&gt;&gt;&gt; there with really old userspace where this setting wou=
ld just break<br>
&gt;&gt;&gt;&gt;&gt; the desktop.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; I&#39;m not really against that change either, but at =
least in theory we<br>
&gt;&gt;&gt;&gt;&gt; could make fork() work perfectly fine even with VMs an=
d background<br>
&gt;&gt;&gt;&gt;&gt; threads.<br>
&gt;&gt;&gt;&gt; You may regret this if you ever try to build a shared virt=
ual address<br>
&gt;&gt;&gt;&gt; space between GPU and CPU. Then you have two processes (pa=
rent and<br>
&gt;&gt;&gt;&gt; child) sharing the same render context and GPU VM address =
space.<br>
&gt;&gt;&gt;&gt; But the<br>
&gt;&gt;&gt;&gt; CPU address spaces are different. You can&#39;t maintain c=
onsistent shared<br>
&gt;&gt;&gt;&gt; virtual address spaces for both processes when the GPU add=
ress<br>
&gt;&gt;&gt;&gt; space is<br>
&gt;&gt;&gt;&gt; shared between them.<br>
&gt;&gt;&gt; That&#39;s actually not much of a problem.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; All you need to do is to use pthread_atfork() and do the appro=
priate<br>
&gt;&gt;&gt; action in parent/child to clean up your context:<br>
&gt;&gt;&gt; <a href=3D"https://man7.org/linux/man-pages/man3/pthread_atfor=
k.3.html" rel=3D"noreferrer" target=3D"_blank">https://man7.org/linux/man-p=
ages/man3/pthread_atfork.3.html</a><br>
&gt;&gt; Thunk already does that. However, it&#39;s not foolproof. pthread_=
atfork<br>
&gt;&gt; hanlders aren&#39;t called when the process is forked with a clone=
 call.<br>
&gt;<br>
&gt; Yeah, but that&#39;s perfectly intentional. clone() is usually used to=
<br>
&gt; create threads.<br>
<br>
Clone can be used to create new processes. Maybe not the common use today.<=
br>
<br>
<br>
&gt;<br>
&gt;&gt;&gt; The rest is just to make sure that all shared and all private =
data are<br>
&gt;&gt;&gt; kept separate all the time. Sharing virtual memory is already =
done for<br>
&gt;&gt;&gt; decades this way, it&#39;s just that nobody ever did it with a=
 statefull<br>
&gt;&gt;&gt; device like GPUs.<br>
&gt;&gt; My concern is not with sharing or not sharing data. It&#39;s with =
sharing<br>
&gt;&gt; the address space itself. If you share the render node, you share =
GPU<br>
&gt;&gt; virtual address space. However CPU address space is not shared bet=
ween<br>
&gt;&gt; parent and child. That&#39;s a fundamental mismatch between the CP=
U world<br>
&gt;&gt; and current GPU driver implementation.<br>
&gt;<br>
&gt; Correct, but even that is easily solvable. As I said before you can<br=
>
&gt; hang this state on a VMA and let it be cloned together with the CPU<br=
>
&gt; address space.<br>
<br>
I&#39;m not following. The address space I&#39;m talking about is struct<br=
>
amdgpu_vm. It&#39;s associated with the render node file descriptor.<br>
Inheriting and using that file descriptor in the child inherits the<br>
amdgpu_vm. I don&#39;t see how you can hang that state on any one VMA.<br>
<br>
To be consistent with the CPU, you&#39;d need to clone the GPU address spac=
e<br>
(struct amdgpu_vm) in the child process. That means you need a new<br>
render node file descriptor that imports all the BOs from the parent<br>
address space. It&#39;s a bunch of extra work to fork a process, that you&#=
39;re<br>
proposing to immediately undo with an atfork handler. So I really don&#39;t=
<br>
see the point.<br>
<br>
Regards,<br>
=C2=A0 Felix<br>
<br>
<br>
&gt;<br>
&gt; Since VMAs are informed about their cloning (in opposite to file<br>
&gt; descriptors) it&#39;s trivial to even just clone kernel data on first =
access.<br>
&gt;<br>
&gt; Regards,<br>
&gt; Christian.<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt; =C2=A0=C2=A0 Felix<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt; Regards,<br>
&gt;&gt;&gt; Christian.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Regards,<br>
&gt;&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 Felix<br>
&gt;&gt;&gt;&gt;<br>
&gt;<br>
</blockquote></div>

--00000000000037139e05d5c847fb--
