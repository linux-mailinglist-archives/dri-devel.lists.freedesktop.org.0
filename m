Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 230373985C4
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 11:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE1F6EC32;
	Wed,  2 Jun 2021 09:59:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E0A6EC33;
 Wed,  2 Jun 2021 09:59:08 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id q15so1780267pgg.12;
 Wed, 02 Jun 2021 02:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4gTx0tK/yg/Xl6aA7PaAETBuKXT+TqY4PqFZZiXyZqc=;
 b=fz5wvP7uaoq4a2gJhyAV/cHgjhOISZLlwpQgblpamSnBe5jTEonuosXVjUbkG/lpN7
 hUHSqPwVOHIRXLq/S7OQAfryBnTWlsE1+TVEsQtUju4Sj1nLq/nJpLGOeVoWMpwmIF2d
 +Dve4wz8AtPHnJZq0shtaHxthpBIHWGM9yXgZG+qVvmxFIN0ChiHyRSwN2JedrziqUS9
 KdJMtXaTgzByo9b/a6sZCRNybP6uPAE2+YTcCLwa+v4gKMuZiecND9DFYyM4KHAbKrx3
 kGodESaDzOQ4sC/2aPmc1W9zpoCXYg7Arws8CWMDmf5PXeUmd5hGMl2KDNVdQS6df50m
 /Mlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4gTx0tK/yg/Xl6aA7PaAETBuKXT+TqY4PqFZZiXyZqc=;
 b=RLleuWdOAVq/rMGWOKuN8XB9eg7wVGh7GDHJtqIxBVQUnOmbjfoJ7fyrPyS0sboVSi
 0yKB1EIYu9DGw9OxRqsJ+1/mCXtoxUHWOyB+ZEsOF78S6FlQ+bJUR4om2VfJuBh4mALr
 QntRXae75ttJ9I6PFa9IzAC1dJbWDAZtAX3hYq4Z57fSmBZrhrFGGCqAkzbblgLi1U42
 cmg4EVDxc57sO0CLpwI2XJC5pc2oPdPFm5nQCnsuUl0G5Z9fY+hG+k02o9Dhir8Odc5q
 YAqGNJDtIA/Em/L889SOq0/nhoLK+kXLG1Qb2JXDdZJ9pvTdG40GjZ+6j9B0O2UoP9ox
 u36A==
X-Gm-Message-State: AOAM530uvoY7ChyKO81XJrZ6byeAGPuP+4V4HHhMQTuF3osSM6j+gvS0
 lp7XCZ5Sw5st5VB5SugT4LNJ1X2ziVVrqoYFd04=
X-Google-Smtp-Source: ABdhPJyHDa17BqVg0TZZ1LobxrDBgurHYER2isWHQEf5wAbC+MRyGcylYXn/rkf37rdYtXAWKcM65UfT76XtU/efFKk=
X-Received: by 2002:a05:6a00:22c1:b029:2dc:edbe:5e9 with SMTP id
 f1-20020a056a0022c1b02902dcedbe05e9mr26677096pfj.51.1622627947888; Wed, 02
 Jun 2021 02:59:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A4XS2mCXOdvxm1ZAhG2OY9w1P0X2E1ac1TXNFKDekog5g@mail.gmail.com>
 <e7cb9833-1044-0426-5ce4-5b5fc32a3603@daenzer.net>
 <327e4008-b29f-f5b7-bb30-532fa52c797f@gmail.com>
 <7f19e3c7-b6b2-5200-95eb-3fed8d22a6b3@daenzer.net>
 <b0d65f94-cc56-a4db-3158-7b1de3952792@gmail.com>
 <CAKMK7uGaD_LuX-SZDALuDuEOMZNX=Q3FAq0xYf_pTVtNe6VUaw@mail.gmail.com>
 <c7190219-c185-3b7e-42a6-691934f79fb3@gmail.com>
 <CAPj87rPbiFf3qDo35gmirAoTOOJ5fEE6UxQdJKtfjX_VTqc6pg@mail.gmail.com>
 <bbb990cf-008a-e4d3-93d3-a9adc2f202b7@gmail.com>
In-Reply-To: <bbb990cf-008a-e4d3-93d3-a9adc2f202b7@gmail.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Wed, 2 Jun 2021 05:58:31 -0400
Message-ID: <CAAxE2A5Hrw7oqYKttEYBdd7k6onqZc8ksak5T-Ry1oKJEZtSbw@mail.gmail.com>
Subject: Re: [Mesa-dev] Linux Graphics Next: Userspace submission update
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000006fc5b805c3c58259"
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
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000006fc5b805c3c58259
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 2, 2021 at 5:44 AM Christian K=C3=B6nig <
ckoenig.leichtzumerken@gmail.com> wrote:

> Am 02.06.21 um 10:57 schrieb Daniel Stone:
> > Hi Christian,
> >
> > On Tue, 1 Jun 2021 at 13:51, Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> >> Am 01.06.21 um 14:30 schrieb Daniel Vetter:
> >>> If you want to enable this use-case with driver magic and without the
> >>> compositor being aware of what's going on, the solution is EGLStreams=
.
> >>> Not sure we want to go there, but it's definitely a lot more feasible
> >>> than trying to stuff eglstreams semantics into dma-buf implicit
> >>> fencing support in a desperate attempt to not change compositors.
> >> Well not changing compositors is certainly not something I would try
> >> with this use case.
> >>
> >> Not changing compositors is more like ok we have Ubuntu 20.04 and need
> >> to support that we the newest hardware generation.
> > Serious question, have you talked to Canonical?
> >
> > I mean there's a hell of a lot of effort being expended here, but it
> > seems to all be predicated on the assumption that Ubuntu's LTS
> > HWE/backport policy is totally immutable, and that we might need to
> > make the kernel do backflips to work around that. But ... is it? Has
> > anyone actually asked them how they feel about this?
>
> This was merely an example. What I wanted to say is that we need to
> support system already deployed.
>
> In other words our customers won't accept that they need to replace the
> compositor just because they switch to a new hardware generation.
>
> > I mean, my answer to the first email is 'no, absolutely not' from the
> > technical perspective (the initial proposal totally breaks current and
> > future userspace), from a design perspective (it breaks a lot of
> > usecases which aren't single-vendor GPU+display+codec, or aren't just
> > a simple desktop), and from a sustainability perspective (cutting
> > Android adrift again isn't acceptable collateral damage to make it
> > easier to backport things to last year's Ubuntu release).
> >
> > But then again, I don't even know what I'm NAKing here ... ? The
> > original email just lists a proposal to break a ton of things, with
> > proposed replacements which aren't technically viable, and it's not
> > clear why? Can we please have some more details and some reasoning
> > behind them?
> >
> > I don't mind that userspace (compositor, protocols, clients like Mesa
> > as well as codec APIs) need to do a lot of work to support the new
> > model. I do really care though that the hard-binary-switch model works
> > fine enough for AMD but totally breaks heterogeneous systems and makes
> > it impossible for userspace to do the right thing.
>
> Well how the handling for new Android, distributions etc... is going to
> look like is a completely different story.
>
> And I completely agree with both Daniel Vetter and you that we need to
> keep this in mind when designing the compatibility with older software.
>
> For Android I'm really not sure what to do. In general Android is
> already trying to do the right thing by using explicit sync, the problem
> is that this is build around the idea that this explicit sync is
> syncfile kernel based.
>
> Either we need to change Android and come up with something that works
> with user fences as well or we somehow invent a compatibility layer for
> syncfile as well.
>

What's the issue with syncfiles that syncobjs don't suffer from?

Marek

--0000000000006fc5b805c3c58259
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, Jun 2, 2021 at 5:44 AM Christian K=C3=B6nig &lt;<a href=3D"m=
ailto:ckoenig.leichtzumerken@gmail.com">ckoenig.leichtzumerken@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Am =
02.06.21 um 10:57 schrieb Daniel Stone:<br>
&gt; Hi Christian,<br>
&gt;<br>
&gt; On Tue, 1 Jun 2021 at 13:51, Christian K=C3=B6nig<br>
&gt; &lt;<a href=3D"mailto:ckoenig.leichtzumerken@gmail.com" target=3D"_bla=
nk">ckoenig.leichtzumerken@gmail.com</a>&gt; wrote:<br>
&gt;&gt; Am 01.06.21 um 14:30 schrieb Daniel Vetter:<br>
&gt;&gt;&gt; If you want to enable this use-case with driver magic and with=
out the<br>
&gt;&gt;&gt; compositor being aware of what&#39;s going on, the solution is=
 EGLStreams.<br>
&gt;&gt;&gt; Not sure we want to go there, but it&#39;s definitely a lot mo=
re feasible<br>
&gt;&gt;&gt; than trying to stuff eglstreams semantics into dma-buf implici=
t<br>
&gt;&gt;&gt; fencing support in a desperate attempt to not change composito=
rs.<br>
&gt;&gt; Well not changing compositors is certainly not something I would t=
ry<br>
&gt;&gt; with this use case.<br>
&gt;&gt;<br>
&gt;&gt; Not changing compositors is more like ok we have Ubuntu 20.04 and =
need<br>
&gt;&gt; to support that we the newest hardware generation.<br>
&gt; Serious question, have you talked to Canonical?<br>
&gt;<br>
&gt; I mean there&#39;s a hell of a lot of effort being expended here, but =
it<br>
&gt; seems to all be predicated on the assumption that Ubuntu&#39;s LTS<br>
&gt; HWE/backport policy is totally immutable, and that we might need to<br=
>
&gt; make the kernel do backflips to work around that. But ... is it? Has<b=
r>
&gt; anyone actually asked them how they feel about this?<br>
<br>
This was merely an example. What I wanted to say is that we need to <br>
support system already deployed.<br>
<br>
In other words our customers won&#39;t accept that they need to replace the=
 <br>
compositor just because they switch to a new hardware generation.<br>
<br>
&gt; I mean, my answer to the first email is &#39;no, absolutely not&#39; f=
rom the<br>
&gt; technical perspective (the initial proposal totally breaks current and=
<br>
&gt; future userspace), from a design perspective (it breaks a lot of<br>
&gt; usecases which aren&#39;t single-vendor GPU+display+codec, or aren&#39=
;t just<br>
&gt; a simple desktop), and from a sustainability perspective (cutting<br>
&gt; Android adrift again isn&#39;t acceptable collateral damage to make it=
<br>
&gt; easier to backport things to last year&#39;s Ubuntu release).<br>
&gt;<br>
&gt; But then again, I don&#39;t even know what I&#39;m NAKing here ... ? T=
he<br>
&gt; original email just lists a proposal to break a ton of things, with<br=
>
&gt; proposed replacements which aren&#39;t technically viable, and it&#39;=
s not<br>
&gt; clear why? Can we please have some more details and some reasoning<br>
&gt; behind them?<br>
&gt;<br>
&gt; I don&#39;t mind that userspace (compositor, protocols, clients like M=
esa<br>
&gt; as well as codec APIs) need to do a lot of work to support the new<br>
&gt; model. I do really care though that the hard-binary-switch model works=
<br>
&gt; fine enough for AMD but totally breaks heterogeneous systems and makes=
<br>
&gt; it impossible for userspace to do the right thing.<br>
<br>
Well how the handling for new Android, distributions etc... is going to <br=
>
look like is a completely different story.<br>
<br>
And I completely agree with both Daniel Vetter and you that we need to <br>
keep this in mind when designing the compatibility with older software.<br>
<br>
For Android I&#39;m really not sure what to do. In general Android is <br>
already trying to do the right thing by using explicit sync, the problem <b=
r>
is that this is build around the idea that this explicit sync is <br>
syncfile kernel based.<br>
<br>
Either we need to change Android and come up with something that works <br>
with user fences as well or we somehow invent a compatibility layer for <br=
>
syncfile as well.<br></blockquote><div><br></div>What&#39;s the issue with =
syncfiles that syncobjs don&#39;t suffer from?</div><div class=3D"gmail_quo=
te"><br></div><div class=3D"gmail_quote">Marek<br></div></div>

--0000000000006fc5b805c3c58259--
