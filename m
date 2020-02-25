Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB88B16EDEA
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 19:23:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D34E66EB85;
	Tue, 25 Feb 2020 18:23:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF8C86EB79;
 Tue, 25 Feb 2020 18:23:25 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l5so11701199wrx.4;
 Tue, 25 Feb 2020 10:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RrgJrycb0YweQ4EliuCsEKdg0YCfjVqN83SXNsnKBCA=;
 b=SavYq66qvozBYE7U3JgVIyekkkaqTihP2JmAdBEP7dmj0wRQQ9PpfbltsdxiVeZ61z
 HpEtMu8EJr6EOS32QmB6PMkIGJ4WKfIjMmfohyrPyjG5lXUN7yZKY84DlDYMzKL0BdqT
 1o4ir2E1VvnuaSspT65t9qYD1MhQQApAkLKYiHjdmnfj4mJWSoiPNKlf4eHhu42mMMZq
 eJy/eagmkiFvugbYN1IJ0Lt+JN3J3TPpPsmw7yDfWbwEI6+QH8ekRdoJFDX5IveK48oV
 6q/CV38VlRv9zvqQd3umvQTkrZncs+74TzF6ukJ6ko/sEHgcanXs5/syzP0Xax3pEjc/
 EEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RrgJrycb0YweQ4EliuCsEKdg0YCfjVqN83SXNsnKBCA=;
 b=r6qBRvvFB1lT1y6OjgI7+cvHXr/tJ2fDK3psI9lqNLm47Jn2gpV5jyn8CmYmCdEWvH
 Ewbdy3s1Z1RZggZv9ZDKNgF3iqb9LWrb/vr2fiKQnyTnC9ZpJpZGnetjE2NVyeSxVpiI
 85mUVk9KSOnQH7tVOSnU52lJVDCliYIXfg0v/kxFPmkJ5NV8u+NBe8xkCQCX+Pqr8Ihc
 dskTBygu6EeUUXBy9Yfp9yS2C41NEa2gkD8sl/TBEd6kgs83++aNlIasl6KZwPSYV/mY
 M4BxTZeytTX9mg8HkX0IRzBPOkR6Jhynve5zY7r0AOvR+3G3HIrqP3a+GaJu3gHaTFDO
 Q7TQ==
X-Gm-Message-State: APjAAAXyTg9QffGeXpIDY7M1oamX+6ITSXNsnLs/bM1UjUmOJ/uqjVhl
 3LGS08vS9gFBSF8Hdt+cNOOGIcwdnOp/YbVdvp5H/w==
X-Google-Smtp-Source: APXvYqyZCd8M2M2zJJpHFAONBqsCCCwCiUv1NQSf5nsBwykG7M7QHzuceduFqjTYvaTDjeDjjzydu/aO/5QYkrRj2Pk=
X-Received: by 2002:adf:b254:: with SMTP id y20mr425320wra.362.1582655004517; 
 Tue, 25 Feb 2020 10:23:24 -0800 (PST)
MIME-Version: 1.0
References: <20200207211713.3870-1-alexander.deucher@amd.com>
 <22cf2c92-52a0-5e1a-e569-4fe421e38022@amd.com>
 <CADnq5_M9yngJYmhOKiUvpR0H-e5yoVOrqwoim+_Ps63wY3QsRg@mail.gmail.com>
 <DM5PR1201MB2554BBEA6B0C7DECFFE8DD3E9EED0@DM5PR1201MB2554.namprd12.prod.outlook.com>
 <DM5PR1201MB2554768A51B1A4625E67BB899EED0@DM5PR1201MB2554.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR1201MB2554768A51B1A4625E67BB899EED0@DM5PR1201MB2554.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 25 Feb 2020 13:23:13 -0500
Message-ID: <CADnq5_M8Hb9YJ-cVzr0x8ABUpQjeL5DwOuCwjEWfdTXFJdbGeQ@mail.gmail.com>
Subject: Re: [PATCH 13/15] drm/amdgpu/display: split dp connector registration
 (v3)
To: "Liu, Zhan" <Zhan.Liu@amd.com>
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
Cc: "Broadworth, Mark" <Mark.Broadworth@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Zuo,
 Jerry" <Jerry.Zuo@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 25, 2020 at 1:20 PM Liu, Zhan <Zhan.Liu@amd.com> wrote:
>
>
> > -----Original Message-----
> > From: Liu, Zhan
> > Sent: 2020/February/25, Tuesday 10:10 AM
> > To: Alex Deucher <alexdeucher@gmail.com>; Wentland, Harry
> > <Harry.Wentland@amd.com>
> > Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>; Maling list - DRI
> > developers <dri-devel@lists.freedesktop.org>; Deucher, Alexander
> > <Alexander.Deucher@amd.com>; Broadworth, Mark
> > <Mark.Broadworth@amd.com>
> > Subject: RE: [PATCH 13/15] drm/amdgpu/display: split dp connector
> > registration (v3)
> >
> >
> > > -----Original Message-----
> > > From: Alex Deucher <alexdeucher@gmail.com>
> > > Sent: 2020/February/25, Tuesday 9:07 AM
> > > To: Wentland, Harry <Harry.Wentland@amd.com>
> > > Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>; Maling list - DRI
> > > developers <dri-devel@lists.freedesktop.org>; Deucher, Alexander
> > > <Alexander.Deucher@amd.com>; Broadworth, Mark
> > > <Mark.Broadworth@amd.com>; Liu, Zhan <Zhan.Liu@amd.com>
> > > Subject: Re: [PATCH 13/15] drm/amdgpu/display: split dp connector
> > > registration (v3)
> > >
> > > On Mon, Feb 24, 2020 at 4:09 PM Harry Wentland <hwentlan@amd.com>
> > > wrote:
> > > >
> > > > On 2020-02-07 4:17 p.m., Alex Deucher wrote:
> > > > > Split into init and register functions to avoid a segfault in some
> > > > > configs when the load/unload callbacks are removed.
> > > > >
> > > >
> > > > Looks like MST is completely broken with this change with a NULL
> > > > pointer dereference in drm_dp_aux_register.
> > > >
> > > > > v2:
> > > > > - add back accidently dropped has_aux setting
> > > > > - set dev in late_register
> > > > >
> > > > > v3:
> > > > > - fix dp cec ordering
> > > > >
> > > > > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > > > > ---
> > > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c   | 16
> > > ++++++++++++++++
> > > > >  drivers/gpu/drm/amd/amdgpu/atombios_dp.c         | 10 ++--------
> > > > >  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c  |  7 ++++++-
> > > > >  3 files changed, 24 insertions(+), 9 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> > > > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> > > > > index ec1501e3a63a..f355d9a752d2 100644
> > > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> > > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> > > > > @@ -1461,6 +1461,20 @@ static enum drm_mode_status
> > > amdgpu_connector_dp_mode_valid(struct drm_connector
> > > > >       return MODE_OK;
> > > > >  }
> > > > >
> > > > > +static int
> > > > > +amdgpu_connector_late_register(struct drm_connector *connector) {
> > > > > +     struct amdgpu_connector *amdgpu_connector =
> > > to_amdgpu_connector(connector);
> > > > > +     int r = 0;
> > > > > +
> > > > > +     if (amdgpu_connector->ddc_bus->has_aux) {
> > > > > +             amdgpu_connector->ddc_bus->aux.dev =
> > > > > + amdgpu_connector-
> > > >base.kdev;
> > > > > +             r = drm_dp_aux_register(&amdgpu_connector->ddc_bus->aux);
> > > > > +     }
> > > > > +
> > > > > +     return r;
> > > > > +}
> > > > > +
> > > > >  static const struct drm_connector_helper_funcs
> > > amdgpu_connector_dp_helper_funcs = {
> > > > >       .get_modes = amdgpu_connector_dp_get_modes,
> > > > >       .mode_valid = amdgpu_connector_dp_mode_valid, @@ -1475,6
> > > > > +1489,7 @@ static const struct drm_connector_funcs
> > > amdgpu_connector_dp_funcs = {
> > > > >       .early_unregister = amdgpu_connector_unregister,
> > > > >       .destroy = amdgpu_connector_destroy,
> > > > >       .force = amdgpu_connector_dvi_force,
> > > > > +     .late_register = amdgpu_connector_late_register,
> > > > >  };
> > > > >
> > > > >  static const struct drm_connector_funcs
> > > > > amdgpu_connector_edp_funcs = { @@ -1485,6 +1500,7 @@ static
> > const
> > > > > struct drm_connector_funcs
> > > amdgpu_connector_edp_funcs = {
> > > > >       .early_unregister = amdgpu_connector_unregister,
> > > > >       .destroy = amdgpu_connector_destroy,
> > > > >       .force = amdgpu_connector_dvi_force,
> > > > > +     .late_register = amdgpu_connector_late_register,
> > > > >  };
> > > > >
> > > > >  void
> > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> > > > > b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> > > > > index ea702a64f807..9b74cfdba7b8 100644
> > > > > --- a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> > > > > +++ b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> > > > > @@ -186,16 +186,10 @@ amdgpu_atombios_dp_aux_transfer(struct
> > > > > drm_dp_aux *aux, struct drm_dp_aux_msg *m
> > > > >
> > > > >  void amdgpu_atombios_dp_aux_init(struct amdgpu_connector
> > > > > *amdgpu_connector)  {
> > > > > -     int ret;
> > > > > -
> > > > >       amdgpu_connector->ddc_bus->rec.hpd = amdgpu_connector-
> > > >hpd.hpd;
> > > > > -     amdgpu_connector->ddc_bus->aux.dev = amdgpu_connector-
> > > >base.kdev;
> > > > >       amdgpu_connector->ddc_bus->aux.transfer =
> > > amdgpu_atombios_dp_aux_transfer;
> > > > > -     ret = drm_dp_aux_register(&amdgpu_connector->ddc_bus->aux);
> > > > > -     if (!ret)
> > > > > -             amdgpu_connector->ddc_bus->has_aux = true;
> > > > > -
> > > > > -     WARN(ret, "drm_dp_aux_register_i2c_bus() failed with error %d\n",
> > > ret);
> > > > > +     drm_dp_aux_init(&amdgpu_connector->ddc_bus->aux);
> > > > > +     amdgpu_connector->ddc_bus->has_aux = true;
> > > > >  }
> > > > >
> > > > >  /***** general DP utility functions *****/ diff --git
> > > > > a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > > > > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > > > > index 3959c942c88b..d5b9e72f2649 100644
> > > > > ---
> > > a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > > > > +++
> > > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > > > > @@ -155,6 +155,11 @@
> > > amdgpu_dm_mst_connector_late_register(struct drm_connector
> > > *connector)
> > > > >       struct amdgpu_dm_connector *amdgpu_dm_connector =
> > > > >               to_amdgpu_dm_connector(connector);
> > > > >       struct drm_dp_mst_port *port = amdgpu_dm_connector->port;
> > > > > +     int r;
> > > > > +
> > > > > +     r =
> > > > > + drm_dp_aux_register(&amdgpu_dm_connector->dm_dp_aux.aux);
> > > >
> > > > This calls drm_dp_aux_register_devnode which is also called later in
> > > > drm_dp_mst_connector_late_register. Wonder if that's a problem.
> > >
> > > Does this patch help?  I'm not too familiar with the MST code and I
> > > don't have an MST monitor.
> >
> > I have an MST monitor and I can give it a spin. I'll get back to you later.
>
> + Jerry who is following up on this issue
>
> Thank you Alex for your patch. Unfortunately, it doesn't solve the issue.
>
> Jerry is following up on this ticket, and I've added him to this email thread.

Can you send me the full dmesg output?  Also, does it happen as soon
as the driver loads or sometime later?

Alex


>
> Zhan
>
> >
> > Zhan
> >
> > >
> > > Alex
> > >
> > >
> > > >
> > > > Harry
> > > >
> > > > > +     if (r)
> > > > > +             return r;
> > > > >
> > > > >  #if defined(CONFIG_DEBUG_FS)
> > > > >       connector_debugfs_init(amdgpu_dm_connector);
> > > > > @@ -484,7 +489,7 @@ void
> > amdgpu_dm_initialize_dp_connector(struct
> > > amdgpu_display_manager *dm,
> > > > >       aconnector->dm_dp_aux.aux.transfer = dm_dp_aux_transfer;
> > > > >       aconnector->dm_dp_aux.ddc_service =
> > > > > aconnector->dc_link->ddc;
> > > > >
> > > > > -     drm_dp_aux_register(&aconnector->dm_dp_aux.aux);
> > > > > +     drm_dp_aux_init(&aconnector->dm_dp_aux.aux);
> > > > >       drm_dp_cec_register_connector(&aconnector->dm_dp_aux.aux,
> > > > >                                     &aconnector->base);
> > > > >
> > > > >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
