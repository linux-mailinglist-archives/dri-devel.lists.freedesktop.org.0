Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3479F5AF40
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 09:34:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3CBF89B20;
	Sun, 30 Jun 2019 07:34:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A5589B20
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2019 07:34:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7C0F2AE40;
 Sun, 30 Jun 2019 07:34:53 +0000 (UTC)
Subject: Re: [PATCH v1 32/33] drm/ast: drop use of drmP.h
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
References: <20190630061922.7254-1-sam@ravnborg.org>
 <20190630061922.7254-33-sam@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Openpgp: preference=signencrypt
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNKFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmNvbT7CwJQEEwEIAD4W
 IQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznTtgIbAwUJA8JnAAULCQgHAgYVCgkICwIEFgID
 AQIeAQIXgAAKCRBoDcEdUwt6I7D7CACBK42XW+7mCiK8ioXMEy1NzGbXC51RzGea8N83oEJS
 1KVUtQxrkDxgrW/WLSl/TfqHFsJpdEFOv1XubWbleun3uKPy0e5vZCd5UjZPkeNjnqfCYTDy
 hVVsdOuFbtWDppJyJrThLqr9AgSFmoCNNUt1SVpYEEOLNE6C32BhlnSq21VLC+YXTgO/ZHTa
 YXkq54hHj63jwrcjkBSCkXLh37kHeqnl++GHpN+3R+o3w2OpwHAlvVjdKPT27v1tVkiydsFG
 65Vd0n3m/ft+IOrGgxQM1C20uqKvsZGB4r3OGR50ekAybO7sjEJJ1Obl4ge/6RRqcvKz4LMb
 tGs85D6tPIeFzsBNBFs50uABCADGJj+DP1fk+UWOWrf4O61HTbC4Vr9QD2K4fUUHnzg2B6zU
 R1BPXqLGG0+lzK8kfYU/F5RjmEcClsIkAaFkg4kzKP14tvY1J5+AV3yNqcdg018HNtiyrSwI
 E0Yz/qm1Ot2NMZ0DdvVBg22IMsiudQ1tx9CH9mtyTbIXgACvl3PW2o9CxiHPE/bohFhwZwh/
 kXYYAE51lhinQ3oFEeQZA3w4OTvxSEspiQR8dg8qJJb+YOAc5IKk6sJmmM7JfFMWSr22satM
 23oQ3WvJb4RV6HTRTAIEyyZS7g2DhiytgMG60t0qdABG5KXSQW+OKlZRpuWwKWaLh3if/p/u
 69dvpanbABEBAAHCwHwEGAEIACYWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznS4AIbDAUJ
 A8JnAAAKCRBoDcEdUwt6I6X3CACJ8D+TpXBCqJE5xwog08+Dp8uBpx0T9n1wE0GQisZruACW
 NofYn8PTX9k4wmegDLwt7YQDdKxQ4+eTfZeLNQqWg6OCftH5Kx7sjWnJ09tOgniVdROzWJ7c
 VJ/i0okazncsJ+nq48UYvRGE1Swh3A4QRIyphWX4OADOBmTFl9ZYNPnh23eaC9WrNvFr7yP7
 iGjMlfEW8l6Lda//EC5VpXVNza0xeae0zFNst2R9pn+bLkihwDLWxOIyifGRxTqNxoS4I1aw
 VhxPSVztPMSpIA/sOr/N/p6JrBLn+gui2K6mP7bGb8hF+szfArYqz3T1rv1VzUWAJf5Wre5U
 iNx9uqqx
Message-ID: <65727066-7d53-3e47-b2cc-389c9505bfc2@suse.de>
Date: Sun, 30 Jun 2019 09:34:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190630061922.7254-33-sam@ravnborg.org>
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, YueHaibing <yuehaibing@huawei.com>,
 Hans de Goede <hdegoede@redhat.com>, Huang Rui <ray.huang@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============0450598180=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0450598180==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="xvtNSh3EkxecuCqHoHMH2ljuzSOwEC06y"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xvtNSh3EkxecuCqHoHMH2ljuzSOwEC06y
Content-Type: multipart/mixed; boundary="phMuuBjRx7ssiCue9VnWVo1BcIHiMsEoL";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Sam Bobroff <sbobroff@linux.ibm.com>, YueHaibing <yuehaibing@huawei.com>,
 Huang Rui <ray.huang@amd.com>, "Y.C. Chen" <yc_chen@aspeedtech.com>,
 Hans de Goede <hdegoede@redhat.com>
Message-ID: <65727066-7d53-3e47-b2cc-389c9505bfc2@suse.de>
Subject: Re: [PATCH v1 32/33] drm/ast: drop use of drmP.h
References: <20190630061922.7254-1-sam@ravnborg.org>
 <20190630061922.7254-33-sam@ravnborg.org>
In-Reply-To: <20190630061922.7254-33-sam@ravnborg.org>

--phMuuBjRx7ssiCue9VnWVo1BcIHiMsEoL
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Am 30.06.19 um 08:19 schrieb Sam Ravnborg:
> Drop use of the deprecated drmP.h header file.
> While touching the files divide include files in blocks
> and sort the include files in the individual blocks.
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: Sam Bobroff <sbobroff@linux.ibm.com>
> Cc: YueHaibing <yuehaibing@huawei.com>
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: "Y.C. Chen" <yc_chen@aspeedtech.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> ---
> The list of cc: was too large to add all recipients to the cover letter=
=2E
> Please find cover letter here:
> https://lists.freedesktop.org/archives/dri-devel/2019-June/thread.html
> Search for "drm: drop use of drmp.h in drm-misc"
>=20
>         Sam
>=20
>  drivers/gpu/drm/ast/ast_dp501.c |  5 ++++-
>  drivers/gpu/drm/ast/ast_drv.c   |  9 +++++++--
>  drivers/gpu/drm/ast/ast_drv.h   | 17 +++++++++--------
>  drivers/gpu/drm/ast/ast_fb.c    | 20 ++++++++++++--------
>  drivers/gpu/drm/ast/ast_main.c  |  9 +++++++--
>  drivers/gpu/drm/ast/ast_mode.c  |  8 ++++++--
>  drivers/gpu/drm/ast/ast_post.c  |  7 +++++--
>  drivers/gpu/drm/ast/ast_ttm.c   |  7 ++++++-
>  8 files changed, 56 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_=
dp501.c
> index 4c7375b45281..98cd69269263 100644
> --- a/drivers/gpu/drm/ast/ast_dp501.c
> +++ b/drivers/gpu/drm/ast/ast_dp501.c
> @@ -1,8 +1,11 @@
>  // SPDX-License-Identifier: GPL-2.0
> =20
> +#include <linux/delay.h>
>  #include <linux/firmware.h>
> -#include <drm/drmP.h>
> +#include <linux/module.h>
> +
>  #include "ast_drv.h"
> +
>  MODULE_FIRMWARE("ast_dp501_fw.bin");
> =20
>  static int ast_load_dp501_microcode(struct drm_device *dev)
> diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_dr=
v.c
> index 3811997e78c4..dd120e2d61e9 100644
> --- a/drivers/gpu/drm/ast/ast_drv.c
> +++ b/drivers/gpu/drm/ast/ast_drv.c
> @@ -25,12 +25,17 @@
>  /*
>   * Authors: Dave Airlie <airlied@redhat.com>
>   */
> -#include <linux/module.h>
> +
>  #include <linux/console.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>
> =20
> -#include <drm/drmP.h>
>  #include <drm/drm_crtc_helper.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_gem_vram_helper.h>
> +#include <drm/drm_pci.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/drm_vram_mm_helper.h>
> =20
>  #include "ast_drv.h"
> =20
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_dr=
v.h
> index ca794a3fcf8f..c0f76aef460b 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -28,17 +28,18 @@
>  #ifndef __AST_DRV_H__
>  #define __AST_DRV_H__
> =20
> -#include <drm/drm_encoder.h>
> -#include <drm/drm_fb_helper.h>
> -
> -#include <drm/drm_gem.h>
> -#include <drm/drm_gem_vram_helper.h>
> -
> -#include <drm/drm_vram_mm_helper.h>
> -
> +#include <linux/types.h>
> +#include <linux/io.h>
>  #include <linux/i2c.h>
>  #include <linux/i2c-algo-bit.h>
> =20
> +#include <drm/drm_connector.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_encoder.h>
> +#include <drm/drm_mode.h>
> +#include <drm/drm_framebuffer.h>
> +#include <drm/drm_fb_helper.h>
> +
>  #define DRIVER_AUTHOR		"Dave Airlie"
> =20
>  #define DRIVER_NAME		"ast"
> diff --git a/drivers/gpu/drm/ast/ast_fb.c b/drivers/gpu/drm/ast/ast_fb.=
c
> index a849e58b40bc..6343aa92f237 100644
> --- a/drivers/gpu/drm/ast/ast_fb.c
> +++ b/drivers/gpu/drm/ast/ast_fb.c
> @@ -25,22 +25,26 @@
>  /*
>   * Authors: Dave Airlie <airlied@redhat.com>
>   */
> -#include <linux/module.h>
> -#include <linux/kernel.h>
> +
> +#include <linux/delay.h>
>  #include <linux/errno.h>
> -#include <linux/string.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
>  #include <linux/mm.h>
> -#include <linux/tty.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +#include <linux/string.h>
>  #include <linux/sysrq.h>
> -#include <linux/delay.h>
> -#include <linux/init.h>
> -
> +#include <linux/tty.h>
> +#include <linux/vmalloc.h>
> =20
> -#include <drm/drmP.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_fb_helper.h>
> +#include <drm/drm_fourcc.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_gem_vram_helper.h>
> +#include <drm/drm_print.h>
>  #include <drm/drm_util.h>
> =20
>  #include "ast_drv.h"
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_m=
ain.c
> index 1bd61696e509..b6f8dd040ae7 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -25,12 +25,17 @@
>  /*
>   * Authors: Dave Airlie <airlied@redhat.com>
>   */
> -#include <drm/drmP.h>
> -#include "ast_drv.h"
> +
> +#include <linux/pci.h>
> =20
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_fb_helper.h>
> +#include <drm/drm_gem.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_gem_vram_helper.h>
> +#include <drm/drm_vram_mm_helper.h>
> +
> +#include "ast_drv.h"
> =20
>  void ast_set_index_reg_mask(struct ast_private *ast,
>  			    uint32_t base, uint8_t index,
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_m=
ode.c
> index c48249df758e..9d2789040edb 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -27,14 +27,18 @@
>  /*
>   * Authors: Dave Airlie <airlied@redhat.com>
>   */
> +
>  #include <linux/export.h>
> -#include <drm/drmP.h>
> +#include <linux/pci.h>
> +
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_crtc_helper.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_gem_vram_helper.h>
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_probe_helper.h>
> -#include "ast_drv.h"
> =20
> +#include "ast_drv.h"
>  #include "ast_tables.h"
> =20
>  static struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev);
> diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_p=
ost.c
> index f7d421359d56..e1d9cdf6ec1d 100644
> --- a/drivers/gpu/drm/ast/ast_post.c
> +++ b/drivers/gpu/drm/ast/ast_post.c
> @@ -26,10 +26,13 @@
>   * Authors: Dave Airlie <airlied@redhat.com>
>   */
> =20
> -#include <drm/drmP.h>
> -#include "ast_drv.h"
> +#include <linux/delay.h>
> +#include <linux/pci.h>
> +
> +#include <drm/drm_print.h>
> =20
>  #include "ast_dram_tables.h"
> +#include "ast_drv.h"
> =20
>  static void ast_post_chip_2300(struct drm_device *dev);
>  static void ast_post_chip_2500(struct drm_device *dev);
> diff --git a/drivers/gpu/drm/ast/ast_ttm.c b/drivers/gpu/drm/ast/ast_tt=
m.c
> index 779c53efee8e..c52d92294171 100644
> --- a/drivers/gpu/drm/ast/ast_ttm.c
> +++ b/drivers/gpu/drm/ast/ast_ttm.c
> @@ -25,7 +25,12 @@
>  /*
>   * Authors: Dave Airlie <airlied@redhat.com>
>   */
> -#include <drm/drmP.h>
> +
> +#include <linux/pci.h>
> +
> +#include <drm/drm_print.h>
> +#include <drm/drm_gem_vram_helper.h>
> +#include <drm/drm_vram_mm_helper.h>
> =20
>  #include "ast_drv.h"
> =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--phMuuBjRx7ssiCue9VnWVo1BcIHiMsEoL--

--xvtNSh3EkxecuCqHoHMH2ljuzSOwEC06y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl0YZhkACgkQaA3BHVML
eiMkLQf/TkXOyMQAiy8LAu0CbuRTIoZMxxGW/USi57VpXMkDhFuaicMo/qYtDE+5
/WcHVvGI5LBx2ZhX8HhfAvObh2yHuipiwui2WVexxWCfW1zgI5/8NV6SsJK0F/im
iwmHM9Ysd8Vq0FnONYUlLj5qu7hbxeGq8954KzDTBiSeKnV9Z+SbByfP0Hq4OSCV
4/pkH1IiHTCIp7rLzSGyr0CGLp6RXrx3FCg2LrYxTS3T5cFfyvi0m7FVzLXg/I8g
8lY/mgd30bwESETseJmNIC0Pyq55CBpMCQDxX4jrkgQgn2C6HLAFPJaXIkOxU00J
pdr9+DBMeW7Ckd29mhiFnQXVmQr9Uw==
=V87U
-----END PGP SIGNATURE-----

--xvtNSh3EkxecuCqHoHMH2ljuzSOwEC06y--

--===============0450598180==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0450598180==--
