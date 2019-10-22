Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F98DFFDB
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 10:44:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF36F6E45E;
	Tue, 22 Oct 2019 08:44:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A13C86E45E
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 08:44:27 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id v9so5771632wrq.5
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 01:44:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=w9hE3H2QqcKC0k4cAF5UP1zSQ3qEgbtQSjagp+w7kTY=;
 b=SCOiGNRfSmncRo8jddRdB2O7p6NFqrf4II9znyvzAMdNru/A1kNTSBwF+wCq6mJ7OW
 SWvgjhaxtugNSpEPwuscYCvGoZqMb7xZg9F8NVeLer2XcfJxG3tUU5n0KiITq8IKGssy
 YwFLq6Lpu6zWzBOABoTV6Gfm6ysOPBVo5U5x4vID82biIvrh1rHGsfzNQTVVkXaV97Ye
 atVnjF6qFE49L1nsmQpwijYERBFqxRvdoeas4CYX5qtMb8Gajf3Pt13T2ouEYR/HaZBM
 v3191LML4/Rcw1DRmwYYuspfzsWCuSr08Z3hpUx1f431tNNo1rbxoPIh1mObcG3yA3ow
 dJag==
X-Gm-Message-State: APjAAAWueZ65acxKCvJc1iLnUbAhbPejGMQwg1f7hMUPhNVdcF0J9CPd
 Bs1+4RgR3l0g2s2GIFN0gc8=
X-Google-Smtp-Source: APXvYqxb9CtmaeKXSI41YCIJ6lDnZcFZzJDQW1jQX5COHVXCfaamJPNMfbN8l+Cb+uDVwQu+IPUUcQ==
X-Received: by 2002:adf:eec4:: with SMTP id a4mr2331771wrp.38.1571733866143;
 Tue, 22 Oct 2019 01:44:26 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id r27sm31936247wrc.55.2019.10.22.01.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 01:44:24 -0700 (PDT)
Date: Tue, 22 Oct 2019 10:44:23 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/scdc: Fix typo in bit definition of SCDC_STATUS_FLAGS
Message-ID: <20191022084423.GB1531961@ulmo>
References: <20191016123342.19119-1-patrik.r.jakobsson@gmail.com>
 <87lftdfb4c.fsf@intel.com>
MIME-Version: 1.0
In-Reply-To: <87lftdfb4c.fsf@intel.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=w9hE3H2QqcKC0k4cAF5UP1zSQ3qEgbtQSjagp+w7kTY=;
 b=Mw/Pn5GBAg50VeKizp3ggQBlLa29y4QBd34pwIlWgxuB1CnU7Bv+6Y23h4VW6aBJtz
 SPfSQnHVEOQG1qM8h4gB/p2SrP+ycwUxTkhF7kxdB3njZFq4Etuwp80cmJIzXC1IYDsq
 1AmADuJ7ApPdGp1/jOsLTPQIqHIHHKtk7fkpqLfMzSAk6BoDFDJiLAYhuQRDUOIMffOw
 FK1eCm+6iPpdydn2NsXcSolat6gk7uy3jp2XUdf/mNKIZtwVh6V7JTcsZAvLCqIyOTOR
 YKIVhfOppkBJaxnY1KqrXwJ/IyCiNoSU+wHYFebLK0Gje39GJIqyyR5GYaXKZjgkaZwO
 8udQ==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <treding@nvidia.com>,
 Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============1598786619=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1598786619==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oLBj+sq0vYjzfsbl"
Content-Disposition: inline


--oLBj+sq0vYjzfsbl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2019 at 11:16:51AM +0300, Jani Nikula wrote:
> On Wed, 16 Oct 2019, Patrik Jakobsson <patrik.r.jakobsson@gmail.com> wrot=
e:
> > Fix typo where bits got compared (x < y) instead of shifted (x << y).
>=20
> Fixes: 3ad33ae2bc80 ("drm: Add SCDC helpers")
> Cc: Thierry Reding <treding@nvidia.com>

I'm not sure we really need the Fixes: tag here. These defines aren't
used anywhere, so technically there's no bug.

Thierry

>=20
> > Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> > ---
> >  include/drm/drm_scdc_helper.h | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/include/drm/drm_scdc_helper.h b/include/drm/drm_scdc_helpe=
r.h
> > index f92eb2094d6b..6a483533aae4 100644
> > --- a/include/drm/drm_scdc_helper.h
> > +++ b/include/drm/drm_scdc_helper.h
> > @@ -50,9 +50,9 @@
> >  #define  SCDC_READ_REQUEST_ENABLE (1 << 0)
> > =20
> >  #define SCDC_STATUS_FLAGS_0 0x40
> > -#define  SCDC_CH2_LOCK (1 < 3)
> > -#define  SCDC_CH1_LOCK (1 < 2)
> > -#define  SCDC_CH0_LOCK (1 < 1)
> > +#define  SCDC_CH2_LOCK (1 << 3)
> > +#define  SCDC_CH1_LOCK (1 << 2)
> > +#define  SCDC_CH0_LOCK (1 << 1)
> >  #define  SCDC_CH_LOCK_MASK (SCDC_CH2_LOCK | SCDC_CH1_LOCK | SCDC_CH0_L=
OCK)
> >  #define  SCDC_CLOCK_DETECT (1 << 0)
>=20
> --=20
> Jani Nikula, Intel Open Source Graphics Center
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--oLBj+sq0vYjzfsbl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2uwWcACgkQ3SOs138+
s6F4VQ/9Fh26YyxOGOPt6U2FJ+9WXA66c18kbCj663XQekyTjTlDa1/TirKGwiTz
XMN3mpwKhTjK0UXga841fW5yiGqlIHHWtNLcgOFnZxlryc1YX70ZcHVoNMZfrDsL
iRxgkuHhvLcPc3UpBmG2zCK84a0kqw7xEQlrd31erUpOWHrZKUruw1EoefzqTsx1
nT/6Yw3BZNpzb6qilOAqdK98aTdE08wzeAFPbwXOfI2ZdcGWhWbE9zyAMb6Rt9BM
TADOW2MkrkCaRZ6pUd/xTrd6d9SHAymGBd8tN97Q4kL4C8aXO8zZi2MZO1QIIrcr
Vtq2Q8jMNiQEswZ/NN3/5lnDxtVl/pjuiBB7rOuuZUi7pEopgArL24OoeM4LZN95
3Ejt/bhnhHd6yd18l0Yvu3GEZwS+1TAHZ3hdMUHuVTK0K/bqgo8xPm34SO/ECbUj
B7zAIQ6HPc5YFpL+AHoRoJdAsHVPjqeIWeJi25aMhBo8H7EU0xoYg83Uro7/maoy
3VCv25JHyGXyUvRjy37rDwJ04lN8rlarzTISOz2et8VOlON94isov0fW6E3GU4fX
efEKbnJqqcc5xAsOTO1QWvonKTpFjcwC77dlDouA8vhEbc+wLxbC25RbbX+vjKTS
wn2b0eSfJPEFB6dRP91ouHvojJYQuJgtzpa7TddCOM4+7pIV9RU=
=Vn4o
-----END PGP SIGNATURE-----

--oLBj+sq0vYjzfsbl--

--===============1598786619==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1598786619==--
