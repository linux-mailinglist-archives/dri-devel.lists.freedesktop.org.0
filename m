Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5803458C70
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 11:39:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD5D6E0C2;
	Mon, 22 Nov 2021 10:39:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C1C6E0C2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 10:39:43 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id z34so78607674lfu.8
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 02:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=hGYbYwA62x5BKVSxVg/QxkQrkBoNXGe8m9fEEOn+qIs=;
 b=khICIZEtIm7ZRZV1J8+3Na6YX2DPEIl9+oheKi8ZQa/VAMTX4voM6+OPgKvwQ0Fu17
 zn5QtPTilKFYR4D8/5TCguL9bKm39OamBnDLIi7LzOpXbPWIGYnJHHsEwRD4VJ/gd+Hv
 BDLwHLAJ2FLc5NTbW9XRx8/WR/EtdTShkSRkcNlS4AhuabPytGnUXc1LOd4uewNwBZEW
 4w4NmhVt6UCMT16BsczuzMrf8ycc/aNiFvPQ3g9otSY67nbiXLu7XstOzsUxqQm+DQBw
 xuABISoRNFqftuxjnSnzvw1JlUhAnnR49PEqb3uxFrlM4VPyZo5x/c1cURWiE5GTgSLE
 W3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=hGYbYwA62x5BKVSxVg/QxkQrkBoNXGe8m9fEEOn+qIs=;
 b=owjwk7iSExqDq2wjUXGLNMA4tKEuU47YyhCT3bx5qenQ8KF0eiXGec6DhtSO/Ezy58
 JBAZU+o7UVeHZq0/ezBuBrtVLrit5qRyDdQ488ELz/HpS+NrkMFZP+lXGGBtqpEUorFK
 c9RdK0XBGkMNKVVTP1TS6uNs5Hc8EFAAtCwliOZXe04RN8ecSrxUWLKroVX8NydLUpaq
 Or4y0mZQnPIjDzVTACYZVwWB+rr+/za1BmDLn/g2jjApWNvchJ46CGsWi2gz773xNOFH
 9XWLc/HMiypwionra94y3sM4PN3eOvLJ4Xv84Kq0oZIRlUxd6dn9fEK5ZqqCqrvjBeRg
 m2lw==
X-Gm-Message-State: AOAM533mX/4mpDXEJBDsw+01KcB3NtU7qzGeQ8iqwcYfhmDEDFLj4+QP
 eoxH4FveE4YfYOp8fmLycb8=
X-Google-Smtp-Source: ABdhPJwgT9nDVsU6Zzwb1wwmKC802MCcisn/aA7f7rG9NHHiXXYlVA2yLZdBA8+c7etpvWIw5yG88g==
X-Received: by 2002:a05:6512:3a5:: with SMTP id
 v5mr54316481lfp.250.1637577581558; 
 Mon, 22 Nov 2021 02:39:41 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id z1sm921397lfu.222.2021.11.22.02.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 02:39:41 -0800 (PST)
Date: Mon, 22 Nov 2021 12:39:38 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 2/3] drm/format-helper: Add
 drm_fb_xrgb8888_to_xrgb2101010_dstclip()
Message-ID: <20211122123938.47fcbef0@eldfell>
In-Reply-To: <7e1356b9-3122-e169-193e-37547a50499a@marcan.st>
References: <20211117145829.204360-1-marcan@marcan.st>
 <20211117145829.204360-3-marcan@marcan.st>
 <20211122115247.257f30fa@eldfell>
 <7e1356b9-3122-e169-193e-37547a50499a@marcan.st>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bjihys6S1XCiDosstpGx6b+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/bjihys6S1XCiDosstpGx6b+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 22 Nov 2021 19:05:16 +0900
Hector Martin <marcan@marcan.st> wrote:

> On 22/11/2021 18.52, Pekka Paalanen wrote:
> > On Wed, 17 Nov 2021 23:58:28 +0900
> > Hector Martin <marcan@marcan.st> wrote:
> >  =20
> >> Add XRGB8888 emulation support for devices that can only do XRGB210101=
0.
> >>
> >> This is chiefly useful for simpledrm on Apple devices where the
> >> bootloader-provided framebuffer is 10-bit, which already works fine wi=
th
> >> simplefb. This is required to make simpledrm support this too.
> >>
> >> Signed-off-by: Hector Martin <marcan@marcan.st>
> >> ---
> >>   drivers/gpu/drm/drm_format_helper.c | 64 +++++++++++++++++++++++++++=
++
> >>   include/drm/drm_format_helper.h     |  4 ++
> >>   2 files changed, 68 insertions(+) =20
> >=20
> > Hi Hector,
> >=20
> > I'm curious, since the bootloader seems to always set up a 10-bit mode,
> > is there a reason for it that you can guess? Is the monitor in WCG or
> > even HDR mode? =20
>=20
> My guess is that Apple prefer to use 10-bit framebuffers for seamless=20
> handover with their graphics stack, which presumably uses 10-bit=20
> framebuffers these days. It seems to be unconditional; I've never seen=20
> anything but 10 bits across all Apple devices, both with the internal=20
> panels on laptops and with bog standard external displays on the Mac=20
> Mini via HDMI. HDR is not necessary, even very dumb capture cards and=20
> old screens get a 10-bit framebufer in memory.

That makes perfect sense, thanks!

Switching between sRGB and WCG or HDR mode is not a modeset, it's just
HDMI/DP/whatever metadata/infoframe.

> The only time I see an 8-bit framebuffer is with *no* monitor connected=20
> on the Mini, in which case you get an 8-bit 640x1136 dummy framebuffer=20
> (that's the iPhone 5 screen resolution... :-) )
>=20

Thanks,
pq

--Sig_/bjihys6S1XCiDosstpGx6b+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmGbc2oACgkQI1/ltBGq
qqcO5w/5AQkcKW7WRqCzuxhwHFroDUV2+LygI5uWRLhNDzwRd0yaBmrspYkNDDpm
4NXwB8YvbzzUTyMN85a8qLErQmfdznxGpcBPBONEMEiItu7qJzxZ7/KuB17G3zlR
SC+ZYFcnQ7d4ygsR7sB198W5TjWKBQDG34CJt+bfV0Djp26QdXLzccGFO154jxcG
U4Dv0kveikdJ+odkxsWSvI44QsD96s9Mmrdf7IbBWemAWqy4LDLsOBOYU8sc8eYc
MNeKRaKeMnn7BpAjVc934DRKYXTg3ngvzbKHj5teLjpyMN8ojE8cGYEdW2JdBE82
0PbVR6xn6+h6WIoF2m2lYwP7agOoME5aC1J3RVm8SUpr5DzVW8O5gLeeZyoLM62n
X4xqhdpajoKq8Y7eWsJu0yuQ6al7GJcLv2Vu5isY1u+61dLCBfkKRdQEEM7rNmxV
E7SKSRpqDiDT2mjhynfi06F7QF5V9kHPmuU6OM6ew/+acvBpI1S5s9tFx+K/jUjM
CHPZz3nlA0QrJiZwgy2zMtHLqFGeE7NPdFdg/cxB0g3QOjCe7JY2Ld2VtFpejJCS
i0qE9ETPdEr4hu4kab8YQm90+0ODDHFALzZeKzX1GPDIRgP49Lt7/Shvi+6vKtAC
3a97+unGRh7hMoTHotBKjqe7RSwpTHa/Ef4jwt7zJElSQE25l8M=
=wJTn
-----END PGP SIGNATURE-----

--Sig_/bjihys6S1XCiDosstpGx6b+--
