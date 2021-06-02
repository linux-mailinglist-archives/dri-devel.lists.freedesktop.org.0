Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4B939855A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 11:35:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F5776EC21;
	Wed,  2 Jun 2021 09:35:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 193DD6EC1F;
 Wed,  2 Jun 2021 09:35:05 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 m13-20020a17090b068db02901656cc93a75so3119488pjz.3; 
 Wed, 02 Jun 2021 02:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F9PtPpEdFhiyQ1Uzc4W7Gm8hs4lW9XiFuf5Lzw+Xcko=;
 b=Q6JUgvqncWZvzZMpi0I9fPvcv/BR6wwgOSc9ItOoUXUd3PA24mAFaurflCUv46/i9F
 e2IRHIhDnKc/2aW0nO5fRRUDfYwnZE9qnFDpfY3Ewyleo8X9lXMxkykZhvCJNzg0XR5h
 kCips/jjMnVyXEyZXilIx5T7HLNeb/b4Dn3apljzO2+ITXHdM6ulJFJXni7rWP0zwjas
 zJblB9dTeEq4O24b6/QHrfq6SheAKkPO42w3ossqVJtlKM8D0c8/xzFFVnxz/jdbI1ec
 VI90wGEYFUI43epMu95NQh+JA2LbUzjI8NVpyfLOqwU8TjnT600lHKgdIyEFxLB1PUSv
 TyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F9PtPpEdFhiyQ1Uzc4W7Gm8hs4lW9XiFuf5Lzw+Xcko=;
 b=mNPgXUXFwRDziq8gP8jBmgz2ZaUmlBIskV1MtrNI1CIcaXSM57rYHnk79VHY61qa6z
 5JUc6UBoo2ZgNU+zvO5iU4K4FYb90j8QFaT19Epi5xNBpfAvMjTaC/EpBNsXoDEizzDG
 OEAodNqPgI1wKayc06Na824S3Q2yjlYSiadJ6//0v8euqNlAWp+wSuWK3v5iFOKAT2Gi
 7iQxbwnAxnVsSmv/IeCG5YmvI6mQSg/FPKpfGSq59XUu6T9ehS4w785HOtUJc6rUP2gg
 6ECub1HdCyHTnbkz0eaWqIL/C3tGo2TV4z+ZbokZFBCbXZq5+Ik/Z5acZ0RuNPbTuODb
 vueA==
X-Gm-Message-State: AOAM531ht9EjZv8VePZdl5OIBUCOG54X2PFkQQAIncFyLwpj4A2QLoeG
 18ggAbA6j2fKUCzlk3YD0YaCkdOpPE8YkxsY2e8=
X-Google-Smtp-Source: ABdhPJxUD7Gjfaye7P4SkguzPUFmWtxjmpjV2xWBIWi/hhIGHVoYP1YAITnh5n9DDakmDX7EesVYT31rlX5EkbBS27o=
X-Received: by 2002:a17:90a:b28d:: with SMTP id
 c13mr4655428pjr.80.1622626504672; 
 Wed, 02 Jun 2021 02:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A4XS2mCXOdvxm1ZAhG2OY9w1P0X2E1ac1TXNFKDekog5g@mail.gmail.com>
 <e7cb9833-1044-0426-5ce4-5b5fc32a3603@daenzer.net>
 <327e4008-b29f-f5b7-bb30-532fa52c797f@gmail.com>
 <7f19e3c7-b6b2-5200-95eb-3fed8d22a6b3@daenzer.net>
 <b0d65f94-cc56-a4db-3158-7b1de3952792@gmail.com>
 <CAKMK7uGaD_LuX-SZDALuDuEOMZNX=Q3FAq0xYf_pTVtNe6VUaw@mail.gmail.com>
 <c7190219-c185-3b7e-42a6-691934f79fb3@gmail.com>
 <CAPj87rPbiFf3qDo35gmirAoTOOJ5fEE6UxQdJKtfjX_VTqc6pg@mail.gmail.com>
In-Reply-To: <CAPj87rPbiFf3qDo35gmirAoTOOJ5fEE6UxQdJKtfjX_VTqc6pg@mail.gmail.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Wed, 2 Jun 2021 05:34:28 -0400
Message-ID: <CAAxE2A4kC4A9gV_V-W3eRW20O=9S1pv8=KMBdJxdLQ-ZXGa37Q@mail.gmail.com>
Subject: Re: [Mesa-dev] Linux Graphics Next: Userspace submission update
To: Daniel Stone <daniel@fooishbar.org>
Content-Type: multipart/alternative; boundary="0000000000006a093905c3c52cda"
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

--0000000000006a093905c3c52cda
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, we can't break anything because we don't want to complicate things for
us. It's pretty much all NAK'd already. We are trying to gather more
knowledge and then make better decisions.

The idea we are considering is that we'll expose memory-based sync objects
to userspace for read only, and the kernel or hw will strictly control the
memory writes to those sync objects. The hole in that idea is that
userspace can decide not to signal a job, so even if userspace can't
overwrite memory-based sync object states arbitrarily, it can still decide
not to signal them, and then a future fence is born.

Marek

On Wed, Jun 2, 2021 at 4:57 AM Daniel Stone <daniel@fooishbar.org> wrote:

> Hi Christian,
>
> On Tue, 1 Jun 2021 at 13:51, Christian K=C3=B6nig
> <ckoenig.leichtzumerken@gmail.com> wrote:
> > Am 01.06.21 um 14:30 schrieb Daniel Vetter:
> > > If you want to enable this use-case with driver magic and without the
> > > compositor being aware of what's going on, the solution is EGLStreams=
.
> > > Not sure we want to go there, but it's definitely a lot more feasible
> > > than trying to stuff eglstreams semantics into dma-buf implicit
> > > fencing support in a desperate attempt to not change compositors.
> >
> > Well not changing compositors is certainly not something I would try
> > with this use case.
> >
> > Not changing compositors is more like ok we have Ubuntu 20.04 and need
> > to support that we the newest hardware generation.
>
> Serious question, have you talked to Canonical?
>
> I mean there's a hell of a lot of effort being expended here, but it
> seems to all be predicated on the assumption that Ubuntu's LTS
> HWE/backport policy is totally immutable, and that we might need to
> make the kernel do backflips to work around that. But ... is it? Has
> anyone actually asked them how they feel about this?
>
> I mean, my answer to the first email is 'no, absolutely not' from the
> technical perspective (the initial proposal totally breaks current and
> future userspace), from a design perspective (it breaks a lot of
> usecases which aren't single-vendor GPU+display+codec, or aren't just
> a simple desktop), and from a sustainability perspective (cutting
> Android adrift again isn't acceptable collateral damage to make it
> easier to backport things to last year's Ubuntu release).
>
> But then again, I don't even know what I'm NAKing here ... ? The
> original email just lists a proposal to break a ton of things, with
> proposed replacements which aren't technically viable, and it's not
> clear why? Can we please have some more details and some reasoning
> behind them?
>
> I don't mind that userspace (compositor, protocols, clients like Mesa
> as well as codec APIs) need to do a lot of work to support the new
> model. I do really care though that the hard-binary-switch model works
> fine enough for AMD but totally breaks heterogeneous systems and makes
> it impossible for userspace to do the right thing.
>
> Cheers,
> Daniel
>

--0000000000006a093905c3c52cda
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Yes, we can&#39;t break anything because we don&#39;t=
 want to complicate things for us. It&#39;s pretty much all NAK&#39;d alrea=
dy. We are trying to gather more knowledge and then make better decisions.<=
/div><div><br></div><div>The idea we are considering is that we&#39;ll expo=
se memory-based sync objects to userspace for read only, and the kernel or =
hw will strictly control the memory writes to those sync objects. The hole =
in that idea is that userspace can decide not to signal a job, so even if u=
serspace can&#39;t overwrite memory-based sync object states arbitrarily, i=
t can still decide not to signal them, and then a future fence is born.</di=
v><div><br></div><div>Marek<br></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 2, 2021 at 4:57 AM Daniel =
Stone &lt;<a href=3D"mailto:daniel@fooishbar.org">daniel@fooishbar.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Ch=
ristian,<br>
<br>
On Tue, 1 Jun 2021 at 13:51, Christian K=C3=B6nig<br>
&lt;<a href=3D"mailto:ckoenig.leichtzumerken@gmail.com" target=3D"_blank">c=
koenig.leichtzumerken@gmail.com</a>&gt; wrote:<br>
&gt; Am 01.06.21 um 14:30 schrieb Daniel Vetter:<br>
&gt; &gt; If you want to enable this use-case with driver magic and without=
 the<br>
&gt; &gt; compositor being aware of what&#39;s going on, the solution is EG=
LStreams.<br>
&gt; &gt; Not sure we want to go there, but it&#39;s definitely a lot more =
feasible<br>
&gt; &gt; than trying to stuff eglstreams semantics into dma-buf implicit<b=
r>
&gt; &gt; fencing support in a desperate attempt to not change compositors.=
<br>
&gt;<br>
&gt; Well not changing compositors is certainly not something I would try<b=
r>
&gt; with this use case.<br>
&gt;<br>
&gt; Not changing compositors is more like ok we have Ubuntu 20.04 and need=
<br>
&gt; to support that we the newest hardware generation.<br>
<br>
Serious question, have you talked to Canonical?<br>
<br>
I mean there&#39;s a hell of a lot of effort being expended here, but it<br=
>
seems to all be predicated on the assumption that Ubuntu&#39;s LTS<br>
HWE/backport policy is totally immutable, and that we might need to<br>
make the kernel do backflips to work around that. But ... is it? Has<br>
anyone actually asked them how they feel about this?<br>
<br>
I mean, my answer to the first email is &#39;no, absolutely not&#39; from t=
he<br>
technical perspective (the initial proposal totally breaks current and<br>
future userspace), from a design perspective (it breaks a lot of<br>
usecases which aren&#39;t single-vendor GPU+display+codec, or aren&#39;t ju=
st<br>
a simple desktop), and from a sustainability perspective (cutting<br>
Android adrift again isn&#39;t acceptable collateral damage to make it<br>
easier to backport things to last year&#39;s Ubuntu release).<br>
<br>
But then again, I don&#39;t even know what I&#39;m NAKing here ... ? The<br=
>
original email just lists a proposal to break a ton of things, with<br>
proposed replacements which aren&#39;t technically viable, and it&#39;s not=
<br>
clear why? Can we please have some more details and some reasoning<br>
behind them?<br>
<br>
I don&#39;t mind that userspace (compositor, protocols, clients like Mesa<b=
r>
as well as codec APIs) need to do a lot of work to support the new<br>
model. I do really care though that the hard-binary-switch model works<br>
fine enough for AMD but totally breaks heterogeneous systems and makes<br>
it impossible for userspace to do the right thing.<br>
<br>
Cheers,<br>
Daniel<br>
</blockquote></div>

--0000000000006a093905c3c52cda--
