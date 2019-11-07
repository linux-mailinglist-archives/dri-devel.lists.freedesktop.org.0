Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58614F2877
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 08:54:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C727E6EEB9;
	Thu,  7 Nov 2019 07:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E586F6EEB9
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 07:54:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5FD99AF42;
 Thu,  7 Nov 2019 07:54:24 +0000 (UTC)
Subject: Re: Drm: mgag200. Video adapter issue with 5.4.0-rc3 ; no graphics
To: John Donnelly <john.p.donnelly@oracle.com>, dri-devel@lists.freedesktop.org
References: <162E0991-F617-4AA3-8C98-A6F0B0F681B1@oracle.com>
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
Message-ID: <f7bb9241-d9c6-c4ef-a03f-7aa0d18ea30e@suse.de>
Date: Thu, 7 Nov 2019 08:54:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <162E0991-F617-4AA3-8C98-A6F0B0F681B1@oracle.com>
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
Content-Type: multipart/mixed; boundary="===============1162415291=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1162415291==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="I25YGJnkqMvBG4mTmLtluBKqAqdMYxS7I"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--I25YGJnkqMvBG4mTmLtluBKqAqdMYxS7I
Content-Type: multipart/mixed; boundary="62bcti6BjSYjK1lgZ749buSwu4AhB9h9k";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: John Donnelly <john.p.donnelly@oracle.com>,
 dri-devel@lists.freedesktop.org
Message-ID: <f7bb9241-d9c6-c4ef-a03f-7aa0d18ea30e@suse.de>
Subject: Re: Drm: mgag200. Video adapter issue with 5.4.0-rc3 ; no graphics
References: <162E0991-F617-4AA3-8C98-A6F0B0F681B1@oracle.com>
In-Reply-To: <162E0991-F617-4AA3-8C98-A6F0B0F681B1@oracle.com>

--62bcti6BjSYjK1lgZ749buSwu4AhB9h9k
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi John,

apparently the vgaarb was not the problem.

Am 07.11.19 um 03:29 schrieb John Donnelly:
> Hi,
>=20
> I am investigating an issue where we lose video activity when the displ=
ay is switched from from =E2=80=9Ctext mode=E2=80=9D to =E2=80=9Cgraphic =
mode=E2=80=9D=20
> on a number of  servers using this driver.    Specifically  starting th=
e GNOME desktop.=20

When you say "text mode", do you mean VGA text mode or the graphical
console that emulates text mode?

When you enable graphics mode, does it set the correct resolution? A lot
of work went into memory management recently. I could imagine that the
driver sets the correct resolution, but then fails to display the
correct framebuffer.

If possible, could you try to update to the latest drm-tip and attach
the output of

  /sys/kernel/debug/dri/0/vram-mm

before and after switching to graphics mode. The file lists the
allocated regions of the VRAM.

>=20
> This adapter is  Server Engines  Integrated Remote Video Acceleration S=
ubsystem (RVAS)  and is used as remote console in iLO/DRAC environments. =
=20
>=20
> I don=E2=80=99t see any specific errors in the gdm logs or message file=
 other than this:

You can boot with drm.debug=3D0xff on the kernel command line to enable
more warnings.

>=20
>=20
> mgag200 0000:04:00.0: remove_conflicting_pci_framebuffers: bar 0: 0x9b0=
00000 -> 0x9bffffff=20
> mgag200 0000:04:00.0: remove_conflicting_pci_framebuffers: bar 1: 0x9c8=
10000 -> 0x9c813fff=20
> mgag200 0000:04:00.0: remove_conflicting_pci_framebuffers: bar 2: 0x9c0=
00000 -> 0x9c7fffff=20

Could you please attach the output of lspci -v for the VGA adapter?

Best regards
Thomas

>=20
> fb0: switching to mgag200drmfb from EFI VGA=20
> mgag200 0000:04:00.0: vgaarb: deactivate vga console=20
> fbcon: mgag200drmfb (fb0) is primary device=20
> mgag200 0000:04:00.0: fb0: mgag200drmfb frame buffer device=20
> [drm] Initialized mgag200 1.0.0 20110418 for 0000:04:00.0 on minor 0
>=20
> The systems worked fine with  4.18  kernels  and a recent Linux  5.2.18=
 ;  The symptom first appears in 5.3.6. and onward.=20
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


--62bcti6BjSYjK1lgZ749buSwu4AhB9h9k--

--I25YGJnkqMvBG4mTmLtluBKqAqdMYxS7I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3DzawACgkQaA3BHVML
eiOqJAgAoMTUV1uWqvfIf7p9yWhkttQPmoyajYLqpE0d6OC3a6RtsyEx21Apn6ob
/iBwvKkQ7IdiiYKNxnOlc500aaSul78pJTrAPeRlSbRL0KUuP548Ei/g9aCVkv0c
+xv+u+8H+S0FlfokInDKOFsDMZW2u73quu/+Ds5j8J8bEodEK+oyYSv+KKtjVRs8
szMuJ4xXwwuTiKFZcmcRPp9m2+1TbMaeMFUb0i2pe/dpc8Sow2y+kIxAN1UsGLBI
o/X5ZjDwgIMEY61yZK7AtPBlhsWZ91VYXETMh2DLgWPHvQU7FRYz1Yvk1GqNS26f
pKahkPghlOOBaYV0csrv41VbzqiN5A==
=bZMs
-----END PGP SIGNATURE-----

--I25YGJnkqMvBG4mTmLtluBKqAqdMYxS7I--

--===============1162415291==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1162415291==--
