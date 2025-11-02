Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AF8C28C8E
	for <lists+dri-devel@lfdr.de>; Sun, 02 Nov 2025 10:28:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C1FF10E02E;
	Sun,  2 Nov 2025 09:28:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dksYxdpv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBEAD10E02E
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Nov 2025 09:28:10 +0000 (UTC)
Received: by mail-ua1-f53.google.com with SMTP id
 a1e0cc1a2514c-934fb15ee9dso1289249241.1
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Nov 2025 01:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762075689; x=1762680489; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FD9xDvssjzVBPML49kAzttrJKM9EYRI+EGQcxwiKXKQ=;
 b=dksYxdpvJxuVUV32icWaY/CGt2iYUdbbbuMsM8ureiWGXcpAIZjreOTR9n2yTo4FLr
 mw0P3nfN08lJK+IuCGHksprrapOOH7uM5QEckQuNGefxdBFbbF34CQ7XRpI2V54UADGE
 l80bN7mgyBP1uhNJw2xhyfPVhy4y+Xb17fCK/mX1kIWRcKHpBFaIqvsFvCQlAW9ljH3Q
 PGvjdReFY+Va4Peyix0tGMM755ODBLzK+3D2udscmzkx1zNX5WmhuK0l4+URH+xvUgR0
 inMI63dNPUSX5VOsw3NwK5yZBzZT0KCfV6ChXRkDLBgyNR3L8v1xIMI6BKpvS5vmQh0h
 2CbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762075689; x=1762680489;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FD9xDvssjzVBPML49kAzttrJKM9EYRI+EGQcxwiKXKQ=;
 b=jfoNvicSN5Z1usbzyDr80kf8kncMQWPUs4GkIVAyTB0TpDdmh7VLC9YX76EXF5OPBL
 LBAD0+f6NB2hQ5DWlikI3rOriVTyn1Yx/jykcrp03CAWImNzg/x5glEMjZzrUgP9vIFa
 FPgz08p3rB/vsYFY5WDEvklZW5+nBtgLTWHkHdD8Sh8ZYDaMQubNUwaJkMkbWo0ezQc1
 lYGVVZeLNT2JWBFKAFlsREG0GEZA/tgRCMgt2PQp2I9NIYKAVvLaGpOgbb0nWI5lnXqf
 /HzqzduxAh/Oc8SC2kmPZF80kpBfuozQKhpl6Pti8WpXRgF4e0fUESVqB0mLa4I2rv8r
 0XKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnkZTeNHsJD/sW7YwGrRxxsa67qUzzSyeuecU4e1GzBbaX0+bm0AjIcpuDJwlSgFXYsvONiRlhncI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzL7R4Pf6ektLFYgER23XUMNcBhAXTCxmc/09gaKyb+Fie93WrX
 zwyVeZ2lJlhqSWXAXBvpvliX6/M3bF87Frb//Kw+88H8ZFEKDcAVFidxbIroWc9znE2SLDrvhsl
 X19BFrfaAgqoMEyxDlJNqXthRD0WBHeA=
X-Gm-Gg: ASbGnctnGk8JSSX6GbQ9dGV91UXhq1g6OIXrE0jh63eAgkQTjdAo/qPtsLP5jM2BHut
 7NmgFj2fs2s7JFs1CCd+0VqtpLyTo5M5lb4bosvLkJXVXn71YWtsGVf6TUhEDoWfnn0ITqgidYD
 RQt6kn9kTnKpTfbuWhrf6iMuUve5nGdggOGRwedbocJfUcra3byai7EoZB3Amnojfe2YdavhgqV
 HQnOZvytLYvGeNnqNUOPtse7FcduSlmRKPZccKmh3sx9xw1i1apJNP5Ce6eW/4GhjnFKO03tKaC
 RpUcTAaDCq4N8aZVgBc=
X-Google-Smtp-Source: AGHT+IHxc3zPuTYwZUI724Vsi0NozZ2WEXr0k3nxeAvnZf/T+liPSxekEHB9GMCjmHrI87ninqDnXcAGJzIDHaWgyXE=
X-Received: by 2002:a05:6102:3a0c:b0:5db:d91a:ff4f with SMTP id
 ada2fe7eead31-5dbd91b0798mr223857137.28.1762075689415; Sun, 02 Nov 2025
 01:28:09 -0800 (PST)
MIME-Version: 1.0
References: <1043551.1761844832@turing-police>
 <32ed124e9d603cad950c4836c7a14a3ba8bc2068.camel@gmail.com>
 <1296761.1762045181@turing-police>
In-Reply-To: <1296761.1762045181@turing-police>
From: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>
Date: Sun, 2 Nov 2025 10:27:54 +0100
X-Gm-Features: AWmQ_bnzbmuLls5PGeFmTvPuXuD55fdLdPAugDkJXyG6xMHZuv-ohFSBcMEuhQY
Message-ID: <CAFF-SiU3XL5pZAzsB=eXi7e1LKzx5XwiNOyfGpPXOnnc6uo2cw@mail.gmail.com>
Subject: Re: linux-next-20251029 - build error in amdgpu
To: =?UTF-8?Q?Valdis_Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>
Cc: Alex Deucher <alexander.deucher@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 David Airlie <airlied@gmail.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="00000000000088f7e006429937d9"
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

--00000000000088f7e006429937d9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Valdis,

I use Fedora and I developed that patch on Fedora, using the same GCC
version. It did not give me an error or warning when I wrote the patch. It
is still not giving me an error or warning about that code now.

I am working with the amd-staging-drm-next branch.

What do I need to do to trigger the warning?

Thanks & best regards,
Timur

Valdis Kl=C4=93tnieks <valdis.kletnieks@vt.edu> ezt =C3=ADrta (id=C5=91pont=
: 2025. nov.
2., Vas 1:59):

> On Thu, 30 Oct 2025 19:05:30 +0100, Timur Krist=C3=B3f said:
>
> > Can you say how to reproduce that?
> > I use the same version of GCC but it hasn't given me any warning or
> > error for that patch.
>
> Upon further testing,
>
> [/usr/src/linux-next] make
>
> is sufficient on my system. Turns out that it errors out even without W=
=3D1.
> My
> next guess was that it had to do with -Werror, which would cause warnings
> to
> be treated as errors, but my .config has
>
> # CONFIG_WERROR is not set
> # CONFIG_DRM_WERROR is not set
> # CONFIG_DRM_AMDGPU_WERROR is not set
>
> Do you perhaps have patches in your tree that aren't in next-20251029?
>
> I wonder if Fedora's build of gcc 15.2.1 is different somehow from the
> build you're using....
>
>
>
>

--00000000000088f7e006429937d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello Valdis,<div dir=3D"auto"><br></div><div dir=3D"auto=
">I use Fedora and I developed that patch on Fedora, using the same GCC ver=
sion. It did not give me an error or warning when I wrote the patch. It is =
still not giving me an error or warning about that code now.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">I am working with the amd-staging-drm=
-next branch.</div><div dir=3D"auto"><br></div><div dir=3D"auto">What do I =
need to do to trigger the warning?</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">Thanks &amp; best regards,</div><div dir=3D"auto">Timur</div></d=
iv><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">Valdis Kl=C4=93tnieks &lt;<a href=3D"mailto:valdis.kletn=
ieks@vt.edu">valdis.kletnieks@vt.edu</a>&gt; ezt =C3=ADrta (id=C5=91pont: 2=
025. nov. 2., Vas 1:59):<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, =
30 Oct 2025 19:05:30 +0100, Timur Krist=C3=B3f said:<br>
<br>
&gt; Can you say how to reproduce that?<br>
&gt; I use the same version of GCC but it hasn&#39;t given me any warning o=
r<br>
&gt; error for that patch.<br>
<br>
Upon further testing, <br>
<br>
[/usr/src/linux-next] make <br>
<br>
is sufficient on my system. Turns out that it errors out even without W=3D1=
. My<br>
next guess was that it had to do with -Werror, which would cause warnings t=
o<br>
be treated as errors, but my .config has<br>
<br>
# CONFIG_WERROR is not set<br>
# CONFIG_DRM_WERROR is not set<br>
# CONFIG_DRM_AMDGPU_WERROR is not set<br>
<br>
Do you perhaps have patches in your tree that aren&#39;t in next-20251029?<=
br>
<br>
I wonder if Fedora&#39;s build of gcc 15.2.1 is different somehow from the<=
br>
build you&#39;re using....<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000088f7e006429937d9--
