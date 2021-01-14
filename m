Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EEA2F5FA2
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 12:16:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D03846E241;
	Thu, 14 Jan 2021 11:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 592AC89491;
 Thu, 14 Jan 2021 11:16:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E5D7AB7A6;
 Thu, 14 Jan 2021 11:16:43 +0000 (UTC)
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
References: <20210114113107.622102e0@canb.auug.org.au>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <524351d0-506d-bd49-ab50-66316d7e5105@suse.de>
Date: Thu, 14 Jan 2021 12:16:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114113107.622102e0@canb.auug.org.au>
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
Content-Type: multipart/mixed; boundary="===============0388711250=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0388711250==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="jJL4pOPwDC6gspy7p5JwzKT8iKU9cxx8Y"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--jJL4pOPwDC6gspy7p5JwzKT8iKU9cxx8Y
Content-Type: multipart/mixed; boundary="oYbDUBfhMYZhf86gzX4V6y4JZK6TwFz2I";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Message-ID: <524351d0-506d-bd49-ab50-66316d7e5105@suse.de>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
References: <20210114113107.622102e0@canb.auug.org.au>
In-Reply-To: <20210114113107.622102e0@canb.auug.org.au>

--oYbDUBfhMYZhf86gzX4V6y4JZK6TwFz2I
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 14.01.21 um 01:31 schrieb Stephen Rothwell:
> Hi all,
>=20
> After merging the drm-misc tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>=20
> drivers/gpu/drm/drm_cache.c: In function 'drm_need_swiotlb':
> drivers/gpu/drm/drm_cache.c:202:6: error: implicit declaration of funct=
ion 'mem_encrypt_active' [-Werror=3Dimplicit-function-declaration]
>    202 |  if (mem_encrypt_active())
>        |      ^~~~~~~~~~~~~~~~~~
>=20
>=20
> Caused by commit
>=20
>    3abc66706385 ("drm: Implement drm_need_swiotlb() in drm_cache.c")
>=20
> I have used the drm-misc tree from next-20210107 again for today.

Sorry for the breakage. Fixed in drm-misc-next.

Best regards
Thomas

>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=FCrnberg, Germany
(HRB 36809, AG N=FCrnberg)
Gesch=E4ftsf=FChrer: Felix Imend=F6rffer


--oYbDUBfhMYZhf86gzX4V6y4JZK6TwFz2I--

--jJL4pOPwDC6gspy7p5JwzKT8iKU9cxx8Y
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAAKBoFAwAAAAAACgkQlh/E3EQov+Bt
zA//b9VYy7/b8sble+TS3HnmjvwcuMbp5ETrD8Ju40SU8bM+8Qb9NT6TL9FeAQro5UFKzMt1Jmci
zXK+lkNyUxUo44hoDIUTVVlvvQQqUYbtB/wMWS6FoKHODyG/jfR9JtTPzmRuSmn2gesrBmZcCGe5
0FL6UEJHH+U7Xw9Lmlxo7GSsVx6SUbDFNMz82DDoWU5lOd0Z0wMbJO/FVv5nGrlj3LuvDv+bUxf+
BOWPyseaVLGYCu6ZfSfTWjNF8sN/ZI6XIrWidRjWeBK+rQFMKTqkkZFb+QtfPQLvcHiHlPEFv5FN
bUfM65PZ4hxLWsdW6qhMSInDEqU6BwmWXph12UvX7ZvROz8xm3u/LqhGX3xNo/plmr/xFY4CkH8p
BWWrO43zVbrqK1SEj8rQkPECiXXVhu8fD493WOT/dTaZkGbhqUrokLnATUdVBlfSFDurbr30JPSb
8qAXS/40K6xNYUwpvCkSOxnvmjTH5GLGB8OjMGGhz/bEUx/mQNwIC3uRSjRioiBd+9DA9KMz3lvG
C0nnQd7i9KwQVrAs3Me/cPmzcEYQUv39vmSLxoPaCGmyxG8VX/rwdPTSZ5EBm68jisj9quvzyEJx
Kz7QoaUeG4dP6DGtezZ78rH5Yt8FyfPfCrc/YDdqApG4CojSLAPZ22aBQLLPnJM/dBwxtGVbHFt5
jqU=
=0oEf
-----END PGP SIGNATURE-----

--jJL4pOPwDC6gspy7p5JwzKT8iKU9cxx8Y--

--===============0388711250==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0388711250==--
