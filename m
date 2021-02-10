Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F543168CE
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 15:12:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA7706E05C;
	Wed, 10 Feb 2021 14:12:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D176E05C;
 Wed, 10 Feb 2021 14:12:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 05B9EAC43;
 Wed, 10 Feb 2021 14:12:26 +0000 (UTC)
Subject: Re: [PATCH] drm/gem: Move drm_gem_fb_prepare_fb() to GEM atomic
 helpers
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210209102913.6372-1-tzimmermann@suse.de>
 <YCPbK2zFJMzwHim/@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <d2187a9c-6afd-5610-34e5-a8b0553a3724@suse.de>
Date: Wed, 10 Feb 2021 15:12:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YCPbK2zFJMzwHim/@phenom.ffwll.local>
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
Cc: linux-renesas-soc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-tegra@vger.kernel.org,
 xen-devel@lists.xenproject.org, freedreno@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0150066336=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0150066336==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="brhUVpTaaIsU1Pu416E7yYfIywuZWVv5l"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--brhUVpTaaIsU1Pu416E7yYfIywuZWVv5l
Content-Type: multipart/mixed; boundary="zVTdTEY2ybqGG3p4xWPzRkxAvxOUdDuVf";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: linaro-mm-sig@lists.linaro.org, linux-aspeed@lists.ozlabs.org,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, freedreno@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Message-ID: <d2187a9c-6afd-5610-34e5-a8b0553a3724@suse.de>
Subject: Re: [PATCH] drm/gem: Move drm_gem_fb_prepare_fb() to GEM atomic
 helpers
References: <20210209102913.6372-1-tzimmermann@suse.de>
 <YCPbK2zFJMzwHim/@phenom.ffwll.local>
In-Reply-To: <YCPbK2zFJMzwHim/@phenom.ffwll.local>

--zVTdTEY2ybqGG3p4xWPzRkxAvxOUdDuVf
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 10.02.21 um 14:10 schrieb Daniel Vetter:
> On Tue, Feb 09, 2021 at 11:29:13AM +0100, Thomas Zimmermann wrote:
>> The function drm_gem_fb_prepare_fb() is a helper for atomic modesettin=
g,
>> but currently located next to framebuffer helpers. Move it to GEM atom=
ic
>> helpers, rename it slightly and adopt the drivers. Same for the rsp
>> simple-pipe helper.
>>
>> Compile-tested with x86-64, aarch64 and arm. The patch is fairly large=
,
>> but there are no functional changes.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> If we bikeshed this, I think should also throw in the _helper_ somewher=
e?

Sure. How about drm_gem_plane_helper_prepare_fb()?

Best regards
Thomas

> But really I don't have an opinion on this.
> -Daniel
>=20
>> ---
>>   drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c     |  4 +-
>>   drivers/gpu/drm/drm_gem_atomic_helper.c      | 69 ++++++++++++++++++=
+-
>>   drivers/gpu/drm/drm_gem_framebuffer_helper.c | 63 ------------------=

>>   drivers/gpu/drm/drm_gem_vram_helper.c        |  4 +-
>>   drivers/gpu/drm/imx/dcss/dcss-plane.c        |  4 +-
>>   drivers/gpu/drm/imx/ipuv3-plane.c            |  4 +-
>>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c    |  3 +-
>>   drivers/gpu/drm/ingenic/ingenic-ipu.c        |  4 +-
>>   drivers/gpu/drm/mcde/mcde_display.c          |  4 +-
>>   drivers/gpu/drm/mediatek/mtk_drm_plane.c     |  6 +-
>>   drivers/gpu/drm/meson/meson_overlay.c        |  8 +--
>>   drivers/gpu/drm/meson/meson_plane.c          |  4 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c    |  4 +-
>>   drivers/gpu/drm/msm/msm_atomic.c             |  4 +-
>>   drivers/gpu/drm/mxsfb/mxsfb_kms.c            |  6 +-
>>   drivers/gpu/drm/pl111/pl111_display.c        |  4 +-
>>   drivers/gpu/drm/rcar-du/rcar_du_vsp.c        |  4 +-
>>   drivers/gpu/drm/rockchip/rockchip_drm_vop.c  |  3 +-
>>   drivers/gpu/drm/stm/ltdc.c                   |  4 +-
>>   drivers/gpu/drm/sun4i/sun4i_layer.c          |  4 +-
>>   drivers/gpu/drm/sun4i/sun8i_ui_layer.c       |  4 +-
>>   drivers/gpu/drm/sun4i/sun8i_vi_layer.c       |  4 +-
>>   drivers/gpu/drm/tegra/plane.c                |  4 +-
>>   drivers/gpu/drm/tidss/tidss_plane.c          |  4 +-
>>   drivers/gpu/drm/tiny/hx8357d.c               |  4 +-
>>   drivers/gpu/drm/tiny/ili9225.c               |  4 +-
>>   drivers/gpu/drm/tiny/ili9341.c               |  4 +-
>>   drivers/gpu/drm/tiny/ili9486.c               |  4 +-
>>   drivers/gpu/drm/tiny/mi0283qt.c              |  4 +-
>>   drivers/gpu/drm/tiny/repaper.c               |  3 +-
>>   drivers/gpu/drm/tiny/st7586.c                |  4 +-
>>   drivers/gpu/drm/tiny/st7735r.c               |  4 +-
>>   drivers/gpu/drm/tve200/tve200_display.c      |  4 +-
>>   drivers/gpu/drm/vc4/vc4_plane.c              |  4 +-
>>   drivers/gpu/drm/vkms/vkms_plane.c            |  3 +-
>>   drivers/gpu/drm/xen/xen_drm_front_kms.c      |  3 +-
>>   include/drm/drm_gem_atomic_helper.h          |  8 +++
>>   include/drm/drm_gem_framebuffer_helper.h     |  6 +-
>>   include/drm/drm_modeset_helper_vtables.h     |  2 +-
>>   include/drm/drm_plane.h                      |  4 +-
>>   include/drm/drm_simple_kms_helper.h          |  2 +-
>>   41 files changed, 152 insertions(+), 141 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c b/drivers/gpu/dr=
m/aspeed/aspeed_gfx_crtc.c
>> index e54686c31a90..d8f214e0be82 100644
>> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
>> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
>> @@ -9,8 +9,8 @@
>>   #include <drm/drm_device.h>
>>   #include <drm/drm_fb_cma_helper.h>
>>   #include <drm/drm_fourcc.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_gem_cma_helper.h>
>> -#include <drm/drm_gem_framebuffer_helper.h>
>>   #include <drm/drm_panel.h>
>>   #include <drm/drm_simple_kms_helper.h>
>>   #include <drm/drm_vblank.h>
>> @@ -219,7 +219,7 @@ static const struct drm_simple_display_pipe_funcs =
aspeed_gfx_funcs =3D {
>>   	.enable		=3D aspeed_gfx_pipe_enable,
>>   	.disable	=3D aspeed_gfx_pipe_disable,
>>   	.update		=3D aspeed_gfx_pipe_update,
>> -	.prepare_fb	=3D drm_gem_fb_simple_display_pipe_prepare_fb,
>> +	.prepare_fb	=3D drm_gem_simple_display_pipe_prepare_fb,
>>   	.enable_vblank	=3D aspeed_gfx_enable_vblank,
>>   	.disable_vblank	=3D aspeed_gfx_disable_vblank,
>>   };
>> diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm=
/drm_gem_atomic_helper.c
>> index e27762cef360..c656b40656bf 100644
>> --- a/drivers/gpu/drm/drm_gem_atomic_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
>> @@ -1,6 +1,10 @@
>>   // SPDX-License-Identifier: GPL-2.0-or-later
>>  =20
>> +#include <linux/dma-resv.h>
>> +
>>   #include <drm/drm_atomic_state_helper.h>
>> +#include <drm/drm_atomic_uapi.h>
>> +#include <drm/drm_gem.h>
>>   #include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_gem_framebuffer_helper.h>
>>   #include <drm/drm_simple_kms_helper.h>
>> @@ -12,10 +16,69 @@
>>    *
>>    * The GEM atomic helpers library implements generic atomic-commit
>>    * functions for drivers that use GEM objects. Currently, it provide=
s
>> - * plane state and framebuffer BO mappings for planes with shadow
>> - * buffers.
>> + * synchronization helpers, and plane state and framebuffer BO mappin=
gs
>> + * for planes with shadow buffers.
>> + */
>> +
>> +/*
>> + * Plane Helpers
>>    */
>>  =20
>> +/**
>> + * drm_gem_prepare_fb() - Prepare a GEM backed framebuffer
>> + * @plane: Plane
>> + * @state: Plane state the fence will be attached to
>> + *
>> + * This function extracts the exclusive fence from &drm_gem_object.re=
sv and
>> + * attaches it to plane state for the atomic helper to wait on. This =
is
>> + * necessary to correctly implement implicit synchronization for any =
buffers
>> + * shared as a struct &dma_buf. This function can be used as the
>> + * &drm_plane_helper_funcs.prepare_fb callback.
>> + *
>> + * There is no need for &drm_plane_helper_funcs.cleanup_fb hook for s=
imple
>> + * GEM based framebuffer drivers which have their buffers always pinn=
ed in
>> + * memory.
>> + *
>> + * See drm_atomic_set_fence_for_plane() for a discussion of implicit =
and
>> + * explicit fencing in atomic modeset updates.
>> + */
>> +int drm_gem_prepare_fb(struct drm_plane *plane, struct drm_plane_stat=
e *state)
>> +{
>> +	struct drm_gem_object *obj;
>> +	struct dma_fence *fence;
>> +
>> +	if (!state->fb)
>> +		return 0;
>> +
>> +	obj =3D drm_gem_fb_get_obj(state->fb, 0);
>> +	fence =3D dma_resv_get_excl_rcu(obj->resv);
>> +	drm_atomic_set_fence_for_plane(state, fence);
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(drm_gem_prepare_fb);
>> +
>> +/**
>> + * drm_gem_simple_display_pipe_prepare_fb - prepare_fb helper for &dr=
m_simple_display_pipe
>> + * @pipe: Simple display pipe
>> + * @plane_state: Plane state
>> + *
>> + * This function uses drm_gem_prepare_fb() to extract the exclusive f=
ence
>> + * from &drm_gem_object.resv and attaches it to plane state for the a=
tomic
>> + * helper to wait on. This is necessary to correctly implement implic=
it
>> + * synchronization for any buffers shared as a struct &dma_buf. Drive=
rs can use
>> + * this as their &drm_simple_display_pipe_funcs.prepare_fb callback.
>> + *
>> + * See drm_atomic_set_fence_for_plane() for a discussion of implicit =
and
>> + * explicit fencing in atomic modeset updates.
>> + */
>> +int drm_gem_simple_display_pipe_prepare_fb(struct drm_simple_display_=
pipe *pipe,
>> +					   struct drm_plane_state *plane_state)
>> +{
>> +	return drm_gem_prepare_fb(&pipe->plane, plane_state);
>> +}
>> +EXPORT_SYMBOL(drm_gem_simple_display_pipe_prepare_fb);
>> +
>>   /*
>>    * Shadow-buffered Planes
>>    */
>> @@ -74,7 +137,7 @@ static int drm_gem_prepare_shadow_fb(struct drm_pla=
ne *plane, struct drm_plane_s
>>   	if (!fb)
>>   		return 0;
>>  =20
>> -	ret =3D drm_gem_fb_prepare_fb(plane, plane_state);
>> +	ret =3D drm_gem_prepare_fb(plane, plane_state);
>>   	if (ret)
>>   		return ret;
>>  =20
>> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gp=
u/drm/drm_gem_framebuffer_helper.c
>> index 109d11fb4cd4..5ed2067cebb6 100644
>> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
>> @@ -5,13 +5,8 @@
>>    * Copyright (C) 2017 Noralf Tr=C3=B8nnes
>>    */
>>  =20
>> -#include <linux/dma-buf.h>
>> -#include <linux/dma-fence.h>
>> -#include <linux/dma-resv.h>
>>   #include <linux/slab.h>
>>  =20
>> -#include <drm/drm_atomic.h>
>> -#include <drm/drm_atomic_uapi.h>
>>   #include <drm/drm_damage_helper.h>
>>   #include <drm/drm_fb_helper.h>
>>   #include <drm/drm_fourcc.h>
>> @@ -19,7 +14,6 @@
>>   #include <drm/drm_gem.h>
>>   #include <drm/drm_gem_framebuffer_helper.h>
>>   #include <drm/drm_modeset_helper.h>
>> -#include <drm/drm_simple_kms_helper.h>
>>  =20
>>   #define AFBC_HEADER_SIZE		16
>>   #define AFBC_TH_LAYOUT_ALIGNMENT	8
>> @@ -432,60 +426,3 @@ int drm_gem_fb_afbc_init(struct drm_device *dev,
>>   	return 0;
>>   }
>>   EXPORT_SYMBOL_GPL(drm_gem_fb_afbc_init);
>> -
>> -/**
>> - * drm_gem_fb_prepare_fb() - Prepare a GEM backed framebuffer
>> - * @plane: Plane
>> - * @state: Plane state the fence will be attached to
>> - *
>> - * This function extracts the exclusive fence from &drm_gem_object.re=
sv and
>> - * attaches it to plane state for the atomic helper to wait on. This =
is
>> - * necessary to correctly implement implicit synchronization for any =
buffers
>> - * shared as a struct &dma_buf. This function can be used as the
>> - * &drm_plane_helper_funcs.prepare_fb callback.
>> - *
>> - * There is no need for &drm_plane_helper_funcs.cleanup_fb hook for s=
imple
>> - * gem based framebuffer drivers which have their buffers always pinn=
ed in
>> - * memory.
>> - *
>> - * See drm_atomic_set_fence_for_plane() for a discussion of implicit =
and
>> - * explicit fencing in atomic modeset updates.
>> - */
>> -int drm_gem_fb_prepare_fb(struct drm_plane *plane,
>> -			  struct drm_plane_state *state)
>> -{
>> -	struct drm_gem_object *obj;
>> -	struct dma_fence *fence;
>> -
>> -	if (!state->fb)
>> -		return 0;
>> -
>> -	obj =3D drm_gem_fb_get_obj(state->fb, 0);
>> -	fence =3D dma_resv_get_excl_rcu(obj->resv);
>> -	drm_atomic_set_fence_for_plane(state, fence);
>> -
>> -	return 0;
>> -}
>> -EXPORT_SYMBOL_GPL(drm_gem_fb_prepare_fb);
>> -
>> -/**
>> - * drm_gem_fb_simple_display_pipe_prepare_fb - prepare_fb helper for
>> - *     &drm_simple_display_pipe
>> - * @pipe: Simple display pipe
>> - * @plane_state: Plane state
>> - *
>> - * This function uses drm_gem_fb_prepare_fb() to extract the exclusiv=
e fence
>> - * from &drm_gem_object.resv and attaches it to plane state for the a=
tomic
>> - * helper to wait on. This is necessary to correctly implement implic=
it
>> - * synchronization for any buffers shared as a struct &dma_buf. Drive=
rs can use
>> - * this as their &drm_simple_display_pipe_funcs.prepare_fb callback.
>> - *
>> - * See drm_atomic_set_fence_for_plane() for a discussion of implicit =
and
>> - * explicit fencing in atomic modeset updates.
>> - */
>> -int drm_gem_fb_simple_display_pipe_prepare_fb(struct drm_simple_displ=
ay_pipe *pipe,
>> -					      struct drm_plane_state *plane_state)
>> -{
>> -	return drm_gem_fb_prepare_fb(&pipe->plane, plane_state);
>> -}
>> -EXPORT_SYMBOL(drm_gem_fb_simple_display_pipe_prepare_fb);
>> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/d=
rm_gem_vram_helper.c
>> index 48d4b59d3145..2071ec637df8 100644
>> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
>> @@ -8,7 +8,7 @@
>>   #include <drm/drm_drv.h>
>>   #include <drm/drm_file.h>
>>   #include <drm/drm_framebuffer.h>
>> -#include <drm/drm_gem_framebuffer_helper.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_gem_ttm_helper.h>
>>   #include <drm/drm_gem_vram_helper.h>
>>   #include <drm/drm_managed.h>
>> @@ -720,7 +720,7 @@ drm_gem_vram_plane_helper_prepare_fb(struct drm_pl=
ane *plane,
>>   			goto err_drm_gem_vram_unpin;
>>   	}
>>  =20
>> -	ret =3D drm_gem_fb_prepare_fb(plane, new_state);
>> +	ret =3D drm_gem_prepare_fb(plane, new_state);
>>   	if (ret)
>>   		goto err_drm_gem_vram_unpin;
>>  =20
>> diff --git a/drivers/gpu/drm/imx/dcss/dcss-plane.c b/drivers/gpu/drm/i=
mx/dcss/dcss-plane.c
>> index 03ba88f7f995..092e98fe0cfd 100644
>> --- a/drivers/gpu/drm/imx/dcss/dcss-plane.c
>> +++ b/drivers/gpu/drm/imx/dcss/dcss-plane.c
>> @@ -6,7 +6,7 @@
>>   #include <drm/drm_atomic.h>
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_fb_cma_helper.h>
>> -#include <drm/drm_gem_framebuffer_helper.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_gem_cma_helper.h>
>>  =20
>>   #include "dcss-dev.h"
>> @@ -355,7 +355,7 @@ static void dcss_plane_atomic_disable(struct drm_p=
lane *plane,
>>   }
>>  =20
>>   static const struct drm_plane_helper_funcs dcss_plane_helper_funcs =3D=
 {
>> -	.prepare_fb =3D drm_gem_fb_prepare_fb,
>> +	.prepare_fb =3D drm_gem_prepare_fb,
>>   	.atomic_check =3D dcss_plane_atomic_check,
>>   	.atomic_update =3D dcss_plane_atomic_update,
>>   	.atomic_disable =3D dcss_plane_atomic_disable,
>> diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/i=
puv3-plane.c
>> index 075508051b5f..0b6d81c4fa77 100644
>> --- a/drivers/gpu/drm/imx/ipuv3-plane.c
>> +++ b/drivers/gpu/drm/imx/ipuv3-plane.c
>> @@ -9,8 +9,8 @@
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_fb_cma_helper.h>
>>   #include <drm/drm_fourcc.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_gem_cma_helper.h>
>> -#include <drm/drm_gem_framebuffer_helper.h>
>>   #include <drm/drm_managed.h>
>>   #include <drm/drm_plane_helper.h>
>>  =20
>> @@ -704,7 +704,7 @@ static void ipu_plane_atomic_update(struct drm_pla=
ne *plane,
>>   }
>>  =20
>>   static const struct drm_plane_helper_funcs ipu_plane_helper_funcs =3D=
 {
>> -	.prepare_fb =3D drm_gem_fb_prepare_fb,
>> +	.prepare_fb =3D drm_gem_prepare_fb,
>>   	.atomic_check =3D ipu_plane_atomic_check,
>>   	.atomic_disable =3D ipu_plane_atomic_disable,
>>   	.atomic_update =3D ipu_plane_atomic_update,
>> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/d=
rm/ingenic/ingenic-drm-drv.c
>> index 7bb31fbee29d..1ca02de60895 100644
>> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>> @@ -28,6 +28,7 @@
>>   #include <drm/drm_fb_cma_helper.h>
>>   #include <drm/drm_fb_helper.h>
>>   #include <drm/drm_fourcc.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_gem_framebuffer_helper.h>
>>   #include <drm/drm_irq.h>
>>   #include <drm/drm_managed.h>
>> @@ -780,7 +781,7 @@ static const struct drm_plane_helper_funcs ingenic=
_drm_plane_helper_funcs =3D {
>>   	.atomic_update		=3D ingenic_drm_plane_atomic_update,
>>   	.atomic_check		=3D ingenic_drm_plane_atomic_check,
>>   	.atomic_disable		=3D ingenic_drm_plane_atomic_disable,
>> -	.prepare_fb		=3D drm_gem_fb_prepare_fb,
>> +	.prepare_fb		=3D drm_gem_prepare_fb,
>>   };
>>  =20
>>   static const struct drm_crtc_helper_funcs ingenic_drm_crtc_helper_fu=
ncs =3D {
>> diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/i=
ngenic/ingenic-ipu.c
>> index e52777ef85fd..1b9b5de6b67c 100644
>> --- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
>> +++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
>> @@ -23,7 +23,7 @@
>>   #include <drm/drm_drv.h>
>>   #include <drm/drm_fb_cma_helper.h>
>>   #include <drm/drm_fourcc.h>
>> -#include <drm/drm_gem_framebuffer_helper.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_plane.h>
>>   #include <drm/drm_plane_helper.h>
>>   #include <drm/drm_property.h>
>> @@ -608,7 +608,7 @@ static const struct drm_plane_helper_funcs ingenic=
_ipu_plane_helper_funcs =3D {
>>   	.atomic_update		=3D ingenic_ipu_plane_atomic_update,
>>   	.atomic_check		=3D ingenic_ipu_plane_atomic_check,
>>   	.atomic_disable		=3D ingenic_ipu_plane_atomic_disable,
>> -	.prepare_fb		=3D drm_gem_fb_prepare_fb,
>> +	.prepare_fb		=3D drm_gem_prepare_fb,
>>   };
>>  =20
>>   static int
>> diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcd=
e/mcde_display.c
>> index 7c2e0b865441..dde16ef9650a 100644
>> --- a/drivers/gpu/drm/mcde/mcde_display.c
>> +++ b/drivers/gpu/drm/mcde/mcde_display.c
>> @@ -13,8 +13,8 @@
>>   #include <drm/drm_device.h>
>>   #include <drm/drm_fb_cma_helper.h>
>>   #include <drm/drm_fourcc.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_gem_cma_helper.h>
>> -#include <drm/drm_gem_framebuffer_helper.h>
>>   #include <drm/drm_mipi_dsi.h>
>>   #include <drm/drm_simple_kms_helper.h>
>>   #include <drm/drm_bridge.h>
>> @@ -1481,7 +1481,7 @@ static struct drm_simple_display_pipe_funcs mcde=
_display_funcs =3D {
>>   	.update =3D mcde_display_update,
>>   	.enable_vblank =3D mcde_display_enable_vblank,
>>   	.disable_vblank =3D mcde_display_disable_vblank,
>> -	.prepare_fb =3D drm_gem_fb_simple_display_pipe_prepare_fb,
>> +	.prepare_fb =3D drm_gem_simple_display_pipe_prepare_fb,
>>   };
>>  =20
>>   int mcde_display_init(struct drm_device *drm)
>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/dr=
m/mediatek/mtk_drm_plane.c
>> index 92141a19681b..64f7873e9867 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
>> @@ -6,10 +6,10 @@
>>  =20
>>   #include <drm/drm_atomic.h>
>>   #include <drm/drm_atomic_helper.h>
>> -#include <drm/drm_fourcc.h>
>>   #include <drm/drm_atomic_uapi.h>
>> +#include <drm/drm_fourcc.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_plane_helper.h>
>> -#include <drm/drm_gem_framebuffer_helper.h>
>>  =20
>>   #include "mtk_drm_crtc.h"
>>   #include "mtk_drm_ddp_comp.h"
>> @@ -216,7 +216,7 @@ static void mtk_plane_atomic_update(struct drm_pla=
ne *plane,
>>   }
>>  =20
>>   static const struct drm_plane_helper_funcs mtk_plane_helper_funcs =3D=
 {
>> -	.prepare_fb =3D drm_gem_fb_prepare_fb,
>> +	.prepare_fb =3D drm_gem_prepare_fb,
>>   	.atomic_check =3D mtk_plane_atomic_check,
>>   	.atomic_update =3D mtk_plane_atomic_update,
>>   	.atomic_disable =3D mtk_plane_atomic_disable,
>> diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/m=
eson/meson_overlay.c
>> index 1ffbbecafa22..0ee2132a990f 100644
>> --- a/drivers/gpu/drm/meson/meson_overlay.c
>> +++ b/drivers/gpu/drm/meson/meson_overlay.c
>> @@ -10,11 +10,11 @@
>>   #include <drm/drm_atomic.h>
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_device.h>
>> +#include <drm/drm_fb_cma_helper.h>
>>   #include <drm/drm_fourcc.h>
>> -#include <drm/drm_plane_helper.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_gem_cma_helper.h>
>> -#include <drm/drm_fb_cma_helper.h>
>> -#include <drm/drm_gem_framebuffer_helper.h>
>> +#include <drm/drm_plane_helper.h>
>>  =20
>>   #include "meson_overlay.h"
>>   #include "meson_registers.h"
>> @@ -742,7 +742,7 @@ static const struct drm_plane_helper_funcs meson_o=
verlay_helper_funcs =3D {
>>   	.atomic_check	=3D meson_overlay_atomic_check,
>>   	.atomic_disable	=3D meson_overlay_atomic_disable,
>>   	.atomic_update	=3D meson_overlay_atomic_update,
>> -	.prepare_fb	=3D drm_gem_fb_prepare_fb,
>> +	.prepare_fb	=3D drm_gem_prepare_fb,
>>   };
>>  =20
>>   static bool meson_overlay_format_mod_supported(struct drm_plane *pla=
ne,
>> diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/mes=
on/meson_plane.c
>> index 35338ed18209..24d64c9675ff 100644
>> --- a/drivers/gpu/drm/meson/meson_plane.c
>> +++ b/drivers/gpu/drm/meson/meson_plane.c
>> @@ -16,8 +16,8 @@
>>   #include <drm/drm_device.h>
>>   #include <drm/drm_fb_cma_helper.h>
>>   #include <drm/drm_fourcc.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_gem_cma_helper.h>
>> -#include <drm/drm_gem_framebuffer_helper.h>
>>   #include <drm/drm_plane_helper.h>
>>  =20
>>   #include "meson_plane.h"
>> @@ -417,7 +417,7 @@ static const struct drm_plane_helper_funcs meson_p=
lane_helper_funcs =3D {
>>   	.atomic_check	=3D meson_plane_atomic_check,
>>   	.atomic_disable	=3D meson_plane_atomic_disable,
>>   	.atomic_update	=3D meson_plane_atomic_update,
>> -	.prepare_fb	=3D drm_gem_fb_prepare_fb,
>> +	.prepare_fb	=3D drm_gem_prepare_fb,
>>   };
>>  =20
>>   static bool meson_plane_format_mod_supported(struct drm_plane *plane=
,
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/d=
rm/msm/disp/dpu1/dpu_plane.c
>> index bc0231a50132..3e9f9f3dd679 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> @@ -13,7 +13,7 @@
>>   #include <drm/drm_atomic_uapi.h>
>>   #include <drm/drm_damage_helper.h>
>>   #include <drm/drm_file.h>
>> -#include <drm/drm_gem_framebuffer_helper.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>>  =20
>>   #include "msm_drv.h"
>>   #include "dpu_kms.h"
>> @@ -892,7 +892,7 @@ static int dpu_plane_prepare_fb(struct drm_plane *=
plane,
>>   	 *       we can use msm_atomic_prepare_fb() instead of doing the
>>   	 *       implicit fence and fb prepare by hand here.
>>   	 */
>> -	drm_gem_fb_prepare_fb(plane, new_state);
>> +	drm_gem_prepare_fb(plane, new_state);
>>  =20
>>   	if (pstate->aspace) {
>>   		ret =3D msm_framebuffer_prepare(new_state->fb,
>> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/ms=
m_atomic.c
>> index 6a326761dc4a..03a113eb6571 100644
>> --- a/drivers/gpu/drm/msm/msm_atomic.c
>> +++ b/drivers/gpu/drm/msm/msm_atomic.c
>> @@ -5,7 +5,7 @@
>>    */
>>  =20
>>   #include <drm/drm_atomic_uapi.h>
>> -#include <drm/drm_gem_framebuffer_helper.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_vblank.h>
>>  =20
>>   #include "msm_atomic_trace.h"
>> @@ -22,7 +22,7 @@ int msm_atomic_prepare_fb(struct drm_plane *plane,
>>   	if (!new_state->fb)
>>   		return 0;
>>  =20
>> -	drm_gem_fb_prepare_fb(plane, new_state);
>> +	drm_gem_prepare_fb(plane, new_state);
>>  =20
>>   	return msm_framebuffer_prepare(new_state->fb, kms->aspace);
>>   }
>> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb=
/mxsfb_kms.c
>> index 3e1bb0aefb87..33188dea886d 100644
>> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
>> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
>> @@ -21,8 +21,8 @@
>>   #include <drm/drm_encoder.h>
>>   #include <drm/drm_fb_cma_helper.h>
>>   #include <drm/drm_fourcc.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_gem_cma_helper.h>
>> -#include <drm/drm_gem_framebuffer_helper.h>
>>   #include <drm/drm_plane.h>
>>   #include <drm/drm_plane_helper.h>
>>   #include <drm/drm_vblank.h>
>> @@ -495,13 +495,13 @@ static bool mxsfb_format_mod_supported(struct dr=
m_plane *plane,
>>   }
>>  =20
>>   static const struct drm_plane_helper_funcs mxsfb_plane_primary_helpe=
r_funcs =3D {
>> -	.prepare_fb =3D drm_gem_fb_prepare_fb,
>> +	.prepare_fb =3D drm_gem_prepare_fb,
>>   	.atomic_check =3D mxsfb_plane_atomic_check,
>>   	.atomic_update =3D mxsfb_plane_primary_atomic_update,
>>   };
>>  =20
>>   static const struct drm_plane_helper_funcs mxsfb_plane_overlay_helpe=
r_funcs =3D {
>> -	.prepare_fb =3D drm_gem_fb_prepare_fb,
>> +	.prepare_fb =3D drm_gem_prepare_fb,
>>   	.atomic_check =3D mxsfb_plane_atomic_check,
>>   	.atomic_update =3D mxsfb_plane_overlay_atomic_update,
>>   };
>> diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/p=
l111/pl111_display.c
>> index 69c02e7c82b7..6fd7f13f1aca 100644
>> --- a/drivers/gpu/drm/pl111/pl111_display.c
>> +++ b/drivers/gpu/drm/pl111/pl111_display.c
>> @@ -17,8 +17,8 @@
>>  =20
>>   #include <drm/drm_fb_cma_helper.h>
>>   #include <drm/drm_fourcc.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_gem_cma_helper.h>
>> -#include <drm/drm_gem_framebuffer_helper.h>
>>   #include <drm/drm_vblank.h>
>>  =20
>>   #include "pl111_drm.h"
>> @@ -440,7 +440,7 @@ static struct drm_simple_display_pipe_funcs pl111_=
display_funcs =3D {
>>   	.enable =3D pl111_display_enable,
>>   	.disable =3D pl111_display_disable,
>>   	.update =3D pl111_display_update,
>> -	.prepare_fb =3D drm_gem_fb_simple_display_pipe_prepare_fb,
>> +	.prepare_fb =3D drm_gem_simple_display_pipe_prepare_fb,
>>   };
>>  =20
>>   static int pl111_clk_div_choose_div(struct clk_hw *hw, unsigned long=
 rate,
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/r=
car-du/rcar_du_vsp.c
>> index 53221d8473c1..964fdaee7c7d 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
>> @@ -11,8 +11,8 @@
>>   #include <drm/drm_crtc.h>
>>   #include <drm/drm_fb_cma_helper.h>
>>   #include <drm/drm_fourcc.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_gem_cma_helper.h>
>> -#include <drm/drm_gem_framebuffer_helper.h>
>>   #include <drm/drm_managed.h>
>>   #include <drm/drm_plane_helper.h>
>>   #include <drm/drm_vblank.h>
>> @@ -236,7 +236,7 @@ static int rcar_du_vsp_plane_prepare_fb(struct drm=
_plane *plane,
>>   	if (ret < 0)
>>   		return ret;
>>  =20
>> -	return drm_gem_fb_prepare_fb(plane, state);
>> +	return drm_gem_prepare_fb(plane, state);
>>   }
>>  =20
>>   void rcar_du_vsp_unmap_fb(struct rcar_du_vsp *vsp, struct drm_frameb=
uffer *fb,
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu=
/drm/rockchip/rockchip_drm_vop.c
>> index 8d15cabdcb02..45577de18b49 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
>> @@ -23,6 +23,7 @@
>>   #include <drm/drm_crtc.h>
>>   #include <drm/drm_flip_work.h>
>>   #include <drm/drm_fourcc.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_gem_framebuffer_helper.h>
>>   #include <drm/drm_plane_helper.h>
>>   #include <drm/drm_probe_helper.h>
>> @@ -1096,7 +1097,7 @@ static const struct drm_plane_helper_funcs plane=
_helper_funcs =3D {
>>   	.atomic_disable =3D vop_plane_atomic_disable,
>>   	.atomic_async_check =3D vop_plane_atomic_async_check,
>>   	.atomic_async_update =3D vop_plane_atomic_async_update,
>> -	.prepare_fb =3D drm_gem_fb_prepare_fb,
>> +	.prepare_fb =3D drm_gem_prepare_fb,
>>   };
>>  =20
>>   static const struct drm_plane_funcs vop_plane_funcs =3D {
>> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
>> index 7812094f93d6..73522c6ba3eb 100644
>> --- a/drivers/gpu/drm/stm/ltdc.c
>> +++ b/drivers/gpu/drm/stm/ltdc.c
>> @@ -26,8 +26,8 @@
>>   #include <drm/drm_device.h>
>>   #include <drm/drm_fb_cma_helper.h>
>>   #include <drm/drm_fourcc.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_gem_cma_helper.h>
>> -#include <drm/drm_gem_framebuffer_helper.h>
>>   #include <drm/drm_of.h>
>>   #include <drm/drm_plane_helper.h>
>>   #include <drm/drm_probe_helper.h>
>> @@ -911,7 +911,7 @@ static const struct drm_plane_funcs ltdc_plane_fun=
cs =3D {
>>   };
>>  =20
>>   static const struct drm_plane_helper_funcs ltdc_plane_helper_funcs =3D=
 {
>> -	.prepare_fb =3D drm_gem_fb_prepare_fb,
>> +	.prepare_fb =3D drm_gem_prepare_fb,
>>   	.atomic_check =3D ltdc_plane_atomic_check,
>>   	.atomic_update =3D ltdc_plane_atomic_update,
>>   	.atomic_disable =3D ltdc_plane_atomic_disable,
>> diff --git a/drivers/gpu/drm/sun4i/sun4i_layer.c b/drivers/gpu/drm/sun=
4i/sun4i_layer.c
>> index acfbfd4463a1..68da94b7c35d 100644
>> --- a/drivers/gpu/drm/sun4i/sun4i_layer.c
>> +++ b/drivers/gpu/drm/sun4i/sun4i_layer.c
>> @@ -7,7 +7,7 @@
>>    */
>>  =20
>>   #include <drm/drm_atomic_helper.h>
>> -#include <drm/drm_gem_framebuffer_helper.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_plane_helper.h>
>>  =20
>>   #include "sun4i_backend.h"
>> @@ -122,7 +122,7 @@ static bool sun4i_layer_format_mod_supported(struc=
t drm_plane *plane,
>>   }
>>  =20
>>   static const struct drm_plane_helper_funcs sun4i_backend_layer_helpe=
r_funcs =3D {
>> -	.prepare_fb	=3D drm_gem_fb_prepare_fb,
>> +	.prepare_fb	=3D drm_gem_prepare_fb,
>>   	.atomic_disable	=3D sun4i_backend_layer_atomic_disable,
>>   	.atomic_update	=3D sun4i_backend_layer_atomic_update,
>>   };
>> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/=
sun4i/sun8i_ui_layer.c
>> index 816ad4ce8996..95654c153279 100644
>> --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
>> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
>> @@ -14,8 +14,8 @@
>>   #include <drm/drm_crtc.h>
>>   #include <drm/drm_fb_cma_helper.h>
>>   #include <drm/drm_fourcc.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_gem_cma_helper.h>
>> -#include <drm/drm_gem_framebuffer_helper.h>
>>   #include <drm/drm_plane_helper.h>
>>   #include <drm/drm_probe_helper.h>
>>  =20
>> @@ -299,7 +299,7 @@ static void sun8i_ui_layer_atomic_update(struct dr=
m_plane *plane,
>>   }
>>  =20
>>   static const struct drm_plane_helper_funcs sun8i_ui_layer_helper_fun=
cs =3D {
>> -	.prepare_fb	=3D drm_gem_fb_prepare_fb,
>> +	.prepare_fb	=3D drm_gem_prepare_fb,
>>   	.atomic_check	=3D sun8i_ui_layer_atomic_check,
>>   	.atomic_disable	=3D sun8i_ui_layer_atomic_disable,
>>   	.atomic_update	=3D sun8i_ui_layer_atomic_update,
>> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/=
sun4i/sun8i_vi_layer.c
>> index 8cc294a9969d..4005884dbce4 100644
>> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
>> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
>> @@ -7,8 +7,8 @@
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_crtc.h>
>>   #include <drm/drm_fb_cma_helper.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_gem_cma_helper.h>
>> -#include <drm/drm_gem_framebuffer_helper.h>
>>   #include <drm/drm_plane_helper.h>
>>   #include <drm/drm_probe_helper.h>
>>  =20
>> @@ -402,7 +402,7 @@ static void sun8i_vi_layer_atomic_update(struct dr=
m_plane *plane,
>>   }
>>  =20
>>   static const struct drm_plane_helper_funcs sun8i_vi_layer_helper_fun=
cs =3D {
>> -	.prepare_fb	=3D drm_gem_fb_prepare_fb,
>> +	.prepare_fb	=3D drm_gem_prepare_fb,
>>   	.atomic_check	=3D sun8i_vi_layer_atomic_check,
>>   	.atomic_disable	=3D sun8i_vi_layer_atomic_disable,
>>   	.atomic_update	=3D sun8i_vi_layer_atomic_update,
>> diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/pla=
ne.c
>> index 539d14935728..ec86a8d060aa 100644
>> --- a/drivers/gpu/drm/tegra/plane.c
>> +++ b/drivers/gpu/drm/tegra/plane.c
>> @@ -8,7 +8,7 @@
>>   #include <drm/drm_atomic.h>
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_fourcc.h>
>> -#include <drm/drm_gem_framebuffer_helper.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_plane_helper.h>
>>  =20
>>   #include "dc.h"
>> @@ -198,7 +198,7 @@ int tegra_plane_prepare_fb(struct drm_plane *plane=
,
>>   	if (!state->fb)
>>   		return 0;
>>  =20
>> -	drm_gem_fb_prepare_fb(plane, state);
>> +	drm_gem_prepare_fb(plane, state);
>>  =20
>>   	return tegra_dc_pin(dc, to_tegra_plane_state(state));
>>   }
>> diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tid=
ss/tidss_plane.c
>> index 35067ae674ea..d39baa66e876 100644
>> --- a/drivers/gpu/drm/tidss/tidss_plane.c
>> +++ b/drivers/gpu/drm/tidss/tidss_plane.c
>> @@ -10,7 +10,7 @@
>>   #include <drm/drm_crtc_helper.h>
>>   #include <drm/drm_fourcc.h>
>>   #include <drm/drm_fb_cma_helper.h>
>> -#include <drm/drm_gem_framebuffer_helper.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>>  =20
>>   #include "tidss_crtc.h"
>>   #include "tidss_dispc.h"
>> @@ -151,7 +151,7 @@ static void drm_plane_destroy(struct drm_plane *pl=
ane)
>>   }
>>  =20
>>   static const struct drm_plane_helper_funcs tidss_plane_helper_funcs =
=3D {
>> -	.prepare_fb =3D drm_gem_fb_prepare_fb,
>> +	.prepare_fb =3D drm_gem_prepare_fb,
>>   	.atomic_check =3D tidss_plane_atomic_check,
>>   	.atomic_update =3D tidss_plane_atomic_update,
>>   	.atomic_disable =3D tidss_plane_atomic_disable,
>> diff --git a/drivers/gpu/drm/tiny/hx8357d.c b/drivers/gpu/drm/tiny/hx8=
357d.c
>> index c6525cd02bc2..3e2c2868a363 100644
>> --- a/drivers/gpu/drm/tiny/hx8357d.c
>> +++ b/drivers/gpu/drm/tiny/hx8357d.c
>> @@ -19,8 +19,8 @@
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_drv.h>
>>   #include <drm/drm_fb_helper.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_gem_cma_helper.h>
>> -#include <drm/drm_gem_framebuffer_helper.h>
>>   #include <drm/drm_managed.h>
>>   #include <drm/drm_mipi_dbi.h>
>>   #include <drm/drm_modeset_helper.h>
>> @@ -184,7 +184,7 @@ static const struct drm_simple_display_pipe_funcs =
hx8357d_pipe_funcs =3D {
>>   	.enable =3D yx240qv29_enable,
>>   	.disable =3D mipi_dbi_pipe_disable,
>>   	.update =3D mipi_dbi_pipe_update,
>> -	.prepare_fb =3D drm_gem_fb_simple_display_pipe_prepare_fb,
>> +	.prepare_fb =3D drm_gem_simple_display_pipe_prepare_fb,
>>   };
>>  =20
>>   static const struct drm_display_mode yx350hv15_mode =3D {
>> diff --git a/drivers/gpu/drm/tiny/ili9225.c b/drivers/gpu/drm/tiny/ili=
9225.c
>> index 8e98962db5a2..6b87df19eec1 100644
>> --- a/drivers/gpu/drm/tiny/ili9225.c
>> +++ b/drivers/gpu/drm/tiny/ili9225.c
>> @@ -22,8 +22,8 @@
>>   #include <drm/drm_fb_cma_helper.h>
>>   #include <drm/drm_fb_helper.h>
>>   #include <drm/drm_fourcc.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_gem_cma_helper.h>
>> -#include <drm/drm_gem_framebuffer_helper.h>
>>   #include <drm/drm_managed.h>
>>   #include <drm/drm_mipi_dbi.h>
>>   #include <drm/drm_rect.h>
>> @@ -328,7 +328,7 @@ static const struct drm_simple_display_pipe_funcs =
ili9225_pipe_funcs =3D {
>>   	.enable		=3D ili9225_pipe_enable,
>>   	.disable	=3D ili9225_pipe_disable,
>>   	.update		=3D ili9225_pipe_update,
>> -	.prepare_fb	=3D drm_gem_fb_simple_display_pipe_prepare_fb,
>> +	.prepare_fb	=3D drm_gem_simple_display_pipe_prepare_fb,
>>   };
>>  =20
>>   static const struct drm_display_mode ili9225_mode =3D {
>> diff --git a/drivers/gpu/drm/tiny/ili9341.c b/drivers/gpu/drm/tiny/ili=
9341.c
>> index 6ce97f0698eb..a97f3f70e4a6 100644
>> --- a/drivers/gpu/drm/tiny/ili9341.c
>> +++ b/drivers/gpu/drm/tiny/ili9341.c
>> @@ -18,8 +18,8 @@
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_drv.h>
>>   #include <drm/drm_fb_helper.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_gem_cma_helper.h>
>> -#include <drm/drm_gem_framebuffer_helper.h>
>>   #include <drm/drm_managed.h>
>>   #include <drm/drm_mipi_dbi.h>
>>   #include <drm/drm_modeset_helper.h>
>> @@ -140,7 +140,7 @@ static const struct drm_simple_display_pipe_funcs =
ili9341_pipe_funcs =3D {
>>   	.enable =3D yx240qv29_enable,
>>   	.disable =3D mipi_dbi_pipe_disable,
>>   	.update =3D mipi_dbi_pipe_update,
>> -	.prepare_fb =3D drm_gem_fb_simple_display_pipe_prepare_fb,
>> +	.prepare_fb =3D drm_gem_simple_display_pipe_prepare_fb,
>>   };
>>  =20
>>   static const struct drm_display_mode yx240qv29_mode =3D {
>> diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili=
9486.c
>> index d7ce40eb166a..6422a7f67079 100644
>> --- a/drivers/gpu/drm/tiny/ili9486.c
>> +++ b/drivers/gpu/drm/tiny/ili9486.c
>> @@ -17,8 +17,8 @@
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_drv.h>
>>   #include <drm/drm_fb_helper.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_gem_cma_helper.h>
>> -#include <drm/drm_gem_framebuffer_helper.h>
>>   #include <drm/drm_managed.h>
>>   #include <drm/drm_mipi_dbi.h>
>>   #include <drm/drm_modeset_helper.h>
>> @@ -153,7 +153,7 @@ static const struct drm_simple_display_pipe_funcs =
waveshare_pipe_funcs =3D {
>>   	.enable =3D waveshare_enable,
>>   	.disable =3D mipi_dbi_pipe_disable,
>>   	.update =3D mipi_dbi_pipe_update,
>> -	.prepare_fb =3D drm_gem_fb_simple_display_pipe_prepare_fb,
>> +	.prepare_fb =3D drm_gem_simple_display_pipe_prepare_fb,
>>   };
>>  =20
>>   static const struct drm_display_mode waveshare_mode =3D {
>> diff --git a/drivers/gpu/drm/tiny/mi0283qt.c b/drivers/gpu/drm/tiny/mi=
0283qt.c
>> index ff77f983f803..dc76fe53aa72 100644
>> --- a/drivers/gpu/drm/tiny/mi0283qt.c
>> +++ b/drivers/gpu/drm/tiny/mi0283qt.c
>> @@ -16,8 +16,8 @@
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_drv.h>
>>   #include <drm/drm_fb_helper.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_gem_cma_helper.h>
>> -#include <drm/drm_gem_framebuffer_helper.h>
>>   #include <drm/drm_managed.h>
>>   #include <drm/drm_mipi_dbi.h>
>>   #include <drm/drm_modeset_helper.h>
>> @@ -144,7 +144,7 @@ static const struct drm_simple_display_pipe_funcs =
mi0283qt_pipe_funcs =3D {
>>   	.enable =3D mi0283qt_enable,
>>   	.disable =3D mipi_dbi_pipe_disable,
>>   	.update =3D mipi_dbi_pipe_update,
>> -	.prepare_fb =3D drm_gem_fb_simple_display_pipe_prepare_fb,
>> +	.prepare_fb =3D drm_gem_simple_display_pipe_prepare_fb,
>>   };
>>  =20
>>   static const struct drm_display_mode mi0283qt_mode =3D {
>> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/rep=
aper.c
>> index 11c602fc9897..2cee07a2e00b 100644
>> --- a/drivers/gpu/drm/tiny/repaper.c
>> +++ b/drivers/gpu/drm/tiny/repaper.c
>> @@ -29,6 +29,7 @@
>>   #include <drm/drm_fb_cma_helper.h>
>>   #include <drm/drm_fb_helper.h>
>>   #include <drm/drm_format_helper.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_gem_cma_helper.h>
>>   #include <drm/drm_gem_framebuffer_helper.h>
>>   #include <drm/drm_managed.h>
>> @@ -860,7 +861,7 @@ static const struct drm_simple_display_pipe_funcs =
repaper_pipe_funcs =3D {
>>   	.enable =3D repaper_pipe_enable,
>>   	.disable =3D repaper_pipe_disable,
>>   	.update =3D repaper_pipe_update,
>> -	.prepare_fb =3D drm_gem_fb_simple_display_pipe_prepare_fb,
>> +	.prepare_fb =3D drm_gem_simple_display_pipe_prepare_fb,
>>   };
>>  =20
>>   static int repaper_connector_get_modes(struct drm_connector *connect=
or)
>> diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st75=
86.c
>> index ff5cf60f4bd7..7d216fe9267f 100644
>> --- a/drivers/gpu/drm/tiny/st7586.c
>> +++ b/drivers/gpu/drm/tiny/st7586.c
>> @@ -19,8 +19,8 @@
>>   #include <drm/drm_fb_cma_helper.h>
>>   #include <drm/drm_fb_helper.h>
>>   #include <drm/drm_format_helper.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_gem_cma_helper.h>
>> -#include <drm/drm_gem_framebuffer_helper.h>
>>   #include <drm/drm_managed.h>
>>   #include <drm/drm_mipi_dbi.h>
>>   #include <drm/drm_rect.h>
>> @@ -268,7 +268,7 @@ static const struct drm_simple_display_pipe_funcs =
st7586_pipe_funcs =3D {
>>   	.enable		=3D st7586_pipe_enable,
>>   	.disable	=3D st7586_pipe_disable,
>>   	.update		=3D st7586_pipe_update,
>> -	.prepare_fb	=3D drm_gem_fb_simple_display_pipe_prepare_fb,
>> +	.prepare_fb	=3D drm_gem_simple_display_pipe_prepare_fb,
>>   };
>>  =20
>>   static const struct drm_display_mode st7586_mode =3D {
>> diff --git a/drivers/gpu/drm/tiny/st7735r.c b/drivers/gpu/drm/tiny/st7=
735r.c
>> index faaba0a033ea..df8872d62cdd 100644
>> --- a/drivers/gpu/drm/tiny/st7735r.c
>> +++ b/drivers/gpu/drm/tiny/st7735r.c
>> @@ -19,8 +19,8 @@
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_drv.h>
>>   #include <drm/drm_fb_helper.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_gem_cma_helper.h>
>> -#include <drm/drm_gem_framebuffer_helper.h>
>>   #include <drm/drm_managed.h>
>>   #include <drm/drm_mipi_dbi.h>
>>  =20
>> @@ -136,7 +136,7 @@ static const struct drm_simple_display_pipe_funcs =
st7735r_pipe_funcs =3D {
>>   	.enable		=3D st7735r_pipe_enable,
>>   	.disable	=3D mipi_dbi_pipe_disable,
>>   	.update		=3D mipi_dbi_pipe_update,
>> -	.prepare_fb	=3D drm_gem_fb_simple_display_pipe_prepare_fb,
>> +	.prepare_fb	=3D drm_gem_simple_display_pipe_prepare_fb,
>>   };
>>  =20
>>   static const struct st7735r_cfg jd_t18003_t01_cfg =3D {
>> diff --git a/drivers/gpu/drm/tve200/tve200_display.c b/drivers/gpu/drm=
/tve200/tve200_display.c
>> index cb0e837d3dba..50e1fb71869f 100644
>> --- a/drivers/gpu/drm/tve200/tve200_display.c
>> +++ b/drivers/gpu/drm/tve200/tve200_display.c
>> @@ -17,8 +17,8 @@
>>  =20
>>   #include <drm/drm_fb_cma_helper.h>
>>   #include <drm/drm_fourcc.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_gem_cma_helper.h>
>> -#include <drm/drm_gem_framebuffer_helper.h>
>>   #include <drm/drm_panel.h>
>>   #include <drm/drm_vblank.h>
>>  =20
>> @@ -316,7 +316,7 @@ static const struct drm_simple_display_pipe_funcs =
tve200_display_funcs =3D {
>>   	.enable =3D tve200_display_enable,
>>   	.disable =3D tve200_display_disable,
>>   	.update =3D tve200_display_update,
>> -	.prepare_fb =3D drm_gem_fb_simple_display_pipe_prepare_fb,
>> +	.prepare_fb =3D drm_gem_simple_display_pipe_prepare_fb,
>>   	.enable_vblank =3D tve200_display_enable_vblank,
>>   	.disable_vblank =3D tve200_display_disable_vblank,
>>   };
>> diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4=
_plane.c
>> index 7322169c0682..a65e980078f3 100644
>> --- a/drivers/gpu/drm/vc4/vc4_plane.c
>> +++ b/drivers/gpu/drm/vc4/vc4_plane.c
>> @@ -20,7 +20,7 @@
>>   #include <drm/drm_atomic_uapi.h>
>>   #include <drm/drm_fb_cma_helper.h>
>>   #include <drm/drm_fourcc.h>
>> -#include <drm/drm_gem_framebuffer_helper.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_plane_helper.h>
>>  =20
>>   #include "uapi/drm/vc4_drm.h"
>> @@ -1250,7 +1250,7 @@ static int vc4_prepare_fb(struct drm_plane *plan=
e,
>>  =20
>>   	bo =3D to_vc4_bo(&drm_fb_cma_get_gem_obj(state->fb, 0)->base);
>>  =20
>> -	drm_gem_fb_prepare_fb(plane, state);
>> +	drm_gem_prepare_fb(plane, state);
>>  =20
>>   	if (plane->state->fb =3D=3D state->fb)
>>   		return 0;
>> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/=
vkms_plane.c
>> index 0824327cc860..e3fd8cd1f3f1 100644
>> --- a/drivers/gpu/drm/vkms/vkms_plane.c
>> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
>> @@ -5,6 +5,7 @@
>>   #include <drm/drm_atomic.h>
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_fourcc.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_gem_framebuffer_helper.h>
>>   #include <drm/drm_plane_helper.h>
>>   #include <drm/drm_gem_shmem_helper.h>
>> @@ -159,7 +160,7 @@ static int vkms_prepare_fb(struct drm_plane *plane=
,
>>   	if (ret)
>>   		DRM_ERROR("vmap failed: %d\n", ret);
>>  =20
>> -	return drm_gem_fb_prepare_fb(plane, state);
>> +	return drm_gem_prepare_fb(plane, state);
>>   }
>>  =20
>>   static void vkms_cleanup_fb(struct drm_plane *plane,
>> diff --git a/drivers/gpu/drm/xen/xen_drm_front_kms.c b/drivers/gpu/drm=
/xen/xen_drm_front_kms.c
>> index ef11b1e4de39..371202ebe900 100644
>> --- a/drivers/gpu/drm/xen/xen_drm_front_kms.c
>> +++ b/drivers/gpu/drm/xen/xen_drm_front_kms.c
>> @@ -13,6 +13,7 @@
>>   #include <drm/drm_drv.h>
>>   #include <drm/drm_fourcc.h>
>>   #include <drm/drm_gem.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_gem_framebuffer_helper.h>
>>   #include <drm/drm_probe_helper.h>
>>   #include <drm/drm_vblank.h>
>> @@ -301,7 +302,7 @@ static const struct drm_simple_display_pipe_funcs =
display_funcs =3D {
>>   	.mode_valid =3D display_mode_valid,
>>   	.enable =3D display_enable,
>>   	.disable =3D display_disable,
>> -	.prepare_fb =3D drm_gem_fb_simple_display_pipe_prepare_fb,
>> +	.prepare_fb =3D drm_gem_simple_display_pipe_prepare_fb,
>>   	.check =3D display_check,
>>   	.update =3D display_update,
>>   };
>> diff --git a/include/drm/drm_gem_atomic_helper.h b/include/drm/drm_gem=
_atomic_helper.h
>> index 08b96ccea325..91e73d23fea8 100644
>> --- a/include/drm/drm_gem_atomic_helper.h
>> +++ b/include/drm/drm_gem_atomic_helper.h
>> @@ -9,6 +9,14 @@
>>  =20
>>   struct drm_simple_display_pipe;
>>  =20
>> +/*
>> + * Plane Helpers
>> + */
>> +
>> +int drm_gem_prepare_fb(struct drm_plane *plane, struct drm_plane_stat=
e *state);
>> +int drm_gem_simple_display_pipe_prepare_fb(struct drm_simple_display_=
pipe *pipe,
>> +					   struct drm_plane_state *plane_state);
>> +
>>   /*
>>    * Helpers for planes with shadow buffers
>>    */
>> diff --git a/include/drm/drm_gem_framebuffer_helper.h b/include/drm/dr=
m_gem_framebuffer_helper.h
>> index 6b013154911d..495d174d9989 100644
>> --- a/include/drm/drm_gem_framebuffer_helper.h
>> +++ b/include/drm/drm_gem_framebuffer_helper.h
>> @@ -9,9 +9,11 @@ struct drm_framebuffer;
>>   struct drm_framebuffer_funcs;
>>   struct drm_gem_object;
>>   struct drm_mode_fb_cmd2;
>> +#if 0
>>   struct drm_plane;
>>   struct drm_plane_state;
>>   struct drm_simple_display_pipe;
>> +#endif
>>  =20
>>   #define AFBC_VENDOR_AND_TYPE_MASK	GENMASK_ULL(63, 52)
>>  =20
>> @@ -44,8 +46,4 @@ int drm_gem_fb_afbc_init(struct drm_device *dev,
>>   			 const struct drm_mode_fb_cmd2 *mode_cmd,
>>   			 struct drm_afbc_framebuffer *afbc_fb);
>>  =20
>> -int drm_gem_fb_prepare_fb(struct drm_plane *plane,
>> -			  struct drm_plane_state *state);
>> -int drm_gem_fb_simple_display_pipe_prepare_fb(struct drm_simple_displ=
ay_pipe *pipe,
>> -					      struct drm_plane_state *plane_state);
>>   #endif
>> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/dr=
m_modeset_helper_vtables.h
>> index eb706342861d..8d41d3734153 100644
>> --- a/include/drm/drm_modeset_helper_vtables.h
>> +++ b/include/drm/drm_modeset_helper_vtables.h
>> @@ -1179,7 +1179,7 @@ struct drm_plane_helper_funcs {
>>   	 * members in the plane structure.
>>   	 *
>>   	 * Drivers which always have their buffers pinned should use
>> -	 * drm_gem_fb_prepare_fb() for this hook.
>> +	 * drm_gem_prepare_fb() for this hook.
>>   	 *
>>   	 * The helpers will call @cleanup_fb with matching arguments for ev=
ery
>>   	 * successful call to this hook.
>> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
>> index 95ab14a4336a..be08b6b1fde0 100644
>> --- a/include/drm/drm_plane.h
>> +++ b/include/drm/drm_plane.h
>> @@ -79,8 +79,8 @@ struct drm_plane_state {
>>   	 * preserved.
>>   	 *
>>   	 * Drivers should store any implicit fence in this from their
>> -	 * &drm_plane_helper_funcs.prepare_fb callback. See drm_gem_fb_prepa=
re_fb()
>> -	 * and drm_gem_fb_simple_display_pipe_prepare_fb() for suitable help=
ers.
>> +	 * &drm_plane_helper_funcs.prepare_fb callback. See drm_gem_prepare_=
fb()
>> +	 * and drm_gem_simple_display_pipe_prepare_fb() for suitable helpers=
=2E
>>   	 */
>>   	struct dma_fence *fence;
>>  =20
>> diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_sim=
ple_kms_helper.h
>> index 40b34573249f..ef9944e9c5fc 100644
>> --- a/include/drm/drm_simple_kms_helper.h
>> +++ b/include/drm/drm_simple_kms_helper.h
>> @@ -117,7 +117,7 @@ struct drm_simple_display_pipe_funcs {
>>   	 * more details.
>>   	 *
>>   	 * Drivers which always have their buffers pinned should use
>> -	 * drm_gem_fb_simple_display_pipe_prepare_fb() for this hook.
>> +	 * drm_gem_simple_display_pipe_prepare_fb() for this hook.
>>   	 */
>>   	int (*prepare_fb)(struct drm_simple_display_pipe *pipe,
>>   			  struct drm_plane_state *plane_state);
>> --=20
>> 2.30.0
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--zVTdTEY2ybqGG3p4xWPzRkxAvxOUdDuVf--

--brhUVpTaaIsU1Pu416E7yYfIywuZWVv5l
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAj6cgFAwAAAAAACgkQlh/E3EQov+Bo
ZBAAyxGybXYI19sqRKFpQ7oPChLVFBKhCpKnAK3vxfT0bUuuDGT3Z3C0Ee0sVqzWJDJAAbS0y7FH
9HcwlXfK3G13p97yUSThF+xFKMjP1/+hnGsLUnslprtyCNPka7UIti203Xd2ex5gU1ULuO69PTPI
ehh4obz3Z2TOxJmy1+YAInYfvX4Km8B7oRQ2LmneiTKMop/roJ1BvxpnzdUVMqaCyHggcxPFSldt
mhc35poOYCMAX9IXDF0O2jTqT7g7tdDL068HXs5DZKnGmS0/sYmctzb6WmsY0nfhKxRODyJnZy+Y
CNPvMRNsGqBYFiLPmiJN2WLBhroS7RqfOj/NtY3SkSaGXD3gv7eAKWD2xXXitMyJ6TGvW5pkbNwC
r1yWJ3gkGzaPVZvSzDdE3KOYySUQ1+F5EsCamo7kheaBWqnRBDVhRB2QdX1+WDNTojhK+U7EI1Y6
RxFaRruD3NvywHV8P42pufkRCGl42KM1aaoXlwFt+M8izDWCeh3nTwrQwEAn4Kuzlk3xMhPLArbK
RddShuWHCZSpzP3B2XsR7QWGHivSTN87q4k07UymyRWMkMfcV1+l8xAf7ze1IjFdlk4lzvzDlx0a
DzUjsd+Grykob03z/vXn6PRJBdx/u2sjWJmzsLjVZQ2FEq9eN7nvZoJsq3dbv+O6XuwpnnFV4d5B
a9g=
=I7xx
-----END PGP SIGNATURE-----

--brhUVpTaaIsU1Pu416E7yYfIywuZWVv5l--

--===============0150066336==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0150066336==--
