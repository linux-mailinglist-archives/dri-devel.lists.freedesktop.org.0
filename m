Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B92C614ED2
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 17:07:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD32F10E3F6;
	Tue,  1 Nov 2022 16:07:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDFBD10E3F6;
 Tue,  1 Nov 2022 16:07:08 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id p127so16337415oih.9;
 Tue, 01 Nov 2022 09:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EIvCsNcYvM6/Hsp4ajqEM/CHCcHllUHTLyim4Fdl4PQ=;
 b=Ci/4R5cjQS65fqeKJcqsOF3dXNAO9yGdtsYGsGuG6ITYtLKDGXMZ+E54KSHs0x7TFv
 AAt7wWNEhTv6+eFgud0NrPs20ruzTbW0a65k7xxqrQ2iazFb3wG/04dj4shaKnfB+X3c
 0W7nqGmDY+1Of3QtcY0DIcn72+gfYv5iuT0FN/65X4wLMhn1DM6ekTf53yVhcrqlbbiM
 lUoUVdaxThUqrBLHofdXdYett/2k9bUeau5FO/gxqqU2OSXusZrFV5cYl64o8YUSCFZE
 HWZZvC0OqfyAs2cOVBTyB19AMA0p3pFhXBNzxo+1DbQfF441S0eUWU+LocCKAIEEt8HN
 wMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EIvCsNcYvM6/Hsp4ajqEM/CHCcHllUHTLyim4Fdl4PQ=;
 b=B32rd29WhkLR9X8XQkIXu++CpklU3m/61Io3PZz5N4OJ/WJ6zqL0h0qvUPq66astf2
 sOy72zrCVwWnRnVIRDQzC71h9wXQrGE4PBW+QWEgdbEzsknPmtZ90j8J58AGScrTgXz/
 YeG4nUueRhnqJvMYLKCBUAuSL887qmWnI5DlggqAVI0zjR9IweIB8XFekfRl+A0wyGAg
 aJDp9xrEH7SgaPSyihMm5CVgX5QFuPw+cD47vSA0CjuE4AkV+F3i1GAQgscVW6rDIGcJ
 7xse7iTkpBFs7izPENgsiDkqxzLEmkXGdCX9ntfDrKhwmy2xtRN57OK3WWxneaY8In5v
 lp0w==
X-Gm-Message-State: ACrzQf3siFktrGdFgD16NnkLfYrjWWFSc+2zIqv6RIZpedIwBpD/lkk+
 +LEVqMmWRNPQqQnDdI1ca7cR9NHtivgz3Ixdp30=
X-Google-Smtp-Source: AMsMyM7IKs5sFOzl9MgowQZ6B6fZPiPbgU9kAYR7sXxyETzysb5DoDPacdLtQlROr5xf93oUsQpLNIX+OX7pDz2Y1zU=
X-Received: by 2002:a05:6808:14d2:b0:354:c733:abd3 with SMTP id
 f18-20020a05680814d200b00354c733abd3mr10488249oiw.96.1667318828044; Tue, 01
 Nov 2022 09:07:08 -0700 (PDT)
MIME-Version: 1.0
References: <Y117XNaSP6/8bH+3@moc6.cz>
 <CADnq5_Muegi+dvmrg5U=Cau_oeXQFjv_h2Pdn_j9AG0mRgE4=g@mail.gmail.com>
 <Y2E+XUEPbQn2tMt+@moc6.cz>
In-Reply-To: <Y2E+XUEPbQn2tMt+@moc6.cz>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 1 Nov 2022 12:06:55 -0400
Message-ID: <CADnq5_PmwiOecVqfpy17V4viYA5wt8WbEDOFPo70VSdmGTjOew@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: add parameter backlight_min
To: Filip Moc <dev@moc6.cz>
Content-Type: text/plain; charset="UTF-8"
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
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 1, 2022 at 11:42 AM Filip Moc <dev@moc6.cz> wrote:
>
> Hello Alex,
>
> thank you for your response.
>
> Yes, I have HP ENVY x360 Convertible 13-ay1xxx, and backlight_min=2
> seems to work the best in my case.
>
> I added a dmi based quirk table. So far with support only for display 0
> to make it simple. Support for more displays in quirk table can be added
> later if ever needed.
>
> According to [1] HP ENVY x360 Convertible 13-ag0xxx also needs a quirk
> so I'm going to use this to cover both:
> DMI_EXACT_MATCH(DMI_SYS_VENDOR, "HP")
> DMI_MATCH(DMI_PRODUCT_NAME, "HP ENVY x360 Convertible 13-")

You might want to add an additional check for the panel name/vendor
from the EDID as well in case HP uses multiple panels from different
vendors on that system.

Alex

>
> So far it seems to be working fine.
> I'll send this in v2 once I do some final tweaks and do more tests.
>
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=203439#c5
>
> Filip
>
>
> V Mon, Oct 31, 2022 at 11:36:09AM -0400, Alex Deucher napsal(a):
> > On Sun, Oct 30, 2022 at 5:26 AM Filip Moc <dev@moc6.cz> wrote:
> > >
> > > There are some devices on which amdgpu won't allow user to set brightness
> > > to sufficiently low values even though the hardware would support it just
> > > fine.
> > >
> > > This usually happens in two cases when either configuration of brightness
> > > levels via ACPI/ATIF is not available and amdgpu falls back to defaults
> > > (currently 12 for minimum level) which may be too high for some devices or
> > > even the configuration via ATIF is available but the minimum brightness
> > > level provided by the manufacturer is set to unreasonably high value.
> > >
> > > In either case user can use this new module parameter to adjust the
> > > minimum allowed backlight brightness level.
> > >
> > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=203439
> > > Signed-off-by: Filip Moc <dev@moc6.cz>
> >
> > Does your system require an override and if so, what is it?  It would
> > be good to add a quirk for your system as well so that other users of
> > the same system wouldn't need to manually figure out an apply the
> > settings.
> >
> > Alex
> >
> >
> > > ---
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu.h               |  3 +++
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c           | 15 +++++++++++++++
> > >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 15 +++++++++++++++
> > >  3 files changed, 33 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > > index 0e6ddf05c23c..c5445402c49d 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > > @@ -200,6 +200,9 @@ extern uint amdgpu_dc_debug_mask;
> > >  extern uint amdgpu_dc_visual_confirm;
> > >  extern uint amdgpu_dm_abm_level;
> > >  extern int amdgpu_backlight;
> > > +#ifdef CONFIG_DRM_AMD_DC
> > > +extern int amdgpu_backlight_override_min[];
> > > +#endif
> > >  extern struct amdgpu_mgpu_info mgpu_info;
> > >  extern int amdgpu_ras_enable;
> > >  extern uint amdgpu_ras_mask;
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > index 16f6a313335e..f2fb549ac52f 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > @@ -43,6 +43,7 @@
> > >  #include "amdgpu_irq.h"
> > >  #include "amdgpu_dma_buf.h"
> > >  #include "amdgpu_sched.h"
> > > +#include "amdgpu_dm.h"
> > >  #include "amdgpu_fdinfo.h"
> > >  #include "amdgpu_amdkfd.h"
> > >
> > > @@ -853,6 +854,20 @@ int amdgpu_backlight = -1;
> > >  MODULE_PARM_DESC(backlight, "Backlight control (0 = pwm, 1 = aux, -1 auto (default))");
> > >  module_param_named(backlight, amdgpu_backlight, bint, 0444);
> > >
> > > +/**
> > > + * DOC: backlight_min (array of int)
> > > + * Override minimum allowed backlight brightness signal (per display).
> > > + * Must be less than the maximum brightness signal.
> > > + * Negative value means no override.
> > > + *
> > > + * Defaults to all -1 (no override on any display).
> > > + */
> > > +#ifdef CONFIG_DRM_AMD_DC
> > > +int amdgpu_backlight_override_min[AMDGPU_DM_MAX_NUM_EDP] = {[0 ... (AMDGPU_DM_MAX_NUM_EDP-1)] = -1};
> > > +MODULE_PARM_DESC(backlight_min, "Override minimum backlight brightness signal (0..max-1, -1 = no override (default))");
> > > +module_param_array_named(backlight_min, amdgpu_backlight_override_min, int, NULL, 0444);
> > > +#endif
> > > +
> > >  /**
> > >   * DOC: tmz (int)
> > >   * Trusted Memory Zone (TMZ) is a method to protect data being written
> > > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > index eb4ce7216104..e2c36ba93d05 100644
> > > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > @@ -3911,6 +3911,21 @@ static void amdgpu_dm_update_backlight_caps(struct amdgpu_display_manager *dm,
> > >         dm->backlight_caps[bl_idx].min_input_signal = AMDGPU_DM_DEFAULT_MIN_BACKLIGHT;
> > >         dm->backlight_caps[bl_idx].max_input_signal = AMDGPU_DM_DEFAULT_MAX_BACKLIGHT;
> > >  #endif
> > > +
> > > +       if (amdgpu_backlight_override_min[bl_idx] >= 0) {
> > > +               if (amdgpu_backlight_override_min[bl_idx] < dm->backlight_caps[bl_idx].max_input_signal) {
> > > +                       DRM_INFO("amdgpu: backlight[%i]: overriding minimum brightness from %i to %i\n",
> > > +                                 bl_idx,
> > > +                                 dm->backlight_caps[bl_idx].min_input_signal,
> > > +                                 amdgpu_backlight_override_min[bl_idx]);
> > > +                       dm->backlight_caps[bl_idx].min_input_signal = amdgpu_backlight_override_min[bl_idx];
> > > +               } else {
> > > +                       DRM_ERROR("amdgpu: backlight[%i]: minimum brightness override (%i) is not below maximum (%i)\n",
> > > +                                 bl_idx,
> > > +                                 amdgpu_backlight_override_min[bl_idx],
> > > +                                 dm->backlight_caps[bl_idx].max_input_signal);
> > > +               }
> > > +       }
> > >  }
> > >
> > >  static int get_brightness_range(const struct amdgpu_dm_backlight_caps *caps,
> > >
> > > base-commit: d8c03bfe146fd5e081a252cd34f3f12ca0255357
> > > --
> > > 2.30.2
> > >
