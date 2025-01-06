Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87554A01DEF
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 04:01:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F024E10E55C;
	Mon,  6 Jan 2025 03:00:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
 [209.85.217.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464C610E55B;
 Mon,  6 Jan 2025 03:00:52 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id
 ada2fe7eead31-4afe4f1ce18so3979516137.3; 
 Sun, 05 Jan 2025 19:00:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736132452; x=1736737252;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D1B/wfmME6f27/FASU0kRKyN+yxl9V3tn3gXA8xt9Kk=;
 b=TmXAvRnAHo83IoNdpOFrP/O3RrwSukOJmWvsVJMrS1uZXGPajKNcE6PbDbcxbd02Jw
 rK40Kus9E7RpzJVo77BRdw4uQcMTn5LKaal13B7GYbEvMOUw/xdtoljkcNV5wM7SJ9KJ
 +LgtgdAtSO98LlDRX2sRBpW84v9GUVupJ4cpjkcTMX0QYTZFyEIt6rEl1wdlbc0WhHs4
 BFzf76NMeew5tiymp8bFWqEi88Q2I+G7Mg89BrT0FNO0jZqouJszykpZlz+A7l4nCKk7
 5kK4BmEoWyMsV5RCiAjhbX1WQePWAVxOkFs2X3GF5z2fE41dqs4Zn+hgzImMLjr6mnfc
 cKFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbGeccT+Pq1iqqN3MZyPTEgQzfZeHs5yGJnG+Qt8Ox4Z/MHLoRlF7BmCSkiirBlKoTNyma+yTqCg==@lists.freedesktop.org,
 AJvYcCX/kXknftc8NmmJMuKDT+/4k51QoTsa6La7YKEJN6NqUUePhxuz6ObLI3c1pweZTiMYRAWCZLYX0Y0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKk6WYrpv9A54vezEk7BG8Z5Lst4z3R4wD5Su6bguiKvO9iDD4
 PRxJOVZIfukMZwz0F2kYZYf1aY1oOmMRl00FMvMxLQADixLADhVynjcGkNLGO2j93gtyfCNDHL2
 TCzudvJFgNrjRTQn+abpyD4ODT+8=
X-Gm-Gg: ASbGncs+m1k78uwj80BctKok6yvB7e4TJ7J8CxXTmUk02nuZ5XLOBfVr+2tAwiK38Yn
 iby7h4I4NO95YmHxBCzlNj/Z0ylkHC78ZqyYdfbgjwglsMAAIw6rRfC0zi5B7GCRZn05WRnqs
X-Google-Smtp-Source: AGHT+IGZHub59sjOW8FEpQJ700xmJWlOibnhtSwoIENnT7LrGf4fYegDhOiJgZWR4sw3yvPQQVbTjGcgUM2D529peBA=
X-Received: by 2002:a05:6102:6e88:b0:4b2:cc94:1881 with SMTP id
 ada2fe7eead31-4b2cc941e4cmr30717120137.21.1736132451988; Sun, 05 Jan 2025
 19:00:51 -0800 (PST)
MIME-Version: 1.0
References: <AM7PR10MB39235DD53D163910E88FDB938E82A@AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM>
 <AM7PR10MB3923E07D6024434077E95EBA8E82A@AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM>
 <ZWsuiq7zrYS-pDli@archie.me>
 <655a02097e9b49c2da7a2be60d7c154a48a916f4.camel@nvidia.com>
 <AM7PR10MB39235076485E2E3905F422508E86A@AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM>
 <e046050c7e9be5d4f816d33dd1a9dd50e2de3308.camel@nvidia.com>
 <DUZPR10MB8267520A4F44DA38339969A78E93A@DUZPR10MB8267.EURPRD10.PROD.OUTLOOK.COM>
 <DUZPR10MB82674B5F711950D71C0411B98E0F2@DUZPR10MB8267.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <DUZPR10MB82674B5F711950D71C0411B98E0F2@DUZPR10MB8267.EURPRD10.PROD.OUTLOOK.COM>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Sun, 5 Jan 2025 22:00:40 -0500
Message-ID: <CAKb7UviDRfOLBo5acx8uCKbA2R9Ds3JBho1UwyaJBXb5trsVGQ@mail.gmail.com>
Subject: Re: Kernel problem with multiseat on one card - more than 1 user
 simultaneously on 1 video card
To: Gert Vanhaerents <gert.vanhaerents@hotmail.com>
Cc: Timur Tabi <ttabi@nvidia.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "bagasdotme@gmail.com" <bagasdotme@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000157c07062b00d631"
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

--000000000000157c07062b00d631
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 28, 2024 at 7:39=E2=80=AFAM Gert Vanhaerents <
gert.vanhaerents@hotmail.com> wrote:

> In the meantime I have contacted everyone who could have something to do
> with it:
> Kernel groups
> System D
> Nvidia
> And gues:  Everyone says it's not their fault.
>
> But we don't give up. Linux is such a beautiful and solid system. Why
> would it work with Windows and not Linux?u
>
> Our analysis has now discovered that the problem does indeed come from
> the kernel. The kernel does not allow several users to access a graphics
> card at the same time. Indeed, to use it, several users need access to
> the graphics card at the same time.
>
> Can this simultaneous access be allowed by the kernel after all?
> Or can the kernel be adjusted so that this would be possible?
>
> In the meantime I am also working with a multiseat company to search
> together for a solution for multiseat under Linux. This company is
> working on creating an easy and user-friendly program to work via a
> multiseat with Linux, and they have already a high-selling multiseat
> program for Windows. The intention would be to create a program that
> works like some multiseat programs in Windows: install, drag mice and
> keyboards to the right screen, restart and it works as multiseat.
> But such a program is only interesting if it can work for different
> users on 1 video card. For example, for a multiseat of 6 users you need
> 3 video cards with 2 outputs each.
> For now the programmers has a good b=C3=A9ta program, but with the
> restriction only one workstation on one video card, but then it's not
> interesting at all.


You don't mention which GPU you have. Pre-Kepler GPUs can only scan out 2
outputs at a time, so even if you have 3+ connectors on the board, you can
still only have 2 of them active at a time. This is a hardware restriction.
Kepler+ enables 4.

If you check "lspci -nn -d 10de:" it should give you all the NVIDIA
hardware in your machine.

Cheers,

  -ilia

P.S. Looks like I provided this very same advice to you without response on
Jan 16, 2024. So it's an annual thing?

--000000000000157c07062b00d631
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">On Sat,=
 Dec 28, 2024 at 7:39=E2=80=AFAM Gert Vanhaerents &lt;<a href=3D"mailto:ger=
t.vanhaerents@hotmail.com" target=3D"_blank">gert.vanhaerents@hotmail.com</=
a>&gt; wrote:</div><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">In the meantime I have contacted everyone who could ha=
ve something to do <br>
with it:<br>
Kernel groups<br>
System D<br>
Nvidia<br>
And gues:=C2=A0 Everyone says it&#39;s not their fault.<br>
<br>
But we don&#39;t give up. Linux is such a beautiful and solid system. Why <=
br>
would it work with Windows and not Linux?u<br>
<br>
Our analysis has now discovered that the problem does indeed come from <br>
the kernel. The kernel does not allow several users to access a graphics <b=
r>
card at the same time. Indeed, to use it, several users need access to <br>
the graphics card at the same time.<br>
<br>
Can this simultaneous access be allowed by the kernel after all?<br>
Or can the kernel be adjusted so that this would be possible?<br>
<br>
In the meantime I am also working with a multiseat company to search <br>
together for a solution for multiseat under Linux. This company is <br>
working on creating an easy and user-friendly program to work via a <br>
multiseat with Linux, and they have already a high-selling multiseat <br>
program for Windows. The intention would be to create a program that <br>
works like some multiseat programs in Windows: install, drag mice and <br>
keyboards to the right screen, restart and it works as multiseat.<br>
But such a program is only interesting if it can work for different <br>
users on 1 video card. For example, for a multiseat of 6 users you need <br=
>
3 video cards with 2 outputs each.<br>
For now the programmers has a good b=C3=A9ta program, but with the <br>
restriction only one workstation on one video card, but then it&#39;s not <=
br>
interesting at all.</blockquote><div><br></div><div dir=3D"ltr">You don&#39=
;t mention which GPU you have. Pre-Kepler GPUs can only scan out 2 outputs =
at a time, so even if you have 3+ connectors on the board, you can still on=
ly have 2 of them active at a time. This is a hardware restriction. Kepler+=
 enables 4.<div><br></div><div>If you check &quot;lspci -nn -d 10de:&quot; =
it should give you all the NVIDIA hardware in your machine.</div><div><br><=
/div><div>Cheers,</div><div><br></div><div>=C2=A0 -ilia</div><div><br></div=
><div>P.S. Looks like I provided this very same advice to you without respo=
nse on Jan 16, 2024. So it&#39;s an annual thing?</div></div></div></div>
</div>
</div>

--000000000000157c07062b00d631--
