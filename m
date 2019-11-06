Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B36D5F1737
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 14:36:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D299B6E199;
	Wed,  6 Nov 2019 13:36:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A336E199
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 13:36:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1872BB20F;
 Wed,  6 Nov 2019 13:36:41 +0000 (UTC)
Subject: Re: [PATCH 9/9] drm/ast: Enable atomic modesetting
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20191028154928.4058-1-tzimmermann@suse.de>
 <20191028154928.4058-10-tzimmermann@suse.de>
 <20191105095711.nzjlqwjjt57se5rt@sirius.home.kraxel.org>
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
Message-ID: <1d81c21e-a6f5-c2a7-11d2-dd6017c58ef5@suse.de>
Date: Wed, 6 Nov 2019 14:36:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191105095711.nzjlqwjjt57se5rt@sirius.home.kraxel.org>
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
Cc: airlied@redhat.com, chen@aspeedtech.com, dri-devel@lists.freedesktop.org,
 sam@ravnborg.org
Content-Type: multipart/mixed; boundary="===============0731962051=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0731962051==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="iB6w1rZE3MsnhDrkIOEJRWZvwqpzWw9mh"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--iB6w1rZE3MsnhDrkIOEJRWZvwqpzWw9mh
Content-Type: multipart/mixed; boundary="W9TvRQ1lLd6JJoql1kBdhEYaqlCbXC45n";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: airlied@redhat.com, chen@aspeedtech.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org
Message-ID: <1d81c21e-a6f5-c2a7-11d2-dd6017c58ef5@suse.de>
Subject: Re: [PATCH 9/9] drm/ast: Enable atomic modesetting
References: <20191028154928.4058-1-tzimmermann@suse.de>
 <20191028154928.4058-10-tzimmermann@suse.de>
 <20191105095711.nzjlqwjjt57se5rt@sirius.home.kraxel.org>
In-Reply-To: <20191105095711.nzjlqwjjt57se5rt@sirius.home.kraxel.org>

--W9TvRQ1lLd6JJoql1kBdhEYaqlCbXC45n
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 05.11.19 um 10:57 schrieb Gerd Hoffmann:
> On Mon, Oct 28, 2019 at 04:49:28PM +0100, Thomas Zimmermann wrote:
>> This commit sets the remaining atomic-modesetting helpers and the flag=

>> DRIVER_ATOMIC. Legacy cursor functions are removed in favor of the cur=
sor
>> plane. For power management, atomic helpers replace the indvidual
>> operations that the driver currently runs.
>>
>> Atomic modesetting is enabled with this commit.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/ast/ast_drv.c  |  24 ++-
>>  drivers/gpu/drm/ast/ast_main.c |   5 +
>>  drivers/gpu/drm/ast/ast_mode.c | 290 ++------------------------------=
-
>>  3 files changed, 33 insertions(+), 286 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_d=
rv.c
>> index 1f17794b0890..d763da6f0834 100644
>> --- a/drivers/gpu/drm/ast/ast_drv.c
>> +++ b/drivers/gpu/drm/ast/ast_drv.c
>> @@ -99,14 +99,14 @@ ast_pci_remove(struct pci_dev *pdev)
>>  	drm_put_dev(dev);
>>  }
>> =20
>> -
>> -
>>  static int ast_drm_freeze(struct drm_device *dev)
>>  {
>> -	drm_kms_helper_poll_disable(dev);
>> -	pci_save_state(dev->pdev);
>> -	drm_fb_helper_set_suspend_unlocked(dev->fb_helper, true);
>> +	int error;
>> =20
>> +	error =3D drm_mode_config_helper_suspend(dev);
>> +	if (error)
>> +		return error;
>> +	pci_save_state(dev->pdev);
>>  	return 0;
>>  }
>> =20
>> @@ -114,11 +114,7 @@ static int ast_drm_thaw(struct drm_device *dev)
>>  {
>>  	ast_post_gpu(dev);
>> =20
>> -	drm_mode_config_reset(dev);
>> -	drm_helper_resume_force_mode(dev);
>> -	drm_fb_helper_set_suspend_unlocked(dev->fb_helper, false);
>> -
>> -	return 0;
>> +	return drm_mode_config_helper_resume(dev);
>>  }
>> =20
>>  static int ast_drm_resume(struct drm_device *dev)
>> @@ -131,8 +127,6 @@ static int ast_drm_resume(struct drm_device *dev)
>>  	ret =3D ast_drm_thaw(dev);
>>  	if (ret)
>>  		return ret;
>> -
>> -	drm_kms_helper_poll_enable(dev);
>>  	return 0;
>>  }
>> =20
>> @@ -150,6 +144,7 @@ static int ast_pm_suspend(struct device *dev)
>>  	pci_set_power_state(pdev, PCI_D3hot);
>>  	return 0;
>>  }
>> +
>>  static int ast_pm_resume(struct device *dev)
>>  {
>>  	struct pci_dev *pdev =3D to_pci_dev(dev);
>> @@ -165,7 +160,6 @@ static int ast_pm_freeze(struct device *dev)
>>  	if (!ddev || !ddev->dev_private)
>>  		return -ENODEV;
>>  	return ast_drm_freeze(ddev);
>> -
>>  }
>> =20
>>  static int ast_pm_thaw(struct device *dev)
>> @@ -203,7 +197,9 @@ static struct pci_driver ast_pci_driver =3D {
>>  DEFINE_DRM_GEM_FOPS(ast_fops);
>> =20
>>  static struct drm_driver driver =3D {
>> -	.driver_features =3D DRIVER_MODESET | DRIVER_GEM,
>> +	.driver_features =3D DRIVER_ATOMIC |
>> +			   DRIVER_GEM |
>> +			   DRIVER_MODESET,
>> =20
>>  	.load =3D ast_driver_load,
>>  	.unload =3D ast_driver_unload,
>> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_=
main.c
>> index 48d57ab42955..b79f484e9bd2 100644
>> --- a/drivers/gpu/drm/ast/ast_main.c
>> +++ b/drivers/gpu/drm/ast/ast_main.c
>> @@ -28,6 +28,7 @@
>> =20
>>  #include <linux/pci.h>
>> =20
>> +#include <drm/drm_atomic_helper.h>
>>  #include <drm/drm_crtc_helper.h>
>>  #include <drm/drm_fb_helper.h>
>>  #include <drm/drm_gem.h>
>> @@ -412,6 +413,8 @@ enum drm_mode_status ast_mode_config_mode_valid(st=
ruct drm_device *dev,
>>  static const struct drm_mode_config_funcs ast_mode_funcs =3D {
>>  	.fb_create =3D drm_gem_fb_create,
>>  	.mode_valid =3D ast_mode_config_mode_valid,
>> +	.atomic_check =3D drm_atomic_helper_check,
>> +	.atomic_commit =3D drm_atomic_helper_commit,
>>  };
>> =20
>>  static u32 ast_get_vram_info(struct drm_device *dev)
>> @@ -529,6 +532,8 @@ int ast_driver_load(struct drm_device *dev, unsign=
ed long flags)
>>  	if (ret)
>>  		goto out_free;
>> =20
>> +	drm_mode_config_reset(dev);
>> +
>>  	ret =3D drm_fbdev_generic_setup(dev, 32);
>>  	if (ret)
>>  		goto out_free;
>> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_=
mode.c
>> index f5f73200e8e4..5eccb6ae2ede 100644
>> --- a/drivers/gpu/drm/ast/ast_mode.c
>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>> @@ -45,11 +45,6 @@
>> =20
>>  static struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev);
>>  static void ast_i2c_destroy(struct ast_i2c_chan *i2c);
>> -static int ast_cursor_set(struct drm_crtc *crtc,
>> -			  struct drm_file *file_priv,
>> -			  uint32_t handle,
>> -			  uint32_t width,
>> -			  uint32_t height);
>>  static int ast_cursor_move(struct drm_crtc *crtc,
>>  			   int x, int y);
>> =20
>> @@ -58,9 +53,6 @@ static u32 copy_cursor_image(u8 *src, u8 *dst, int w=
idth, int height);
>>  static int ast_cursor_update(void *dst, void *src, unsigned int width=
,
>>  			     unsigned int height);
>>  static void ast_cursor_set_base(struct ast_private *ast, u64 address)=
;
>> -static int ast_show_cursor(struct drm_crtc *crtc, void *src,
>> -			   unsigned int width, unsigned int height);
>> -static void ast_hide_cursor(struct drm_crtc *crtc);
>>  static int ast_cursor_move(struct drm_crtc *crtc,
>>  			   int x, int y);
>> =20
>> @@ -434,7 +426,7 @@ static void ast_set_crtc_reg(struct drm_crtc *crtc=
, struct drm_display_mode *mod
>>  static void ast_set_offset_reg(struct drm_crtc *crtc)
>>  {
>>  	struct ast_private *ast =3D crtc->dev->dev_private;
>> -	const struct drm_framebuffer *fb =3D crtc->primary->fb;
>> +	const struct drm_framebuffer *fb =3D crtc->primary->state->fb;
>> =20
>>  	u16 offset;
>> =20
>> @@ -528,7 +520,7 @@ static void ast_set_sync_reg(struct drm_device *de=
v, struct drm_display_mode *mo
>>  static bool ast_set_dac_reg(struct drm_crtc *crtc, struct drm_display=
_mode *mode,
>>  		     struct ast_vbios_mode_info *vbios_mode)
>>  {
>> -	const struct drm_framebuffer *fb =3D crtc->primary->fb;
>> +	const struct drm_framebuffer *fb =3D crtc->primary->state->fb;
>> =20
>>  	switch (fb->format->cpp[0] * 8) {
>>  	case 8:
>> @@ -765,112 +757,6 @@ static void ast_crtc_dpms(struct drm_crtc *crtc,=
 int mode)
>>  	}
>>  }
>> =20
>> -static int ast_crtc_do_set_base(struct drm_crtc *crtc,
>> -				struct drm_framebuffer *fb,
>> -				int x, int y, int atomic)
>> -{
>> -	struct drm_gem_vram_object *gbo;
>> -	int ret;
>> -	s64 gpu_addr;
>> -
>> -	if (!atomic && fb) {
>> -		gbo =3D drm_gem_vram_of_gem(fb->obj[0]);
>> -		drm_gem_vram_unpin(gbo);
>> -	}
>> -
>> -	gbo =3D drm_gem_vram_of_gem(crtc->primary->fb->obj[0]);
>> -
>> -	ret =3D drm_gem_vram_pin(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM);
>> -	if (ret)
>> -		return ret;
>> -	gpu_addr =3D drm_gem_vram_offset(gbo);
>> -	if (gpu_addr < 0) {
>> -		ret =3D (int)gpu_addr;
>> -		goto err_drm_gem_vram_unpin;
>> -	}
>> -
>> -	ast_set_offset_reg(crtc);
>> -	ast_set_start_address_crt1(crtc, (u32)gpu_addr);
>> -
>> -	return 0;
>> -
>> -err_drm_gem_vram_unpin:
>> -	drm_gem_vram_unpin(gbo);
>> -	return ret;
>> -}
>> -
>> -static int ast_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y=
,
>> -			     struct drm_framebuffer *old_fb)
>> -{
>> -	return ast_crtc_do_set_base(crtc, old_fb, x, y, 0);
>> -}
>> -
>> -static int ast_crtc_mode_set(struct drm_crtc *crtc,
>> -			     struct drm_display_mode *mode,
>> -			     struct drm_display_mode *adjusted_mode,
>> -			     int x, int y,
>> -			     struct drm_framebuffer *old_fb)
>> -{
>> -	struct drm_device *dev =3D crtc->dev;
>> -	struct ast_private *ast =3D crtc->dev->dev_private;
>> -	const struct drm_framebuffer *fb =3D crtc->primary->fb;
>> -	struct ast_vbios_mode_info vbios_mode;
>> -	bool succ;
>> -
>> -	if (ast->chip =3D=3D AST1180) {
>> -		DRM_ERROR("AST 1180 modesetting not supported\n");
>> -		return -EINVAL;
>> -	}
>> -
>> -	succ =3D ast_get_vbios_mode_info(fb, mode, adjusted_mode, &vbios_mod=
e);
>> -	if (!succ)
>> -		return -EINVAL;
>> -
>> -	ast_open_key(ast);
>> -
>> -	ast_set_vbios_color_reg(crtc, fb, &vbios_mode);
>> -	ast_set_vbios_mode_reg(crtc, adjusted_mode, &vbios_mode);
>> -	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa1, 0x06);
>> -	ast_set_std_reg(crtc, adjusted_mode, &vbios_mode);
>> -	ast_set_crtc_reg(crtc, adjusted_mode, &vbios_mode);
>> -	ast_set_offset_reg(crtc);
>> -	ast_set_dclk_reg(dev, adjusted_mode, &vbios_mode);
>> -	ast_set_color_reg(crtc, fb);
>> -	ast_set_crtthd_reg(crtc);
>> -	ast_set_sync_reg(dev, adjusted_mode, &vbios_mode);
>> -	ast_set_dac_reg(crtc, adjusted_mode, &vbios_mode);
>> -
>> -	ast_crtc_mode_set_base(crtc, x, y, old_fb);
>> -
>> -	return 0;
>> -}
>> -
>> -static void ast_crtc_disable(struct drm_crtc *crtc)
>> -{
>> -	DRM_DEBUG_KMS("\n");
>> -	ast_crtc_dpms(crtc, DRM_MODE_DPMS_OFF);
>> -	if (crtc->primary->fb) {
>> -		struct drm_framebuffer *fb =3D crtc->primary->fb;
>> -		struct drm_gem_vram_object *gbo =3D
>> -			drm_gem_vram_of_gem(fb->obj[0]);
>> -
>> -		drm_gem_vram_unpin(gbo);
>> -	}
>> -	crtc->primary->fb =3D NULL;
>> -}
>> -
>> -static void ast_crtc_prepare(struct drm_crtc *crtc)
>> -{
>> -
>> -}
>> -
>> -static void ast_crtc_commit(struct drm_crtc *crtc)
>> -{
>> -	struct ast_private *ast =3D crtc->dev->dev_private;
>> -	ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x1, 0xdf, 0);
>> -	ast_crtc_load_lut(crtc);
>> -}
>> -
>>  static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
>>  					struct drm_crtc_state *state)
>>  {
>> @@ -970,12 +856,6 @@ ast_crtc_helper_atomic_disable(struct drm_crtc *c=
rtc,
>>  }
>> =20
>>  static const struct drm_crtc_helper_funcs ast_crtc_helper_funcs =3D {=

>> -	.dpms =3D ast_crtc_dpms,
>> -	.mode_set =3D ast_crtc_mode_set,
>> -	.mode_set_base =3D ast_crtc_mode_set_base,
>> -	.disable =3D ast_crtc_disable,
>> -	.prepare =3D ast_crtc_prepare,
>> -	.commit =3D ast_crtc_commit,
>>  	.atomic_check =3D ast_crtc_helper_atomic_check,
>>  	.atomic_begin =3D ast_crtc_helper_atomic_begin,
>>  	.atomic_flush =3D ast_crtc_helper_atomic_flush,
>> @@ -983,21 +863,6 @@ static const struct drm_crtc_helper_funcs ast_crt=
c_helper_funcs =3D {
>>  	.atomic_disable =3D ast_crtc_helper_atomic_disable,
>>  };
>> =20
>> -static void ast_crtc_reset(struct drm_crtc *crtc)
>> -{
>> -
>> -}
>> -
>> -static int ast_crtc_gamma_set(struct drm_crtc *crtc, u16 *red, u16 *g=
reen,
>> -			      u16 *blue, uint32_t size,
>> -			      struct drm_modeset_acquire_ctx *ctx)
>> -{
>> -	ast_crtc_load_lut(crtc);
>> -
>> -	return 0;
>> -}
>> -
>> -
>>  static void ast_crtc_destroy(struct drm_crtc *crtc)
>>  {
>>  	drm_crtc_cleanup(crtc);
>> @@ -1005,12 +870,12 @@ static void ast_crtc_destroy(struct drm_crtc *c=
rtc)
>>  }
>> =20
>>  static const struct drm_crtc_funcs ast_crtc_funcs =3D {
>> -	.cursor_set =3D ast_cursor_set,
>> -	.cursor_move =3D ast_cursor_move,
>> -	.reset =3D ast_crtc_reset,
>> +	.reset =3D drm_atomic_helper_crtc_reset,
>>  	.set_config =3D drm_crtc_helper_set_config,
>> -	.gamma_set =3D ast_crtc_gamma_set,
>> +	.gamma_set =3D drm_atomic_helper_legacy_gamma_set,
>>  	.destroy =3D ast_crtc_destroy,
>> +	.set_config =3D drm_atomic_helper_set_config,
>> +	.page_flip =3D drm_atomic_helper_page_flip,
>>  	.atomic_duplicate_state =3D drm_atomic_helper_crtc_duplicate_state,
>>  	.atomic_destroy_state =3D drm_atomic_helper_crtc_destroy_state,
>>  };
>> @@ -1040,6 +905,10 @@ static int ast_crtc_init(struct drm_device *dev)=

>>  	return ret;
>>  }
>> =20
>> +/*
>> + * Encoder
>> + */
>> +
>>  static void ast_encoder_destroy(struct drm_encoder *encoder)
>>  {
>>  	drm_encoder_cleanup(encoder);
>> @@ -1050,34 +919,6 @@ static const struct drm_encoder_funcs ast_enc_fu=
ncs =3D {
>>  	.destroy =3D ast_encoder_destroy,
>>  };
>> =20
>> -static void ast_encoder_dpms(struct drm_encoder *encoder, int mode)
>> -{
>> -
>> -}
>> -
>> -static void ast_encoder_mode_set(struct drm_encoder *encoder,
>> -			       struct drm_display_mode *mode,
>> -			       struct drm_display_mode *adjusted_mode)
>> -{
>> -}
>> -
>> -static void ast_encoder_prepare(struct drm_encoder *encoder)
>> -{
>> -
>> -}
>> -
>> -static void ast_encoder_commit(struct drm_encoder *encoder)
>> -{
>> -
>> -}
>> -
>> -static const struct drm_encoder_helper_funcs ast_enc_helper_funcs =3D=
 {
>> -	.dpms =3D ast_encoder_dpms,
>> -	.prepare =3D ast_encoder_prepare,
>> -	.commit =3D ast_encoder_commit,
>> -	.mode_set =3D ast_encoder_mode_set,
>> -};
>=20
> Hmm.  Pretty much a dummy encoder implementation.  Maybe ast is simple
> enough that the simple pipe helpers can do the trick?

As Daniel said, simple pipe helpers don't support cursors. I
investigated his comment on a encoder helpers and found that many
drivers (including ast) only create an encoder structure without
additional functionality.

It's probably worth introducing a default implementation for the
encoder, but I'd like to do that in a separate patch set. Ok?

Best regards
Thomas

>=20
> cheers,
>   Gerd
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


--W9TvRQ1lLd6JJoql1kBdhEYaqlCbXC45n--

--iB6w1rZE3MsnhDrkIOEJRWZvwqpzWw9mh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3CzFUACgkQaA3BHVML
eiM6Jgf/QD0+nJmq7Is2+ZkCv+I7ORddw9aq4aWHhK1oTEPmuXRPO1hARoz1Hp2p
lb4V7HAFH3fCZ4d+u108sjunVjy+nKu7MH1XHcCcbbRwTZ7WFQ6ZgwYacGtJcfQY
ld42oWYh/8rJ14O2gxpVkoc9GSeiqFz9IrKNvsiBDldrEx0czczYBX2ffnv2rGwz
rsRUwl0sed97jiuB01OIgcsfeAEVJOXmQXTGQmsG2Kp2LFoNgQhaPxbsBI5bRwb9
RBWzGztxopKxZRgGRf/xFfdQl9C/JC01a1mOzV8oHjQaKbphf7NcD3bNtOqiME/w
HxqUfUWB2GiLDiVd3D3bfI/hS7afHg==
=nRdg
-----END PGP SIGNATURE-----

--iB6w1rZE3MsnhDrkIOEJRWZvwqpzWw9mh--

--===============0731962051==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0731962051==--
