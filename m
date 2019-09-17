Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CB7B58B6
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 01:42:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C6A6ED9D;
	Tue, 17 Sep 2019 23:42:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53ADB6ED99;
 Tue, 17 Sep 2019 23:42:12 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id h144so11796415iof.7;
 Tue, 17 Sep 2019 16:42:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gko5zg5Puy5frJZZqCEh6qNYIo1Im43JBRJ0KLifRBA=;
 b=MBCwRpHVbH+6wsST2i8elIWRS0pLZjF12nZ2t9OJL+bt2acFM2cMa6WhwrhS7RCzon
 ogrnMkk1teHX3Ln2THLDEcqZhkzcd9z/V6qwm6vJ7RvUxatTROSjtWaRPpzF7paqlTz+
 po+0idaOx4i1NFrixOhss3VyhTpzhJP92Q4ujGzmos0UIrfyaqAeJKk/nEhBscAHrubk
 hoem0iGMfKH/eh9DXixO7a7nH22UMC4HSyd70DZzLFfGpovdN3O3TvMOrcM4UknNE3Jt
 j5BHAAJZn2V0IYSXagqMph/mtYLtINxBzwAfW8E27jghOmn7LPaaamzamLfL+4tC8vb1
 88IA==
X-Gm-Message-State: APjAAAUtdSSBwpq3sfTi4owqEJZIqe/0rTAGkIZUxHjkfCZ0uJXnZaY6
 00pA5oZ5O2JBltK3SdRDVDtp5OQS6b5jPitH1wg=
X-Google-Smtp-Source: APXvYqxlAO5Iaw4N+9NK1gVxpjT4z3QVFqvBTMQoCZbYBKCK6yyUIRftKT81zG8Fg1xXiXOYlWuWtjUDKtW9EdkuOhc=
X-Received: by 2002:a5d:9dd7:: with SMTP id 23mr1792466ioo.182.1568763731397; 
 Tue, 17 Sep 2019 16:42:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190903214040.2386-1-sonny.jiang@amd.com>
 <CAAxE2A45N4gMYrcETDpznGKyxLztuwenFasL19a81QQmBkYiww@mail.gmail.com>
 <CAF6AEGvvUUOGujJC9P3t72N93AJuxiiVt0OAk8zf226Q8WmHvg@mail.gmail.com>
 <CAKMK7uHFNhdNY4Y9ZFMNuci7gssPWCT5f5y=e4npg8s5r_jBdQ@mail.gmail.com>
 <CAAxE2A6sESsKAi3K1etAZeCwAPgexn099G6g0aJQnavTkiH+mA@mail.gmail.com>
 <87woe7eanv.fsf@intel.com> <03d31464-3968-6923-5323-f63060d70f1f@gmail.com>
 <CAKMK7uEj4FZ3YQqG-cCTa4EEaJoAk09Zaz398F9Hmo+mdXCKiw@mail.gmail.com>
 <7540df63-e623-19b0-dde5-b89ff2b7fb89@amd.com>
 <7535dcf4-413f-f06f-b3d1-dcffc86b43e0@daenzer.net>
 <5d0a8619-7073-fac2-cdd6-83b55221140b@daenzer.net>
 <b61ec704-894d-092a-253c-961ff2ea01a2@gmail.com>
 <4d255e1c-1d4a-a754-afe0-b18776a11a7e@daenzer.net>
In-Reply-To: <4d255e1c-1d4a-a754-afe0-b18776a11a7e@daenzer.net>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Tue, 17 Sep 2019 19:41:35 -0400
Message-ID: <CAAxE2A7RcsiEsWBtbsDE2Wp+Vx7n-vwM1qL6HX_qKt=KnHCd4g@mail.gmail.com>
Subject: Re: [PATCH] drm: add drm device name
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=gko5zg5Puy5frJZZqCEh6qNYIo1Im43JBRJ0KLifRBA=;
 b=FIs4sNIqzhNse19hxiVuc69cRjSke15hHdirqgJw0hLGQHGLQd3BUt3AAgNP52CShW
 WtEkmKXAJlNSOC78SZVkTFwYstexR87lXiE8YsoovYdOOTgfLLCDRYoAIraXzMfObFH8
 XDCajqekYj06WHZelPK1aE05dS+4Sl/u7BB+NGHIYxIE13Lztj5jEeiGBC9uDAFE2ZdG
 3l2ewX5jLCq3W9oRAViVgUgkY9Tn/t3d024K37Pz7QHGWo06FPTUI60PMSijzfDuBglb
 UY5/VnWvVydSt5Iekf8EnuAuAzrSItUHDLWvAShSOWIBGExyawsPy+JJ/cAnu2QPjXvW
 65Gw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "Jiang, Sonny" <Sonny.Jiang@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============1067764005=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1067764005==
Content-Type: multipart/alternative; boundary="000000000000f250aa0592c844fa"

--000000000000f250aa0592c844fa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

drmVersion::name =3D amdgpu, radeon, intel, etc.
drmVersion::desc =3D vega10, vega12, vega20, ...

The common Mesa code will use name and desc to select the driver.

The AMD-specific Mesa code will use desc to identify the chip.

Mesa won't receive any PCI IDs for future chips.

Marek


On Tue, Sep 17, 2019 at 10:33 AM Michel D=C3=A4nzer <michel@daenzer.net> wr=
ote:

> On 2019-09-17 1:20 p.m., Christian K=C3=B6nig wrote:
> > Am 17.09.19 um 11:27 schrieb Michel D=C3=A4nzer:
> >> On 2019-09-17 11:23 a.m., Michel D=C3=A4nzer wrote:
> >>> On 2019-09-17 10:23 a.m., Koenig, Christian wrote:
> >>>> Am 17.09.19 um 10:17 schrieb Daniel Vetter:
> >>>>> On Tue, Sep 17, 2019 at 10:12 AM Christian K=C3=B6nig
> >>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
> >>>>>> Am 17.09.19 um 07:47 schrieb Jani Nikula:
> >>>>>>> On Mon, 16 Sep 2019, Marek Ol=C5=A1=C3=A1k <maraeo@gmail.com> wro=
te:
> >>>>>>>> The purpose is to get rid of all PCI ID tables for all drivers i=
n
> >>>>>>>> userspace. (or at least stop updating them)
> >>>>>>>>
> >>>>>>>> Mesa common code and modesetting will use this.
> >>>>>>> I'd think this would warrant a high level description of what you
> >>>>>>> want
> >>>>>>> to achieve in the commit message.
> >>>>>> And maybe explicitly call it uapi_name or even uapi_driver_name.
> >>>>> If it's uapi_name, then why do we need a new one for every
> generation?
> >>>>> Userspace drivers tend to span a lot more than just 1 generation. A=
nd
> >>>>> if you want to have per-generation data from the kernel to userspac=
e,
> >>>>> then imo that's much better suited in some amdgpu ioctl, instead of
> >>>>> trying to encode that into the driver name.
> >>>> Well we already have an IOCTL for that, but I thought the intention
> >>>> here
> >>>> was to get rid of the PCI-ID tables in userspace to figure out which
> >>>> driver to load.
> >>> That's just unrealistic in general, I'm afraid. See e.g. the ongoing
> >>> transition from i965 to iris for recent Intel hardware. How is the
> >>> kernel supposed to know which driver is to be used?
> >
> > Well how is userspace currently handling that? The kernel should NOT sa=
y
> > which driver to use in userspace, but rather which one is used in the
> > kernel.
>
> Would that really help though? E.g. the radeon kernel driver supports
> radeon/r200/r300/r600/radeonsi DRI drivers, the i915 one i915/i965/iris
> (and the amdgpu one radeonsi/amdgpu).
>
> The HW generation identifier proposed in these patches might be useful,
> but I suspect there'll always be cases where userspace needs to know
> more precisely.
>
>
> > Mapping that information to an userspace driver still needs to be done
> > somewhere else, but the difference is that you don't need to add all
> > PCI-IDs twice.
>
> It should only really be necessary in Mesa.
>
>
> On 2019-09-17 1:32 p.m., Daniel Vetter wrote:
> > How are other compositors solving this? I don't expect they have a
> > pciid table like modesetting copied to all of them ...
>
> They don't need any of this. The Xorg modesetting driver only did for
> determining the client driver name to advertise via the DRI2 extension.
>
>
> --
> Earthling Michel D=C3=A4nzer               |               https://redhat=
.com
> Libre software enthusiast             |             Mesa and X developer
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--000000000000f250aa0592c844fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>drmVersion::name =3D amdgpu, radeon, intel, etc.<br><=
/div><div>drmVersion::desc =3D vega10, vega12, vega20, ...</div><div><br></=
div><div>The common Mesa code will use name and desc to select the driver.<=
br></div><div><br></div><div>The AMD-specific Mesa code will use desc to id=
entify the chip.</div><div><br></div><div>Mesa won&#39;t receive any PCI ID=
s for future chips.<br></div><div><br></div><div>Marek<br></div><div><br></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Tue, Sep 17, 2019 at 10:33 AM Michel D=C3=A4nzer &lt;<a href=3D"mail=
to:michel@daenzer.net">michel@daenzer.net</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On 2019-09-17 1:20 p.m., Christian=
 K=C3=B6nig wrote:<br>
&gt; Am 17.09.19 um 11:27 schrieb Michel D=C3=A4nzer:<br>
&gt;&gt; On 2019-09-17 11:23 a.m., Michel D=C3=A4nzer wrote:<br>
&gt;&gt;&gt; On 2019-09-17 10:23 a.m., Koenig, Christian wrote:<br>
&gt;&gt;&gt;&gt; Am 17.09.19 um 10:17 schrieb Daniel Vetter:<br>
&gt;&gt;&gt;&gt;&gt; On Tue, Sep 17, 2019 at 10:12 AM Christian K=C3=B6nig<=
br>
&gt;&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:ckoenig.leichtzumerken@gmail.com=
" target=3D"_blank">ckoenig.leichtzumerken@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt; Am 17.09.19 um 07:47 schrieb Jani Nikula:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; On Mon, 16 Sep 2019, Marek Ol=C5=A1=C3=A1k &lt=
;<a href=3D"mailto:maraeo@gmail.com" target=3D"_blank">maraeo@gmail.com</a>=
&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; The purpose is to get rid of all PCI ID ta=
bles for all drivers in<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; userspace. (or at least stop updating them=
)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Mesa common code and modesetting will use =
this.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; I&#39;d think this would warrant a high level =
description of what you<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; want<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; to achieve in the commit message.<br>
&gt;&gt;&gt;&gt;&gt;&gt; And maybe explicitly call it uapi_name or even uap=
i_driver_name.<br>
&gt;&gt;&gt;&gt;&gt; If it&#39;s uapi_name, then why do we need a new one f=
or every generation?<br>
&gt;&gt;&gt;&gt;&gt; Userspace drivers tend to span a lot more than just 1 =
generation. And<br>
&gt;&gt;&gt;&gt;&gt; if you want to have per-generation data from the kerne=
l to userspace,<br>
&gt;&gt;&gt;&gt;&gt; then imo that&#39;s much better suited in some amdgpu =
ioctl, instead of<br>
&gt;&gt;&gt;&gt;&gt; trying to encode that into the driver name.<br>
&gt;&gt;&gt;&gt; Well we already have an IOCTL for that, but I thought the =
intention<br>
&gt;&gt;&gt;&gt; here<br>
&gt;&gt;&gt;&gt; was to get rid of the PCI-ID tables in userspace to figure=
 out which<br>
&gt;&gt;&gt;&gt; driver to load.<br>
&gt;&gt;&gt; That&#39;s just unrealistic in general, I&#39;m afraid. See e.=
g. the ongoing<br>
&gt;&gt;&gt; transition from i965 to iris for recent Intel hardware. How is=
 the<br>
&gt;&gt;&gt; kernel supposed to know which driver is to be used?<br>
&gt; <br>
&gt; Well how is userspace currently handling that? The kernel should NOT s=
ay<br>
&gt; which driver to use in userspace, but rather which one is used in the<=
br>
&gt; kernel.<br>
<br>
Would that really help though? E.g. the radeon kernel driver supports<br>
radeon/r200/r300/r600/radeonsi DRI drivers, the i915 one i915/i965/iris<br>
(and the amdgpu one radeonsi/amdgpu).<br>
<br>
The HW generation identifier proposed in these patches might be useful,<br>
but I suspect there&#39;ll always be cases where userspace needs to know<br=
>
more precisely.<br>
<br>
<br>
&gt; Mapping that information to an userspace driver still needs to be done=
<br>
&gt; somewhere else, but the difference is that you don&#39;t need to add a=
ll<br>
&gt; PCI-IDs twice.<br>
<br>
It should only really be necessary in Mesa.<br>
<br>
<br>
On 2019-09-17 1:32 p.m., Daniel Vetter wrote:<br>
&gt; How are other compositors solving this? I don&#39;t expect they have a=
<br>
&gt; pciid table like modesetting copied to all of them ...<br>
<br>
They don&#39;t need any of this. The Xorg modesetting driver only did for<b=
r>
determining the client driver name to advertise via the DRI2 extension.<br>
<br>
<br>
-- <br>
Earthling Michel D=C3=A4nzer=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=
=3D"https://redhat.com" rel=3D"noreferrer" target=3D"_blank">https://redhat=
.com</a><br>
Libre software enthusiast=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mesa and X developer<br>
_______________________________________________<br>
dri-devel mailing list<br>
<a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">dri-de=
vel@lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel" rel=3D=
"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listin=
fo/dri-devel</a></blockquote></div>

--000000000000f250aa0592c844fa--

--===============1067764005==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1067764005==--
