Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FDD37D3B0
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 20:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D882F6ECBF;
	Wed, 12 May 2021 18:58:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7DB06ECC0;
 Wed, 12 May 2021 18:58:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 601FAB234;
 Wed, 12 May 2021 18:58:26 +0000 (UTC)
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
References: <20210512150008.52f92c26@canb.auug.org.au>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <cd78f43d-f6fe-3a5a-51a6-629c800c989d@suse.de>
Date: Wed, 12 May 2021 20:58:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210512150008.52f92c26@canb.auug.org.au>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="IHccIF0pV30AwrZzWPpCRksT7qa3mIH4t"
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--IHccIF0pV30AwrZzWPpCRksT7qa3mIH4t
Content-Type: multipart/mixed; boundary="hbz5z8zrXybGy2BoF2y40SKGd77obFYHR";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Message-ID: <cd78f43d-f6fe-3a5a-51a6-629c800c989d@suse.de>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
References: <20210512150008.52f92c26@canb.auug.org.au>
In-Reply-To: <20210512150008.52f92c26@canb.auug.org.au>

--hbz5z8zrXybGy2BoF2y40SKGd77obFYHR
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 12.05.21 um 07:00 schrieb Stephen Rothwell:
> Hi all,
>=20
> After merging the drm-misc tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>=20
> drivers/gpu/drm/nouveau/nouveau_connector.c: In function 'nouveau_conne=
ctor_of_detect':
> drivers/gpu/drm/nouveau/nouveau_connector.c:463:59: error: 'struct drm_=
device' has no member named 'pdev'; did you mean 'dev'?
>    463 |  struct device_node *cn, *dn =3D pci_device_to_OF_node(dev->pd=
ev);
>        |                                                           ^~~~=

>        |                                                           dev
>=20
> Caused by commit
>=20
>    b347e04452ff ("drm: Remove pdev field from struct drm_device")
>=20
> I have reverted that commit for today.
>=20

Thanks for reporting. pdev is gone, but the references are sometimes=20
hard to find. You may want to undo the revert and try the fix at [1].=20
The patch should hit drm-misc-next ASAP.

Best regards
Thomas

[1]=20
https://lore.kernel.org/dri-devel/20210512185527.26050-1-tzimmermann@suse=
=2Ede/T/#u

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=FCrnberg, Germany
(HRB 36809, AG N=FCrnberg)
Gesch=E4ftsf=FChrer: Felix Imend=F6rffer


--hbz5z8zrXybGy2BoF2y40SKGd77obFYHR--

--IHccIF0pV30AwrZzWPpCRksT7qa3mIH4t
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCcJVEFAwAAAAAACgkQlh/E3EQov+As
aw//Vz7cdDpG3xG+uaiBpUBDrnlvOak/RhJe7Xf6rOYUd1rQ93KMkHHIYPU8XejQX8aNCilgbFrv
yah+gkKZN0aKC5l3rtrn4GcXeauFobtZoTBvtoKxiTUqZVqGVD8x10gXa7Y5wARGcoKqAmmIC/tz
PQD57hYFtFn6twCFjonyUY6KdylXehsDsGmHKfLk33jcHNBOk1GVD/E0glbijmWaIyaixo5ugWYN
+hV79IWMEg+x6qZ99sJdW+N5yh2dbK73nMiC1iOJ9ZxRXL5x/HpwL/HVEi9nsaTuw16/1JW7pKUM
TFJ+4jRAzzQPD+2RjDt3l1j2dk7uX66x8KQ4fqw6mR8U1R++6YfoZsyeB0aPzcngJSjuDdfvLQ1Q
95r54qdipJHGtgEjECe4l0tg90lLZGBbWmcFIg3WO0OmE4I9xnsyNRD7HxZRgCa4HPvPdQYQpHaZ
e5Lus87TLacMMpRqlMiIAD09WnMTWrokT39E+B3ADVrr/7y0QFzc85edSc0xpjolg9SDXUUXi0JR
AjuoUoncC0Khbe0CpDMxR3fr3YYVz5OtzbXveAglxi9Zl56oielaDNLcahTMx8ZtGf64ZTFObXKi
YLWM/kEZyperhNzReT0W86CdLdEY7oFua3q87GiPgBtXWHJ9EoQhB59wv6VkPdYEBI9mr5SnZhsN
CJM=
=aTeR
-----END PGP SIGNATURE-----

--IHccIF0pV30AwrZzWPpCRksT7qa3mIH4t--
