Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B153130BA
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 12:25:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B4116E89B;
	Mon,  8 Feb 2021 11:25:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A116E89B
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 11:25:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4FE01AE85;
 Mon,  8 Feb 2021 11:25:26 +0000 (UTC)
Subject: Re: [PATCH 0/6] drm: Move vmap out of commit tail for SHMEM-based
 drivers
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20210204200308.24216-1-tzimmermann@suse.de>
 <20210205090514.ln6eeoqfcijrd5q2@sirius.home.kraxel.org>
 <88b6a41d-d457-6675-4692-c2dc773c9a2d@suse.de>
 <20210208105352.6mw7w6hlefrer5al@sirius.home.kraxel.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <7a62641e-9276-fcab-7cd8-5543cfce0467@suse.de>
Date: Mon, 8 Feb 2021 12:25:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210208105352.6mw7w6hlefrer5al@sirius.home.kraxel.org>
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
Cc: airlied@linux.ie, sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, hdegoede@redhat.com,
 sean@poorly.run
Content-Type: multipart/mixed; boundary="===============0110031333=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0110031333==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="mF1TWG1lkMIx2GGMlCq95NisX01ksNRcb"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--mF1TWG1lkMIx2GGMlCq95NisX01ksNRcb
Content-Type: multipart/mixed; boundary="KmbtihYI2ty0mNn0YK7LSiBltEUUPqKp4";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: airlied@linux.ie, sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, hdegoede@redhat.com,
 sean@poorly.run
Message-ID: <7a62641e-9276-fcab-7cd8-5543cfce0467@suse.de>
Subject: Re: [PATCH 0/6] drm: Move vmap out of commit tail for SHMEM-based
 drivers
References: <20210204200308.24216-1-tzimmermann@suse.de>
 <20210205090514.ln6eeoqfcijrd5q2@sirius.home.kraxel.org>
 <88b6a41d-d457-6675-4692-c2dc773c9a2d@suse.de>
 <20210208105352.6mw7w6hlefrer5al@sirius.home.kraxel.org>
In-Reply-To: <20210208105352.6mw7w6hlefrer5al@sirius.home.kraxel.org>

--KmbtihYI2ty0mNn0YK7LSiBltEUUPqKp4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 08.02.21 um 11:53 schrieb Gerd Hoffmann:
> On Sun, Feb 07, 2021 at 07:33:24PM +0100, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 05.02.21 um 10:05 schrieb Gerd Hoffmann:
>>>     Hi,
>>>
>>>> I smoke-tested the code by running fbdev, Xorg and weston with the
>>>> converted mgag200 driver.
>>>
>>> Looks sane to me.
>>> Survived cirrus smoke test too.
>>>
>>> Tested-by: Gerd Hoffmann <kraxel@redhat.com>
>>> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
>>
>> I had to add one additional patch to v2 of this patchset to make thing=
s work
>> with module-only builds. If you have a minute, could you ack this as w=
ell?
>> Thanks!
>=20
> Works fine too.

Thanks! I'll count this as an ack.

Best regards
Thomas

>=20
> take care,
>    Gerd
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--KmbtihYI2ty0mNn0YK7LSiBltEUUPqKp4--

--mF1TWG1lkMIx2GGMlCq95NisX01ksNRcb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAhH6UFAwAAAAAACgkQlh/E3EQov+C7
jhAAgg7uymETg3/HZL+K9mNHfQk1W73+Il1DTGrWl0LwvCc+/7EKxXvtzzWinPw2VDvfjcq6bnao
5kjmVUNqwYrOW62ksEqpJSMQFMbVch/aXonPM1yGKkhqWF75wPa0MRkOXusZqXkk4DPyrOOhUPZK
pljQwn/FI/YAnNpAifA+dmaG09yqVD7iZjHdGMatZQPmratL2c9YBlcIpLT/4TcdZIccOKXjVfWt
zYlJGT3cUMg0J6gub3eQhWgY2JVFY+YlCK916S98kOU9lc6SkW+vZB8nsDqvuMmR6jEJKa/b6Roj
YuJGpdg6whepmP1i6zVFslGX8UXRVYfrpXWw2ZApOH5bnnDiU8UVyRSENA0uGbzTrdNs+eqXTV7j
Mz+yJKZJldVLS+CmQyEy9vMK46UziZL3HPHFNdJxxVEnnQIQQFTFxDwJr9EFKbrrlpWqAM4LBQR9
Nc16jRtRXkF/of33s6hqfw6DCaeorWcMAbnaIR3P8CexJGxlGqWymPkLIKBAgf+uH3oItmofQdwe
Mf/Jh2TVQlKO2ovvtDHey+NwEZ6fOCq91GrNCHIdIod+VoLOpPw+N1xezuhPw9xhSJSQOoiKupDy
6iGEWjVmVpSirBoFul/kpjL0M4CuGRsllsNFAtkDoUD/nn148JQYwyZYAdjsJIFB+yAE6LrxvY+T
SZM=
=Ep96
-----END PGP SIGNATURE-----

--mF1TWG1lkMIx2GGMlCq95NisX01ksNRcb--

--===============0110031333==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0110031333==--
