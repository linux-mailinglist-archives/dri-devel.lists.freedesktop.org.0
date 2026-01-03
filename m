Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD29CCF04D3
	for <lists+dri-devel@lfdr.de>; Sat, 03 Jan 2026 20:18:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C86E110E371;
	Sat,  3 Jan 2026 19:18:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.b="AZwX3MlF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic317-20.consmr.mail.gq1.yahoo.com
 (sonic317-20.consmr.mail.gq1.yahoo.com [98.137.66.146])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 361DF10E371
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Jan 2026 19:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1767467934; bh=rV8nhgFwLm9CsQa6A1WJnzVdm0VnDON9EKbC2joBXXA=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=AZwX3MlFE56IS6xL8bwLYUiONfFKtMp4+xP4Tpi3fbURGjP8D5Wd11Qj1dzVvNyIDLS4QyoXwHirGlOqXM6kHKbTdZ0Ai9nYrrvXWgxPHmIFuhSXMZJ0SsNAkepUuiwlnuyjdXop0qweTvXfV+jYS4FVkpSceF4V/wd7w9XOV3irnlkcYZKYaNTWu6l5268JuLLwOvc8ViZc+xgvzOM8pcPGoA3g74RUKQOfrR4OMMmp89jQNZyET7sAbHN+fwGNxpkVidJ6NNg28LdHzew5uoEQG05nH1v4Gfu5gjecq9ZL9NaWYsKwg4ldf5Hsx1GowpbrY2Kf7aDcCPs4yRDMkg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1767467934; bh=XzrvGpwxWHm5owNeJZ/tzlxK4zeGbmF7Fq7e6Ocjisb=;
 h=X-Sonic-MF:Subject:From:To:Date:From:Subject;
 b=NzYbYhfGMym+15zKguVGvliSx/FEyaRRmUcqO92AwzoQ8V39XUHPUPWdViqM2gFs8HEKOaMywi0y2A8JwhOo1jLcV51g1wHPDAOrLX4598gOGeCYeljTmPOqqPf9MGFvDBNxOIfZjAM8EaKbpGLW5vZd+y+fmWK4AfgC0rIpaCvDzDx/neTeNQsQtkDXR4a5VXo+z/6DVFtd6EvQ5iESbWMvYJ6igwsaXSI8Y95lC21tGvYX8/0oBvBfBu3E88Kk+yUOk7D4Kxf+z9Q7e9SjW8dZN3N2LMcYpKA14L+asEHroRxJXBN0hfkGKj2GQIO0V+s9pbXh0KutyaIKuwK+hA==
X-YMail-OSG: uj81TqgVM1msIxNoExZDvH2z6GEFQLJ_C_F3o2dPm9RG515A0KcS2umbWkGEf9z
 StgsmT1qjWbYVSPF7PhvGhUWV9DplP1b9NJqB3eJfkMW4snNOI.oetQxlP1mecJ7KtBNGEmWmOzJ
 h5MGSwAxkGdI.a2PEQZbqV4SkmavdqkycHUsIRwjqqXTULbbS6h6RSzWuxlEDbueyCeEldyOYwa8
 0O1yxBhbn7S8hr5.pL1_DBgB5jnsslVbRNb7vBEAu1hMfPaqFGcr6GUmsTvY_eNyQpsPqgnOqryZ
 XmHLeiBJFdnQ5qjxWAob11bJd1f9hIEopaVZ5yNdr5s1oZEb1aEfLwjzZTQzyrCLr8kDGjJqmfLB
 PE.K03Psvssongw3DLjUGdlUZPscHWP73Nu09M4rZml_4pgT0cp4JPEGeBdwxYZb1JV.DqfxaonX
 VlBsWe6Q33ZRbi6k5L4KzT45bBsJ4FFz7gtrvYZsR1b0WwBR7REHwRLaMpxZTXYGtEEclkWiByDm
 vAMUdlNl5o5_jOs4G0pZU8_gcGbKam4341dWHwyy.16h5tV3JbGBV7RAVQxyV1MXMn1i9d54VZXl
 Ok4XqUaDcQyUlJUyJxpdIPAUJSV0u.SaJFwuU5qzDLp382dm8KZdMXfjyKyW9wn0aRAJuqAaYASJ
 NjsDE8oG3Gozn5rpr2_fuO8lDwArAtwJreHhjbUQD8Db2bF1oxwPWw9MwKeIeEACzqbHTcL2MoWm
 2AD6_ovHaOt_xhQerA2YEoZToM.JUyzgz07IPCDSq4vmBFDKF3HwLEpSjLmsQ5Yxq8.ndhE8tDWs
 oJaNZBndrSauGfyHCrlR__1h9YFKo9UhN.P5Szhb.hPuqT5d82m_VBbJVIYV8jwlS7T4oxUBIo6m
 Di_SrlytsicD8rWXQBCtJ.IaJQzttTKJKTIzyRwGOt.q41X6WsfYjzWbOA.sMttcKTX1BSea7XHo
 jxWh_Kqoy.SQfp8MdzqzVjeJxTDsy6oge59NXBTSA7FWImf0TM60sItoVxSKCRWVuFyJ6QLi7wKZ
 xsjJm4e.xfR3r_LCCBnPYWV1EFchgTxxyDNnlrxAmofSiXlvOxumuU6wncrDGGagU2bl75qNbqaN
 Cm.Bm5ygoIZCX_cOwdfTp6NxtLSdC3_ZLLNxn8vetrTK2VlaCiPDOHRDQ8qy.VhMMD_K3G7JQhvu
 2yEab_8KbRiN9ISuh7skH_uiPg5gq5SNHNJgLeCgNp_Kad_Id3QIKwXoK_R7_U.57MJfBwYjJKJi
 ICTtKiRTYQ.0W7D1iDTMupbeVbFL9VINA391RCjkDGsjsN_XLr0DaNoX8xiowKF6ENRANvriSsqd
 s43q5TCYFTF.S4bUFbb21qGJjz.3qQbAlUFtV1bnwoZcaSDd3P2WmfC73Nvd3eekpB1l6NI.stDE
 i1Z.00l2ToFVTP9r9B35FAY.KTHWcOa1syGlG73NJAQRoqk0FZMH2dNqh_zjPXRY4RCTG9fXpIEs
 gY52vS_6WrBJEzDcsNIGvrPBmRRkKCXR6JeXw.86oImyF7SGslmh9Ft8dcdkYTcIklY.UDn0yjry
 IBG0TGNzu1s1XpsXr9EPWwMr5LSgDx_sQARqNOMhYd3Jig0MP7J0YMR.NnTxWNMgveA4XQ8D3m6x
 0fVcyxTjLPCeAAj_BlysL965AEdJmmBCeV2sXJiD5Wpm6o8xXgGJ1aWMRvuYqLQ15JIYD7vrJg1T
 A9oJoZmfqHUN816wuqPxc42i_Xg0b8DjEDFj0pgY7UB.Vh2ytG0S6pLPdnbHGOhCXgCp4Q72fbBm
 QOHBIlTJ3Xdx1dXZOwV6w98TExS9eNHffOtSmMFrLZ2b8M0LiHIBtWr0bx1y9XDNojadZZYIAppr
 SUUzNlsCbsF8lLOuaFl6N85NMjFWTvxATZ__UWLNJHHWjpol4MnqsQr7nZa0XLjLpKkkvcutHVZu
 s4Otc7V23rwjcyejXK8M18KtAKCdcxJ2WxqM9.S5pnFHf7RvYYQettGa7Zn3Pz2zXhk0RFYLk8So
 N1Ex5pNDH5iNCEgVGs4F6ipzdgOV1xyUQWxna.NE.r8MhXrd6Ir52NukP8ADIrDA4jOsvHqdp4CQ
 ON2vOTdcnDCATEld7_RlTr7W3eJ11Y78qrJyHAF6q5s8JHzz0pAnUtLJvYoGc4L1_vk_qVLC3cwO
 OMGTMN4YVmH8FSoZTldjJCdwLefFFQFaQytQ1RdS3feSiYTBIhEyt.KjoPa0YgGgQp32AplTZKRx
 Fjvtt2PzFSAay4aiz_9AJCylOczSNEif.4dOt.Y7S8tULg1yvjjkO5Ss-
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: f2cbf5ef-c190-454f-a7dd-666998797854
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic317.consmr.mail.gq1.yahoo.com with HTTP; Sat, 3 Jan 2026 19:18:54 +0000
Received: by hermes--production-ir2-7679c5bc-vtpmw (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID dca98cb9a25cba8006913e0c4d2abfe6; 
 Sat, 03 Jan 2026 19:18:47 +0000 (UTC)
Message-ID: <571d40f4d3150e61dfb5d2beccdf5c40f3b5be2c.camel@aol.com>
Subject: Re: [PATCH] drm/gud: fix NULL fb and crtc dereferences on USB
 disconnect
From: Ruben Wauters <rubenru09@aol.com>
To: Shenghao Yang <me@shenghaoyang.info>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
Date: Sat, 03 Jan 2026 19:18:40 +0000
In-Reply-To: <938b5e8e-b849-4d12-8ee2-98312094fc1e@shenghaoyang.info>
References: <20251231055039.44266-1-me@shenghaoyang.info>
 <28c39f1979452b24ddde4de97e60ca721334eb49.camel@aol.com>
 <938b5e8e-b849-4d12-8ee2-98312094fc1e@shenghaoyang.info>
Autocrypt: addr=rubenru09@aol.com; prefer-encrypt=mutual;
 keydata=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
 eIvzsqg==
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-FUXfOWWY/sgXU15/GPcm"
User-Agent: Evolution 3.56.2 
MIME-Version: 1.0
X-Mailer: WebService/1.1.24866
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
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


--=-FUXfOWWY/sgXU15/GPcm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Sun, 2026-01-04 at 01:47 +0800, Shenghao Yang wrote:
> Hi Ruben,
>=20
> On 4/1/26 01:23, Ruben Wauters wrote:
>=20
> > With the elimination of these two WARN_ON_ONCEs, it's possible that
> > crtc_state may not be assigned below, and therefore may be read/passed
> > to functions when it is NULL (e.g. line 488). Either protection for a
> > null crtc_state should be added to the rest of the function, or the
> > function shouldn't continue if crtc is NULL.
> >=20
> > Ruben
> > > -	crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
> > > -
> > > -	mode =3D &crtc_state->mode;
> > > +	if (crtc)
> > > +		crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
> > > =20
> > >  	ret =3D drm_atomic_helper_check_plane_state(new_plane_state, crtc_s=
tate,
> > >  						  DRM_PLANE_NO_SCALING,
> > > @@ -492,6 +485,9 @@ int gud_plane_atomic_check(struct drm_plane *plan=
e,
> > >  	if (old_plane_state->rotation !=3D new_plane_state->rotation)
> > >  		crtc_state->mode_changed =3D true;
> > > =20
> > > +	mode =3D &crtc_state->mode;
> > > +	format =3D fb->format;
>=20
> Yup - in this case I'm relying on drm_atomic_helper_check_plane_state()
> bailing out early after seeing that fb is NULL (since a NULL crtc should
> imply no fb) and setting plane_state->visible to false.
>=20
> That would cause an early return in gud_plane_atomic_check() without
> dereferencing crtc_state.

This does work, however this ends up returning 0, which implies that
the atomic check succeded. In my opinion in this case, -EINVAL should
be returned, as both the crtc and fb don't exist, therefore the check
should not succeed. I would personally prefer a more explicit check
that does return -EINVAL instead of 0 from
drm_atomic_helper_check_planes()

As a side note, I'm not sure if there's a reasoning as to why
drm_atomic_helper_check_planes() returns 0 if fb is NULL instead of=C2=A0
-EINVAL, I'm assuming it's not designed to come across this specific
case. Either way it's not too much of an issue but maybe one of the drm
maintainers can clarify why it's this way.

Ruben
>=20
> Would a more explicit check be preferred?
>=20
> Thanks,
>=20
> Shenghao

--=-FUXfOWWY/sgXU15/GPcm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE3obNNdPQ9V5CQi2Y0n5QwFCuDOEFAmlZa5AACgkQ0n5QwFCu
DOEJ1BAAmiF03JOa43P2kFBwS7a4ANrJnWsjhIEPB1D89e2dqgSFp/i6pFTADHsR
42B0PC4u6gPKaxNLrsuO0Lj6xcw6v9f/mdL5LLghnxXu7QjsOtZVzYCfCh076gha
c2LdxPMS10edDMPxW9Yf7MzEKagbQVGMnFeU9IMN178miHkErjO/QI+giN5v86xL
4+QQwXj8bHVlfNDDMsM+4kP4Lf6/k2/O7E2MAc0H2r5oOtOaUTyCQyuhI0InoRMu
xn/0petTQlWY6ibemmJ1Tl2EUYHQS4M/UciJ4msaTqyRSlvvLRNH98C1/ivZbKCy
KR6/wD0ybZIui5wQe8pMb1c+xMv5dzBSqt1fM+/rLR4OC5OFl2QtxCZVo7Z+LUyY
sYm1HQp1CyJscBEmxf7owf+mJvXjt4RN88B99ScViqu7JEvtwA/hun4gv9WKKwXN
RlLdVFvmkvFp5+5HNIJcK4NpmhW86i0y9oSCH3Pi5+0uo57V39j9ENW1IrHloi8D
mJHwEfE8KRfr79wVT9zIcHCOLTgGCmtpkEBGj6wMy6BVY/bJIXJ59rKP6j1UDz5h
IaWPMipOci+hans2mLrKThA9Ad6xCSaWz0qKAJlTiERJ17QMDta1qvpBaW3wVXRS
oe305MhAPTokzMa1+qtaT6j5DTCUGkEt6dZstRCjpcjkTuglQ1I=
=iQKL
-----END PGP SIGNATURE-----

--=-FUXfOWWY/sgXU15/GPcm--
