Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D410C2FA397
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 15:52:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C026E3F2;
	Mon, 18 Jan 2021 14:52:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CEFF6E3EB;
 Mon, 18 Jan 2021 14:52:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EDD1AACB0;
 Mon, 18 Jan 2021 14:52:01 +0000 (UTC)
Subject: Re: [PATCH v4 3/6] drm/i915/gt: Remove references to struct
 drm_device.pdev
To: Chris Wilson <chris@chris-wilson.co.uk>, airlied@linux.ie,
 daniel@ffwll.ch, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, sroland@vmware.com, zackr@vmware.com
References: <20210118131420.15874-1-tzimmermann@suse.de>
 <20210118131420.15874-4-tzimmermann@suse.de>
 <161097709046.27171.15246982051954461820@build.alporthouse.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <07aa5189-e024-7596-67f9-3c4acfea4beb@suse.de>
Date: Mon, 18 Jan 2021 15:51:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <161097709046.27171.15246982051954461820@build.alporthouse.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-graphics-maintainer@vmware.com, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: multipart/mixed; boundary="===============0518104746=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0518104746==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="dCRsEuwTjKinUFnbnRmo5LMjDxJ4hfWO8"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dCRsEuwTjKinUFnbnRmo5LMjDxJ4hfWO8
Content-Type: multipart/mixed; boundary="aKClrsJUCphEMMBlXbdb0YdE9bE6mvwE7";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Chris Wilson <chris@chris-wilson.co.uk>, airlied@linux.ie,
 daniel@ffwll.ch, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, sroland@vmware.com, zackr@vmware.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-graphics-maintainer@vmware.com, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org
Message-ID: <07aa5189-e024-7596-67f9-3c4acfea4beb@suse.de>
Subject: Re: [PATCH v4 3/6] drm/i915/gt: Remove references to struct
 drm_device.pdev
References: <20210118131420.15874-1-tzimmermann@suse.de>
 <20210118131420.15874-4-tzimmermann@suse.de>
 <161097709046.27171.15246982051954461820@build.alporthouse.com>
In-Reply-To: <161097709046.27171.15246982051954461820@build.alporthouse.com>

--aKClrsJUCphEMMBlXbdb0YdE9bE6mvwE7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 18.01.21 um 14:38 schrieb Chris Wilson:
> Quoting Thomas Zimmermann (2021-01-18 13:14:17)
>> Using struct drm_device.pdev is deprecated. Convert i915 to struct
>> drm_device.dev. No functional changes.
>=20
> This needs to be before or in the previous patch, as that patch removed=

> assignment of i915->drm.pdev.
>=20
> Or the removal of the assignment moved to the end as a separate patch.
> That makes more sense.

Makes sense. The patches can be reordered easily. There was some=20
discussion on irc about how the i915 patches first need a merge of the=20
i915 tree to the gvt tree, or something like that.

Best regards
Thomas

> -Chris
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--aKClrsJUCphEMMBlXbdb0YdE9bE6mvwE7--

--dCRsEuwTjKinUFnbnRmo5LMjDxJ4hfWO8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAFoI4FAwAAAAAACgkQlh/E3EQov+DX
rA//cjF/f5x4zOt1GqAF+23isnmF9Bg2enEUFKyXLxsiPdUCtu0QclSphbiBPb9Ujp4iGXep6qQh
ZZTIlmZ/Ed37MmCbwjOeJbquEuxHUoZlMZLFEXMNwrzr54I85mdkfnWnzABpqMiiFw4jwAizeMA/
P75uPCHYM1POKPtSxSKQcnQBm11rY+c6+oi+NjdPlyntHfpJAelGtwEscnBy94+hbj+dqso75dYp
bOHNAykst154v1MrcELV95517q3lAMi8r2WauO3br17V07dWUMPRbnwzfjSjtlyBwvBeLf8WW/aS
EghA5zQdoqIlBxmsqp0CmZar8J5Ro4RJl57rTMvbeEpphDdGK4ewnbiA3Tyz+ZNGJNokrqlLV9rl
Yu6Iqzk+T1u4jlxruJUGHxX2Sn3XAd5UCH2tqgvJRIItD8EcqAgCF3Latdo5k7wAFmkErNAY+ge2
L5ta/NQzKg0Fe4dKBH86eTugcNLk06SsdYfCRRaMrerFTFtglDh3PHgHqAHBuyVZtIIf2sfvh/gP
KcyMFdllkD7627kZQkk0IRD+Eh9F1vmWt3i7yur9ZozD8dVHd0mrn6TORw/rif6dq8ExCuhqo5Sc
+x9qhDzlHXb8pVeCpenRZuQLTctHeecuOBcvgJw+qSoVOlmvHSUAlouvI/bOV/Ucdact9qXoNNOZ
n+A=
=CH+b
-----END PGP SIGNATURE-----

--dCRsEuwTjKinUFnbnRmo5LMjDxJ4hfWO8--

--===============0518104746==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0518104746==--
