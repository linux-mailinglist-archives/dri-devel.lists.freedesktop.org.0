Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E4B9FC3FE
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2024 08:35:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F8A10E0CD;
	Wed, 25 Dec 2024 07:35:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hn+57MVr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E580A10E0CD;
 Wed, 25 Dec 2024 07:35:09 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5d3be7f663cso892803a12.2; 
 Tue, 24 Dec 2024 23:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735112108; x=1735716908; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NozdPU9WE8gkOsgXIL/+e7JEcFhXpiOnm7JfEr4/eHw=;
 b=Hn+57MVrNUfffeB2tOhxMRL+3Drf1foy2aheaFlbh81iEGj1KHovYAalMZ+R4lOHng
 ZJmoKFi4XaA/pTTRIbGNX+qNqQuxRZp7Or0EaAYZVds648Nu5hFHlwoqnOhgDY0IiXGd
 8TNNF3PX3uX+jPWYigKeoJyPA2pBi12uHI3F6+nBG9ob0XzDWAX/i7qy+glOqyhdrb3t
 fm5QxWOE0gFlV5+NmThFDPBwpQvv23LSKWilcyELhG8QvfKo1A3LwwEvIviaZHm4pYw9
 Io+xL/z23t82a1zKjAbCe1aUdiLqYLpawmNhjdDSHl+3zbVftyqQrxoiiuFEdaitjPfa
 n8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735112108; x=1735716908;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NozdPU9WE8gkOsgXIL/+e7JEcFhXpiOnm7JfEr4/eHw=;
 b=hv4CZT7jtPyc71BVEEXbg6U/hqEXU1lGjH1OZDxaAiMas4t4qfTT9X1n1BqL3MeX2B
 0coBep2xkRCKCw2PSaM7+L48YayLiSzg/h3NRn0paK8ejHl5ZVJwr2QzM4elU2OumIn2
 39rNoDiuNEYoYth97/idZM1Tu1oadqkuWHUOdF0Yii2nI9HfUKHIfBANVzMF2+iu/I7E
 Grb4zlYndIVvEhv+UC7IhUAwr3Tw30n96xtnusI9MhOLuZidwA+sQBZJUdzwkT8ebB0k
 m2tl0xsBEM/AyhrJS7uQQJ3W19K6JDAFWZczbTt6VXMnk4unL1d83t3t9RW8f3jB3L0P
 d6Mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUw3yHfvb3WBBfZeyA94zLfmytqVpJDzprPppCOHQtZBLCHBFqiTQWxkspaTAjIjbXPWKMiWLOOdUs=@lists.freedesktop.org,
 AJvYcCVN+4enxIxi4797zoYVmvtoQktOLgHyNpLN5SQE1wk+K1LK/xqyeAAmHgUYuCa9NimDyssFdnwLeIkp@lists.freedesktop.org,
 AJvYcCWb+nAt3Wqg3c2yXj9PtEmbphZZ/+L0JgR3nYZn9B7Wp/Ejfe8LoZRNFeQXG17rZpv1dtNJwBhH@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZkiMVVh6CbSBsoGc2hW0WR9sjCKwpbk1SjfW13uCyjLuU16Ow
 cfcXCeP8SE4tjaZQr2/yrb1br2qIbVIr1e1U4NVBnUfTbqsEMcfi8IocGngFryWcSxP1+RkIary
 8eF6Ntz+vvSji3oXoG0wsJv2oNgk=
X-Gm-Gg: ASbGncvLMKFrXY560M3kFilP2OH1hHHD6MEaH7eDvaiH4mFYN8Q4BfGN4ABpECOpO/S
 LC4XScKot75rVizW++nmcXbdvEO+xnNOtOVYY8Zpm
X-Google-Smtp-Source: AGHT+IHf4Xy8P0wB8do/b9cOtwlZp6Q43FFMrx/bbGY7zQ52NCkGeFBg9K+d7evdZGbDi7Kc9RxrkowydFFp9ATe+98=
X-Received: by 2002:a05:6402:274e:b0:5d0:b7c5:c406 with SMTP id
 4fb4d7f45d1cf-5d81dd85ad9mr6582060a12.1.1735112108161; Tue, 24 Dec 2024
 23:35:08 -0800 (PST)
MIME-Version: 1.0
References: <CAAxE2A5BkF13bFt8_UnuiqPM8W-ZESgmKEjqqGfv=DGzSfJ7aQ@mail.gmail.com>
 <uffsfaps6a75zmkyshkwfxgybcslqrnfqqtjzekegdptvwpugc@2ndpcuxyfp3f>
 <c64cb9d8-5ea7-4644-93c8-04a97b758fa0@mailbox.org>
 <h26quuebhpxwkc3fl4vtfteoqyvingnddgxbnzptfnxfg6xgkd@kkkmeqwplomv>
 <8dae97c9-9286-451a-8122-b309eb21b2f4@mailbox.org>
 <Z2Ki-lQH4Fbch6RO@phenom.ffwll.local>
 <q45c43j5kwwvemec7mcs4kqzt54pa3nz3jlhkcky2v63s2vfie@him4q253uw4p>
 <CAPj87rMFJ0JRvsKqZUsw_EGrFWr1VLO4Ne2w_bZ5cH+gs_d=og@mail.gmail.com>
 <688f69c5-a7b7-46eb-89ef-379c3f5c7632@mailbox.org>
 <Z2WMOmPCYajdtAeN@phenom.ffwll.local>
In-Reply-To: <Z2WMOmPCYajdtAeN@phenom.ffwll.local>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Wed, 25 Dec 2024 02:34:31 -0500
Message-ID: <CAAxE2A5-u8KwBfxnhpX_Re9M-rt+=Bo8f0vdtJMhBaGjO7zRtg@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, 
 Daniel Stone <daniel@fooishbar.org>, Brian Starkey <brian.starkey@arm.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, 
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>, nd@arm.com
Content-Type: multipart/alternative; boundary="000000000000da5bca062a13447a"
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

--000000000000da5bca062a13447a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 20, 2024 at 10:24=E2=80=AFAM Simona Vetter <simona.vetter@ffwll=
.ch>
wrote:

> On Thu, Dec 19, 2024 at 05:09:33PM +0100, Michel D=C3=A4nzer wrote:
> > On 2024-12-19 10:02, Daniel Stone wrote:
> > >
> > > How this would be used in practice is also way too underdocumented. W=
e
> > > need to document that exact-round-up 64b is more restrictive than
> > > any-multiple-of 64b is more restrictive than 'classic' linear. We nee=
d
> > > to document what people should advertise - if we were starting from
> > > scratch, the clear answer would be that anything which doesn't care
> > > should advertise all three, anything advertising any-multiple-of
> > > should also advertise exact-round-up, etc.
> > >
> > > But we're not starting from scratch, and since linear is 'special',
> > > userspace already has explicit knowledge of it. So AMD is going to
> > > have to advertise LINEAR forever, because media frameworks know about
> > > DRM_FORMAT_MOD_LINEAR and pass that around explicitly when they know
> > > that the buffer is linear. That and not breaking older userspace
> > > running in containers or as part of a bisect or whatever.
> > >
> > > There's also the question of what e.g. gbm_bo_get_modifier() should
> > > return. Again, if we were starting from scratch, most restrictive
> > > would make sense. But we're not, so I think it has to return LINEAR
> > > for maximum compatibility (because modifiers can't be morphed into
> > > other ones for fun), which further cements that we're not removing
> > > LINEAR.
> > >
> > > And how should allocators determine what to go for? Given that, I
> > > think the only sensible semantics are, when only LINEAR has been
> > > passed, to pick the most restrictive set possible; when LINEAR
> > > variants have been passed as well as LINEAR, to act as if LINEAR were
> > > not passed at all.
> >
> > These are all very good points, which call for stricter-than-usual
> > application of the "new UAPI requires corresponding user-space patches"
> > rule:
> >
> > * Patches adding support for the new modifiers in Mesa (and kernel)
> > drivers for at least two separate vendors
>
> I think this is too strict? At least I could come up with other scenarios
> where we'd need a new linear variant:
> - one driver, but two different devices that happen to have incompatible
>   linear requirements which break and get fixed with the new linear mode.
> - one driver, one device, but non-driver userspace allocates the linear
>   buffer somewhere else (e.g. from dma-buf heaps) and gets pitch
>   constraints wrong
>
> > * Patches adding support in at least one non-Mesa user-space component,
> > e.g. a Wayland compositor which has code using the existing linear
> > modifier (e.g. mutter)
>
> This also feels a bit too strict, since I think what Daniel proposed is
> that drivers do the special LINEAR handling when there are variants
> present in the list of compatible modifiers for an alloation. Hence I
> don't think compositor patches are necessarily required, but we definitel=
y
> need to test to make sure it actually works and there's not surprises.
>
> The exception is of course when non-mesa userspace allocates/sizes the
> buffer itself (maybe for an soc where the display is separate and the gpu
> has stricter stride constraints than the display).
>
> > Ideally also describe a specific multi-vendor scenario which can't work
> > with the existing linear modifier, and validate that it works with the
> > new ones.
>
> I think that's really the crucial part, because adding modifiers without
> an actual use-case that they fix is just asking for more future trouble I
> think.
>

It won't always "work" with the new linear modifiers, but when it fails, it
will fail in a manner that is debuggable, understandable, and explainable
by non-driver developers, such as getting 0 common modifiers between 2
devices. For example, the GUI can report to a user that DRI_PRIME failed
because there are no common modifiers between the 2 devices, which is
better than failing with an unqueriable difficult-to-handle reason
(rejected pitch) or continuing with corruption (invalid pitch) or hangs
(invalid pitch causing buffer overrun and corrupting shader binaries next
to it).

Marek

--000000000000da5bca062a13447a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Dec 20, 2024 at 10:24=E2=80=AFAM Simo=
na Vetter &lt;<a href=3D"mailto:simona.vetter@ffwll.ch">simona.vetter@ffwll=
.ch</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On Thu, Dec 19, 2024 at 05:09:33PM +0100, Michel D=C3=A4nzer wrote:<br>
&gt; On 2024-12-19 10:02, Daniel Stone wrote:<br>
&gt; &gt; <br>
&gt; &gt; How this would be used in practice is also way too underdocumente=
d. We<br>
&gt; &gt; need to document that exact-round-up 64b is more restrictive than=
<br>
&gt; &gt; any-multiple-of 64b is more restrictive than &#39;classic&#39; li=
near. We need<br>
&gt; &gt; to document what people should advertise - if we were starting fr=
om<br>
&gt; &gt; scratch, the clear answer would be that anything which doesn&#39;=
t care<br>
&gt; &gt; should advertise all three, anything advertising any-multiple-of<=
br>
&gt; &gt; should also advertise exact-round-up, etc.<br>
&gt; &gt; <br>
&gt; &gt; But we&#39;re not starting from scratch, and since linear is &#39=
;special&#39;,<br>
&gt; &gt; userspace already has explicit knowledge of it. So AMD is going t=
o<br>
&gt; &gt; have to advertise LINEAR forever, because media frameworks know a=
bout<br>
&gt; &gt; DRM_FORMAT_MOD_LINEAR and pass that around explicitly when they k=
now<br>
&gt; &gt; that the buffer is linear. That and not breaking older userspace<=
br>
&gt; &gt; running in containers or as part of a bisect or whatever.<br>
&gt; &gt; <br>
&gt; &gt; There&#39;s also the question of what e.g. gbm_bo_get_modifier() =
should<br>
&gt; &gt; return. Again, if we were starting from scratch, most restrictive=
<br>
&gt; &gt; would make sense. But we&#39;re not, so I think it has to return =
LINEAR<br>
&gt; &gt; for maximum compatibility (because modifiers can&#39;t be morphed=
 into<br>
&gt; &gt; other ones for fun), which further cements that we&#39;re not rem=
oving<br>
&gt; &gt; LINEAR.<br>
&gt; &gt; <br>
&gt; &gt; And how should allocators determine what to go for? Given that, I=
<br>
&gt; &gt; think the only sensible semantics are, when only LINEAR has been<=
br>
&gt; &gt; passed, to pick the most restrictive set possible; when LINEAR<br=
>
&gt; &gt; variants have been passed as well as LINEAR, to act as if LINEAR =
were<br>
&gt; &gt; not passed at all.<br>
&gt; <br>
&gt; These are all very good points, which call for stricter-than-usual<br>
&gt; application of the &quot;new UAPI requires corresponding user-space pa=
tches&quot;<br>
&gt; rule:<br>
&gt; <br>
&gt; * Patches adding support for the new modifiers in Mesa (and kernel)<br=
>
&gt; drivers for at least two separate vendors<br>
<br>
I think this is too strict? At least I could come up with other scenarios<b=
r>
where we&#39;d need a new linear variant:<br>
- one driver, but two different devices that happen to have incompatible<br=
>
=C2=A0 linear requirements which break and get fixed with the new linear mo=
de.<br>
- one driver, one device, but non-driver userspace allocates the linear<br>
=C2=A0 buffer somewhere else (e.g. from dma-buf heaps) and gets pitch<br>
=C2=A0 constraints wrong<br>
<br>
&gt; * Patches adding support in at least one non-Mesa user-space component=
,<br>
&gt; e.g. a Wayland compositor which has code using the existing linear<br>
&gt; modifier (e.g. mutter)<br>
<br>
This also feels a bit too strict, since I think what Daniel proposed is<br>
that drivers do the special LINEAR handling when there are variants<br>
present in the list of compatible modifiers for an alloation. Hence I<br>
don&#39;t think compositor patches are necessarily required, but we definit=
ely<br>
need to test to make sure it actually works and there&#39;s not surprises.<=
br>
<br>
The exception is of course when non-mesa userspace allocates/sizes the<br>
buffer itself (maybe for an soc where the display is separate and the gpu<b=
r>
has stricter stride constraints than the display).<br>
<br>
&gt; Ideally also describe a specific multi-vendor scenario which can&#39;t=
 work<br>
&gt; with the existing linear modifier, and validate that it works with the=
<br>
&gt; new ones.<br>
<br>
I think that&#39;s really the crucial part, because adding modifiers withou=
t<br>
an actual use-case that they fix is just asking for more future trouble I<b=
r>
think.<br></blockquote><div><br></div>It won&#39;t always &quot;work&quot; =
with the new linear modifiers, but when it fails, it will fail in a manner =
that is debuggable, understandable, and explainable by non-driver developer=
s, such as getting 0 common modifiers between 2 devices. For example, the G=
UI can report to a user that DRI_PRIME failed because there are no common m=
odifiers between the 2 devices, which is better than failing with an=C2=A0u=
nqueriable difficult-to-handle reason (rejected pitch) or continuing with c=
orruption (invalid pitch) or hangs (invalid pitch causing buffer overrun an=
d corrupting shader binaries next to it).<br></div><div class=3D"gmail_quot=
e gmail_quote_container"><br></div><div class=3D"gmail_quote gmail_quote_co=
ntainer">Marek<br></div></div>

--000000000000da5bca062a13447a--
