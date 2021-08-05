Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B356B3E1B80
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 20:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73BAF6E408;
	Thu,  5 Aug 2021 18:40:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C546E408;
 Thu,  5 Aug 2021 18:40:10 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C66901FE76;
 Thu,  5 Aug 2021 18:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628188808; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=waXWZeZbrZpwHf6cYwfpj1aXbKeZESlw3gmddpo7AUQ=;
 b=ROQ6P81aVCCQP8QJ0Js562/Ql+bZfOW+PoMt5lyNw87DtTXnUT5K4f4ZhtNiayX7hmRoqR
 jzkXVvX+M2AEaIVa23cHWsw8jd6lmnqNAeDJ7afEN2PAuIGkLEExUoQSlFocow3KSTzQqg
 mBBVyAXc7OFGKpNQVtAyQo/p+Fn1tww=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628188808;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=waXWZeZbrZpwHf6cYwfpj1aXbKeZESlw3gmddpo7AUQ=;
 b=I82DmhCeMzvNTawziO+fZLsYOetHQL2Rg83CN/qu3vxEqbyrbbbCksOgjkJtEEklSgA3Ec
 /SCVS5CcTobHy5Dg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 8668013A5D;
 Thu,  5 Aug 2021 18:40:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id t7MMH4gwDGHkfQAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Thu, 05 Aug 2021 18:40:08 +0000
Subject: Re: [PATCH v4 3/4] drm/shmem-helpers: Allocate wc pages on x86
To: Daniel Vetter <daniel@ffwll.ch>
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20210713205153.1896059-1-daniel.vetter@ffwll.ch>
 <20210713205153.1896059-4-daniel.vetter@ffwll.ch>
 <0e4eefe0-9282-672c-7678-8d3162de35e3@suse.de>
 <YPpxh0QhILXESykX@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <ea741e89-6ed0-fe7d-6462-7ca01b14c4b9@suse.de>
Date: Thu, 5 Aug 2021 20:40:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YPpxh0QhILXESykX@phenom.ffwll.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="GDOaXABZ9cXJXn60nZxob2czYg06HXaQS"
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GDOaXABZ9cXJXn60nZxob2czYg06HXaQS
Content-Type: multipart/mixed; boundary="hvSqbUatCvThoUwY9hDhBeC551W4wEtm0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ea741e89-6ed0-fe7d-6462-7ca01b14c4b9@suse.de>
Subject: Re: [PATCH v4 3/4] drm/shmem-helpers: Allocate wc pages on x86
References: <20210713205153.1896059-1-daniel.vetter@ffwll.ch>
 <20210713205153.1896059-4-daniel.vetter@ffwll.ch>
 <0e4eefe0-9282-672c-7678-8d3162de35e3@suse.de>
 <YPpxh0QhILXESykX@phenom.ffwll.local>
In-Reply-To: <YPpxh0QhILXESykX@phenom.ffwll.local>

--hvSqbUatCvThoUwY9hDhBeC551W4wEtm0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 23.07.21 um 09:36 schrieb Daniel Vetter:
>=20
> The real fix is to get at the architecture-specific wc allocator, which=
 is
> currently not something that's exposed, but hidden within the dma api. =
I
> think having this stick out like this is better than hiding it behind f=
ake
> generic code (like we do with drm_clflush, which defacto also only real=
ly
> works on x86).
>=20
> Also note that ttm has the exact same ifdef in its page allocator, but =
it
> does fall back to using dma_alloc_coherent on other platforms.

If this fixes a real problem and there's no full solution yet, let's=20
take what we have. So if you can extract the essence of this comment=20
into a TODO comment that tells how to fix the issue, fell free to add my

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Best regards
Thomas

> -Daniel
>=20
>> Best regard
>> Thomas
>>
>>> +
>>>    	shmem->pages =3D pages;
>>>    	return 0;
>>> @@ -203,6 +212,11 @@ static void drm_gem_shmem_put_pages_locked(struc=
t drm_gem_shmem_object *shmem)
>>>    	if (--shmem->pages_use_count > 0)
>>>    		return;
>>> +#ifdef CONFIG_X86
>>> +	if (shmem->map_wc)
>>> +		set_pages_array_wb(shmem->pages, obj->size >> PAGE_SHIFT);
>>> +#endif
>>> +
>>>    	drm_gem_put_pages(obj, shmem->pages,
>>>    			  shmem->pages_mark_dirty_on_put,
>>>    			  shmem->pages_mark_accessed_on_put);
>>>
>>
>> --=20
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>> (HRB 36809, AG N=C3=BCrnberg)
>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>
>=20
>=20
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--hvSqbUatCvThoUwY9hDhBeC551W4wEtm0--

--GDOaXABZ9cXJXn60nZxob2czYg06HXaQS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmEMMIcFAwAAAAAACgkQlh/E3EQov+D+
NQ/7Bt4FLIlW0dFG2DEbpeNGYaL+gv3LgX8u2uoo5UiZxLibSUfBAX6usZd/ZJzohiBVKsNINnkC
WY5fvH+zA+O412ESs8JM4J3zjIQrccEpLAUjFImbaNtb+0E1DHHeK8aDqIW2eGvLtAeFvGs8BSqA
/HxdxOxkp5VuzFIb+YplUrxnFpDVzhb/AbbTtGIXR5+sh59Fe0ZLXcLyF1abx4fAauVbvLIo4Ux0
Tnbfucu+5pekvn/4D5nv3zfR9JigPKd4CsB9ucU3xpSEEg7242FWsvA413TEAPusdtmZx55Lh14r
07b7uw6GccWtj6kWFjNJ3AGAEIDagjhxRLJl9pHHSSvjyMKkzHgf4NhhM5o7Go86jgPXTaAZggil
yHDFzRaOHi7dXtSi3ceCfSN4zHdq2aGRqRUqCEDm7V9deZh48ntVR9oXVoAYhoTuSGNtq5BDEGNP
/gq6zoORg5lsLyS7F9ILRx6oRzWkzYV+F6hcSQIft9VgOT4lAC6IHDhC4gyDeUuiVmkU5lbB0E7v
c8BhnfkXj8T7vvvrh3X4mFTPJoXmc4RffvuPYgN/CtF3sRbpmSZ7R3JfkfrJGVSC4gCuHICrMbr4
aDwe77kZ7t2DGXR6bv7O8gBzr4kLVVqUGiI08MTimuNMbEKXLewZxZyT24NoqMdvYyrLG7FTq6ne
O8Y=
=+dRj
-----END PGP SIGNATURE-----

--GDOaXABZ9cXJXn60nZxob2czYg06HXaQS--
