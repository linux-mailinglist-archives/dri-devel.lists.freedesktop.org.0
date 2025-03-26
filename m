Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBEEA7169C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 13:23:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F088F10E123;
	Wed, 26 Mar 2025 12:23:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V6fQBffy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B37CF10E123;
 Wed, 26 Mar 2025 12:23:46 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id
 006d021491bc7-60245c7309bso907582eaf.3; 
 Wed, 26 Mar 2025 05:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742991826; x=1743596626; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/jt+mhW7WzL4hAPVB3jqM8DW9AxXkWF07UC5yUwtCOU=;
 b=V6fQBffya4u0yoK3XekBsVgCydoNVZ8TqRNbc1t5wX2JJkEb1YGvub/jqy7AjAe7dI
 iMW05yuf8XT6sBYkG1i/gALvUWye01A9JPTWtYV+9woI0BY30/VRc/8ApLDxan04Zh2k
 K6gwU6VYSrovw9SOBoSrz7khotNjMCvWVP/O5q5i6Ib/fGRtp6LdUxghr5Qz11E4FzlH
 QxrxFZ2l0jbcay1Snk34gBGV5z2GUL2YfxYdW/cQIyIa95VM7TQr4nof+RzTE1xuZIcb
 olq5uUNotlXxehXNGQIs4BQUqpqXGys5pOcK4oW3mRAeI51Ef6uLzNWfDeek6d8QYOgQ
 VQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742991826; x=1743596626;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/jt+mhW7WzL4hAPVB3jqM8DW9AxXkWF07UC5yUwtCOU=;
 b=TXjdx7z6wOVZ0Y8ylWTLTqTiY1SENJSmOzR+tqnfZa6zlmWJbPKMbOMs0Ptqb/SFAY
 ldjOMVrc55Gd6g/yza7YASTxoTfpw8U+2dfXwBee3bIupjm1gfkiUajQ7f17VKMrQ5ei
 dIi0vhJQvYaPgNyxpuhNXEbPF/A8h/gW89nPLkiNFJAuNvwjtAASBcjtcm831K1ZrjJF
 +KMxm8LvwIOBdeVDUkKx46Tmh79kPs5oMHSZgqzOsiBksM+vclxShodr54+5HoT7zLul
 ueOuQg85rN5uLO5pBFxzVAL8w8GdBjrAM677OnIwZnB26f8dtSaZUEaQFyhlQjL/N909
 NbdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5NL5/egvkBjQw665+VXraSlLAe3vUzi7KXRaauLqErEvCe1w/n6vYn1ziAdyoiEMuCUZBU5O0+rUjzESIKg==@lists.freedesktop.org,
 AJvYcCWj7lKJc7M9ZjtKAemSTE7BLqNwkAwSQnUa9ZOyK9fE38PS4G1Wm2kI5N4q+jWr/JEOUM8UI/olGc4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzH9naJ34w9B1qf1Kbu+obuiZA3nQyNXRVW0OcQzfl/8ixgaxwh
 TSEaQrLWxS6mDdQcOSuqtb/tB08QITOHwAgpje3ct23CB9WEK+2AcDclbnwGSK5+cR0QJAf0ZA0
 mlzbd3Vqke2ZKwUCRKN9WD6ORDTA=
X-Gm-Gg: ASbGncvtb8JAINAzdHSfwfK0sc48WqXBDezveQGcdyuxdsehOfN88Ok1/KnJ5CZcNjl
 rnke2MEdeH+gv86utdGKzCr226We4YFpzXbUBe1GMx5cr3G1T2m1roWlS7IGVbG3WTJVQ1vENZO
 mPCTiIcrGXMQiAwIMUeX+rtS4Aq0D24BJCSmOhh+5lha4oZV4SYT/1ItBefIgv8JyGjEZ/
X-Google-Smtp-Source: AGHT+IGFSn2JGm55yJQz0SnF0rW3maCWrhUUNbku1EeoEWryIpa7jtlN5e7jgMMpilQ3/3EASIyEKo3u7I4+lxHJSf8=
X-Received: by 2002:a05:6820:468f:b0:602:775d:161c with SMTP id
 006d021491bc7-602775d1a55mr24771eaf.2.1742991825810; Wed, 26 Mar 2025
 05:23:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250227093805.2217658-1-jani.nikula@intel.com>
 <87msd86m5m.fsf@intel.com>
In-Reply-To: <87msd86m5m.fsf@intel.com>
From: Zhi Wang <zhi.wang.linux@gmail.com>
Date: Wed, 26 Mar 2025 14:23:34 +0200
X-Gm-Features: AQ5f1JqPFjttgkZQgyXg09QaAe_a6h49h1gIO86e66Q1zu7GDpGL-Gb4z9NrmUY
Message-ID: <CAN=xO47jWtRnRJM8jwD9dURiYPoKNWXh5En-_zXWa_N0bdSR9A@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/gvt: update MAINTAINERS
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 intel-gvt-dev@lists.freedesktop.org, Dave Airlie <airlied@gmail.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Zhenyu Wang <zhenyuw.linux@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000009fc20306313de8d2"
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

--0000000000009fc20306313de8d2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Acked-by: Zhi Wang <zhi.wang.linux@gmail.com>

Jani Nikula <jani.nikula@intel.com> =E4=BA=8E 2025=E5=B9=B43=E6=9C=8826=E6=
=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=881:56=E5=86=99=E9=81=93=EF=BC=9A

> On Thu, 27 Feb 2025, Jani Nikula <jani.nikula@intel.com> wrote:
> > Update GVT-g MAINTAINERS entry to reflect the current status of
> > maintenance and repositories.
> >
> > Cc: Dave Airlie <airlied@gmail.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Simona Vetter <simona.vetter@ffwll.ch>
> > Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> > Cc: Zhenyu Wang <zhenyuw.linux@gmail.com>
> > Cc: Zhi Wang <zhi.wang.linux@gmail.com>
>
> Zhenyu, Zhi, ping? Any input from you?
>
> BR,
> Jani.
>
> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> > ---
> >  MAINTAINERS | 9 +++------
> >  1 file changed, 3 insertions(+), 6 deletions(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 5b69b93f63c6..98374661f5a8 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -11649,13 +11649,10 @@ F:  drivers/gpio/gpio-tangier.c
> >  F:   drivers/gpio/gpio-tangier.h
> >
> >  INTEL GVT-g DRIVERS (Intel GPU Virtualization)
> > -M:   Zhenyu Wang <zhenyuw.linux@gmail.com>
> > -M:   Zhi Wang <zhi.wang.linux@gmail.com>
> > -L:   intel-gvt-dev@lists.freedesktop.org
> > -L:   intel-gfx@lists.freedesktop.org
> > -S:   Supported
> > +R:   Zhenyu Wang <zhenyuw.linux@gmail.com>
> > +R:   Zhi Wang <zhi.wang.linux@gmail.com>
> > +S:   Odd Fixes
> >  W:   https://github.com/intel/gvt-linux/wiki
> > -T:   git https://github.com/intel/gvt-linux.git
> >  F:   drivers/gpu/drm/i915/gvt/
> >
> >  INTEL HID EVENT DRIVER
>
> --
> Jani Nikula, Intel
>

--0000000000009fc20306313de8d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Acked-by: Zhi Wang &lt;<a href=3D"mailto:zhi.wang.linux@gmai=
l.com">zhi.wang.linux@gmail.com</a>&gt;</p>
<br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">Jani Nikula &lt;<a href=3D"mailto:jani.nikula@intel.com">ja=
ni.nikula@intel.com</a>&gt; =E4=BA=8E 2025=E5=B9=B43=E6=9C=8826=E6=97=A5=E5=
=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=881:56=E5=86=99=E9=81=93=EF=BC=9A<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">On Thu, 27 Feb 2025, Jani Nikula &lt;<a href=
=3D"mailto:jani.nikula@intel.com" target=3D"_blank" rel=3D"noreferrer">jani=
.nikula@intel.com</a>&gt; wrote:<br>
&gt; Update GVT-g MAINTAINERS entry to reflect the current status of<br>
&gt; maintenance and repositories.<br>
&gt;<br>
&gt; Cc: Dave Airlie &lt;<a href=3D"mailto:airlied@gmail.com" target=3D"_bl=
ank" rel=3D"noreferrer">airlied@gmail.com</a>&gt;<br>
&gt; Cc: Joonas Lahtinen &lt;<a href=3D"mailto:joonas.lahtinen@linux.intel.=
com" target=3D"_blank" rel=3D"noreferrer">joonas.lahtinen@linux.intel.com</=
a>&gt;<br>
&gt; Cc: Rodrigo Vivi &lt;<a href=3D"mailto:rodrigo.vivi@intel.com" target=
=3D"_blank" rel=3D"noreferrer">rodrigo.vivi@intel.com</a>&gt;<br>
&gt; Cc: Simona Vetter &lt;<a href=3D"mailto:simona.vetter@ffwll.ch" target=
=3D"_blank" rel=3D"noreferrer">simona.vetter@ffwll.ch</a>&gt;<br>
&gt; Cc: Tvrtko Ursulin &lt;<a href=3D"mailto:tursulin@ursulin.net" target=
=3D"_blank" rel=3D"noreferrer">tursulin@ursulin.net</a>&gt;<br>
&gt; Cc: Zhenyu Wang &lt;<a href=3D"mailto:zhenyuw.linux@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">zhenyuw.linux@gmail.com</a>&gt;<br>
&gt; Cc: Zhi Wang &lt;<a href=3D"mailto:zhi.wang.linux@gmail.com" target=3D=
"_blank" rel=3D"noreferrer">zhi.wang.linux@gmail.com</a>&gt;<br>
<br>
Zhenyu, Zhi, ping? Any input from you?<br>
<br>
BR,<br>
Jani.<br>
<br>
&gt; Signed-off-by: Jani Nikula &lt;<a href=3D"mailto:jani.nikula@intel.com=
" target=3D"_blank" rel=3D"noreferrer">jani.nikula@intel.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 MAINTAINERS | 9 +++------<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 6 deletions(-)<br>
&gt;<br>
&gt; diff --git a/MAINTAINERS b/MAINTAINERS<br>
&gt; index 5b69b93f63c6..98374661f5a8 100644<br>
&gt; --- a/MAINTAINERS<br>
&gt; +++ b/MAINTAINERS<br>
&gt; @@ -11649,13 +11649,10 @@ F:=C2=A0 drivers/gpio/gpio-tangier.c<br>
&gt;=C2=A0 F:=C2=A0 =C2=A0drivers/gpio/gpio-tangier.h<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 INTEL GVT-g DRIVERS (Intel GPU Virtualization)<br>
&gt; -M:=C2=A0 =C2=A0Zhenyu Wang &lt;<a href=3D"mailto:zhenyuw.linux@gmail.=
com" target=3D"_blank" rel=3D"noreferrer">zhenyuw.linux@gmail.com</a>&gt;<b=
r>
&gt; -M:=C2=A0 =C2=A0Zhi Wang &lt;<a href=3D"mailto:zhi.wang.linux@gmail.co=
m" target=3D"_blank" rel=3D"noreferrer">zhi.wang.linux@gmail.com</a>&gt;<br=
>
&gt; -L:=C2=A0 =C2=A0<a href=3D"mailto:intel-gvt-dev@lists.freedesktop.org"=
 target=3D"_blank" rel=3D"noreferrer">intel-gvt-dev@lists.freedesktop.org</=
a><br>
&gt; -L:=C2=A0 =C2=A0<a href=3D"mailto:intel-gfx@lists.freedesktop.org" tar=
get=3D"_blank" rel=3D"noreferrer">intel-gfx@lists.freedesktop.org</a><br>
&gt; -S:=C2=A0 =C2=A0Supported<br>
&gt; +R:=C2=A0 =C2=A0Zhenyu Wang &lt;<a href=3D"mailto:zhenyuw.linux@gmail.=
com" target=3D"_blank" rel=3D"noreferrer">zhenyuw.linux@gmail.com</a>&gt;<b=
r>
&gt; +R:=C2=A0 =C2=A0Zhi Wang &lt;<a href=3D"mailto:zhi.wang.linux@gmail.co=
m" target=3D"_blank" rel=3D"noreferrer">zhi.wang.linux@gmail.com</a>&gt;<br=
>
&gt; +S:=C2=A0 =C2=A0Odd Fixes<br>
&gt;=C2=A0 W:=C2=A0 =C2=A0<a href=3D"https://github.com/intel/gvt-linux/wik=
i" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/intel=
/gvt-linux/wiki</a><br>
&gt; -T:=C2=A0 =C2=A0git <a href=3D"https://github.com/intel/gvt-linux.git"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/intel/g=
vt-linux.git</a><br>
&gt;=C2=A0 F:=C2=A0 =C2=A0drivers/gpu/drm/i915/gvt/<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 INTEL HID EVENT DRIVER<br>
<br>
-- <br>
Jani Nikula, Intel<br>
</blockquote></div>

--0000000000009fc20306313de8d2--
