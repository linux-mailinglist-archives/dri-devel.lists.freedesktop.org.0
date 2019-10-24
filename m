Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E34C3E2F33
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 12:36:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B3746E217;
	Thu, 24 Oct 2019 10:35:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D7689A57;
 Thu, 24 Oct 2019 10:35:56 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 6so1697668wmf.0;
 Thu, 24 Oct 2019 03:35:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LX7jsQpmWavKlITKvOvuB1B7nJgJ56Fg0h8U4CgwnRg=;
 b=S9VCdyV8Ms5afV6D9bT0tMZxSurJUQYwYrGD0yMdYHK3Np2hWG0XY0G0bUIefFB/Ng
 jDj4TzJz25g+APXB5Kf1CogZfoelwIVa5ub3l7EiaSBOdlftlg33mNVGSgvCLoT/RIha
 Ni/e7+zZecuAUT3g1vXmf8aQ3EAOq7v+R2GqfrCOKr/9aAORx7Z5rduobVmwdO/5wtFk
 6/g1l1sY2vOH/hZhAgJbom9dW6lMV6KDpSpajxQOCFE1cwDaOV+yWm6S42DIOLDFOA1T
 JAxkWE3kgm8X5KZdoHp2upnEAGbvSIEW4SEE72pTg8gL4uRu304vWWDuQanleKEBdGsO
 T8Ew==
X-Gm-Message-State: APjAAAXIfG3+TS2d4fQl7KA6sRz46SctT4WFBLOnzO1xmCZ2QTJYRFQ6
 pM6S6xHSet5LI4d7h+lgt/4=
X-Google-Smtp-Source: APXvYqxWDm90lbljYqzWv5OimZTM60qa2pJ6dNzXjWi96GI6OoU4eocOBEYoB5BQSQqJQHmzk8evaQ==
X-Received: by 2002:a05:600c:2295:: with SMTP id
 21mr4138050wmf.63.1571913355028; 
 Thu, 24 Oct 2019 03:35:55 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id t1sm2157187wrn.81.2019.10.24.03.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 03:35:53 -0700 (PDT)
Date: Thu, 24 Oct 2019 12:35:52 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/todo: Add entry to remove
 load/unload hooks
Message-ID: <20191024103552.GB2825247@ulmo>
References: <20191023144953.28190-1-daniel.vetter@ffwll.ch>
 <20191023144953.28190-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
In-Reply-To: <20191023144953.28190-2-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=LX7jsQpmWavKlITKvOvuB1B7nJgJ56Fg0h8U4CgwnRg=;
 b=NU+wPHSmFOf84JrdfErpHp7pMDHCFCmTfRRBCHovDDZ4Vyh+axhqebjir7+7R+jRP0
 Yvm0fVFoU+ZTk9mK1uLE2s0CZSO3Zwza9FqRbVuQVQBzGJ9qN2w4fYd4g0D8pa0zAKJE
 CAyX3j/PncFPENxz9t4epdotonvtdv18jVmrZ2LhwFaTewNfKcTgLW4HZdNl8x9+kN+c
 kIiQEsvxEU/3S5Medy9JD09boFbiaRpukMYtukx3MOUr+I9YLLiPZjW8NHBsWmAkFafH
 W6EDwV4Ljer3nFVHOV5CGwpLeCK3PzoTxnpO7YHPWwPpO5yacGKC6+kzZdCuMOzAG+eJ
 E1wQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1991673514=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1991673514==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wq9mPyueHGvFACwf"
Content-Disposition: inline


--wq9mPyueHGvFACwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2019 at 04:49:53PM +0200, Daniel Vetter wrote:
> They're midlayer, broken, and because of the old gunk, we can't fix
> them. For examples see the various checks in drm_mode_object.c against
> dev->registered, which cannot be enforced if the driver still uses the
> load hook.
>=20
> Unfortunately our biggest driver still uses load/unload, so this would
> be really great to get fixed.
>=20
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  Documentation/gpu/todo.rst | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

Reminds me that I need to still do that for Tegra:

Reviewed-by: Thierry Reding <treding@nvidia.com>

--wq9mPyueHGvFACwf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2xfogACgkQ3SOs138+
s6FDJA/8DwEj6zNuDwqfEXBxmtZUMubxPPMf0/P9UlAZWVbIJGJh6S32S+LC0wJh
axV3ouAllyRVtUh52alAp4zisZWWpLXWhUBzk0pR3IP2CXRXYpc+znNzMSQWdZyE
E6hItzctIHSM+HyqvXfhl2bcuxNNgVNwnmFs6Vxobs4uk3sMEQVhmLAYtbZIlJ06
T6rarPLOoa9nCtcNmiiGit4M72BKV24jFDcqP7xAUB6sTFWMZm/Dp15lyYaQcIbE
tvTQC3w0pWLC+s6myFt7pzsBFCuTYpQSS3echKTMRpJPKsSsIYGmXwJsf+7BQPmf
mDBph50CrEd6RyHa3eoYvIdhd7RyyGN5t8ZDaRDBagYeJQ2z8CHI88/J3byruySo
xQWZRlq490euQr1EAzp8Y/ifaw9d6BP5kaa+lYxycyDe0NxjykrNk/Jdz987dc6s
TXMx/0IVylGHT/dJhAXKKEPYp5t0Q8iN/g//BYGvuny9bum0XcRWSfqhi54YHSVu
Dfm0fvpsToo7MpSiWHc81xmN/kSsthalvgS3dKROKQOCnmJ3+dNg+p1sBWWdMEgV
12zQgqRyIkbqehYCJ/Z2IRmo/bOyThSE2rHLd1SxrwvEC05eR/imOchlP77RniOc
tRhUnDa6+mWl2WhXS1GFk9D+cwIp0PVdDBo+n52fBSwzeLu186Q=
=Q7Co
-----END PGP SIGNATURE-----

--wq9mPyueHGvFACwf--

--===============1991673514==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1991673514==--
