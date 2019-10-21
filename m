Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5B9DE5EB
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 10:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 919F889B01;
	Mon, 21 Oct 2019 08:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2B889B01
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 08:08:13 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r1so2920039wrs.9
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 01:08:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NghHs0Mvsoy978WzleX6gwFFJXrhagm/E4p9zxnyfWQ=;
 b=C9LK8Y42h5Hqo8/Ujs+evGZ3V05nzuTycDu0VzboElCOlXfKEqaCeyp/Izjcl83UYA
 lEwsnAHYMQPaCZdolQppz26/prDcWA+eUypynUDF9pC+3LltMwJ2asQ9wIOE04xRqJXh
 jOA4IYdF6svv53CmB4Iym24qXILmW97tyUS8dBqHYqzqNWbLCKSZ904SiBHzracspL+o
 w/S41tZEj4T38r2vZEZGvvjaEBrG3K8OK03FwlI5+Axg5IQKbHwL5zad1YYetttzbVum
 7MrkzVRP6xhCrWXbiUKoo1OPnNYu0+F+vAS6gx80YWaxsRZhyub4l9yVmfHygDoosHRv
 ThxQ==
X-Gm-Message-State: APjAAAUVaDOdm6McElRgc4gWNxW9CvZYO2pNAFhQ/4PLJ0ZqDk2MXT/D
 UBc19smRpFE6oqVg/zFP2Zk=
X-Google-Smtp-Source: APXvYqz1bJ2fhW93JQIMLNR5ICs3KrqaXDLPdKiTQLnJgMmR/E/py6mQ9p1LgS/P766goGB/75++gQ==
X-Received: by 2002:a5d:6b0a:: with SMTP id v10mr17481783wrw.32.1571645291736; 
 Mon, 21 Oct 2019 01:08:11 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id v6sm17029317wru.72.2019.10.21.01.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 01:08:10 -0700 (PDT)
Date: Mon, 21 Oct 2019 10:08:08 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 08/15] drm/dp: Use drm_dp_aux_rd_interval()
Message-ID: <20191021080808.GC1118266@ulmo>
References: <20191015143509.1104985-1-thierry.reding@gmail.com>
 <20191015143509.1104985-9-thierry.reding@gmail.com>
 <46be9f324facaa8afb8dae4bd5fdb16227ff8c67.camel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <46be9f324facaa8afb8dae4bd5fdb16227ff8c67.camel@redhat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=NghHs0Mvsoy978WzleX6gwFFJXrhagm/E4p9zxnyfWQ=;
 b=ZaYEoEKyOM0+ee9M29Af7RaSsSZrwoHsva4v4O2DhEvMKrUNQnHtd9Rk8KOwkexq5L
 BWf6CTyJ9S8Btx6gl3AYaNDCtAR4FIku67NXPphVhvYNFB+vnB/azmWRVJNi8GZnImej
 pCNMkx2zEF+Ch5KOEcIcUUOE1n6kDos0hntMeZPX+s2g84o81TSizLKQHi9SyWs7FhnC
 irZX+suPyPK65BM7vn1NF3lUSf2M6fVu4HZYRju1y4bDHhELzO5VsSu00tHXb93mffSl
 Yn1u4Jon4/Y1x74ko4U0nYQ7Tj2TmJ0Uv+oyPOAFtepQjDdoOsq6ygcrPzcW73+3a2b+
 QINw==
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1092413775=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1092413775==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="da4uJneut+ArUgXk"
Content-Disposition: inline


--da4uJneut+ArUgXk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2019 at 05:33:12PM -0400, Lyude Paul wrote:
> This also seems like maybe it should just go into the previous patch?

I suppose they could both be merged, but I think it's better to keep
them separate. In fact, I'm having second thoughts about the new helper
because it doesn't really take into account all the special cases. For
example, the patch below will use the value returned from the helper
independent of context, whereas according to the specification the value
is different if used for clock recovery (100 us) or if it is used for
channel equalization (400 us).

Perhaps a better order would be for the "do not busy loop" patch to go
first and then introduce the new helper and finally use the new helper
(along with the signed -> unsigned change) in a third patch while taking
care of using the right values all the time.

I'll respin these patches and send out the fixes in a v2.

Thierry

> On Tue, 2019-10-15 at 16:35 +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Make use of the newly added drm_dp_aux_rd_interval() helper in existing
> > DP link training helpers.
> >=20
> > v2: drop stale sentence from commit message (Philipp Zabel)
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/gpu/drm/drm_dp_helper.c | 26 +++-----------------------
> >  1 file changed, 3 insertions(+), 23 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_dp_helper.c
> > b/drivers/gpu/drm/drm_dp_helper.c
> > index ad2671d2ee8f..4b66010771fa 100644
> > --- a/drivers/gpu/drm/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/drm_dp_helper.c
> > @@ -122,17 +122,7 @@ EXPORT_SYMBOL(drm_dp_get_adjust_request_pre_emphas=
is);
> > =20
> >  void drm_dp_link_train_clock_recovery_delay(const u8
> > dpcd[DP_RECEIVER_CAP_SIZE])
> >  {
> > -	unsigned int rd_interval =3D dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
> > -					DP_TRAINING_AUX_RD_MASK;
> > -
> > -	if (rd_interval > 4)
> > -		DRM_DEBUG_KMS("AUX interval %u, out of range (max 4)\n",
> > -			      rd_interval);
> > -
> > -	if (rd_interval =3D=3D 0 || dpcd[DP_DPCD_REV] >=3D DP_DPCD_REV_14)
> > -		rd_interval =3D 100;
> > -	else
> > -		rd_interval *=3D 4 * USEC_PER_MSEC;
> > +	unsigned int rd_interval =3D drm_dp_aux_rd_interval(dpcd);
> > =20
> >  	usleep_range(rd_interval, rd_interval * 2);
> >  }
> > @@ -140,19 +130,9 @@ EXPORT_SYMBOL(drm_dp_link_train_clock_recovery_del=
ay);
> > =20
> >  void drm_dp_link_train_channel_eq_delay(const u8
> > dpcd[DP_RECEIVER_CAP_SIZE])
> >  {
> > -	unsigned int rd_interval =3D dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
> > -					DP_TRAINING_AUX_RD_MASK;
> > -
> > -	if (rd_interval > 4)
> > -		DRM_DEBUG_KMS("AUX interval %u, out of range (max 4)\n",
> > -			      rd_interval);
> > +	unsigned int min =3D drm_dp_aux_rd_interval(dpcd);
> > =20
> > -	if (rd_interval =3D=3D 0)
> > -		rd_interval =3D 400;
> > -	else
> > -		rd_interval *=3D 4 * USEC_PER_MSEC;
> > -
> > -	usleep_range(rd_interval, rd_interval * 2);
> > +	usleep_range(min, min * 2);
> >  }
> >  EXPORT_SYMBOL(drm_dp_link_train_channel_eq_delay);
> > =20
> --=20
> Cheers,
> 	Lyude Paul
>=20

--da4uJneut+ArUgXk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2tZ2gACgkQ3SOs138+
s6FG5w//Tk+FcHUqNsmYAhqfYQpXd0G9n6dYND6L22eNREldoP1hLGn8d32kNf2O
z3wETLOvG2yChUSEYGiF3VUvjtHMVvQIxvcLwHJCtSNduRAiUw4Y1Qk7sNextwRi
0VJYO647pItiQHpuSp/Uc8OLAmfAcTLFMoew/tqrGW3/wv2zFrw3BEsJFUK853/6
bBv+F4Kgx2Pi70UjdFnyW6Xag/g6sAOLmfDhJt/rRD7/S8Mb4FVPgbwlkGOwLiKt
9GrKGIDJZLWRevDWBUUX/ytIIK4xIXFzMAjZPgveB3MpPLOTKR2lFX9ojIS6yyr2
fJtEykAYVfGFaSY+eZsprHehciIzACo/c1lpOt+X/G1g/dyJQZZAWcPc9+ohWuy5
0NykFaaI49vPq8EGDzrlxe5FCVG1HLLtnKqTorv7cay56MCwZUPH2llqggzLo0VP
49zP6caiROI61F044ClI7HkQX3aixYSC2DpyvgeQKAJUPeCG0vBAlAMIdOBMmyKH
hu9TbYtDihAo/2b3rQqgWQ2+YJsxYmOpiadk+44PjAQgHSy2UF/P6c/1SgUpGMYc
t2XPi0xkvrlHtt4O/SrImnkJGR8N6m8SMUYXCiH8YYEEJftRkObxECKNnbYIqMc/
/XdznxzoWYSiOJjQ7XQvHkRYDBYJN1FL1jppvjOw0bcfVnPXGuk=
=PlmK
-----END PGP SIGNATURE-----

--da4uJneut+ArUgXk--

--===============1092413775==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1092413775==--
