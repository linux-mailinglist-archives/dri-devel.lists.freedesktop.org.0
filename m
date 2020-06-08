Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B21DC1F1CD4
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 18:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A7D89E23;
	Mon,  8 Jun 2020 16:05:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C00C89E23
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 16:05:24 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id 9so11540691ljv.5
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jun 2020 09:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=muu5X8kpwjspMUSxGgXvhpOJZVBidoTxcsK/ci24bWA=;
 b=eFC3YfbY4L+dO2jOW3bmJcf7rXd9D49rtwaG8ljF9y7NtTlLQe5x1gLVtmucNuqmsr
 OTW5ASVyRt3rJP6LoG4TWMr59QRAomXe6ySEfkVa6oSAZ1ru+gFvA4kh0QaW/DyvgYiQ
 i0JUhicVLJWbwQmebUopVilx3NDH+1CP1a5OwiC0ka5WFTgDZNOJVaGzYkRlNZw8lL68
 Dhek7uethgWPW+g+nyhoPgppEBMD7GHEohhT+Exi+URNYKmXzPmsrmvUy6G414TRosOc
 jfXzEzZmsM7AZkw6IS+HP7KA1EOfIH4YlVSmynjEpRIekwwzwGGnwTtQDiYIHU/FONK9
 VtUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=muu5X8kpwjspMUSxGgXvhpOJZVBidoTxcsK/ci24bWA=;
 b=q4GsFSbhTu5ikPFiqiGU6li9D4rYBhEk9iVkJlf5PVJxOLGYR9fjqvnhYZY1QT1X/z
 DUSautPxNDg3h8vxqRxJELevR6UqsNaKLo+AmwH0TGDlc/vunmc94AwdvlMA5YEOLPrt
 Kvq1yvHFQDhmGCJSlBNXe4uPt/hmjYR9VDSUdLic/mkWocvImvjG2zFXSvYsGropKZid
 0+MP6WaIZccf9ZJ/yXo96uzghO+nvnu4yRWc1Z6YB+juabDahTXuscWmu6+RIhDpi1+u
 9/C1Dhz0GWVL5h4PYxUvEOpN8Ra+HsWD0nBnKSEgECJaCaxCRh0seJUu/gcFHq6qQulo
 OarA==
X-Gm-Message-State: AOAM532vOdO9m37YXPWIg1pbdnCO0Mjyaw96RSWXSsBGkXF0PdliwtQB
 lYW5RU075Yb5InTWiY20whEOhPSu
X-Google-Smtp-Source: ABdhPJy4bDj8cAibRW5HyFKVhcFy0LBFsOjPIIEiU2ni7zfoUMWOP4Ge/VktH9cTAs432JLuBSXQKA==
X-Received: by 2002:a05:651c:1045:: with SMTP id
 x5mr11118155ljm.153.1591632322068; 
 Mon, 08 Jun 2020 09:05:22 -0700 (PDT)
Received: from ferris.localdomain (85-156-247-180.elisa-laajakaista.fi.
 [85.156.247.180])
 by smtp.gmail.com with ESMTPSA id f12sm3775010ljk.44.2020.06.08.09.05.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:05:21 -0700 (PDT)
Date: Mon, 8 Jun 2020 19:05:18 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3] drm/doc: device hot-unplug for userspace
Message-ID: <20200608190518.05d7d15d@ferris.localdomain>
In-Reply-To: <20200601143203.14666-1-ppaalanen@gmail.com>
References: <20200519100649.12053-1-ppaalanen@gmail.com>
 <20200601143203.14666-1-ppaalanen@gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: Sean Paul <sean@poorly.run>, Dave Airlie <airlied@redhat.com>
Content-Type: multipart/mixed; boundary="===============0721084924=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0721084924==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/zuu15iTXhm45SMp6Gi+yBr/"; protocol="application/pgp-signature"

--Sig_/zuu15iTXhm45SMp6Gi+yBr/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon,  1 Jun 2020 17:32:03 +0300
Pekka Paalanen <ppaalanen@gmail.com> wrote:

> Set up the expectations on how hot-unplugging a DRM device should look li=
ke to
> userspace.
>=20
> Written by Daniel Vetter's request and largely based on his comments in I=
RC and
> from https://lists.freedesktop.org/archives/dri-devel/2020-May/265484.htm=
l .
>=20
> A related Wayland protocol change proposal is at
> https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_requests=
/35
>=20
> Signed-off-by: Pekka Paalanen <pekka.paalanen@collabora.com>

Hi,

how's this version looking? Anything to fix?


Thanks,
pq


>=20
> ---
>=20
> v3:
> - update ENODEV doc (Daniel)
> - clarify existing vs. new mmaps (Andrey)
> - split into KMS and render/cross sections (Andrey, Daniel)
> - open() returns ENXIO (open(2) man page)
> - ioctls may return ENODEV (Andrey, Daniel)
> - new wayland-protocols MR
>=20
> v2:
> - mmap reads/writes undefined (Daniel)
> - make render ioctl behaviour driver-specific (Daniel)
> - restructure the mmap paragraphs (Daniel)
> - chardev minor notes (Simon)
> - open behaviour (Daniel)
> - DRM leasing behaviour (Daniel)
> - added links
>=20
> Disclaimer: I am a userspace developer writing for other userspace develo=
pers.
> I took some liberties in defining what should happen without knowing what=
 is
> actually possible or what existing drivers already implement.
> ---
>  Documentation/gpu/drm-uapi.rst | 114 ++++++++++++++++++++++++++++++++-
>  1 file changed, 113 insertions(+), 1 deletion(-)

Sorry to trim like this, but gmail refuses to send my email otherwise.

--Sig_/zuu15iTXhm45SMp6Gi+yBr/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl7eYb4ACgkQI1/ltBGq
qqeFdxAAnRZEjkc/PrAe6soZTbi62XHZBzf+txhaDDCmRoevdLoMKYB6X6j7fHd4
x66X6V9v6xvMSAS86eCJj0rC4kOdXtSdhmQ3IwF7IehIcYlWW+8NcBt5eIZHx920
XMreW2HQ2LmuQhQUTfvwFcqGivKiPVFszjS9WR0QGUolIZiZCw5OsMje1Z73rH4V
1jGjJEulUoLIqu/nRxnKgYqjB+Phq3HhTmLSsdtLx2W1ad7lxUWFCik3tptSf8GY
Xz2OtLaUSX00JI5Z5dbhjkZEksfQ+rExGpp6eaUHSwrPuXheOlTQe9TkDPoTRI4+
/cMBm/HH20205T4ycWUFscqA6Iuw6pN7ArfKzi6q1M5DI1q5Ggy+eJ47ta17KtAd
3dTNCcNA22qZxyCUzqiv7/X0V3UZD40hs6S2F3FZfFklPfL1yA0aUQGkApz7+NsM
0Guz6WEjtWP8WyjTm/1gJ8eLzRosyVATKyCKilZu4BdMMBRr+8EaM1KmiPJi6jen
EWho2zMkNAMmij0nGJfJdlCz8GJ41wG0ijl41EGo4bvr1fl2a9cGnyeb7x+KS+th
zLOWcBdC6ZjHnZB6xGQ1b8wllwyucxs10Z3EEPuG0p7oOFNc2stc9Y477wFx5DRN
SIXZ0qC2LYlcoZt9wHE/J3JoHMwAmJen7ptuhxUQu6jsRwTmu4I=
=GZNY
-----END PGP SIGNATURE-----

--Sig_/zuu15iTXhm45SMp6Gi+yBr/--

--===============0721084924==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0721084924==--
