Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CBE614E69
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 16:33:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD7A210E3F5;
	Tue,  1 Nov 2022 15:33:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from moc6.cz (hosting.moc6.cz [IPv6:2a02:c60:c70:8900::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E69810E3F2;
 Tue,  1 Nov 2022 15:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=moc6.cz;
 s=mail20201116; h=In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To;
 bh=AhuhHf4zrmixzZAsBr9hEqobQ8VFY76RJTWzb1GkiwM=; b=a8y3ZxAJ34Cjdz4lY470TFaRM/
 5pGFbNZYNIt2/11DbUly3NPCXhb5IaujoU3Ssw2L8l9zsD+iWX99ABryWslyhfcGT3T7E5SbWE9Z3
 wuFuuw366n13JWTRrZNMcM8TC8ShLYnAX/LldxdfImd54g8W8MeC/+Oy1JN7Qi+XxZlC/QiWtJKC6
 o4WM2vCEsyXoxeanS77p3+avECxhDItMV18HXd/uqlCfXB16b6MYPtzOEXarMO/CjpuLluojPjZaJ
 Ms+uXYMTuIuoAjcY8G+bSUz/xQ60P4wzZZMSPAh8W7ZBcARrdDWwNSSwgrFFeAHSvBP5uH6QRYIjC
 LjnuUKXoaDdp+WCn4wqRvU93O8lz2EUTu++CIorfe/4geyuEiBs1tc66Zq+sA9JJ0+XqqxEsxyr6C
 eWoC4g/m9zIRNBwI8JaIKvnT+lYyZz0sUX//karmRyGvJG70g/hxxY5r1tSGigItr8IooEUJ9UtnC
 +xzGE1+sM4PwME18HXl6M/Yz0cJBcrbjq6bnunvCGsmbT/SBwM0XzFrbhT2hFLK+QrsQLbHvBpVDT
 hJSCGjPXFwDtBTRg+i458yEw3pQ3a9cbS62SczbYznE/6woBO/+VHHQx7giPmT84ZvO7bSGvvYiRo
 vY91Z4rMvmGtaiMew/Ggf2qeiDhr9f4999EepaRNQ=;
Received: from Debian-exim by moc6.cz with local (Exim 4.94.2)
 (envelope-from <Debian-exim@moc6.cz>) authenticated: Debian-exim
 id 1optGc-00117m-QO; Tue, 01 Nov 2022 16:33:30 +0100
Date: Tue, 1 Nov 2022 16:33:30 +0100
From: Filip Moc <dev@moc6.cz>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH] drm/amd/display: add parameter backlight_min
Message-ID: <Y2E8SsisrDn/f6+c@moc6.cz>
References: <Y117XNaSP6/8bH+3@moc6.cz>
 <23cd28ea-59ed-7687-0912-506356b4b24d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23cd28ea-59ed-7687-0912-506356b4b24d@amd.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Harry,

thank you for your response.

> amdgpu.backlight_min=2:-1

almost :-)

Array elements in module parameters are separated by commas not colons.
So for cmdline it should look like this:
amdgpu.backlight_min=2,-1

Though you can just drop the ,-1 relying on kernel leaving the rest of array
untouched. Which I would recommend as there is no point for user to
follow AMDGPU_DM_MAX_NUM_EDP.
Only when you need to override some other display than display 0 then you may
need to use -1. E.g. backlight_min=-1,2 overrides display 1 to min backlight=2
while keeping display 0 with no override.

When amdgpu is loaded as a kernel module, backlight_min can also be passed as a
parameter to modprobe, e.g.:
modprobe backlight_min=2
So in that case you probably want to add something like
options amdgpu backlight_min=2 to /etc/modprobe.d/amdgpu.conf
(and also run update-initramfs if amdgpu is loaded by initramfs).

I'll add some examples to commit message in v2.

Filip


V Mon, Oct 31, 2022 at 10:24:25AM -0400, Harry Wentland napsal(a):
> On 2022-10-29 15:13, Filip Moc wrote:
> > There are some devices on which amdgpu won't allow user to set brightness
> > to sufficiently low values even though the hardware would support it just
> > fine.
> > 
> > This usually happens in two cases when either configuration of brightness
> > levels via ACPI/ATIF is not available and amdgpu falls back to defaults
> > (currently 12 for minimum level) which may be too high for some devices or
> > even the configuration via ATIF is available but the minimum brightness
> > level provided by the manufacturer is set to unreasonably high value.
> > 
> > In either case user can use this new module parameter to adjust the
> > minimum allowed backlight brightness level.
> > 
> 
> Thanks for this patch and covering all the bases.
> 
> It might be useful to have an example in the commit description on
> how to set the array property. I assume it looks like this if I
> wanted to set the first device to a minimum of 2 and leave the default
> for the 2nd one:
> 
> amdgpu.backlight_min=2:-1
> 
> Either way, this patch is
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> 
> Harry
> 
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=203439>> 
> > Signed-off-by: Filip Moc <dev@moc6.cz>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu.h               |  3 +++
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c           | 15 +++++++++++++++
> >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 15 +++++++++++++++
> >  3 files changed, 33 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > index 0e6ddf05c23c..c5445402c49d 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > @@ -200,6 +200,9 @@ extern uint amdgpu_dc_debug_mask;
> >  extern uint amdgpu_dc_visual_confirm;
> >  extern uint amdgpu_dm_abm_level;
> >  extern int amdgpu_backlight;
> > +#ifdef CONFIG_DRM_AMD_DC
> > +extern int amdgpu_backlight_override_min[];
> > +#endif
> >  extern struct amdgpu_mgpu_info mgpu_info;
> >  extern int amdgpu_ras_enable;
> >  extern uint amdgpu_ras_mask;
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > index 16f6a313335e..f2fb549ac52f 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > @@ -43,6 +43,7 @@
> >  #include "amdgpu_irq.h"
> >  #include "amdgpu_dma_buf.h"
> >  #include "amdgpu_sched.h"
> > +#include "amdgpu_dm.h"
> >  #include "amdgpu_fdinfo.h"
> >  #include "amdgpu_amdkfd.h"
> >  
> > @@ -853,6 +854,20 @@ int amdgpu_backlight = -1;
> >  MODULE_PARM_DESC(backlight, "Backlight control (0 = pwm, 1 = aux, -1 auto (default))");
> >  module_param_named(backlight, amdgpu_backlight, bint, 0444);
> >  
> > +/**
> > + * DOC: backlight_min (array of int)
> > + * Override minimum allowed backlight brightness signal (per display).
> > + * Must be less than the maximum brightness signal.
> > + * Negative value means no override.
> > + *
> > + * Defaults to all -1 (no override on any display).
> > + */
> > +#ifdef CONFIG_DRM_AMD_DC
> > +int amdgpu_backlight_override_min[AMDGPU_DM_MAX_NUM_EDP] = {[0 ... (AMDGPU_DM_MAX_NUM_EDP-1)] = -1};
> > +MODULE_PARM_DESC(backlight_min, "Override minimum backlight brightness signal (0..max-1, -1 = no override (default))");
> > +module_param_array_named(backlight_min, amdgpu_backlight_override_min, int, NULL, 0444);
> > +#endif
> > +
> >  /**
> >   * DOC: tmz (int)
> >   * Trusted Memory Zone (TMZ) is a method to protect data being written
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index eb4ce7216104..e2c36ba93d05 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -3911,6 +3911,21 @@ static void amdgpu_dm_update_backlight_caps(struct amdgpu_display_manager *dm,
> >  	dm->backlight_caps[bl_idx].min_input_signal = AMDGPU_DM_DEFAULT_MIN_BACKLIGHT;
> >  	dm->backlight_caps[bl_idx].max_input_signal = AMDGPU_DM_DEFAULT_MAX_BACKLIGHT;
> >  #endif
> > +
> > +	if (amdgpu_backlight_override_min[bl_idx] >= 0) {
> > +		if (amdgpu_backlight_override_min[bl_idx] < dm->backlight_caps[bl_idx].max_input_signal) {
> > +			DRM_INFO("amdgpu: backlight[%i]: overriding minimum brightness from %i to %i\n",
> > +				  bl_idx,
> > +				  dm->backlight_caps[bl_idx].min_input_signal,
> > +				  amdgpu_backlight_override_min[bl_idx]);
> > +			dm->backlight_caps[bl_idx].min_input_signal = amdgpu_backlight_override_min[bl_idx];
> > +		} else {
> > +			DRM_ERROR("amdgpu: backlight[%i]: minimum brightness override (%i) is not below maximum (%i)\n",
> > +				  bl_idx,
> > +				  amdgpu_backlight_override_min[bl_idx],
> > +				  dm->backlight_caps[bl_idx].max_input_signal);
> > +		}
> > +	}
> >  }
> >  
> >  static int get_brightness_range(const struct amdgpu_dm_backlight_caps *caps,
> > 
> > base-commit: d8c03bfe146fd5e081a252cd34f3f12ca0255357
> 
