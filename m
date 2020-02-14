Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D0315EE42
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 18:39:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA7446E84E;
	Fri, 14 Feb 2020 17:39:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB2C6E844;
 Fri, 14 Feb 2020 17:39:35 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id w12so11851378wrt.2;
 Fri, 14 Feb 2020 09:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bte11p+wOVOSyBrU3boIKYYh2BkoJsgyY9yiFk+InQs=;
 b=dEBSDlpOm2N/KBrRwbncb15EKiJ97NpJ1KW0+gUJ42S+ivalVG55oTaHWnS1Q1YCsC
 Nhm9Tzhs8VE6Ep6XV5AnTGUUmdFrR3K6uPMzjuNcOu5ylEQ6gYZwmsaXzKbdUFTy2Tj2
 W5qJ/JZBZTZdZOXINTjsO8THFFshyyaZUwmrmsQyvrk9rZp1KtiFMMKcCWXAI3a8OqUk
 5LItHAkln/aegso6MFRmF30Gbo0spc1b49fdVpgjHOZTw9BX8YcZ3oyhqhf8E3z4M3UZ
 8Rq32rUzYmvUlYCxYegGE1xl70lglAypCO4nchoNCK+NB3IP4GyvFXb/TzgsOGk2O6lG
 7JsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bte11p+wOVOSyBrU3boIKYYh2BkoJsgyY9yiFk+InQs=;
 b=GkPk5JAFqAs0gxw//C1Ywpl9wLY+tI9f92cU0nu4dWl8VeC2rrTzeHTHhvSeFf3zyO
 0jVXTWCBugbJNR1jMD2GtIfmxESLQSQQHm7rTDY9SqjnLUEdSvZLaEO2JZXZl2p+8XM1
 /Ls28MnI8zxXjjY6Q2kM9YEqlcNmaG1jF/NafBuEBDYvkxE2P3tQfBfNeQJLkxtoW7sn
 h2A9dvwdq6ITTivMrgC67fY3pumq2AaQh9HpUzuu9eF6JRz4U/JwEoUXwjias763hM7g
 CmdwWPGeH0x2DZMj9NaA0dU/Ma6Hv1Ot+1g8ek63FzmQizW3uFJIRK0IZXf8FVTA3Ko/
 LpHQ==
X-Gm-Message-State: APjAAAV8em35P0zC3FvDdZPqzKtNMPi6Hno52g+ZjzWlTkgAqZMQqWnL
 +uYAR8pJyqQ9I9Y3R3mMNdrBOvYvU4WF1D4FPT8=
X-Google-Smtp-Source: APXvYqwCncdX5iA8CcaeLdeaukSdZLLC+cVkkgLU7FbDd+iYnxiMUWCwmDSt/Sd2K+7GzB/vJamYnkA0aQgt2MCYXvo=
X-Received: by 2002:adf:b254:: with SMTP id y20mr5033292wra.362.1581701973743; 
 Fri, 14 Feb 2020 09:39:33 -0800 (PST)
MIME-Version: 1.0
References: <20200207211713.3870-1-alexander.deucher@amd.com>
 <20200214073934.GV2363188@phenom.ffwll.local>
In-Reply-To: <20200214073934.GV2363188@phenom.ffwll.local>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 14 Feb 2020 12:39:22 -0500
Message-ID: <CADnq5_PW7QwUk6TdaWiY3i=udua1REkw0HDQZ3eBwk4Xg24OSg@mail.gmail.com>
Subject: Re: [PATCH 13/15] drm/amdgpu/display: split dp connector registration
 (v3)
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 14, 2020 at 2:39 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, Feb 07, 2020 at 04:17:13PM -0500, Alex Deucher wrote:
> > Split into init and register functions to avoid a segfault
> > in some configs when the load/unload callbacks are removed.
> >
> > v2:
> > - add back accidently dropped has_aux setting
> > - set dev in late_register
> >
> > v3:
> > - fix dp cec ordering
>
> Why did you move this back out of the late_register callback when going
> from v2->v3? In i915 we register the cec stuff from ->late_register, like

I got a bunch of complaints from the cec code when I had it switched
the other way.  They went away when I moved it back.  I don't remember
the exact messages off hand.

Alex

> anything else userspace visible. Maybe follow-up patch (the idea behind
> removing the ->load callback is to close all the driver load races,
> instead of only open("/dev/dri/0"), which is protected by
> drm_global_mutex). On this:
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> Cheers, Daniel
>
> >
> > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c   | 16 ++++++++++++++++
> >  drivers/gpu/drm/amd/amdgpu/atombios_dp.c         | 10 ++--------
> >  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c  |  7 ++++++-
> >  3 files changed, 24 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> > index ec1501e3a63a..f355d9a752d2 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> > @@ -1461,6 +1461,20 @@ static enum drm_mode_status amdgpu_connector_dp_mode_valid(struct drm_connector
> >       return MODE_OK;
> >  }
> >
> > +static int
> > +amdgpu_connector_late_register(struct drm_connector *connector)
> > +{
> > +     struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
> > +     int r = 0;
> > +
> > +     if (amdgpu_connector->ddc_bus->has_aux) {
> > +             amdgpu_connector->ddc_bus->aux.dev = amdgpu_connector->base.kdev;
> > +             r = drm_dp_aux_register(&amdgpu_connector->ddc_bus->aux);
> > +     }
> > +
> > +     return r;
> > +}
> > +
> >  static const struct drm_connector_helper_funcs amdgpu_connector_dp_helper_funcs = {
> >       .get_modes = amdgpu_connector_dp_get_modes,
> >       .mode_valid = amdgpu_connector_dp_mode_valid,
> > @@ -1475,6 +1489,7 @@ static const struct drm_connector_funcs amdgpu_connector_dp_funcs = {
> >       .early_unregister = amdgpu_connector_unregister,
> >       .destroy = amdgpu_connector_destroy,
> >       .force = amdgpu_connector_dvi_force,
> > +     .late_register = amdgpu_connector_late_register,
> >  };
> >
> >  static const struct drm_connector_funcs amdgpu_connector_edp_funcs = {
> > @@ -1485,6 +1500,7 @@ static const struct drm_connector_funcs amdgpu_connector_edp_funcs = {
> >       .early_unregister = amdgpu_connector_unregister,
> >       .destroy = amdgpu_connector_destroy,
> >       .force = amdgpu_connector_dvi_force,
> > +     .late_register = amdgpu_connector_late_register,
> >  };
> >
> >  void
> > diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> > index ea702a64f807..9b74cfdba7b8 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> > @@ -186,16 +186,10 @@ amdgpu_atombios_dp_aux_transfer(struct drm_dp_aux *aux, struct drm_dp_aux_msg *m
> >
> >  void amdgpu_atombios_dp_aux_init(struct amdgpu_connector *amdgpu_connector)
> >  {
> > -     int ret;
> > -
> >       amdgpu_connector->ddc_bus->rec.hpd = amdgpu_connector->hpd.hpd;
> > -     amdgpu_connector->ddc_bus->aux.dev = amdgpu_connector->base.kdev;
> >       amdgpu_connector->ddc_bus->aux.transfer = amdgpu_atombios_dp_aux_transfer;
> > -     ret = drm_dp_aux_register(&amdgpu_connector->ddc_bus->aux);
> > -     if (!ret)
> > -             amdgpu_connector->ddc_bus->has_aux = true;
> > -
> > -     WARN(ret, "drm_dp_aux_register_i2c_bus() failed with error %d\n", ret);
> > +     drm_dp_aux_init(&amdgpu_connector->ddc_bus->aux);
> > +     amdgpu_connector->ddc_bus->has_aux = true;
> >  }
> >
> >  /***** general DP utility functions *****/
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > index 3959c942c88b..d5b9e72f2649 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > @@ -155,6 +155,11 @@ amdgpu_dm_mst_connector_late_register(struct drm_connector *connector)
> >       struct amdgpu_dm_connector *amdgpu_dm_connector =
> >               to_amdgpu_dm_connector(connector);
> >       struct drm_dp_mst_port *port = amdgpu_dm_connector->port;
> > +     int r;
> > +
> > +     r = drm_dp_aux_register(&amdgpu_dm_connector->dm_dp_aux.aux);
> > +     if (r)
> > +             return r;
> >
> >  #if defined(CONFIG_DEBUG_FS)
> >       connector_debugfs_init(amdgpu_dm_connector);
> > @@ -484,7 +489,7 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
> >       aconnector->dm_dp_aux.aux.transfer = dm_dp_aux_transfer;
> >       aconnector->dm_dp_aux.ddc_service = aconnector->dc_link->ddc;
> >
> > -     drm_dp_aux_register(&aconnector->dm_dp_aux.aux);
> > +     drm_dp_aux_init(&aconnector->dm_dp_aux.aux);
> >       drm_dp_cec_register_connector(&aconnector->dm_dp_aux.aux,
> >                                     &aconnector->base);
> >
> > --
> > 2.24.1
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
