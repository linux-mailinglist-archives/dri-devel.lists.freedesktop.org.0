Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE63565AC3
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:15:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B435710E358;
	Mon,  4 Jul 2022 16:14:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2237310E002;
 Sat,  2 Jul 2022 18:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656785187;
 bh=tuoE/svLR1uv90wZJeOIqHKhM2Eab/ub6y4LYz4dUOk=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=jLlz3Kl0FXb/Rk+xubUJ+NdUdlIp+xqFmfIO3zpJXy0reGtoG6kq2OZ//A7epJ7vh
 c1KPWn4xa73DtEsw4wnjLOzZjc4pAvc1foL6lY4rZ+E4ieHr0f5Y6XHAJPKNySXg56
 t88tR6e5KNTRGnJVOyDGHNrdDR/tLwiK9gfHsmes=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.191.144]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNsw4-1nwmN90GwC-00OF33; Sat, 02
 Jul 2022 20:06:27 +0200
Message-ID: <d27c08a3-0f2f-c0f2-143f-482a33a6a4ce@gmx.de>
Date: Sat, 2 Jul 2022 20:05:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/fb-helper: Remove helpers to change frame buffer
 config
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Tomi Valkeinen <tomba@kernel.org>
References: <20220629105658.1373770-1-geert@linux-m68k.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220629105658.1373770-1-geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BGng93Jeq/bZr2VT9uqzLM1/0/3EvIDZI8+ztrj+RkhW3SL0pR1
 AIr+z9h8L1s1oVVcjJDFr/ExSYVsoCEudDrdhEk5Yr2MWvEshAa34HObpKkaVUEZWwASUfz
 kY+Gt97j+/5nC3Z1+RveCtddmVrwxFe/aqfCDwdDspDmGZ8LEBX1/D6rhZRovO276o5hAYs
 Cy+NPB5e97fFE7pi+coBA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:uaM7tIYJG24=:FsZUq5ZML5zn6YyFD3UeBj
 XX0zsS9DDkBnvjwy1dgv5C+GldXPzlPSnJRHm9JV2EoV8y231hBfd5vOSlvyBBRxRbQPlgSBz
 Na8AheJi15i1aeU4IKKFiciz9DPRYw2ZnfyzqqSgK2lNbnU+VTQ59PPvUbSaf7Sdjhm0tXwBL
 9vohQCMDunAQBu9/w6cJGBRqr3DKhdHY2OXsGEF9S72Q/k+FE3g0YAoiom5e0l56HMIN3oX7+
 aSSMtc3fFu/MlRt1oW2FtnwA9bSlZ0puk8Xg19VtukeCiCO/Ud2YG0nJeO5BqyY6mN4+jnzGY
 8j8vVAdIG+QORcxwHXvRS218YMcUBefxsHWE1uEIJK30HrF8tO9AJe6MQzQ+Xvl73pKTdeSIN
 Zkx0B+qwKz7X6BKYWwzuqlGJic5PFuN0MLTsoSXo1eQTpY189biN3trt8xc3qboP+tKj47zPS
 dMmb+4ECuP2AbCp4/M1yIu8ZnPl4viFLfu2Uxwell4sj/ReEAe2QdzNLmegrbRir6o3HcVVOV
 30E/Kdmg0Xukcz9FB9fUCBEt7vYl6SOD8COxFJlnM+e5sPBz5SP0SEV4Q/NhFOTPfJdlQ3GLY
 3oRSHas5c4rQ5hpG9KpzxyVuayBDpjB1VPxZldzl1Ry4bnn4z9FoUaak2UriIGRlaR3/4O92b
 GwRxi3nHeU4h9X5PCVf/YZDi24ysRuSJQO9EZ4xyqzISsoyG0WzJbP6xzpyuiKXoIJkdnZIdk
 JAPUmmeCg6cPJIR7vk1psgmkBFKcRNSp3i204r1MTAE0ryIHfUuQeV8w9cyAPRtstVK53IrX0
 O++idJl/ycQ+ZP93G6qxtxMGP2kgkKOzefX4yP2Q/6jlkDW4GpFkZ0KUFSuhSFhJxW5EsSqfp
 bf9fq5PDeb8E1qZK6ns/nb0BZ++Ps7Zjp0YxJHrPn6zJ8c6cvl4eNzkn32kmpa6fswQriB7do
 I2GZ7+B5Ua96lrGwFzDp6rBHweAc9YjZsN3kvVU5H8bmon9Zx7wZurhxcNjUyPLbwZu5hdf7n
 fqR6j4GHtiHckYJWtkrAL8Sq4qwRyJABrWzkPEhsmDrk3bNvwxwhwjfE0CQDvmPl88mhiaZue
 UrWLEO30N61GSihG37ntl1FPhM1Vl7dmXYb7Xo8f+S50YTCvQIJtpRPiw==
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/29/22 12:56, Geert Uytterhoeven wrote:
> The DRM fbdev emulation layer does not support pushing back
> changes to fb_var_screeninfo to KMS.
>
> However, drm_fb_helper still implements the fb_ops.fb_check_var() and
> fb_ops.fb_set_par() callbacks, but the former fails to validate various
> parameters passed from userspace.  Hence unsanitized and possible
> invaled values are passed up through the fbdev, fbcon, and console
> stack, which has become an endless source of security issues reported
> against fbdev.
>
> Fix this by not populating the fb_ops.fb_check_var() and
> fb_ops.fb_set_par() callbacks, as there is no point in providing them if
> the frame buffer config cannot be changed anyway.  This makes the fbdev
> core aware that making changes to the frame buffer config is not
> supported, so it will always return the current config.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

It's unfortunate that DRM currently isn't able to switch resolutions
at runtime.

With that in mind I agree with Geert that it's probably better to
disable (or drop) that code until DRM can cope with fbdev's
interface to switch resolutions.

Furthermore, with the upcoming patches to fbcon (which prevents crashes on
invalid userspace input), you will face a kernel WARNING if you call fbset
to switch screen resolutions with DRM drivers.

So, from my side (although I'd prefer a better fix for DRM):

Acked-by: Helge Deller <deller@gmx.de>

Helge

> ---
> The only remaining DRM driver that implements fb_ops.fb_check_var() is
> also broken, as it fails to validate various parameters passed from
> userspace.  So vmw_fb_check_var() should either be fixed, or removed.
> ---
>  drivers/gpu/drm/drm_fb_helper.c            | 180 ++-------------------
>  drivers/gpu/drm/i915/display/intel_fbdev.c |  15 --
>  drivers/gpu/drm/omapdrm/omap_fbdev.c       |   2 -
>  include/drm/drm_fb_helper.h                |  16 --
>  4 files changed, 13 insertions(+), 200 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_he=
lper.c
> index 2d4cee6a10ffffe7..1041a11c410d7967 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -228,9 +228,18 @@ int drm_fb_helper_debug_leave(struct fb_info *info)
>  }
>  EXPORT_SYMBOL(drm_fb_helper_debug_leave);
>
> -static int
> -__drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_he=
lper,
> -					    bool force)
> +/**
> + * drm_fb_helper_restore_fbdev_mode_unlocked - restore fbdev configurat=
ion
> + * @fb_helper: driver-allocated fbdev helper, can be NULL
> + *
> + * This should be called from driver's drm &drm_driver.lastclose callba=
ck
> + * when implementing an fbcon on top of kms using this helper. This ens=
ures that
> + * the user isn't greeted with a black screen when e.g. X dies.
> + *
> + * RETURNS:
> + * Zero if everything went ok, negative error code otherwise.
> + */
> +int drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_=
helper)
>  {
>  	bool do_delayed;
>  	int ret;
> @@ -242,16 +251,7 @@ __drm_fb_helper_restore_fbdev_mode_unlocked(struct =
drm_fb_helper *fb_helper,
>  		return 0;
>
>  	mutex_lock(&fb_helper->lock);
> -	if (force) {
> -		/*
> -		 * Yes this is the _locked version which expects the master lock
> -		 * to be held. But for forced restores we're intentionally
> -		 * racing here, see drm_fb_helper_set_par().
> -		 */
> -		ret =3D drm_client_modeset_commit_locked(&fb_helper->client);
> -	} else {
> -		ret =3D drm_client_modeset_commit(&fb_helper->client);
> -	}
> +	ret =3D drm_client_modeset_commit(&fb_helper->client);
>
>  	do_delayed =3D fb_helper->delayed_hotplug;
>  	if (do_delayed)
> @@ -263,22 +263,6 @@ __drm_fb_helper_restore_fbdev_mode_unlocked(struct =
drm_fb_helper *fb_helper,
>
>  	return ret;
>  }
> -
> -/**
> - * drm_fb_helper_restore_fbdev_mode_unlocked - restore fbdev configurat=
ion
> - * @fb_helper: driver-allocated fbdev helper, can be NULL
> - *
> - * This should be called from driver's drm &drm_driver.lastclose callba=
ck
> - * when implementing an fbcon on top of kms using this helper. This ens=
ures that
> - * the user isn't greeted with a black screen when e.g. X dies.
> - *
> - * RETURNS:
> - * Zero if everything went ok, negative error code otherwise.
> - */
> -int drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_=
helper)
> -{
> -	return __drm_fb_helper_restore_fbdev_mode_unlocked(fb_helper, false);
> -}
>  EXPORT_SYMBOL(drm_fb_helper_restore_fbdev_mode_unlocked);
>
>  #ifdef CONFIG_MAGIC_SYSRQ
> @@ -1254,25 +1238,6 @@ int drm_fb_helper_ioctl(struct fb_info *info, uns=
igned int cmd,
>  }
>  EXPORT_SYMBOL(drm_fb_helper_ioctl);
>
> -static bool drm_fb_pixel_format_equal(const struct fb_var_screeninfo *v=
ar_1,
> -				      const struct fb_var_screeninfo *var_2)
> -{
> -	return var_1->bits_per_pixel =3D=3D var_2->bits_per_pixel &&
> -	       var_1->grayscale =3D=3D var_2->grayscale &&
> -	       var_1->red.offset =3D=3D var_2->red.offset &&
> -	       var_1->red.length =3D=3D var_2->red.length &&
> -	       var_1->red.msb_right =3D=3D var_2->red.msb_right &&
> -	       var_1->green.offset =3D=3D var_2->green.offset &&
> -	       var_1->green.length =3D=3D var_2->green.length &&
> -	       var_1->green.msb_right =3D=3D var_2->green.msb_right &&
> -	       var_1->blue.offset =3D=3D var_2->blue.offset &&
> -	       var_1->blue.length =3D=3D var_2->blue.length &&
> -	       var_1->blue.msb_right =3D=3D var_2->blue.msb_right &&
> -	       var_1->transp.offset =3D=3D var_2->transp.offset &&
> -	       var_1->transp.length =3D=3D var_2->transp.length &&
> -	       var_1->transp.msb_right =3D=3D var_2->transp.msb_right;
> -}
> -
>  static void drm_fb_helper_fill_pixel_fmt(struct fb_var_screeninfo *var,
>  					 u8 depth)
>  {
> @@ -1331,123 +1296,6 @@ static void drm_fb_helper_fill_pixel_fmt(struct =
fb_var_screeninfo *var,
>  	}
>  }
>
> -/**
> - * drm_fb_helper_check_var - implementation for &fb_ops.fb_check_var
> - * @var: screeninfo to check
> - * @info: fbdev registered by the helper
> - */
> -int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
> -			    struct fb_info *info)
> -{
> -	struct drm_fb_helper *fb_helper =3D info->par;
> -	struct drm_framebuffer *fb =3D fb_helper->fb;
> -	struct drm_device *dev =3D fb_helper->dev;
> -
> -	if (in_dbg_master())
> -		return -EINVAL;
> -
> -	if (var->pixclock !=3D 0) {
> -		drm_dbg_kms(dev, "fbdev emulation doesn't support changing the pixel =
clock, value of pixclock is ignored\n");
> -		var->pixclock =3D 0;
> -	}
> -
> -	if ((drm_format_info_block_width(fb->format, 0) > 1) ||
> -	    (drm_format_info_block_height(fb->format, 0) > 1))
> -		return -EINVAL;
> -
> -	/*
> -	 * Changes struct fb_var_screeninfo are currently not pushed back
> -	 * to KMS, hence fail if different settings are requested.
> -	 */
> -	if (var->bits_per_pixel > fb->format->cpp[0] * 8 ||
> -	    var->xres > fb->width || var->yres > fb->height ||
> -	    var->xres_virtual > fb->width || var->yres_virtual > fb->height) {
> -		drm_dbg_kms(dev, "fb requested width/height/bpp can't fit in current =
fb "
> -			  "request %dx%d-%d (virtual %dx%d) > %dx%d-%d\n",
> -			  var->xres, var->yres, var->bits_per_pixel,
> -			  var->xres_virtual, var->yres_virtual,
> -			  fb->width, fb->height, fb->format->cpp[0] * 8);
> -		return -EINVAL;
> -	}
> -
> -	/*
> -	 * Workaround for SDL 1.2, which is known to be setting all pixel form=
at
> -	 * fields values to zero in some cases. We treat this situation as a
> -	 * kind of "use some reasonable autodetected values".
> -	 */
> -	if (!var->red.offset     && !var->green.offset    &&
> -	    !var->blue.offset    && !var->transp.offset   &&
> -	    !var->red.length     && !var->green.length    &&
> -	    !var->blue.length    && !var->transp.length   &&
> -	    !var->red.msb_right  && !var->green.msb_right &&
> -	    !var->blue.msb_right && !var->transp.msb_right) {
> -		drm_fb_helper_fill_pixel_fmt(var, fb->format->depth);
> -	}
> -
> -	/*
> -	 * Likewise, bits_per_pixel should be rounded up to a supported value.
> -	 */
> -	var->bits_per_pixel =3D fb->format->cpp[0] * 8;
> -
> -	/*
> -	 * drm fbdev emulation doesn't support changing the pixel format at al=
l,
> -	 * so reject all pixel format changing requests.
> -	 */
> -	if (!drm_fb_pixel_format_equal(var, &info->var)) {
> -		drm_dbg_kms(dev, "fbdev emulation doesn't support changing the pixel =
format\n");
> -		return -EINVAL;
> -	}
> -
> -	return 0;
> -}
> -EXPORT_SYMBOL(drm_fb_helper_check_var);
> -
> -/**
> - * drm_fb_helper_set_par - implementation for &fb_ops.fb_set_par
> - * @info: fbdev registered by the helper
> - *
> - * This will let fbcon do the mode init and is called at initialization=
 time by
> - * the fbdev core when registering the driver, and later on through the=
 hotplug
> - * callback.
> - */
> -int drm_fb_helper_set_par(struct fb_info *info)
> -{
> -	struct drm_fb_helper *fb_helper =3D info->par;
> -	struct fb_var_screeninfo *var =3D &info->var;
> -	bool force;
> -
> -	if (oops_in_progress)
> -		return -EBUSY;
> -
> -	if (var->pixclock !=3D 0) {
> -		drm_err(fb_helper->dev, "PIXEL CLOCK SET\n");
> -		return -EINVAL;
> -	}
> -
> -	/*
> -	 * Normally we want to make sure that a kms master takes precedence ov=
er
> -	 * fbdev, to avoid fbdev flickering and occasionally stealing the
> -	 * display status. But Xorg first sets the vt back to text mode using
> -	 * the KDSET IOCTL with KD_TEXT, and only after that drops the master
> -	 * status when exiting.
> -	 *
> -	 * In the past this was caught by drm_fb_helper_lastclose(), but on
> -	 * modern systems where logind always keeps a drm fd open to orchestra=
te
> -	 * the vt switching, this doesn't work.
> -	 *
> -	 * To not break the userspace ABI we have this special case here, whic=
h
> -	 * is only used for the above case. Everything else uses the normal
> -	 * commit function, which ensures that we never steal the display from
> -	 * an active drm master.
> -	 */
> -	force =3D var->activate & FB_ACTIVATE_KD_TEXT;
> -
> -	__drm_fb_helper_restore_fbdev_mode_unlocked(fb_helper, force);
> -
> -	return 0;
> -}
> -EXPORT_SYMBOL(drm_fb_helper_set_par);
> -
>  static void pan_set(struct drm_fb_helper *fb_helper, int x, int y)
>  {
>  	struct drm_mode_set *mode_set;
> @@ -2028,8 +1876,6 @@ int drm_fb_helper_hotplug_event(struct drm_fb_help=
er *fb_helper)
>  	drm_setup_crtcs_fb(fb_helper);
>  	mutex_unlock(&fb_helper->lock);
>
> -	drm_fb_helper_set_par(fb_helper->fbdev);
> -
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_fb_helper_hotplug_event);
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/dr=
m/i915/display/intel_fbdev.c
> index 221336178991f04f..26dbe9487c79ae1b 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -77,20 +77,6 @@ static void intel_fbdev_invalidate(struct intel_fbdev=
 *ifbdev)
>  	intel_frontbuffer_invalidate(to_frontbuffer(ifbdev), ORIGIN_CPU);
>  }
>
> -static int intel_fbdev_set_par(struct fb_info *info)
> -{
> -	struct drm_fb_helper *fb_helper =3D info->par;
> -	struct intel_fbdev *ifbdev =3D
> -		container_of(fb_helper, struct intel_fbdev, helper);
> -	int ret;
> -
> -	ret =3D drm_fb_helper_set_par(info);
> -	if (ret =3D=3D 0)
> -		intel_fbdev_invalidate(ifbdev);
> -
> -	return ret;
> -}
> -
>  static int intel_fbdev_blank(int blank, struct fb_info *info)
>  {
>  	struct drm_fb_helper *fb_helper =3D info->par;
> @@ -123,7 +109,6 @@ static int intel_fbdev_pan_display(struct fb_var_scr=
eeninfo *var,
>  static const struct fb_ops intelfb_ops =3D {
>  	.owner =3D THIS_MODULE,
>  	DRM_FB_HELPER_DEFAULT_OPS,
> -	.fb_set_par =3D intel_fbdev_set_par,
>  	.fb_fillrect =3D drm_fb_helper_cfb_fillrect,
>  	.fb_copyarea =3D drm_fb_helper_cfb_copyarea,
>  	.fb_imageblit =3D drm_fb_helper_cfb_imageblit,
> diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omap=
drm/omap_fbdev.c
> index 40706c5aad7b5c9b..2df8875baaca10b6 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
> +++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> @@ -74,8 +74,6 @@ static int omap_fbdev_pan_display(struct fb_var_screen=
info *var,
>  static const struct fb_ops omap_fb_ops =3D {
>  	.owner =3D THIS_MODULE,
>
> -	.fb_check_var	=3D drm_fb_helper_check_var,
> -	.fb_set_par	=3D drm_fb_helper_set_par,
>  	.fb_setcmap	=3D drm_fb_helper_setcmap,
>  	.fb_blank	=3D drm_fb_helper_blank,
>  	.fb_pan_display =3D omap_fbdev_pan_display,
> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
> index 329607ca65c06684..19b40adc156295a1 100644
> --- a/include/drm/drm_fb_helper.h
> +++ b/include/drm/drm_fb_helper.h
> @@ -200,8 +200,6 @@ drm_fb_helper_from_client(struct drm_client_dev *cli=
ent)
>   * functions. To be used in struct fb_ops of drm drivers.
>   */
>  #define DRM_FB_HELPER_DEFAULT_OPS \
> -	.fb_check_var	=3D drm_fb_helper_check_var, \
> -	.fb_set_par	=3D drm_fb_helper_set_par, \
>  	.fb_setcmap	=3D drm_fb_helper_setcmap, \
>  	.fb_blank	=3D drm_fb_helper_blank, \
>  	.fb_pan_display	=3D drm_fb_helper_pan_display, \
> @@ -217,9 +215,6 @@ void drm_fb_helper_fini(struct drm_fb_helper *helper=
);
>  int drm_fb_helper_blank(int blank, struct fb_info *info);
>  int drm_fb_helper_pan_display(struct fb_var_screeninfo *var,
>  			      struct fb_info *info);
> -int drm_fb_helper_set_par(struct fb_info *info);
> -int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
> -			    struct fb_info *info);
>
>  int drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_=
helper);
>
> @@ -303,17 +298,6 @@ static inline int drm_fb_helper_pan_display(struct =
fb_var_screeninfo *var,
>  	return 0;
>  }
>
> -static inline int drm_fb_helper_set_par(struct fb_info *info)
> -{
> -	return 0;
> -}
> -
> -static inline int drm_fb_helper_check_var(struct fb_var_screeninfo *var=
,
> -					  struct fb_info *info)
> -{
> -	return 0;
> -}
> -
>  static inline int
>  drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_help=
er)
>  {

