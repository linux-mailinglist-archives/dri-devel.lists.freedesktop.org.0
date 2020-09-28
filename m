Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0839627A878
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:22:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D696E2DF;
	Mon, 28 Sep 2020 07:22:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E83746E2DF
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 07:22:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6B8D6AD77;
 Mon, 28 Sep 2020 07:22:39 +0000 (UTC)
Subject: Re: [PATCH 1/9] drm/format-helper: Pass destination pitch to
 drm_fb_memcpy_dstclip()
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200625120011.16168-1-tzimmermann@suse.de>
 <20200625120011.16168-2-tzimmermann@suse.de>
 <20200629084044.GL3278063@phenom.ffwll.local>
 <89cff54c-789f-02fd-4939-35956b51cb56@suse.de>
 <CAKMK7uESYkP4Fa9mrN5dxT1bDxkHxhHkBF4FbosiOiyMzYJ=Bg@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <35822c4b-7821-7b33-d6ce-cfe51a85ff74@suse.de>
Date: Mon, 28 Sep 2020 09:22:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uESYkP4Fa9mrN5dxT1bDxkHxhHkBF4FbosiOiyMzYJ=Bg@mail.gmail.com>
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Dave Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============0870621010=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0870621010==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="JHBPGGibWz6yFB3XesSdrXmvfKyVrBOSs"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JHBPGGibWz6yFB3XesSdrXmvfKyVrBOSs
Content-Type: multipart/mixed; boundary="T91xRdoolh4lvcQKgQgHNVF8KTAEURDKF";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Dave Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
Message-ID: <35822c4b-7821-7b33-d6ce-cfe51a85ff74@suse.de>
Subject: Re: [PATCH 1/9] drm/format-helper: Pass destination pitch to
 drm_fb_memcpy_dstclip()
References: <20200625120011.16168-1-tzimmermann@suse.de>
 <20200625120011.16168-2-tzimmermann@suse.de>
 <20200629084044.GL3278063@phenom.ffwll.local>
 <89cff54c-789f-02fd-4939-35956b51cb56@suse.de>
 <CAKMK7uESYkP4Fa9mrN5dxT1bDxkHxhHkBF4FbosiOiyMzYJ=Bg@mail.gmail.com>
In-Reply-To: <CAKMK7uESYkP4Fa9mrN5dxT1bDxkHxhHkBF4FbosiOiyMzYJ=Bg@mail.gmail.com>

--T91xRdoolh4lvcQKgQgHNVF8KTAEURDKF
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 26.09.20 um 18:42 schrieb Daniel Vetter:
> On Fri, Sep 25, 2020 at 4:55 PM Thomas Zimmermann <tzimmermann@suse.de>=
 wrote:
>>
>> Hi
>>
>> Am 29.06.20 um 10:40 schrieb Daniel Vetter:
>>> On Thu, Jun 25, 2020 at 02:00:03PM +0200, Thomas Zimmermann wrote:
>>>> The memcpy's destination buffer might have a different pitch than th=
e
>>>> source. Support different pitches as function argument.
>>>>
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>
>>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>
>>> But I do have questions ... why did we allocate a source drm_framebuf=
fer
>>> with mismatching pitch? That sounds backwards, especially for simplek=
ms.
>>
>> There's userspace that allocates framebuffers in tiles of 64x64 pixels=
=2E
>> I think I've seen this with Gnome. So if you have a 800x600 display
>> mode, the allocated framebuffer has a scanline pitch of 832 pixels and=

>> the final 32 pixels are ignored.
>=20
> At least with dumb buffer allocation ioctls userspace should not do
> that. If it wants 800x600, it needs to allocate 800x600, not something

That ship has sailed.

> else. The driver is supposed to apply any rounding necessary for the
> size. Or is this a buffer allocated somewhere else and then shared?

I don't quite remember where exactly this was implemented. It was not a
shared buffer, though. IIRC the buffer allocation code in one of the
libs rounded the size towards multiples of 64. I remember thinking that
it was probably done for tiled rendering.

Best regards
Thomas

> -Daniel
>=20
>> In regular drivers, we can handle this with the VGA offset register [1=
]
>> or some equivalent. That's obviously not an option with simplekms, so
>> the different pitch is required.
>>
>> Best regards
>> Thomas
>>
>> [1]
>> https://web.stanford.edu/class/cs140/projects/pintos/specs/freevga/vga=
/crtcreg.htm#13
>>
>>>
>>> Would be good to add the reasons why we need this to the commit messa=
ge,
>>> I'm sure I'll discover it later on eventually.
>>> -Daniel
>>>
>>>> ---
>>>>  drivers/gpu/drm/drm_format_helper.c    | 9 +++++----
>>>>  drivers/gpu/drm/mgag200/mgag200_mode.c | 2 +-
>>>>  drivers/gpu/drm/tiny/cirrus.c          | 2 +-
>>>>  include/drm/drm_format_helper.h        | 2 +-
>>>>  4 files changed, 8 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/d=
rm_format_helper.c
>>>> index c043ca364c86..8d5a683afea7 100644
>>>> --- a/drivers/gpu/drm/drm_format_helper.c
>>>> +++ b/drivers/gpu/drm/drm_format_helper.c
>>>> @@ -52,6 +52,7 @@ EXPORT_SYMBOL(drm_fb_memcpy);
>>>>  /**
>>>>   * drm_fb_memcpy_dstclip - Copy clip buffer
>>>>   * @dst: Destination buffer (iomem)
>>>> + * @dst_pitch: Number of bytes between two consecutive scanlines wi=
thin dst
>>>>   * @vaddr: Source buffer
>>>>   * @fb: DRM framebuffer
>>>>   * @clip: Clip rectangle area to copy
>>>> @@ -59,12 +60,12 @@ EXPORT_SYMBOL(drm_fb_memcpy);
>>>>   * This function applies clipping on dst, i.e. the destination is a=

>>>>   * full (iomem) framebuffer but only the clip rect content is copie=
d over.
>>>>   */
>>>> -void drm_fb_memcpy_dstclip(void __iomem *dst, void *vaddr,
>>>> -                       struct drm_framebuffer *fb,
>>>> +void drm_fb_memcpy_dstclip(void __iomem *dst, unsigned int dst_pitc=
h,
>>>> +                       void *vaddr, struct drm_framebuffer *fb,
>>>>                         struct drm_rect *clip)
>>>>  {
>>>>      unsigned int cpp =3D fb->format->cpp[0];
>>>> -    unsigned int offset =3D clip_offset(clip, fb->pitches[0], cpp);=

>>>> +    unsigned int offset =3D clip_offset(clip, dst_pitch, cpp);
>>>>      size_t len =3D (clip->x2 - clip->x1) * cpp;
>>>>      unsigned int y, lines =3D clip->y2 - clip->y1;
>>>>
>>>> @@ -73,7 +74,7 @@ void drm_fb_memcpy_dstclip(void __iomem *dst, void=
 *vaddr,
>>>>      for (y =3D 0; y < lines; y++) {
>>>>              memcpy_toio(dst, vaddr, len);
>>>>              vaddr +=3D fb->pitches[0];
>>>> -            dst +=3D fb->pitches[0];
>>>> +            dst +=3D dst_pitch;
>>>>      }
>>>>  }
>>>>  EXPORT_SYMBOL(drm_fb_memcpy_dstclip);
>>>> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/dr=
m/mgag200/mgag200_mode.c
>>>> index f16bd278ab7e..7d4f3a62d885 100644
>>>> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
>>>> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
>>>> @@ -1586,7 +1586,7 @@ mgag200_handle_damage(struct mga_device *mdev,=
 struct drm_framebuffer *fb,
>>>>      if (drm_WARN_ON(dev, !vmap))
>>>>              return; /* BUG: SHMEM BO should always be vmapped */
>>>>
>>>> -    drm_fb_memcpy_dstclip(mdev->vram, vmap, fb, clip);
>>>> +    drm_fb_memcpy_dstclip(mdev->vram, fb->pitches[0], vmap, fb, cli=
p);
>>>>
>>>>      drm_gem_shmem_vunmap(fb->obj[0], vmap);
>>>>
>>>> diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/ci=
rrus.c
>>>> index 744a8e337e41..2dd9e5e31e3d 100644
>>>> --- a/drivers/gpu/drm/tiny/cirrus.c
>>>> +++ b/drivers/gpu/drm/tiny/cirrus.c
>>>> @@ -327,7 +327,7 @@ static int cirrus_fb_blit_rect(struct drm_frameb=
uffer *fb,
>>>>              goto out_dev_exit;
>>>>
>>>>      if (cirrus->cpp =3D=3D fb->format->cpp[0])
>>>> -            drm_fb_memcpy_dstclip(cirrus->vram,
>>>> +            drm_fb_memcpy_dstclip(cirrus->vram, fb->pitches[0],
>>>>                                    vmap, fb, rect);
>>>>
>>>>      else if (fb->format->cpp[0] =3D=3D 4 && cirrus->cpp =3D=3D 2)
>>>> diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_forma=
t_helper.h
>>>> index 5f9e37032468..2b5036a5fbe7 100644
>>>> --- a/include/drm/drm_format_helper.h
>>>> +++ b/include/drm/drm_format_helper.h
>>>> @@ -11,7 +11,7 @@ struct drm_rect;
>>>>
>>>>  void drm_fb_memcpy(void *dst, void *vaddr, struct drm_framebuffer *=
fb,
>>>>                 struct drm_rect *clip);
>>>> -void drm_fb_memcpy_dstclip(void __iomem *dst, void *vaddr,
>>>> +void drm_fb_memcpy_dstclip(void __iomem *dst, unsigned int dst_pitc=
h, void *vaddr,
>>>>                         struct drm_framebuffer *fb,
>>>>                         struct drm_rect *clip);
>>>>  void drm_fb_swab(void *dst, void *src, struct drm_framebuffer *fb,
>>>> --
>>>> 2.27.0
>>>>
>>>
>>
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>> (HRB 36809, AG N=C3=BCrnberg)
>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--T91xRdoolh4lvcQKgQgHNVF8KTAEURDKF--

--JHBPGGibWz6yFB3XesSdrXmvfKyVrBOSs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9xjz4UHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiM7uggAmg6r74F2nPCyBca6AbCns6lMFaZK
h51JVxlv5MLSXm1a6YQ2MJHQ8iUHAahfmrhd/fcGw3Ex4PhHANu9pGERG7/4u+N6
4EspC4me4ZqD+doHVb72FnnDBuv7XaAfeVKOqR4zobCJR0hLoO1M0Bemz9HHAC8F
BvT86/cY/RVea9RgLPIM11nYdSKI1cayp2R49Ad1rICPV9UPiGXahqpBVjHfQjbX
Ol5093ZSbdA/aiB8DZqz5+pTPKOE4rmmpss9sI/qOFuOyOambIsdZrT+Nec0cOKH
/gJg2GcbjdiPExNnPAt0jHX6aEfIc59BeUiV204gLUV5wBx8jp8HeKjq8Q==
=kFxy
-----END PGP SIGNATURE-----

--JHBPGGibWz6yFB3XesSdrXmvfKyVrBOSs--

--===============0870621010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0870621010==--
