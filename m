Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 026FB3DABC5
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 21:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 547B06EE3E;
	Thu, 29 Jul 2021 19:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 586966EE3A;
 Thu, 29 Jul 2021 19:21:18 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B9B812237F;
 Thu, 29 Jul 2021 19:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627586476; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FRjk3sSKAJ0GgQWrqGFQs/HiARPC+bYALbL6EW5s828=;
 b=abvpwR45Pw3eB3L9AnfN13GV+kP6qZqF4HcwqVRKTaYMOjq0qhbL+v4SrOl4R0CXOVk3GP
 V7ktKxC9z3/lAUK3zYWjgFYUEHQGEc5Hgexs0mIPi5wZZ+/JdSTasMtlahwZtO55Oq2T5X
 Gk4r4Vm/YArb0WT6nYo1s0CoC6tcChA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627586476;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FRjk3sSKAJ0GgQWrqGFQs/HiARPC+bYALbL6EW5s828=;
 b=JqrrnwHS8m+K3Una3aJD38FjuLZZm6/jRuHqtiq5R0tjFkq9z/oWnwFhOQYR/m/tnS0OT9
 wucaFv5W32ELPvDw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 8488E13756;
 Thu, 29 Jul 2021 19:21:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id Nf6rF6v/AmEHaQAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Thu, 29 Jul 2021 19:21:15 +0000
Subject: Re: [PATCH 03/14] drm/atmel-hlcdc: Convert to Linux IRQ interfaces
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>, Dan.Sneddon@microchip.com
References: <20210727182721.17981-4-tzimmermann@suse.de>
 <YQFi96yaYbTG4OO7@ravnborg.org>
 <e28b1a2f-015c-c81b-eb64-5323df9ed35d@microchip.com>
 <YQF7bKyeup8n3awU@ravnborg.org>
 <3d2f6b84-dd07-d925-a8b8-2bfd5fc736d9@microchip.com>
 <YQGdxtV0BGZ8VOpm@ravnborg.org>
 <2f04b986-6b41-62f9-1587-23818b841655@suse.de>
 <793514f6-0270-771b-fe36-f82edf4e5fd2@microchip.com>
 <YQGrMH36Udg3eKQY@ravnborg.org>
 <dcc5cd1e-d0de-bdda-32f3-623b85085756@microchip.com>
 <YQG5+/9lPexU3Dn3@ravnborg.org>
 <1df22406-2e91-c15a-49dc-1cf33522a142@suse.de>
Message-ID: <7067cca1-c8a4-347c-829a-accdce8c6aef@suse.de>
Date: Thu, 29 Jul 2021 21:21:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1df22406-2e91-c15a-49dc-1cf33522a142@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="0E3gTnkoECLDq8FuUqBM1dW3HzVnSTQZs"
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
Cc: airlied@linux.ie, liviu.dudau@arm.com, amd-gfx@lists.freedesktop.org,
 anitha.chrisanthus@intel.com, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, edmund.j.dea@intel.com,
 s.hauer@pengutronix.de, alison.wang@nxp.com, dri-devel@lists.freedesktop.org,
 sean@poorly.run, linux-arm-kernel@lists.infradead.org, tomba@kernel.org,
 bbrezillon@kernel.org, jyri.sarha@iki.fi, Nicolas.Ferre@microchip.com,
 christian.koenig@amd.com, kernel@pengutronix.de, alexander.deucher@amd.com,
 shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0E3gTnkoECLDq8FuUqBM1dW3HzVnSTQZs
Content-Type: multipart/mixed; boundary="oZfHGEJSgs3vHDPPh2hmpB1WlR5eRU4HT";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>, Dan.Sneddon@microchip.com
Cc: daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
 christian.koenig@amd.com, liviu.dudau@arm.com, brian.starkey@arm.com,
 bbrezillon@kernel.org, Nicolas.Ferre@microchip.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, stefan@agner.ch,
 alison.wang@nxp.com, patrik.r.jakobsson@gmail.com,
 anitha.chrisanthus@intel.com, robdclark@gmail.com, edmund.j.dea@intel.com,
 sean@poorly.run, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, jyri.sarha@iki.fi, tomba@kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Message-ID: <7067cca1-c8a4-347c-829a-accdce8c6aef@suse.de>
Subject: Re: [PATCH 03/14] drm/atmel-hlcdc: Convert to Linux IRQ interfaces
References: <20210727182721.17981-4-tzimmermann@suse.de>
 <YQFi96yaYbTG4OO7@ravnborg.org>
 <e28b1a2f-015c-c81b-eb64-5323df9ed35d@microchip.com>
 <YQF7bKyeup8n3awU@ravnborg.org>
 <3d2f6b84-dd07-d925-a8b8-2bfd5fc736d9@microchip.com>
 <YQGdxtV0BGZ8VOpm@ravnborg.org>
 <2f04b986-6b41-62f9-1587-23818b841655@suse.de>
 <793514f6-0270-771b-fe36-f82edf4e5fd2@microchip.com>
 <YQGrMH36Udg3eKQY@ravnborg.org>
 <dcc5cd1e-d0de-bdda-32f3-623b85085756@microchip.com>
 <YQG5+/9lPexU3Dn3@ravnborg.org>
 <1df22406-2e91-c15a-49dc-1cf33522a142@suse.de>
In-Reply-To: <1df22406-2e91-c15a-49dc-1cf33522a142@suse.de>

--oZfHGEJSgs3vHDPPh2hmpB1WlR5eRU4HT
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 29.07.21 um 21:18 schrieb Thomas Zimmermann:
> Hi
>=20
> Am 28.07.21 um 22:11 schrieb Sam Ravnborg:
>> Hi Dan,
>>
>>>>
>>>> I think I got it - we need to set irq_enabled to true.
>>>> The documentation says so:
>>>> "
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * @irq_=
enabled:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Indic=
ates that interrupt handling is enabled,=20
>>>> specifically vblank
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * handl=
ing. Drivers which don't use drm_irq_install()=20
>>>> need to set this
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * to tr=
ue manually.
>>>> "
>>>>
>>>> Can you try to add the following line:
>>>>
>>>>
>>>> +static int atmel_hlcdc_dc_irq_install(struct drm_device *dev,=20
>>>> unsigned int irq)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (irq =3D=3D IRQ_NOTCONNECTE=
D)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return -ENOTCONN;
>>>> +
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->irq_enab=
led =3D true;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <=3D THIS LINE
>>>>
>>>>
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 atmel_hlcdc_dc_irq_disable(dev=
);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D request_irq(irq, atmel=
_hlcdc_dc_irq_handler, 0,=20
>>>> dev->driver->name, dev);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return ret;
>>>>
>>>> I hope this fixes it.
>>>
>>> It does!=C2=A0 With the irq_enabled line added everything is looking =
good.
>=20
> Are you sure, you're testing with the latest drm-misc-next or drm-tip? =

> Because using irq_enabled is deprecated and the flag was recently=20
> replaced by commit 1e4cd78ed493 ("drm: Don't test for IRQ support in=20
> VBLANK ioctls").

For reference, the cover letter lists

base-commit: 2bda1ca4d4acb4892556fec3a7ea1f02afcd40bb

which is a recent drm-tip created on July 25.

Best regards
Thomas

>=20
> Best regards
> Thomas
>=20
>>
>> Great, thanks for testing.
>>
>> Thomas - I assume you will do a re-spin and there is likely some fixes=

>> for the applied IRQ conversions too.
>>
>> Note - irq_enabled must be cleared if request_irq fails. I did not
>> include this in the testing here.
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0Sam
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--oZfHGEJSgs3vHDPPh2hmpB1WlR5eRU4HT--

--0E3gTnkoECLDq8FuUqBM1dW3HzVnSTQZs
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmEC/6oFAwAAAAAACgkQlh/E3EQov+DP
WBAAhN1PPONpW2TVKis0ZvNuMhTlUsp7foKn/2COaGdiypjUneDQNoByIvPFGGvBOMxwn02KjtVY
pT+YMgH0d6vr0H6g7VZNXZW1683cUhrqNoX+wDISa4/In+2MsDeUf1jgPUPOKD8rKrOaAMsHNVhL
CVjPhTLk/2JTHLG1m81AhW2I1UNxaaSmFF/VTs75mEJ3vBc7VIk129VSde0lkt0GrQjNsQFumbRp
uX6Gp5h1mFRS6zTAW/lP4KA8KFsJrOzFFmErGbRPsZyWIgAkV4uc/9DIdkax6nMV6C7V1bCpLM2G
wMIs4jUR4+2iUmw/AFcuKMEXsIOTlOm7BnjunOpHwjXMREP4lvCDPAPhq2DOmLxhVlUMqjJWBKXF
GJD0VVAyAnBoNClL3MQFD7RpG8/vTgcZiyPvmJUhu1blIq/j7bWQQScWeQjuB0ztdliSMjGGK6Zm
Lh1mMnWxB0MusFV1uzQcNMcauKJZ72tghNZ6pjbUV3aEA6FUDy6Ug5XifNCNdNPxae+XwQR1t2dK
L1gUFsHNuaBP2T3mN+jtS6Jkh5gJEjUhdRMeU+nu6j7jH+G7DJlBUmkIvzRi+PCK6a82xoWJDI0w
YsJGVemBE3duYxKpIJ5700mHX9YVXmq88tTUb7wboYQPjVQIhEi68Cwve1coyitFoRWoeECzJARL
pIc=
=36fU
-----END PGP SIGNATURE-----

--0E3gTnkoECLDq8FuUqBM1dW3HzVnSTQZs--
