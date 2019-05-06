Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B6F14643
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 10:28:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F625891A0;
	Mon,  6 May 2019 08:28:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6091891A0
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 08:28:47 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id m20so1081365lji.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2019 01:28:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=HxHsRghBDgpnZ3b2V1ajKe9mTrAuKJobqnV/pu1sO9I=;
 b=kHhsCeHgfz/2X2usYUGEifgCmE1TXEiTBSwZaB9sG3wCCHbOCTdO/X7FMRQo58jSNC
 KCsHZ/EQ1RYgDyNsFwH0ycDUcnM7cz5kHcd0/KbcxifFI7WhoWUPG3Ck/qUTxw9ocMjS
 nhZiiAbsVw3nuVcRzXeaFCXTzvgEy1idifDRMuMvw0Z1jTKPmVMg1ONkcVYaiVG82MZQ
 TSgYgBTsJpL4fn0YwupkY46VyMtyTOQkllXtJ4o1hUnfYZWvGuHQCuCrAVh8IgpbukMk
 dt8UqDKyzQbzEAVSo4VqM1XvfxHTe7SqaQs2/upMshhjpGC2QKQp7Rnj7g5FgDQScfzd
 f9nQ==
X-Gm-Message-State: APjAAAVAGYuxyTysK2GdTW1zwtKQbGgP2F5y8uTweRt+St75UD7tuR4U
 L0yH/jJ1vEO7JcupCyOf1n6KHNOj
X-Google-Smtp-Source: APXvYqy5mHzo9X9CtcGISp3Q7zv/KJkihJuZNkp0DwYbeIQCzehe9Ni1lbbFVdOgUqWuUa4yrNYZLg==
X-Received: by 2002:a2e:7a03:: with SMTP id v3mr13820484ljc.142.1557131326266; 
 Mon, 06 May 2019 01:28:46 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id s125sm578587lfe.57.2019.05.06.01.28.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 06 May 2019 01:28:45 -0700 (PDT)
Date: Mon, 6 May 2019 11:28:35 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: Support for 2D engines/blitters in V4L2 and DRM
Message-ID: <20190506112835.6d4ecf29@eldfell.localdomain>
In-Reply-To: <0df3d4b5178d8a37b67b275e0771741c6c268de3.camel@bootlin.com>
References: <0df3d4b5178d8a37b67b275e0771741c6c268de3.camel@bootlin.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=HxHsRghBDgpnZ3b2V1ajKe9mTrAuKJobqnV/pu1sO9I=;
 b=eUP5kQtjNXO9NHhZCto1xFW96qYURNwpUmfCeGYxiB3wLL1ZrmPun937o/fDzOKN0H
 64cqZQqD9lMUPxrzGRWRKaQVRma+BKRv/neGdT8Y1az+sIefXU3MSrXCGUi61dGp+KFd
 sSZvC7gP8I6iMEjUK3RrnVAs2C7GmwBYW8Tsir0BqDmkcPMplGXF30VatpW03QHCY229
 o5p92dk1axCmgy4wYXkJjbmLU6/0a0mMiSYenA47SK49TnCUvM8v3tLsTBNe5qn6XiJH
 YTGEUKtb8cHGKmXUZObw1aMXnXKvPTwF2JlTOun/p4EBtm6De3jNFRDJueTqVWvuJedL
 YUHw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alexandre Courbot <acourbot@chromium.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tomasz Figa <tfiga@chromium.org>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dave Airlie <airlied@redhat.com>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1926367410=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1926367410==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/SpOK9UJGe5vSo3s9+A03Kje"; protocol="application/pgp-signature"

--Sig_/SpOK9UJGe5vSo3s9+A03Kje
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 17 Apr 2019 20:10:15 +0200
Paul Kocialkowski <paul.kocialkowski@bootlin.com> wrote:

> There's also the possibility of writing up a drm-render DDX to handle
> these 2D blitters that can make things a lot faster when running a
> desktop environment. As for wayland, well, I don't really know what to
> think. I was under the impression that it relies on GL for 2D
> operations, but am really not sure how true that actually is.

Hi Paul,

Wayland does not rely on anything really, it does not even have any
rendering commands, and is completely agnostic to how applications or
display servers might be drawing things. Wayland (protocol) does care
about buffer types and fences though, since those are the things passed
between applications and servers.

In a Wayland architecture, each display server (called a Wayland
compositor, corresponding to Xorg + window manager + compositing
manager) uses whatever they want to use for putting the screen contents
together. OpenGL is a popular choice, yes, but they may also use Vulkan,
Pixman, Cairo, Skia, DRM KMS planes, and whatnot or a mix of any.
Sometimes it may so happen that the display server does not need to
render at all, the display hardware can realize the screen contents
through e.g. KMS planes.

Writing a hardware specific driver (like a DDX for Xorg) for one
display server (or a display server library like wlroots or libweston)
is no longer reasonable. You would have to do it on so many display
server projects. What really makes it infeasible is the
hardware-specific aspect. People would have to write a driver for every
display server project for every hardware model. That's just not
feasible today.

Some display server projects even refuse to take hardware-specific code
upstream, because keeping it working has a high cost and only very few
people can test it.

The only way as I see that you could have Wayland compositors at large
take advantage of 2D hardware units is to come up with the common
userspace API in the sense similar to Vulkan or OpenGL, so that each
display server would only need to support the API, and the API
implementation would handle the hardware-specific parts. OpenWF by
Khronos may have been the most serious effort in that, good luck
finding any users or implementations today. Although maybe Android's
hwcomposer could be the next one.

However, if someone is doing a special Wayland compositor to be used on
specific hardware, they can of course use whatever to put the screen
contents together in a downstream fork. Wayland does not restrict that
in any way, not even by buffer or fence types because you can extend
Wayland to deal with anything you need, as long as you also modify the
apps or toolkits to do it too. The limitations are really more
political and practical if you aim for upstream and wide-spread use of
2D hardware blocks.


Thanks,
pq

--Sig_/SpOK9UJGe5vSo3s9+A03Kje
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAlzP8DMACgkQI1/ltBGq
qqd5DA//dXv9y+97awajCKuDmUaldHzEJQuyfyNzTw+d5g979ran569Nf0pqYTd3
pidYpINEGc/Fkt2+u1aSk+ozSN6yvXV0Noh7ZVNqhRhw/nsLSO22jvZtWWzJH4tk
JI+vR6D0zvA9B2+3MmnFlwDj0tnyxc5/ACABUvG4zMFYGMrL5o2wVQ9cdt81Ox83
mFm+NPy7mT/2aun+RfMp9SVqROMVnj/sN5t3gcuv/dmMwykIFQZRxlXt3IYRiRxW
+fOS6GdSVEf/aFwcOAv8P1VZW7uQlBSlYdXpAu/9ht4QY0/JX8K7uTsRfjQdVdD0
uofIYCVqUPbUFkBHcF3vMRXZBzCvgDPATd2PG8fiMT7csowmVyFPObnNFx7gfe/U
5z1b1yH9QuZ5YR0TrPDiZguaQsTtiYHn8GhMX0c1M6Ht46PzuVZ2qQfptVXSBlI/
vUK4VbgBHURQHmPkxsdW78inZgbP+aWWKr4sAOdLE0LchaEWEZzHErO1Ec0cicUT
1TCH0EhU3bcVdOax7ipZrJjyuLjwOvAC94/OcJx3OwU/LOWDqZ216R1JQxchjgWv
IF15KnUteeWBCJJmKVE+krfpz6dEBno+1uqpsAQIrCMZhIzuIAxXaFl1yvqne0Zn
v43ZqT89q1MBU28SDxh98M61HnA/hGZuJIqzOEmXSPH1khgBn1w=
=GYn9
-----END PGP SIGNATURE-----

--Sig_/SpOK9UJGe5vSo3s9+A03Kje--

--===============1926367410==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1926367410==--
