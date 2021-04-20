Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7807F365EFC
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 20:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 861AA6E88B;
	Tue, 20 Apr 2021 18:03:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB4A56E88E
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 18:03:50 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id u187so1241637wmb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 11:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7GUAjPYcxNqRZ2aYVIkKv9QcUfcYBP6GVGmwH3EOSb4=;
 b=NyTQ0N+kJrQ6KieEmDhHP+Xp088BmYx3e5JgZ1m2tI2HPftA/sV56N0eHUelNdTbVs
 FeRztL9jisP0SVSQUa1eYnqNGJGZWmFVj3mCR7yUD94E4p42TTNMUnPlgWepIsbDl26G
 A9u2LU97qcks3ADQr6z156kUFLemzp4hw3AHeUAVwQHGb/iBYsE7lKM2oHZlfX7sJHP9
 lfyWDQaGhQVIvehV/7lTDsvdXYndGm96oyZQA/hNlb6UrV3KjSf6Qp4ycblAZUL2Qsah
 phUY9rb/8U4ItH0wXRjiRp8O8taqNIr1L8RDNgLSYzIQNOH9O3b6aEuk4NiVlRQTG4WV
 /RuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7GUAjPYcxNqRZ2aYVIkKv9QcUfcYBP6GVGmwH3EOSb4=;
 b=AmKNvrNS/VDATa+42W1zhijKbIPIhYKRWUtYZ9EVLqzsLKPBhFAovCDT8gwW68b19N
 s62J6SdfGzU7NeXtnMcfla+drzLJgfOhS8/GszWF0Mimfcpz5s7YAd/X5mpaMAdIcwQi
 y4nm5cCswSTbQKGP5LJBvM0olFTAZi1m4liU4JSUnIAlKJahKOHsHG1gpUIg7HcSAADC
 AAV+ZPcp+qKGBGDKADEjh2pIy4rk+f4hkUjtJ+TuIXcOA4q33/3Hk7/1ChmqnYmTGX9f
 c1JUBfERvc2Poo7+Gw8ymmnIB60YFPiwQSSzhLe13iJ3mVf0RVW7Zbzehz+CHZy6YbYH
 dzMQ==
X-Gm-Message-State: AOAM5305Lu658WAMCzn7L5S9ZRrrsrSxyRUOplCWq7FFt3fIcBp81l2E
 f/rJnDyeo7+CO/ap/Koa9kkE75kEyqT1FAbonBH1UA==
X-Google-Smtp-Source: ABdhPJwuAm9/Ic8kXfmltZESRsHDWfcynAoJ5qkYpX1+Rl+7YArUQb3WFWUNM4H3cr1Rm32qj3RwoXNoJqxovLObXWc=
X-Received: by 2002:a1c:6808:: with SMTP id d8mr5741600wmc.147.1618941829497; 
 Tue, 20 Apr 2021 11:03:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
 <CAPj87rO7_Q2L0PogryGmuxLJk-DA3ckM+6vmDioErZ3_6s0iRQ@mail.gmail.com>
 <136d3b55-ff1e-c47b-d443-22bd27427956@gmail.com>
 <CAPj87rMSk+SgCBfrcQTEvppp=qQv4MRdeHRKAOUn5pZAEhh9mg@mail.gmail.com>
 <8e5026aa-599e-52d0-4959-6c3bcc16cb76@gmail.com>
 <CAPj87rMzFfouhv89-Vj3jDsH8JB5NFiyv+yV07KvJZaa2rB7Kw@mail.gmail.com>
 <CAAxE2A442Rkn5RfU9KH4cBzURZxqHgCX73-GVYrR+8u1cPXowg@mail.gmail.com>
In-Reply-To: <CAAxE2A442Rkn5RfU9KH4cBzURZxqHgCX73-GVYrR+8u1cPXowg@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 20 Apr 2021 19:03:01 +0100
Message-ID: <CAPj87rOFryz7FoSDhRGMkCghid7Sj8QJ13+ZJV2O3HnFEKRGug@mail.gmail.com>
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0593213187=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0593213187==
Content-Type: multipart/alternative; boundary="000000000000a8ddd105c06b4468"

--000000000000a8ddd105c06b4468
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 20 Apr 2021 at 17:25, Marek Ol=C5=A1=C3=A1k <maraeo@gmail.com> wrot=
e:

> Daniel, imagine hardware that can only do what Windows does: future fence=
s
> signalled by userspace whenever userspace wants, and no kernel queues lik=
e
> we have today.
>
> The only reason why current AMD GPUs work is because they have a ring
> buffer per queue with pointers to userspace command buffers followed by
> fences. What will we do if that ring buffer is removed?
>

I can totally imagine that; memory fences are clearly a reality and we need
to make them work for functionality as well as performance. Let's imagine
that winsys joins that flying-car future of totally arbitrary sync, that we
work only on memory fences and nothing else, and that this all happens by
the time we're all vaccinated and can go cram into a room with 8000
other people at FOSDEM instead of trying to do this over email.

But the first couple of sentences of your proposal has the kernel
monitoring those synchronisation points to ensure that they complete in
bounded time. That already _completely_ destroys the purity of the simple
picture you paint. Either there are no guarantees and userspace has to
figure it out, or there are guarantees and we have to compromise that
purity.

I understand how you arrived at your proposal from your perspective as an
extremely skilled driver developer who has delivered gigantic performance
improvements to real-world clients. As a winsys person with a very
different perspective, I disagree with you on where you are drawing the
boundaries, to the point that I think your initial proposal is worse than
useless; doing glFinish() or the VkFence equivalent in clients would be
better in most cases than the first mail.

I don't want to do glFinish (which I'm right about), and you don't want to
do dma_fence (which you're right about). So let's work together to find a
middle ground which we're both happy with. That middle ground does exist,
and we as winsys people are happy to eat a significant amount of pain to
arrive at that middle ground. Your current proposal is at once too gentle
on the winsys, and far too harsh on it. I only want to move where and how
those lines are drawn, not to pretend that all the world is still a
single-context FIFO execution engine.

Cheers,
Daniel

--000000000000a8ddd105c06b4468
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><span style=3D"">On Tue, 20 Apr 2021 at 1=
7:25, Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"mailto:maraeo@gmail.com">maraeo@=
gmail.com</a>&gt; wrote:</span><br></div><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Daniel, im=
agine hardware that can only do what Windows does: future fences signalled =
by userspace whenever userspace wants, and no kernel queues like we have to=
day.</div><div><br></div><div>The only reason why current AMD GPUs work is =
because they have a ring buffer per queue with pointers to userspace comman=
d buffers followed by fences. What will we do if that ring buffer is remove=
d?</div></div></blockquote><div><br></div><div>I can totally imagine that; =
memory fences are clearly a reality and we need to make them work for funct=
ionality as well as performance. Let&#39;s imagine that winsys joins that f=
lying-car future of totally arbitrary sync, that we work only on memory fen=
ces and nothing else, and that this all happens by the time we&#39;re all v=
accinated and can go cram into a room with 8000 other=C2=A0people at FOSDEM=
 instead of trying to do this over email.</div><div><br></div><div>But the =
first couple of sentences of your proposal has the kernel monitoring those =
synchronisation=C2=A0points to ensure that they complete in bounded time. T=
hat already _completely_ destroys the purity of the simple picture you pain=
t.=C2=A0<span style=3D"">Either there are no guarantees and userspace has t=
o figure it out, or there are guarantees and we have to compromise that pur=
ity.</span></div><div><span style=3D""><br></span></div><div><span style=3D=
"">I understand how you arrived at your proposal from your perspective as a=
n extremely skilled driver developer who has delivered gigantic performance=
 improvements to real-world clients. As a winsys person with a very differe=
nt perspective,=C2=A0</span><span style=3D"">I disagree with you on where y=
ou are drawing the boundaries, to the point that I think your initial propo=
sal is worse than useless; doing glFinish() or the VkFence equivalent in cl=
ients would be better in most cases than the first mail.</span></div><div><=
span style=3D""><br></span></div><div><span style=3D"">I don&#39;t want to =
do glFinish (which I&#39;m right about), and you don&#39;t want to do dma_f=
ence (which you&#39;re right about). So let&#39;s work together to find a m=
iddle ground which we&#39;re both happy with. That middle ground does exist=
, and we as winsys people are happy to eat a significant amount of pain to =
arrive at that middle ground. Your current proposal is at once too gentle o=
n the winsys, and far too harsh on it. I only want to move where and how th=
ose lines are drawn, not to pretend that all the world is still a single-co=
ntext FIFO execution engine.</span></div><div><br></div><div>Cheers,</div><=
div>Daniel=C2=A0</div></div></div>

--000000000000a8ddd105c06b4468--

--===============0593213187==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0593213187==--
