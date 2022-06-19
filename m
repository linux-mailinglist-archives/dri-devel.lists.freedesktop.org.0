Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A461D550C0C
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jun 2022 18:22:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4765610ED52;
	Sun, 19 Jun 2022 16:22:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B57310E930;
 Sun, 19 Jun 2022 16:22:20 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id s17so2690360iob.7;
 Sun, 19 Jun 2022 09:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CMHs0PS1TFBPLNKbKLIzdp6HeUcQ1Ge+Te9ys5p3It8=;
 b=SgikfJAKmKo1X6VV7pStkhyBBsZtzkZzzEWgWW+Rkm+o+JdmgIW7QzmfvNM1NJLBBR
 jUAlioO70GBNpe23pPnTOOQiJ2SMf3VuniioAgJD5vxEosSBheAy2rCjt1mGnTLyZ4ko
 PGjVUtiPWv8bnTpwP160cEfjcYsGxze58VY17yn34h8dBbofPAQPXGfecFjgfxTPRBVz
 fosef/Qz6zD/py1qZrR8Y5zK+HK0mHWC2Z3NNEG46Y45AD9ix1ghV23cTt7sl/2dyvbo
 PVTwmIm8G/j4Z8wMYZRb1/XYLujlAORSuh1bh4eXO0tjlVtTA3205FTkaCAV0uxcfpx4
 XFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CMHs0PS1TFBPLNKbKLIzdp6HeUcQ1Ge+Te9ys5p3It8=;
 b=30Ssp325Rw3gTWUVuW8hayYGUrhHZejFEES1W1xo0LZ2kqHnf2af42ivvj13V0azWi
 4PGwRNijqWVncCFKdSpOY/xv3f2h5vG9S+nR3EnV9t5EkWMMd9hQCuv2YvBe+3C+BIMq
 Esv8berklB6vTB6B6ZSNsrb2tgT5e7mxmuKTbNNAH6XssIewiaBN/8tuBwZRJ6eHb5+D
 P58lyetQHXYaCq+5lbHyl+ZVjoMywR1mMD96TSsS5q4AdLE5UA820aQodEVnTyl9S5Sz
 KHqoxQQAlzzgtCvK+Gj9XTQpgoZkpihq3J2429sxH/RaBjN398FVVb8vWXMgRpscb5Ny
 PqVw==
X-Gm-Message-State: AJIora8yxE8Tq8UDm0m+sNmkd7VkOCtVCf74wX+uBeFjYgnbpgEyPah3
 5kYI/2dXop5RvrX/hV4uhkVrxjCRnkK0CEzieis=
X-Google-Smtp-Source: AGRyM1tTZVYVRLk06XMNcTKwfKDWGhutVawExdvT9JxBnyjNeoBJmXowQmrekxoWCJWlce5+4uvh4ZtFqKMLAOxDFX4=
X-Received: by 2002:a02:aa92:0:b0:331:c856:fe69 with SMTP id
 u18-20020a02aa92000000b00331c856fe69mr10212075jai.187.1655655739845; Sun, 19
 Jun 2022 09:22:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220413161450.1854370-1-michel@daenzer.net>
 <f425b789-5081-fa70-555f-7553d7cc5bd5@gmail.com>
 <ca5ca8ab-9c48-8d81-2dd6-fbdfface6519@mailbox.org>
 <abd87438-3ff4-6b62-81b4-6162d167348a@gmail.com>
 <CADnq5_Npy02mWVMOs-TMQ9t6OLV8XFaSQFZ5iB=Y2q3OQgiQvw@mail.gmail.com>
 <fe499d20-2667-5953-831a-d7668c5a3d18@mailbox.org>
 <CAK7LNATdTaY6+FD4TuFgmb00=Qbx=7mmCi9onHv0zi=pdZysBQ@mail.gmail.com>
 <8beac4f5-f7e8-31ab-bbf3-36a917979bfc@mailbox.org>
 <c861e442-e09b-fe20-609c-05bdcb867663@mailbox.org>
 <CAK7LNAQgFXjiT5Js2KDNxp+ep2O7cUVYra31-qZBKTQ_SffLOQ@mail.gmail.com>
In-Reply-To: <CAK7LNAQgFXjiT5Js2KDNxp+ep2O7cUVYra31-qZBKTQ_SffLOQ@mail.gmail.com>
From: =?UTF-8?Q?Ernst_Sj=C3=B6strand?= <ernstp@gmail.com>
Date: Sun, 19 Jun 2022 18:22:09 +0200
Message-ID: <CAD=4a=W+fcuP_oVWJ1x1fPt5izEi1cT-sq7MiDCu+ps3MoJq9Q@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: Add build directory to include path
To: Masahiro Yamada <masahiroy@kernel.org>
Content-Type: multipart/alternative; boundary="0000000000003e727f05e1cf647c"
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
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000003e727f05e1cf647c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Den s=C3=B6n 19 juni 2022 kl 00:20 skrev Masahiro Yamada <masahiroy@kernel.=
org>:

> On Wed, Jun 15, 2022 at 5:35 PM Michel D=C3=A4nzer
> <michel.daenzer@mailbox.org> wrote:
> >
> > On 2022-04-14 18:57, Michel D=C3=A4nzer wrote:
> > > On 2022-04-14 17:04, Masahiro Yamada wrote:
> > >> On Thu, Apr 14, 2022 at 10:50 PM Michel D=C3=A4nzer
> > >> <michel.daenzer@mailbox.org> wrote:
> > >>> On 2022-04-14 15:34, Alex Deucher wrote:
> > >>>> On Thu, Apr 14, 2022 at 4:44 AM Christian K=C3=B6nig
> > >>>> <ckoenig.leichtzumerken@gmail.com> wrote:
> > >>>>> Am 14.04.22 um 09:37 schrieb Michel D=C3=A4nzer:
> > >>>>>>
> > >>>>>>   make -C build-amd64 M=3Ddrivers/gpu/drm
> > >>
> > >>
> > >> Maybe
> > >>
> > >>         make  O=3Dbuild-arm64   drivers/gpu/drm/
> > >>
> > >> is the way you were searching for.
> > >>
> > >> It builds only drivers/gpu/drm/
> > >> in the separate directory.
> > >
> > > Indeed, that works.
> >
> > I've come to realize that this doesn't produce the actual *.ko modules
> though. Is there a trick for building the modules, but only under
> drivers/gpu/drm/ ?
> >
> >
> > --
> > Earthling Michel D=C3=A4nzer            |                  https://redh=
at.com
> > Libre software enthusiast          |         Mesa and Xwayland develope=
r
>
>
> No.
> There is no way to build *.ko
> only under a specific directory.
>

Doesn't "make modules M=3Ddrivers/gpu/drm/" do that?

--0000000000003e727f05e1cf647c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Den s=C3=B6n 19 juni 2022 kl 00:20 skrev Masahiro Yamada &=
lt;<a href=3D"mailto:masahiroy@kernel.org">masahiroy@kernel.org</a>&gt;:<br=
><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On Wed, Jun 15, 2022 at 5:35 PM Michel D=C3=A4nzer<br>
&lt;<a href=3D"mailto:michel.daenzer@mailbox.org" target=3D"_blank">michel.=
daenzer@mailbox.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On 2022-04-14 18:57, Michel D=C3=A4nzer wrote:<br>
&gt; &gt; On 2022-04-14 17:04, Masahiro Yamada wrote:<br>
&gt; &gt;&gt; On Thu, Apr 14, 2022 at 10:50 PM Michel D=C3=A4nzer<br>
&gt; &gt;&gt; &lt;<a href=3D"mailto:michel.daenzer@mailbox.org" target=3D"_=
blank">michel.daenzer@mailbox.org</a>&gt; wrote:<br>
&gt; &gt;&gt;&gt; On 2022-04-14 15:34, Alex Deucher wrote:<br>
&gt; &gt;&gt;&gt;&gt; On Thu, Apr 14, 2022 at 4:44 AM Christian K=C3=B6nig<=
br>
&gt; &gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:ckoenig.leichtzumerken@gmail.co=
m" target=3D"_blank">ckoenig.leichtzumerken@gmail.com</a>&gt; wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt; Am 14.04.22 um 09:37 schrieb Michel D=C3=A4nzer:<=
br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0make -C build-amd64 M=3Ddrivers/g=
pu/drm<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Maybe<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0make=C2=A0 O=3Dbuild-arm64=
=C2=A0 =C2=A0drivers/gpu/drm/<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; is the way you were searching for.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; It builds only drivers/gpu/drm/<br>
&gt; &gt;&gt; in the separate directory.<br>
&gt; &gt;<br>
&gt; &gt; Indeed, that works.<br>
&gt;<br>
&gt; I&#39;ve come to realize that this doesn&#39;t produce the actual *.ko=
 modules though. Is there a trick for building the modules, but only under =
drivers/gpu/drm/ ?<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Earthling Michel D=C3=A4nzer=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"=
https://redhat.com" rel=3D"noreferrer" target=3D"_blank">https://redhat.com=
</a><br>
&gt; Libre software enthusiast=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Mesa and Xwayland developer<br>
<br>
<br>
No.<br>
There is no way to build *.ko<br>
only under a specific directory.<br></blockquote><div><br></div><div style=
=3D"font-family:arial,helvetica,sans-serif" class=3D"gmail_default">Doesn&#=
39;t &quot;make modules M=3Ddrivers/gpu/drm/&quot; do that?</div></div></di=
v>

--0000000000003e727f05e1cf647c--
