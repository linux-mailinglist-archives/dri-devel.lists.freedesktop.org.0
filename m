Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08989CFE736
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 16:03:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B0210E5F3;
	Wed,  7 Jan 2026 15:02:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.b="O3qMSD6t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic312-23.consmr.mail.gq1.yahoo.com
 (sonic312-23.consmr.mail.gq1.yahoo.com [98.137.69.204])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA6C10E5F3
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 15:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1767798177; bh=U1kjft9FnfgOthNmEaDaBmsqBC4lDNW5o4IYMMkhgqA=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=O3qMSD6t6e5+NYlbWCE/2YWKFv0bX+VfPa+KR97Gspp+XQHwghLLBDXDUV/CTRxl6m6opgTNkfghSPs3lrOvCMpAUKk4WgPELnGdmsuTLxE9DsXhbOLAfMrLcL6/hEqwrhOnYwR0JkL2ijS/7N2kpRlYVyCe4IwQtH4wAOL/KCMzBq6+pRoPYAy56A4gbXbWq4wobY8vzo1Tp51+3uxk9dcFr6g+rrTRwI5Jly2QxkRviCxFllMpmEdaujG/cmPEFCFl+NvaW9srw3dD80oFwfnPKwNlfOahAZMh+HQETpZIcmOyjaDzB5rtfWf/lrjPE8HCBjXQO2bIL+l7LTGOaA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1767798177; bh=tB/XgidRlcDrLb0t434GrXOWz4//8T7r5+NwFWE+mo3=;
 h=X-Sonic-MF:Subject:From:To:Date:From:Subject;
 b=fMNlOeCkV1LhFM1GMRTtXjI3jX92cXVk+JonL2PLI6d/eRKErhhSBlxwelV+MTthDF3T9q/gSNECjtYBevDQNOfVrrhytxGNOAatZ+FWrcVcZ3qZy9lYYLneRJlr8f80fevqPs0U3EYAcbDR1if1DOGo6PESuo/0XrmLVMvJUENEhC9NxbiiMh7Biq/05RuJRagvNVm8jICkBjPn0v0gpLdqs4b7OGF2Yd7Wnw+krM0doFjY/clPnTjLnBR5wbrvfTDHpUgVIlnCHtO1gOtAno3fHM4Shz/DxhVuOxOG4LuH9JoZeyGND+tNwMQtzxy+J62WHCKKXV7tsrD1mqZHqg==
X-YMail-OSG: Jx0Dho0VM1lSRskcvlbFdrHONNkI2KISNRxHKxVQRDsnPYFoQj8VbFdY.N7aC_J
 ezOrj4OuiM9L.hXfAG2btXoh4RVuA75an5fFM7amvGlf5NKKZTz8s4GUeRZLgjaFwM_FirZjVb6P
 paYOXIWIB6BJu73oWN7jCdcT3O1HFJogwyS1VHdzVZW8L50DcYsxRWP0xjbkZOkXsoGE.HsVFMSn
 59KkVmfVU3sTItDzPdM8lNcI6hpLXNT3Em7YSoT9QlRdVEHS4x0.vu10n3tuLhz1rTfdFghyOQar
 T1PRMBGM30sRbBcSzTkX1hUSj4I15liepL.52_ziq1QMfy6dOBvSmLJxL2uOnb9h.fSd9AH5zNEm
 8PJeiYeARLK1YYU2_tZn1M2uESVWGcfkHzluj9SxH5DcsjaPq1w6hSLyPMQGMzHQ34z4yrWyJcLA
 .ROQMZeAFfffay6QYqNh6b4c.J8hmUs0ZO8zSbgDoDHl.d_mMBTYSFMuoyTrOp2smxPfZilhGAUB
 2EYJgmwpKXW3iOtTW7O_mCWaFnQ5T4fj2lYxfdrcrs2KRYaR_m8lYcBV.ZQHrXTChizI3pBpzUay
 si6H6yxuGn99c1_0bMCPlZO105M4ROlMKuAyLCRolyTSKWoecVY2ov7RVtrD_WPO48_aSg2Dp_Nd
 04O1viH986wgE.npYqQuuRpjZqmToMbFILhbx4.rqGa0UzjBsWOycZCo_NGAXIP5mcZHA7wvENXU
 U_zdCf1ohDJw88fM6_Wi108B7Scc3I4_elnfw1EziFreUWo6X3te_itgNMSEenX193g9LQjHEZJF
 O4o44zus8NdL_XKvjR_Zw6hx1PYfmJtk3qwNvUqm4HL55NPvydNFQjrFE3exr205ejf0Mp4S8205
 gm260jtO9yT.f3.FQ0SyvtowpOCwfZwZD.RoNrP6GMRmnaGbSzBt6ZdpQYlv_9v_fkNRmUiZza52
 2ku4PhDbOQTqzXJVIa6XCrs8Nj1m7HvsqGMju4Ep49QlnykLK_y7Njs4KUK4AxPf05tI8G92UiCk
 drFpAZVh7mvW9d6w3dHDCG4xbrKwxeYB6Tb7.CKVhEtB6FgMEvm.MkdDy73JkF6nlEfTLKyqAGgk
 AuZnPqMPAwU_ZUMAutOXEXGmBNMtMNNwpupBWc4FW8cn0fNXLbnVW4vHjWNAWd79Jw6b9Rbk0Uwh
 6DfWWbvaLV4XipsPGUS.yWNoVM5VBwqQIVs6iViCuqSbjeCUnucySnEvOWFkY1YfDl1aP2Kl5Oth
 rRFzNzDuiVfF5XFn3duvRa1GgYN_9n_D6yLG339tlH1xIaQbwThYTnvGE7nPkv2OMGElnblgMiiM
 Z_Rc8Db6QJAcWWV6n50.3u8Fmt5lpLvWvjjm_wo5m7K7cowXs1go.7hvriW.4V4m404sV3.krRI3
 82NVrup.rdOgRHck1utWZPytUSQMQq_9eQ7Rw2e0YXi2anL9KN84xDahWNx6WhIZCa7IjaIKIzNZ
 QVHfTaMJVI_HguZfmrJt9voehlTHs5e17dAWWTo8m3GI3MYltZjUcPwFnZH8gtMZjKyBagN0ShF6
 SAuzBwAo5IdSU.3n8ojn.4LbBB7B0J3gihIfMe55jrQ8au9LFnhUYCJ2dF0RSIe1AlWoXY3qd.Nj
 BWQCwhiJBQk3FWfFLP2YTT3amf_5ewMDctUXYLZYuDnwLyhDW2Lhcnos34q7t2pvahWeMW4Mgfco
 XrYjirYBCGQ7QsklBzkb5tON3cwGtiFFUIXZN6tOaNOgwNxkubR_an.q9KwUjEZsNiGYEALl6MLu
 jKOZoPTW0vqeMHw1Dgu4KVmzBROnzmoWIxpbuciFGbNUIfGFJ..4rL3yFb9OIlQWAsVgoMhiP_MB
 dpz3xKeZ23838bUAB7Ex6Tm.ueGIf0KHhDjkeiv6KX.GRM0eBOHvUgBjWsJEpTXUlL6c_EFSSY3a
 Dv5HnX8BeICTNeQLQ_dVgADOvo8A0bH7IHPuOVLlvUve8FBlfkB6bsC.vdUrh4pe3ddH7EeJQ_US
 tOSkOCgxKDygG0LBEZWGPWxJp62y5gNut5oU2g_v.oeG01iikZ_avHKWPPusz5axToU_Bm50mZz9
 V1fgt0F8F9h3S6_GZV11PD6PnUbJHMSeaDenPFB1LWCFM6i15B1XkCDY54FHPY7iJmSwhvvA8grR
 pWUR6ebenVBqGZh56wYsL8qqeNKwQHH9b4UZQGalKLHFPDleth0XoRt7c9pbgsTPsXRr_O5ZAGLy
 LvbqG6.FoGRQvdaH8CwFaL9Mq0BmPxCR8f.5S4J9Cny0RHNBRiXLgyAOz
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: f670a66f-4849-4ccb-89c2-ddb5330717ee
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.gq1.yahoo.com with HTTP; Wed, 7 Jan 2026 15:02:57 +0000
Received: by hermes--production-ir2-7679c5bc-8rzzp (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 03667c1c1dc7f148bf5263a946f54531; 
 Wed, 07 Jan 2026 15:02:54 +0000 (UTC)
Message-ID: <229b5608222595bc69e7ca86509086a14501b2f7.camel@aol.com>
Subject: Re: [PATCH] drm/gud: fix NULL fb and crtc dereferences on USB
 disconnect
From: Ruben Wauters <rubenru09@aol.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Shenghao Yang	
 <me@shenghaoyang.info>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
Date: Wed, 07 Jan 2026 15:02:46 +0000
In-Reply-To: <c6324a66-5886-4fbb-ba7b-fc7782c0f790@suse.de>
References: <20251231055039.44266-1-me@shenghaoyang.info>
 <28c39f1979452b24ddde4de97e60ca721334eb49.camel@aol.com>
 <938b5e8e-b849-4d12-8ee2-98312094fc1e@shenghaoyang.info>
 <571d40f4d3150e61dfb5d2beccdf5c40f3b5be2c.camel@aol.com>
 <c6324a66-5886-4fbb-ba7b-fc7782c0f790@suse.de>
Autocrypt: addr=rubenru09@aol.com; prefer-encrypt=mutual;
 keydata=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
 eIvzsqg==
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-QPSVR4cZj5IOIvv+tsrU"
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


--=-QPSVR4cZj5IOIvv+tsrU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, 2026-01-07 at 08:46 +0100, Thomas Zimmermann wrote:
> Hi Ruben
>=20
> Am 03.01.26 um 20:18 schrieb Ruben Wauters:
> > Hi
> >=20
> > On Sun, 2026-01-04 at 01:47 +0800, Shenghao Yang wrote:
> > > Hi Ruben,
> > >=20
> > > On 4/1/26 01:23, Ruben Wauters wrote:
> > >=20
> > > > With the elimination of these two WARN_ON_ONCEs, it's possible that
> > > > crtc_state may not be assigned below, and therefore may be read/pas=
sed
> > > > to functions when it is NULL (e.g. line 488). Either protection for=
 a
> > > > null crtc_state should be added to the rest of the function, or the
> > > > function shouldn't continue if crtc is NULL.
> > > >=20
> > > > Ruben
> > > > > -	crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
> > > > > -
> > > > > -	mode =3D &crtc_state->mode;
> > > > > +	if (crtc)
> > > > > +		crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
> > > > >  =20
> > > > >   	ret =3D drm_atomic_helper_check_plane_state(new_plane_state, c=
rtc_state,
> > > > >   						  DRM_PLANE_NO_SCALING,
> > > > > @@ -492,6 +485,9 @@ int gud_plane_atomic_check(struct drm_plane *=
plane,
> > > > >   	if (old_plane_state->rotation !=3D new_plane_state->rotation)
> > > > >   		crtc_state->mode_changed =3D true;
> > > > >  =20
> > > > > +	mode =3D &crtc_state->mode;
> > > > > +	format =3D fb->format;
> > > Yup - in this case I'm relying on drm_atomic_helper_check_plane_state=
()
> > > bailing out early after seeing that fb is NULL (since a NULL crtc sho=
uld
> > > imply no fb) and setting plane_state->visible to false.
>=20
> This is correct behavior.
>=20
> > >=20
> > > That would cause an early return in gud_plane_atomic_check() without
> > > dereferencing crtc_state.
> > This does work, however this ends up returning 0, which implies that
> > the atomic check succeded. In my opinion in this case, -EINVAL should
> > be returned, as both the crtc and fb don't exist, therefore the check
> > should not succeed. I would personally prefer a more explicit check
> > that does return -EINVAL instead of 0 from
> > drm_atomic_helper_check_planes()
>=20
> If the plane has been disbabled, fb and crtc are NULL. So this is=20
> correct. drm_atomic_helper_check_plane_state() is the place to do this=
=20
> testing before doing much else in the atomic_check handler. If=20
> drm_atomic_helper_check_plane_state() gives an error, the error should=
=20
> be returns. But if it returns 0 and sets ->visible to false, the=20
> atomic_check should return 0.=C2=A0 That means that the plane can=20
> successfully be disabled.
>=20
> >=20
> > As a side note, I'm not sure if there's a reasoning as to why
> > drm_atomic_helper_check_planes() returns 0 if fb is NULL instead of
> > -EINVAL, I'm assuming it's not designed to come across this specific
> > case. Either way it's not too much of an issue but maybe one of the drm
> > maintainers can clarify why it's this way.
>=20
> Disabling a plane is not an error, but a common operation.

I think I may have misunderstood the drm docs on this, if having crtc
and fb be null and returning 0 then is ok, I am happy for this patch to
be applied. I have tested it and it indeed works, and removes the oops
present in the driver before this.
>=20
> I think the patch is fine and IIRC we have similar logic in other drivers=
.

Reviewed-by: Ruben Wauters <rubenru09@aol.com>

I believe Shenghao mentioned another oops that is present? if so it may
be best to submit that in a separate patch rather than a v2 of this
one.

Ruben
>=20
> Best regards
> Thomas
>=20
> >=20
> > Ruben
> > > Would a more explicit check be preferred?
> > >=20
> > > Thanks,
> > >=20
> > > Shenghao

--=-QPSVR4cZj5IOIvv+tsrU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE3obNNdPQ9V5CQi2Y0n5QwFCuDOEFAmledZcACgkQ0n5QwFCu
DOGRIg//dVH48MOqm/PCntGsr61X08EN7vG3M6BU6GLJIWp3DckhYn+cdh4ql2oo
KOVuR60lTN1P48+brui4OUl/jy/AWo41rVnamFPWG4xKvuNiaoypZjrZ+ivfZsRQ
QLAYqplqN903moluMOpeWmK3cc5vNoIf9mqSKqNfDm1oVBVJc5illc/0zgYEyh5+
S5w6HQGDubK6aNK0SBoBrj7836dVeCIgf9tCaIw/a1qpf17s4RWva/pOwiFwVLsj
aDPdKdfP7+i+xBUdXIZvGTYF0GaKwm+F7NidMscdRtXwp9KTDqLGLXfesVwLcuX+
Yq8BGeRlXTunEMGwhmyelf9WASTLyYABVfmzTXLV/Tu4yeH2M0WdAf7EvaIraF/W
eLOtdiDE6RKM+qgFAfbm/b2AHmeQhD9Vrl4uwp80T6SVjP8wSylLhrdblaoOye9E
OHhP/7CWIWP58HnNlNJFW2ELMCTH6ZWmrV7ROqcjKGD+TtuNTgzsSijOTpjznF9z
6U00pZm3blh9DG3dfpm3S5SoFCn+dh4gPoYpZHjTkYfGCX67mgnp9cA1QgcUPRVA
rAM1Dr4pH6vF7Vb8AaPUF79dLAQx6pnVcAkLr+06viKZ+F/nvRRt51Y7EmeCjkWL
AmD739DPainYbtobfmGU7oirFVl0In5FZf6UadctTaFJI6LqxP4=
=loWw
-----END PGP SIGNATURE-----

--=-QPSVR4cZj5IOIvv+tsrU--
