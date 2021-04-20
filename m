Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA75836601B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 21:15:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE8AD6E8A8;
	Tue, 20 Apr 2021 19:15:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4748D6E8A7
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 19:14:59 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 y5-20020a05600c3645b0290132b13aaa3bso8869859wmq.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 12:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JhPGqOYyGEHhrH/ZFALQWGY4IXgGzCSQjReXV0LAUEA=;
 b=kSM7wgTZ6C7vzaCvuCddF1CJ1hWk+Y6YLKnKta1ZvUPCDCRoDeXZgmjjSbL0Ea3JhN
 5eGmXeReZw1EbQxK8yGpIJt7RbpNNfvfjgvFvdcMcQGXkkPpZyGD7rVzEWoZPEG9EhSz
 P+mwYQ1ph5zfws7XQ7TdbChaqzKBDlQqUBeMQpWZhJF7/4dgK3d+FTE/Bvg1ge1blwzE
 StMHKP8I8emJjINhbj5W2gB1ix1v44F3ji6mobJLNkXAzl8y8ARiCwJ+bxyDPPzGho+R
 urvNEAKubM+gtdzD4cLnhlwJfzzaaOuUQKGSP9q5Z+UIbF2xrVS6GDFmbdbR8VGTEivJ
 hTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JhPGqOYyGEHhrH/ZFALQWGY4IXgGzCSQjReXV0LAUEA=;
 b=mGJ6sHsiIVOVPQMIaz6Nn/5mViNhjSbBtwF09U6e56nt9oQQehcKQvsWs7v68C8HnR
 0ctpIDSLWoN9Ru8Ox9APQCOvxsChUfCzmjKFKOtmlQlgLTz84rDDJ7vuk/EJprY9ZTmn
 5eRNz7FbCDVSk7wuIox9Saix2dV2DXMxpLebPF2hfQB98o/txBriE7zLcrliwZXuNpie
 3/HMt7BMo8BoSeV+CQ/5pEJnk5xu9FF1JmnQg+NHxQpRu6nVHiKr6hJ2IBUzIIeQDjuv
 7nAFSTMZ2VlELsR9UjapgfQZXoNJEfMQurKUmt2fvLSgMLIPLMFxbkhoLbpdMJSphRYT
 p3gA==
X-Gm-Message-State: AOAM53113SVomOEgMQkprTHFlHC2O2nstdcqtDQeH0bwAVwNYtIKtoYd
 9H2ZB92Oi8qXr4kmuCH5dtXfZKIiwZ/GUjlWAeQd+/diODQBosCQ
X-Google-Smtp-Source: ABdhPJyvGxSeUx/Jurqy6gflWQjk0OYGEi4R+pfS/msHskJF2IUM2cbqv5Z6mfzI8nWaulUxCXKYf2seVyEv0xHg0zo=
X-Received: by 2002:a7b:cd98:: with SMTP id y24mr5921451wmj.52.1618946097897; 
 Tue, 20 Apr 2021 12:14:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
 <CAPj87rMn_gabTdZpHGQVa16Log8xFe8fvhcL_WSC6tyOMvmY=w@mail.gmail.com>
 <CAOFGe96c1SxHiUBzapbVFx1h0aOwF=X8hcStVZmrw4OjrrG+Zg@mail.gmail.com>
 <CAPj87rPSW13nxz2n5E+n0JYcwGR3mFWJAG2kYaaoav7A-ZVD2g@mail.gmail.com>
 <CAKMK7uHyTiFWwQWdxVk1am+KoFA9DsTnJ658CAhzBYOyg7AdsA@mail.gmail.com>
In-Reply-To: <CAKMK7uHyTiFWwQWdxVk1am+KoFA9DsTnJ658CAhzBYOyg7AdsA@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 20 Apr 2021 20:14:09 +0100
Message-ID: <CAPj87rM=qf78kUvys1irnR8Djh=CLjRdQJt1V4je82-=+yPWYw@mail.gmail.com>
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
To: Daniel Vetter <daniel@ffwll.ch>
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
 Jason Ekstrand <jason@jlekstrand.net>
Content-Type: multipart/mixed; boundary="===============1399853888=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1399853888==
Content-Type: multipart/alternative; boundary="00000000000013779905c06c4393"

--00000000000013779905c06c4393
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, 20 Apr 2021 at 19:54, Daniel Vetter <daniel@ffwll.ch> wrote:

> So I can mostly get behind this, except it's _not_ going to be
> dma_fence. That thing has horrendous internal ordering constraints
> within the kernel, and the one thing that doesn't allow you is to make
> a dma_fence depend upon a userspace fence.
>
> But what we can do is use the same currently existing container
> objects like drm_syncobj or sync_file (timeline syncobj would fit best
> tbh), and stuff a userspace fence behind it. The only trouble is that
> currently timeline syncobj implement vulkan's spec, which means if you
> build a wait-before-signal deadlock, you'll wait forever. Well until
> the user ragequits and kills your process.
>
> So for winsys we'd need to be able to specify the wait timeout
> somewhere for waiting for that dma_fence to materialize (plus the
> submit thread, but userspace needs that anyway to support timeline
> syncobj) if you're importing an untrusted timeline syncobj. And I
> think that's roughly it.
>

Right. The only way you get to materialise a dma_fence from an execbuf is
that you take a hard timeout, with a penalty for not meeting that timeout.
When I say dma_fence I mean dma_fence, because there is no extant winsys
support for drm_symcobj, so this is greenfield: the winsys gets to specify
its terms of engagement, and again, we've been the orange/green-site
enemies of users for quite some time already, so we're happy to continue
doing so. If the actual underlying primitive is not a dma_fence, and
compositors/protocol/clients need to eat a bunch of typing to deal with a
different primitive which offers the same guarantees, then that's fine, as
long as there is some tangible whole-of-system benefit.

How that timeout is actually realised is an implementation detail. Whether
it's a property of the last GPU job itself that the CPU-side driver can
observe, or that the kernel driver guarantees that there is a GPU job
launched in parallel which monitors the memory-fence status and reports
back through a mailbox/doorbell, or the CPU-side driver enqueues kqueue
work for $n milliseconds' time to check the value in memory and kill the
context if it doesn't meet expectations - whatever. I don't believe any of
those choices meaningfully impact on kernel driver complexity relative to
the initial proposal, but they do allow us to continue to provide the
guarantees we do today when buffers cross security boundaries.

There might well be an argument for significantly weakening those security
boundaries and shifting the complexity from the DRM scheduler into
userspace compositors. So far though, I have yet to see that argument made
coherently.

Cheers,
Daniel

--00000000000013779905c06c4393
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,</div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Tue, 20 Apr 2021 at 19:54, Daniel V=
etter &lt;<a href=3D"mailto:daniel@ffwll.ch">daniel@ffwll.ch</a>&gt; wrote:=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
So I can mostly get behind this, except it&#39;s _not_ going to be<br>
dma_fence. That thing has horrendous internal ordering constraints<br>
within the kernel, and the one thing that doesn&#39;t allow you is to make<=
br>
a dma_fence depend upon a userspace fence.<br>
<br>
But what we can do is use the same currently existing container<br>
objects like drm_syncobj or sync_file (timeline syncobj would fit best<br>
tbh), and stuff a userspace fence behind it. The only trouble is that<br>
currently timeline syncobj implement vulkan&#39;s spec, which means if you<=
br>
build a wait-before-signal deadlock, you&#39;ll wait forever. Well until<br=
>
the user ragequits and kills your process.<br>
<br>
So for winsys we&#39;d need to be able to specify the wait timeout<br>
somewhere for waiting for that dma_fence to materialize (plus the<br>
submit thread, but userspace needs that anyway to support timeline<br>
syncobj) if you&#39;re importing an untrusted timeline syncobj. And I<br>
think that&#39;s roughly it.<br></blockquote><div>=C2=A0</div><div>Right. T=
he only way you get to materialise a dma_fence from an execbuf is that you =
take a hard timeout, with a penalty for not meeting that timeout. When I sa=
y dma_fence I mean dma_fence, because there is no extant winsys support for=
 drm_symcobj, so this is greenfield: the winsys gets to specify its terms o=
f engagement, and again, we&#39;ve been the orange/green-site enemies of us=
ers for quite some time already, so we&#39;re happy to continue doing so. I=
f the actual underlying primitive is not a dma_fence, and compositors/proto=
col/clients need to eat a bunch of typing to deal with a different primitiv=
e which offers the same guarantees, then that&#39;s fine, as long as there =
is some tangible whole-of-system benefit.</div><div><br></div><div>How that=
 timeout is actually realised is an implementation detail. Whether it&#39;s=
 a property of the last GPU job itself that the CPU-side driver can observe=
, or that the kernel driver guarantees that there is a GPU job launched in =
parallel which monitors the memory-fence status and reports back through a =
mailbox/doorbell, or the CPU-side driver enqueues kqueue work for $n millis=
econds&#39; time to check the value in memory and kill the context if it do=
esn&#39;t meet expectations - whatever. I don&#39;t believe any of those ch=
oices meaningfully impact on kernel driver complexity relative to the initi=
al proposal, but they do allow us to continue to provide the guarantees we =
do today when buffers cross security boundaries.</div><div><br></div><div>T=
here might well be an argument for significantly weakening those security b=
oundaries and shifting the complexity from the DRM scheduler into userspace=
 compositors. So far though, I have yet to see that argument made coherentl=
y.</div><div><br></div><div>Cheers,</div><div>Daniel</div></div></div>

--00000000000013779905c06c4393--

--===============1399853888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1399853888==--
