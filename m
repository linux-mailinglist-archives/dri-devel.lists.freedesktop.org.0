Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5681B24B22
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 11:07:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6CF189260;
	Tue, 21 May 2019 09:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90283891A4;
 Tue, 21 May 2019 09:07:18 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id e13so15095651ljl.11;
 Tue, 21 May 2019 02:07:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=9612Tf+sK5snInFYphGIIxQ5vnfq8tFzesSfj8BgP7Y=;
 b=MMtIOWiABT7YnHc7cbxjTK1sDQbcjga+sjznMjvl1gkMXbu0ctpZDlUSc6s9IhpW0t
 UZBQZhM/yTqd6d0liUSsloQRsFiRGzheUE+u/QJ6rVWT7RRaQNdAdCf5qKVtpFgHZsHx
 xehcdwhNz6t5Sa3q1CXtjfJqCLetFkgaljx+S+2ybSPBWEW9/lJgIarHZ0ess14Bz+d1
 yc8QCKOoVM+GvTBtPK/lgm5ONinkycA8x6DHqPtETvozWWv32QrKTEaF+P6aJelK1ndc
 4P/OuiwMwTfUpj+IbpIM6oMC6UGpsMOillT1OuDWSBpar2GwYcx8VWSo60V0NtcKu/6m
 UepQ==
X-Gm-Message-State: APjAAAWdEvuwkoPa79EawHkOwr62WGgRSoDOnav8Umtk53vshoGivS1w
 FojNU1mDhSaNJ59sRa7pmIk=
X-Google-Smtp-Source: APXvYqx1NJ36n5cuoYdRuLskx8w1sxG2wMqgyKhi+7EgZ8OXtosNnwWhMrPWBbc1BysT23YRbaqmSA==
X-Received: by 2002:a2e:8954:: with SMTP id b20mr30429255ljk.10.1558429636890; 
 Tue, 21 May 2019 02:07:16 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id x23sm4549626ljb.29.2019.05.21.02.07.16
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 May 2019 02:07:16 -0700 (PDT)
Date: Tue, 21 May 2019 12:07:12 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/doc: More fine-tuning on userspace review requirements
Message-ID: <20190521120712.05b0a46a@eldfell.localdomain>
In-Reply-To: <20190521084849.27452-1-daniel.vetter@ffwll.ch>
References: <20190521084849.27452-1-daniel.vetter@ffwll.ch>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=9612Tf+sK5snInFYphGIIxQ5vnfq8tFzesSfj8BgP7Y=;
 b=Aa02Qo/FgF+cPEZSd9XPEcraydfC6kujkHskYSJ4F5/ewVBg2YNUpvME2EzPLPXkIY
 pm6LUBM8gFH2n1GOsH46i60K7LtFFVnRlh12ME85GGzvR3jX0SDNHseGnJZ5RPklx2Pg
 3VzfkD/lG7Stm/nE7wx7PNSCOehfjf04rLQm0qyjhoNesic+5Qz/ViiuxduJo8oiAoWr
 T3StLqlGn3YYmGOlj29p/mVyXd5PoX0lYKPvW3SDrZhI4OR5N+qo99DyJvejGI8hnP/J
 xkZbBL9wC4a/JMMZX/ykAXKFUnDM8/yOv77R6XPlAjlbFl+BPPhIqBGE0R3gv0bScA+n
 okQQ==
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 wayland-devel@lists.freedesktop.org,
 DRI Development <dri-devel@lists.freedesktop.org>, contact@emersion.fr
Content-Type: multipart/mixed; boundary="===============0996266558=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0996266558==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/AqtM96bSPR/rWx0jmFwEdY5"; protocol="application/pgp-signature"

--Sig_/AqtM96bSPR/rWx0jmFwEdY5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 21 May 2019 10:48:49 +0200
Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> With Eric's patch
>=20
> commit ba6e798ecf320716780bb6a6088a8d17dcba1d49
> Author: Eric Anholt <eric@anholt.net>
> Date:   Wed Apr 24 11:56:17 2019 -0700
>=20
>     drm/doc: Document expectation that userspace review looks at kernel u=
API.
>=20
> there's been concerns raised that we expect userspace people to do
> in-depth kernel patch review. That's not reasonable, same way kernel
> people can't review all the userspace we have. Try to clarify
> expectations a bit more.
>=20
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: contact@emersion.fr
> Cc: wayland-devel@lists.freedesktop.org
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  Documentation/gpu/drm-uapi.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.=
rst
> index 05874d09820c..f368e58fb727 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -85,9 +85,9 @@ leads to a few additional requirements:
>  - The userspace side must be fully reviewed and tested to the standards =
of that
>    userspace project. For e.g. mesa this means piglit testcases and revie=
w on the
>    mailing list. This is again to ensure that the new interface actually =
gets the
> -  job done.  The userspace-side reviewer should also provide at least an
> -  Acked-by on the kernel uAPI patch indicating that they've looked at ho=
w the
> -  kernel side is implementing the new feature being used.
> +  job done.  The userspace-side reviewer should also provide an Acked-by=
 on the
> +  kernel uAPI patch indicating that they believe the proposed uAPI is so=
und and
> +  sufficiently documented and validated for userspace's consumption.
> =20
>  - The userspace patches must be against the canonical upstream, not some=
 vendor
>    fork. This is to make sure that no one cheats on the review and testing

Thank you for clarifying this. I can work with that.

Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/AqtM96bSPR/rWx0jmFwEdY5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAlzjv8AACgkQI1/ltBGq
qqcPEg//RQDts7tTCP5ejz+X4GH+FrkDShd1nCYmRxCX2zj3/xRsiyM1fvDYVmF/
QC4dItoCc9/HLFg0ymhFyWwHOBdYj6jgrk/VDMwmJ1IMhWFO+09xbfR7Oml6wDD+
e18Lnm5Zdh++z/d+bG3GfhTYIbUYwu4AebvFGqVG1lGhkSeUBtjFAuvSEHDxHfkn
KI3mBepVNX051ENW1t5DSkc75xCUHxLpAnJuO3+vxKUYg/8A5Rg+xMDSO7AiXkCG
hVyS6M/c3zI6yuyOTftXPRNpGRzrRGwlNGc6UrlEbEsSkISWoBiP2TTNUYa+l4Gu
r9KScfqDwD+c+kdO6mEqOKX1avOq3zQqaAsxmc6632q7Ph6ER6V0hiJTZvng30bR
28iJlBvTfTsHMjmZIS5/DWR/GlOE0iUzFfKJWxnu9Kk9SiFM2mL/Ahu8Ot1+Zz/7
d2c66YuSbNI4JKgwC2WJxrr3ElK8E9Iuv5PVlPKz5oBGV3KSTdk61EeONafKot57
7P/osiCNFum2+VzvQk05lO7sEhAWDBr0Z57SXQAHqjS1GK6ntdXnIqr93c4S4MY+
mxcocNlJl1r9f3zufSpKBexhP7BSI93rxl60xZt48OZoMTOTdjn+F5f+F06jJgMv
U9RMmNgawV8sO2a5Nq6eBz2UpUiuO9ryyJxWGFRDxCoQ6kI0dR8=
=WMlX
-----END PGP SIGNATURE-----

--Sig_/AqtM96bSPR/rWx0jmFwEdY5--

--===============0996266558==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0996266558==--
