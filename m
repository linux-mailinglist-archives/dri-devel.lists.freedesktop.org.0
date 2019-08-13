Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B856B8B425
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 11:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77DF36E0CD;
	Tue, 13 Aug 2019 09:32:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 361466E0CD
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 09:32:10 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 207so848753wma.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 02:32:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UcvInRPxhVPxd4rLj2PRIjLeuLAuo1BMJomTbF71gp0=;
 b=IH9/3KtFRPhn3NzlX8sPNZZx75n1Zct2cMAau6T2cN0d1RshKfSkfGDODmMCASZvru
 B9cyljOFA5yxKpOdEDaukkhQR17u8+16Niado+pgtIYHWQRow7PiTW+JUWlIdttTGgm9
 6FDh8SJNUf90+MkPdsaLwAQnvplEg+P5DVgYIoLaeNp7xTUu61l7pbqBRxMHmsfB+Cge
 SIsIq9Uf6ZjCPI2Eah+Tg6VBeQQqb7ZkAeYb6rx+4op8nSKjfXdfeo4ji2qQN2dsarQ9
 j8K7+mnuZ/EEEw6RFw/Ju7JEuq0mPy/tvOHD2OUP6N3Kesc9G42ifLT0ED+BRukYUTFW
 CSsA==
X-Gm-Message-State: APjAAAUAdkWWSJULK7KKh1CdzqH2FmadG23bt0M+lq8oyZ0plS9QqXM4
 LASP/riD5HNDu/DnNvUf74E=
X-Google-Smtp-Source: APXvYqxSWRdEetOO9rdBh6dwRIvS0TwUFNsmxGHFF/xMjwa0NsNE/kuxg6NHv39XUHNbV8/+EtklfA==
X-Received: by 2002:a7b:c1c1:: with SMTP id a1mr2147847wmj.31.1565688728671;
 Tue, 13 Aug 2019 02:32:08 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id 7sm764396wmj.46.2019.08.13.02.32.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 02:32:07 -0700 (PDT)
Date: Tue, 13 Aug 2019 11:32:06 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 4/4] drm/arm: drop use of drmP.h
Message-ID: <20190813093206.GD1137@ulmo>
References: <20190804094132.29463-1-sam@ravnborg.org>
 <20190804094132.29463-5-sam@ravnborg.org>
MIME-Version: 1.0
In-Reply-To: <20190804094132.29463-5-sam@ravnborg.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=UcvInRPxhVPxd4rLj2PRIjLeuLAuo1BMJomTbF71gp0=;
 b=UQYFCXAQF7p1dgQT6EY8fMt10Q9O3ss5xWgZ0QfTqrCTfnH1XijhdaAz7WwfC514uR
 XB0ZSNJQgIeocNKhpPmIFVNkVPVfraZYyq7dxV9J4kGK5c9aFEV0/lWL8i1smOGOeJaL
 2PcXYdJTMqxYcxuttzuSZTf60E6OwMVwPA1YV8NrPhHT3WA/B29Hv4eJEvWjo60uU2xz
 tbMAQT20yKXYy2lPbjHyn9zSKvaCTmUeSuaXR2EDOUxGx6J9GZdWLZ+F0IuHWIjxJDdr
 bOvRjddB598UfY+DjzQRfGVR1eKvafG01QuqMeFNv9HltUFvYbLRolkCK1MSMW+1aMGm
 yFkA==
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>, malidp@foss.arm.com,
 linux-tegra@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1182468209=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1182468209==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="d01dLTUuW90fS44H"
Content-Disposition: inline


--d01dLTUuW90fS44H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 04, 2019 at 11:41:32AM +0200, Sam Ravnborg wrote:
> Drop use of the deprecated drmP.h header file.
>=20
> While touching the list of include files divide them
> into blocks and sort within each block.
> Fix fallout.
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Brian Starkey <brian.starkey@arm.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: malidp@foss.arm.com
> ---
>  drivers/gpu/drm/arm/hdlcd_crtc.c    | 12 +++++++-----
>  drivers/gpu/drm/arm/hdlcd_drv.c     |  7 ++++++-
>  drivers/gpu/drm/arm/malidp_crtc.c   | 11 +++++++----
>  drivers/gpu/drm/arm/malidp_drv.c    |  8 +++++---
>  drivers/gpu/drm/arm/malidp_drv.h    |  7 ++++---
>  drivers/gpu/drm/arm/malidp_hw.c     |  7 ++++++-
>  drivers/gpu/drm/arm/malidp_mw.c     |  5 +++--
>  drivers/gpu/drm/arm/malidp_planes.c |  4 +++-
>  8 files changed, 41 insertions(+), 20 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--d01dLTUuW90fS44H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1Sg5YACgkQ3SOs138+
s6Fs2xAAqLGJmyz6F+rOaFcn9Ez+mhclecpsSlv5Esq/+fgT4K0trcLiSRWYDXf4
bJ495+LE3FIUcH4pZNSoz448NUmtf8+xjn7oWKCmDwdLiapDlmTWlj51N7OkXwz9
AJhEbO9GjMKLQE5assDzuCQvM2j28trJtWdgAVRdM1LR6Fmk+htTerRtMDZ+M8v1
0QSpU/LUgLIZkEJro3QfTZJ2fykspIx867EdXzQj8pNPQn099/Hfp0PKgP/80wby
fwFUm4ogYkSQhLPloAPPAMYdi7rQ0qM0ljBMVG6zJJ60xlkImB52ELMLekGj+gUo
1T/l9nYvArCXDty0yh0kTHldGT944tovU7qzU/0NJXequ8CxNAmWtUoiEPODcuEJ
aAE6ZVbWod16u0QEUoxA862+LwKawuCizJVx3J0ZIUPaRuwLdkx/XBk8UY0kY9En
CKrIG8IADXCf64mH+5QDHDMuBP/cgozrkmMe3n8plvv/I4Cs9dtXQS7Zj160zuTs
MAdXv4k1s7GD3BaHWWU6at1Silpr33Mo2K778HNz2fn7XDq1Tz7YVxSxP6JkMaCa
9+39azA9OoOaJkmv9QeprmtuOKMG8ZtpOe7C/LcsvWosuGbCGdPxWMXWYiylfnxr
w957JO8qHNKa6JTjNpF01wJgi/dFmQrebaY5BE5WwPOIiXtTHaI=
=IV8Y
-----END PGP SIGNATURE-----

--d01dLTUuW90fS44H--

--===============1182468209==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1182468209==--
