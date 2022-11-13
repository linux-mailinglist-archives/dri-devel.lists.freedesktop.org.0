Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8060627186
	for <lists+dri-devel@lfdr.de>; Sun, 13 Nov 2022 19:13:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0950A10E23E;
	Sun, 13 Nov 2022 18:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from moc6.cz (hosting.moc6.cz [IPv6:2a02:c60:c70:8900::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010CF10E23D;
 Sun, 13 Nov 2022 18:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=moc6.cz;
 s=mail20201116; h=In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To;
 bh=vQeGh/SrZTNyLD8BDYwInUVZOX/h82HGv8KTzhAyvnE=; b=h9usAkRcgpMx/K4rRfwFHeDvY4
 ORQcdLwNGYtYAheXA2rgPnuypeB+lJXVZipHKeu6RlmSxnYRgXXJYatlJIGL6Q8+406F4p3BOdIeU
 nGkFyTb5py7i6KayZZDblC7FVhFcFCOfW5d5XDNCHNrIRd8Ka/m7azUJt5Ur1jY7rwwvqeWb4dNm9
 3SennpJIBznq2p6KjTN4prmeH47KkVHxLM4QIV2oq36rkb3tUxpWpAKFZs7pz6lCnTruaCCAwSPA4
 nqROTZ0TTmmV61D5TWpp0hUa/hNLxxhbDum5lhpV3Oq2NkPJEqsA4C+YvKeQZIEWGpoEbFySHHl6u
 aVrY6ER6ubFzVdFPXiAvtxYkKaRGP1oHG1b3/v/3xGwH9aVrmaI97cX3L1l7u7DXijZ1S5S56HUMZ
 CNPW16yFoJnnY/xAfH6Na63GRzBAejGnt+AbJRkZVCyXTgNDsq/qHpKDTKqK3q5nNUkGn9JG+NT+R
 goQsJ2fH6HqLSg1Tyc68tJjWABcctJNhFP0Mvyt1YzBs9DEcndiXOguzHmlkWJLKdfc3jsuITEArY
 n4+z0dUK+m7rSaTMGMqaNCQ91T0PyDxFyL3+X45Oee5ZV9jszfQBnkPY98ap/qgVG6LsybMZc8zO7
 1ED33jQvT5hQw6m4G2c1zwx8xYqAtdORiqnnUvg8g=;
Received: from Debian-exim by moc6.cz with local (Exim 4.94.2)
 (envelope-from <Debian-exim@moc6.cz>) authenticated: Debian-exim
 id 1ouHTD-001ipw-8b; Sun, 13 Nov 2022 19:12:39 +0100
Date: Sun, 13 Nov 2022 19:12:39 +0100
From: Filip Moc <dev@moc6.cz>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/amd/display: add parameter backlight_min
Message-ID: <Y3Ezl+u9dK+Z0iMV@moc6.cz>
References: <Y117XNaSP6/8bH+3@moc6.cz>
 <CADnq5_Muegi+dvmrg5U=Cau_oeXQFjv_h2Pdn_j9AG0mRgE4=g@mail.gmail.com>
 <Y2E+XUEPbQn2tMt+@moc6.cz>
 <CADnq5_PmwiOecVqfpy17V4viYA5wt8WbEDOFPo70VSdmGTjOew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADnq5_PmwiOecVqfpy17V4viYA5wt8WbEDOFPo70VSdmGTjOew@mail.gmail.com>
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

On Tue, Nov 01, 2022 at 12:06:55PM -0400, Alex Deucher wrote:
> On Tue, Nov 1, 2022 at 11:42 AM Filip Moc <dev@moc6.cz> wrote:
> >
> > Hello Alex,
> >
> > thank you for your response.
> >
> > Yes, I have HP ENVY x360 Convertible 13-ay1xxx, and backlight_min=2
> > seems to work the best in my case.
> >
> > I added a dmi based quirk table. So far with support only for display 0
> > to make it simple. Support for more displays in quirk table can be added
> > later if ever needed.
> >
> > According to [1] HP ENVY x360 Convertible 13-ag0xxx also needs a quirk
> > so I'm going to use this to cover both:
> > DMI_EXACT_MATCH(DMI_SYS_VENDOR, "HP")
> > DMI_MATCH(DMI_PRODUCT_NAME, "HP ENVY x360 Convertible 13-")
> 
> You might want to add an additional check for the panel name/vendor
> from the EDID as well in case HP uses multiple panels from different
> vendors on that system.

Hello,

thank you for this feedback.

I agree it would be nice to have this additional check but I'm not sure
if there is an easy way to do this.

I don't think we can add this to the EDID quirk table in drm_edid.c as
we also need to store the value for backlight min_input_signal.
There might also be different laptop manufacturers using the same panel
which only one of them needs a quirk or both of them might need a quirk
but with different value. Or there also might be more devices with the
same DMI but different panels where each panel needs a quirk with
different value.

So it seems if we want to cover all possible situations we need a nested
quirk tables for this. One main table for DMI matches where each record
would contain another table for EDID matches.

Then there's also a question of how to obtain the EDID.
The most simple and straightforward approach seems to be getting the
EDID vendor/product identification from dc_edid_caps. But this seems to
be going completely against the goal 10. in display/TODO.

So another approach I'm considering is to use drm_edid_get_panel_id but
for that we would need a pointer to i2c_adapter for the corresponding
backlight_link. Which I think is currently only available via
amdgpu_dm_connector which from dc_link is only accessible via void
*priv. Which seems like something that shouldn't be touched here.

So overall I don't know what would be the best way to implement this.
It also seems too complex I'm not even sure if it's worth the trouble
and maybe just hoping there won't be any two devices with the same DMI
but different EDID which only one of them would need a quirk while the
other would break with it might seem more reasonable.

Or maybe I'm missing something?
Please let me know what you think.

Filip

> 
> Alex
> 
> >
> > So far it seems to be working fine.
> > I'll send this in v2 once I do some final tweaks and do more tests.
> >
> > [1] https://bugzilla.kernel.org/show_bug.cgi?id=203439#c5
> >
> > Filip
> >
> >
> > V Mon, Oct 31, 2022 at 11:36:09AM -0400, Alex Deucher napsal(a):
> > > On Sun, Oct 30, 2022 at 5:26 AM Filip Moc <dev@moc6.cz> wrote:
> > > >
> > > > There are some devices on which amdgpu won't allow user to set brightness
> > > > to sufficiently low values even though the hardware would support it just
> > > > fine.
> > > >
> > > > This usually happens in two cases when either configuration of brightness
> > > > levels via ACPI/ATIF is not available and amdgpu falls back to defaults
> > > > (currently 12 for minimum level) which may be too high for some devices or
> > > > even the configuration via ATIF is available but the minimum brightness
> > > > level provided by the manufacturer is set to unreasonably high value.
> > > >
> > > > In either case user can use this new module parameter to adjust the
> > > > minimum allowed backlight brightness level.
> > > >
> > > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=203439
> > > > Signed-off-by: Filip Moc <dev@moc6.cz>
> > >
> > > Does your system require an override and if so, what is it?  It would
> > > be good to add a quirk for your system as well so that other users of
> > > the same system wouldn't need to manually figure out an apply the
> > > settings.
> > >
> > > Alex
> > >
> > >
> > > > ---
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu.h               |  3 +++
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c           | 15 +++++++++++++++
> > > >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 15 +++++++++++++++
> > > >  3 files changed, 33 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > > > index 0e6ddf05c23c..c5445402c49d 100644
> > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > > > @@ -200,6 +200,9 @@ extern uint amdgpu_dc_debug_mask;
> > > >  extern uint amdgpu_dc_visual_confirm;
> > > >  extern uint amdgpu_dm_abm_level;
> > > >  extern int amdgpu_backlight;
> > > > +#ifdef CONFIG_DRM_AMD_DC
> > > > +extern int amdgpu_backlight_override_min[];
> > > > +#endif
> > > >  extern struct amdgpu_mgpu_info mgpu_info;
> > > >  extern int amdgpu_ras_enable;
> > > >  extern uint amdgpu_ras_mask;
> > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > > index 16f6a313335e..f2fb549ac52f 100644
> > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > > @@ -43,6 +43,7 @@
> > > >  #include "amdgpu_irq.h"
> > > >  #include "amdgpu_dma_buf.h"
> > > >  #include "amdgpu_sched.h"
> > > > +#include "amdgpu_dm.h"
> > > >  #include "amdgpu_fdinfo.h"
> > > >  #include "amdgpu_amdkfd.h"
> > > >
> > > > @@ -853,6 +854,20 @@ int amdgpu_backlight = -1;
> > > >  MODULE_PARM_DESC(backlight, "Backlight control (0 = pwm, 1 = aux, -1 auto (default))");
> > > >  module_param_named(backlight, amdgpu_backlight, bint, 0444);
> > > >
> > > > +/**
> > > > + * DOC: backlight_min (array of int)
> > > > + * Override minimum allowed backlight brightness signal (per display).
> > > > + * Must be less than the maximum brightness signal.
> > > > + * Negative value means no override.
> > > > + *
> > > > + * Defaults to all -1 (no override on any display).
> > > > + */
> > > > +#ifdef CONFIG_DRM_AMD_DC
> > > > +int amdgpu_backlight_override_min[AMDGPU_DM_MAX_NUM_EDP] = {[0 ... (AMDGPU_DM_MAX_NUM_EDP-1)] = -1};
> > > > +MODULE_PARM_DESC(backlight_min, "Override minimum backlight brightness signal (0..max-1, -1 = no override (default))");
> > > > +module_param_array_named(backlight_min, amdgpu_backlight_override_min, int, NULL, 0444);
> > > > +#endif
> > > > +
> > > >  /**
> > > >   * DOC: tmz (int)
> > > >   * Trusted Memory Zone (TMZ) is a method to protect data being written
> > > > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > > index eb4ce7216104..e2c36ba93d05 100644
> > > > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > > @@ -3911,6 +3911,21 @@ static void amdgpu_dm_update_backlight_caps(struct amdgpu_display_manager *dm,
> > > >         dm->backlight_caps[bl_idx].min_input_signal = AMDGPU_DM_DEFAULT_MIN_BACKLIGHT;
> > > >         dm->backlight_caps[bl_idx].max_input_signal = AMDGPU_DM_DEFAULT_MAX_BACKLIGHT;
> > > >  #endif
> > > > +
> > > > +       if (amdgpu_backlight_override_min[bl_idx] >= 0) {
> > > > +               if (amdgpu_backlight_override_min[bl_idx] < dm->backlight_caps[bl_idx].max_input_signal) {
> > > > +                       DRM_INFO("amdgpu: backlight[%i]: overriding minimum brightness from %i to %i\n",
> > > > +                                 bl_idx,
> > > > +                                 dm->backlight_caps[bl_idx].min_input_signal,
> > > > +                                 amdgpu_backlight_override_min[bl_idx]);
> > > > +                       dm->backlight_caps[bl_idx].min_input_signal = amdgpu_backlight_override_min[bl_idx];
> > > > +               } else {
> > > > +                       DRM_ERROR("amdgpu: backlight[%i]: minimum brightness override (%i) is not below maximum (%i)\n",
> > > > +                                 bl_idx,
> > > > +                                 amdgpu_backlight_override_min[bl_idx],
> > > > +                                 dm->backlight_caps[bl_idx].max_input_signal);
> > > > +               }
> > > > +       }
> > > >  }
> > > >
> > > >  static int get_brightness_range(const struct amdgpu_dm_backlight_caps *caps,
> > > >
> > > > base-commit: d8c03bfe146fd5e081a252cd34f3f12ca0255357
> > > > --
> > > > 2.30.2
> > > >
