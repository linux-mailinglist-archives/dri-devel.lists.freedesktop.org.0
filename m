Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 471AB31E755
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 09:18:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD246E9FD;
	Thu, 18 Feb 2021 08:18:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E87336E9FD
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 08:18:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 78705AD57;
 Thu, 18 Feb 2021 08:18:24 +0000 (UTC)
Subject: Re: [PATCH v3 1/2] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
To: Vitaly Kuznetsov <vkuznets@redhat.com>,
 Deepak Rawat <drawat.floss@gmail.com>, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20210216003959.802492-1-drawat.floss@gmail.com>
 <87k0r6kicg.fsf@vitty.brq.redhat.com>
 <20aead71c4aa3f640e19660875f807deae92f8d8.camel@gmail.com>
 <87h7mak6l8.fsf@vitty.brq.redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <f606d24a-a320-01ff-8d38-d3d7f6f7f881@suse.de>
Date: Thu, 18 Feb 2021 09:18:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87h7mak6l8.fsf@vitty.brq.redhat.com>
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
Cc: Wei Hu <weh@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Dexuan Cui <decui@microsoft.com>, Michael Kelley <mikelley@microsoft.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============1132236002=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1132236002==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="aATjP0exx0BrqUETajFFlFtskPKVnOoT7"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--aATjP0exx0BrqUETajFFlFtskPKVnOoT7
Content-Type: multipart/mixed; boundary="r8U5gGPUwYOBXvp6MxBaiS7IH2ie3UHIv";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Vitaly Kuznetsov <vkuznets@redhat.com>,
 Deepak Rawat <drawat.floss@gmail.com>, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: Wei Hu <weh@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Dexuan Cui <decui@microsoft.com>, Michael Kelley <mikelley@microsoft.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Sam Ravnborg <sam@ravnborg.org>
Message-ID: <f606d24a-a320-01ff-8d38-d3d7f6f7f881@suse.de>
Subject: Re: [PATCH v3 1/2] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
References: <20210216003959.802492-1-drawat.floss@gmail.com>
 <87k0r6kicg.fsf@vitty.brq.redhat.com>
 <20aead71c4aa3f640e19660875f807deae92f8d8.camel@gmail.com>
 <87h7mak6l8.fsf@vitty.brq.redhat.com>
In-Reply-To: <87h7mak6l8.fsf@vitty.brq.redhat.com>

--r8U5gGPUwYOBXvp6MxBaiS7IH2ie3UHIv
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 17.02.21 um 17:21 schrieb Vitaly Kuznetsov:
> Deepak Rawat <drawat.floss@gmail.com> writes:
>=20
>> On Wed, 2021-02-17 at 13:07 +0100, Vitaly Kuznetsov wrote:
>>>> +++ b/drivers/gpu/drm/hyperv/hyperv_drm.h
>>>> @@ -0,0 +1,51 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>> +/*
>>>> + * Copyright 2012-2021 Microsoft
>>>
>>> Out of pure curiosity, where does '2012' come from or what does it
>>> mean?
>>>
>>
>> Thanks Vitaly for the review. Actually some of the code is derived fro=
m
>> hyperv_fb, which has copyright 2012. Not sure if I should remove here
>> or not?
>>
>=20
> I'm definitely not an expert (and couldn't quickly find a good
> reference) here but I was under the impression that in such cases you
> can just add a note like "based on 'hyperv_fb' driver" (if really
> needed, if you just borrow a few things then it's even superfluous I
> believe). Anyway, I was just a bit surprised to see '2012' in a new fil=
e
> :-)

As suggested, I'd just leave a note that it's based on hyperv_fb, which=20
is copyrighted 2012 Microsoft.

If you took functions directly from hyperv_fb, you have to use the same=20
license! hyperv_fb is GPL-2.0-only; yours is GPL-2.0.

Best regards
Thomas

>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--r8U5gGPUwYOBXvp6MxBaiS7IH2ie3UHIv--

--aATjP0exx0BrqUETajFFlFtskPKVnOoT7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAuIs4FAwAAAAAACgkQlh/E3EQov+Az
OA//c86twkR5oDZW5qmXMzJSMjA1SjF4bNS4lJFU/Bio84HoT+G16XDmCO/otLg66lPPp56my9tj
LjAwGkns/Yp2xMmfxabse+R0fVqXdfAcRsSj97hq1UlBSAluHA4aSX7TTi0BxHa9s7WezMLL494B
MpfMzX5uJYxIQJLEI7meNdqjfJ86iaOJdOmGIqcU0zDYv1gyBYOLlyhM7tbqkRZhyKP5tX5eoRnN
3ShWMNAzLMCvKwmGdswqKO9Ae1fj2cftYNxuBr4a+K7BRkTvAVWK1+7TPmHkzuyqFbW6B7iaV0ti
zTa7xxLvM+tsMMv+JZrdKqA1NMw6I88zRlTBIzNutzw3pTv7fISIEXbw6uDf1BA7zNgerdrBDM/F
Ibk1Y/se4kPdn9qwmLrfjvggmDrlbu/ylVoW4+egujWh1qO80POLEo9SmUEAliBzuuXP2dfnjovw
RMyxpoVxup+xSnH1U6cLa8HCSy0QZA1b1XcLKaxatbRj1PWBCamNkqi1FMV9denIyAQ56zFARt53
s7bHazCw+9+pKkjZb+Def0CX9NhaAgxvxE64nSwZilwzoJJcjCDBUTnAKsXq1udDAdV8wECoqUAI
JEATJYfb5J84zbg/MfKt+NXlcgBh2wRrpdHF4iGWV9v38gZCi7b1eRfIHC4O3tBLEJ+SKRvqqSB2
QP4=
=7Mj4
-----END PGP SIGNATURE-----

--aATjP0exx0BrqUETajFFlFtskPKVnOoT7--

--===============1132236002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1132236002==--
