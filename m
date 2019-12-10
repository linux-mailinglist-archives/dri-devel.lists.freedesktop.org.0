Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BDB11857C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 11:47:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CFCA6E8A3;
	Tue, 10 Dec 2019 10:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2866E8A3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 10:47:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 14532AC84;
 Tue, 10 Dec 2019 10:47:20 +0000 (UTC)
Subject: Re: [PATCH] drm/vmwgfx: Call vmw_driver_{load,unload}() before
 registering device
To: Thomas Hellstrom <thellstrom@vmware.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>
References: <20191209110641.16134-1-tzimmermann@suse.de>
 <MN2PR05MB61417BEF98B009168F9C5D6DA15B0@MN2PR05MB6141.namprd05.prod.outlook.com>
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
Message-ID: <66e36c2f-6b40-05f0-b3e5-5f751cb88c6f@suse.de>
Date: Tue, 10 Dec 2019 11:47:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <MN2PR05MB61417BEF98B009168F9C5D6DA15B0@MN2PR05MB6141.namprd05.prod.outlook.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1781889663=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1781889663==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="8gePldJzFagLugJ0Euh3z9fvbCe3j62MD"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8gePldJzFagLugJ0Euh3z9fvbCe3j62MD
Content-Type: multipart/mixed; boundary="W5AQ1JlbgpHx2eNIoa7dUOlT9potDy9c1";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Thomas Hellstrom <thellstrom@vmware.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Message-ID: <66e36c2f-6b40-05f0-b3e5-5f751cb88c6f@suse.de>
Subject: Re: [PATCH] drm/vmwgfx: Call vmw_driver_{load,unload}() before
 registering device
References: <20191209110641.16134-1-tzimmermann@suse.de>
 <MN2PR05MB61417BEF98B009168F9C5D6DA15B0@MN2PR05MB6141.namprd05.prod.outlook.com>
In-Reply-To: <MN2PR05MB61417BEF98B009168F9C5D6DA15B0@MN2PR05MB6141.namprd05.prod.outlook.com>

--W5AQ1JlbgpHx2eNIoa7dUOlT9potDy9c1
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 10.12.19 um 11:37 schrieb Thomas Hellstrom:
> Hi,
>=20
> On 12/9/19 12:06 PM, Thomas Zimmermann wrote:
>> The load/unload callbacks in struct drm_driver are deprecated. Remove
>> them and call functions explicitly.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 44 +++++++
>=20
> Hmm, which tree is this diff against? I get
>=20
> Applying: drm/vmwgfx: Call vmw_driver_{load, unload}() before
> registering device
> Using index info to reconstruct a base tree...
> M    drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> error: patch failed: drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:1329
> error: drivers/gpu/drm/vmwgfx/vmwgfx_drv.c: patch does not apply
> error: Did you hand edit your patch?
> It does not apply to blobs recorded in its index.
> Patch failed at 0001 drm/vmwgfx: Call vmw_driver_{load, unload}() befor=
e
> registering device
>=20
> On both drm-misc-next and linus' master?

It's against one of yesterday's drm-tip. Let me know if you prefer a
patch against drm-misc-next.

Best regards
Thomas

>=20
>=20
> Thanks,
>=20
> Thomas
>=20
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


--W5AQ1JlbgpHx2eNIoa7dUOlT9potDy9c1--

--8gePldJzFagLugJ0Euh3z9fvbCe3j62MD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3vd7cACgkQaA3BHVML
eiMxQAf+OlgohxtE8RG2kKFJNTrIsumSo75JlfACeCrXxE93vTNg5N7+q8ggWrFR
s09awPaI8faOFXFXZvw8DJ3/4ozEots8KBivynT5vrFP/Um3/N5MCtaPjRhtk/ER
wpiSR1J/1zATpstR4GQxVPacxD7hgI33YVtsmCpYze5kqYbFAkqTTTdrfaBebFnx
E9uKWqSoeTwx2/zR8tUolUoeZKo+aUC6sIh1KdQiOHtP4sv+4xJ8TW85l633Pt/E
7l0ql5iWR2cij17egSWGBmHIOik/cxJDg2Xo1rsdUtFsSWJqtpAzPbBh8A3zSTou
naaL50jGRVN9qoeucu07KfqbsFAF8w==
=LhwG
-----END PGP SIGNATURE-----

--8gePldJzFagLugJ0Euh3z9fvbCe3j62MD--

--===============1781889663==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1781889663==--
