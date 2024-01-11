Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E478682B324
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 17:39:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8314010E909;
	Thu, 11 Jan 2024 16:39:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1079C10E909
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 16:39:13 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50]) (Authenticated sender: zamundaaa)
 by letterbox.kde.org (Postfix) with ESMTPSA id 4E19133F0E4
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 16:39:11 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1704991151; bh=njXkgjX0cDPG7t4cvRLNJIRCazxO3afQpgLF8VbwMcQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fxGSpckbqnXRcCDdxpvpNku1Jeauwkb19clZV/iF7igNUUmZpfRQVj0usKscXe67b
 9IbFWAt8ZGpCYilVqwYwT2b7HGqkvTljbU4umvu1EgBwQURiusrVrodoRafYIytSls
 1TOnwwfM/B4EZyZXflNLy+eMx0UU/HkT03Fp8V71k68NjVj8fRvkCKBwNccdGCZm6C
 WoAkuFnJUXP0I3xFbSsQc1DlpkpIn0bStd9WvpfCJb7X2V9T45PsZvsEWMBHkYgASB
 UR/j8CnmvIL1b/EDaF+yZq2LL15lltX63kF+xP5aFIPJ5byTLPotcWEb62BW9gpOaA
 24OzIELW9QHdA==
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-555e07761acso6663336a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 08:39:11 -0800 (PST)
X-Gm-Message-State: AOJu0Yx5qLt2beda9+3djlSLnZgr4anZGOoa6Mb7LMMVTDWqdRAzwntK
 Ve//n9qsLGlF8iOf2PSD6i/c7z4e14aYrAZpnB0=
X-Google-Smtp-Source: AGHT+IHgLASf2M0+81kI7VLZUsrx3/k7Cb3SosdT6l+uKRb7dP/7s0bUK9cXi/J/wqw5NNk2DKrK0eeU/Vjj4iC2uvc=
X-Received: by 2002:a17:906:160c:b0:a2c:551e:6280 with SMTP id
 m12-20020a170906160c00b00a2c551e6280mr425339ejd.27.1704991150836; Thu, 11 Jan
 2024 08:39:10 -0800 (PST)
MIME-Version: 1.0
References: <CAFZQkGxgdeXb82kEsVuC72kGos385YX=GD4QNKfAsM9TyTqoAw@mail.gmail.com>
 <CABQX2QNhdLp6GC6ZE=vRaGgpLV3pqQYZ84_iq_+zoGB_vU0ejA@mail.gmail.com>
In-Reply-To: <CABQX2QNhdLp6GC6ZE=vRaGgpLV3pqQYZ84_iq_+zoGB_vU0ejA@mail.gmail.com>
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Thu, 11 Jan 2024 17:38:59 +0100
X-Gmail-Original-Message-ID: <CAFZQkGw2H0Q+C5_WoDjWYRYo6sBwSfh-MkLh5ZmKQWv7T=g0dA@mail.gmail.com>
Message-ID: <CAFZQkGw2H0Q+C5_WoDjWYRYo6sBwSfh-MkLh5ZmKQWv7T=g0dA@mail.gmail.com>
Subject: Re: BUG / design challenge: vmwgfx + PRIME handle free == clobbering
 errno
To: Zack Rusin <zack.rusin@broadcom.com>
Content-Type: multipart/alternative; boundary="000000000000e410d7060eae2fb1"
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
Cc: linux-graphics-maintainer@vmware.com, stefan.hoffmeister@econos.de,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000e410d7060eae2fb1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mi., 10. Jan. 2024 um 01:28 Uhr schrieb Zack Rusin <
zack.rusin@broadcom.com>:

> On Tue, Jan 9, 2024 at 11:06=E2=80=AFAM Xaver Hugl <xaver.hugl@kde.org> w=
rote:
> >
> > Hi,
> >
> > KWin does use DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT.
>
> Can you point me to the code that implements it? Just wanted to take a
> quick look, because I didn't see the cursor on KDE 6 after fixing the
> kernel oops.
>
It's here:
https://invent.kde.org/plasma/kwin/-/blob/a879c59a082707e0e7dfa8ebeb7b23955=
1ec9c71/src/backends/drm/drm_gpu.cpp#L153

> > Tying the check to
> > DRM_CLIENT_CAP_ATOMIC instead would IMO make more sense though (even if
> it's
> > still weird) and would work with older versions of KWin and other
> compositors.
>
> Unfortunately xf86-video-modesetting advertises CLIENT_CAP_ATOMIC and
> uses GL where our GL driver assumes the prime object is not GEM. Not
> impossible, as mentioned before, we can always add code to the kernel
> that handles both but I don't think there's any particularly clean
> solutions here. We'll probably play with a few solutions and see which
> one is the cleanest.
>
> z
>

Ah, that's unfortunate.

--000000000000e410d7060eae2fb1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Am Mi., 10. Jan. 2024 um 01:28=C2=A0Uhr schri=
eb Zack Rusin &lt;<a href=3D"mailto:zack.rusin@broadcom.com">zack.rusin@bro=
adcom.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On Tue, Jan 9, 2024 at 11:06=E2=80=AFAM Xaver Hugl &lt;<a href=3D"mailto=
:xaver.hugl@kde.org" target=3D"_blank">xaver.hugl@kde.org</a>&gt; wrote:<br=
>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; KWin does use DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT.<br>
<br>
Can you point me to the code that implements it? Just wanted to take a<br>
quick look, because I didn&#39;t see the cursor on KDE 6 after fixing the<b=
r>
kernel oops.<br></blockquote><div>It&#39;s here: <a href=3D"https://invent.=
kde.org/plasma/kwin/-/blob/a879c59a082707e0e7dfa8ebeb7b239551ec9c71/src/bac=
kends/drm/drm_gpu.cpp#L153">https://invent.kde.org/plasma/kwin/-/blob/a879c=
59a082707e0e7dfa8ebeb7b239551ec9c71/src/backends/drm/drm_gpu.cpp#L153</a></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; Tying the check to<br>
&gt; DRM_CLIENT_CAP_ATOMIC instead would IMO make more sense though (even i=
f it&#39;s<br>
&gt; still weird) and would work with older versions of KWin and other comp=
ositors.<br>
<br>
Unfortunately xf86-video-modesetting advertises CLIENT_CAP_ATOMIC and<br>
uses GL where our GL driver assumes the prime object is not GEM. Not<br>
impossible, as mentioned before, we can always add code to the kernel<br>
that handles both but I don&#39;t think there&#39;s any particularly clean<=
br>
solutions here. We&#39;ll probably play with a few solutions and see which<=
br>
one is the cleanest.<br>
<br>
z<br></blockquote><div><br></div><div>Ah, that&#39;s unfortunate.<br></div>=
</div></div>

--000000000000e410d7060eae2fb1--
