Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2063B9BBB
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 06:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8619E6E030;
	Fri,  2 Jul 2021 04:59:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362B26E030
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 04:59:04 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A1025228DF;
 Fri,  2 Jul 2021 04:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625201942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Tv3QKjDKtCRFFICcO+FIzCWvXOARvMa8Bztz5cXka+Q=;
 b=qKHW1op8BcST2lZ6jmbS251zKGfcOynr/ON0eL2pA2DTHi4fob0XIRoqMi1qwYqhuocUZ+
 VIzF/Np0Z2SqRzlZNP8Q+iaucIAowab4rWYsItu/IDfkd9+4wsCQtD702AVUEfLZrZXHTn
 +6BwSVHdJIUxWBdwGqWAJWKUDbsDWzU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625201942;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Tv3QKjDKtCRFFICcO+FIzCWvXOARvMa8Bztz5cXka+Q=;
 b=1OTj68DudBLsZNB0LSbrIbHfmupGEJ/Saq7Pzzpw06rGD8wriN/R91YxeJSGhzZPeUcfW4
 MlSeOg5BcjNELXDg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 7D3D011CD6;
 Fri,  2 Jul 2021 04:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625201942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Tv3QKjDKtCRFFICcO+FIzCWvXOARvMa8Bztz5cXka+Q=;
 b=qKHW1op8BcST2lZ6jmbS251zKGfcOynr/ON0eL2pA2DTHi4fob0XIRoqMi1qwYqhuocUZ+
 VIzF/Np0Z2SqRzlZNP8Q+iaucIAowab4rWYsItu/IDfkd9+4wsCQtD702AVUEfLZrZXHTn
 +6BwSVHdJIUxWBdwGqWAJWKUDbsDWzU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625201942;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Tv3QKjDKtCRFFICcO+FIzCWvXOARvMa8Bztz5cXka+Q=;
 b=1OTj68DudBLsZNB0LSbrIbHfmupGEJ/Saq7Pzzpw06rGD8wriN/R91YxeJSGhzZPeUcfW4
 MlSeOg5BcjNELXDg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id sjbvHBad3mB4QgAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Fri, 02 Jul 2021 04:59:02 +0000
Subject: Re: [PATCH 0/4] mgag200: Various cleanups
To: Sam Ravnborg <sam@ravnborg.org>
References: <20210701124316.20818-1-tzimmermann@suse.de>
 <YN4CRegcRH0B1iQF@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <517e1b3d-3e0f-e396-acc7-10b6ed8b5fd9@suse.de>
Date: Fri, 2 Jul 2021 06:59:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YN4CRegcRH0B1iQF@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Wj68rWiylgFPPdDxIwo2JkQbTnLQaGwdl"
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Wj68rWiylgFPPdDxIwo2JkQbTnLQaGwdl
Content-Type: multipart/mixed; boundary="1rDxerqSPrDMVHzbYEWkSPsygtFn7YBIT";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: daniel@ffwll.ch, airlied@redhat.com, dri-devel@lists.freedesktop.org
Message-ID: <517e1b3d-3e0f-e396-acc7-10b6ed8b5fd9@suse.de>
Subject: Re: [PATCH 0/4] mgag200: Various cleanups
References: <20210701124316.20818-1-tzimmermann@suse.de>
 <YN4CRegcRH0B1iQF@ravnborg.org>
In-Reply-To: <YN4CRegcRH0B1iQF@ravnborg.org>

--1rDxerqSPrDMVHzbYEWkSPsygtFn7YBIT
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Sam

Am 01.07.21 um 19:58 schrieb Sam Ravnborg:
> Hi Thomas,
>=20
> On Thu, Jul 01, 2021 at 02:43:12PM +0200, Thomas Zimmermann wrote:
>> Cleanup several nits in the driver's init code. Also move constant
>> data into the RO data segment. No functional changes.
>>
>> Tested on mgag200 HW.
>>
>> Thomas Zimmermann (4):
>>    drm/mgag200: Don't pass flags to drm_dev_register()
>>    drm/mgag200: Inline mgag200_device_init()
> This patch drop a redundant error message too - it had helped me if the=

> changelog had said so but whatever.

Sure, I'll add it to the log.

>=20
>>    drm/mgag200: Extract device type and flags in mgag200_pci_probe()
>>    drm/mgag200: Constify LUT for programming bpp
>=20
> Full serie is:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Thanks for the review.

Best regards
Thomas

>=20
> 	Sam
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--1rDxerqSPrDMVHzbYEWkSPsygtFn7YBIT--

--Wj68rWiylgFPPdDxIwo2JkQbTnLQaGwdl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDenRYFAwAAAAAACgkQlh/E3EQov+D+
7Q//cdfQ27SzDZrOSfCfa+IXnEpHuJWl29S+sUFXKAMUWvdbC2f7SunHnhhku5b3cz1QF2UWaMjP
WbzbIPfB5gYFIWLQzekTs1AEbPwhClVxdP4IxRPGIKR38+pMfF6MPGblyryMuOhyULG0ACdevszD
6ysauoUAMr+4y47GdHNTL4UqeD1CKrZRfVwM9fRxLk/C/jTkopWxpXXuMvEx3bP/wavx0vUjs+82
ka2QObOVLkKrgtpHJj4ROZ1mjWrHlavjuePeQ68YDcBhcLPwLW8N7NLHuxDl3Z6b0t86ka601npj
cY+roLu2JR77ELZGNTTeHcLfkBCNmz8qEDRCub6Ts7L5otAlc1PZDU7JcAORUlG32qLhXU++YJMS
O188Hko/ME8miCMICFJffoGk+mQueVzLQXshxPCf55zEf1zZ6ZEO/AhBz+xbBDV4gG/MuGZwobFA
KLze04kIG8lm25o1TrOrn75PE/YHz/9+uXhB7jgufZU1NN1ZOpZoyNALrRdwFaxHKkdN2IjW6++D
4r/1j+QXVJx6uyQTsjU1t9kofFL1qwGxataDbOQmsDBzjO5k1g6p7b+tc657ajDJBIy3mF+C1EGI
pS9QtIeYTOBkrXLydKTSaiVM+1c9Fjo45sA+l4TG7ur8kBGlHMOnsuWcMb/rkAfxrG5mXWpxBxtm
qMM=
=Hlta
-----END PGP SIGNATURE-----

--Wj68rWiylgFPPdDxIwo2JkQbTnLQaGwdl--
