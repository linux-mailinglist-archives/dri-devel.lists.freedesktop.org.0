Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C41979F8900
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 01:33:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 128C010E4D6;
	Fri, 20 Dec 2024 00:33:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SNVnTKR3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EAFB10E4D6;
 Fri, 20 Dec 2024 00:33:45 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5d3ea2a5a9fso205059a12.2; 
 Thu, 19 Dec 2024 16:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734654824; x=1735259624; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qn+CoENf8FKcczfWcnL2uzS1/O4SDGddoHtu0UUGbq4=;
 b=SNVnTKR3LjJ+4ChWyLuGs2hngbZSfomYrJ2pcOqgVHBtiXZ6hbOnkeH6l6YjQkqBNM
 /ymgtDN/wTSGy8jSVeDoYAP4ah+m3808sSpJWXtJr9MW9Rvz+nc0oo/PoE3NHpFC9nZP
 ffm/E8qYZW+xCmTkqcEXcYUQ97bAXic66fG/XVve0mC9w8VhK5ZB2X7rVdI1RASw6bZt
 glikyXUMEKYV0RPeH+zy9vogGtm8es/eIaGNynByHFe5a4SD8fFrPHkNIDd7bmNIXbIk
 bk7zMKqWd/hkyiUjAQ55ORL99Vojn7H70F5iCXzOYLIERapfx7uFoIBMZCFAzqdeXBsk
 9Oew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734654824; x=1735259624;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qn+CoENf8FKcczfWcnL2uzS1/O4SDGddoHtu0UUGbq4=;
 b=cinar1WKlcmsB3jIwS5XOiahgEt+Qg7d31dgtAWSP24udGMoih4gE55uBJHTIZhEoo
 Hhnx7HGdQp9xk3UbRAGncAmh2Ou7eNrjyeVPg2kvghsmBkHtLOWw6RzvCh2bsgHXdkH4
 euN5kiHPsen8EppJiMHEhEHHBWVRv15TfbRJUMtVzqXrLOicpMDmYfBf2+wYUg0/WnuJ
 QC9wX2yfCpebI3svOkd4QKIErxeGpvmPhVgTSZhrnwhIk40CNEfnjAI4TcZHHkynuayM
 PsfbLOO472OYPLcpxoQ1NJe6ZQleZPYczkxRSsSmIa6w8KERJ9HHhS1ufZqpfz0nb3N1
 pyPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxpwJi2UIaAJUChRiU2YtsoeNwOL4xHXqs7euahtBPu0Evkc4hScUzfrFDKXLA7ztjJgRE6QsECOY=@lists.freedesktop.org,
 AJvYcCVcYVVs1WZ3wsuQO8jcfAGGiNjB0H78eKPewkz4aGDcqVURs52sP9QxLjX/5oKRM3u6gPJRNum/@lists.freedesktop.org,
 AJvYcCWiboD3FxaNoAtDx1qsbf7yz1yYR3+b6OR8I8rMd9IyhE0o3R2WQGy367Vp27U44uY94u5CCEaTb57S@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUOZDh2zbDZY15OULEe1eugXs46iRY/ZFAiW7MvzQ26bN9UZig
 QztxdswnasD1UW/8A2BZffpw4AK8IIxsyxLCrPoYmJ3doKi68NWoaiSDhT4kS5riRxX5eyYAwL4
 imvuraDB7skYrQgUw2l67NebQ84E=
X-Gm-Gg: ASbGncsTgv4liSgLDDy4Od/OrfAUgaaN98eXliHzVVZtnvKcdv4FrIuj0WRb9H76FOo
 FZzhP8mijvNVjt8AanY6tNKQpEcGC1gK8SzkIIg4m
X-Google-Smtp-Source: AGHT+IGquZggTk/gr0MrcE57NT85SUobRPJ7sN5GmySeA1UWZTydCSIskbotGcejOsPcUcueuLWOELl70I0NNZaUGy8=
X-Received: by 2002:a05:6402:5246:b0:5d2:d72a:7803 with SMTP id
 4fb4d7f45d1cf-5d81dd83c73mr279206a12.4.1734654823643; Thu, 19 Dec 2024
 16:33:43 -0800 (PST)
MIME-Version: 1.0
References: <CAAxE2A5BkF13bFt8_UnuiqPM8W-ZESgmKEjqqGfv=DGzSfJ7aQ@mail.gmail.com>
 <uffsfaps6a75zmkyshkwfxgybcslqrnfqqtjzekegdptvwpugc@2ndpcuxyfp3f>
 <c64cb9d8-5ea7-4644-93c8-04a97b758fa0@mailbox.org>
 <h26quuebhpxwkc3fl4vtfteoqyvingnddgxbnzptfnxfg6xgkd@kkkmeqwplomv>
 <8dae97c9-9286-451a-8122-b309eb21b2f4@mailbox.org>
 <Z2Ki-lQH4Fbch6RO@phenom.ffwll.local>
 <q45c43j5kwwvemec7mcs4kqzt54pa3nz3jlhkcky2v63s2vfie@him4q253uw4p>
 <CAAxE2A5+=QVAFXXCbe3qEgY-Mzb-5XW73CYdANEO+N_xA+ivaw@mail.gmail.com>
 <zfjnuz2pfg7j2g2zrbt5ryde223plzr4rdyk4f4ans5znicw3l@kbebotesmobf>
In-Reply-To: <zfjnuz2pfg7j2g2zrbt5ryde223plzr4rdyk4f4ans5znicw3l@kbebotesmobf>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Thu, 19 Dec 2024 19:33:07 -0500
Message-ID: <CAAxE2A6u4Ee=yBJHo9uKr0Be8Ta3MwSxvt79GcbF8D0R952_FQ@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
To: Brian Starkey <brian.starkey@arm.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, 
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>, nd@arm.com
Content-Type: multipart/alternative; boundary="0000000000009244860629a8cc55"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000009244860629a8cc55
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 5:32=E2=80=AFAM Brian Starkey <brian.starkey@arm.co=
m> wrote:

> On Wed, Dec 18, 2024 at 09:53:56PM +0000, Marek Ol=C5=A1=C3=A1k wrote:
> > On Wed, Dec 18, 2024 at 5:32=E2=80=AFAM Brian Starkey <brian.starkey@ar=
m.com>
> wrote:
> >
> > > On Wed, Dec 18, 2024 at 11:24:58AM +0000, Simona Vetter wrote:
> > > >
> > > > For that reason I think linear modifiers with explicit pitch/size
> > > > alignment constraints is a sound concept and fits into how modifier=
s
> work
> > > > overall.
> > > > -Sima
> > >
> > > Could we make it (more) clear that pitch alignment is a "special"
> > > constraint (in that it's really a description of the buffer layout),
> > > and that constraints in-general shouldn't be exposed via modifiers?
> > >
> >
> > Modifiers uniquely identify image layouts. That's why they exist and it=
's
> > their only purpose.
>
> Well you've quoted me saying "it's really a description of the buffer
> layout", but actually I'm still unconvinced that pitch alignment is a
> layout description rather than a constraint on an allocation.
>
> To me, the layout is described by the "pitch" field of the framebuffer
> object (and yes, modifiers are not only used for DRM framebuffers, but
> every API which passes around linear surfaces has a pitch/stride
> parameter of some sort).
>

The pitch doesn't always describe the layout. In practice, the pitch has no
effect on any tiled layouts (on AMD), and it also has no effect on linear
layouts if the pitch must be equal to a specifically rounded up width. In
that case, the only function of the pitch is to reject importing a DMABUF
if it's incorrect with respect to the width. In other cases, the pitch is a
parameter of the modifier (i.e. the pitch augments the layout, so the
layout is described by {modifier, width, height, bpp, pitch} instead of
just {modifier, width, height, bpp}).


>
> >
> > It doesn't matter how many modifiers we have. No app should ever parse
> the
> > modifier bits. All apps must treat modifiers as opaque numbers. Likewis=
e,
> > documentation of all modifiers in drm_fourcc.h is only meant for driver
> > developers. No developers of apps should ever use the documentation.
> There
> > can be a million modifiers and a million different devices, and the who=
le
> > system of modifiers would fall apart if every app developer had to lear=
n
> > all of them.
>
> My concern isn't with app developers, my concern is with drivers and
> their authors needing to expose ever larger and more complex sets of
> modifiers.
>
> There _is_ a problem with having a million modifiers. The opaque set
> intersection means that all authors from all vendors need to expose
> the correct sets. The harder that is to do, the less likely things are
> to work.
>

No, exposing the correct set is never required. You only expose your set,
and then also expose those modifiers where you need interop. Interop
between every pair of devices is generally unsupported (since LINEAR
between devices is practically unsupported).


>
> Look at GENERIC_16_16_TILE. We spotted that our layout was the same as
> something already defined under SAMSUNG. If there were a million
> modifiers, we wouldn't be able to spot that commonality, and you'd end
> up with disjoint sets even when you have layouts in common.
>

This is unrelated.


>
> For this specific case of pitch alignment it seems like the consensus
> is we should add a modifier, but I still strongly disagree that
> modifiers are the right place in-general for trying to describe device
> buffer usage constraints.
>
> I'm worried that adding these alignment constraints without any
> statement on future intention pushes us down the slippery slope, and
> it's *very* slippery.
>
> Up-thread you mentioned offset alignment. If we start putting that in
> modifiers then we have:
>
> * Pitch alignment
>   * Arbitrary, 1 byte
>   * At least 16 byte aligned, arbitrary padding (Arm needs this)
>   * Exactly the next 64 bytes (AMD?)
> * Offset alignment
>   * Arbitrary, 1 byte
>   * You mentioned 4096 bytes (AMD?)
>   * Arm needs 16, 8, 4 or 2 bytes, depending on format. Oh and it's
>     different for the chroma plane of planar YUV too, so it's more
>     like 16, 8, 4, 2, 2Y_1CbCr
>
> We would need a new modifier value for each *combination* of
> constraints, so 3 (pitch) * 7 (offset) gives 21 new LINEAR modifiers
> which need defining, and a device with no pitch/offset constraints
> needs to expose *all* of them to make sure it can interop with an
> Arm/AMD device.
>

No, it's not needed to expose all of them. Again, you just expose what you
need to interop with.

We know that the LINEAR modifier doesn't work with 1B pitch and offset
alignment pretty much everywhere. What are you going to do about it?

Perhaps the solution is what Intel has done to interop with AMD: Intel's
image allocator was changed to align the linear pitch to 256B. We can
demand that all drivers must align the pitch to 256B in their allocators
too. If they don't want to do it, they will likely be forced to do it by
their management, which is likely why Intel did it. Is that the future we
want? It's already happening.

Minimum alignment requirements (for AMD):
* Offset: 256B
* Pitch: 128B or 256B (only minimum or any multiple - different chips have
different limits)
* Slice size alignment: 256B
* Contiguous pages (not visible to uAPI since the kernel can reallocate to
enforce this constraint when needed)

Marek

--0000000000009244860629a8cc55
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Dec 19, 2024 at 5:32=E2=80=AFAM Brian=
 Starkey &lt;<a href=3D"mailto:brian.starkey@arm.com">brian.starkey@arm.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On Wed, Dec 18, 2024 at 09:53:56PM +0000, Marek Ol=C5=A1=C3=A1k wrote:<br>
&gt; On Wed, Dec 18, 2024 at 5:32=E2=80=AFAM Brian Starkey &lt;<a href=3D"m=
ailto:brian.starkey@arm.com" target=3D"_blank">brian.starkey@arm.com</a>&gt=
; wrote:<br>
&gt; <br>
&gt; &gt; On Wed, Dec 18, 2024 at 11:24:58AM +0000, Simona Vetter wrote:<br=
>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; For that reason I think linear modifiers with explicit pitch=
/size<br>
&gt; &gt; &gt; alignment constraints is a sound concept and fits into how m=
odifiers work<br>
&gt; &gt; &gt; overall.<br>
&gt; &gt; &gt; -Sima<br>
&gt; &gt;<br>
&gt; &gt; Could we make it (more) clear that pitch alignment is a &quot;spe=
cial&quot;<br>
&gt; &gt; constraint (in that it&#39;s really a description of the buffer l=
ayout),<br>
&gt; &gt; and that constraints in-general shouldn&#39;t be exposed via modi=
fiers?<br>
&gt; &gt;<br>
&gt; <br>
&gt; Modifiers uniquely identify image layouts. That&#39;s why they exist a=
nd it&#39;s<br>
&gt; their only purpose.<br>
<br>
Well you&#39;ve quoted me saying &quot;it&#39;s really a description of the=
 buffer<br>
layout&quot;, but actually I&#39;m still unconvinced that pitch alignment i=
s a<br>
layout description rather than a constraint on an allocation.<br>
<br>
To me, the layout is described by the &quot;pitch&quot; field of the frameb=
uffer<br>
object (and yes, modifiers are not only used for DRM framebuffers, but<br>
every API which passes around linear surfaces has a pitch/stride<br>
parameter of some sort).<br></blockquote><div><br></div><div>The pitch does=
n&#39;t always describe the layout. In practice, the pitch has no effect on=
 any tiled layouts (on AMD), and it also has no effect on linear layouts if=
 the pitch must be equal to a specifically rounded up width. In that case, =
the only function of the pitch is to reject importing a DMABUF if it&#39;s =
incorrect with respect to the width. In other cases, the pitch is a paramet=
er of the modifier (i.e. the pitch augments the layout, so the layout is de=
scribed by {modifier, width, height, bpp, pitch} instead of just {modifier,=
 width, height, bpp}).<br></div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
<br>
&gt; <br>
&gt; It doesn&#39;t matter how many modifiers we have. No app should ever p=
arse the<br>
&gt; modifier bits. All apps must treat modifiers as opaque numbers. Likewi=
se,<br>
&gt; documentation of all modifiers in drm_fourcc.h is only meant for drive=
r<br>
&gt; developers. No developers of apps should ever use the documentation. T=
here<br>
&gt; can be a million modifiers and a million different devices, and the wh=
ole<br>
&gt; system of modifiers would fall apart if every app developer had to lea=
rn<br>
&gt; all of them.<br>
<br>
My concern isn&#39;t with app developers, my concern is with drivers and<br=
>
their authors needing to expose ever larger and more complex sets of<br>
modifiers.<br>
<br>
There _is_ a problem with having a million modifiers. The opaque set<br>
intersection means that all authors from all vendors need to expose<br>
the correct sets. The harder that is to do, the less likely things are<br>
to work.<br></blockquote><div><br></div><div>No, exposing the correct set i=
s never required. You only expose your set, and then also expose those modi=
fiers where you need interop. Interop between every pair of devices is gene=
rally unsupported (since LINEAR between devices is practically unsupported)=
.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
Look at GENERIC_16_16_TILE. We spotted that our layout was the same as<br>
something already defined under SAMSUNG. If there were a million<br>
modifiers, we wouldn&#39;t be able to spot that commonality, and you&#39;d =
end<br>
up with disjoint sets even when you have layouts in common.<br></blockquote=
><div><br></div><div>This is unrelated.<br></div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
For this specific case of pitch alignment it seems like the consensus<br>
is we should add a modifier, but I still strongly disagree that<br>
modifiers are the right place in-general for trying to describe device<br>
buffer usage constraints.<br>
<br>
I&#39;m worried that adding these alignment constraints without any<br>
statement on future intention pushes us down the slippery slope, and<br>
it&#39;s *very* slippery.<br>
<br>
Up-thread you mentioned offset alignment. If we start putting that in<br>
modifiers then we have:<br>
<br>
* Pitch alignment<br>
=C2=A0 * Arbitrary, 1 byte<br>
=C2=A0 * At least 16 byte aligned, arbitrary padding (Arm needs this)<br>
=C2=A0 * Exactly the next 64 bytes (AMD?)<br>
* Offset alignment<br>
=C2=A0 * Arbitrary, 1 byte<br>
=C2=A0 * You mentioned 4096 bytes (AMD?)<br>
=C2=A0 * Arm needs 16, 8, 4 or 2 bytes, depending on format. Oh and it&#39;=
s<br>
=C2=A0 =C2=A0 different for the chroma plane of planar YUV too, so it&#39;s=
 more<br>
=C2=A0 =C2=A0 like 16, 8, 4, 2, 2Y_1CbCr<br>
<br>
We would need a new modifier value for each *combination* of<br>
constraints, so 3 (pitch) * 7 (offset) gives 21 new LINEAR modifiers<br>
which need defining, and a device with no pitch/offset constraints<br>
needs to expose *all* of them to make sure it can interop with an<br>
Arm/AMD device.<br></blockquote><div><br></div><div>No, it&#39;s not needed=
 to expose all of them. Again, you just expose what you need to interop wit=
h.<br></div><div><br></div><div></div><div>We know that the LINEAR modifier=
 doesn&#39;t work with 1B pitch and offset alignment pretty much everywhere=
. What are you going to do about it?<br></div><div><br></div><div>Perhaps t=
he solution is what Intel has done to interop with AMD: Intel&#39;s image a=
llocator was changed to align the linear pitch to 256B. We can demand that =
all drivers must align the pitch to 256B in their allocators too. If they d=
on&#39;t want to do it, they will likely be forced to do it by their manage=
ment, which is likely why Intel did it. Is that the future we want? It&#39;=
s already happening.<br></div><div><br></div><div>Minimum alignment require=
ments (for AMD):</div><div>* Offset: 256B</div><div>* Pitch: 128B or 256B (=
only minimum or any multiple - different chips have different limits)</div>=
<div>* Slice size alignment: 256B<br></div><div>* Contiguous pages (not vis=
ible to uAPI since the kernel can reallocate to enforce this constraint whe=
n needed)<br></div><div><br></div><div>Marek<br></div></div></div>

--0000000000009244860629a8cc55--
