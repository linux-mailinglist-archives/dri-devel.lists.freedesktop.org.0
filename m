Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E91F21D1062
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 13:00:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08856EA00;
	Wed, 13 May 2020 11:00:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A656E9FB;
 Wed, 13 May 2020 11:00:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 71C69AD73;
 Wed, 13 May 2020 11:00:18 +0000 (UTC)
Subject: Re: [Nouveau] [RFC] Remove AGP support from Radeon/Nouveau/TTM
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
References: <20200511171722.96576-1-christian.koenig@amd.com>
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
Message-ID: <a4b8b601-b376-448c-d09e-845342dd6423@suse.de>
Date: Wed, 13 May 2020 13:00:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200511171722.96576-1-christian.koenig@amd.com>
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
Content-Type: multipart/mixed; boundary="===============0985877791=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0985877791==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="MrjUrVWqiQEewrsNf4S2lLkzGVVsVr58o"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--MrjUrVWqiQEewrsNf4S2lLkzGVVsVr58o
Content-Type: multipart/mixed; boundary="Me6c6vnN3QGvOgraktLMmbZaVN7vNUKSA";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Message-ID: <a4b8b601-b376-448c-d09e-845342dd6423@suse.de>
Subject: Re: [Nouveau] [RFC] Remove AGP support from Radeon/Nouveau/TTM
References: <20200511171722.96576-1-christian.koenig@amd.com>
In-Reply-To: <20200511171722.96576-1-christian.koenig@amd.com>

--Me6c6vnN3QGvOgraktLMmbZaVN7vNUKSA
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 11.05.20 um 19:17 schrieb Christian K=C3=B6nig:
> Hi guys,
>=20
> Well let's face it AGP is a total headache to maintain and dead for at =
least 10+ years.
>=20
> We have a lot of x86 specific stuff in the architecture independent gra=
phics memory management to get the caching right, abusing the DMA API on =
multiple occasions, need to distinct between AGP and driver specific page=
 tables etc etc...
>=20
> So the idea here is to just go ahead and remove the support from Radeon=
 and Nouveau and then drop the necessary code from TTM.
>=20
> For Radeon this means that we just switch over to the driver specific p=
age tables and everything should more or less continue to work.
>=20
> For Nouveau I'm not 100% sure, but from the code it of hand looks like =
we can do it similar to Radeon.
>=20
> Please comment what you think about this.

It's probably not much of a problem in practice.

I guess everyone who plays 3d games has upgraded to something newer.

Wrt desktops, I found that some components of modern desktops (KDE,
Gnome) now have a hard requirement on SSE2. [1][2] But AGP is mostly
used in old 32-bit systems, which don't have SSE2.* So remaining users
of the GART functionality probably don't use any of these desktops.

The simpler WMs are usually usable with only little VRAM. At least they
should not be hit by any performance penalty.

Best regards
Thomas

[1] https://bugzilla.opensuse.org/show_bug.cgi?id=3D1162283
[2] https://bugzilla.opensuse.org/show_bug.cgi?id=3D1077870

* First-generation Athlon 64 have SSE2 and AGP support. But there are
few systems. Around that time AGP was replaced by PCIe.

>=20
> Regards,
> Christian.
>=20
>=20
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--Me6c6vnN3QGvOgraktLMmbZaVN7vNUKSA--

--MrjUrVWqiQEewrsNf4S2lLkzGVVsVr58o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl670z4ACgkQaA3BHVML
eiNigwgAuwUs8S6HYu8CTwsz9zS8zr2FLxgCELINCjLc7uHN+bBpMnK/E9SbuncH
UfQTlPf8oSae7Y6EGKPdW8LrG2KhF+RNoCTnhx1MR45kucbzzs5n1DXZhUx440E2
dC2rVY08zsiFJCWMjz2fC56PkDFc8LVXKIbPwCVWq9I0tvfq/aja4CELOQIbcFFX
kE7wez1Wb2R4RPY34XN5hyvL1vroX3WojI2dRiH2Ek5sSY+KiiTTY3CEQ6edRoAK
daGJMrjsgHPZdETKdl9wgZPEj1nBNeSRVkZOABXeMYxWxstPK20t97NYMmWpXxm6
Z5kveddcarO9OCm7Ed4o+sdJty2PQw==
=4IX2
-----END PGP SIGNATURE-----

--MrjUrVWqiQEewrsNf4S2lLkzGVVsVr58o--

--===============0985877791==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0985877791==--
