Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E84438FE5F
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 12:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADEEC6E9E7;
	Tue, 25 May 2021 10:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E7E6E9E5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 10:03:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1621937019; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KQN4c/IEDnlVqwRAkpeA/2Q51G85LbKZZpN5Ztu9LC8=;
 b=GJsKG2Xv17GHbAL8kvtBAtKG645wcjooaFtBI4RPI3kakfBl2JsF3GQu4nLR1a4TyRgd1J
 TuZnreJwXiJlRNsURWpw/pp6onRL+2iIwCAw2anNyjtILCJj1mmkpnGP28eYVMvOYH6BcL
 M6Qgq7RsBKxaB0Hba4GopsynxNjXwJg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1621937019;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KQN4c/IEDnlVqwRAkpeA/2Q51G85LbKZZpN5Ztu9LC8=;
 b=LiYnlBdOcbtVPemDH43SgF/MsS2XQRFmcvY0HY449TxeBu7zWdkAwWT/vZCjxhXgQlVA+D
 XYcZhi8TQJWgguCw==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4D6FEAE1F;
 Tue, 25 May 2021 10:03:39 +0000 (UTC)
Subject: Re: [PATCH v5 0/3] Add option to mmap GEM buffers cached
To: Paul Cercueil <paul@crapouillou.net>
References: <20210523170415.90410-1-paul@crapouillou.net>
 <452b2228-2415-69d7-9212-51707daf8616@suse.de>
 <F0RKTQ.VPIWIN1LS7JH3@crapouillou.net>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <5012b318-dbd6-aedb-9d02-1c7e927637a7@suse.de>
Date: Tue, 25 May 2021 12:03:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <F0RKTQ.VPIWIN1LS7JH3@crapouillou.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="v0AcL5C2mtYydwyBD2wF9vN1QPUELrBtZ"
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, list@opendingux.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--v0AcL5C2mtYydwyBD2wF9vN1QPUELrBtZ
Content-Type: multipart/mixed; boundary="WdwKxz6I4ioqHFvp67m0AFmR0dZuNEkAV";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Paul Cercueil <paul@crapouillou.net>
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, list@opendingux.net
Message-ID: <5012b318-dbd6-aedb-9d02-1c7e927637a7@suse.de>
Subject: Re: [PATCH v5 0/3] Add option to mmap GEM buffers cached
References: <20210523170415.90410-1-paul@crapouillou.net>
 <452b2228-2415-69d7-9212-51707daf8616@suse.de>
 <F0RKTQ.VPIWIN1LS7JH3@crapouillou.net>
In-Reply-To: <F0RKTQ.VPIWIN1LS7JH3@crapouillou.net>

--WdwKxz6I4ioqHFvp67m0AFmR0dZuNEkAV
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 23.05.21 um 21:19 schrieb Paul Cercueil:
> Hi Thomas,
>=20
> Le dim., mai 23 2021 at 21:05:30 +0200, Thomas Zimmermann=20
> <tzimmermann@suse.de> a =C3=A9crit :
>> Hi
>>
>> Am 23.05.21 um 19:04 schrieb Paul Cercueil:
>>> V5 of my patchset which adds the option for having GEM buffers backed=20
by
>>> non-coherent memory.
>>>
>>> Changes from V4:
>>>
>>> - [2/3]:
>>> =C2=A0=C2=A0=C2=A0=C2=A0 - Rename to drm_fb_cma_sync_non_coherent
>>> =C2=A0=C2=A0=C2=A0=C2=A0 - Invert loops for better cache locality
>>> =C2=A0=C2=A0=C2=A0=C2=A0 - Only sync BOs that have the non-coherent f=
lag
>>> =C2=A0=C2=A0=C2=A0=C2=A0 - Properly sort includes
>>> =C2=A0=C2=A0=C2=A0=C2=A0 - Move to drm_fb_cma_helper.c to avoid circu=
lar dependency
>>
>> I'm pretty sure it's still not the right place. That would be=20
>> something like drm_gem_cma_atomic_helper.c, but creating a new file=20
>> just for a single function doesn't make sense.
>=20
> drm_fb_cma_sync_non_coherent calls drm_fb_cma_* functions, so it's a=20
> better match than its former location (which wasn't good as it created =
a=20
> circular dependency between drm.ko and drm-kms-helper.ko).
>=20
> Do you have a better idea?

No, it was more of a rant than a review comment. Please go ahead and=20
merge the patchset.

Best regards
Thomas


--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--WdwKxz6I4ioqHFvp67m0AFmR0dZuNEkAV--

--v0AcL5C2mtYydwyBD2wF9vN1QPUELrBtZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCsy3oFAwAAAAAACgkQlh/E3EQov+Cf
LxAAwsovVR0wiZoN949SM2Xd30RMs7n6lDgxQaI3cIatjQmQCeq/TH6T297/sKW96oU4+Lc8FxGd
FI4VLqyK1SzQDNe931XX46Rr8CdQDGf6Q8kUzvv/GmPdtagOBTxuIrElbwpkeu7JIRMJ7A4UmEbb
WrltRYB8zncjpDmqFGZqDEIJPnFxqC2zoXUCTN/XRIurnlVc970ivq05MmCWjh5L1SeqcCKVUwXX
OUx5DmtVEvUr2HvieniVDl2W2GFoiH5M79J+5gZhTHQN0a9FlUoGQz3Pn7lyTuea+E8L3GrMz1M2
1M5d00Ki4KgnSRprPg5msffR4MKASDRJitOMx8r3rGGfqsjXFgb7LkvGfjHG/3bov5ppBFu0AW2n
1EnpGmdKi/4pz2Zu+TwhiWH++I+OThE42k8uAh5eSY4iXAx0935rx1CLOy9HLABF3QdEokK5VCRv
0rldeFTKKPqiNlKDdchX5PiIPnMRMgKT+qJOnoFOFjbFZVeRuqaWeomMoZ4gPnoadgMIb/mosYoq
OSRbxt+/hQIHlP6quth4ZjAzV37KamCOKfvtEL8Wuu17gxTOvLW5dw/nJDmNFgwyh3hLYnsWtpdp
jZbXG8B7YwAa7sJX/sUF+P9VI44CemhbbZqj9KYmafQEfPyvcC9SI3CaK5hpTtQPJhYddeKawLWc
T+k=
=Ml+Z
-----END PGP SIGNATURE-----

--v0AcL5C2mtYydwyBD2wF9vN1QPUELrBtZ--
