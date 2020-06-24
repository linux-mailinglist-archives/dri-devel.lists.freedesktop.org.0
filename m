Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39452206C4E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 08:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F5D6E0D7;
	Wed, 24 Jun 2020 06:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D6BA6E0D7
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 06:24:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2CF6DAF90;
 Wed, 24 Jun 2020 06:24:31 +0000 (UTC)
Subject: Re: [PATCH 01/14] drm/ast: Move cursor functions to ast_cursor.c
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200623081901.10667-1-tzimmermann@suse.de>
 <20200623081901.10667-2-tzimmermann@suse.de>
 <20200623165510.GA781557@ravnborg.org>
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
Message-ID: <af0f8ae3-f757-5210-01dd-4e7a59d5d466@suse.de>
Date: Wed, 24 Jun 2020 08:24:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200623165510.GA781557@ravnborg.org>
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
Cc: emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com, airlied@redhat.com
Content-Type: multipart/mixed; boundary="===============0029786920=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0029786920==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="5jgOyVvoS31l9T5WxKud4yFBtKF7liiGW"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--5jgOyVvoS31l9T5WxKud4yFBtKF7liiGW
Content-Type: multipart/mixed; boundary="39hV2LcCnLa9VqYNFEciQMsNsVCTEDcsQ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: airlied@redhat.com, daniel@ffwll.ch, noralf@tronnes.org,
 kraxel@redhat.com, emil.l.velikov@gmail.com, yc_chen@aspeedtech.com,
 dri-devel@lists.freedesktop.org
Message-ID: <af0f8ae3-f757-5210-01dd-4e7a59d5d466@suse.de>
Subject: Re: [PATCH 01/14] drm/ast: Move cursor functions to ast_cursor.c
References: <20200623081901.10667-1-tzimmermann@suse.de>
 <20200623081901.10667-2-tzimmermann@suse.de>
 <20200623165510.GA781557@ravnborg.org>
In-Reply-To: <20200623165510.GA781557@ravnborg.org>

--39hV2LcCnLa9VqYNFEciQMsNsVCTEDcsQ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Sam

Am 23.06.20 um 18:55 schrieb Sam Ravnborg:
> Hi Thomas.
>=20
> On Tue, Jun 23, 2020 at 10:18:48AM +0200, Thomas Zimmermann wrote:
>> The cursor manipulation functions are unrelated to modesetting. Move
>> them into their own file.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/ast/Makefile     |   3 +-
>>  drivers/gpu/drm/ast/ast_cursor.c | 218 ++++++++++++++++++++++++++++++=
+
>>  drivers/gpu/drm/ast/ast_drv.h    |   9 ++
>>  drivers/gpu/drm/ast/ast_mode.c   | 195 ---------------------------
>>  4 files changed, 229 insertions(+), 196 deletions(-)
>>  create mode 100644 drivers/gpu/drm/ast/ast_cursor.c
>>
>> diff --git a/drivers/gpu/drm/ast/Makefile b/drivers/gpu/drm/ast/Makefi=
le
>> index 561f7c4199e4..6a5b3b247316 100644
>> --- a/drivers/gpu/drm/ast/Makefile
>> +++ b/drivers/gpu/drm/ast/Makefile
>> @@ -3,6 +3,7 @@
>>  # Makefile for the drm device driver.  This driver provides support f=
or the
>>  # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
>> =20
>> -ast-y :=3D ast_drv.o ast_main.o ast_mode.o ast_ttm.o ast_post.o ast_d=
p501.o
>> +ast-y :=3D ast_cursor.o ast_drv.o ast_main.o ast_mode.o ast_ttm.o ast=
_post.o \
>> +	 ast_dp501.o
>> =20
>>  obj-$(CONFIG_DRM_AST) :=3D ast.o
>> diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/as=
t_cursor.c
>> new file mode 100644
>> index 000000000000..53bb6eebc7cd
>> --- /dev/null
>> +++ b/drivers/gpu/drm/ast/ast_cursor.c
>> @@ -0,0 +1,218 @@
>> +/*
>> + * Copyright 2012 Red Hat Inc.
>> + * Parts based on xf86-video-ast
>> + * Copyright (c) 2005 ASPEED Technology Inc.
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtain=
ing a
>> + * copy of this software and associated documentation files (the
>> + * "Software"), to deal in the Software without restriction, includin=
g
>> + * without limitation the rights to use, copy, modify, merge, publish=
,
>> + * distribute, sub license, and/or sell copies of the Software, and t=
o
>> + * permit persons to whom the Software is furnished to do so, subject=
 to
>> + * the following conditions:
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EX=
PRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT=
 SHALL
>> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR =
ANY CLAIM,
>> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT=
 OR
>> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE=
 OR THE
>> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
>> + *
>> + * The above copyright notice and this permission notice (including t=
he
>> + * next paragraph) shall be included in all copies or substantial por=
tions
>> + * of the Software.
>=20
> SPDX for new files?
> I guess this boilerplate was copied from the old file.

Yes, I copied the license text from the old file. I wasn't sure if I can
just add the SPDX tag. If that's not a problem, I'll add it in the next
iteration.

Best regards
Thomas

>=20
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>=20
>> + */
>> +/*
>> + * Authors: Dave Airlie <airlied@redhat.com>
>> + */
>> +
>> +#include <drm/drm_gem_vram_helper.h>
>> +
>> +#include "ast_drv.h"
>> +
>> +/*
>> + * Allocate cursor BOs and pins them at the end of VRAM.
>> + */
>> +int ast_cursor_init(struct drm_device *dev)
>> +{
>> +	struct ast_private *ast =3D to_ast_private(dev);
>> +	size_t size, i;
>> +	struct drm_gem_vram_object *gbo;
>> +	int ret;
>> +
>> +	size =3D roundup(AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE, PAGE_SIZE);
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(ast->cursor.gbo); ++i) {
>> +		gbo =3D drm_gem_vram_create(dev, size, 0);
>> +		if (IS_ERR(gbo)) {
>> +			ret =3D PTR_ERR(gbo);
>> +			goto err_drm_gem_vram_put;
>> +		}
>> +		ret =3D drm_gem_vram_pin(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM |
>> +					    DRM_GEM_VRAM_PL_FLAG_TOPDOWN);
>> +		if (ret) {
>> +			drm_gem_vram_put(gbo);
>> +			goto err_drm_gem_vram_put;
>> +		}
>> +
>> +		ast->cursor.gbo[i] =3D gbo;
>> +	}
>> +
>> +	return 0;
>> +
>> +err_drm_gem_vram_put:
>> +	while (i) {
>> +		--i;
>> +		gbo =3D ast->cursor.gbo[i];
>> +		drm_gem_vram_unpin(gbo);
>> +		drm_gem_vram_put(gbo);
>> +		ast->cursor.gbo[i] =3D NULL;
>> +	}
>> +	return ret;
>> +}
>> +
>> +void ast_cursor_fini(struct drm_device *dev)
>> +{
>> +	struct ast_private *ast =3D to_ast_private(dev);
>> +	size_t i;
>> +	struct drm_gem_vram_object *gbo;
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(ast->cursor.gbo); ++i) {
>> +		gbo =3D ast->cursor.gbo[i];
>> +		drm_gem_vram_unpin(gbo);
>> +		drm_gem_vram_put(gbo);
>> +	}
>> +}
>> +
>> +static u32 copy_cursor_image(u8 *src, u8 *dst, int width, int height)=

>> +{
>> +	union {
>> +		u32 ul;
>> +		u8 b[4];
>> +	} srcdata32[2], data32;
>> +	union {
>> +		u16 us;
>> +		u8 b[2];
>> +	} data16;
>> +	u32 csum =3D 0;
>> +	s32 alpha_dst_delta, last_alpha_dst_delta;
>> +	u8 *srcxor, *dstxor;
>> +	int i, j;
>> +	u32 per_pixel_copy, two_pixel_copy;
>> +
>> +	alpha_dst_delta =3D AST_MAX_HWC_WIDTH << 1;
>> +	last_alpha_dst_delta =3D alpha_dst_delta - (width << 1);
>> +
>> +	srcxor =3D src;
>> +	dstxor =3D (u8 *)dst + last_alpha_dst_delta + (AST_MAX_HWC_HEIGHT - =
height) * alpha_dst_delta;
>> +	per_pixel_copy =3D width & 1;
>> +	two_pixel_copy =3D width >> 1;
>> +
>> +	for (j =3D 0; j < height; j++) {
>> +		for (i =3D 0; i < two_pixel_copy; i++) {
>> +			srcdata32[0].ul =3D *((u32 *)srcxor) & 0xf0f0f0f0;
>> +			srcdata32[1].ul =3D *((u32 *)(srcxor + 4)) & 0xf0f0f0f0;
>> +			data32.b[0] =3D srcdata32[0].b[1] | (srcdata32[0].b[0] >> 4);
>> +			data32.b[1] =3D srcdata32[0].b[3] | (srcdata32[0].b[2] >> 4);
>> +			data32.b[2] =3D srcdata32[1].b[1] | (srcdata32[1].b[0] >> 4);
>> +			data32.b[3] =3D srcdata32[1].b[3] | (srcdata32[1].b[2] >> 4);
>> +
>> +			writel(data32.ul, dstxor);
>> +			csum +=3D data32.ul;
>> +
>> +			dstxor +=3D 4;
>> +			srcxor +=3D 8;
>> +
>> +		}
>> +
>> +		for (i =3D 0; i < per_pixel_copy; i++) {
>> +			srcdata32[0].ul =3D *((u32 *)srcxor) & 0xf0f0f0f0;
>> +			data16.b[0] =3D srcdata32[0].b[1] | (srcdata32[0].b[0] >> 4);
>> +			data16.b[1] =3D srcdata32[0].b[3] | (srcdata32[0].b[2] >> 4);
>> +			writew(data16.us, dstxor);
>> +			csum +=3D (u32)data16.us;
>> +
>> +			dstxor +=3D 2;
>> +			srcxor +=3D 4;
>> +		}
>> +		dstxor +=3D last_alpha_dst_delta;
>> +	}
>> +	return csum;
>> +}
>> +
>> +int ast_cursor_update(void *dst, void *src, unsigned int width,
>> +		      unsigned int height)
>> +{
>> +	u32 csum;
>> +
>> +	/* do data transfer to cursor cache */
>> +	csum =3D copy_cursor_image(src, dst, width, height);
>> +
>> +	/* write checksum + signature */
>> +	dst +=3D AST_HWC_SIZE;
>> +	writel(csum, dst);
>> +	writel(width, dst + AST_HWC_SIGNATURE_SizeX);
>> +	writel(height, dst + AST_HWC_SIGNATURE_SizeY);
>> +	writel(0, dst + AST_HWC_SIGNATURE_HOTSPOTX);
>> +	writel(0, dst + AST_HWC_SIGNATURE_HOTSPOTY);
>> +
>> +	return 0;
>> +}
>> +
>> +void ast_cursor_set_base(struct ast_private *ast, u64 address)
>> +{
>> +	u8 addr0 =3D (address >> 3) & 0xff;
>> +	u8 addr1 =3D (address >> 11) & 0xff;
>> +	u8 addr2 =3D (address >> 19) & 0xff;
>> +
>> +	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc8, addr0);
>> +	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc9, addr1);
>> +	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xca, addr2);
>> +}
>> +
>> +int ast_cursor_move(struct drm_crtc *crtc, int x, int y)
>> +{
>> +	struct ast_crtc *ast_crtc =3D to_ast_crtc(crtc);
>> +	struct ast_private *ast =3D to_ast_private(crtc->dev);
>> +	struct drm_gem_vram_object *gbo;
>> +	int x_offset, y_offset;
>> +	u8 *dst, *sig;
>> +	u8 jreg;
>> +
>> +	gbo =3D ast->cursor.gbo[ast->cursor.next_index];
>> +	dst =3D drm_gem_vram_vmap(gbo);
>> +	if (IS_ERR(dst))
>> +		return PTR_ERR(dst);
>> +
>> +	sig =3D dst + AST_HWC_SIZE;
>> +	writel(x, sig + AST_HWC_SIGNATURE_X);
>> +	writel(y, sig + AST_HWC_SIGNATURE_Y);
>> +
>> +	x_offset =3D ast_crtc->offset_x;
>> +	y_offset =3D ast_crtc->offset_y;
>> +	if (x < 0) {
>> +		x_offset =3D (-x) + ast_crtc->offset_x;
>> +		x =3D 0;
>> +	}
>> +
>> +	if (y < 0) {
>> +		y_offset =3D (-y) + ast_crtc->offset_y;
>> +		y =3D 0;
>> +	}
>> +	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc2, x_offset);
>> +	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc3, y_offset);
>> +	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc4, (x & 0xff));
>> +	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc5, ((x >> 8) & 0x0f));
>> +	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc6, (y & 0xff));
>> +	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc7, ((y >> 8) & 0x07));
>> +
>> +	/* dummy write to fire HWC */
>> +	jreg =3D 0x02 |
>> +	       0x01; /* enable ARGB4444 cursor */
>> +	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xcb, 0xfc, jreg);
>> +
>> +	drm_gem_vram_vunmap(gbo, dst);
>> +
>> +	return 0;
>> +}
>> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_d=
rv.h
>> index c44c1376c697..245ed2e2d775 100644
>> --- a/drivers/gpu/drm/ast/ast_drv.h
>> +++ b/drivers/gpu/drm/ast/ast_drv.h
>> @@ -314,4 +314,13 @@ bool ast_dp501_read_edid(struct drm_device *dev, =
u8 *ediddata);
>>  u8 ast_get_dp501_max_clk(struct drm_device *dev);
>>  void ast_init_3rdtx(struct drm_device *dev);
>>  void ast_release_firmware(struct drm_device *dev);
>> +
>> +/* ast_cursor.c */
>> +int ast_cursor_init(struct drm_device *dev);
>> +void ast_cursor_fini(struct drm_device *dev);
>> +int ast_cursor_update(void *dst, void *src, unsigned int width,
>> +		      unsigned int height);
>> +void ast_cursor_set_base(struct ast_private *ast, u64 address);
>> +int ast_cursor_move(struct drm_crtc *crtc, int x, int y);
>> +
>>  #endif
>> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_=
mode.c
>> index 510ffb497344..c8399699d773 100644
>> --- a/drivers/gpu/drm/ast/ast_mode.c
>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>> @@ -47,16 +47,6 @@
>> =20
>>  static struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev);
>>  static void ast_i2c_destroy(struct ast_i2c_chan *i2c);
>> -static int ast_cursor_move(struct drm_crtc *crtc,
>> -			   int x, int y);
>> -
>> -
>> -static u32 copy_cursor_image(u8 *src, u8 *dst, int width, int height)=
;
>> -static int ast_cursor_update(void *dst, void *src, unsigned int width=
,
>> -			     unsigned int height);
>> -static void ast_cursor_set_base(struct ast_private *ast, u64 address)=
;
>> -static int ast_cursor_move(struct drm_crtc *crtc,
>> -			   int x, int y);
>> =20
>>  static inline void ast_load_palette_index(struct ast_private *ast,
>>  				     u8 index, u8 red, u8 green,
>> @@ -1129,58 +1119,6 @@ static int ast_connector_init(struct drm_device=
 *dev)
>>  	return 0;
>>  }
>> =20
>> -/* allocate cursor cache and pin at start of VRAM */
>> -static int ast_cursor_init(struct drm_device *dev)
>> -{
>> -	struct ast_private *ast =3D to_ast_private(dev);
>> -	size_t size, i;
>> -	struct drm_gem_vram_object *gbo;
>> -	int ret;
>> -
>> -	size =3D roundup(AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE, PAGE_SIZE);
>> -
>> -	for (i =3D 0; i < ARRAY_SIZE(ast->cursor.gbo); ++i) {
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
>> -		ast->cursor.gbo[i] =3D gbo;
>> -	}
>> -
>> -	return 0;
>> -
>> -err_drm_gem_vram_put:
>> -	while (i) {
>> -		--i;
>> -		gbo =3D ast->cursor.gbo[i];
>> -		drm_gem_vram_unpin(gbo);
>> -		drm_gem_vram_put(gbo);
>> -		ast->cursor.gbo[i] =3D NULL;
>> -	}
>> -	return ret;
>> -}
>> -
>> -static void ast_cursor_fini(struct drm_device *dev)
>> -{
>> -	struct ast_private *ast =3D to_ast_private(dev);
>> -	size_t i;
>> -	struct drm_gem_vram_object *gbo;
>> -
>> -	for (i =3D 0; i < ARRAY_SIZE(ast->cursor.gbo); ++i) {
>> -		gbo =3D ast->cursor.gbo[i];
>> -		drm_gem_vram_unpin(gbo);
>> -		drm_gem_vram_put(gbo);
>> -	}
>> -}
>> -
>>  int ast_mode_init(struct drm_device *dev)
>>  {
>>  	struct ast_private *ast =3D to_ast_private(dev);
>> @@ -1344,136 +1282,3 @@ static void ast_i2c_destroy(struct ast_i2c_cha=
n *i2c)
>>  	i2c_del_adapter(&i2c->adapter);
>>  	kfree(i2c);
>>  }
>> -
>> -static u32 copy_cursor_image(u8 *src, u8 *dst, int width, int height)=

>> -{
>> -	union {
>> -		u32 ul;
>> -		u8 b[4];
>> -	} srcdata32[2], data32;
>> -	union {
>> -		u16 us;
>> -		u8 b[2];
>> -	} data16;
>> -	u32 csum =3D 0;
>> -	s32 alpha_dst_delta, last_alpha_dst_delta;
>> -	u8 *srcxor, *dstxor;
>> -	int i, j;
>> -	u32 per_pixel_copy, two_pixel_copy;
>> -
>> -	alpha_dst_delta =3D AST_MAX_HWC_WIDTH << 1;
>> -	last_alpha_dst_delta =3D alpha_dst_delta - (width << 1);
>> -
>> -	srcxor =3D src;
>> -	dstxor =3D (u8 *)dst + last_alpha_dst_delta + (AST_MAX_HWC_HEIGHT - =
height) * alpha_dst_delta;
>> -	per_pixel_copy =3D width & 1;
>> -	two_pixel_copy =3D width >> 1;
>> -
>> -	for (j =3D 0; j < height; j++) {
>> -		for (i =3D 0; i < two_pixel_copy; i++) {
>> -			srcdata32[0].ul =3D *((u32 *)srcxor) & 0xf0f0f0f0;
>> -			srcdata32[1].ul =3D *((u32 *)(srcxor + 4)) & 0xf0f0f0f0;
>> -			data32.b[0] =3D srcdata32[0].b[1] | (srcdata32[0].b[0] >> 4);
>> -			data32.b[1] =3D srcdata32[0].b[3] | (srcdata32[0].b[2] >> 4);
>> -			data32.b[2] =3D srcdata32[1].b[1] | (srcdata32[1].b[0] >> 4);
>> -			data32.b[3] =3D srcdata32[1].b[3] | (srcdata32[1].b[2] >> 4);
>> -
>> -			writel(data32.ul, dstxor);
>> -			csum +=3D data32.ul;
>> -
>> -			dstxor +=3D 4;
>> -			srcxor +=3D 8;
>> -
>> -		}
>> -
>> -		for (i =3D 0; i < per_pixel_copy; i++) {
>> -			srcdata32[0].ul =3D *((u32 *)srcxor) & 0xf0f0f0f0;
>> -			data16.b[0] =3D srcdata32[0].b[1] | (srcdata32[0].b[0] >> 4);
>> -			data16.b[1] =3D srcdata32[0].b[3] | (srcdata32[0].b[2] >> 4);
>> -			writew(data16.us, dstxor);
>> -			csum +=3D (u32)data16.us;
>> -
>> -			dstxor +=3D 2;
>> -			srcxor +=3D 4;
>> -		}
>> -		dstxor +=3D last_alpha_dst_delta;
>> -	}
>> -	return csum;
>> -}
>> -
>> -static int ast_cursor_update(void *dst, void *src, unsigned int width=
,
>> -			     unsigned int height)
>> -{
>> -	u32 csum;
>> -
>> -	/* do data transfer to cursor cache */
>> -	csum =3D copy_cursor_image(src, dst, width, height);
>> -
>> -	/* write checksum + signature */
>> -	dst +=3D AST_HWC_SIZE;
>> -	writel(csum, dst);
>> -	writel(width, dst + AST_HWC_SIGNATURE_SizeX);
>> -	writel(height, dst + AST_HWC_SIGNATURE_SizeY);
>> -	writel(0, dst + AST_HWC_SIGNATURE_HOTSPOTX);
>> -	writel(0, dst + AST_HWC_SIGNATURE_HOTSPOTY);
>> -
>> -	return 0;
>> -}
>> -
>> -static void ast_cursor_set_base(struct ast_private *ast, u64 address)=

>> -{
>> -	u8 addr0 =3D (address >> 3) & 0xff;
>> -	u8 addr1 =3D (address >> 11) & 0xff;
>> -	u8 addr2 =3D (address >> 19) & 0xff;
>> -
>> -	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc8, addr0);
>> -	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc9, addr1);
>> -	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xca, addr2);
>> -}
>> -
>> -static int ast_cursor_move(struct drm_crtc *crtc,
>> -			   int x, int y)
>> -{
>> -	struct ast_crtc *ast_crtc =3D to_ast_crtc(crtc);
>> -	struct ast_private *ast =3D to_ast_private(crtc->dev);
>> -	struct drm_gem_vram_object *gbo;
>> -	int x_offset, y_offset;
>> -	u8 *dst, *sig;
>> -	u8 jreg;
>> -
>> -	gbo =3D ast->cursor.gbo[ast->cursor.next_index];
>> -	dst =3D drm_gem_vram_vmap(gbo);
>> -	if (IS_ERR(dst))
>> -		return PTR_ERR(dst);
>> -
>> -	sig =3D dst + AST_HWC_SIZE;
>> -	writel(x, sig + AST_HWC_SIGNATURE_X);
>> -	writel(y, sig + AST_HWC_SIGNATURE_Y);
>> -
>> -	x_offset =3D ast_crtc->offset_x;
>> -	y_offset =3D ast_crtc->offset_y;
>> -	if (x < 0) {
>> -		x_offset =3D (-x) + ast_crtc->offset_x;
>> -		x =3D 0;
>> -	}
>> -
>> -	if (y < 0) {
>> -		y_offset =3D (-y) + ast_crtc->offset_y;
>> -		y =3D 0;
>> -	}
>> -	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc2, x_offset);
>> -	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc3, y_offset);
>> -	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc4, (x & 0xff));
>> -	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc5, ((x >> 8) & 0x0f));
>> -	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc6, (y & 0xff));
>> -	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc7, ((y >> 8) & 0x07));
>> -
>> -	/* dummy write to fire HWC */
>> -	jreg =3D 0x02 |
>> -	       0x01; /* enable ARGB4444 cursor */
>> -	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xcb, 0xfc, jreg);
>> -
>> -	drm_gem_vram_vunmap(gbo, dst);
>> -
>> -	return 0;
>> -}
>> --=20
>> 2.27.0
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--39hV2LcCnLa9VqYNFEciQMsNsVCTEDcsQ--

--5jgOyVvoS31l9T5WxKud4yFBtKF7liiGW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl7y8Z4ACgkQaA3BHVML
eiNcoQf+MxQMoWQWsJc8S7S66TlJmPrNhl0kyojUdACcNWyc7A3pvF/lpTeFjmB7
H7iMwCTLwwKWD4Yd4wztb5VXRXRi+4AfM96ZtLy3Xwvuv8ez1zglEpBj0GFpPtnt
3QMYhL2vUDWUVU/761whio+9LopFqdLmpwMrXurDSyh9CE0RrGXN40/lBSVzcSja
tUU9dCxNTiJVrGu595F4qXE0CRZ8HQbT1bcyXGg67URgbhWqwQwoauXJxLCiT4gw
0nbzKZR/V615ahXuXRXW+Ix9oPxmXaUyJFjKqBVgOYGRYCkgJ62cphyfrHMJ0oNf
iuXY/wIkuvXjERuJcnkn25b8iO/63A==
=t9ri
-----END PGP SIGNATURE-----

--5jgOyVvoS31l9T5WxKud4yFBtKF7liiGW--

--===============0029786920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0029786920==--
