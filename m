Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA0810FE22
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 13:54:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 540466E50B;
	Tue,  3 Dec 2019 12:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7258C6E4F4
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 12:54:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BAFFAAD72;
 Tue,  3 Dec 2019 12:54:21 +0000 (UTC)
Subject: Re: [PATCH 00/12] Clean up drm_pci.{c,h}
To: Sam Ravnborg <sam@ravnborg.org>
References: <20191203100406.9674-1-tzimmermann@suse.de>
 <20191203121319.GA31692@ravnborg.org>
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
Message-ID: <c8ca3d7a-fb68-6312-cf2e-550724b2c0be@suse.de>
Date: Tue, 3 Dec 2019 13:54:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191203121319.GA31692@ravnborg.org>
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
Cc: laurent.pinchart@ideasonboard.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, kraxel@redhat.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, dan.carpenter@oracle.com, emil.velikov@collabora.com
Content-Type: multipart/mixed; boundary="===============0176892083=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0176892083==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="6XTjQwDIjCI3cIgDLdPWuCYcqhxW6kB02"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--6XTjQwDIjCI3cIgDLdPWuCYcqhxW6kB02
Content-Type: multipart/mixed; boundary="xewAdLNvFcDvYeLlbslcr2C1j4WkpdXLk";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 alexander.deucher@amd.com, emil.velikov@collabora.com,
 christian.koenig@amd.com, dan.carpenter@oracle.com,
 laurent.pinchart@ideasonboard.com
Message-ID: <c8ca3d7a-fb68-6312-cf2e-550724b2c0be@suse.de>
Subject: Re: [PATCH 00/12] Clean up drm_pci.{c,h}
References: <20191203100406.9674-1-tzimmermann@suse.de>
 <20191203121319.GA31692@ravnborg.org>
In-Reply-To: <20191203121319.GA31692@ravnborg.org>

--xewAdLNvFcDvYeLlbslcr2C1j4WkpdXLk
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 03.12.19 um 13:13 schrieb Sam Ravnborg:
> Hi Thomas.
>=20
>> The rest
>> of the patches replace unnecessary include statements for drm_pci.h. M=
ost
>> of the source files only require <linux/pci.h>.
>=20
> I guess I am to blame here. When migrating away from drmP.h I used
> <drm/drm_pci.h> as preferred way when there were pci related build
> errors and when it worked I moved on.
> Sorry for creating extra work for you, but glad to see it cleaned up.

No problem, don't worry. :)

>=20
> 	Sam
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


--xewAdLNvFcDvYeLlbslcr2C1j4WkpdXLk--

--6XTjQwDIjCI3cIgDLdPWuCYcqhxW6kB02
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3mWvkACgkQaA3BHVML
eiPpdwf/YJ2w6/gL+4eSGFq8qH1Eu9Rt++rh06CX0YAeLtRRGo9rl9qAFZoz4T0Y
boOW9IYZm42k4hAfWGCR0451OiWvBZArkJNaOJZbrDXJzoGLjR9/JvKkw4tp0DLR
ittHh29l9LTWIGQtEx9HtXrepCKiW1q2QO0szDL+vMDSZn/uj2NiIWiQ+TGBWY4Y
t56sh8eKxvlujZtpp2Gee43dfbTeJoK75py1qwpc7c3gBOIVYCmWIu0lYaL1Q5o7
2hghsVCbmsGJGjVJODCLOOFaD9+TBFM0H7n0StOZ2VfwSfD2P33VF1DtNjygFFAJ
Fp+lbke5OgWym1irwkr6Bgj3CDrZhg==
=NMD/
-----END PGP SIGNATURE-----

--6XTjQwDIjCI3cIgDLdPWuCYcqhxW6kB02--

--===============0176892083==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0176892083==--
