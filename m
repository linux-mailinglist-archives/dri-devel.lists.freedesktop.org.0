Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA0B3F0BDF
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 21:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 417446E92E;
	Wed, 18 Aug 2021 19:35:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5686E92E
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 19:35:50 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 54C1C21F55;
 Wed, 18 Aug 2021 19:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1629315349; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5REYHZJaeQ7aQ55wmc9i4ui53D4O5AbQQQh58aqPpdA=;
 b=Q+fgH7+dS0JgLIYowfni13PKxvqr++fioaSybe0mVBWXMonPbgOaWtiEG+3pFSamNIiM2d
 t9Nc8al1fO6f0Y3hOAo4fH1QHNlVYO2DJuqzrSeX7dlT7KYNwqIO2nXE1IFvqaTgNth/kN
 wNHH/atjGUzqFy50XqL/eepQhDXbFzg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1629315349;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5REYHZJaeQ7aQ55wmc9i4ui53D4O5AbQQQh58aqPpdA=;
 b=Dn96PVcsTQ4MnU8Mknx9qPwMZQCNO6gtxES5xqhb4zHejqZGnoRbAhzn06BPaxLCfX540q
 JvUKcphAV4b1gWBw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 105EB1371C;
 Wed, 18 Aug 2021 19:35:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id /HwLAhVhHWEcMwAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Wed, 18 Aug 2021 19:35:49 +0000
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 kernel test robot <lkp@intel.com>
References: <20210817181626.30230-1-tzimmermann@suse.de>
 <CAKMK7uGikc9pPQDUcimEwN1+cYo+j9pRt11ctGoUL-vz-GN6+w@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/mgag200: Initialize delta variable in PLL compute
 function
Message-ID: <b4d94e0b-36d3-3afd-8ea9-67bcc73edc36@suse.de>
Date: Wed, 18 Aug 2021 21:35:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uGikc9pPQDUcimEwN1+cYo+j9pRt11ctGoUL-vz-GN6+w@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="eh3BMCVAqfiR0Gt4R30aJQI7YXWVn6a5c"
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
--eh3BMCVAqfiR0Gt4R30aJQI7YXWVn6a5c
Content-Type: multipart/mixed; boundary="weJmTJ4Icv9YoBxQth6Yivs3xWuyPpEwS";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 kernel test robot <lkp@intel.com>
Message-ID: <b4d94e0b-36d3-3afd-8ea9-67bcc73edc36@suse.de>
Subject: Re: [PATCH] drm/mgag200: Initialize delta variable in PLL compute
 function
References: <20210817181626.30230-1-tzimmermann@suse.de>
 <CAKMK7uGikc9pPQDUcimEwN1+cYo+j9pRt11ctGoUL-vz-GN6+w@mail.gmail.com>
In-Reply-To: <CAKMK7uGikc9pPQDUcimEwN1+cYo+j9pRt11ctGoUL-vz-GN6+w@mail.gmail.com>

--weJmTJ4Icv9YoBxQth6Yivs3xWuyPpEwS
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 17.08.21 um 21:50 schrieb Daniel Vetter:
> On Tue, Aug 17, 2021 at 8:16 PM Thomas Zimmermann <tzimmermann@suse.de>=
 wrote:
>>
>> Initialize delta variable in PLL compute function for G200SE, rev 00 t=
o
>> the maximum value. Fixes uninitialized usage.
>>
>>    smatch warnings:
>>    drivers/gpu/drm/mgag200/mgag200_pll.c:142 mgag200_pixpll_compute_g2=
00se_00() \
>>    error: uninitialized symbol 'delta'.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Fixes: 2545ac960364 ("drm/mgag200: Abstract pixel PLL via struct mgag2=
00_pll")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Dave Airlie <airlied@redhat.com>
>> Cc: dri-devel@lists.freedesktop.org
>=20
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>=20
> I checked a bit your integer types, and there's a fair bit of
> inconsistency for what you're using for clock. unsigned int, long, int
> can all be found somewhere. But that's  different story.

Better not look at the PLL code if you value your eyesight. I untangled=20
the computation of the values from the register setup, but I don't dare=20
to change the algorithms.

In principle, most devices should be able to share a single algorithm=20
for computing the values and writing them out. But somehow they all=20
differ. Maybe some minimal cleanup can be done. Without actual HW for=20
testing, I'd rather not touch the logic.

Best regards
Thomas

> -Daniel
>=20
>> ---
>>   drivers/gpu/drm/mgag200/mgag200_pll.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_pll.c b/drivers/gpu/drm/m=
gag200/mgag200_pll.c
>> index 7c903cf19c0d..e9ae22b4f813 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_pll.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_pll.c
>> @@ -124,6 +124,7 @@ static int mgag200_pixpll_compute_g200se_00(struct=
 mgag200_pll *pixpll, long clo
>>          unsigned int computed;
>>
>>          m =3D n =3D p =3D s =3D 0;
>> +       delta =3D 0xffffffff;
>>          permitteddelta =3D clock * 5 / 1000;
>>
>>          for (testp =3D 8; testp > 0; testp /=3D 2) {
>> --
>> 2.32.0
>>
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--weJmTJ4Icv9YoBxQth6Yivs3xWuyPpEwS--

--eh3BMCVAqfiR0Gt4R30aJQI7YXWVn6a5c
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmEdYRQFAwAAAAAACgkQlh/E3EQov+A8
vA/+NhhpCj4ofncrMYnQ+fJlNhGv06ts8XC2IgO/xipAVrfDXnyVccYGtD4NMtVwyQgL97eVHnyN
KYiFtrJKqbJrHPJyCIr/qa3BQPbq1fKFVDDSuSTsRo4APIt0v/qGAZAiLldccMi6Le7HVRBnQ3xl
bodg9qSKSpH0L/IehCSriSmYESdCD1p5R2fYkKzoBYZKwbX587eruGGhgKT2qUn6180UmV/QAsgY
vNH42opRwZuqmJbqS13oQJQbV9ZKyBsYcs30fg7GbCbmW4fV3XXsqmpTiD9EHHFlnSLb+Pu8AOuG
BDzA4kAbCITZP+/s6lAW/D7qsz7aCbuIIEXUNLBqjfqIZTEx0PKdSTteXzTsYyMfp+vpF7V18kgp
v661tlJVdErCLHv1lF7snISINwHHDNh1Q6wagdV8tNDdC34dSfkW4Tzm0GdNDNcIz1M/3vpniAf+
/sSsMG9/bUPJ5ohYsFF8nW4d727rOdMG9nNDZG+vSj1RutIZPmOd2RXgn9unSAmyT8/hBUy3khml
48YOPOxaWPuILIAT2jHl0f6kEjyl2un7w4SLmqNji4zyrP/y3OBRVFDe0Sh2Y+dLhFQ5KVSr1oH/
RdrRVaFmMvfvYj5/gidEbm5Licvfn9wORRcT9wAotPgB7GZ+EoE/hotyL75faJm2nmUhLGHVZK8l
LZY=
=5SN6
-----END PGP SIGNATURE-----

--eh3BMCVAqfiR0Gt4R30aJQI7YXWVn6a5c--
