Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3271365979
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 15:04:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C85A6E4FF;
	Tue, 20 Apr 2021 13:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B808D6E4FF
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 13:04:19 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id g9so21505741wrx.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 06:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RzBZsXzT2dX5XnPwZH8kl1Gl66Kr/BRGxEjT+od0hGg=;
 b=Ho3FN0Pwcadait9yqH5B1GLhyJ2V3LecZnUAFNU55tvTeGQUy0tJl75PxuGOdm0w54
 cq/CdtXItSnbIvTquqYBVeKumgBWWfeVXXlhSUpkZN9YSeaO7Q3FM2cmBUR9Z6KgcBia
 BWGkC7MVbs6RouJPZsr/GO60PQ3rzXCb4rZpTlZvkHA5n502WL1j6GxBKrh0jilUTCfv
 4CkjGkDvcJgtRqy0ltquT2WhQDfWYr22yTAELoYLReuPSitBtnWChcnKPUdXl7Oh0KEJ
 /qRp5Icl3lRHeZ6xbprG+b9n5ERzVy0g+4T8lFbtVBH3HBUTeWqaafBFluyeiztb8D0+
 SQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RzBZsXzT2dX5XnPwZH8kl1Gl66Kr/BRGxEjT+od0hGg=;
 b=ElCv3jh9aZOkjb0WNfSiGb/TMkqmmCG5AAxsfKLQz8FuEImPI9iyCtYTDBPWzBKZg2
 9uyC6HZWcEejwPfzOpV57mS+NcKXgAK5yVwJtIq1uAhnfawOfupjHSw1K72oPaH8TzDi
 HaeVywuwo68vzptyTo5B7GyvT7i0OMTe2T8ruBi7chMHgsyUjSCpEEguCnaYZ2CrE/Pc
 RK0AiHbB8y+wu0tCzC7M+l25oZ70nN+CHB4P+mRyGE9GaaaKhI/8zsxxMQKNll//4b9T
 jZqmTo1fxpAir67kr3CkWjFQEAhxLgjBkOGPGLYGlTJq1VOw+xkY6lyvj3pQh5aRB2H+
 m6rQ==
X-Gm-Message-State: AOAM531yMWvLgXZs0zsAp1x7iJG+VCAn/qNfFFpf9SHfgC3TENjs6wvM
 5Gfwfd+gvsaT6sAhhyRpgJF6MYIpBR1GIH8oW7XGvA==
X-Google-Smtp-Source: ABdhPJw5t9rpbWa2xPIfIdCqvEdhqubgZ8i9qpbd7tvUoTbq9yt0l0da36hamI0bTLqPS+wvq+RBwGSwpmqujq6m7NY=
X-Received: by 2002:adf:eb0a:: with SMTP id s10mr20818682wrn.6.1618923858319; 
 Tue, 20 Apr 2021 06:04:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
 <YH7CmXyKFFh3lagO@phenom.ffwll.local>
In-Reply-To: <YH7CmXyKFFh3lagO@phenom.ffwll.local>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 20 Apr 2021 14:03:32 +0100
Message-ID: <CAPj87rOhAfLRpRCAgNnCB+dW3vuyVuZK6h3EHdxA-wrH8LxuuQ@mail.gmail.com>
Subject: Re: [RFC] Linux Graphics Next: Explicit fences everywhere and no BO
 fences - initial proposal
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
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Content-Type: multipart/mixed; boundary="===============1784454742=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1784454742==
Content-Type: multipart/alternative; boundary="0000000000007e6ce005c0671530"

--0000000000007e6ce005c0671530
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, 20 Apr 2021 at 13:01, Daniel Vetter <daniel@ffwll.ch> wrote:

> - We live in a post xf86-video-$vendor world, and all these other
>   compositors rely on implicit sync. You're not going to be able to get
>   rid of them anytime soon. What's worse, all the various EGL/vk buffer
>   sharing things also rely on implicit sync, so you get to fix up tons of
>   applications on top. Any plan that's realistic needs to cope with
>   implicit/explicit at the same time together won't work.
>
> - Absolute infuriating, but you can't use page-faulting together with any
>   dma_fence synchronization primitives, whether implicit or explicit. This
>   means until the entire ecosystem moved forward (good luck with that) we
>   have to support dma_fence. The only sync model that works together with
>   page faults is userspace fence based sync.
>
This should get rid of the oversync issues, and since implicit sync is
> backed in everywhere right now, you'll have to deal with implicit sync for
> a very long time.
>

Depends what you mean by 'implicit sync'. ;)

Getting userspace (Vulkan WSI, EGL, Wayland compositors, browsers, media
clients) over to explicit sync is easy, _provided_ that the explicit sync
gives us the same guarantees as implicit sync, i.e. completes in bounded
time, GPU/display work can be flushed to the kernel predicated on fence
completion with the kernel handling synchronisation and scheduling. It's
just a matter of typing, and until now we haven't had a great reason to do
that typing. Now we do have that reason, so we are implementing it. Whether
it's dma_fence or drm_syncobj is mostly immaterial; we can encode in
protocol requirements that you can't try to use wait-before-signal with
drm_syncobj and you'll get killed if you try.

Getting that userspace over to fully userspace-based sync
(wait-before-signal or wait-never-signal, no kernel assistance but you just
have to roll your own polling or signal handling on either CPU or GPU side)
is not easy. It might never happen, because it's an extraordinary amount of
work, introduces a huge amount of fragility into a super-critical path, and
and so far it's not clear that it's a global performance improvement for
the whole system, just shifting performance problems from kernel to
userspace, and probably (AFAICT) making them worse in addition to the other
problems it brings.

What am I missing?

Cheers,
Daniel

--0000000000007e6ce005c0671530
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,</div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Tue, 20 Apr 2021 at 13:01, Daniel V=
etter &lt;<a href=3D"mailto:daniel@ffwll.ch">daniel@ffwll.ch</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">- We live in a =
post xf86-video-$vendor world, and all these other<br>
=C2=A0 compositors rely on implicit sync. You&#39;re not going to be able t=
o get<br>
=C2=A0 rid of them anytime soon. What&#39;s worse, all the various EGL/vk b=
uffer<br>
=C2=A0 sharing things also rely on implicit sync, so you get to fix up tons=
 of<br>
=C2=A0 applications on top. Any plan that&#39;s realistic needs to cope wit=
h<br>
=C2=A0 implicit/explicit at the same time together won&#39;t work.<br>
<br>
- Absolute infuriating, but you can&#39;t use page-faulting together with a=
ny<br>
=C2=A0 dma_fence synchronization primitives, whether implicit or explicit. =
This<br>
=C2=A0 means until the entire ecosystem moved forward (good luck with that)=
 we<br>
=C2=A0 have to support dma_fence. The only sync model that works together w=
ith<br>
=C2=A0 page faults is userspace fence based sync.<span style=3D"">=C2=A0</s=
pan><br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This=
 should get rid of the oversync issues, and since implicit sync is<br>
backed in everywhere right now, you&#39;ll have to deal with implicit sync =
for<br>
a very long time.<br></blockquote><div><br></div><div>Depends what you mean=
 by &#39;implicit sync&#39;. ;)</div><div><br></div><div>Getting userspace=
=C2=A0(Vulkan WSI, EGL, Wayland compositors, browsers, media clients) over =
to explicit sync is easy, _provided_ that the explicit sync gives us the sa=
me guarantees as implicit sync, i.e. completes in bounded time, GPU/display=
 work can be flushed to the kernel predicated on fence completion with the =
kernel handling synchronisation and scheduling. It&#39;s just a matter of t=
yping, and until now we haven&#39;t had a great reason to do that typing. N=
ow we do have that reason, so we are implementing it. Whether it&#39;s dma_=
fence or drm_syncobj is mostly immaterial; we can encode in protocol requir=
ements that you can&#39;t try to use wait-before-signal with drm_syncobj an=
d you&#39;ll get killed if you try.</div><div><br></div><div>Getting that u=
serspace over to fully userspace-based sync (wait-before-signal or wait-nev=
er-signal, no kernel assistance but you just have to roll your own polling =
or signal handling on either CPU or GPU side) is not easy. It might never h=
appen, because it&#39;s an extraordinary amount of work, introduces a huge =
amount of fragility into a super-critical path, and and so far it&#39;s not=
 clear that it&#39;s a global performance improvement for the whole system,=
 just shifting performance problems from kernel to userspace, and probably =
(AFAICT) making them worse in addition to the other problems it brings.</di=
v><div><br></div><div>What am I missing?</div><div><br></div><div>Cheers,</=
div><div>Daniel</div></div></div>

--0000000000007e6ce005c0671530--

--===============1784454742==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1784454742==--
