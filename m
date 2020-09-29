Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2ABA27BE53
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 09:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C50789CCE;
	Tue, 29 Sep 2020 07:47:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5622A89CCE
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 07:47:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0841DAC98;
 Tue, 29 Sep 2020 07:47:23 +0000 (UTC)
Subject: Re: [PATCH v1 1/2] drm/rockchip: fix build due to undefined
 drm_gem_cma_vm_ops
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200925215524.2899527-1-sam@ravnborg.org>
 <20200925215524.2899527-2-sam@ravnborg.org>
 <83650213-3b09-aea0-4485-cd20de1d9548@suse.de>
 <20200929071754.GA736868@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <8c22061f-6073-5860-bd55-d85a0b4c07d6@suse.de>
Date: Tue, 29 Sep 2020 09:47:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200929071754.GA736868@ravnborg.org>
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
Cc: Sandy Huang <hjc@rock-chips.com>, stable@vger.kernel.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0948039244=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0948039244==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="JEHxjLtZCE48v7GMtUksxIUDasaHqcche"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JEHxjLtZCE48v7GMtUksxIUDasaHqcche
Content-Type: multipart/mixed; boundary="xQspxrd93ohokcxrHV4431avMRiDfRusI";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, stable@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Message-ID: <8c22061f-6073-5860-bd55-d85a0b4c07d6@suse.de>
Subject: Re: [PATCH v1 1/2] drm/rockchip: fix build due to undefined
 drm_gem_cma_vm_ops
References: <20200925215524.2899527-1-sam@ravnborg.org>
 <20200925215524.2899527-2-sam@ravnborg.org>
 <83650213-3b09-aea0-4485-cd20de1d9548@suse.de>
 <20200929071754.GA736868@ravnborg.org>
In-Reply-To: <20200929071754.GA736868@ravnborg.org>

--xQspxrd93ohokcxrHV4431avMRiDfRusI
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Sam

Am 29.09.20 um 09:17 schrieb Sam Ravnborg:
> On Tue, Sep 29, 2020 at 08:53:06AM +0200, Thomas Zimmermann wrote:
>> Hi Sam
>>
>> Am 25.09.20 um 23:55 schrieb Sam Ravnborg:
>>> Commit 0d590af3140d ("drm/rockchip: Convert to drm_gem_object_funcs")=

>>> introduced the following build error:
>>>
>>> rockchip_drm_gem.c:304:13: error: =E2=80=98drm_gem_cma_vm_ops=E2=80=99=
 undeclared here
>>>   304 |  .vm_ops =3D &drm_gem_cma_vm_ops,
>>>       |             ^~~~~~~~~~~~~~~~~~
>>>       |             drm_gem_mmap_obj
>>>
>>> Fixed by adding missing include file.
>>>
>>> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
>>
>> Didn't you review exactly this change yesterday? Anyway, you should ad=
d
> Yep.
>=20
>>
>> Fixes: 0d590af3140d ("drm/rockchip: Convert to drm_gem_object_funcs")
>>
>> and
>>
>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>>
>> It might happen that I land my patch first, depending on the urgency o=
f
>> the issue.
> I expect you to land the patch you made asap so we can have the build
> fixed again.

Oh, I just looked at the dates and your patch was actually first. Sorry
for the confusion. I've now merged what I had.

Best regards
Thomas

>=20
>=20
> 	Sam
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--xQspxrd93ohokcxrHV4431avMRiDfRusI--

--JEHxjLtZCE48v7GMtUksxIUDasaHqcche
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9y5oMUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiOBIAf8DFIJ9A4KmiiZTb64quSELkbGV8of
EseJpP5JoxANjWbb3vBRCnE2OCmuGR28ejgQx+ilCkUm3Kp8EUbzfv3+0JsSihI4
1Rwd8j0fnETjA8hHqXJjr7gPzGQWs1HLh3WIsurpb11xQEti97qUM0aGha/KT/dX
JymWEOFChK25d0u3ZgttV+Q62xsWrt5TQYFXtBlKDktoUoJbRVRqPfpJaL52znVw
/7KyTvCi+y2m8RhTne9BiPpRZgEOzvMLTK3SCScNVMr4UiFCGGWcbEKKstpeFvCn
CIrtNtJtCErjeK7V5hXKNguK7QAFkdSbRNgkuoLpDDOfUgYaRua2MnR5Uw==
=mDKO
-----END PGP SIGNATURE-----

--JEHxjLtZCE48v7GMtUksxIUDasaHqcche--

--===============0948039244==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0948039244==--
