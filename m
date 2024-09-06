Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4052B96F543
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 15:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71CC210EA59;
	Fri,  6 Sep 2024 13:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64CA310EA56;
 Fri,  6 Sep 2024 13:22:52 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id
 5614622812f47-3e0059dc06bso1288770b6e.0; 
 Fri, 06 Sep 2024 06:22:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725628971; x=1726233771;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fpRCzIBmg4hDhKf/Wi3Ix+oWkpUtSx9Y4+rR/dgKxOc=;
 b=fklwjLIQsBtYXmExk5MrpCMEnzbxImWvldl+sgnxRMS0SkW1m2bCKqjXSzT94AeoAX
 qd6TTD9+Qa3WDjUIntRtvQI0rwnS7j3O8QquQKcoHK6H2uK39Qne0KNCSsUYoENMz/Zh
 06P1R5bZbmUAAzSjnBuYLSZoFnGjY7bPwsfltnEoxTOQiQD04VLcJoF5SjfuQ+7em4ef
 pbEdJIhsZR0xW7nZ9odNpI5l8KXNkQ7bSyOB5puN8eQpK0Hpn8XKB7GVNt07aWOPFcER
 NpOfPBqR/kj6ZoF7DqK3L29M9MAAgqXHLFmNHTqIj7WSoW1cakApJ1CQNljvUADhpuvA
 ++OA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVseKX9xKnoelXCpj0FjudQsmvwvBLAWNHrir1bA/HD8S8KjWuHWzmuzfky+OpqItqZL41MZGI45Q==@lists.freedesktop.org,
 AJvYcCW1rmfuKOvqeNERNFuFeOshvOouBwwRAYwlBqFFAhmFGew3G4VKHUaetk3xmWKwyIbcQeUh37xRSfc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwTqwVR5NmxsUHFRF+Y0zT+iAiHPRFMc5AtSkEoIM9dDnXBkT3
 6sOOp5uuOzTHJz2xq/TZj3txFj5t4lIbfuE+XIK2QAygVe/f+l6wjtz8TE2c4IoHO2TRE5aG9Gv
 Sf/kZnYjTlH67q6ECAgJfCqpChNE=
X-Google-Smtp-Source: AGHT+IF+qgvJ1OLT0xdaNcVV3cUA221IzBbYAJw4O4j4zpVSJST/3p8TtVVkufhiSLVms90yNo5c3pM48D9+z/1qxZ4=
X-Received: by 2002:a05:6808:1a0a:b0:3de:220c:ace2 with SMTP id
 5614622812f47-3e029df8226mr3027194b6e.14.1725628971341; Fri, 06 Sep 2024
 06:22:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240906100434.1171093-1-jfalempe@redhat.com>
 <20240906100434.1171093-4-jfalempe@redhat.com>
 <CAKb7UviZ_SZyuEV3apP80oEHZZKm4mAY1pSGueSOEswvzwgdkQ@mail.gmail.com>
 <0b641d80-d8a6-414b-bdfa-3f7ae1fcc187@redhat.com>
In-Reply-To: <0b641d80-d8a6-414b-bdfa-3f7ae1fcc187@redhat.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 6 Sep 2024 09:22:39 -0400
Message-ID: <CAKb7UvgnMtkW9paVEaGosKYX98oh33XbuU=g77wjQy7zKyf6_Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/nouveau: Add drm_panic support for nv50+
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000d9e6210621734db9"
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

--000000000000d9e6210621734db9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 9:10=E2=80=AFAM Jocelyn Falempe <jfalempe@redhat.com=
> wrote:

> On 06/09/2024 14:53, Ilia Mirkin wrote:
> > On Fri, Sep 6, 2024 at 6:05=E2=80=AFAM Jocelyn Falempe <jfalempe@redhat=
.com
> > <mailto:jfalempe@redhat.com>> wrote:
> >
> >     Add drm_panic support, for nv50+ cards.
> >     It's enough to get the panic screen while running Gnome/Wayland on =
a
> >     GTX 1650.
> >     It doesn't support multi-plane or compressed format.
> >     Support for other formats and older cards will come later.
> >     Tiling is only tested on GTX1650, and might be wrong for other card=
s.
> >
> >
> > I'm moderately sure that nv50 and nvc0 tile differently (the general
> > algo is the same, but height is different):
> >
> >
> https://envytools.readthedocs.io/en/latest/hw/memory/g80-surface.html?hig=
hlight=3Dtiling#blocklinear-surfaces
> <
> https://envytools.readthedocs.io/en/latest/hw/memory/g80-surface.html?hig=
hlight=3Dtiling#blocklinear-surfaces
> >
>
> Thanks, it looks like it needs a small adjustment, as in the Doc, GF100
> uses a default height of 4, and GF100+ default to 8 (and I've hardcoded
> it to NV_TILE_BLK_BASE_HEIGHT 8).
> GF100 is still nv50, so it should use this code.
>

Just as a point of clarification -- nv50 =3D G80. nvc0 =3D GF100. (There ar=
e
many other chips, but those are the big generational changes as far as this
code is concerned. https://nouveau.freedesktop.org/CodeNames.html for a
fuller list.)


>
> >
> > That said, I don't know that nv50 supports scanout of tiled surfaces
> > (nor was I aware that nvc0+ did, perhaps it's a recent feature, or
> > perhaps I'm just forgetful).
>
> What I know is that when using Gnome/Wayland, the framebuffer is tiled,
> and without this tiling code, the panic screen is unreadable.
> When using the VT console, the framebuffer is linear, and it's easier.
>

OK. Then clearly it's supported :) I'm sure Ben or Lyude will know offhand
when this support came in.

Cheers,

  -ilia

--000000000000d9e6210621734db9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Sep 6, 2024 at 9:10=E2=80=AFAM Jo=
celyn Falempe &lt;<a href=3D"mailto:jfalempe@redhat.com">jfalempe@redhat.co=
m</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">On 06/09/2024 14:53, Ilia Mirkin wrote:<br>
&gt; On Fri, Sep 6, 2024 at 6:05=E2=80=AFAM Jocelyn Falempe &lt;<a href=3D"=
mailto:jfalempe@redhat.com" target=3D"_blank">jfalempe@redhat.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:jfalempe@redhat.com" target=3D"_blank">jf=
alempe@redhat.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Add drm_panic support, for nv50+ cards.<br>
&gt;=C2=A0 =C2=A0 =C2=A0It&#39;s enough to get the panic screen while runni=
ng Gnome/Wayland on a<br>
&gt;=C2=A0 =C2=A0 =C2=A0GTX 1650.<br>
&gt;=C2=A0 =C2=A0 =C2=A0It doesn&#39;t support multi-plane or compressed fo=
rmat.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Support for other formats and older cards will come=
 later.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Tiling is only tested on GTX1650, and might be wron=
g for other cards.<br>
&gt; <br>
&gt; <br>
&gt; I&#39;m moderately sure that nv50 and nvc0 tile differently (the gener=
al <br>
&gt; algo is the same, but height is different):<br>
&gt; <br>
&gt; <a href=3D"https://envytools.readthedocs.io/en/latest/hw/memory/g80-su=
rface.html?highlight=3Dtiling#blocklinear-surfaces" rel=3D"noreferrer" targ=
et=3D"_blank">https://envytools.readthedocs.io/en/latest/hw/memory/g80-surf=
ace.html?highlight=3Dtiling#blocklinear-surfaces</a> &lt;<a href=3D"https:/=
/envytools.readthedocs.io/en/latest/hw/memory/g80-surface.html?highlight=3D=
tiling#blocklinear-surfaces" rel=3D"noreferrer" target=3D"_blank">https://e=
nvytools.readthedocs.io/en/latest/hw/memory/g80-surface.html?highlight=3Dti=
ling#blocklinear-surfaces</a>&gt;<br>
<br>
Thanks, it looks like it needs a small adjustment, as in the Doc, GF100 <br=
>
uses a default height of 4, and GF100+ default to 8 (and I&#39;ve hardcoded=
 <br>
it to NV_TILE_BLK_BASE_HEIGHT 8).<br>
GF100 is still nv50, so it should use this code.<br></blockquote><div><br><=
/div><div>Just as a point of clarification -- nv50 =3D G80. nvc0 =3D GF100.=
 (There are many other chips, but those are the big generational changes as=
 far as this code is concerned. <a href=3D"https://nouveau.freedesktop.org/=
CodeNames.html">https://nouveau.freedesktop.org/CodeNames.html</a> for a fu=
ller list.)</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
<br>
&gt; <br>
&gt; That said, I don&#39;t know that nv50 supports scanout of tiled surfac=
es <br>
&gt; (nor was I aware that nvc0+ did, perhaps it&#39;s a recent feature, or=
 <br>
&gt; perhaps I&#39;m just forgetful).<br>
<br>
What I know is that when using Gnome/Wayland, the framebuffer is tiled, <br=
>
and without this tiling code, the panic screen is unreadable.<br>
When using the VT console, the framebuffer is linear, and it&#39;s easier.<=
br></blockquote><div><br></div><div>OK. Then clearly it&#39;s supported :) =
I&#39;m sure Ben or Lyude will know offhand when this support came in.</div=
><div><br></div><div>Cheers,</div><div><br></div><div>=C2=A0 -ilia</div></d=
iv></div>

--000000000000d9e6210621734db9--
