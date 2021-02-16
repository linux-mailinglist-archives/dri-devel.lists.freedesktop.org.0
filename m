Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 117C331C767
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 09:37:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3AC89DA6;
	Tue, 16 Feb 2021 08:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EDD089DA6
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 08:37:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8F503ACBF;
 Tue, 16 Feb 2021 08:37:47 +0000 (UTC)
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-kernel@vger.kernel.org
References: <20210215114030.11862-1-sakari.ailus@linux.intel.com>
 <20210215114030.11862-4-sakari.ailus@linux.intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v7 3/3] drm: Switch to %p4cc format modifier
Message-ID: <54e8c1d5-bb28-eddd-41ad-a89323650be0@suse.de>
Date: Tue, 16 Feb 2021 09:37:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210215114030.11862-4-sakari.ailus@linux.intel.com>
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
Cc: Petr Mladek <pmladek@suse.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hverkuil@xs4all.nl,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, Joe Perches <joe@perches.com>,
 mchehab@kernel.org, laurent.pinchart@ideasonboard.com
Content-Type: multipart/mixed; boundary="===============0458590812=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0458590812==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="lfSescth8qvt1H8cGx5WDxp89URU1groe"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lfSescth8qvt1H8cGx5WDxp89URU1groe
Content-Type: multipart/mixed; boundary="BR4xHTTe9BQ3OWCu73R3j5EIQT3WZaL6E";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-kernel@vger.kernel.org
Cc: Petr Mladek <pmladek@suse.com>, mchehab@kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel@lists.freedesktop.org, hverkuil@xs4all.nl,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, laurent.pinchart@ideasonboard.com,
 Joe Perches <joe@perches.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-media@vger.kernel.org
Message-ID: <54e8c1d5-bb28-eddd-41ad-a89323650be0@suse.de>
Subject: Re: [PATCH v7 3/3] drm: Switch to %p4cc format modifier
References: <20210215114030.11862-1-sakari.ailus@linux.intel.com>
 <20210215114030.11862-4-sakari.ailus@linux.intel.com>
In-Reply-To: <20210215114030.11862-4-sakari.ailus@linux.intel.com>

--BR4xHTTe9BQ3OWCu73R3j5EIQT3WZaL6E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 15.02.21 um 12:40 schrieb Sakari Ailus:
> Switch DRM drivers from drm_get_format_name() to %p4cc. This gets rid o=
f a
> large number of temporary variables at the same time.
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  5 ++--
>   drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |  5 ++--
>   drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  5 ++--
>   drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  5 ++--
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  5 ++--
>   .../arm/display/komeda/komeda_format_caps.h   | 11 --------
>   .../arm/display/komeda/komeda_framebuffer.c   |  4 +--
>   .../gpu/drm/arm/display/komeda/komeda_plane.c |  6 ++---
>   drivers/gpu/drm/arm/malidp_mw.c               |  7 ++----
>   drivers/gpu/drm/drm_atomic.c                  |  8 ++----
>   drivers/gpu/drm/drm_crtc.c                    |  7 ++----
>   drivers/gpu/drm/drm_fourcc.c                  | 25 ------------------=
-
>   drivers/gpu/drm/drm_framebuffer.c             | 11 +++-----
>   drivers/gpu/drm/drm_mipi_dbi.c                |  5 ++--
>   drivers/gpu/drm/drm_plane.c                   |  8 ++----
>   .../gpu/drm/hisilicon/kirin/kirin_drm_ade.c   |  5 ++--
>   drivers/gpu/drm/i915/display/intel_display.c  | 14 +++--------
>   .../drm/i915/display/intel_display_debugfs.c  | 19 ++++++--------
>   drivers/gpu/drm/i915/display/intel_sprite.c   |  6 ++---
>   drivers/gpu/drm/mcde/mcde_display.c           |  6 ++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  6 ++---
>   drivers/gpu/drm/nouveau/nouveau_display.c     |  9 +++----
>   drivers/gpu/drm/radeon/atombios_crtc.c        | 10 +++-----
>   drivers/gpu/drm/sun4i/sun4i_backend.c         |  6 ++---
>   drivers/gpu/drm/vkms/vkms_writeback.c         |  7 ++----
>   drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           | 15 +++++------
>   include/drm/drm_fourcc.h                      |  1 -
>   27 files changed, 64 insertions(+), 157 deletions(-)

This is a nice patchset. For the driver-related changes:

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

But landing this patch will certainly give us build errors. There are at =

least 3 git trees involved: drm-misc-next, amd and i915. I'd expect at=20
least one of them to have additional changes that still require=20
drm_get_format_name().

IMHO we should remove drm_get_format_name() in a later patch. Please=20
remove the changes in drm_fourcc.{c,h} from this patch and maybe add a=20
TODO comment to the declaration that the function is supposed to be remov=
ed.

I would merge the patchset through drm-misc-next. And the final removal=20
patch during the next cycle. Ok?

Best regard
Thomas

>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/a=
md/amdgpu/dce_v10_0.c
> index 7944781e1086..ea825b4f8ee8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> @@ -1862,7 +1862,6 @@ static int dce_v10_0_crtc_do_set_base(struct drm_=
crtc *crtc,
>   	u32 tmp, viewport_w, viewport_h;
>   	int r;
>   	bool bypass_lut =3D false;
> -	struct drm_format_name_buf format_name;
>  =20
>   	/* no fb bound */
>   	if (!atomic && !crtc->primary->fb) {
> @@ -1981,8 +1980,8 @@ static int dce_v10_0_crtc_do_set_base(struct drm_=
crtc *crtc,
>   #endif
>   		break;
>   	default:
> -		DRM_ERROR("Unsupported screen format %s\n",
> -		          drm_get_format_name(target_fb->format->format, &format_nam=
e));
> +		DRM_ERROR("Unsupported screen format %p4cc\n",
> +			  &target_fb->format->format);
>   		return -EINVAL;
>   	}
>  =20
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/a=
md/amdgpu/dce_v11_0.c
> index 1b6ff0470011..a360a6dec198 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> @@ -1904,7 +1904,6 @@ static int dce_v11_0_crtc_do_set_base(struct drm_=
crtc *crtc,
>   	u32 tmp, viewport_w, viewport_h;
>   	int r;
>   	bool bypass_lut =3D false;
> -	struct drm_format_name_buf format_name;
>  =20
>   	/* no fb bound */
>   	if (!atomic && !crtc->primary->fb) {
> @@ -2023,8 +2022,8 @@ static int dce_v11_0_crtc_do_set_base(struct drm_=
crtc *crtc,
>   #endif
>   		break;
>   	default:
> -		DRM_ERROR("Unsupported screen format %s\n",
> -		          drm_get_format_name(target_fb->format->format, &format_nam=
e));
> +		DRM_ERROR("Unsupported screen format %p4cc\n",
> +			  &target_fb->format->format);
>   		return -EINVAL;
>   	}
>  =20
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/am=
d/amdgpu/dce_v6_0.c
> index 83a88385b762..ef124ac853b6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> @@ -1820,7 +1820,6 @@ static int dce_v6_0_crtc_do_set_base(struct drm_c=
rtc *crtc,
>   	u32 viewport_w, viewport_h;
>   	int r;
>   	bool bypass_lut =3D false;
> -	struct drm_format_name_buf format_name;
>  =20
>   	/* no fb bound */
>   	if (!atomic && !crtc->primary->fb) {
> @@ -1929,8 +1928,8 @@ static int dce_v6_0_crtc_do_set_base(struct drm_c=
rtc *crtc,
>   #endif
>   		break;
>   	default:
> -		DRM_ERROR("Unsupported screen format %s\n",
> -		          drm_get_format_name(target_fb->format->format, &format_nam=
e));
> +		DRM_ERROR("Unsupported screen format %p4cc\n",
> +			  &target_fb->format->format);
>   		return -EINVAL;
>   	}
>  =20
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/am=
d/amdgpu/dce_v8_0.c
> index 224b30214427..c98650183828 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> @@ -1791,7 +1791,6 @@ static int dce_v8_0_crtc_do_set_base(struct drm_c=
rtc *crtc,
>   	u32 viewport_w, viewport_h;
>   	int r;
>   	bool bypass_lut =3D false;
> -	struct drm_format_name_buf format_name;
>  =20
>   	/* no fb bound */
>   	if (!atomic && !crtc->primary->fb) {
> @@ -1902,8 +1901,8 @@ static int dce_v8_0_crtc_do_set_base(struct drm_c=
rtc *crtc,
>   #endif
>   		break;
>   	default:
> -		DRM_ERROR("Unsupported screen format %s\n",
> -		          drm_get_format_name(target_fb->format->format, &format_nam=
e));
> +		DRM_ERROR("Unsupported screen format %p4cc\n",
> +			  &target_fb->format->format);
>   		return -EINVAL;
>   	}
>  =20
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/driver=
s/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index c6da89df055d..fcef3bf14952 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -4465,7 +4465,6 @@ fill_dc_plane_info_and_addr(struct amdgpu_device =
*adev,
>   	const struct drm_framebuffer *fb =3D plane_state->fb;
>   	const struct amdgpu_framebuffer *afb =3D
>   		to_amdgpu_framebuffer(plane_state->fb);
> -	struct drm_format_name_buf format_name;
>   	int ret;
>  =20
>   	memset(plane_info, 0, sizeof(*plane_info));
> @@ -4513,8 +4512,8 @@ fill_dc_plane_info_and_addr(struct amdgpu_device =
*adev,
>   		break;
>   	default:
>   		DRM_ERROR(
> -			"Unsupported screen format %s\n",
> -			drm_get_format_name(fb->format->format, &format_name));
> +			"Unsupported screen format %p4cc\n",
> +			&fb->format->format);
>   		return -EINVAL;
>   	}
>  =20
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_format_caps.h b/=
drivers/gpu/drm/arm/display/komeda/komeda_format_caps.h
> index 32273cf18f7c..cf7a183f773d 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_format_caps.h
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_format_caps.h
> @@ -82,17 +82,6 @@ struct komeda_format_caps_table {
>  =20
>   extern u64 komeda_supported_modifiers[];
>  =20
> -static inline const char *komeda_get_format_name(u32 fourcc, u64 modif=
ier)
> -{
> -	struct drm_format_name_buf buf;
> -	static char name[64];
> -
> -	snprintf(name, sizeof(name), "%s with modifier: 0x%llx.",
> -		 drm_get_format_name(fourcc, &buf), modifier);
> -
> -	return name;
> -}
> -
>   const struct komeda_format_caps *
>   komeda_get_format_caps(struct komeda_format_caps_table *table,
>   		       u32 fourcc, u64 modifier);
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c b/=
drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
> index 170f9dc8ec19..3c372d2deb0a 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
> @@ -276,8 +276,8 @@ bool komeda_fb_is_layer_supported(struct komeda_fb =
*kfb, u32 layer_type,
>   	supported =3D komeda_format_mod_supported(&mdev->fmt_tbl, layer_type=
,
>   						fourcc, modifier, rot);
>   	if (!supported)
> -		DRM_DEBUG_ATOMIC("Layer TYPE: %d doesn't support fb FMT: %s.\n",
> -			layer_type, komeda_get_format_name(fourcc, modifier));
> +		DRM_DEBUG_ATOMIC("Layer TYPE: %d doesn't support fb FMT: %p4cc with =
modifier: 0x%llx.\n",
> +				 layer_type, &fourcc, modifier);
>  =20
>   	return supported;
>   }
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c b/driver=
s/gpu/drm/arm/display/komeda/komeda_plane.c
> index 98e915e325dd..2d5066ea270c 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
> @@ -49,10 +49,8 @@ komeda_plane_init_data_flow(struct drm_plane_state *=
st,
>  =20
>   	dflow->rot =3D drm_rotation_simplify(st->rotation, caps->supported_r=
ots);
>   	if (!has_bits(dflow->rot, caps->supported_rots)) {
> -		DRM_DEBUG_ATOMIC("rotation(0x%x) isn't supported by %s.\n",
> -				 dflow->rot,
> -				 komeda_get_format_name(caps->fourcc,
> -							fb->modifier));
> +		DRM_DEBUG_ATOMIC("rotation(0x%x) isn't supported by %p4cc with modif=
ier: 0x%llx.\n",
> +				 dflow->rot, &caps->fourcc, fb->modifier);
>   		return -EINVAL;
>   	}
>  =20
> diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/mali=
dp_mw.c
> index 7d0e7b031e44..f5847a79dd7e 100644
> --- a/drivers/gpu/drm/arm/malidp_mw.c
> +++ b/drivers/gpu/drm/arm/malidp_mw.c
> @@ -151,11 +151,8 @@ malidp_mw_encoder_atomic_check(struct drm_encoder =
*encoder,
>   		malidp_hw_get_format_id(&malidp->dev->hw->map, SE_MEMWRITE,
>   					fb->format->format, !!fb->modifier);
>   	if (mw_state->format =3D=3D MALIDP_INVALID_FORMAT_ID) {
> -		struct drm_format_name_buf format_name;
> -
> -		DRM_DEBUG_KMS("Invalid pixel format %s\n",
> -			      drm_get_format_name(fb->format->format,
> -						  &format_name));
> +		DRM_DEBUG_KMS("Invalid pixel format %p4cc\n",
> +			      &fb->format->format);
>   		return -EINVAL;
>   	}
>  =20
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.=
c
> index dda60051854b..ce2ee6b8bf34 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -578,13 +578,9 @@ static int drm_atomic_plane_check(const struct drm=
_plane_state *old_plane_state,
>   	ret =3D drm_plane_check_pixel_format(plane, fb->format->format,
>   					   fb->modifier);
>   	if (ret) {
> -		struct drm_format_name_buf format_name;
> -
> -		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] invalid pixel format %s, modifier 0x=
%llx\n",
> +		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] invalid pixel format %p4cc, modifier=
 0x%llx\n",
>   				 plane->base.id, plane->name,
> -				 drm_get_format_name(fb->format->format,
> -						     &format_name),
> -				 fb->modifier);
> +				 &fb->format->format, fb->modifier);
>   		return ret;
>   	}
>  =20
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index 74090fc3aa55..9ba2d3640b47 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -663,11 +663,8 @@ int drm_mode_setcrtc(struct drm_device *dev, void =
*data,
>   							   fb->format->format,
>   							   fb->modifier);
>   			if (ret) {
> -				struct drm_format_name_buf format_name;
> -
> -				DRM_DEBUG_KMS("Invalid pixel format %s, modifier 0x%llx\n",
> -					      drm_get_format_name(fb->format->format,
> -								  &format_name),
> +				DRM_DEBUG_KMS("Invalid pixel format %p4cc, modifier 0x%llx\n",
> +					      &fb->format->format,
>   					      fb->modifier);
>   				goto out;
>   			}
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.=
c
> index 03262472059c..5cf45aa6eedc 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -30,11 +30,6 @@
>   #include <drm/drm_device.h>
>   #include <drm/drm_fourcc.h>
>  =20
> -static char printable_char(int c)
> -{
> -	return isascii(c) && isprint(c) ? c : '?';
> -}
> -
>   /**
>    * drm_mode_legacy_fb_format - compute drm fourcc code from legacy de=
scription
>    * @bpp: bits per pixels
> @@ -130,26 +125,6 @@ uint32_t drm_driver_legacy_fb_format(struct drm_de=
vice *dev,
>   }
>   EXPORT_SYMBOL(drm_driver_legacy_fb_format);
>  =20
> -/**
> - * drm_get_format_name - fill a string with a drm fourcc format's name=

> - * @format: format to compute name of
> - * @buf: caller-supplied buffer
> - */
> -const char *drm_get_format_name(uint32_t format, struct drm_format_nam=
e_buf *buf)
> -{
> -	snprintf(buf->str, sizeof(buf->str),
> -		 "%c%c%c%c %s-endian (0x%08x)",
> -		 printable_char(format & 0xff),
> -		 printable_char((format >> 8) & 0xff),
> -		 printable_char((format >> 16) & 0xff),
> -		 printable_char((format >> 24) & 0x7f),
> -		 format & DRM_FORMAT_BIG_ENDIAN ? "big" : "little",
> -		 format);
> -
> -	return buf->str;
> -}
> -EXPORT_SYMBOL(drm_get_format_name);
> -
>   /*
>    * Internal function to query information for a given format. See
>    * drm_format_info() for the public API.
> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_fr=
amebuffer.c
> index aca62ed51e82..4d01464b6f95 100644
> --- a/drivers/gpu/drm/drm_framebuffer.c
> +++ b/drivers/gpu/drm/drm_framebuffer.c
> @@ -177,11 +177,8 @@ static int framebuffer_check(struct drm_device *de=
v,
>  =20
>   	/* check if the format is supported at all */
>   	if (!__drm_format_info(r->pixel_format)) {
> -		struct drm_format_name_buf format_name;
> -
> -		DRM_DEBUG_KMS("bad framebuffer format %s\n",
> -			      drm_get_format_name(r->pixel_format,
> -						  &format_name));
> +		DRM_DEBUG_KMS("bad framebuffer format %p4cc\n",
> +			      &r->pixel_format);
>   		return -EINVAL;
>   	}
>  =20
> @@ -1160,14 +1157,12 @@ EXPORT_SYMBOL(drm_framebuffer_plane_height);
>   void drm_framebuffer_print_info(struct drm_printer *p, unsigned int i=
ndent,
>   				const struct drm_framebuffer *fb)
>   {
> -	struct drm_format_name_buf format_name;
>   	unsigned int i;
>  =20
>   	drm_printf_indent(p, indent, "allocated by =3D %s\n", fb->comm);
>   	drm_printf_indent(p, indent, "refcount=3D%u\n",
>   			  drm_framebuffer_read_refcount(fb));
> -	drm_printf_indent(p, indent, "format=3D%s\n",
> -			  drm_get_format_name(fb->format->format, &format_name));
> +	drm_printf_indent(p, indent, "format=3D%p4cc\n", &fb->format->format)=
;
>   	drm_printf_indent(p, indent, "modifier=3D0x%llx\n", fb->modifier);
>   	drm_printf_indent(p, indent, "size=3D%ux%u\n", fb->width, fb->height=
);
>   	drm_printf_indent(p, indent, "layers:\n");
> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_=
dbi.c
> index 230c4fd7131c..43a9b739bba7 100644
> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> @@ -203,7 +203,6 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebu=
ffer *fb,
>   	struct drm_gem_object *gem =3D drm_gem_fb_get_obj(fb, 0);
>   	struct drm_gem_cma_object *cma_obj =3D to_drm_gem_cma_obj(gem);
>   	struct dma_buf_attachment *import_attach =3D gem->import_attach;
> -	struct drm_format_name_buf format_name;
>   	void *src =3D cma_obj->vaddr;
>   	int ret =3D 0;
>  =20
> @@ -225,8 +224,8 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebu=
ffer *fb,
>   		drm_fb_xrgb8888_to_rgb565(dst, src, fb, clip, swap);
>   		break;
>   	default:
> -		drm_err_once(fb->dev, "Format is not supported: %s\n",
> -			     drm_get_format_name(fb->format->format, &format_name));
> +		drm_err_once(fb->dev, "Format is not supported: %p4cc\n",
> +			     &fb->format->format);
>   		return -EINVAL;
>   	}
>  =20
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index a0cb746bcb0a..4d8429917d7d 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -623,12 +623,8 @@ static int __setplane_check(struct drm_plane *plan=
e,
>   	ret =3D drm_plane_check_pixel_format(plane, fb->format->format,
>   					   fb->modifier);
>   	if (ret) {
> -		struct drm_format_name_buf format_name;
> -
> -		DRM_DEBUG_KMS("Invalid pixel format %s, modifier 0x%llx\n",
> -			      drm_get_format_name(fb->format->format,
> -						  &format_name),
> -			      fb->modifier);
> +		DRM_DEBUG_KMS("Invalid pixel format %p4cc, modifier 0x%llx\n",
> +			      &fb->format->format, fb->modifier);
>   		return ret;
>   	}
>  =20
> diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/=
gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> index aa6c53f88f7c..70aa6c8844c0 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> +++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> @@ -549,16 +549,15 @@ static void ade_rdma_set(void __iomem *base, stru=
ct drm_framebuffer *fb,
>   			 u32 ch, u32 y, u32 in_h, u32 fmt)
>   {
>   	struct drm_gem_cma_object *obj =3D drm_fb_cma_get_gem_obj(fb, 0);
> -	struct drm_format_name_buf format_name;
>   	u32 reg_ctrl, reg_addr, reg_size, reg_stride, reg_space, reg_en;
>   	u32 stride =3D fb->pitches[0];
>   	u32 addr =3D (u32)obj->paddr + y * stride;
>  =20
>   	DRM_DEBUG_DRIVER("rdma%d: (y=3D%d, height=3D%d), stride=3D%d, paddr=3D=
0x%x\n",
>   			 ch + 1, y, in_h, stride, (u32)obj->paddr);
> -	DRM_DEBUG_DRIVER("addr=3D0x%x, fb:%dx%d, pixel_format=3D%d(%s)\n",
> +	DRM_DEBUG_DRIVER("addr=3D0x%x, fb:%dx%d, pixel_format=3D%d(%p4cc)\n",=

>   			 addr, fb->width, fb->height, fmt,
> -			 drm_get_format_name(fb->format->format, &format_name));
> +			 &fb->format->format);
>  =20
>   	/* get reg offset */
>   	reg_ctrl =3D RD_CH_CTRL(ch);
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu=
/drm/i915/display/intel_display.c
> index 53a00cf3fa32..7981627390a0 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -13319,7 +13319,6 @@ static void intel_dump_plane_state(const struct=
 intel_plane_state *plane_state)
>   	struct intel_plane *plane =3D to_intel_plane(plane_state->uapi.plane=
);
>   	struct drm_i915_private *i915 =3D to_i915(plane->base.dev);
>   	const struct drm_framebuffer *fb =3D plane_state->hw.fb;
> -	struct drm_format_name_buf format_name;
>  =20
>   	if (!fb) {
>   		drm_dbg_kms(&i915->drm,
> @@ -13330,10 +13329,9 @@ static void intel_dump_plane_state(const struc=
t intel_plane_state *plane_state)
>   	}
>  =20
>   	drm_dbg_kms(&i915->drm,
> -		    "[PLANE:%d:%s] fb: [FB:%d] %ux%u format =3D %s modifier =3D 0x%l=
lx, visible: %s\n",
> +		    "[PLANE:%d:%s] fb: [FB:%d] %ux%u format =3D %p4cc modifier =3D 0=
x%llx, visible: %s\n",
>   		    plane->base.base.id, plane->base.name,
> -		    fb->base.id, fb->width, fb->height,
> -		    drm_get_format_name(fb->format->format, &format_name),
> +		    fb->base.id, fb->width, fb->height, &fb->format->format,
>   		    fb->modifier, yesno(plane_state->uapi.visible));
>   	drm_dbg_kms(&i915->drm, "\trotation: 0x%x, scaler: %d\n",
>   		    plane_state->hw.rotation, plane_state->scaler_id);
> @@ -17927,13 +17925,9 @@ static int intel_framebuffer_init(struct intel=
_framebuffer *intel_fb,
>   	if (!drm_any_plane_has_format(&dev_priv->drm,
>   				      mode_cmd->pixel_format,
>   				      mode_cmd->modifier[0])) {
> -		struct drm_format_name_buf format_name;
> -
>   		drm_dbg_kms(&dev_priv->drm,
> -			    "unsupported pixel format %s / modifier 0x%llx\n",
> -			    drm_get_format_name(mode_cmd->pixel_format,
> -						&format_name),
> -			    mode_cmd->modifier[0]);
> +			    "unsupported pixel format %p4cc / modifier 0x%llx\n",
> +			    &mode_cmd->pixel_format, mode_cmd->modifier[0]);
>   		goto err;
>   	}
>  =20
> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/dri=
vers/gpu/drm/i915/display/intel_display_debugfs.c
> index ca41e8c00ad7..a5c9fe2e56b3 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> @@ -771,21 +771,21 @@ static void intel_plane_uapi_info(struct seq_file=
 *m, struct intel_plane *plane)
>   	const struct intel_plane_state *plane_state =3D
>   		to_intel_plane_state(plane->base.state);
>   	const struct drm_framebuffer *fb =3D plane_state->uapi.fb;
> -	struct drm_format_name_buf format_name;
>   	struct drm_rect src, dst;
>   	char rot_str[48];
>  =20
>   	src =3D drm_plane_state_src(&plane_state->uapi);
>   	dst =3D drm_plane_state_dest(&plane_state->uapi);
>  =20
> -	if (fb)
> -		drm_get_format_name(fb->format->format, &format_name);
> -
>   	plane_rotation(rot_str, sizeof(rot_str),
>   		       plane_state->uapi.rotation);
>  =20
> -	seq_printf(m, "\t\tuapi: [FB:%d] %s,0x%llx,%dx%d, visible=3D%s, src=3D=
" DRM_RECT_FP_FMT ", dst=3D" DRM_RECT_FMT ", rotation=3D%s\n",
> -		   fb ? fb->base.id : 0, fb ? format_name.str : "n/a",
> +	seq_printf(m, "\t\tuapi: [FB:%d] ", fb ? fb->base.id : 0);
> +	if (fb)
> +		seq_printf(m, "%p4cc", &fb->format->format);
> +	else
> +		seq_puts(m, "n/a");
> +	seq_printf(m, ",0x%llx,%dx%d, visible=3D%s, src=3D" DRM_RECT_FP_FMT "=
, dst=3D" DRM_RECT_FMT ", rotation=3D%s\n",
>   		   fb ? fb->modifier : 0,
>   		   fb ? fb->width : 0, fb ? fb->height : 0,
>   		   plane_visibility(plane_state),
> @@ -804,19 +804,16 @@ static void intel_plane_hw_info(struct seq_file *=
m, struct intel_plane *plane)
>   	const struct intel_plane_state *plane_state =3D
>   		to_intel_plane_state(plane->base.state);
>   	const struct drm_framebuffer *fb =3D plane_state->hw.fb;
> -	struct drm_format_name_buf format_name;
>   	char rot_str[48];
>  =20
>   	if (!fb)
>   		return;
>  =20
> -	drm_get_format_name(fb->format->format, &format_name);
> -
>   	plane_rotation(rot_str, sizeof(rot_str),
>   		       plane_state->hw.rotation);
>  =20
> -	seq_printf(m, "\t\thw: [FB:%d] %s,0x%llx,%dx%d, visible=3D%s, src=3D"=
 DRM_RECT_FP_FMT ", dst=3D" DRM_RECT_FMT ", rotation=3D%s\n",
> -		   fb->base.id, format_name.str,
> +	seq_printf(m, "\t\thw: [FB:%d] %p4cc,0x%llx,%dx%d, visible=3D%s, src=3D=
" DRM_RECT_FP_FMT ", dst=3D" DRM_RECT_FMT ", rotation=3D%s\n",
> +		   fb->base.id, &fb->format->format,
>   		   fb->modifier, fb->width, fb->height,
>   		   yesno(plane_state->uapi.visible),
>   		   DRM_RECT_FP_ARG(&plane_state->uapi.src),
> diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/=
drm/i915/display/intel_sprite.c
> index 019a2d6d807a..e4e55d1aec10 100644
> --- a/drivers/gpu/drm/i915/display/intel_sprite.c
> +++ b/drivers/gpu/drm/i915/display/intel_sprite.c
> @@ -2285,7 +2285,6 @@ static int skl_plane_check_fb(const struct intel_=
crtc_state *crtc_state,
>   	struct drm_i915_private *dev_priv =3D to_i915(plane->base.dev);
>   	const struct drm_framebuffer *fb =3D plane_state->hw.fb;
>   	unsigned int rotation =3D plane_state->hw.rotation;
> -	struct drm_format_name_buf format_name;
>  =20
>   	if (!fb)
>   		return 0;
> @@ -2333,9 +2332,8 @@ static int skl_plane_check_fb(const struct intel_=
crtc_state *crtc_state,
>   		case DRM_FORMAT_XVYU12_16161616:
>   		case DRM_FORMAT_XVYU16161616:
>   			drm_dbg_kms(&dev_priv->drm,
> -				    "Unsupported pixel format %s for 90/270!\n",
> -				    drm_get_format_name(fb->format->format,
> -							&format_name));
> +				    "Unsupported pixel format %p4cc for 90/270!\n",
> +				    &fb->format->format);
>   			return -EINVAL;
>   		default:
>   			break;
> diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde=
/mcde_display.c
> index 7c2e0b865441..83ac7493e751 100644
> --- a/drivers/gpu/drm/mcde/mcde_display.c
> +++ b/drivers/gpu/drm/mcde/mcde_display.c
> @@ -1161,7 +1161,6 @@ static void mcde_display_enable(struct drm_simple=
_display_pipe *pipe,
>   	int dsi_pkt_size;
>   	int fifo_wtrmrk;
>   	int cpp =3D fb->format->cpp[0];
> -	struct drm_format_name_buf tmp;
>   	u32 dsi_formatter_frame;
>   	u32 val;
>   	int ret;
> @@ -1173,9 +1172,8 @@ static void mcde_display_enable(struct drm_simple=
_display_pipe *pipe,
>   		return;
>   	}
>  =20
> -	dev_info(drm->dev, "enable MCDE, %d x %d format %s\n",
> -		 mode->hdisplay, mode->vdisplay,
> -		 drm_get_format_name(format, &tmp));
> +	dev_info(drm->dev, "enable MCDE, %d x %d format %p4cc\n",
> +		 mode->hdisplay, mode->vdisplay, &format);
>  =20
>  =20
>   	/* Clear any pending interrupts */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.c
> index 56eb22554197..ea9d73983d13 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -71,7 +71,6 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc=
_mixer *mixer,
>   {
>   	struct dpu_hw_mixer *lm =3D mixer->hw_lm;
>   	uint32_t blend_op;
> -	struct drm_format_name_buf format_name;
>  =20
>   	/* default to opaque blending */
>   	blend_op =3D DPU_BLEND_FG_ALPHA_FG_CONST |
> @@ -87,9 +86,8 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc=
_mixer *mixer,
>   	lm->ops.setup_blend_config(lm, pstate->stage,
>   				0xFF, 0, blend_op);
>  =20
> -	DPU_DEBUG("format:%s, alpha_en:%u blend_op:0x%x\n",
> -		drm_get_format_name(format->base.pixel_format, &format_name),
> -		format->alpha_enable, blend_op);
> +	DPU_DEBUG("format:%p4cc, alpha_en:%u blend_op:0x%x\n",
> +		  &format->base.pixel_format, format->alpha_enable, blend_op);
>   }
>  =20
>   static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/dr=
m/nouveau/nouveau_display.c
> index bceb48a2dfca..a305b749c321 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -322,12 +322,9 @@ nouveau_framebuffer_new(struct drm_device *dev,
>   	     mode_cmd->pitches[0] >=3D 0x10000 || /* at most 64k pitch */
>   	     (mode_cmd->pitches[1] && /* pitches for planes must match */
>   	      mode_cmd->pitches[0] !=3D mode_cmd->pitches[1]))) {
> -		struct drm_format_name_buf format_name;
> -		DRM_DEBUG_KMS("Unsuitable framebuffer: format: %s; pitches: 0x%x\n 0=
x%x\n",
> -			      drm_get_format_name(mode_cmd->pixel_format,
> -						  &format_name),
> -			      mode_cmd->pitches[0],
> -			      mode_cmd->pitches[1]);
> +		DRM_DEBUG_KMS("Unsuitable framebuffer: format: %p4cc; pitches: 0x%x\=
n 0x%x\n",
> +			      &mode_cmd->pixel_format,
> +			      mode_cmd->pitches[0], mode_cmd->pitches[1]);
>   		return -EINVAL;
>   	}
>  =20
> diff --git a/drivers/gpu/drm/radeon/atombios_crtc.c b/drivers/gpu/drm/r=
adeon/atombios_crtc.c
> index 1979ed3d6547..c94e429e75f9 100644
> --- a/drivers/gpu/drm/radeon/atombios_crtc.c
> +++ b/drivers/gpu/drm/radeon/atombios_crtc.c
> @@ -1157,7 +1157,6 @@ static int dce4_crtc_do_set_base(struct drm_crtc =
*crtc,
>   	u32 tmp, viewport_w, viewport_h;
>   	int r;
>   	bool bypass_lut =3D false;
> -	struct drm_format_name_buf format_name;
>  =20
>   	/* no fb bound */
>   	if (!atomic && !crtc->primary->fb) {
> @@ -1267,8 +1266,8 @@ static int dce4_crtc_do_set_base(struct drm_crtc =
*crtc,
>   #endif
>   		break;
>   	default:
> -		DRM_ERROR("Unsupported screen format %s\n",
> -		          drm_get_format_name(target_fb->format->format, &format_nam=
e));
> +		DRM_ERROR("Unsupported screen format %p4cc\n",
> +			  &target_fb->format->format);
>   		return -EINVAL;
>   	}
>  =20
> @@ -1478,7 +1477,6 @@ static int avivo_crtc_do_set_base(struct drm_crtc=
 *crtc,
>   	u32 viewport_w, viewport_h;
>   	int r;
>   	bool bypass_lut =3D false;
> -	struct drm_format_name_buf format_name;
>  =20
>   	/* no fb bound */
>   	if (!atomic && !crtc->primary->fb) {
> @@ -1579,8 +1577,8 @@ static int avivo_crtc_do_set_base(struct drm_crtc=
 *crtc,
>   #endif
>   		break;
>   	default:
> -		DRM_ERROR("Unsupported screen format %s\n",
> -		          drm_get_format_name(target_fb->format->format, &format_nam=
e));
> +		DRM_ERROR("Unsupported screen format %p4cc\n",
> +			  &target_fb->format->format);
>   		return -EINVAL;
>   	}
>  =20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/su=
n4i/sun4i_backend.c
> index 522e51a404cc..bf8cfefa0365 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_backend.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
> @@ -510,7 +510,6 @@ static int sun4i_backend_atomic_check(struct sunxi_=
engine *engine,
>   		struct sun4i_layer_state *layer_state =3D
>   			state_to_sun4i_layer_state(plane_state);
>   		struct drm_framebuffer *fb =3D plane_state->fb;
> -		struct drm_format_name_buf format_name;
>  =20
>   		if (!sun4i_backend_plane_is_supported(plane_state,
>   						      &layer_state->uses_frontend))
> @@ -527,9 +526,8 @@ static int sun4i_backend_atomic_check(struct sunxi_=
engine *engine,
>   			}
>   		}
>  =20
> -		DRM_DEBUG_DRIVER("Plane FB format is %s\n",
> -				 drm_get_format_name(fb->format->format,
> -						     &format_name));
> +		DRM_DEBUG_DRIVER("Plane FB format is %p4cc\n",
> +				 &fb->format->format);
>   		if (fb->format->has_alpha || (plane_state->alpha !=3D DRM_BLEND_ALP=
HA_OPAQUE))
>   			num_alpha_planes++;
>  =20
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vk=
ms/vkms_writeback.c
> index 78fdc1d59186..0935686475a0 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -42,11 +42,8 @@ static int vkms_wb_encoder_atomic_check(struct drm_e=
ncoder *encoder,
>   	}
>  =20
>   	if (fb->format->format !=3D vkms_wb_formats[0]) {
> -		struct drm_format_name_buf format_name;
> -
> -		DRM_DEBUG_KMS("Invalid pixel format %s\n",
> -			      drm_get_format_name(fb->format->format,
> -						  &format_name));
> +		DRM_DEBUG_KMS("Invalid pixel format %p4cc\n",
> +			      &fb->format->format);
>   		return -EINVAL;
>   	}
>  =20
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwg=
fx/vmwgfx_kms.c
> index bc67f2b930e1..0cd2c55036bb 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -895,7 +895,6 @@ static int vmw_kms_new_framebuffer_surface(struct v=
mw_private *dev_priv,
>   	struct vmw_framebuffer_surface *vfbs;
>   	enum SVGA3dSurfaceFormat format;
>   	int ret;
> -	struct drm_format_name_buf format_name;
>  =20
>   	/* 3D is only supported on HWv8 and newer hosts */
>   	if (dev_priv->active_display_unit =3D=3D vmw_du_legacy)
> @@ -933,8 +932,8 @@ static int vmw_kms_new_framebuffer_surface(struct v=
mw_private *dev_priv,
>   		format =3D SVGA3D_A1R5G5B5;
>   		break;
>   	default:
> -		DRM_ERROR("Invalid pixel format: %s\n",
> -			  drm_get_format_name(mode_cmd->pixel_format, &format_name));
> +		DRM_ERROR("Invalid pixel format: %p4cc\n",
> +			  &mode_cmd->pixel_format);
>   		return -EINVAL;
>   	}
>  =20
> @@ -1149,7 +1148,6 @@ static int vmw_create_bo_proxy(struct drm_device =
*dev,
>   	uint32_t format;
>   	struct vmw_resource *res;
>   	unsigned int bytes_pp;
> -	struct drm_format_name_buf format_name;
>   	int ret;
>  =20
>   	switch (mode_cmd->pixel_format) {
> @@ -1171,8 +1169,8 @@ static int vmw_create_bo_proxy(struct drm_device =
*dev,
>   		break;
>  =20
>   	default:
> -		DRM_ERROR("Invalid framebuffer format %s\n",
> -			  drm_get_format_name(mode_cmd->pixel_format, &format_name));
> +		DRM_ERROR("Invalid framebuffer format %p4cc\n",
> +			  &mode_cmd->pixel_format);
>   		return -EINVAL;
>   	}
>  =20
> @@ -1216,7 +1214,6 @@ static int vmw_kms_new_framebuffer_bo(struct vmw_=
private *dev_priv,
>   	struct drm_device *dev =3D dev_priv->dev;
>   	struct vmw_framebuffer_bo *vfbd;
>   	unsigned int requested_size;
> -	struct drm_format_name_buf format_name;
>   	int ret;
>  =20
>   	requested_size =3D mode_cmd->height * mode_cmd->pitches[0];
> @@ -1236,8 +1233,8 @@ static int vmw_kms_new_framebuffer_bo(struct vmw_=
private *dev_priv,
>   		case DRM_FORMAT_RGB565:
>   			break;
>   		default:
> -			DRM_ERROR("Invalid pixel format: %s\n",
> -				  drm_get_format_name(mode_cmd->pixel_format, &format_name));
> +			DRM_ERROR("Invalid pixel format: %p4cc\n",
> +				  &mode_cmd->pixel_format);
>   			return -EINVAL;
>   		}
>   	}
> diff --git a/include/drm/drm_fourcc.h b/include/drm/drm_fourcc.h
> index 156b122c0ad5..3ea17b8a79d3 100644
> --- a/include/drm/drm_fourcc.h
> +++ b/include/drm/drm_fourcc.h
> @@ -318,6 +318,5 @@ unsigned int drm_format_info_block_height(const str=
uct drm_format_info *info,
>   					  int plane);
>   uint64_t drm_format_info_min_pitch(const struct drm_format_info *info=
,
>   				   int plane, unsigned int buffer_width);
> -const char *drm_get_format_name(uint32_t format, struct drm_format_nam=
e_buf *buf);
>  =20
>   #endif /* __DRM_FOURCC_H__ */
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--BR4xHTTe9BQ3OWCu73R3j5EIQT3WZaL6E--

--lfSescth8qvt1H8cGx5WDxp89URU1groe
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmArhFkFAwAAAAAACgkQlh/E3EQov+Bp
JQ/9FYvzD7mh9voS1YUCoHsBTypo4C7k+/mQLVQlI38fjcCzOUpNrqjuPluzxkrIvxJUVqllKLvo
CpTvpQglKXFul0MvymIR3wJCHz2+moWbfWqWBBfkM0QACkgftnEj2MBkk1vnmaHDsWKr4bd2OMT0
CZfz+Yu4RbkjQIcHlKQCsPztHmC3uLdXzRZOpwxEEHcvZgFh2PaDEBFtPhep5GwN5dV0pGR5CZ62
fP081za9ug6ftl3y6pr+3vzHBCehPwVPx/YXpy4kEOY6dwjrzzgguFHXFG2lEkc1AIKarlTJCEnu
JVGaeCM6kW0kpzrAC3fT0w1QnScLlVWWGbVJxHZrhRnBeeP+0qKspN7V6zuXWujJzM72GPGa4Ld+
mrqb9tAfnpZOsGIfA3CuxDkh6D/tsu3JmhPMk1svyl7oMJqnUdZLkEXEJwcO0e/u1NZcZ02zEWWd
T6olzyJGWwoXMvKvv0aJkWxzizQQSq1Z+BgFc+6iYNZ5pfUcZHg5XX9UQJXxPy+Zg3ufRNywISnM
HuvcnGF4cXz0G4BQRhp3IrW7LnZIRyxgiFssM+kvWrtG5O1awluGKaUXt/+kVSg4HLY1UwFaRsHa
33HZXnZNaKb0+8OATO6eMuJd2/LMeb2JH3fXcMQVZjUhq9kYBcaWNXPlUe6cnXC2XD6eNlKEbKJc
BLg=
=QPMx
-----END PGP SIGNATURE-----

--lfSescth8qvt1H8cGx5WDxp89URU1groe--

--===============0458590812==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0458590812==--
