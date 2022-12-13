Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B743764B38B
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 11:48:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8773F10E30E;
	Tue, 13 Dec 2022 10:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D0E10E308;
 Tue, 13 Dec 2022 10:48:10 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id x11so2875371ljh.7;
 Tue, 13 Dec 2022 02:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=uSaKpwoZTw6kBpVBo2/0gF4q7tbusn1lAFDcwIVJmBI=;
 b=WqgXF6g9VcryYo+atWdBvep2sFzW4XLhg4W2fX8MXtDWHxj6yJR/wMqpD8hG3OLIn7
 4niEVfZt6X826saJFb0sz06HUJmmi+Opi6ZJgIukcf9WEXYXMMhWy4IAnqfOK7O1FJh6
 ZmFiLj31EgSR7GCFSkMb7dHd2XuPZaDab5Vm47aY9RoZ4jmpc00F2zxBealDnFST/Yho
 QY81wZQBWF0MPPRe8IdrbqjStrWaS7Lv8o/9/Ik20E00YOSXphfiIjLJfqTuHDJaEC07
 of5po7X/N9bFcM3eyHwyzqnthVm4EhqnOdBYafwgbm0goLuPoiIukFvCV3G1/kKPcBDU
 gRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uSaKpwoZTw6kBpVBo2/0gF4q7tbusn1lAFDcwIVJmBI=;
 b=r+Az+lpGw4BKVOGTrZYZ8X/G0H6Lm+T1jhmZbyGCczNGXj5p8d2fy4rCKFj/iLgpby
 tVBq9oZ7V5I/AsKXxqK9PGplQD5OLywHLUeFuiQdRJ8bf1fJU4OP9VqYSifv4Y8pS1hJ
 akNUH8gsqvKaiYRqCMT2UKx0iuhiwfMnMKAeDGUAZyOuTTlDcke/2aXxWgdLAXr/xW78
 od+GwmFEFrbp7IcHT0x/vbe/jkRkAkjgSfqKV2A2Pj6DlaZZf8G7m9BH4/fXYz6ue4FO
 kLLL6gahRpPQBuO+y66yE44qbYlNL811SWEu7vFFGdkOWey/YCppyKFy0O0j77jdhIh7
 fvFA==
X-Gm-Message-State: ANoB5pkX5DYcuTjBqxatelrpUZEs0DQR/+WWWsIP1kcVmMzyGTBzyrP8
 1PuAUqGMKAntd/oRnSmOkyY=
X-Google-Smtp-Source: AA0mqf7oxEYYx52ognw5JCRXJJXjJLP0GHS6gf5TVkjcRCEhn/s5AFIg4mPW9HHQZPwGGnrgUfNqGg==
X-Received: by 2002:a2e:a983:0:b0:278:eab6:7523 with SMTP id
 x3-20020a2ea983000000b00278eab67523mr9410839ljq.37.1670928489109; 
 Tue, 13 Dec 2022 02:48:09 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 f15-20020a19dc4f000000b004b593fd84ccsm313689lfj.221.2022.12.13.02.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 02:48:08 -0800 (PST)
Date: Tue, 13 Dec 2022 12:48:05 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH 16/16] drm/amd/display: Don't restrict bpc to 8 bpc
Message-ID: <20221213124805.7d48fe76@eldfell>
In-Reply-To: <20221212182137.374625-17-harry.wentland@amd.com>
References: <20221212182137.374625-1-harry.wentland@amd.com>
 <20221212182137.374625-17-harry.wentland@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zgRy6XYQm3k5F0uhSAbhR.T";
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 Uma Shankar <uma.shankar@intel.com>, amd-gfx@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/zgRy6XYQm3k5F0uhSAbhR.T
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 12 Dec 2022 13:21:37 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> This will let us pass kms_hdr.bpc_switch.
>=20
> I don't see any good reasons why we still need to
> limit bpc to 8 bpc and doing so is problematic when
> we enable HDR.
>=20
> If I remember correctly there might have been some
> displays out there where the advertised link bandwidth
> was not large enough to drive the default timing at
> max bpc. This would leave to an atomic commit/check
> failure which should really be handled in compositors
> with some sort of fallback mechanism.
>=20
> If this somehow turns out to still be an issue I
> suggest we add a module parameter to allow users to
> limit the max_bpc to a desired value.
>=20
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Vitaly.Prosyak@amd.com
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: dri-devel@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index d0c071000a5d..396e345f5d6b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -7115,7 +7115,7 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_=
display_manager *dm,
>  		drm_connector_attach_max_bpc_property(&aconnector->base, 8, 16);
> =20
>  	/* This defaults to the max in the range, but we want 8bpc for non-edp.=
 */
> -	aconnector->base.state->max_bpc =3D (connector_type =3D=3D DRM_MODE_CON=
NECTOR_eDP) ? 16 : 8;
> +	aconnector->base.state->max_bpc =3D 16;

Hi,

missed to delete the comment. If it really defaults, then can't you
just drop the assignment?

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq


>  	aconnector->base.state->max_requested_bpc =3D aconnector->base.state->m=
ax_bpc;
> =20
>  	if (connector_type =3D=3D DRM_MODE_CONNECTOR_eDP &&


--Sig_/zgRy6XYQm3k5F0uhSAbhR.T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmOYWGUACgkQI1/ltBGq
qqcJww//SJvkcGhIp+HzTooQ5i7uNB5Zoc1pAMg3BFMOjl3EhHTdUmCJZPC+s8HW
fYsAjZYngxmLrcPlAExfCF3dFD0adIUuZMvUdQlZRD4bJpmvvhndGItw4yrDBN1+
CIE6Pl/RicIbFtYJld10W+hbbfPZT1993sTmD58Z0Z4RRKm+m0Rc8R2+NTGBSnYV
NIreDez47fLGgofE84vvQXYhmpDakv/tS1V5OpzePOa/EA1PdWVt8pfYf+nBEWCK
oUwbchV0PHiLjv8mnYCZG88LB7wwBFxl27zj9CHOPr4vc3nDKjr64JMkw6yD9HcU
cniajCTZjJr0JipHFu612CAp2DS3a5m9AnlBdIlUNiLEIwr3usEvdIkijv/rmnOb
o7pBT14ZKm3+uaHoU9ykC6/y3V8JwLGrAA6CBrJ+C4BNvHkareIkiOmrBQkPM9F1
LSZ/sXp4ist7beRjRQKGyyd9q6aM8lvo8nqB2QoyaAS877M+eU1n7kj4zKW/UGPX
ikAfxO801iCEalsdGQ9FaKNLh47/BuRNxylUyGii9tj2tXwVk3/x6exdVkXZR2kY
UpI+VDACIuwwBP5vNZ0fJZI3gHCrJsdcF3CteK7OuAO9+IStBknMnjnrMpFbxuXC
DXe4SmLaL5pQC3OVKAzAOTi49jnR89kdGrwjTzP0okH2ITi8jK4=
=pmn5
-----END PGP SIGNATURE-----

--Sig_/zgRy6XYQm3k5F0uhSAbhR.T--
