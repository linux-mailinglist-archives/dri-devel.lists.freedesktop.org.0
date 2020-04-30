Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE06C1BF24C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 10:11:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C286E938;
	Thu, 30 Apr 2020 08:11:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 118236E938
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 08:10:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C8D70AD79;
 Thu, 30 Apr 2020 08:10:56 +0000 (UTC)
Subject: Re: [PATCH 01/17] drm/mgag200: Remove HW cursor
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200429143238.10115-1-tzimmermann@suse.de>
 <20200429143238.10115-2-tzimmermann@suse.de>
 <20200429175107.GC31071@ravnborg.org>
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
Message-ID: <78528ab1-4176-7632-1e8a-09c364f809a2@suse.de>
Date: Thu, 30 Apr 2020 10:10:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200429175107.GC31071@ravnborg.org>
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
Cc: john.p.donnelly@oracle.com, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org, airlied@redhat.com
Content-Type: multipart/mixed; boundary="===============0451017855=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0451017855==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="HTffPF20XzCwJSYa5O4xyAjSYMigY3i8J"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--HTffPF20XzCwJSYa5O4xyAjSYMigY3i8J
Content-Type: multipart/mixed; boundary="QgQAK0n9cetKwu93qTBcySlVcPdmmgrBy";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: john.p.donnelly@oracle.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com, airlied@redhat.com
Message-ID: <78528ab1-4176-7632-1e8a-09c364f809a2@suse.de>
Subject: Re: [PATCH 01/17] drm/mgag200: Remove HW cursor
References: <20200429143238.10115-1-tzimmermann@suse.de>
 <20200429143238.10115-2-tzimmermann@suse.de>
 <20200429175107.GC31071@ravnborg.org>
In-Reply-To: <20200429175107.GC31071@ravnborg.org>

--QgQAK0n9cetKwu93qTBcySlVcPdmmgrBy
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Sam

Am 29.04.20 um 19:51 schrieb Sam Ravnborg:
> On Wed, Apr 29, 2020 at 04:32:22PM +0200, Thomas Zimmermann wrote:
>> The HW cursor of Matrox G200 cards only supports a 16-color palette
>> format. Univeral planes require at least ARGB or a similar component-
>> based format. Converting a cursor image from ARGB to 16 colors does no=
t
>> produce pleasent-looking results in general, so remove the HW cursor.
>=20
> What impact does this have in useability?
> Does the cursor behaviour stay the same or?
>=20
> The patch looks fine, but it seems a bit gross ditching curcor support.=

> But maybe it is the right choice, I dunno.

As Gerd said, compositors will render software cursors. Theoretically,
you could measure (maybe see) a difference. In practice not so much.

I'd keep HW cursor support if it was useful, but it isn't. The HW
supports 16-color palettes. That's simply not enough to be useful for
most desktops.

The cursor image is ARGB. The old code used .set_cursor callbacks and
returned an error if the ARGB format could not be fit into the 16-color
palette. On errors, userspace switched to software cursors. From what I
observed, I'd guess that GNOME et al already used SW cursors most of the
time.

With the new atomic interfaces and the dirtyfb ioctl, there's no way of
signalling an error during palette conversion. So userspace wouldn't
know if the HW cursor is visible.

Alternatively to removing the code, the driver could dither the ARGB
cursor image to 16 colors; no matter what the result looks like. But
that's not an option IMHO.

Best regards
Thomas

>=20
> 	Sam
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/mgag200/Makefile         |   2 +-
>>  drivers/gpu/drm/mgag200/mgag200_cursor.c | 319 ----------------------=
-
>>  drivers/gpu/drm/mgag200/mgag200_drv.h    |  13 -
>>  drivers/gpu/drm/mgag200/mgag200_main.c   |   7 -
>>  drivers/gpu/drm/mgag200/mgag200_mode.c   |   2 -
>>  5 files changed, 1 insertion(+), 342 deletions(-)
>>  delete mode 100644 drivers/gpu/drm/mgag200/mgag200_cursor.c
>>
>> diff --git a/drivers/gpu/drm/mgag200/Makefile b/drivers/gpu/drm/mgag20=
0/Makefile
>> index 04b281bcf6558..63403133638a3 100644
>> --- a/drivers/gpu/drm/mgag200/Makefile
>> +++ b/drivers/gpu/drm/mgag200/Makefile
>> @@ -1,5 +1,5 @@
>>  # SPDX-License-Identifier: GPL-2.0-only
>> -mgag200-y   :=3D mgag200_main.o mgag200_mode.o mgag200_cursor.o \
>> +mgag200-y   :=3D mgag200_main.o mgag200_mode.o \
>>  	mgag200_drv.o mgag200_i2c.o mgag200_ttm.o
>> =20
>>  obj-$(CONFIG_DRM_MGAG200) +=3D mgag200.o
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_cursor.c b/drivers/gpu/dr=
m/mgag200/mgag200_cursor.c
>> deleted file mode 100644
>> index d491edd317ff3..0000000000000
>> --- a/drivers/gpu/drm/mgag200/mgag200_cursor.c
>> +++ /dev/null
>> @@ -1,319 +0,0 @@
>> -// SPDX-License-Identifier: GPL-2.0-only
>> -/*
>> - * Copyright 2013 Matrox Graphics
>> - *
>> - * Author: Christopher Harvey <charvey@matrox.com>
>> - */
>> -
>> -#include <linux/pci.h>
>> -
>> -#include "mgag200_drv.h"
>> -
>> -static bool warn_transparent =3D true;
>> -static bool warn_palette =3D true;
>> -
>> -static int mgag200_cursor_update(struct mga_device *mdev, void *dst, =
void *src,
>> -				 unsigned int width, unsigned int height)
>> -{
>> -	struct drm_device *dev =3D mdev->dev;
>> -	unsigned int i, row, col;
>> -	uint32_t colour_set[16];
>> -	uint32_t *next_space =3D &colour_set[0];
>> -	uint32_t *palette_iter;
>> -	uint32_t this_colour;
>> -	bool found =3D false;
>> -	int colour_count =3D 0;
>> -	u8 reg_index;
>> -	u8 this_row[48];
>> -
>> -	memset(&colour_set[0], 0, sizeof(uint32_t)*16);
>> -	/* width*height*4 =3D 16384 */
>> -	for (i =3D 0; i < 16384; i +=3D 4) {
>> -		this_colour =3D ioread32(src + i);
>> -		/* No transparency */
>> -		if (this_colour>>24 !=3D 0xff &&
>> -			this_colour>>24 !=3D 0x0) {
>> -			if (warn_transparent) {
>> -				dev_info(&dev->pdev->dev, "Video card doesn't support cursors wit=
h partial transparency.\n");
>> -				dev_info(&dev->pdev->dev, "Not enabling hardware cursor.\n");
>> -				warn_transparent =3D false; /* Only tell the user once. */
>> -			}
>> -			return -EINVAL;
>> -		}
>> -		/* Don't need to store transparent pixels as colours */
>> -		if (this_colour>>24 =3D=3D 0x0)
>> -			continue;
>> -		found =3D false;
>> -		for (palette_iter =3D &colour_set[0]; palette_iter !=3D next_space;=
 palette_iter++) {
>> -			if (*palette_iter =3D=3D this_colour) {
>> -				found =3D true;
>> -				break;
>> -			}
>> -		}
>> -		if (found)
>> -			continue;
>> -		/* We only support 4bit paletted cursors */
>> -		if (colour_count >=3D 16) {
>> -			if (warn_palette) {
>> -				dev_info(&dev->pdev->dev, "Video card only supports cursors with =
up to 16 colours.\n");
>> -				dev_info(&dev->pdev->dev, "Not enabling hardware cursor.\n");
>> -				warn_palette =3D false; /* Only tell the user once. */
>> -			}
>> -			return -EINVAL;
>> -		}
>> -		*next_space =3D this_colour;
>> -		next_space++;
>> -		colour_count++;
>> -	}
>> -
>> -	/* Program colours from cursor icon into palette */
>> -	for (i =3D 0; i < colour_count; i++) {
>> -		if (i <=3D 2)
>> -			reg_index =3D 0x8 + i*0x4;
>> -		else
>> -			reg_index =3D 0x60 + i*0x3;
>> -		WREG_DAC(reg_index, colour_set[i] & 0xff);
>> -		WREG_DAC(reg_index+1, colour_set[i]>>8 & 0xff);
>> -		WREG_DAC(reg_index+2, colour_set[i]>>16 & 0xff);
>> -		BUG_ON((colour_set[i]>>24 & 0xff) !=3D 0xff);
>> -	}
>> -
>> -	/* now write colour indices into hardware cursor buffer */
>> -	for (row =3D 0; row < 64; row++) {
>> -		memset(&this_row[0], 0, 48);
>> -		for (col =3D 0; col < 64; col++) {
>> -			this_colour =3D ioread32(src + 4*(col + 64*row));
>> -			/* write transparent pixels */
>> -			if (this_colour>>24 =3D=3D 0x0) {
>> -				this_row[47 - col/8] |=3D 0x80>>(col%8);
>> -				continue;
>> -			}
>> -
>> -			/* write colour index here */
>> -			for (i =3D 0; i < colour_count; i++) {
>> -				if (colour_set[i] =3D=3D this_colour) {
>> -					if (col % 2)
>> -						this_row[col/2] |=3D i<<4;
>> -					else
>> -						this_row[col/2] |=3D i;
>> -					break;
>> -				}
>> -			}
>> -		}
>> -		memcpy_toio(dst + row*48, &this_row[0], 48);
>> -	}
>> -
>> -	return 0;
>> -}
>> -
>> -static void mgag200_cursor_set_base(struct mga_device *mdev, u64 addr=
ess)
>> -{
>> -	u8 addrl =3D (address >> 10) & 0xff;
>> -	u8 addrh =3D (address >> 18) & 0x3f;
>> -
>> -	/* Program gpu address of cursor buffer */
>> -	WREG_DAC(MGA1064_CURSOR_BASE_ADR_LOW, addrl);
>> -	WREG_DAC(MGA1064_CURSOR_BASE_ADR_HI, addrh);
>> -}
>> -
>> -static int mgag200_show_cursor(struct mga_device *mdev, void *src,
>> -			       unsigned int width, unsigned int height)
>> -{
>> -	struct drm_device *dev =3D mdev->dev;
>> -	struct drm_gem_vram_object *gbo;
>> -	void *dst;
>> -	s64 off;
>> -	int ret;
>> -
>> -	gbo =3D mdev->cursor.gbo[mdev->cursor.next_index];
>> -	if (!gbo) {
>> -		WREG8(MGA_CURPOSXL, 0);
>> -		WREG8(MGA_CURPOSXH, 0);
>> -		return -ENOTSUPP; /* Didn't allocate space for cursors */
>> -	}
>> -	dst =3D drm_gem_vram_vmap(gbo);
>> -	if (IS_ERR(dst)) {
>> -		ret =3D PTR_ERR(dst);
>> -		dev_err(&dev->pdev->dev,
>> -			"failed to map cursor updates: %d\n", ret);
>> -		return ret;
>> -	}
>> -	off =3D drm_gem_vram_offset(gbo);
>> -	if (off < 0) {
>> -		ret =3D (int)off;
>> -		dev_err(&dev->pdev->dev,
>> -			"failed to get cursor scanout address: %d\n", ret);
>> -		goto err_drm_gem_vram_vunmap;
>> -	}
>> -
>> -	ret =3D mgag200_cursor_update(mdev, dst, src, width, height);
>> -	if (ret)
>> -		goto err_drm_gem_vram_vunmap;
>> -	mgag200_cursor_set_base(mdev, off);
>> -
>> -	/* Adjust cursor control register to turn on the cursor */
>> -	WREG_DAC(MGA1064_CURSOR_CTL, 4); /* 16-colour palletized cursor mode=
 */
>> -
>> -	drm_gem_vram_vunmap(gbo, dst);
>> -
>> -	++mdev->cursor.next_index;
>> -	mdev->cursor.next_index %=3D ARRAY_SIZE(mdev->cursor.gbo);
>> -
>> -	return 0;
>> -
>> -err_drm_gem_vram_vunmap:
>> -	drm_gem_vram_vunmap(gbo, dst);
>> -	return ret;
>> -}
>> -
>> -/*
>> - * Hide the cursor off screen. We can't disable the cursor hardware b=
ecause
>> - * it takes too long to re-activate and causes momentary corruption.
>> - */
>> -static void mgag200_hide_cursor(struct mga_device *mdev)
>> -{
>> -	WREG8(MGA_CURPOSXL, 0);
>> -	WREG8(MGA_CURPOSXH, 0);
>> -}
>> -
>> -static void mgag200_move_cursor(struct mga_device *mdev, int x, int y=
)
>> -{
>> -	if (WARN_ON(x <=3D 0))
>> -		return;
>> -	if (WARN_ON(y <=3D 0))
>> -		return;
>> -	if (WARN_ON(x & ~0xffff))
>> -		return;
>> -	if (WARN_ON(y & ~0xffff))
>> -		return;
>> -
>> -	WREG8(MGA_CURPOSXL, x & 0xff);
>> -	WREG8(MGA_CURPOSXH, (x>>8) & 0xff);
>> -
>> -	WREG8(MGA_CURPOSYL, y & 0xff);
>> -	WREG8(MGA_CURPOSYH, (y>>8) & 0xff);
>> -}
>> -
>> -int mgag200_cursor_init(struct mga_device *mdev)
>> -{
>> -	struct drm_device *dev =3D mdev->dev;
>> -	size_t ncursors =3D ARRAY_SIZE(mdev->cursor.gbo);
>> -	size_t size;
>> -	int ret;
>> -	size_t i;
>> -	struct drm_gem_vram_object *gbo;
>> -
>> -	size =3D roundup(64 * 48, PAGE_SIZE);
>> -	if (size * ncursors > mdev->vram_fb_available)
>> -		return -ENOMEM;
>> -
>> -	for (i =3D 0; i < ncursors; ++i) {
>> -		gbo =3D drm_gem_vram_create(dev, size, 0);
>> -		if (IS_ERR(gbo)) {
>> -			ret =3D PTR_ERR(gbo);
>> -			goto err_drm_gem_vram_put;
>> -		}
>> -		ret =3D drm_gem_vram_pin(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM |
>> -					    DRM_GEM_VRAM_PL_FLAG_TOPDOWN);
>> -		if (ret) {
>> -			drm_gem_vram_put(gbo);
>> -			goto err_drm_gem_vram_put;
>> -		}
>> -
>> -		mdev->cursor.gbo[i] =3D gbo;
>> -	}
>> -
>> -	/*
>> -	 * At the high end of video memory, we reserve space for
>> -	 * buffer objects. The cursor plane uses this memory to store
>> -	 * a double-buffered image of the current cursor. Hence, it's
>> -	 * not available for framebuffers.
>> -	 */
>> -	mdev->vram_fb_available -=3D ncursors * size;
>> -
>> -	return 0;
>> -
>> -err_drm_gem_vram_put:
>> -	while (i) {
>> -		--i;
>> -		gbo =3D mdev->cursor.gbo[i];
>> -		drm_gem_vram_unpin(gbo);
>> -		drm_gem_vram_put(gbo);
>> -		mdev->cursor.gbo[i] =3D NULL;
>> -	}
>> -	return ret;
>> -}
>> -
>> -void mgag200_cursor_fini(struct mga_device *mdev)
>> -{
>> -	size_t i;
>> -	struct drm_gem_vram_object *gbo;
>> -
>> -	for (i =3D 0; i < ARRAY_SIZE(mdev->cursor.gbo); ++i) {
>> -		gbo =3D mdev->cursor.gbo[i];
>> -		drm_gem_vram_unpin(gbo);
>> -		drm_gem_vram_put(gbo);
>> -	}
>> -}
>> -
>> -int mgag200_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *f=
ile_priv,
>> -			    uint32_t handle, uint32_t width, uint32_t height)
>> -{
>> -	struct drm_device *dev =3D crtc->dev;
>> -	struct mga_device *mdev =3D (struct mga_device *)dev->dev_private;
>> -	struct drm_gem_object *obj;
>> -	struct drm_gem_vram_object *gbo =3D NULL;
>> -	int ret;
>> -	u8 *src;
>> -
>> -	if (!handle || !file_priv) {
>> -		mgag200_hide_cursor(mdev);
>> -		return 0;
>> -	}
>> -
>> -	if (width !=3D 64 || height !=3D 64) {
>> -		WREG8(MGA_CURPOSXL, 0);
>> -		WREG8(MGA_CURPOSXH, 0);
>> -		return -EINVAL;
>> -	}
>> -
>> -	obj =3D drm_gem_object_lookup(file_priv, handle);
>> -	if (!obj)
>> -		return -ENOENT;
>> -	gbo =3D drm_gem_vram_of_gem(obj);
>> -	src =3D drm_gem_vram_vmap(gbo);
>> -	if (IS_ERR(src)) {
>> -		ret =3D PTR_ERR(src);
>> -		dev_err(&dev->pdev->dev,
>> -			"failed to map user buffer updates\n");
>> -		goto err_drm_gem_object_put_unlocked;
>> -	}
>> -
>> -	ret =3D mgag200_show_cursor(mdev, src, width, height);
>> -	if (ret)
>> -		goto err_drm_gem_vram_vunmap;
>> -
>> -	/* Now update internal buffer pointers */
>> -	drm_gem_vram_vunmap(gbo, src);
>> -	drm_gem_object_put_unlocked(obj);
>> -
>> -	return 0;
>> -err_drm_gem_vram_vunmap:
>> -	drm_gem_vram_vunmap(gbo, src);
>> -err_drm_gem_object_put_unlocked:
>> -	drm_gem_object_put_unlocked(obj);
>> -	return ret;
>> -}
>> -
>> -int mgag200_crtc_cursor_move(struct drm_crtc *crtc, int x, int y)
>> -{
>> -	struct mga_device *mdev =3D (struct mga_device *)crtc->dev->dev_priv=
ate;
>> -
>> -	/* Our origin is at (64,64) */
>> -	x +=3D 64;
>> -	y +=3D 64;
>> -
>> -	mgag200_move_cursor(mdev, x, y);
>> -
>> -	return 0;
>> -}
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/m=
gag200/mgag200_drv.h
>> index 9691252d6233f..c7f2000d46fce 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
>> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
>> @@ -121,11 +121,6 @@ struct mga_connector {
>>  	struct mga_i2c_chan *i2c;
>>  };
>> =20
>> -struct mga_cursor {
>> -	struct drm_gem_vram_object *gbo[2];
>> -	unsigned int next_index;
>> -};
>> -
>>  struct mga_mc {
>>  	resource_size_t			vram_size;
>>  	resource_size_t			vram_base;
>> @@ -162,8 +157,6 @@ struct mga_device {
>>  	struct mga_mc			mc;
>>  	struct mga_mode_info		mode_info;
>> =20
>> -	struct mga_cursor cursor;
>> -
>>  	size_t vram_fb_available;
>> =20
>>  	bool				suspended;
>> @@ -210,10 +203,4 @@ int mgag200_mm_init(struct mga_device *mdev);
>>  void mgag200_mm_fini(struct mga_device *mdev);
>>  int mgag200_mmap(struct file *filp, struct vm_area_struct *vma);
>> =20
>> -int mgag200_cursor_init(struct mga_device *mdev);
>> -void mgag200_cursor_fini(struct mga_device *mdev);
>> -int mgag200_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *f=
ile_priv,
>> -			    uint32_t handle, uint32_t width, uint32_t height);
>> -int mgag200_crtc_cursor_move(struct drm_crtc *crtc, int x, int y);
>> -
>>  #endif				/* __MGAG200_DRV_H__ */
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/=
mgag200/mgag200_main.c
>> index b680cf47cbb94..46cc32816f1e1 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_main.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_main.c
>> @@ -176,16 +176,10 @@ int mgag200_driver_load(struct drm_device *dev, =
unsigned long flags)
>>  		goto err_modeset;
>>  	}
>> =20
>> -	r =3D mgag200_cursor_init(mdev);
>> -	if (r)
>> -		dev_warn(&dev->pdev->dev,
>> -			"Could not initialize cursors. Not doing hardware cursors.\n");
>> -
>>  	return 0;
>> =20
>>  err_modeset:
>>  	drm_mode_config_cleanup(dev);
>> -	mgag200_cursor_fini(mdev);
>>  	mgag200_mm_fini(mdev);
>>  err_mm:
>>  	dev->dev_private =3D NULL;
>> @@ -201,7 +195,6 @@ void mgag200_driver_unload(struct drm_device *dev)=

>>  		return;
>>  	mgag200_modeset_fini(mdev);
>>  	drm_mode_config_cleanup(dev);
>> -	mgag200_cursor_fini(mdev);
>>  	mgag200_mm_fini(mdev);
>>  	dev->dev_private =3D NULL;
>>  }
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/=
mgag200/mgag200_mode.c
>> index d90e83959fca1..c9d120b019649 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
>> @@ -1414,8 +1414,6 @@ static void mga_crtc_disable(struct drm_crtc *cr=
tc)
>> =20
>>  /* These provide the minimum set of functions required to handle a CR=
TC */
>>  static const struct drm_crtc_funcs mga_crtc_funcs =3D {
>> -	.cursor_set =3D mgag200_crtc_cursor_set,
>> -	.cursor_move =3D mgag200_crtc_cursor_move,
>>  	.gamma_set =3D mga_crtc_gamma_set,
>>  	.set_config =3D drm_crtc_helper_set_config,
>>  	.destroy =3D mga_crtc_destroy,
>> --=20
>> 2.26.0
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


--QgQAK0n9cetKwu93qTBcySlVcPdmmgrBy--

--HTffPF20XzCwJSYa5O4xyAjSYMigY3i8J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6qiBAACgkQaA3BHVML
eiOkEgf/co6FPgt2pQ8BRHRVkt1B3HKzWWdyQrgVV8whXtoPlPqxP5HY2JKU32xT
ITOaHu2akBlr+HC54a/zttdmLSvR2TYnFhIVAjQOkaF1kLdwZrVVCK1uOLvy4PsL
dzJ6azRYIhNRxOZfCdm3jJPVys3HlgDCgQwVBT/VyFmFo/oTUQcynMEbMbEBWHYD
RaYZT2hL6elt6qtbBVfpb/e3nbVC5GY2LGRISiOQf3m51jRx6VJJQLYwy5myrhhu
6NxgUKrdSXH+yrTc0Ve47s1X0cpVEKSc/ye3Vt8ci6c4T68DVRYoFesYylsniiuG
OqDve++qUneOjokDU+Ssq+CdEyfFRw==
=SlkN
-----END PGP SIGNATURE-----

--HTffPF20XzCwJSYa5O4xyAjSYMigY3i8J--

--===============0451017855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0451017855==--
