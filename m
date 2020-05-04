Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AA01C39C5
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 14:45:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73BDA6E3CB;
	Mon,  4 May 2020 12:45:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 345956E3CB
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 12:45:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9190EAC4D;
 Mon,  4 May 2020 12:45:46 +0000 (UTC)
Subject: Re: [PATCH 17/17] drm/mgag200: Replace VRAM helpers with SHMEM helpers
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20200429143238.10115-1-tzimmermann@suse.de>
 <20200429143238.10115-18-tzimmermann@suse.de>
 <CACvgo50KRJV1E-D3KBmKdDWOqY_JH8V29U+f9igUtCS058VxUg@mail.gmail.com>
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
Message-ID: <a11dbe2e-239c-413c-7ad1-d611c19c97d1@suse.de>
Date: Mon, 4 May 2020 14:45:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CACvgo50KRJV1E-D3KBmKdDWOqY_JH8V29U+f9igUtCS058VxUg@mail.gmail.com>
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
Cc: john.p.donnelly@oracle.com, Sam Ravnborg <sam@ravnborg.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Content-Type: multipart/mixed; boundary="===============1910919760=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1910919760==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="tp0lvJLS8RYmJ6mO5IgtrE7x65KtkZmMp"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tp0lvJLS8RYmJ6mO5IgtrE7x65KtkZmMp
Content-Type: multipart/mixed; boundary="ICQHHRLHJSc5xyHKsq7dDFhfe7FXCuNab";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: john.p.donnelly@oracle.com, ML dri-devel
 <dri-devel@lists.freedesktop.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>
Message-ID: <a11dbe2e-239c-413c-7ad1-d611c19c97d1@suse.de>
Subject: Re: [PATCH 17/17] drm/mgag200: Replace VRAM helpers with SHMEM
 helpers
References: <20200429143238.10115-1-tzimmermann@suse.de>
 <20200429143238.10115-18-tzimmermann@suse.de>
 <CACvgo50KRJV1E-D3KBmKdDWOqY_JH8V29U+f9igUtCS058VxUg@mail.gmail.com>
In-Reply-To: <CACvgo50KRJV1E-D3KBmKdDWOqY_JH8V29U+f9igUtCS058VxUg@mail.gmail.com>

--ICQHHRLHJSc5xyHKsq7dDFhfe7FXCuNab
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 04.05.20 um 14:29 schrieb Emil Velikov:
> Hi Thomas,
>=20
> Just a couple of fly-by comments.
>=20
> On Wed, 29 Apr 2020 at 15:33, Thomas Zimmermann <tzimmermann@suse.de> w=
rote:
>=20
>> @@ -1618,21 +1640,13 @@ mgag200_simple_display_pipe_update(struct drm_=
simple_display_pipe *pipe,
>>         struct mga_device *mdev =3D to_mga_device(dev);
>>         struct drm_plane_state *state =3D plane->state;
>>         struct drm_framebuffer *fb =3D state->fb;
>> -       struct drm_gem_vram_object *gbo;
>> -       s64 gpu_addr;
>> +       struct drm_rect damage;
>>
>>         if (!fb)
>>                 return;
>>
>> -       gbo =3D drm_gem_vram_of_gem(fb->obj[0]);
>> -
>> -       gpu_addr =3D drm_gem_vram_offset(gbo);
>> -       if (drm_WARN_ON_ONCE(dev, gpu_addr < 0))
>> -               return; /* BUG: BO should have been pinned to VRAM. */=

>> -
>> -       mgag200_set_format_regs(mdev, fb);
> This function seems to be missing from the handle_damage helper.
>=20
> Is that intentional, something which should be squashed with another
> patch or it belongs in the helper?

Thanks for noticing. That line should not have been here at all.
Changing format registers might require an update to the PLL. And that
in turn requires a full modeset in _enable(). The enable function
already sets the format regs; this line can be removed.


>=20
>> -       mgag200_set_startadd(mdev, (unsigned long)gpu_addr);
>> -       mgag200_set_offset(mdev, fb);
>> +       if (drm_atomic_helper_damage_merged(old_state, state, &damage)=
)
>> +               mgag200_handle_damage(mdev, fb, &damage);
>>  }
>=20
>=20
>=20
>>  int mgag200_mm_init(struct mga_device *mdev)
>>  {
>=20
>> +       arch_io_reserve_memtype_wc(pci_resource_start(pdev, 0),
>> +                                  pci_resource_len(pdev, 0));
>>
>> -       arch_io_reserve_memtype_wc(pci_resource_start(dev->pdev, 0),
>> -                                  pci_resource_len(dev->pdev, 0));
>> +       mdev->fb_mtrr =3D arch_phys_wc_add(pci_resource_start(pdev, 0)=
,
>> +                                        pci_resource_len(pdev, 0));
>>
>> -       mdev->fb_mtrr =3D arch_phys_wc_add(pci_resource_start(dev->pde=
v, 0),
>> -                                        pci_resource_len(dev->pdev, 0=
));
>=20
> Some spurious s/dev->pdev/pdev/g changes got in the way. Might as well
> do those separately...
>=20
>> +       mdev->vram =3D ioremap(pci_resource_start(pdev, 0),
>> +                            pci_resource_len(pdev, 0));
>> +       if (!mdev->vram) {
>> +               ret =3D -ENOMEM;
>> +               goto err_arch_phys_wc_del;
>> +       }
>>
>>         mdev->vram_fb_available =3D mdev->mc.vram_size;
>>
>>         return 0;
>> +
>> +err_arch_phys_wc_del:
>> +       arch_phys_wc_del(mdev->fb_mtrr);
>> +       arch_io_free_memtype_wc(pci_resource_start(dev->pdev, 0),
>> +                               pci_resource_len(dev->pdev, 0));
> ... and consistently?

Good points.

Best regards
Thomas

>=20
> HTH
> Emil
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


--ICQHHRLHJSc5xyHKsq7dDFhfe7FXCuNab--

--tp0lvJLS8RYmJ6mO5IgtrE7x65KtkZmMp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6wDnUACgkQaA3BHVML
eiMX9QgAu/Apl4c0KA9uka6Jyr/fakqz6M1Tn93NFBDsRhifcIuOo213STJpzZqi
RFXhAja3ur9b8TUv6QIm3aoXQSqFJ96mSKkRXPc182MD7+p0N0gDb1/YCSzu+lTu
9F/1YNGqh7HxPPhxv5HSzc8vJJYgXBEZhCh+w9IRkCbmayyPULIm6hG9pt5hBUXh
SccYZHs0oBsoqJSAaBecapEDpyF5HAktoFsOWjToT/yMwM6DTRX6TnKsDi3QLC1c
SuRrC592LmPE8+xPWGFMw/VNJ17A9cwd49AJdPYyHl7B8DexRhb6DkeiAaYMRj/p
AMbev6ScUG6KjzG3R24j5z38OkDHqA==
=AvEm
-----END PGP SIGNATURE-----

--tp0lvJLS8RYmJ6mO5IgtrE7x65KtkZmMp--

--===============1910919760==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1910919760==--
