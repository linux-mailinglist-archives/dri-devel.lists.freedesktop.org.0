Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63922B2DDFB
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 15:38:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF49110E735;
	Wed, 20 Aug 2025 13:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nGfqMo48";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC04210E25D
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 12:23:44 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-71d60504db9so52807457b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 05:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755692624; x=1756297424; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vuDk9uYTl9wx6SCy9c1xhGhThHatowlgrCSSPFuDfHA=;
 b=nGfqMo48sng6E9szzv+yW/A5OwE5dFdqe6o24gZjTEtjJax0P2dNimzTJURfN6zR7j
 lwN0cEWlReMkW2C3Xegf5BJ+qwwXJHLmjRaknf0tpUyfBpxVYXcka5t1z/rMp/yy4tWF
 YRymoUVFgySoieUPgd9tJeRQCKFinoidIzvYbpGcnLVSgpby17PVyw6H97HXw5vuga+t
 iq7huK+UKY2ANZ+xkQroZfA4t/80bXKegA8zBquGgNlnxahaeDMi615KEjwQQAQfYspK
 /UhpCkMxBLq+6cLObSuDkBMontfk7kqMWgnJWaBjJpKIdrQGmsFTsxWN/UwqHY2RnFXp
 WL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755692624; x=1756297424;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vuDk9uYTl9wx6SCy9c1xhGhThHatowlgrCSSPFuDfHA=;
 b=rMWDOsYS7QmyuS763sNwtWezU6RzW0FiG4QtUcl7F9PiwPtmd1BIa5m2z/a51D321F
 cr+y+u+erI+v+uYm3gYhopl4vgMlzDwc/jBLKYjilARxufn6ttX6ae67JnMR9XbyIBtu
 FEuJVqeeMmUeawCwOnQTC+H/E87FW2FbiylbE2scJA0z/ms1W678aSPPbZPDAwwwPwH2
 RM5AJrOGkZtMGzsF3nOmsFWbcsuVKJ6fW9nM1yz2m4jCoAeR4nICjydewWQlkMUH5qmr
 daxZ4B6szUzSbcRZ9+9lWXpfV04D2q3wWYtgH4XPlDZFcDPXOYWFGZRt3tXoLrvRpzL2
 JFLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYgERLB543hmUvF1RgcvZt8gYXbGgkzf69wZnAlnSZ9UAXVb/taflfN7kjdBHkRlmzFjLEwy/pr94=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxiZXY/DrtLnbACkcdX+w7uNPQaetc0ny/gutOOPe01UFBNwPtn
 d/Kp+j/YIl2M+jl6b++YkNpitKIJfxM3sDqA+pFOYyQnznZGDbd3eD5l6/ZrfUbqvqgffYpVKcm
 tYymOLVxv8wNbL2WT428f+zv2QrzqVuc=
X-Gm-Gg: ASbGncuPo28zxoBOCzOAvezFCnoIbJrho3F6DKxC7Vuo8m55k4Q81NdbAXL8UK58B7p
 Mq2lTA1u3e5CjyDjmaFu2pfqrSKIHr1A+KZHdEKaEAj0kSDoCpVKw1LEWuI12S9uHc8DBeDCpej
 ZDEuaEYylz2FiG3p8KK0UlCmibttUOYn9Atuo78WuLOLmvP0yuGzq4lXueB6IYXb+NCAy0kuZvy
 O1xYsc=
X-Google-Smtp-Source: AGHT+IFyojFA1vRmgtCu3XLUh9F6iIhcKk9d1FftJ+NcD4LKNleHoRglaetwOfS1VkHyzHLV0IeocMsna1WGGApa/xw=
X-Received: by 2002:a05:690c:4b07:b0:71a:a9c:30dd with SMTP id
 00721157ae682-71fb30c858fmr31289607b3.2.1755692623664; Wed, 20 Aug 2025
 05:23:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250806-st7920-v1-0-64ab5a34f9a0@gmail.com>
 <20250806-st7920-v1-3-64ab5a34f9a0@gmail.com>
 <24a5ac33-945b-4861-ac0b-94eaa647e893@kernel.org>
In-Reply-To: <24a5ac33-945b-4861-ac0b-94eaa647e893@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Wed, 20 Aug 2025 14:23:32 +0200
X-Gm-Features: Ac12FXwyWJqnHpmSwY6Sk0MUvqpDJoEAuWX2Yrd1BjzpaWRHelTpLQupz8-UJ34
Message-ID: <CABdCQ=Mysc3a5JNe7te0nRAOzB2n9vQcEz+hZmE3B3vmDYNt2A@mail.gmail.com>
Subject: Re: [PATCH 3/3] MAINTAINERS: Add entry for Sitronix ST7920 driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Content-Type: multipart/alternative; boundary="0000000000002b1a0a063ccb0b7e"
X-Mailman-Approved-At: Wed, 20 Aug 2025 13:38:50 +0000
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

--0000000000002b1a0a063ccb0b7e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El jue, 7 ago 2025 a las 10:13, Krzysztof Kozlowski (<krzk@kernel.org>)
escribi=C3=B3:

> On 06/08/2025 14:48, Iker Pedrosa wrote:
> > Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
>
> Missing commit msg or just squash it with patch #2.
>
> > ---
> >  MAINTAINERS | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index
> 5ddf37f0acc960039422ef988cadfa7176972fc5..79b8a277e38b55ebcff05450d6c565c=
0d87c6b51
> 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -7861,6 +7861,13 @@ T:     git
> https://gitlab.freedesktop.org/drm/misc/kernel.git
> >  F:   Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
> >  F:   drivers/gpu/drm/sitronix/st7735r.c
> >
> > +DRM DRIVER FOR SITRONIX ST7920 LCD DISPLAYS
> > +M:   Iker Pedrosa <ikerpedrosam@gmail.com>
> > +S:   Maintained
> > +T:   git https://gitlab.freedesktop.org/drm/misc/kernel.git
>
>
> Drop, unless you have commit rights there. Parent entry already covers
> this, doesn't it?
>

I don't have them, but I'm working with Javier and I think he does have
permissions. Let me ask him when he gets back.

Thank you for the feedback, by the way.


>
> Best regards,
> Krzysztof
>

--0000000000002b1a0a063ccb0b7e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">El jue, 7 ago 2025 a las 10:13, Krzysztof Koz=
lowski (&lt;<a href=3D"mailto:krzk@kernel.org">krzk@kernel.org</a>&gt;) esc=
ribi=C3=B3:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 0=
6/08/2025 14:48, Iker Pedrosa wrote:<br>
&gt; Signed-off-by: Iker Pedrosa &lt;<a href=3D"mailto:ikerpedrosam@gmail.c=
om" target=3D"_blank">ikerpedrosam@gmail.com</a>&gt;<br>
<br>
Missing commit msg or just squash it with patch #2.<br>
<br>
&gt; ---<br>
&gt;=C2=A0 MAINTAINERS | 7 +++++++<br>
&gt;=C2=A0 1 file changed, 7 insertions(+)<br>
&gt; <br>
&gt; diff --git a/MAINTAINERS b/MAINTAINERS<br>
&gt; index 5ddf37f0acc960039422ef988cadfa7176972fc5..79b8a277e38b55ebcff054=
50d6c565c0d87c6b51 100644<br>
&gt; --- a/MAINTAINERS<br>
&gt; +++ b/MAINTAINERS<br>
&gt; @@ -7861,6 +7861,13 @@ T:=C2=A0 =C2=A0 =C2=A0git <a href=3D"https://gi=
tlab.freedesktop.org/drm/misc/kernel.git" rel=3D"noreferrer" target=3D"_bla=
nk">https://gitlab.freedesktop.org/drm/misc/kernel.git</a><br>
&gt;=C2=A0 F:=C2=A0 =C2=A0Documentation/devicetree/bindings/display/sitroni=
x,st7735r.yaml<br>
&gt;=C2=A0 F:=C2=A0 =C2=A0drivers/gpu/drm/sitronix/st7735r.c<br>
&gt;=C2=A0 <br>
&gt; +DRM DRIVER FOR SITRONIX ST7920 LCD DISPLAYS<br>
&gt; +M:=C2=A0 =C2=A0Iker Pedrosa &lt;<a href=3D"mailto:ikerpedrosam@gmail.=
com" target=3D"_blank">ikerpedrosam@gmail.com</a>&gt;<br>
&gt; +S:=C2=A0 =C2=A0Maintained<br>
&gt; +T:=C2=A0 =C2=A0git <a href=3D"https://gitlab.freedesktop.org/drm/misc=
/kernel.git" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedeskto=
p.org/drm/misc/kernel.git</a><br>
<br>
<br>
Drop, unless you have commit rights there. Parent entry already covers<br>
this, doesn&#39;t it?<br></blockquote><div><br></div><div>I don&#39;t have =
them, but I&#39;m working with Javier and I think he does have permissions.=
 Let me ask him when he gets back.</div><div><br></div><div>Thank you for t=
he feedback, by the way.</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
<br>
Best regards,<br>
Krzysztof<br>
</blockquote></div></div>

--0000000000002b1a0a063ccb0b7e--
