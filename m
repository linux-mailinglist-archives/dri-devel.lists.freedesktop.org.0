Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAD5E707D
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 12:34:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDBD56E5F8;
	Mon, 28 Oct 2019 11:34:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 837306E5F8
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 11:34:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 99D90AC0C;
 Mon, 28 Oct 2019 11:34:34 +0000 (UTC)
Subject: Re: [PATCH 0/3] drm/vboxvideo: Use generic fbdev and framebuffer
To: Hans de Goede <hdegoede@redhat.com>, airlied@linux.ie, daniel@ffwll.ch
References: <20191011134808.3955-1-tzimmermann@suse.de>
 <0e0995ff-f165-e349-b3ad-f031a9b52d77@redhat.com>
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
Message-ID: <7180768c-077a-cbf5-ad16-7d53797b5d14@suse.de>
Date: Mon, 28 Oct 2019 12:34:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <0e0995ff-f165-e349-b3ad-f031a9b52d77@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0053415760=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0053415760==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="OCBupHSTN6wj2uUfoxUtGanTkCg3HQYi2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--OCBupHSTN6wj2uUfoxUtGanTkCg3HQYi2
Content-Type: multipart/mixed; boundary="yE1EFuwYzWXokat1zOo70fu2M8HT1TrZv";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Hans de Goede <hdegoede@redhat.com>, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
Message-ID: <7180768c-077a-cbf5-ad16-7d53797b5d14@suse.de>
Subject: Re: [PATCH 0/3] drm/vboxvideo: Use generic fbdev and framebuffer
References: <20191011134808.3955-1-tzimmermann@suse.de>
 <0e0995ff-f165-e349-b3ad-f031a9b52d77@redhat.com>
In-Reply-To: <0e0995ff-f165-e349-b3ad-f031a9b52d77@redhat.com>

--yE1EFuwYzWXokat1zOo70fu2M8HT1TrZv
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 28.10.19 um 12:26 schrieb Hans de Goede:
> Hi Thomas,
>=20
> On 11-10-2019 15:48, Thomas Zimmermann wrote:
>> The vboxvideo driver provides its own implementation for fbdev emulati=
on
>> and framebuffers. Both can be replaced by DRM's generic code.
>>
>> All patches have been tested on VirtualBox 6.0.12.
>>
>> Thomas Zimmermann (3):
>> =C2=A0=C2=A0 drm/vboxvideo: Switch to generic fbdev emulation
>> =C2=A0=C2=A0 drm/vboxvideo: Switch to drm_atomic_helper_dirty_fb()
>> =C2=A0=C2=A0 drm/vboxvideo: Replace struct vram_framebuffer with gener=
ic
>> =C2=A0=C2=A0=C2=A0=C2=A0 implemenation
>=20
> Thank you for these nice cleanups, unfortunately there is a small
> bug in the last patch, you are setting:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0.fb_create =3D drm_gem_fb_create,
>=20
> But since in the previous patch you switched to drm_atomic_helper_dirty=
_fb
> that should be:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0.fb_create =3D drm_gem_fb_create_with_dirty,
>=20
> The missing with_dirty is causing screenupdates under both plymouth and=

> gnome-shell (with llvmpipe) to gone missing. I'll send a patch fixing
> this.

You're right. I did test the patchset, but I can't tell why I didn't see
this bug. Anyway, thanks a lot for providing the fix.

Best regards
Thomas

>=20
> Regards,
>=20
> Hans
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--yE1EFuwYzWXokat1zOo70fu2M8HT1TrZv--

--OCBupHSTN6wj2uUfoxUtGanTkCg3HQYi2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl220kUACgkQaA3BHVML
eiPL7QgAve8pyWABkk57KuVZGanFff51nNwRvrzwKnXOIFvq3/cMYttIoiT320bD
g5oROPnpTBFjzWXnl+gVohoRXB5tNKwkBNIasv6rd9uRpBeFmG2s5sZ83J96qyDm
Xszeas2WZt7wbSk63qyCoE9wlE2QBs4Yg0jKkNJ3k3FfZ0EdkomW2nhA+wBMIWk1
Zrl3zGfovJ3HdrDzCacB7X9XZKyjuAQr6QM0FIjNkf/M0J3stwQ/uQl0/Hd0FwJ+
fiBbhM3dv1FcYbfBj5qilSgS1VWZl66KvI7J8acu4QIJ0aC/eeIpBn+YQ3pqpjDH
wIuxRy6dzP5XNo3MUJCJx1NbiJLY6Q==
=caWF
-----END PGP SIGNATURE-----

--OCBupHSTN6wj2uUfoxUtGanTkCg3HQYi2--

--===============0053415760==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0053415760==--
