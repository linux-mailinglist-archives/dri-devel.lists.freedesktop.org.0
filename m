Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 105FCB94C2
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 18:00:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 927CC6E098;
	Fri, 20 Sep 2019 16:00:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D78D46E098
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 16:00:09 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id y21so2797064wmi.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 09:00:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=y5w3kYJFvDLbvXvIh/hzM2ns+S0PJcF9iipro8fNoQE=;
 b=l5imD7Vx9kkV5sPkHi6aL6xvAn/MRBlDp35C2UupYNNLlYQ2l2y9xN5ijgyDaEoxSI
 vhxJWtq2WFnLlTXhvNiTvJjtuqBdzw3o3DQfzcIf/TkM6Mw1Vb4GGK9JTrvL4TECcPrS
 1MmN0osQ3Ce7OHPnWH7a8NcPp3fk9ecN880jO/1Acy80XrbooxU5stwHGG24XYM7hRbR
 rGeESoE03QFjw9pRgsxPGcBvjKWabJoT0yOyItMoUlTbOuo+G2NBJwWr4/0CxdVDr3sv
 GjBtf0zY1eg4L1t/qkqtdx6G6CYD2mSQwt+kDtKiIA3h2VL6lH3KqRWqq68Zr6jMMHLp
 HKkA==
X-Gm-Message-State: APjAAAVV5PmVNgGti/PNSqVSuT6Yn2J/RanIZ3YFyrp9LVvOQWr9+dI4
 im+mWSV89YLcO1JuB7Y6fMZKyMCb
X-Google-Smtp-Source: APXvYqzmpnqVjScYYIZX4grp65HXX+n28/nvlVnK2PfWZO/AhvFpXuwW9ygFY/JNTgBsxxYER8rbdA==
X-Received: by 2002:a1c:a617:: with SMTP id p23mr4062462wme.166.1568995206618; 
 Fri, 20 Sep 2019 09:00:06 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id q124sm3359292wma.5.2019.09.20.09.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2019 09:00:05 -0700 (PDT)
Date: Fri, 20 Sep 2019 18:00:04 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 00/21] drm/dp: Various helper improvements and cleanups
Message-ID: <20190920160004.GE10973@ulmo>
References: <20190902113121.31323-1-thierry.reding@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190902113121.31323-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=y5w3kYJFvDLbvXvIh/hzM2ns+S0PJcF9iipro8fNoQE=;
 b=MHlOtfSBHSDUBaENKgdKWC4wiusj8n/RSzTZqda6dDMVQgrXF17y1ekVmbqrppzBiA
 Jqx9GJ/mbkFQSL+hiiVmQ3YdWkRjcZw60VmtZgjApHUP6mVjOqrEcBOYeOpc6Mr/EqHn
 jE7fhq4pvWNgG6Lj6ApL0PZS0ZNtGdwoMDd+Gf9OXMqhVWzzbG4XixSghx7gVhoFGpi6
 MgJ4Qtgz0F3CgbIOo43gt8uEbK/dKs6OJvfz75KCkHJ9Kpk6FLB3Z+yMH7XTXtSFeCTf
 gPT/6zM8km/hyJ9BrutReelAO9+AlayRnobelHwsgY+ZsqGaKF2/pN9A7LNYlJjEgs0x
 Dptw==
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
Content-Type: multipart/mixed; boundary="===============0423269260=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0423269260==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Yb+qhiCg54lqZFXW"
Content-Disposition: inline


--Yb+qhiCg54lqZFXW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 02, 2019 at 01:31:00PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Hi,
>=20
> this series of patches improves the DP helpers a bit and cleans up some
> inconsistencies along the way.
>=20
> v2 incorporates all review comments add collects Reviewed-bys from v1.
>=20
> Thierry
>=20
> Thierry Reding (21):
>   drm/dp: Sort includes alphabetically
>   drm/dp: Add missing kerneldoc for struct drm_dp_link
>   drm/dp: Add drm_dp_link_reset() implementation
>   drm/dp: Track link capabilities alongside settings
>   drm/dp: Turn link capabilities into booleans
>   drm/dp: Probe link using existing parsing helpers
>   drm/dp: Read fast training capability from link
>   drm/dp: Read TPS3 capability from sink
>   drm/dp: Read channel coding capability from sink
>   drm/dp: Read alternate scrambler reset capability from sink
>   drm/dp: Read eDP version from DPCD
>   drm/dp: Read AUX read interval from DPCD
>   drm/dp: Do not busy-loop during link training
>   drm/dp: Use drm_dp_aux_rd_interval()
>   drm/dp: Add helper to get post-cursor adjustments
>   drm/dp: Set channel coding on link configuration
>   drm/dp: Enable alternate scrambler reset when supported
>   drm/dp: Add drm_dp_link_choose() helper
>   drm/dp: Add support for eDP link rates
>   drm/dp: Remove a gratuituous blank line
>   drm/bridge: tc358767: Use DP nomenclature

Anyone interested in reviewing these?

Thierry

>=20
>  drivers/gpu/drm/bridge/tc358767.c      |  22 +-
>  drivers/gpu/drm/drm_dp_helper.c        | 327 ++++++++++++++++++++++---
>  drivers/gpu/drm/msm/edp/edp_ctrl.c     |  12 +-
>  drivers/gpu/drm/rockchip/cdn-dp-core.c |   8 +-
>  drivers/gpu/drm/rockchip/cdn-dp-reg.c  |  13 +-
>  drivers/gpu/drm/tegra/dpaux.c          |   8 +-
>  drivers/gpu/drm/tegra/sor.c            |  32 +--
>  include/drm/drm_dp_helper.h            | 124 +++++++++-
>  8 files changed, 459 insertions(+), 87 deletions(-)
>=20
> --=20
> 2.22.0
>=20

--Yb+qhiCg54lqZFXW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2E94QACgkQ3SOs138+
s6EwpxAAgdx0NoWfqWzzGBYIdWYfeP3DfAfAvDIaT8fH0pq91sAGie+Q3BF96a5f
moOFNbGWPFZ9TrpM2qEGVFGWbM8kGm3z+Zea+KxzfVZF72jRtwtlBlsF9h9IYcic
wImzFLZs5IaGIH3lD3v7IeQDIV9+ZFUTFh8rtZcqEsf7hwZcOsQJhDJLdbjH3lo3
KxidR0AfCogh/q2zBXHD0W8DHofKOhS+HW6kUFte76DIzs7L9ONOgrJEdo2/eT+S
8qhtnPGoexe1MpmoheDX0Cs9yh3XboDjRiq+pSD4Q+NoY9MljHG5UflENaRxjM5K
y76kOMmVKtl5CFABevpgZ0R5R3Q9SFCaFvuAEgnA4oeIhajaBV8OhItDIMW+EdNW
dpP9WrlmEivTe3Dh8XJPjnAdA3YQc90DtBS1jvdjKWa42J8WHLgSI0ItynQKV7tH
uZvF4UFKX3GK9X3ZL49WBUBpbCo8+o6v2XrsfmbfTVq34mTYXv9chOBAuSOxD/Cl
48Lnax0JeqsZXYG0YEG2hFJmHF1sWwdda4TLYwBIMIe7scx3qdybxUWpZW92UCpC
qha/zfsXbp9FRVdzBjyntoFlo1+fIBNtp5XYsM+Uzy4RUNjwO/wozJplKvMd4rnq
z9CtS/KcRYn7pbtMeyVa214N0PaMgVwdIQ/O2QfZ5RGm6m6n2iM=
=vjv3
-----END PGP SIGNATURE-----

--Yb+qhiCg54lqZFXW--

--===============0423269260==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0423269260==--
