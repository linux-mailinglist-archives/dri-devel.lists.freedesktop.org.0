Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C473108AE
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 11:08:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8D56F39B;
	Fri,  5 Feb 2021 10:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28086F39B
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 10:08:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6BAECAE76;
 Fri,  5 Feb 2021 10:08:46 +0000 (UTC)
Subject: Re: [PATCH 0/6] drm: Move vmap out of commit tail for SHMEM-based
 drivers
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20210204200308.24216-1-tzimmermann@suse.de>
 <20210205090514.ln6eeoqfcijrd5q2@sirius.home.kraxel.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <0ed91db9-f70e-48dc-d826-f13d02e833ca@suse.de>
Date: Fri, 5 Feb 2021 11:08:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210205090514.ln6eeoqfcijrd5q2@sirius.home.kraxel.org>
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
Cc: airlied@linux.ie, sam@ravnborg.org,
 virtualization@lists.linux-foundation.org, hdegoede@redhat.com,
 dri-devel@lists.freedesktop.org, sean@poorly.run
Content-Type: multipart/mixed; boundary="===============0388857847=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0388857847==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="z4rnQrrnAkIpE1OUWivrmJJ6fiqFTFmT9"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--z4rnQrrnAkIpE1OUWivrmJJ6fiqFTFmT9
Content-Type: multipart/mixed; boundary="FPjmtJ5Q1xvUMwboNPbSuumgXKHOmXYEQ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, hdegoede@redhat.com, sean@poorly.run, sam@ravnborg.org,
 noralf@tronnes.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Message-ID: <0ed91db9-f70e-48dc-d826-f13d02e833ca@suse.de>
Subject: Re: [PATCH 0/6] drm: Move vmap out of commit tail for SHMEM-based
 drivers
References: <20210204200308.24216-1-tzimmermann@suse.de>
 <20210205090514.ln6eeoqfcijrd5q2@sirius.home.kraxel.org>
In-Reply-To: <20210205090514.ln6eeoqfcijrd5q2@sirius.home.kraxel.org>

--FPjmtJ5Q1xvUMwboNPbSuumgXKHOmXYEQ
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 05.02.21 um 10:05 schrieb Gerd Hoffmann:
>    Hi,
>=20
>> I smoke-tested the code by running fbdev, Xorg and weston with the
>> converted mgag200 driver.
>=20
> Looks sane to me.
> Survived cirrus smoke test too.
>=20
> Tested-by: Gerd Hoffmann <kraxel@redhat.com>
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>

Thanks a lot! I have on small change to the simple-kms interface for v2. =

But it doesn't make a difference overall.

Best regards
Thomas

>=20
> take care,
>    Gerd
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--FPjmtJ5Q1xvUMwboNPbSuumgXKHOmXYEQ--

--z4rnQrrnAkIpE1OUWivrmJJ6fiqFTFmT9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAdGS0FAwAAAAAACgkQlh/E3EQov+C7
lA//VZ5DaPWW35tUIvNizGPuPN0t4ZLaX8qdsSTP60SBE4zspKLbZpFnRhPDdP0mb7YhF66hnVx1
/UKPpmaVmvRLSqh85XJgSd+gaY6rVTWdvcrLGmjZiqD4jADwd73B7bvgoMhuoQFS+jSInsbdmNY+
vkXuxTAQ/pTGEUabT9snST8aNmfABAYvYRGiGfO+M48jDKQcEFi89U1uTdk8Um7CIudlAhclJE4R
ygPro0Cq5KVLwS+cQ2ZgKrxe3YxVhWkSdHbovzSZfalWafXZ4JDF/fZdLRh5dYCicuORooeO2g3s
vMF2ZDNUuMvo3r4JA1B34xjl6i3ToEG7XxQrLGgCYWlaBMA0xN2kEd9KOZtXjmXfOe/jdR0YRcmN
1n59RptfVa8j/ils4N95qktBoXqzKqQjSSVLlm/um6RubLpQg61KXlCVVDnR1YIwBX9Vb0kl3Qe4
hzi/WiGlEV/y/PlgYq/CTXJK423igqzPq7ucXaXKWmjUe59wXNVU1LCmB96evrgIjBt8pqlbPog8
mBeSkCUQ6NLJaJPlJNRSSo/SdXNm1Mo8dcQu6OedOZMePob32HYK0WouRuM6oW1bByRvg6LQMSNj
xmwhT80B7niXXbmQ2vP6DE9EhaHacRB6qmuuik1sxBw6LNI2Mopta/PavTtjYIxLMJvKAIq/+8l+
MFc=
=/ot5
-----END PGP SIGNATURE-----

--z4rnQrrnAkIpE1OUWivrmJJ6fiqFTFmT9--

--===============0388857847==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0388857847==--
