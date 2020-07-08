Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5893E218878
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 15:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 954A16E8C9;
	Wed,  8 Jul 2020 13:07:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A35366E8C9
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 13:07:43 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id a12so46905172ion.13
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jul 2020 06:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NunACNxRHR15rVDMsaLQbwFvMgFw6IcdwKhU+Rr2RX0=;
 b=jNcX3ZBx7WUQ3PgD/c5VZ6fjcOZHVzlJgSc96x0fvYPOCjknGgU7BQukCJfaRtf+/V
 hAEzJOp4m4tASe7HpZnIGZmmCTNGsIjPriZd+NT4I1TVnUUYgYwZeylBc0ZUEjFonaQ+
 DUoVY5tGB3dP2KOwfp9FVfqMGEFYxXl+T1LnsdrKzGkGsP0nHZpH2sNUgsnsBe2Rc9+6
 qJlmhh3Tdq/ocwbdsCn2i3N8gjMRpLd8FpVKJHQHc4itXLUj8V2Q+Dmivh9n/agLS0X6
 i/fzuVvauENJKrtfH2l9TuNRCYN9KS/CU0SORIwfEtrpEXVrUkVgn6yXwnQVlH0xE4QL
 Xl2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NunACNxRHR15rVDMsaLQbwFvMgFw6IcdwKhU+Rr2RX0=;
 b=tHrRxSOVTd+Mtc6KAkcxvmYbvA04/LJljt/OtingYWjAgE9HTtFQK2OZw1jS05mHY3
 0lE61+v8l65mrJ3ICuSxXAlU95yiK2iFEfUSdSN/zedd9+EggSsaP7DFi66Wad1hjMdT
 MdcWlO8FoTmBnN89nXj1rb/cGBw5p3cdXkqnW3qS6WXrBbZ9399mNLBLwNpjucBhKZoC
 QBhIwp2KLZvUCyBmNXozerpG8z/PfMxH8WmzsL5It52GVeiGLJD/DW5HmV4uQlfZH7cs
 IoqKUUb8CX16oAAIuMSPI723oONT+GC1TSy5f+u3fmbLZKIIg97wsOgYHEGmwiP3tXW5
 uYhg==
X-Gm-Message-State: AOAM531ufvVEMlemyT1oC/ARdm54k/Hb1XLvLRP4i9nXZozlYXk4bdsG
 E1ioKML1oXbugAJ2fRLXhatl0+YiY4+m0mvIxhsdXg==
X-Google-Smtp-Source: ABdhPJxiAugYfxBFKepZz/V2knXjdzLRjJOsR8htbF91q0nZ7QqxxYj1WxfPzSDsMcAe5WaUgT5PBuGZEF0zRoCO5jc=
X-Received: by 2002:a6b:6e11:: with SMTP id d17mr37886599ioh.102.1594213662964; 
 Wed, 08 Jul 2020 06:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200708130419.3445042-1-lee.jones@linaro.org>
 <20200708130634.5tttrzlq2zfx7uho@holly.lan>
In-Reply-To: <20200708130634.5tttrzlq2zfx7uho@holly.lan>
From: Lee Jones <lee.jones@linaro.org>
Date: Wed, 8 Jul 2020 14:07:32 +0100
Message-ID: <CAF2Aj3g6e1RQ0T9pSQMAQEega8n1YaW6BzwctBdyWhg=w=g5rw@mail.gmail.com>
Subject: Re: [PATCH 1/1] video: backlight: sky81452-backlight: Fix some
 kerneldoc issues
To: Daniel Thompson <daniel.thompson@linaro.org>
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
Cc: FBDEV list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Gyungoh Yoo <jack.yoo@skyworksinc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============0902927511=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0902927511==
Content-Type: multipart/alternative; boundary="00000000000013d5e205a9edcb4c"

--00000000000013d5e205a9edcb4c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 8 Jul 2020 at 14:06, Daniel Thompson <daniel.thompson@linaro.org>
wrote:

> On Wed, Jul 08, 2020 at 02:04:19PM +0100, Lee Jones wrote:
> > Firstly, all lines must begin with a '*'.  Secondly, arg descriptions
> > must be spelt correctly, so fix misspelling of 'gpioD_enable' and
> > 'short_detecTion_threshold'
> >
> > Fixes the following W=3D1 kernel build warning(s):
> >
> >  drivers/video/backlight/sky81452-backlight.c:46: warning: bad line:
>              If it is not defined, default name is lcd-backlight.
> >  drivers/video/backlight/sky81452-backlight.c:64: warning: Function
> parameter or member 'gpiod_enable' not described in
> 'sky81452_bl_platform_data'
> >  drivers/video/backlight/sky81452-backlight.c:64: warning: Function
> parameter or member 'short_detection_threshold' not described in
> 'sky81452_bl_platform_data'
> >
> > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > Cc: Jingoo Han <jingoohan1@gmail.com>
> > Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > Cc: Gyungoh Yoo <jack.yoo@skyworksinc.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-fbdev@vger.kernel.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
>

Applied, thanks.

--=20
Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
Linaro Services Technical Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

--00000000000013d5e205a9edcb4c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 8 Jul 2020 at 14:06, Daniel Thomp=
son &lt;<a href=3D"mailto:daniel.thompson@linaro.org">daniel.thompson@linar=
o.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Wed, Jul 08, 2020 at 02:04:19PM +0100, =
Lee Jones wrote:<br>
&gt; Firstly, all lines must begin with a &#39;*&#39;.=C2=A0 Secondly, arg =
descriptions<br>
&gt; must be spelt correctly, so fix misspelling of &#39;gpioD_enable&#39; =
and<br>
&gt; &#39;short_detecTion_threshold&#39;<br>
&gt; <br>
&gt; Fixes the following W=3D1 kernel build warning(s):<br>
&gt; <br>
&gt;=C2=A0 drivers/video/backlight/sky81452-backlight.c:46: warning: bad li=
ne:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If it is n=
ot defined, default name is lcd-backlight.<br>
&gt;=C2=A0 drivers/video/backlight/sky81452-backlight.c:64: warning: Functi=
on parameter or member &#39;gpiod_enable&#39; not described in &#39;sky8145=
2_bl_platform_data&#39;<br>
&gt;=C2=A0 drivers/video/backlight/sky81452-backlight.c:64: warning: Functi=
on parameter or member &#39;short_detection_threshold&#39; not described in=
 &#39;sky81452_bl_platform_data&#39;<br>
&gt; <br>
&gt; Cc: Daniel Thompson &lt;<a href=3D"mailto:daniel.thompson@linaro.org" =
target=3D"_blank">daniel.thompson@linaro.org</a>&gt;<br>
&gt; Cc: Jingoo Han &lt;<a href=3D"mailto:jingoohan1@gmail.com" target=3D"_=
blank">jingoohan1@gmail.com</a>&gt;<br>
&gt; Cc: Bartlomiej Zolnierkiewicz &lt;<a href=3D"mailto:b.zolnierkie@samsu=
ng.com" target=3D"_blank">b.zolnierkie@samsung.com</a>&gt;<br>
&gt; Cc: Gyungoh Yoo &lt;<a href=3D"mailto:jack.yoo@skyworksinc.com" target=
=3D"_blank">jack.yoo@skyworksinc.com</a>&gt;<br>
&gt; Cc: <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blan=
k">dri-devel@lists.freedesktop.org</a><br>
&gt; Cc: <a href=3D"mailto:linux-fbdev@vger.kernel.org" target=3D"_blank">l=
inux-fbdev@vger.kernel.org</a><br>
&gt; Signed-off-by: Lee Jones &lt;<a href=3D"mailto:lee.jones@linaro.org" t=
arget=3D"_blank">lee.jones@linaro.org</a>&gt;<br>
<br>
Reviewed-by: Daniel Thompson &lt;<a href=3D"mailto:daniel.thompson@linaro.o=
rg" target=3D"_blank">daniel.thompson@linaro.org</a>&gt;<br></blockquote></=
div><div><br></div><div>Applied, thanks.</div><div><br></div>-- <br><div di=
r=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">=
<div><div><span style=3D"font-size:12.8px">Lee Jones [=E6=9D=8E=E7=90=BC=E6=
=96=AF]</span></div><div><span style=3D"font-size:12.8px">Linaro Services T=
echnical Lead</span></div><div><span style=3D"font-size:12.8px">Linaro.org =
=E2=94=82 Open source software for ARM SoCs</span></div><div><span style=3D=
"font-size:12.8px">Follow Linaro: Facebook | Twitter | Blog</span></div></d=
iv></div></div></div></div></div>

--00000000000013d5e205a9edcb4c--

--===============0902927511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0902927511==--
