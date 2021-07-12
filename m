Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1473C5D85
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 15:42:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A8989895;
	Mon, 12 Jul 2021 13:42:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC0289895
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 13:42:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 53E3E21FBD;
 Mon, 12 Jul 2021 13:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626097346; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q7y4L0HKyDu+PilXYPvT/RHccGh2ISJPeaYn2BTW4GA=;
 b=0iDIzxp/K/gPAG1ax+57fBlAwj0eGJ1kk6xIDHapLHes4LXbooZy/YY+TS4WWYGa7Y+cxC
 U4fyyNsA6BHtuPOcCsSJET4wd4LrzVHlO9QHDwlDoG5fQojiO/JrJN6ejnRPr6eN0XwX9q
 k3QUkHKDF1icIIKM+hpgFGbecBPadoA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626097346;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q7y4L0HKyDu+PilXYPvT/RHccGh2ISJPeaYn2BTW4GA=;
 b=oA0h9MY3Q89C+nGeKex0p3EHmFA55jaRrRTV8RH4hco1SYvBqGMDFO4op+fA9FVFAC/Qus
 EezQnk9BkWVjEVBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 26BF713BAE;
 Mon, 12 Jul 2021 13:42:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Aw9TCMJG7GCubAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Jul 2021 13:42:26 +0000
Subject: Re: [PATCH 02/12] drm/mgag200: Return errno codes from PLL compute
 functions
To: Sam Ravnborg <sam@ravnborg.org>
References: <20210705124515.27253-1-tzimmermann@suse.de>
 <20210705124515.27253-3-tzimmermann@suse.de> <YOibJbgFFfqQ6VqS@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <92d37579-0f5a-9f98-9c2c-4aeaedf38ac4@suse.de>
Date: Mon, 12 Jul 2021 15:42:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOibJbgFFfqQ6VqS@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="RYT51dxukiQy00OEm2bse0n2sM2rm5aQM"
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
Cc: John.p.donnelly@oracle.com, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, emil.velikov@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--RYT51dxukiQy00OEm2bse0n2sM2rm5aQM
Content-Type: multipart/mixed; boundary="JKeQAudcoOWBWgTEugWE0PEKTZ4cMiKLU";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: daniel@ffwll.ch, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, emil.velikov@collabora.com, John.p.donnelly@oracle.com,
 dri-devel@lists.freedesktop.org
Message-ID: <92d37579-0f5a-9f98-9c2c-4aeaedf38ac4@suse.de>
Subject: Re: [PATCH 02/12] drm/mgag200: Return errno codes from PLL compute
 functions
References: <20210705124515.27253-1-tzimmermann@suse.de>
 <20210705124515.27253-3-tzimmermann@suse.de> <YOibJbgFFfqQ6VqS@ravnborg.org>
In-Reply-To: <YOibJbgFFfqQ6VqS@ravnborg.org>

--JKeQAudcoOWBWgTEugWE0PEKTZ4cMiKLU
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 09.07.21 um 20:53 schrieb Sam Ravnborg:
> On Mon, Jul 05, 2021 at 02:45:05PM +0200, Thomas Zimmermann wrote:
>> Return -EINVAL if there's no PLL configuration for the given pixel
>> clock.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/mgag200/mgag200_mode.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/=
mgag200/mgag200_mode.c
>> index 482843ebb69f..045a20055515 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
>> @@ -134,7 +134,7 @@ static int mgag200_g200_set_plls(struct mga_device=
 *mdev, long clock)
>>  =20
>>   	if (clock > p_clk_max) {
>>   		drm_err(dev, "Pixel Clock %ld too high\n", clock);
>> -		return 1;
>> +		return -EINVAL;
>>   	}
>>  =20
>>   	if (clock < p_clk_min >> 3)
>> @@ -293,7 +293,7 @@ static int mga_g200se_set_plls(struct mga_device *=
mdev, long clock)
>>  =20
>>   	if (delta > permitteddelta) {
>>   		pr_warn("PLL delta too large\n");
>> -		return 1;
>> +		return -EINVAL;
>>   	}
>>  =20
>>   	misc =3D RREG8(MGA_MISC_IN);
>=20
> The return value is ignored but I assume it makes sense in a later
> patch. Should mgag200_crtc_set_plls() return -EINVAL if there was no
> match? Today it returns 0 - which is not an error.

Indeed. Patch 12 moves some of this functionality into the atomic check, =

where it will be tested for success.

Not handling the type in the switch is actually a driver bug. I'll see=20
if I can add a rsp error in one of the patches.

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


--JKeQAudcoOWBWgTEugWE0PEKTZ4cMiKLU--

--RYT51dxukiQy00OEm2bse0n2sM2rm5aQM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDsRsAFAwAAAAAACgkQlh/E3EQov+Ao
nhAAyys1yjBxB002rrx1QwTVuQT9CJrxaBbTnNwCRYYg5ZOqpu+Hc0tGW1zoay1dzp/JazenbxSs
a9YmG6oxEstAcDl8B/t7hbdyTLHSCQXKvi/ehReKxeizHWFJ3vOEGmNNxOxKftY+VNtmm7R4fH5B
NUFMC9SKE9D6ZSE99aokkjfK6NJU7Zppht85it3NBDzxIvOSyqKC7wVB8q7xBR7Sb2Y99NN9qgYt
rvKVXsbKwxgFytCb7xdhv6+VoEfxe5JVWk879dEXtc2ypCajyb5gJcJ6n92fu/ojTurX3Pdl9NlS
I7IJ3f4Vy4JUENWXFAwYrVxt2SKpIAOPCCxWK0WZH2K8gIDCKpXNkaEhAG/7h8hnWfa5+b4QAXAt
fJc25xAhAA7pAb6fcgS/4/lOZ4ZrbSIuY/tkCmFniVNnznB7nBoOhOrEWZ+v3AfElOkCad4a1aop
Ds6FqovyO+WzrwshDKI9dEmYY0yIsFUt54LePNBOSiFPvisOkyBieYQL3b7/+sCNlMlc03zQO+OO
N9qm2F6xQewMFYaNNnBuEsu181z87lpOuUGYM7Z7ILZ2ndjCJ79lODSQpJcJUOBpZoOY3MLe/Rpg
iM4yYEF4PuTliBJzKjug7RDpH3NwNzpxRkT4U/H4N87S3G+/EJmNLkxOcfAuuIme1R1z6KBRIRkf
8dY=
=AdN1
-----END PGP SIGNATURE-----

--RYT51dxukiQy00OEm2bse0n2sM2rm5aQM--
