Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E55EA352F7
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 01:33:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B6FD10EBC6;
	Fri, 14 Feb 2025 00:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Tiht5Xx3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B99E10EB56
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 17:24:35 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-308edbc368cso11377111fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 09:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739467474; x=1740072274; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Gizi+IcPKz2ZL+32L5k48P/pQwZERtoVIZYWSlzPdoM=;
 b=Tiht5Xx3NAAmhrx40B7eZnUoX8IOKmlUAuvtr7oSfYYgrQlBrqMELaSyVArs9K7DQP
 ElDqO2Tq70UmgcQTCOpnoZnonuHj4ROfgLDh2h9lIE+ClJ1W+MQiFriEJ2NX2H8AUBdt
 RubUCk63g968/tLDXM2nZsAv56df+6wh2DMYFx1kvMOj7JQ1TzyDfEci82YcWbglAXWD
 cCNLhBsdCuCBMYcyUEaZt1hgyGJ2EL0bMBjxjGagVaHqNKXQzPlpMvqqrv1Ec8bjJ1hB
 OgkPwEW3d7pUAmc3vn22nzfa417jLxs81puA7aKqGSO/LP8ORFaeBRDaJqjlW6metFsb
 hV0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739467474; x=1740072274;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gizi+IcPKz2ZL+32L5k48P/pQwZERtoVIZYWSlzPdoM=;
 b=viPwpF9voyxu15CqPRTVdRyLGEpeczuLn5BrJyzTL03f57xmtGf/MpRxVVNjT7xziK
 KORy8hRHqIwmNRniujnr4LbUz0fCqJuYKH9hgLy5/2ippKpKX347zgJiRzjenRH7zUH7
 bDWacS8qXFndnvGhL9Oq1S+yK2HYUNNYvTBs7ehg/B6V641fWKvXpTSCqTu5wta5XTx0
 Gnmn35meCZy4OJnx1hfpOcrNuJnacDlWwDIxw6heNp7vZmrklwa1ESl4MFtKx8ajYsVy
 CfG8pz/6oJyJXUOvgLitavLAJWCTAFhdJfX09ETf6E59rjnMP/WMWXlVSi6cQ2m6VzOi
 vXAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUo5k4rF1YVJePdYxj6RmEgg1xKLd4kAGFZ6uGlvjrZdOzcv3T3DcN5qxc2bd3efZQiz8EW8m4tMNI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxq2eL0hctOLz7KZfxFfdvm5cplA74iXHcRzr2iKtd3Pb7Fouae
 ADuziyMU1xzM49uEF0V/k29JKhKRcPWbQ5+GzqwT00MdwJcXi0U4JdfTy5rpgK6o5X5Q4ASOUlQ
 M2gTDomWmLd8zGukPT5nwcWcfLqk=
X-Gm-Gg: ASbGncv842M1b9xEXj3XVR9i8cBDCpJXjLd/TnSpZNDNohSxoteNg4/QzxNLD9NW4Te
 1HJ5Mwup0cJgyxokfeNNma+mzUlA7r5EoA3Lo9MSlNyRmn/iv0LbvbwnBvHQ4Gx9ElCeKAw5NrG
 GKCPetQU4ypjU6t0WY7jzIqBGQ9k5dZw==
X-Google-Smtp-Source: AGHT+IEHyli7Bfb7rpt4SBn7B0u1IClaxX45F7VfFV92eWPQkEJ/jQuG74PKPKJ7+E9zspzP9mB5SpDiYiepMSARBWY=
X-Received: by 2002:a05:651c:504:b0:308:e18e:edb6 with SMTP id
 38308e7fff4ca-309050915dfmr26898221fa.24.1739467473359; Thu, 13 Feb 2025
 09:24:33 -0800 (PST)
MIME-Version: 1.0
References: <20250207165325.3998-1-pranav.tyagi03@gmail.com>
 <Z6bKR9K16-oYMLFl@archie.me>
In-Reply-To: <Z6bKR9K16-oYMLFl@archie.me>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Thu, 13 Feb 2025 22:54:22 +0530
X-Gm-Features: AWEUYZnRjXRFR2L1SM1TbIEBn2qZq2W0F3sCHVm6aOmSUfozMuWMb-FNQn7VC8M
Message-ID: <CAH4c4jKe7Q-E1LhA0KxOxEjK-gn=JY7e=2GN13X=yutaO8k3Pw@mail.gmail.com>
Subject: Re: [PATCH] vgaarbiter: documentation grammar correction
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Documentation <linux-doc@vger.kernel.org>, 
 Linux DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-kernel-mentees@lists.linux.dev, 
 skhan@linuxfoundation.org, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Content-Type: multipart/alternative; boundary="000000000000d91866062e0954e4"
X-Mailman-Approved-At: Fri, 14 Feb 2025 00:33:52 +0000
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

--000000000000d91866062e0954e4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Just a gentle follow-up on this patch. It has been reviewed by Bagas
Sanjaya but hasn't been applied yet.

Regards,

Pranav Tyagi

On Sat, Feb 8, 2025 at 8:36=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.com>=
 wrote:

> On Fri, Feb 07, 2025 at 10:23:25PM +0530, Pranav Tyagi wrote:
> > Corrects the following grammatical issues in the VGA Arbiter
> documentation:
> > - Fixes subject-verb agreement by changing "co-exists" to "co-exist"
> > - Corrects pluralization by changing "server" to "servers"
> > - Improves sentence structure for clarity
> >
>
> +Cc: DRM folks.
>
> > Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> > ---
> >  Documentation/gpu/vgaarbiter.rst | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/gpu/vgaarbiter.rst
> b/Documentation/gpu/vgaarbiter.rst
> > index bde3c0afb059..d1e953712cc2 100644
> > --- a/Documentation/gpu/vgaarbiter.rst
> > +++ b/Documentation/gpu/vgaarbiter.rst
> > @@ -11,9 +11,9 @@ Section 7, Legacy Devices.
> >
> >  The Resource Access Control (RAC) module inside the X server [0]
> existed for
> >  the legacy VGA arbitration task (besides other bus management tasks)
> when more
> > -than one legacy device co-exists on the same machine. But the problem
> happens
> > +than one legacy device co-exist on the same machine. But the problem
> happens
> >  when these devices are trying to be accessed by different userspace
> clients
> > -(e.g. two server in parallel). Their address assignments conflict.
> Moreover,
> > +(e.g. two servers in parallel). Their address assignments conflict.
> Moreover,
> >  ideally, being a userspace application, it is not the role of the X
> server to
> >  control bus resources. Therefore an arbitration scheme outside of the =
X
> server
> >  is needed to control the sharing of these resources. This document
> introduces
> > @@ -106,7 +106,7 @@ In-kernel interface
> >  libpciaccess
> >  ------------
> >
> > -To use the vga arbiter char device it was implemented an API inside th=
e
> > +To use the vga arbiter char device, an API was implemented inside the
> >  libpciaccess library. One field was added to struct pci_device (each
> device
> >  on the system)::
> >
>
> The diff looks OK.
>
> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
>
> --
> An old man doll... just what I always wanted! - Clara
>

--000000000000d91866062e0954e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p>Hi,</p><p>Just a gentle follow-up on this patch. It has=
 been reviewed by Bagas Sanjaya but hasn&#39;t been applied yet.<br></p><p>=
Regards,</p><p>Pranav Tyagi</p></div><br><div class=3D"gmail_quote gmail_qu=
ote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Feb 8, 2025 at=
 8:36=E2=80=AFAM Bagas Sanjaya &lt;<a href=3D"mailto:bagasdotme@gmail.com">=
bagasdotme@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On Fri, Feb 07, 2025 at 10:23:25PM +0530, Pranav Tyagi =
wrote:<br>
&gt; Corrects the following grammatical issues in the VGA Arbiter documenta=
tion:<br>
&gt; - Fixes subject-verb agreement by changing &quot;co-exists&quot; to &q=
uot;co-exist&quot;<br>
&gt; - Corrects pluralization by changing &quot;server&quot; to &quot;serve=
rs&quot;<br>
&gt; - Improves sentence structure for clarity<br>
&gt; <br>
<br>
+Cc: DRM folks.<br>
<br>
&gt; Signed-off-by: Pranav Tyagi &lt;<a href=3D"mailto:pranav.tyagi03@gmail=
.com" target=3D"_blank">pranav.tyagi03@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 Documentation/gpu/vgaarbiter.rst | 6 +++---<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/Documentation/gpu/vgaarbiter.rst b/Documentation/gpu/vgaa=
rbiter.rst<br>
&gt; index bde3c0afb059..d1e953712cc2 100644<br>
&gt; --- a/Documentation/gpu/vgaarbiter.rst<br>
&gt; +++ b/Documentation/gpu/vgaarbiter.rst<br>
&gt; @@ -11,9 +11,9 @@ Section 7, Legacy Devices.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 The Resource Access Control (RAC) module inside the X server [0]=
 existed for<br>
&gt;=C2=A0 the legacy VGA arbitration task (besides other bus management ta=
sks) when more<br>
&gt; -than one legacy device co-exists on the same machine. But the problem=
 happens<br>
&gt; +than one legacy device co-exist on the same machine. But the problem =
happens<br>
&gt;=C2=A0 when these devices are trying to be accessed by different usersp=
ace clients<br>
&gt; -(e.g. two server in parallel). Their address assignments conflict. Mo=
reover,<br>
&gt; +(e.g. two servers in parallel). Their address assignments conflict. M=
oreover,<br>
&gt;=C2=A0 ideally, being a userspace application, it is not the role of th=
e X server to<br>
&gt;=C2=A0 control bus resources. Therefore an arbitration scheme outside o=
f the X server<br>
&gt;=C2=A0 is needed to control the sharing of these resources. This docume=
nt introduces<br>
&gt; @@ -106,7 +106,7 @@ In-kernel interface<br>
&gt;=C2=A0 libpciaccess<br>
&gt;=C2=A0 ------------<br>
&gt;=C2=A0 <br>
&gt; -To use the vga arbiter char device it was implemented an API inside t=
he<br>
&gt; +To use the vga arbiter char device, an API was implemented inside the=
<br>
&gt;=C2=A0 libpciaccess library. One field was added to struct pci_device (=
each device<br>
&gt;=C2=A0 on the system)::<br>
&gt;=C2=A0 <br>
<br>
The diff looks OK.<br>
<br>
Reviewed-by: Bagas Sanjaya &lt;<a href=3D"mailto:bagasdotme@gmail.com" targ=
et=3D"_blank">bagasdotme@gmail.com</a>&gt;<br>
<br>
-- <br>
An old man doll... just what I always wanted! - Clara<br>
</blockquote></div>

--000000000000d91866062e0954e4--
