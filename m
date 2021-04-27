Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F0536CA90
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 19:46:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF0F6E90F;
	Tue, 27 Apr 2021 17:46:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 381696E90F;
 Tue, 27 Apr 2021 17:46:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8D62BB216;
 Tue, 27 Apr 2021 17:46:05 +0000 (UTC)
Subject: Re: [PATCH] drm/i915/gem: Remove reference to struct drm_device.pdev
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "airlied@linux.ie"
 <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "Auld, Matthew" <matthew.auld@intel.com>
References: <20210427110747.2065-1-tzimmermann@suse.de>
 <c4ee56d253784b2081891908423c4389@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <e062e7e6-b8d0-85c8-38df-6301145a0214@suse.de>
Date: Tue, 27 Apr 2021 19:46:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <c4ee56d253784b2081891908423c4389@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, "Tang, CQ" <cq.tang@intel.com>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, "Liu, Xinyun" <xinyun.liu@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: multipart/mixed; boundary="===============0082219222=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0082219222==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="irJTV5jsQI2KdLbryK1vmShkMCBYYlJtQ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--irJTV5jsQI2KdLbryK1vmShkMCBYYlJtQ
Content-Type: multipart/mixed; boundary="OrOBpi1OPaNWS5tAa59ua7mq9TqRQe8It";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "airlied@linux.ie"
 <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "Auld, Matthew" <matthew.auld@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, "Tang, CQ" <cq.tang@intel.com>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, "Liu, Xinyun"
 <xinyun.liu@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <e062e7e6-b8d0-85c8-38df-6301145a0214@suse.de>
Subject: Re: [PATCH] drm/i915/gem: Remove reference to struct drm_device.pdev
References: <20210427110747.2065-1-tzimmermann@suse.de>
 <c4ee56d253784b2081891908423c4389@intel.com>
In-Reply-To: <c4ee56d253784b2081891908423c4389@intel.com>

--OrOBpi1OPaNWS5tAa59ua7mq9TqRQe8It
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 27.04.21 um 16:39 schrieb Ruhl, Michael J:
>=20
>> -----Original Message-----
>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of=

>> Thomas Zimmermann
>> Sent: Tuesday, April 27, 2021 7:08 AM
>> To: jani.nikula@linux.intel.com; joonas.lahtinen@linux.intel.com; Vivi=
, Rodrigo
>> <rodrigo.vivi@intel.com>; airlied@linux.ie; daniel@ffwll.ch; Auld, Mat=
thew
>> <matthew.auld@intel.com>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>; Ursulin, Tvrtko
>> <tvrtko.ursulin@intel.com>; Mika Kuoppala
>> <mika.kuoppala@linux.intel.com>; intel-gfx@lists.freedesktop.org; Gust=
avo
>> A. R. Silva <gustavoars@kernel.org>; dri-devel@lists.freedesktop.org; =
Chris
>> Wilson <chris@chris-wilson.co.uk>; Tang, CQ <cq.tang@intel.com>; Hells=
trom,
>> Thomas <thomas.hellstrom@intel.com>; Thomas Zimmermann
>> <tzimmermann@suse.de>; Daniel Vetter <daniel.vetter@ffwll.ch>; Liu,
>> Xinyun <xinyun.liu@intel.com>; Dan Carpenter <dan.carpenter@oracle.com=
>
>> Subject: [PATCH] drm/i915/gem: Remove reference to struct
>> drm_device.pdev
>>
>> References to struct drm_device.pdev should be used any longer as
>=20
> should not be used
>               ^^^
> ?

Oh, indeed.

>=20
> m
>=20
>> the field will be moved into the struct's legacy section. Add a fix
>> for the rsp commit.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Fixes: d57d4a1daf5e ("drm/i915: Create stolen memory region from local=

>> memory")
>> Cc: CQ Tang <cq.tang@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Cc: Xinyun Liu <xinyun.liu@intel.com>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Chris Wilson <chris@chris-wilson.co.uk>
>> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: "Thomas Hellstr=C3=B6m" <thomas.hellstrom@intel.com>
>> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
>> Cc: Dan Carpenter <dan.carpenter@oracle.com>
>> Cc: intel-gfx@lists.freedesktop.org
>> ---
>> drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>> b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>> index c5b64b2400e8..e1a32672bbe8 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>> @@ -773,7 +773,7 @@ struct intel_memory_region *
>> i915_gem_stolen_lmem_setup(struct drm_i915_private *i915)
>> {
>> 	struct intel_uncore *uncore =3D &i915->uncore;
>> -	struct pci_dev *pdev =3D i915->drm.pdev;
>> +	struct pci_dev *pdev =3D to_pci_dev(i915->drm.dev);
>> 	struct intel_memory_region *mem;
>> 	resource_size_t io_start;
>> 	resource_size_t lmem_size;
>> --
>> 2.31.1
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
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


--OrOBpi1OPaNWS5tAa59ua7mq9TqRQe8It--

--irJTV5jsQI2KdLbryK1vmShkMCBYYlJtQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCITdsFAwAAAAAACgkQlh/E3EQov+Dw
Ug//TURcL4KO+JO6ZlIScGQ2tbzcmah5/zhAC75i0Gdb7FKC8K3NPre7uz6/Ng9c03+a5rl8Lm7t
n5l8gRqQZqzc/9d81jEKKL87WpBRswm/hor9GBB/a2q4Gi3WCsyLYwJLLkHll+g4av8S5Rr5Ntlv
5A+N9jFgmwih928gJIin2xbb+lvrwMaNGk2BIbNIjJEj82OMXjDnxuT8tyR75UtDi42OlC6t/N/e
PEAqCXb3JMpRlg6LInp34ddPqZ1+lq/77gBRSFCIHLP14cnCTABC81XVOn64dHp0WmvCnoL+yWKS
/OGG8X1QJ7hW6WEHyLXcgsSqWtGXJfTaSLeNCikUJEqPMHzAdyUwUV/TomWJrmLNgBY36cenmgL7
8URmn4tE4bRHqnDitmxHtZpdqp1U0mnIFQK3+CJN+d1N5+ntUedcrmXDRjb938buXa2QhrvRDEqz
9jzFt4hV9MwJ5qBf7UWyLkMxZf2QaDj7+2MKrlD6LxEGafxW6Kcxld+HwkdkDaE3VZ8v2l1j/NgL
5x4TnXuNJPRcsITYMlQWlEcf5wU0UOMYkdu2pijgB+OWaxm/E7q1BOeFXpPt9521FVPEamqRAMOz
YD38SX8Rj0jMI9nG4hZM4L+3OTewhWuMD0mEIou9W0qQQ5yQofkKygEbx0zztQ4uG6/JrtvzQRi1
57g=
=JkrZ
-----END PGP SIGNATURE-----

--irJTV5jsQI2KdLbryK1vmShkMCBYYlJtQ--

--===============0082219222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0082219222==--
