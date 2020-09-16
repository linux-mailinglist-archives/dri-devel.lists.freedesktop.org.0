Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C9E26BEA5
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 09:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE1C6E9D8;
	Wed, 16 Sep 2020 07:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1139B6E9D8
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 07:59:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 09D5BB000;
 Wed, 16 Sep 2020 08:00:02 +0000 (UTC)
Subject: Re: [PATCH] drm/vc4: Handing the return value of
 drm_universal_plane_init
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, eric@anholt.net, airlied@linux.ie,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org
References: <1599811777-34093-1-git-send-email-tiantao6@hisilicon.com>
 <d35a968e-d957-7d0a-cf93-084d7b4002e0@suse.de>
Message-ID: <eaa3d9f2-f629-7700-d693-d0ece1c9584c@suse.de>
Date: Wed, 16 Sep 2020 09:59:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <d35a968e-d957-7d0a-cf93-084d7b4002e0@suse.de>
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
Cc: linuxarm@huawei.com
Content-Type: multipart/mixed; boundary="===============0520543641=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0520543641==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ObMnUddSnHtO5pdoIQUHFYmHWI5ZLmoeP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ObMnUddSnHtO5pdoIQUHFYmHWI5ZLmoeP
Content-Type: multipart/mixed; boundary="QeTaHcLlGGS7FYXAZTLg4gCKqV3jjcy7a";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, eric@anholt.net, airlied@linux.ie,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org
Cc: linuxarm@huawei.com
Message-ID: <eaa3d9f2-f629-7700-d693-d0ece1c9584c@suse.de>
Subject: Re: [PATCH] drm/vc4: Handing the return value of
 drm_universal_plane_init
References: <1599811777-34093-1-git-send-email-tiantao6@hisilicon.com>
 <d35a968e-d957-7d0a-cf93-084d7b4002e0@suse.de>
In-Reply-To: <d35a968e-d957-7d0a-cf93-084d7b4002e0@suse.de>

--QeTaHcLlGGS7FYXAZTLg4gCKqV3jjcy7a
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Tian

Am 14.09.20 um 09:07 schrieb Thomas Zimmermann:
> Hi
>=20
> Am 11.09.20 um 10:09 schrieb Tian Tao:
>> Handing the return value of drm_universal_plane_init to fix the follow=
ing
>> W=3D1 kernel build warning(s):
>> vc4_plane.c: In function =E2=80=98vc4_plane_init=E2=80=99:
>> vc4_plane.c:1340:6: warning: variable =E2=80=98ret=E2=80=99 set but no=
t
>> used [-Wunused-but-set-variable]
>>
>> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
>=20
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Please go ahead and merge the patch, or let me know if I should merge it.=


Best regards
Thomas

>=20
> Thanks!
>=20
>> ---
>>  drivers/gpu/drm/vc4/vc4_plane.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4=
_plane.c
>> index 24d7e6d..65c1205 100644
>> --- a/drivers/gpu/drm/vc4/vc4_plane.c
>> +++ b/drivers/gpu/drm/vc4/vc4_plane.c
>> @@ -1361,6 +1361,8 @@ struct drm_plane *vc4_plane_init(struct drm_devi=
ce *dev,
>>  				       &vc4_plane_funcs,
>>  				       formats, ARRAY_SIZE(formats),
>>  				       modifiers, type, NULL);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> =20
>>  	drm_plane_helper_add(plane, &vc4_plane_helper_funcs);
>> =20
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--QeTaHcLlGGS7FYXAZTLg4gCKqV3jjcy7a--

--ObMnUddSnHtO5pdoIQUHFYmHWI5ZLmoeP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9hxfIUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiNDngf+JkTTpmnqwYjR1pM0l0gNLfjtCNBb
FpKznNUwH1uAP95/rpCLitXVk9Tsj9iA8gPke6OqGHVLaKGoAIY9ouLH1ky8puCM
bh85LJUlgOvhNFThC89/sSBdDYtHFMDmqglVHpWfik4DWLBDvuIfPVI8sX7kzn6l
xzPJmVHbGMGROLTgr2JgM+4yyYre3APJgd9p1jeTCw/2gln2Zykpp9rO4lq1/rB/
L+KcBs5I/6UCg/B5RTgbHeHzzIjU+zvgw33T9DAATtLR2fpC72NepI8WAX3+Ldig
jk+EzYzdxqJ8F1yfE1nh9O4q3H1KvUckezV+40NhbB8v0zINm9IFXfj1LA==
=kL9D
-----END PGP SIGNATURE-----

--ObMnUddSnHtO5pdoIQUHFYmHWI5ZLmoeP--

--===============0520543641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0520543641==--
