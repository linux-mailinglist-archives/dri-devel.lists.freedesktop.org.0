Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 477E23DD22F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 10:42:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF086E169;
	Mon,  2 Aug 2021 08:42:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C53246E169;
 Mon,  2 Aug 2021 08:42:30 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E82EB1FF41;
 Mon,  2 Aug 2021 08:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627893748; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VLJkLyS0iFpmlZrDlO4dUG2u4HydySx7OOBknMnDVvo=;
 b=bYoTcKX215KPV1eQlnfFLPot2GfsKV5dcuwQuJ9ecsCa+N4EO8x9yPOtI8jm3F+EB/vzxu
 +KlehEpk/B719w6xOtK9gD3QlnLxoKsXPUgErHZCVb6BwacpCo0v7N+QA4Q8k8e/HhH5ql
 vHuCgTtwV0Ue11hG14oxi07U00RBqDg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627893748;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VLJkLyS0iFpmlZrDlO4dUG2u4HydySx7OOBknMnDVvo=;
 b=ktt6eLeT0M0jz05x7EDpKfGyRdfu/9/9FuPqblw64n5QqH/2JPFhU0q5DzVyi9UvVnKaFQ
 DsWmr8207tA90jDw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 3D8EE13882;
 Mon,  2 Aug 2021 08:42:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id M4YnDfSvB2EwDgAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Mon, 02 Aug 2021 08:42:28 +0000
Subject: Re: [PATCH 00/14] drm: Make DRM's IRQ helpers legacy
To: Sam Ravnborg <sam@ravnborg.org>
Cc: daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
 christian.koenig@amd.com, liviu.dudau@arm.com, brian.starkey@arm.com,
 bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, stefan@agner.ch,
 alison.wang@nxp.com, patrik.r.jakobsson@gmail.com,
 anitha.chrisanthus@intel.com, robdclark@gmail.com, edmund.j.dea@intel.com,
 sean@poorly.run, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, jyri.sarha@iki.fi, tomba@kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
References: <20210727182721.17981-1-tzimmermann@suse.de>
 <YQWbWjV5TYzp+5C4@ravnborg.org>
 <d50b3199-20fe-0ecb-ab7d-7425ad1d0f21@suse.de>
 <YQcDCVuSM2kLbQcI@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <7cbd968e-caec-0fdb-8f23-f3fb11664ce3@suse.de>
Date: Mon, 2 Aug 2021 10:42:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQcDCVuSM2kLbQcI@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="j44ztPryqGh1Sl1wWncDBLPSUvmHnlHRM"
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
--j44ztPryqGh1Sl1wWncDBLPSUvmHnlHRM
Content-Type: multipart/mixed; boundary="wtdo6GS3bhbopv6iuyySLWGZg3Vkoz6Ku";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
 christian.koenig@amd.com, liviu.dudau@arm.com, brian.starkey@arm.com,
 bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, stefan@agner.ch,
 alison.wang@nxp.com, patrik.r.jakobsson@gmail.com,
 anitha.chrisanthus@intel.com, robdclark@gmail.com, edmund.j.dea@intel.com,
 sean@poorly.run, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, jyri.sarha@iki.fi, tomba@kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Message-ID: <7cbd968e-caec-0fdb-8f23-f3fb11664ce3@suse.de>
Subject: Re: [PATCH 00/14] drm: Make DRM's IRQ helpers legacy
References: <20210727182721.17981-1-tzimmermann@suse.de>
 <YQWbWjV5TYzp+5C4@ravnborg.org>
 <d50b3199-20fe-0ecb-ab7d-7425ad1d0f21@suse.de>
 <YQcDCVuSM2kLbQcI@ravnborg.org>
In-Reply-To: <YQcDCVuSM2kLbQcI@ravnborg.org>

--wtdo6GS3bhbopv6iuyySLWGZg3Vkoz6Ku
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Sam

Am 01.08.21 um 22:24 schrieb Sam Ravnborg:
> Hi Thomas,
>=20
>>>
>>> 1) IRQ_NOTCONNECTED
>>>
>>> We do not have this check in drm_irq today and we should avoid spread=
ing
>>> it all over. We are either carrying it forever or we wil lsee patches=

>>> floating in to drop the check again.
>>> The current use in the kernel is minimal:
>>> https://elixir.bootlin.com/linux/latest/A/ident/IRQ_NOTCONNECTED
>>>
>>> So as a minimum drop it from atmel_hlcdc and preferably from the rest=
 as
>>> it is really not used. (Speaking as atmel_hlcdc maintainer)
>>
>> I'll drop it from atmel_hlcdc then.
>>
>> But saying that it's not used is not correct.
> My point is the drm_irq do not check this - so adding this check add
> something there was not needed/done before.

What is being done at [1] is actually a check for unassigned interrupts. =

It's just that both, test and errno code, are plain wrong. The patchset=20
fixes this.

>=20
>>> 2) devm_request_irq()
>>>
>>> We are moving towards managed allocation so we do not fail to free
>>> resources. And an irq has a lifetime equal the device itself - so an
>>> obvious cnadidate for devm_request_irq.
>>> If we do not introduce it now we will see a revisit of this later.
>>> I can be convinced to wait with this as we will have to do much more =
in
>>> each driver, but I cannot see any good arguments to avoid the more
>>> modern way to use devm_request_irq.
>>
>> I'll change this in atmel_hdlcd and maybe I can find trivial cases whe=
re
>> devm_request_irq() can be used. But drivers that had an uninstall call=
back
>> before should not have the cleanup logic altered by a patch as this on=
e. I
>> suspect that most of the IRQ cleanup
>> is actually a vblank cleanup and should be done in response to
>> drm_vblank_init(). But that's again not something for this patchset he=
re. We
>> cannot change multiple things at once and still expect any of it to wo=
rk.
>>
>> I welcome the use of devm_ et al. But these changes are better done in=
 a
>> per-driver patchset that changes all of the driver to managed release.=

> Fair enough, and fine with me.
> I have yet to read through all patches - will do so in the coming week.=


OK, thanks a lot. I'll send out a new revision soon, so maybe don't=20
waste time with this one.

Best regards
Thomas


[1]=20
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_irq.c#=
L111



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


--wtdo6GS3bhbopv6iuyySLWGZg3Vkoz6Ku--

--j44ztPryqGh1Sl1wWncDBLPSUvmHnlHRM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmEHr/MFAwAAAAAACgkQlh/E3EQov+AL
ZBAAuTGejX2pXR6jVvpz2dMnan3xW9847gXwEr3z8n9w/QhNt6TtvOSUO0qjroj8bSDqVfYv9zDg
Z2jwtFe3un8Nrt19BBILP4BPKksBt+lkaZ7u02wbUyV/HzY1j6VNiF+LnkHjEZ+G7G245R94JOOY
pdr224mzNiN9K75oGK5ik5CmLAKoSm7v/okgPYWu7u2A+2+zZBWcK1Mf+bbIYiG24w/7B7B2UPU0
JHE+udObafmq/4gzxsL6MmoCTaAoKTLO3iHpKNtVPVBnSEBMUaAMaaOMFwHWUiPOl5iOJIoKyPgG
v15kvosV00PhZPrRWt8qWG1JelntAaUo2VpR+IjOea5a2h9aMCmBZE4qnpgLtI1t0pNkjis43z9R
UxxqparLGxI+ejKUQrldhcgbSAK5+3ejbqh/L80Xcv5/Vof3FtgCYxOi2fxUBorceu0afl3fP5GJ
91buuUh+8M3jSJgZmSgerG3Ppk3jCryKeW2NhLfgIn5MQzELWEi9lwE21b+7H9oyo1zn+zN39raq
UbgCu05ASw9v9OF/R0wAa0ZxJm6RSx5R5snNgK/BzJWGvCxx3xBpTMj+eBl3+k341NIP72/GgGfY
ioM+ts42y0a9t3co1HXZ719udvN77P9nQA7F6KAEvEpFPlgoC33CRXo/dYfrqixa0jzDHG88u7nP
dJ4=
=MZfj
-----END PGP SIGNATURE-----

--j44ztPryqGh1Sl1wWncDBLPSUvmHnlHRM--
