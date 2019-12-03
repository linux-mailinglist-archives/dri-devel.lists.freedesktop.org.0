Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D42310FC84
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 12:31:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A4E16E483;
	Tue,  3 Dec 2019 11:31:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A82F6E483
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 11:31:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 98649B23A;
 Tue,  3 Dec 2019 11:31:17 +0000 (UTC)
Subject: Re: [PATCH 7/7] drm/udl: Move udl_handle_damage() into udl_modeset.c
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20191126134707.22385-1-tzimmermann@suse.de>
 <20191126134707.22385-8-tzimmermann@suse.de>
 <CACvgo52+4rGV3xSn5yS8U5DLp+5jYKYnHo_h=oZXCESoXWs6Mg@mail.gmail.com>
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
Message-ID: <b8d77652-aee5-0e65-82c8-8da455f3a85f@suse.de>
Date: Tue, 3 Dec 2019 12:31:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <CACvgo52+4rGV3xSn5yS8U5DLp+5jYKYnHo_h=oZXCESoXWs6Mg@mail.gmail.com>
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: multipart/mixed; boundary="===============1722947930=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1722947930==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="CVZj2tvirIlGq5qEa2c00K2qWQ0xVuScx"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--CVZj2tvirIlGq5qEa2c00K2qWQ0xVuScx
Content-Type: multipart/mixed; boundary="qmmOHDmoBM5yOhn8tIBCJhGsAInsVZtRD";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Emil Velikov <emil.velikov@collabora.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@pr.hu>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <b8d77652-aee5-0e65-82c8-8da455f3a85f@suse.de>
Subject: Re: [PATCH 7/7] drm/udl: Move udl_handle_damage() into udl_modeset.c
References: <20191126134707.22385-1-tzimmermann@suse.de>
 <20191126134707.22385-8-tzimmermann@suse.de>
 <CACvgo52+4rGV3xSn5yS8U5DLp+5jYKYnHo_h=oZXCESoXWs6Mg@mail.gmail.com>
In-Reply-To: <CACvgo52+4rGV3xSn5yS8U5DLp+5jYKYnHo_h=oZXCESoXWs6Mg@mail.gmail.com>

--qmmOHDmoBM5yOhn8tIBCJhGsAInsVZtRD
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 02.12.19 um 10:27 schrieb Emil Velikov:
> On Tue, 26 Nov 2019 at 13:47, Thomas Zimmermann <tzimmermann@suse.de> w=
rote:
>>
>> The only caller of udl_handle_damage() in the plane-update function
>> in udl_modeset.c. Move udl_handle_damage() there, make it static, and
>> remove several left-over macros.
>>
> Personally I would have left the mechanic code motion from the dead
> code removal.
> Not a big deal though:
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
>=20
> There's few comments for follow-up work below.
>=20
>> +static int udl_handle_damage(struct drm_framebuffer *fb, int x, int y=
,
>> +                            int width, int height)
>> +{
>> +       struct drm_device *dev =3D fb->dev;
>> +       struct udl_device *udl =3D to_udl(dev);
>> +       int i, ret;
>> +       char *cmd;
>> +       cycles_t start_cycles, end_cycles;
>> +       int bytes_sent =3D 0;
>> +       int bytes_identical =3D 0;
>> +       struct urb *urb;
>> +       int aligned_x;
>> +       int log_bpp;
>> +       void *vaddr;
>> +
>> +       if (WARN_ON(!is_power_of_2(fb->format->cpp[0])))
>> +               return -EINVAL;
>> +
>=20
>> +       log_bpp =3D __ffs(fb->format->cpp[0]);
>> +
>> +       vaddr =3D drm_gem_shmem_vmap(fb->obj[0]);
>> +       if (IS_ERR(vaddr)) {
>> +               DRM_ERROR("failed to vmap fb\n");
>> +               return 0;
>> +       }
>> +
> Might as well move this hunk ...
>=20
>> +       aligned_x =3D ALIGN_DOWN(x, sizeof(unsigned long));
>> +       width =3D ALIGN(width + (x-aligned_x), sizeof(unsigned long));=

>> +       x =3D aligned_x;
>> +
>> +       if ((width <=3D 0) ||
>> +           (x + width > fb->width) ||
>> +           (y + height > fb->height)) {
>> +               ret =3D -EINVAL;
>> +               goto err_drm_gem_shmem_vunmap;
>> +       }
>> +
>> +       start_cycles =3D get_cycles();
>> +
>> +       urb =3D udl_get_urb(dev);
>> +       if (!urb)
>> +               goto out;
>> +       cmd =3D urb->transfer_buffer;
>> +
> ... here
>=20
>> +       for (i =3D y; i < y + height ; i++) {
>> +               const int line_offset =3D fb->pitches[0] * i;
>> +               const int byte_offset =3D line_offset + (x << log_bpp)=
;
>> +               const int dev_byte_offset =3D (fb->width * i + x) << l=
og_bpp;
>> +
>> +               if (udl_render_hline(dev, log_bpp, &urb, (char *)vaddr=
,
>> +                                    &cmd, byte_offset, dev_byte_offse=
t,
>> +                                    width << log_bpp,
>> +                                    &bytes_identical, &bytes_sent))
> udl_render_hline() - drop the unused args bytes_identical and bytes_sen=
t?
>=20
>> +                       goto error;
>> +       }
>> +
>> +       if (cmd > (char *) urb->transfer_buffer) {
>> +               /* Send partial buffer remaining before exiting */
>> +               int len;
>> +               if (cmd < (char *) urb->transfer_buffer + urb->transfe=
r_buffer_length)
>> +                       *cmd++ =3D 0xAF;
>> +               len =3D cmd - (char *) urb->transfer_buffer;
>> +               ret =3D udl_submit_urb(dev, urb, len);
>> +               bytes_sent +=3D len;
> Nit:
>=20
> int len =3D cmd - (char *) urb->transfer_buffer;
> if (len > 0) {
>    /* Send partial buffer remaining before exiting */
>    if (len < urb->transfer_buffer_length)
> ...
>=20
>> +       } else
>> +               udl_urb_completion(urb);
>> +
>> +error:
>=20
>> +       atomic_add(bytes_sent, &udl->bytes_sent);
>> +       atomic_add(bytes_identical, &udl->bytes_identical);
>> +       atomic_add((width * height) << log_bpp, &udl->bytes_rendered);=

>> +       end_cycles =3D get_cycles();
>> +       atomic_add(((unsigned int) ((end_cycles - start_cycles)
>> +                   >> 10)), /* Kcycles */
>> +                  &udl->cpu_kcycles_used);
>> +
> These atomics (+ lost_pixels) seem to be set-but-unused since day one.
> We might as well kill them, alongside the associated get_cycles().

I wanted to do this later. But since you brought it up and there's also
the issue where I forgot to convert the import_attach code, I'll send
out a series to clean up the damage handling and then get back to the
simple-pipe conversion.

Best regards
Thomas

>=20
> HTH
> Emil
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--qmmOHDmoBM5yOhn8tIBCJhGsAInsVZtRD--

--CVZj2tvirIlGq5qEa2c00K2qWQ0xVuScx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3mR4QACgkQaA3BHVML
eiPTlQf8DJFSCmuWkDrZitrluIQaFe8UzQyps9bqsIq5HKqgEUwKzcyDsHAToe0U
elSDl4j4R/3Q+DrBBFK/sayUYRBJq6C3mZyzwrmrNOaDWkfUiWr3acbJ3GO9EPBl
jviMwDDR2ykKesLYXkXT6OtV2msmw3lWqZKhRWyJiEy9d0uCXGEtVtlRu58GeXBf
9dyzzxWhhrFV19MRuH2Ao19vjbgaWftS/xvySguKcuHh7eF0APFkk4F+j2oYnzFr
0ftL8gqth0pZcK3ASfwoR0Xpy4TW8/rXXv+EcAzuC9NeLoTK1jkwyp9Go/8xGVAD
6hyqSAan4eajK5NDW5AIddnYtGzSxw==
=wPht
-----END PGP SIGNATURE-----

--CVZj2tvirIlGq5qEa2c00K2qWQ0xVuScx--

--===============1722947930==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1722947930==--
