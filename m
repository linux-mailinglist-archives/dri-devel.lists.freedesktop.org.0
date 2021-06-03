Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FAD39987E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 05:17:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D6C6E040;
	Thu,  3 Jun 2021 03:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D896E040;
 Thu,  3 Jun 2021 03:17:15 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 mq2-20020a17090b3802b0290162428291f5so2992531pjb.4; 
 Wed, 02 Jun 2021 20:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5wW5yCBeF/s7I9d7BA/UVB/setlpsbND5rc4tU2g5pA=;
 b=TU/LbuH2bD2zzL135YjUm9Z/KrWW4trYaMvLi3NjWUiio67EOhHdiWMvbb8Zgk4cHR
 jsNHxUArCREcI1D7H7+aITrk+iW/2mwC1yactWIKnm3G/ZQ8II4p0VgcoXJqW44yDg/E
 7NISnz/998lHX9kf4FLUx3+zdC4JEoB6Nw6OJjVfHv8KCEPzfJR1F9Z0NPYNjS3k1dGn
 r5BjQSHZtW80oq0xzjy6POxkWctHJhCJxpnGtUQ6df+HiS51k8pfDYBV475SzuKnNwLi
 PPowlr/obcgonEqrMjHI2NGue8KJN/Mm5JFZSU757BbuEc1ZmLs+oxXrRUxbdjfn+Saz
 shvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5wW5yCBeF/s7I9d7BA/UVB/setlpsbND5rc4tU2g5pA=;
 b=e9za3dDBnTZNUzmcq8iwmDxXvTl90VZT/MjlqFsZOC0IUmDU1TXO7QQfq8nUTMJFKS
 medIWEX0lZL1pnxuGK7mdxelMhEowlzvg+g9B48F1n9pdUWVNwKMTtMGwKnFJ9H3EmGQ
 ffC4tsACskghDd3emcye1apZq+58uYaOAfobUnip+RDkKL36zSCeDHUBeH7rpzcbbs6e
 SN6NItrdxEQoKBmJMXuAeWkE08eYblqmYDNg2XxZN2ZkTbDKN03W5IfQQLBSzyVIBDSU
 vCySERER62/uG341p0/tR75nowFDY1KYfHIH3zpPuygf+A25xaUVfv8m/gGvwRbiwcku
 6SXg==
X-Gm-Message-State: AOAM531Nd5EHt7A3Lw6WOghxIo+13mxdy2/0G11DGSYLHgSCU8yk18PG
 hUaBOmnHMzYJ3cP88uugMmu/sz8mx0E8C3HF6Gk=
X-Google-Smtp-Source: ABdhPJzw/q30fT+pA+Iw6IiZc6iBFBI2SD/NItxubs6eNpJxYr1mVRU4OsGscSoa8sX3jnL4/fZ73b2vbDxXidzzuek=
X-Received: by 2002:a17:90b:4b4d:: with SMTP id
 mi13mr8922116pjb.75.1622690235214; 
 Wed, 02 Jun 2021 20:17:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A4XS2mCXOdvxm1ZAhG2OY9w1P0X2E1ac1TXNFKDekog5g@mail.gmail.com>
 <e7cb9833-1044-0426-5ce4-5b5fc32a3603@daenzer.net>
 <327e4008-b29f-f5b7-bb30-532fa52c797f@gmail.com>
 <7f19e3c7-b6b2-5200-95eb-3fed8d22a6b3@daenzer.net>
 <b0d65f94-cc56-a4db-3158-7b1de3952792@gmail.com>
 <CAKMK7uGaD_LuX-SZDALuDuEOMZNX=Q3FAq0xYf_pTVtNe6VUaw@mail.gmail.com>
 <c7190219-c185-3b7e-42a6-691934f79fb3@gmail.com>
 <CAPj87rPbiFf3qDo35gmirAoTOOJ5fEE6UxQdJKtfjX_VTqc6pg@mail.gmail.com>
 <CAAxE2A4kC4A9gV_V-W3eRW20O=9S1pv8=KMBdJxdLQ-ZXGa37Q@mail.gmail.com>
 <CAAxE2A7FJSaYfrYRpoCr-3h-AqBjOOJerhMVCcQZzQu0a+J0zg@mail.gmail.com>
 <YLfSbxhyDQmHjV4r@phenom.ffwll.local>
In-Reply-To: <YLfSbxhyDQmHjV4r@phenom.ffwll.local>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Wed, 2 Jun 2021 23:16:39 -0400
Message-ID: <CAAxE2A7uK7zumDiaU1XpEi_RNv8Q+QQHU-dLB0HrES2BkdP-cw@mail.gmail.com>
Subject: Re: [Mesa-dev] Linux Graphics Next: Userspace submission update
To: Daniel Vetter <daniel@ffwll.ch>
Content-Type: multipart/alternative; boundary="0000000000000cf06405c3d40351"
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
 Jason Ekstrand <jason@jlekstrand.net>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000000cf06405c3d40351
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 2, 2021 at 2:48 PM Daniel Vetter <daniel@ffwll.ch> wrote:

> On Wed, Jun 02, 2021 at 05:38:51AM -0400, Marek Ol=C5=A1=C3=A1k wrote:
> > On Wed, Jun 2, 2021 at 5:34 AM Marek Ol=C5=A1=C3=A1k <maraeo@gmail.com>=
 wrote:
> >
> > > Yes, we can't break anything because we don't want to complicate thin=
gs
> > > for us. It's pretty much all NAK'd already. We are trying to gather
> more
> > > knowledge and then make better decisions.
> > >
> > > The idea we are considering is that we'll expose memory-based sync
> objects
> > > to userspace for read only, and the kernel or hw will strictly contro=
l
> the
> > > memory writes to those sync objects. The hole in that idea is that
> > > userspace can decide not to signal a job, so even if userspace can't
> > > overwrite memory-based sync object states arbitrarily, it can still
> decide
> > > not to signal them, and then a future fence is born.
> > >
> >
> > This would actually be treated as a GPU hang caused by that context, so
> it
> > should be fine.
>
> This is practically what I proposed already, except your not doing it wit=
h
> dma_fence. And on the memory fence side this also doesn't actually give
> what you want for that compute model.
>
> This seems like a bit a worst of both worlds approach to me? Tons of work
> in the kernel to hide these not-dma_fence-but-almost, and still pain to
> actually drive the hardware like it should be for compute or direct
> display.
>
> Also maybe I've missed it, but I didn't see any replies to my suggestion
> how to fake the entire dma_fence stuff on top of new hw. Would be
> interesting to know what doesn't work there instead of amd folks going of
> into internal again and then coming back with another rfc from out of
> nowhere :-)
>

Going internal again is probably a good idea to spare you the long
discussions and not waste your time, but we haven't talked about the
dma_fence stuff internally other than acknowledging that it can be solved.

The compute use case already uses the hw as-is with no inter-process
sharing, which mostly keeps the kernel out of the picture. It uses glFinish
to sync with GL.

The gfx use case needs new hardware logic to support implicit and explicit
sync. When we propose a solution, it's usually torn apart the next day by
ourselves.

Since we are talking about next hw or next next hw, preemption should be
better.

user queue =3D user-mapped ring buffer

For implicit sync, we will only let userspace lock access to a buffer via a
user queue, which waits for the per-buffer sequence counter in memory to be
>=3D the number assigned by the kernel, and later unlock the access with
another command, which increments the per-buffer sequence counter in memory
with atomic_inc regardless of the number assigned by the kernel. The kernel
counter and the counter in memory can be out-of-sync, and I'll explain why
it's OK. If a process increments the kernel counter but not the memory
counter, that's its problem and it's the same as a GPU hang caused by that
process. If a process increments the memory counter but not the kernel
counter, the ">=3D" condition alongside atomic_inc guarantee that signaling=
 n
will signal n+1, so it will never deadlock but also it will effectively
disable synchronization. This method of disabling synchronization is
similar to a process corrupting the buffer, which should be fine. Can you
find any flaw in it? I can't find any.

The explicit submit can be done by userspace (if there is no
synchronization), but we plan to use the kernel to do it for implicit sync.
Essentially, the kernel will receive a buffer list and addresses of wait
commands in the user queue. It will assign new sequence numbers to all
buffers and write those numbers into the wait commands, and ring the hw
doorbell to start execution of that queue.

Marek

--0000000000000cf06405c3d40351
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, Jun 2, 2021 at 2:48 PM Daniel Vetter &lt;<a href=3D"mailto:d=
aniel@ffwll.ch">daniel@ffwll.ch</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Wed, Jun 02, 2021 at 05:38:51AM -0400, =
Marek Ol=C5=A1=C3=A1k wrote:<br>
&gt; On Wed, Jun 2, 2021 at 5:34 AM Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"ma=
ilto:maraeo@gmail.com" target=3D"_blank">maraeo@gmail.com</a>&gt; wrote:<br=
>
&gt; <br>
&gt; &gt; Yes, we can&#39;t break anything because we don&#39;t want to com=
plicate things<br>
&gt; &gt; for us. It&#39;s pretty much all NAK&#39;d already. We are trying=
 to gather more<br>
&gt; &gt; knowledge and then make better decisions.<br>
&gt; &gt;<br>
&gt; &gt; The idea we are considering is that we&#39;ll expose memory-based=
 sync objects<br>
&gt; &gt; to userspace for read only, and the kernel or hw will strictly co=
ntrol the<br>
&gt; &gt; memory writes to those sync objects. The hole in that idea is tha=
t<br>
&gt; &gt; userspace can decide not to signal a job, so even if userspace ca=
n&#39;t<br>
&gt; &gt; overwrite memory-based sync object states arbitrarily, it can sti=
ll decide<br>
&gt; &gt; not to signal them, and then a future fence is born.<br>
&gt; &gt;<br>
&gt; <br>
&gt; This would actually be treated as a GPU hang caused by that context, s=
o it<br>
&gt; should be fine.<br>
<br>
This is practically what I proposed already, except your not doing it with<=
br>
dma_fence. And on the memory fence side this also doesn&#39;t actually give=
<br>
what you want for that compute model.<br>
<br>
This seems like a bit a worst of both worlds approach to me? Tons of work<b=
r>
in the kernel to hide these not-dma_fence-but-almost, and still pain to<br>
actually drive the hardware like it should be for compute or direct<br>
display.<br>
<br>
Also maybe I&#39;ve missed it, but I didn&#39;t see any replies to my sugge=
stion<br>
how to fake the entire dma_fence stuff on top of new hw. Would be<br>
interesting to know what doesn&#39;t work there instead of amd folks going =
of<br>
into internal again and then coming back with another rfc from out of<br>
nowhere :-)<br></blockquote><div><br></div>Going internal again is probably=
 a good idea to spare you the long discussions and not waste your time, but=
 we haven&#39;t talked about the dma_fence stuff internally other than ackn=
owledging that it can be solved.<br></div><div class=3D"gmail_quote"><br></=
div><div class=3D"gmail_quote">The compute use case already uses the hw as-=
is with no inter-process sharing, which mostly keeps the kernel out of the =
picture. It uses glFinish to sync with GL.</div><div class=3D"gmail_quote">=
<br></div><div class=3D"gmail_quote">The gfx use case needs new hardware lo=
gic to support implicit and explicit sync. When we propose a solution, it&#=
39;s usually torn apart the next day by ourselves.</div><div class=3D"gmail=
_quote"><br></div><div class=3D"gmail_quote">Since we are talking about nex=
t hw or next next hw, preemption should be better.</div><div class=3D"gmail=
_quote"><br></div><div class=3D"gmail_quote">user queue =3D user-mapped rin=
g buffer<br></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_=
quote">For implicit sync, we will only let userspace lock access to a buffe=
r via a user queue, which waits for the per-buffer sequence counter in memo=
ry to be &gt;=3D the number assigned by the kernel, and later unlock the ac=
cess with another command, which increments the per-buffer sequence counter=
 in memory with atomic_inc regardless of the number assigned by the kernel.=
 The kernel counter and the counter in memory can be out-of-sync, and I&#39=
;ll explain why it&#39;s OK. If a process increments the kernel counter but=
 not the memory counter, that&#39;s its problem and it&#39;s the same as a =
GPU hang caused by that process. If a process increments the memory counter=
 but not the kernel counter, the &quot;&gt;=3D&quot; condition alongside at=
omic_inc guarantee that signaling n will signal n+1, so it will never deadl=
ock but also it will effectively disable synchronization. This method of di=
sabling synchronization is similar to a process corrupting the buffer, whic=
h should be fine. Can you find any flaw in it? I can&#39;t find any.</div><=
div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">The explicit=
 submit can be done by userspace (if there is no synchronization), but we p=
lan to use the kernel to do it for implicit sync. Essentially, the kernel w=
ill receive a buffer list and addresses of wait commands in the user queue.=
 It will assign new sequence numbers to all buffers and write those numbers=
 into the wait commands, and ring the hw doorbell to start execution of tha=
t queue.<br></div><div class=3D"gmail_quote"></div><div class=3D"gmail_quot=
e"></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Ma=
rek<br></div></div>

--0000000000000cf06405c3d40351--
