Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D7BF280B
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 08:32:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 499016EE8E;
	Thu,  7 Nov 2019 07:32:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5EFD89FCE
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 07:32:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 41BD2B49D;
 Thu,  7 Nov 2019 07:32:23 +0000 (UTC)
Subject: Re: [PATCH 9/9] drm/ast: Enable atomic modesetting
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20191028154928.4058-1-tzimmermann@suse.de>
 <20191028154928.4058-10-tzimmermann@suse.de>
 <20191105095711.nzjlqwjjt57se5rt@sirius.home.kraxel.org>
 <1d81c21e-a6f5-c2a7-11d2-dd6017c58ef5@suse.de>
 <20191107065530.huhkk6wrsyowqiex@sirius.home.kraxel.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <6151cd9c-1e8e-7532-b719-993ffa3d266b@suse.de>
Date: Thu, 7 Nov 2019 08:32:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191107065530.huhkk6wrsyowqiex@sirius.home.kraxel.org>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org, sam@ravnborg.org
Content-Type: multipart/mixed; boundary="===============1445509336=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1445509336==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="0WyGCcjgGb1PfR0j8zMZUuB8F9vOUHCSK"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0WyGCcjgGb1PfR0j8zMZUuB8F9vOUHCSK
Content-Type: multipart/mixed; boundary="M4QdKPDV3WmBiWWkGNamy13xZeiMc77kf";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: airlied@redhat.com, yc_chen@aspeedtech.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org
Message-ID: <6151cd9c-1e8e-7532-b719-993ffa3d266b@suse.de>
Subject: Re: [PATCH 9/9] drm/ast: Enable atomic modesetting
References: <20191028154928.4058-1-tzimmermann@suse.de>
 <20191028154928.4058-10-tzimmermann@suse.de>
 <20191105095711.nzjlqwjjt57se5rt@sirius.home.kraxel.org>
 <1d81c21e-a6f5-c2a7-11d2-dd6017c58ef5@suse.de>
 <20191107065530.huhkk6wrsyowqiex@sirius.home.kraxel.org>
In-Reply-To: <20191107065530.huhkk6wrsyowqiex@sirius.home.kraxel.org>

--M4QdKPDV3WmBiWWkGNamy13xZeiMc77kf
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 07.11.19 um 07:55 schrieb Gerd Hoffmann:
>>> Hmm.  Pretty much a dummy encoder implementation.  Maybe ast is simpl=
e
>>> enough that the simple pipe helpers can do the trick?
>>
>> As Daniel said, simple pipe helpers don't support cursors. I
>> investigated his comment on a encoder helpers and found that many
>> drivers (including ast) only create an encoder structure without
>> additional functionality.
>>
>> It's probably worth introducing a default implementation for the
>> encoder,
>=20
> Either that, or make all the callbacks optional so a encoder without
> additional functionality needs only a few lines of code.
>=20
>> but I'd like to do that in a separate patch set. Ok?
>=20
> Yep, that totally makes sense, given that it'll probably become a patch=

> series of its own (with driver cleanups included).

Absolutely. I took a look at other driver's encoders and most of them
are empty implementations; just like ast. Having a simple-encoder helper
should make most of this go away.

>=20
> So, for this patch:
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>

Thanks.

Best regards
Thomas

>=20
> cheers,
>   Gerd
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=FCrnberg, Germany
(HRB 36809, AG N=FCrnberg)
Gesch=E4ftsf=FChrer: Felix Imend=F6rffer


--M4QdKPDV3WmBiWWkGNamy13xZeiMc77kf--

--0WyGCcjgGb1PfR0j8zMZUuB8F9vOUHCSK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3DyIYACgkQaA3BHVML
eiNKeQf9H50QryA7EP0pKztlCXdVQWD0+b7sekB8nf/ZBhm1nuE0h1zGWHOUYL1s
U5KQ6JU8GPsP3pPk3MxwWiJTM23Wer2k5ckdkQIyjZ8nvmB2iw/6Y0LSSCd//WLg
hESjOLxnUkSZyq0NnWFJGjZ55FT60X1sUJ037PP2ORgoogamQ5+dUTuX/wWsn1Pv
L21yiSsfdc+RbeIhoK7FYN87kJs43Az27VYygWfI2dT5FF131IgQftlbKy6eOB6j
KLrpY+vPrYq1Ua7dceHxljuKurD2+iqCF4bNyNMT6zRRucjOB78PDxLc9dpUFjfA
hPYxYljp/EQW6uEkdZbOxbGTc900fw==
=JhLw
-----END PGP SIGNATURE-----

--0WyGCcjgGb1PfR0j8zMZUuB8F9vOUHCSK--

--===============1445509336==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1445509336==--
