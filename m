Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF81AB08FD5
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 16:49:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526DA10E839;
	Thu, 17 Jul 2025 14:49:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gfxstrand-net.20230601.gappssmtp.com header.i=@gfxstrand-net.20230601.gappssmtp.com header.b="NJCFt6J7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5140E10E3D9
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 14:49:38 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-311bd8ce7e4so969555a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 07:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20230601.gappssmtp.com; s=20230601; t=1752763778; x=1753368578;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=G/E4JkNnaNqQGz9MVNULZRq8nS9gNhNAwwmL24sE1XY=;
 b=NJCFt6J7BrCJ0vyXT8aiiQo5ap1tmKAt/55haFgdA4h/Zjr7iNMBIqILPsCMLL1snf
 j8Dwpc8QmCPL4uB5brLVocB4vWJxe1Z8kIlurXxKx3TbEUMXrUkTqmPJJynD1jOuTfLM
 Ixt0e6dA40cLu7sveAjhYGcAoZlA41v1SAwQ1TYuOPCSeYeaRayB1haeKm3OlfijTZqq
 ZJIur52CwoltOXt6nEEo8FdYq1+3CwouCVkB/p1FNb5HMv7QsWY8AxfjSuydjI8d+0wR
 FX6HL2Zk4pdvcjsqxghxfYH+0YFQ7QtEjKk9g2Tz114E5ZJN2Wz6bW957y7KWnWb5CXa
 hifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752763778; x=1753368578;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G/E4JkNnaNqQGz9MVNULZRq8nS9gNhNAwwmL24sE1XY=;
 b=QRU8AIAVLVVZqNyZ9f5cnKVUuaDb7Ke/V0t5YvVuwMo/DD0M2su7BMfdAVjeibCzKZ
 7S7sMAthPAFtZYsa1+45Lufre6ik6/J3YsKObbWvMhpKPH1adZPUyvIf9VdeZbvQ8g0O
 XYcrtRbryY8zyS5lk5dytBlpqeTqHpVTeMZUknDkekaV8rHZwf/a6ER37+SMAd0AjYYQ
 l8WgC15TPZJu7nTdz+4BAXkZGzg5aEDSwO96kWlYfAvW9YcfbkODJ5qMAnb+D21QXx22
 r77wYfWcvkZJXDE18WoaF9dmWKaa0z2VOWCkDlr4BNbRu3KoZ618V+84rsY2pofZBrrz
 FNQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmpHIFOS6ixHKSNZR47sa8XxZR2F6KyuenpbyuvYxasrgOlbv4Sd0p+5lzKmXTXW7Bi9UcEG48Cu8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxx83hLrFoyXTvfrOr1UX56ANVRMeTWutMq+ZVRoQ/zk3Jd+hzQ
 nlAX7v2/NuGnnh8E5HE8ah6wX8gx5VCtNLpGkBQphadN25BNYDRoH1tVFK0pUrKcRpyK2283VaS
 JXHWnAYlzOYDQ5Nts0Y+fq71pY1gjt/qoQomUJ4wj6Q==
X-Gm-Gg: ASbGncs9LjlCaElaUd1lq4dq2qbtjks/gCRU8S97AuPFWvADQ7d7jp8gZQJay3Szx4f
 RcdjC660WJGzAWWUFgtyPIvdUgrd0ofwzY95me29ubMH39IS9JMrusPGLIgAT5EDuO/hxSko7Ka
 IfISEOgt1IG3gh2zUXoMHMIH8qD5J4mIE9RUBaclozeTTS+Ua6s4Q2hOKkXAJr+PIiHVCF3IRUT
 UHcPso=
X-Google-Smtp-Source: AGHT+IEwlIggUK9P4ZMIZrOUQNAuckqnYEdZ47o2EEEluvGu7UoaWDsAzOxrsI3ippc7c4ZFNG0/XYMirWbeN4OKivg=
X-Received: by 2002:a17:90b:134e:b0:311:df4b:4b93 with SMTP id
 98e67ed59e1d1-31c9e6e4061mr10547752a91.7.1752763777637; Thu, 17 Jul 2025
 07:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250703223658.1457-1-jajones@nvidia.com>
 <CAOFGe94OaQ0raM_c-AHsmmNE8WkdMVqvpTDdPaCEJ9d4Xy1uOA@mail.gmail.com>
 <9f6a1410-83f6-4a25-94a1-ae614897cc1f@nvidia.com>
In-Reply-To: <9f6a1410-83f6-4a25-94a1-ae614897cc1f@nvidia.com>
From: Faith Ekstrand <faith@gfxstrand.net>
Date: Thu, 17 Jul 2025 10:49:26 -0400
X-Gm-Features: Ac12FXxOAMvVzwNI0NSX3WQWjrFvclZeGpAR6Pflgy4NI06xhZww35YkJr0ywAU
Message-ID: <CAOFGe95k-9U7v8eQ8bjSRt1RZ6Tg3WWDLOwJniXX3ViYCFGdDQ@mail.gmail.com>
Subject: Re: [RFC 0/4] Add Format Modifiers for NVIDIA Blackwell chipsets
To: James Jones <jajones@nvidia.com>
Cc: David Airlie <airlied@gmail.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, 
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>
Content-Type: multipart/alternative; boundary="000000000000577424063a211eb9"
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

--000000000000577424063a211eb9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2025 at 6:36=E2=80=AFPM James Jones <jajones@nvidia.com> wr=
ote:

> On 7/4/25 07:45, Faith Ekstrand wrote:
> > On Thu, Jul 3, 2025 at 6:34=E2=80=AFPM James Jones <jajones@nvidia.com
> > <mailto:jajones@nvidia.com>> wrote:
> >
> >     The layout of bits within the individual tiles (referred to as
> >     sectors in the DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() macro)
> >     changed for some formats starting in Blackwell 2 GPUs. New format
> >     modifiers are needed to denote the difference and prevent direct
> >     sharing of these incompatible buffers with older GPUs.
> >
> >     This patch series proposes first adding some helper macros and
> >     inline functions to drm_fourcc.h to make the NVIDIA block-linear
> >     format modifiers easier to work with given the proposed solution
> >     makes them harder to parse, then extending the existing sector type
> >     field in the parametric format modifier macro
> >     DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() by another bit to
> >     accommodate the new layout type.
> >
> >     There are a few ways the parameteric format modifier definition
> >     could have been altered to handle the new layouts:
> >
> >     -The GOB Height and Page Kind field has a reserved value that could
> >       have been used. However, the GOB height and page kind enums did
> >       not change relative to prior chips, so this is sort of a lie.
> >       However, this is the least-invasive change.
> >
> >     -An entirely new field could have been added. This seems
> >       inappropriate given the presence of an existing appropriate field=
.
> >       The advantage here is it avoids splitting the sector layout field
> >       across two bitfields.
> >
> >     The proposed approach is the logically consistent one, but has the
> >     downside of being the most complex, and that it causes the
> >     DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() macro to evaluate its
> >     's' parameter twice. However, I believe the added helper functions
> >     and macros address the complexity, and I have audited the relevant
> >     code and do not believe the double evaluation should cause any
> >     problems in practice.
> >
> >
> > I think we'll converge pretty quickly on the last patch. I'm less sure
> > about the first 3. While I like the idea of having static inlines for
> > modifiers that are shared by everybody, we can't actually use them from
> > NVK because our image layout code is in rust and bindgen can't generate
> > bindings for inlines so we're going to end up re-typing that all anyway=
.
>
> (Sorry for the long delay. Back from a series of vacations now)
>
> Oh, that's too bad. Is there some better way to express this that can be
> consumed by Rust or a Rust generator script? Maybe just some defines for
> the bitfield offsets and sizes? I'm not sure how to clearly encapsulate
> the split sector field that way though. It might be useful in the
> Nouveau kernel code below, but would probably have the same problem
> moving to Nova. Might just have to type that part N times in each client
> codebase. I'll give it some more thought.
>

#defines usually work as long as clang can evaluate them to constants. It
just can't handle macros with parameters. And sometimes macros that are
cnstants but are defined in terms of macros with parameters fall over. An
enum will definitely work 100%.


> The main purpose of including all the inlines before the actual format
> modifier update was to illustrate that although a split bitfield can
> sound nasty (Or did to me initially anyway), it can be encapsulated well
> enough to make it a non-issue. I'm not wedded to the actual
> implementation of the helper code. If we're in general agreement on the
> modifier layout, I'll send that out stand-alone and we can iterate on
> the helpers as needed given they're much less urgent.
>

Yeah, I get that. I'm not scared of a split bitfield, though, so no need to
demonstrate anything to me. =F0=9F=98=89

And, yeah, I'm a fan of getting the definition out there sooner rather than
later. Mesa 25.2is shipping in a few weeks with Blackwell support and I
would really like to have modifiers for 565 and 4444.

~Faith



> > Also, I'm not seeing a patch to fix KMS to advertise the correct
> > modifiers. Were you planning to type that or should I ask Lyude or Ben?
>
> This was just an RFC, so I didn't want to type everything out given it'd
> take a lot more time to test it (I lightly tested the RFC patches with
> some hacky one-off test code). I'll take a look at what's needed in
> Nouveau to advertise the right display modifiers and see whether it's
> something I can realistically sign up to do.
>
> Thanks,
> -James
>
> > ~Faith
> >
> >     James Jones (4):
> >        drm: macros defining fields of NVIDIA modifiers
> >        drm: add inline helper funcs for NVIDIA modifiers
> >        drm/nouveau: use format modifier helper funcs
> >        drm: define NVIDIA DRM format modifiers for GB20x
> >
> >       drivers/gpu/drm/nouveau/nouveau_display.c |  12 ++-
> >       include/uapi/drm/drm_fourcc.h             | 100
> ++++++++++++++++++----
> >       2 files changed, 92 insertions(+), 20 deletions(-)
> >
> >     --
> >     2.49.0
> >
>
>

--000000000000577424063a211eb9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Jul 16, 2025 at 6:36=E2=80=AFPM James=
 Jones &lt;<a href=3D"mailto:jajones@nvidia.com">jajones@nvidia.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 7/4/2=
5 07:45, Faith Ekstrand wrote:<br>
&gt; On Thu, Jul 3, 2025 at 6:34=E2=80=AFPM James Jones &lt;<a href=3D"mail=
to:jajones@nvidia.com" target=3D"_blank">jajones@nvidia.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:jajones@nvidia.com" target=3D"_blank">jaj=
ones@nvidia.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The layout of bits within the individual tiles (ref=
erred to as<br>
&gt;=C2=A0 =C2=A0 =C2=A0sectors in the DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2=
D() macro)<br>
&gt;=C2=A0 =C2=A0 =C2=A0changed for some formats starting in Blackwell 2 GP=
Us. New format<br>
&gt;=C2=A0 =C2=A0 =C2=A0modifiers are needed to denote the difference and p=
revent direct<br>
&gt;=C2=A0 =C2=A0 =C2=A0sharing of these incompatible buffers with older GP=
Us.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0This patch series proposes first adding some helper=
 macros and<br>
&gt;=C2=A0 =C2=A0 =C2=A0inline functions to drm_fourcc.h to make the NVIDIA=
 block-linear<br>
&gt;=C2=A0 =C2=A0 =C2=A0format modifiers easier to work with given the prop=
osed solution<br>
&gt;=C2=A0 =C2=A0 =C2=A0makes them harder to parse, then extending the exis=
ting sector type<br>
&gt;=C2=A0 =C2=A0 =C2=A0field in the parametric format modifier macro<br>
&gt;=C2=A0 =C2=A0 =C2=A0DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() by another =
bit to<br>
&gt;=C2=A0 =C2=A0 =C2=A0accommodate the new layout type.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0There are a few ways the parameteric format modifie=
r definition<br>
&gt;=C2=A0 =C2=A0 =C2=A0could have been altered to handle the new layouts:<=
br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-The GOB Height and Page Kind field has a reserved =
value that could<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0have been used. However, the GOB height and =
page kind enums did<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0not change relative to prior chips, so this =
is sort of a lie.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0However, this is the least-invasive change.<=
br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-An entirely new field could have been added. This =
seems<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0inappropriate given the presence of an exist=
ing appropriate field.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0The advantage here is it avoids splitting th=
e sector layout field<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0across two bitfields.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The proposed approach is the logically consistent o=
ne, but has the<br>
&gt;=C2=A0 =C2=A0 =C2=A0downside of being the most complex, and that it cau=
ses the<br>
&gt;=C2=A0 =C2=A0 =C2=A0DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() macro to ev=
aluate its<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;s&#39; parameter twice. However, I believe the=
 added helper functions<br>
&gt;=C2=A0 =C2=A0 =C2=A0and macros address the complexity, and I have audit=
ed the relevant<br>
&gt;=C2=A0 =C2=A0 =C2=A0code and do not believe the double evaluation shoul=
d cause any<br>
&gt;=C2=A0 =C2=A0 =C2=A0problems in practice.<br>
&gt; <br>
&gt; <br>
&gt; I think we&#39;ll converge pretty quickly on the last patch. I&#39;m l=
ess sure <br>
&gt; about the first 3. While I like the idea of having static inlines for =
<br>
&gt; modifiers that are shared by everybody, we can&#39;t actually use them=
 from <br>
&gt; NVK because our image layout code is in rust and bindgen can&#39;t gen=
erate <br>
&gt; bindings for inlines so we&#39;re going to end up re-typing that all a=
nyway.<br>
<br>
(Sorry for the long delay. Back from a series of vacations now)<br>
<br>
Oh, that&#39;s too bad. Is there some better way to express this that can b=
e <br>
consumed by Rust or a Rust generator script? Maybe just some defines for <b=
r>
the bitfield offsets and sizes? I&#39;m not sure how to clearly encapsulate=
 <br>
the split sector field that way though. It might be useful in the <br>
Nouveau kernel code below, but would probably have the same problem <br>
moving to Nova. Might just have to type that part N times in each client <b=
r>
codebase. I&#39;ll give it some more thought.<br></blockquote><div><br></di=
v><div>#defines usually work as long as clang can evaluate them to constant=
s. It just=C2=A0can&#39;t handle macros with parameters. And sometimes macr=
os that are cnstants but are defined in terms of macros with parameters fal=
l over. An enum will definitely work 100%.</div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
The main purpose of including all the inlines before the actual format <br>
modifier update was to illustrate that although a split bitfield can <br>
sound nasty (Or did to me initially anyway), it can be encapsulated well <b=
r>
enough to make it a non-issue. I&#39;m not wedded to the actual <br>
implementation of the helper code. If we&#39;re in general agreement on the=
 <br>
modifier layout, I&#39;ll send that out stand-alone and we can iterate on <=
br>
the helpers as needed given they&#39;re much less urgent.<br></blockquote><=
div><br></div><div>Yeah, I get that. I&#39;m not scared of a split bitfield=
, though, so no need to demonstrate anything to me.=C2=A0=F0=9F=98=89</div>=
<div><br></div><div>And, yeah, I&#39;m a fan of getting the definition out =
there sooner rather than later. Mesa 25.2is shipping in a few weeks with Bl=
ackwell support and I would really like to have modifiers for 565 and 4444.=
</div><div><br></div><div>~Faith</div><div><br></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
&gt; Also, I&#39;m not seeing a patch to fix KMS to advertise the correct <=
br>
&gt; modifiers. Were you planning to type that or should I ask Lyude or Ben=
?<br>
<br>
This was just an RFC, so I didn&#39;t want to type everything out given it&=
#39;d <br>
take a lot more time to test it (I lightly tested the RFC patches with <br>
some hacky one-off test code). I&#39;ll take a look at what&#39;s needed in=
 <br>
Nouveau to advertise the right display modifiers and see whether it&#39;s <=
br>
something I can realistically sign up to do.<br>
<br>
Thanks,<br>
-James<br>
<br>
&gt; ~Faith<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0James Jones (4):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm: macros defining fields of NVIDIA modif=
iers<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm: add inline helper funcs for NVIDIA mod=
ifiers<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm/nouveau: use format modifier helper fun=
cs<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm: define NVIDIA DRM format modifiers for=
 GB20x<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0drivers/gpu/drm/nouveau/nouveau_display.c |=
=C2=A0 12 ++-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0include/uapi/drm/drm_fourcc.h=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 100 ++++++++++++++++++----<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A02 files changed, 92 insertions(+), 20 deleti=
ons(-)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A02.49.0<br>
&gt; <br>
<br>
</blockquote></div></div>

--000000000000577424063a211eb9--
