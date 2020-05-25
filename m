Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE4D1E1120
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 16:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C1A6E0C4;
	Mon, 25 May 2020 14:58:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7BC389FC9;
 Mon, 25 May 2020 14:58:44 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id v15so8131496qvr.8;
 Mon, 25 May 2020 07:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oEQGzdGf55hROlZZzP0RnfWNG7N1rwyMbo4r+EOdmtY=;
 b=XLw/D5Y5CYvPnqtBj44xxUf0ghkYSdQTDck6flWnKA14aCrwYAETHua6U7qIkW53lx
 wFsS37BtgEJRsJZlqALjaMFSVIoZUgaNTRBRwI0Jy2DC1XEPFrpeStPZgwYKkBFCyYZk
 CbXLPhqhwxbpwZ9taBnYshAMEw3poKDZXq9F8hG6DatVvIgm/INmwtwAsIis2Yu/ZZuu
 2YRr+4scdLz5kLe1+6W8Mdb5rDdqc2CfiGdNDs5ubW6grPIEx6hccbwUim89dNl2WFeY
 MYXLGrw/YTwmejrDWIeEaZ+AriRHBfmbq6U6pkgsQX455cTysumPggK00E5TPthTS2DG
 pRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oEQGzdGf55hROlZZzP0RnfWNG7N1rwyMbo4r+EOdmtY=;
 b=svRJtv8wd3RsG7tfULAvLdYpV09yG61l+Wry/mT1+te00JwIcc1jgAYaTFS2PkNn60
 Gghzb0UMYUuUTv453+accqunm9rmvUK0FuokpdGQ3D0GnGtzi46o93sau3yi2yDSvhoR
 xlW1f4CTdzj0PL+KxdEsAAYzamOftmf+kcol7C9BBgOz0yLTMll1onsBWVbzO4jne00d
 CAeKwE6+WwyLfDjB8iR1yki0nL08V/2W4CmiP0+CvpvmrFetaAB1iSv4F+iK267hGmlE
 SfLAcV+SrBR5E3cxJF72LixT4/crPjKn7OR/jlq4pKc07tdkHdjfTk55NlBTDiII7I3w
 QBoA==
X-Gm-Message-State: AOAM531NYlH/D7+4WK/fAlPBoZ+Lv+52a5MQIjtktuYzPOByIAdsqtgu
 fsVhwL7ssHPt8jPifTwDXliL2k6jZ/wL5ItiL98StA==
X-Google-Smtp-Source: ABdhPJyqUdWv4bIKxEfJPSje7DMT+Us0WHVqBUtXg44pHK/pMnqdY/RlXJDthiirjcyGVb/CNTB1A3ewPZJEKq4FgVE=
X-Received: by 2002:a0c:b60c:: with SMTP id f12mr15962313qve.244.1590418724031; 
 Mon, 25 May 2020 07:58:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAGcx_0Yu4D6F2BiPp5CnJhMyrupGsnFnzEH0-Gv=8rFuVtDi+w@mail.gmail.com>
 <53679f9b-4d81-cb46-72bb-02ca05fb303f@daenzer.net>
In-Reply-To: <53679f9b-4d81-cb46-72bb-02ca05fb303f@daenzer.net>
From: uday kiran pichika <udaykiran.pichika@gmail.com>
Date: Mon, 25 May 2020 20:28:32 +0530
Message-ID: <CAGcx_0Z3JhUP_2KpfC0JQZeugd6VfDSYeErMSZMVVA8sogUt+A@mail.gmail.com>
Subject: Re: Adaptive Sync enabling in Xorg Modesetting driver
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0847900839=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0847900839==
Content-Type: multipart/alternative; boundary="00000000000017138a05a67a37f5"

--00000000000017138a05a67a37f5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Michel..

sorry if my description is not clear.
Yes I have used with glxgears in fullscreen mode and also a simple glxapp
which actually opens in fullscreen by default.

In both the cases, the issue is same.

Just wanted to know if AMD has done anything different apart from the
configurations either in MESA or in its Radeon driver ?

Thanks
Uday Kiran

On Mon, May 25, 2020 at 7:26 PM Michel D=C3=A4nzer <michel@daenzer.net> wro=
te:

> On 2020-05-25 3:31 p.m., uday kiran pichika wrote:
> > Hello,
> >
> > Am working on enabling the Adaptive sync feature as part of the
> > Xorg/Modesetting DDX driver by taking the reference of AMD DDX Driver
> > (xf86-video-amdgpu). Below is the commit which i submitted.
> >
> https://gitlab.freedesktop.org/pichika/xserver/-/commit/682565a645bda7371=
cc3731ee805cc4a0ace80db
> >
> >
> > I have made the below changes to enable this feature
> > 1. Enable Adaptive sync in Graphics Driver
> > 2. Added Xorg.conf file with VariableRefresh property which is read in
> the
> > Modesetting driver --> This is working fine.
> >
> > After taking the above changes, am observing that Adaptive sync is not
> > working.
> >
> > Below are my observations.
> > 1. loader_dri3_helper.c  --> Adaptive sync property is being set once t=
he
> > system is booted successfully on one Window. Once
> > set_adaptive_sync_property() method gets called, adaptive_sync_active
> flag
> > is setting to true. From the next time, when fullscreen applications ar=
e
> > loaded, this property never gets set on any window.
> > 2. Once this property is being set, received a notification in
> modesetting
> > ddx driver and read the property from the Stuff->window.
> > 3. But when the fullscreen application(Either DOTA or Xonotic), not
> > observing that this propety is not being set on any app window.
> >
> > Can any one please help me why this property is not being set in the
> > application windows ?
>
> From your description, it does get set for some windows. Just apparently
> not for the window which is fullscreen and using page flipping (your
> description is a bit vague to be sure though).
>
> Have you tried with a simpler test app, e.g.
>
>  glxgears -fullscreen
>
> ?
>
>
> --
> Earthling Michel D=C3=A4nzer               |               https://redhat=
.com
> Libre software enthusiast             |             Mesa and X developer
>

--00000000000017138a05a67a37f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Michel..<div><br></div><div>sorry if my description=
 is not clear.=C2=A0</div><div>Yes I have used with glxgears in fullscreen =
mode and also a simple glxapp which actually opens in fullscreen=C2=A0by de=
fault.=C2=A0</div><div><br></div><div>In both the cases, the issue is same.=
=C2=A0</div><div><br></div><div>Just wanted to know if AMD has done anythin=
g different apart from the configurations either in MESA or in its Radeon d=
river ?=C2=A0</div><div><br></div><div>Thanks=C2=A0</div><div>Uday Kiran</d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Mon, May 25, 2020 at 7:26 PM Michel D=C3=A4nzer &lt;<a href=3D"mailto=
:michel@daenzer.net">michel@daenzer.net</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">On 2020-05-25 3:31 p.m., uday kiran =
pichika wrote:<br>
&gt; Hello,<br>
&gt; <br>
&gt; Am working on enabling the Adaptive sync feature as part of the<br>
&gt; Xorg/Modesetting DDX driver by taking the reference of AMD DDX Driver<=
br>
&gt; (xf86-video-amdgpu). Below is the commit which i submitted.<br>
&gt; <a href=3D"https://gitlab.freedesktop.org/pichika/xserver/-/commit/682=
565a645bda7371cc3731ee805cc4a0ace80db" rel=3D"noreferrer" target=3D"_blank"=
>https://gitlab.freedesktop.org/pichika/xserver/-/commit/682565a645bda7371c=
c3731ee805cc4a0ace80db</a><br>
&gt; <br>
&gt; <br>
&gt; I have made the below changes to enable this feature<br>
&gt; 1. Enable Adaptive sync in Graphics Driver<br>
&gt; 2. Added Xorg.conf file with VariableRefresh property which is read in=
 the<br>
&gt; Modesetting driver --&gt; This is working fine.<br>
&gt; <br>
&gt; After taking the above changes, am observing that Adaptive sync is not=
<br>
&gt; working.<br>
&gt; <br>
&gt; Below are my observations.<br>
&gt; 1. loader_dri3_helper.c=C2=A0 --&gt; Adaptive sync property is being s=
et once the<br>
&gt; system is booted successfully on one Window. Once<br>
&gt; set_adaptive_sync_property() method gets called, adaptive_sync_active =
flag<br>
&gt; is setting to true. From the next time, when fullscreen applications a=
re<br>
&gt; loaded, this property never gets set on any window.<br>
&gt; 2. Once this property is being set, received a notification in modeset=
ting<br>
&gt; ddx driver and read the property from the Stuff-&gt;window.<br>
&gt; 3. But when the fullscreen application(Either DOTA or Xonotic), not<br=
>
&gt; observing that this propety is not being set on any app window.<br>
&gt; <br>
&gt; Can any one please help me why this property is not being set in the<b=
r>
&gt; application windows ?<br>
<br>
From your description, it does get set for some windows. Just apparently<br=
>
not for the window which is fullscreen and using page flipping (your<br>
description is a bit vague to be sure though).<br>
<br>
Have you tried with a simpler test app, e.g.<br>
<br>
=C2=A0glxgears -fullscreen<br>
<br>
?<br>
<br>
<br>
-- <br>
Earthling Michel D=C3=A4nzer=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=
=3D"https://redhat.com" rel=3D"noreferrer" target=3D"_blank">https://redhat=
.com</a><br>
Libre software enthusiast=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mesa and X developer<br>
</blockquote></div>

--00000000000017138a05a67a37f5--

--===============0847900839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0847900839==--
