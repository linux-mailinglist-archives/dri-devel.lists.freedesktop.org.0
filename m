Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F17B636BAEC
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 23:00:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 054506E120;
	Mon, 26 Apr 2021 21:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3856E10C;
 Mon, 26 Apr 2021 21:00:05 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id y62so7209560pfg.4;
 Mon, 26 Apr 2021 14:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y1CoAE5T8Ac6HW3BxkKVJY2WL629ZtNx5MreZ/ZYIrQ=;
 b=ADkFtaMzJ3sr3PGlzeyNwOWtoN/8qmXa0WNMs4i/6Ck0Pla7IpAXNhnppKIhWAbXac
 1l+JQXarFydcvNI/cKdtUCc9h6eY+qbDn08EM4G3Q7HMiVfcELV2/XpJ6SEcue/Yg+Go
 CoxEW2YM2EfSH3BQRshmmyTkTs3yXbj6/xRhYVhaO5RQ4Q0sLxTkrWEYz/nHpuk5DoXK
 D5pS4p+TOWDI+MuGol7N3dIm54AsmUW88/qQkNuLhrSYo2xuz8DWbc7squOSj+BSUWiC
 xpUZ5DMCA5k9a8CjvVDVxoGYUi7wSk0/NEjhcTOoi7+ZVKmTGEty2AGqGUarT3h61cfz
 yt9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y1CoAE5T8Ac6HW3BxkKVJY2WL629ZtNx5MreZ/ZYIrQ=;
 b=SNiQHPyWYMkKSpZicdoTj6jj8SsEY4V26EigOk4r9qJ3GDRz4iY3yvC7lCurJrdPRe
 TmdkD57xvFdYzg07moJ+X1xJ4Si3TUgz/+aNTRlzb93/5YKbax6Xmwd3ja+M6I3BUSIU
 7K40VvUjzWAJ6445EDXsCRxoq72TGjYTa5mJghMAPTH/EiDo3J/vwKmKXwBujIWkgEa5
 pZ4kgd8vEvkcDW6AKd/U7nZ8cYyYxzkOhV4Wv82RapAysRFFy7c3+6q/xLNdLlUxoEkU
 iVYLg0w8OVD6rfgrIcanOqqelzsnTeqCvN74z0DNv+lDZKl79+SeJ4BwbeQRIXcc9j3r
 XyKw==
X-Gm-Message-State: AOAM532S+TvljyQvKYQpUaMAQziVaUIHOaDuFo8ZadNFvK+TgUTwxeX/
 iBxbyn3N2ulW053dPpuaeuaZWLCGnx/kyIzP7ULKVE76Mek=
X-Google-Smtp-Source: ABdhPJztWc45xsh2GUJndTmMhkHWttSEAR1EuEhe+wNs2YOeH47Iy3eLCYJuK2h/PcVpKkJWM/lcd0cjdjc8nRQbLXw=
X-Received: by 2002:a05:6a00:1c54:b029:261:fc0f:15f7 with SMTP id
 s20-20020a056a001c54b0290261fc0f15f7mr19597482pfw.30.1619470805361; Mon, 26
 Apr 2021 14:00:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
 <CAPj87rMn_gabTdZpHGQVa16Log8xFe8fvhcL_WSC6tyOMvmY=w@mail.gmail.com>
 <CAOFGe96c1SxHiUBzapbVFx1h0aOwF=X8hcStVZmrw4OjrrG+Zg@mail.gmail.com>
 <CAPj87rPSW13nxz2n5E+n0JYcwGR3mFWJAG2kYaaoav7A-ZVD2g@mail.gmail.com>
 <CAKMK7uHyTiFWwQWdxVk1am+KoFA9DsTnJ658CAhzBYOyg7AdsA@mail.gmail.com>
 <CAPj87rM=qf78kUvys1irnR8Djh=CLjRdQJt1V4je82-=+yPWYw@mail.gmail.com>
 <CAKMK7uEAu4FgYwN9t9AMCqD2nVbkSRbGP3tST4nY1nKP26+vxA@mail.gmail.com>
 <CAPj87rOfv0w8jF4CO8PUHQXTfq+2GE=BDmRRWjOMkQ0wH3CPAA@mail.gmail.com>
In-Reply-To: <CAPj87rOfv0w8jF4CO8PUHQXTfq+2GE=BDmRRWjOMkQ0wH3CPAA@mail.gmail.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Mon, 26 Apr 2021 16:59:28 -0400
Message-ID: <CAAxE2A5pJ-D7AFbDJLKPDztr=yzOSDSm=3HrnJOWr3r96_KOQQ@mail.gmail.com>
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
To: Daniel Stone <daniel@fooishbar.org>
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
Content-Type: multipart/mixed; boundary="===============1465562808=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1465562808==
Content-Type: multipart/alternative; boundary="00000000000013e6d605c0e66e9a"

--00000000000013e6d605c0e66e9a
Content-Type: text/plain; charset="UTF-8"

Thanks everybody. The initial proposal is dead. Here are some thoughts on
how to do it differently.

I think we can have direct command submission from userspace via
memory-mapped queues ("user queues") without changing window systems.

The memory management doesn't have to use GPU page faults like HMM.
Instead, it can wait for user queues of a specific process to go idle and
then unmap the queues, so that userspace can't submit anything. Buffer
evictions, pinning, etc. can be executed when all queues are unmapped
(suspended). Thus, no BO fences and page faults are needed.

Inter-process synchronization can use timeline semaphores. Userspace will
query the wait and signal value for a shared buffer from the kernel. The
kernel will keep a history of those queries to know which process is
responsible for signalling which buffer. There is only the wait-timeout
issue and how to identify the culprit. One of the solutions is to have the
GPU send all GPU signal commands and all timed out wait commands via an
interrupt to the kernel driver to monitor and validate userspace behavior.
With that, it can be identified whether the culprit is the waiting process
or the signalling process and which one. Invalid signal/wait parameters can
also be detected. The kernel can force-signal only the semaphores that time
out, and punish the processes which caused the timeout or used invalid
signal/wait parameters.

The question is whether this synchronization solution is robust enough for
dma_fence and whatever the kernel and window systems need.

Marek

On Tue, Apr 20, 2021 at 4:34 PM Daniel Stone <daniel@fooishbar.org> wrote:

> Hi,
>
> On Tue, 20 Apr 2021 at 20:30, Daniel Vetter <daniel@ffwll.ch> wrote:
>
>> The thing is, you can't do this in drm/scheduler. At least not without
>> splitting up the dma_fence in the kernel into separate memory fences
>> and sync fences
>
>
> I'm starting to think this thread needs its own glossary ...
>
> I propose we use 'residency fence' for execution fences which enact
> memory-residency operations, e.g. faulting in a page ultimately depending
> on GPU work retiring.
>
> And 'value fence' for the pure-userspace model suggested by timeline
> semaphores, i.e. fences being (*addr == val) rather than being able to look
> at ctx seqno.
>
> Cheers,
> Daniel
> _______________________________________________
> mesa-dev mailing list
> mesa-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/mesa-dev
>

--00000000000013e6d605c0e66e9a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks everybody. The initial proposal is dead. Here =
are some thoughts on how to do it differently.<br></div><div><br></div><div=
>I think we can have direct command submission from userspace via memory-ma=
pped queues (&quot;user queues&quot;) without changing window systems.</div=
><div><br></div><div>The memory management doesn&#39;t have to use GPU page=
 faults like HMM. Instead, it can wait for user queues of a specific proces=
s to go idle and then unmap the queues, so that userspace can&#39;t submit =
anything. Buffer evictions, pinning, etc. can be executed when all queues a=
re unmapped (suspended). Thus, no BO fences and page faults are needed.<br>=
</div><div><br></div><div>Inter-process synchronization can use timeline se=
maphores. Userspace will query the wait and signal value for a shared buffe=
r from the kernel. The kernel will keep a history of those queries to know =
which process is responsible for signalling which buffer. There is only the=
 wait-timeout issue and how to identify the culprit. One of the solutions i=
s to have the GPU send all GPU signal commands and all timed out wait comma=
nds via an interrupt to the kernel driver to monitor and validate userspace=
 behavior. With that, it can be identified whether the culprit is the waiti=
ng process or the signalling process and which one. Invalid signal/wait par=
ameters can also be detected. The kernel can force-signal only the semaphor=
es that time out, and punish the processes which caused the timeout or used=
 invalid signal/wait parameters.</div><div><br></div><div>The question is w=
hether this synchronization solution is robust enough for dma_fence and wha=
tever the kernel and window systems need.<br></div><div><br></div><div>Mare=
k<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Tue, Apr 20, 2021 at 4:34 PM Daniel Stone &lt;<a href=3D"mail=
to:daniel@fooishbar.org" target=3D"_blank">daniel@fooishbar.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"=
ltr"><div dir=3D"ltr">Hi,</div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Tue, 20 Apr 2021 at 20:30, Daniel Vetter &lt;<a=
 href=3D"mailto:daniel@ffwll.ch" target=3D"_blank">daniel@ffwll.ch</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The thing=
 is, you can&#39;t do this in drm/scheduler. At least not without<br>
splitting up the dma_fence in the kernel into separate memory fences<br>
and sync fences</blockquote><div>=C2=A0</div><div><span>I&#39;m starting to=
 think this thread needs its own glossary ...</span></div><div><span><br></=
span></div><div><span>I propose we use &#39;residency fence&#39; for execut=
ion fences which enact memory-residency operations, e.g. faulting in a page=
 ultimately depending on GPU work retiring.</span></div><div><span><br></sp=
an></div><div><span>And &#39;value fence&#39; for the pure-userspace model =
suggested by timeline semaphores, i.e. fences being (*addr =3D=3D val) rath=
er than being able to look at ctx seqno.</span></div><div><span><br></span>=
</div><div><span>Cheers,</span></div><div><span>Daniel</span></div></div></=
div>
_______________________________________________<br>
mesa-dev mailing list<br>
<a href=3D"mailto:mesa-dev@lists.freedesktop.org" target=3D"_blank">mesa-de=
v@lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/mesa-dev" rel=3D"=
noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listinf=
o/mesa-dev</a><br>
</blockquote></div>

--00000000000013e6d605c0e66e9a--

--===============1465562808==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1465562808==--
