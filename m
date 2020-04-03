Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BED19DEEB
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 21:56:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF3A6EC74;
	Fri,  3 Apr 2020 19:56:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559EF6EC74
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 19:56:46 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id g23so8608632otq.4
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 12:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=CrGCpm8KCkcQLwaNw46Ves8qpHNZEfiRT4doX9cSWvk=;
 b=AUZ86GRPx6bXEXLDiTIFzdgm8zJjo5VMY0P0lNlXCuSJo+4/57mEJnmK04tuSzaqi6
 vJOfX9NEkN9diNKzViuWTkZ3b93pxRb7HceUwNrCaN3RgytP2NZAL9As07a6150NQH1l
 bnuQyIrrgtM1Z/BxVVltexIGAKpbkATi25rwO7yPTdnHrLogQCMklZNXgSmfd07WLd1Z
 96t6ZrBxJIS3WkjabLFcNd0M9yNPdDB5LzfJG70iMzrvE87JHyD8cAteH9/XJF1MyNsH
 f4r6Y9F0ew59fvIpjl8j4PrzVoIjiZ12kTCl9CTMThx2Ox70DYQJtGmtQi/jvYIvJ/yC
 KmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=CrGCpm8KCkcQLwaNw46Ves8qpHNZEfiRT4doX9cSWvk=;
 b=QTH4q4B5ibinr9+AUEuA5qMOnJAvFAvppF30WJRxMt3vH+XSv2ubKj6OWjIPU2qvec
 Vrh7XydqiSl9MpKso813jum6wW4Vv7Kzy54KXgqP9rHoSyCn6an+VxjaBb05W4sqntXl
 1mrO0qi3LaxwggnRv6zoEyWm8os8IbbrO+g+2tiaf1aMWcXJSUX/hBESlRpMCcQITD9o
 yIQ+ysgCB+MCGypuRUNti8M8XKcAQD9d6a5iUIPqI3vUUJjNwHu4mv2a8xa+KU4iIGdj
 Qb4o0r4D7+AW64Lp8DcNAZMqor5OYRP+0v1ugeYCSWrGgGqbxhYOzXKxed/svjwJT0e9
 GdQQ==
X-Gm-Message-State: AGi0PuZQkdLieW72976cwdIvPfU8T2sTSgK92Hra4EwYrKwmIKDPIR4V
 pYZp40fuDPkZNcCBtU4krlPuFAdPVcYvw+6te/SV18vX0D8g6A==
X-Google-Smtp-Source: APiQypJx+iZfmkDiCb4Twxc+Gae3gF64OWyAdHtGeWcvsD1HEZkk2Zm5XOw7wxOPoNFkf8IxEvUJzwEP/N2r1n3sT+s=
X-Received: by 2002:a4a:a442:: with SMTP id w2mr7992501ool.90.1585943804545;
 Fri, 03 Apr 2020 12:56:44 -0700 (PDT)
MIME-Version: 1.0
From: Erik Jensen <rkjnsn@google.com>
Date: Fri, 3 Apr 2020 12:56:33 -0700
Message-ID: <CAN=K5G92HHwFqH4FPeqfJkD-hj8HJBy+7dTWEg55BP_HnHFjKw@mail.gmail.com>
Subject: Curtaining API / Force blanking displays
To: dri-devel@lists.freedesktop.org
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
Content-Type: multipart/mixed; boundary="===============0587693138=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0587693138==
Content-Type: multipart/alternative; boundary="0000000000001aebf005a2685188"

--0000000000001aebf005a2685188
Content-Type: text/plain; charset="UTF-8"

First off, apologies if the functionality described already exists and I
just failed to find it, or if this isn't the correct venue for this
discussion. If so, pointers to the correct location would be appreciated.

I'm currently looking into the feasibility of developing a remote access
tool using kernel-level interfaces (e.g., drmModeGetFB and uinput) to
operate regardless of whether the user is using Xorg, a Wayland compositor,
or even a text console (assuming KMS is in use).

One of the requirements, however, is the remote user is able to "curtain"
their session in order to prevent individuals near the physical machine
from watching their session. Imagine a user working from home and
connecting to their workstation in a shared office space.

One possible solution I came up with would be a new kernel API to allow a
privileged process other than the DRM-Master to request that all displays
of a card be blanked or left in power saving mode. This wouldn't affect the
ability of the DRM-Master to change modes and layout configuration, but no
content would be visible on the physical displays until the curtaining
process ended the curtain or exited.

Is this (a) a good approach to solving this issue, (b) an API that, if
implemented, would be likely to be accepted into the kernel, and (c)
something that would be feasible to implement given the current
architecture? E.g., would it require changes in individual drivers, or
could it be managed solely in driver-independent kernel code?

I'm new to DRI development, so if it is something that folks would be open
to having, pointers to a good part of the code to look at to start
implementing such a feature would be appreciated.

Thanks!

--0000000000001aebf005a2685188
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>First off, apologies=C2=A0if the functionality descri=
bed already exists and I just failed to find it, or if this isn&#39;t the c=
orrect venue for this discussion. If so, pointers to the correct location w=
ould=C2=A0be appreciated.<br><br>I&#39;m currently looking into the feasibi=
lity of developing a remote access tool using kernel-level interfaces (e.g.=
, drmModeGetFB a<span style=3D"color:rgb(0,0,0);white-space:pre-wrap">nd ui=
nput) to operate regardless of whether the user is using Xorg, a Wayland co=
mpositor, or even a text console (assuming KMS is in use).</span><br></div>=
<div><span style=3D"color:rgb(0,0,0);white-space:pre-wrap"><br></span></div=
><div><span style=3D"color:rgb(0,0,0);white-space:pre-wrap">One of the requ=
irements, however, is the remote user is able to &quot;curtain&quot; their =
session in order to prevent individuals near the physical machine from watc=
hing their session. Imagine a user working from home and connecting to thei=
r workstation in a shared office space.</span></div><div><span style=3D"col=
or:rgb(0,0,0);white-space:pre-wrap"><br></span></div><div><span style=3D"co=
lor:rgb(0,0,0);white-space:pre-wrap">One possible solution I came up with w=
ould be a new kernel API to allow a privileged process other than the DRM-M=
aster to request that all displays of a card be blanked or left in power sa=
ving mode. This wouldn&#39;t affect the ability of the DRM-Master to change=
 modes and layout configuration, but no content would be visible on the phy=
sical displays until the curtaining process ended the curtain or exited.</s=
pan></div><div><span style=3D"color:rgb(0,0,0);white-space:pre-wrap"><br></=
span></div><div><span style=3D"color:rgb(0,0,0);white-space:pre-wrap">Is th=
is (a) a good approach to solving this issue, (b) an API that, if implement=
ed, would be likely to be accepted into the kernel, and (c) something that =
would be feasible to implement given the current architecture? E.g., would =
it require changes in individual drivers, or could it be managed solely in =
driver-independent kernel code?</span></div><div><span style=3D"color:rgb(0=
,0,0);white-space:pre-wrap"><br></span></div><div><span style=3D"color:rgb(=
0,0,0);white-space:pre-wrap">I&#39;m new to DRI development, so if it is so=
mething that folks would be open to having, pointers to a good part of the =
code to look at to start implementing such a feature would be appreciated.<=
/span></div><div><br></div><div>Thanks!</div></div>

--0000000000001aebf005a2685188--

--===============0587693138==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0587693138==--
