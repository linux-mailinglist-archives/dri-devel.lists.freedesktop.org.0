Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6A11702C5
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 16:40:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 552C96EA8E;
	Wed, 26 Feb 2020 15:40:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2580C6EA8E;
 Wed, 26 Feb 2020 15:40:09 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z3so3623493wru.3;
 Wed, 26 Feb 2020 07:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=P833pLXHgmyM9D19zl3Vnq41Ne7X7FJBpZf+w7HPah0=;
 b=dFm2cyeeY9ZxCgwpA/O50DY1jUQvE/nq5KLQM6/pxsOED4mfywZ01ejjQC4+zbpuv6
 I1peZAlRq42bqWvvzPW7C0Az3ZqsR6KdFkOr1/MUXSeJMaBUwexjfzIOsSNoT2auHA4i
 jou/XpkU7t4hVNDymxV3OGnyN8Ilvu4sgRoOPrYFuy6xkBYC2089hRBRjIzJETkV8XeR
 y1B1Gkea/Z19IkXV2Yu8wLqRS0MaMfjS4Ud9p9diaQ5EbtV1jYfYNGYMPKzZ/mzR3tEX
 chErKge9p9ZrSKdzU7Y2WMVyWoV5AD7a1gjJHSLJ5guniYwY21tOUX1x1a/4wrWpkLOO
 YJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=P833pLXHgmyM9D19zl3Vnq41Ne7X7FJBpZf+w7HPah0=;
 b=jKePkPDBn9NzDgNaPnY6+zCL/FJ4tPRvHPDvDY2NjwTAMDr73ASvpVw6Bpf3LL4oTq
 Q2Ae8nQgchVmqrjFCmWzzSgPtbJhTTBQg0yO+9/ZK/WBfHWUIKimp5jKV+g5P3nD3KbP
 BSTte25zq845sdQdWUkIoy9bsb54P2CFa5s6ex46efu5kk5JeofXGEM99OlxszARW0ZY
 a7hQIyfqd5uQttrIbSnPsjE4yNMwN2eAWRAwFOEYEOouOp3Af5Tx5bNAM0+jIqQPz8lr
 DUraP2Yf1YnWgXuCe3vsUa4n6eEbY+/OWsr97I40RbWzagt7UNlr4Bs2YHDdgJSie+A9
 m1bw==
X-Gm-Message-State: APjAAAUTeG9YF3SYyzGzlFzd87rWBfAc5C2DR1G5fgqqMDmdZwSgAe/d
 8A8fRRmrguRhB05hcIxZG4ejWWbxHa1lzxkZwhI=
X-Google-Smtp-Source: APXvYqwGeaK1z1pUfi9uZTF7CtL+25HkuvKT/ed1h7w5EW7Ef3CTiyI3bUgF5TYK36GYrN2uew6UHnSo2K4np3hK+xo=
X-Received: by 2002:adf:b254:: with SMTP id y20mr6120080wra.362.1582731607776; 
 Wed, 26 Feb 2020 07:40:07 -0800 (PST)
MIME-Version: 1.0
References: <20200207211713.3870-1-alexander.deucher@amd.com>
 <22cf2c92-52a0-5e1a-e569-4fe421e38022@amd.com>
 <CADnq5_M9yngJYmhOKiUvpR0H-e5yoVOrqwoim+_Ps63wY3QsRg@mail.gmail.com>
 <DM5PR1201MB2554BBEA6B0C7DECFFE8DD3E9EED0@DM5PR1201MB2554.namprd12.prod.outlook.com>
 <DM5PR1201MB2554768A51B1A4625E67BB899EED0@DM5PR1201MB2554.namprd12.prod.outlook.com>
 <CADnq5_M8Hb9YJ-cVzr0x8ABUpQjeL5DwOuCwjEWfdTXFJdbGeQ@mail.gmail.com>
 <MN2PR12MB431991DF654BFF4C028DDD46E5ED0@MN2PR12MB4319.namprd12.prod.outlook.com>
 <CADnq5_Mmg9spo_Zb0PEEo-gx4JeAr3meSmjR693iWurH_rw7aw@mail.gmail.com>
 <CADnq5_NmmhXjTo=qVnZR+hua6W6ReNx8fRDqXebgP9KCbdHF3Q@mail.gmail.com>
 <MN2PR12MB4319E90F772888AEC7A1C209E5EA0@MN2PR12MB4319.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB4319E90F772888AEC7A1C209E5EA0@MN2PR12MB4319.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 26 Feb 2020 10:39:56 -0500
Message-ID: <CADnq5_ObmRccE7tiWYi+_skR6XAOqThLS37DH3g6FoGvAUye4w@mail.gmail.com>
Subject: Re: [PATCH 13/15] drm/amdgpu/display: split dp connector registration
 (v3)
To: "Zuo, Jerry" <Jerry.Zuo@amd.com>
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
Cc: "Broadworth, Mark" <Mark.Broadworth@amd.com>, "Liu,
 Zhan" <Zhan.Liu@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 26, 2020 at 10:36 AM Zuo, Jerry <Jerry.Zuo@amd.com> wrote:
>
> [AMD Official Use Only - Internal Distribution Only]
>
> Hi Alex:
>
>      The patch set works. Please let me know when you push the change to drm-next.

Can someone give me and R-b or A-b on the patches?

Thanks,

Alex

>
>      Thanks a lot.
>
> Regards,
> Jerry
>
> -----Original Message-----
> From: Alex Deucher <alexdeucher@gmail.com>
> Sent: February 25, 2020 1:42 PM
> To: Zuo, Jerry <Jerry.Zuo@amd.com>
> Cc: Liu, Zhan <Zhan.Liu@amd.com>; Wentland, Harry <Harry.Wentland@amd.com>; amd-gfx list <amd-gfx@lists.freedesktop.org>; Maling list - DRI developers <dri-devel@lists.freedesktop.org>; Deucher, Alexander <Alexander.Deucher@amd.com>; Broadworth, Mark <Mark.Broadworth@amd.com>
> Subject: Re: [PATCH 13/15] drm/amdgpu/display: split dp connector registration (v3)
>
> On Tue, Feb 25, 2020 at 1:32 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > On Tue, Feb 25, 2020 at 1:30 PM Zuo, Jerry <Jerry.Zuo@amd.com> wrote:
> > >
> > > [AMD Official Use Only - Internal Distribution Only]
> > >
> > > Hi Alex:
> > >
> > >      It happened when a MST monitor is attached, either in driver load or hotplug later.
> >
> > I think I found the issue.  I'll send a patch shortly.
>
> Attaching two patches.  I think patch 1 should fix it.  Patch 2 is the same patch as before.  I'm not sure
> drm_dp_mst_connector_late_register() is necessary since no other driver calls it.
>
> Alex
>
> >
> > Alex
> >
> >
> > >
> > > Regards,
> > > Jerry
> > >
> > > -----Original Message-----
> > > From: Alex Deucher <alexdeucher@gmail.com>
> > > Sent: February 25, 2020 1:23 PM
> > > To: Liu, Zhan <Zhan.Liu@amd.com>
> > > Cc: Wentland, Harry <Harry.Wentland@amd.com>; Zuo, Jerry
> > > <Jerry.Zuo@amd.com>; amd-gfx list <amd-gfx@lists.freedesktop.org>;
> > > Maling list - DRI developers <dri-devel@lists.freedesktop.org>;
> > > Deucher, Alexander <Alexander.Deucher@amd.com>; Broadworth, Mark
> > > <Mark.Broadworth@amd.com>
> > > Subject: Re: [PATCH 13/15] drm/amdgpu/display: split dp connector
> > > registration (v3)
> > >
> > > On Tue, Feb 25, 2020 at 1:20 PM Liu, Zhan <Zhan.Liu@amd.com> wrote:
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Liu, Zhan
> > > > > Sent: 2020/February/25, Tuesday 10:10 AM
> > > > > To: Alex Deucher <alexdeucher@gmail.com>; Wentland, Harry
> > > > > <Harry.Wentland@amd.com>
> > > > > Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>; Maling list -
> > > > > DRI developers <dri-devel@lists.freedesktop.org>; Deucher,
> > > > > Alexander <Alexander.Deucher@amd.com>; Broadworth, Mark
> > > > > <Mark.Broadworth@amd.com>
> > > > > Subject: RE: [PATCH 13/15] drm/amdgpu/display: split dp
> > > > > connector registration (v3)
> > > > >
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Alex Deucher <alexdeucher@gmail.com>
> > > > > > Sent: 2020/February/25, Tuesday 9:07 AM
> > > > > > To: Wentland, Harry <Harry.Wentland@amd.com>
> > > > > > Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>; Maling list
> > > > > > - DRI developers <dri-devel@lists.freedesktop.org>; Deucher,
> > > > > > Alexander <Alexander.Deucher@amd.com>; Broadworth, Mark
> > > > > > <Mark.Broadworth@amd.com>; Liu, Zhan <Zhan.Liu@amd.com>
> > > > > > Subject: Re: [PATCH 13/15] drm/amdgpu/display: split dp
> > > > > > connector registration (v3)
> > > > > >
> > > > > > On Mon, Feb 24, 2020 at 4:09 PM Harry Wentland
> > > > > > <hwentlan@amd.com>
> > > > > > wrote:
> > > > > > >
> > > > > > > On 2020-02-07 4:17 p.m., Alex Deucher wrote:
> > > > > > > > Split into init and register functions to avoid a segfault
> > > > > > > > in some configs when the load/unload callbacks are removed.
> > > > > > > >
> > > > > > >
> > > > > > > Looks like MST is completely broken with this change with a
> > > > > > > NULL pointer dereference in drm_dp_aux_register.
> > > > > > >
> > > > > > > > v2:
> > > > > > > > - add back accidently dropped has_aux setting
> > > > > > > > - set dev in late_register
> > > > > > > >
> > > > > > > > v3:
> > > > > > > > - fix dp cec ordering
> > > > > > > >
> > > > > > > > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > > > > > > > ---
> > > > > > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c   | 16
> > > > > > ++++++++++++++++
> > > > > > > >  drivers/gpu/drm/amd/amdgpu/atombios_dp.c         | 10 ++--------
> > > > > > > >  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c  |  7
> > > > > > > > ++++++-
> > > > > > > >  3 files changed, 24 insertions(+), 9 deletions(-)
> > > > > > > >
> > > > > > > > diff --git
> > > > > > > > a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> > > > > > > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> > > > > > > > index ec1501e3a63a..f355d9a752d2 100644
> > > > > > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> > > > > > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> > > > > > > > @@ -1461,6 +1461,20 @@ static enum drm_mode_status
> > > > > > amdgpu_connector_dp_mode_valid(struct drm_connector
> > > > > > > >       return MODE_OK;
> > > > > > > >  }
> > > > > > > >
> > > > > > > > +static int
> > > > > > > > +amdgpu_connector_late_register(struct drm_connector *connector) {
> > > > > > > > +     struct amdgpu_connector *amdgpu_connector =
> > > > > > to_amdgpu_connector(connector);
> > > > > > > > +     int r = 0;
> > > > > > > > +
> > > > > > > > +     if (amdgpu_connector->ddc_bus->has_aux) {
> > > > > > > > +             amdgpu_connector->ddc_bus->aux.dev =
> > > > > > > > + amdgpu_connector-
> > > > > > >base.kdev;
> > > > > > > > +             r = drm_dp_aux_register(&amdgpu_connector->ddc_bus->aux);
> > > > > > > > +     }
> > > > > > > > +
> > > > > > > > +     return r;
> > > > > > > > +}
> > > > > > > > +
> > > > > > > >  static const struct drm_connector_helper_funcs
> > > > > > amdgpu_connector_dp_helper_funcs = {
> > > > > > > >       .get_modes = amdgpu_connector_dp_get_modes,
> > > > > > > >       .mode_valid = amdgpu_connector_dp_mode_valid, @@
> > > > > > > > -1475,6
> > > > > > > > +1489,7 @@ static const struct drm_connector_funcs
> > > > > > amdgpu_connector_dp_funcs = {
> > > > > > > >       .early_unregister = amdgpu_connector_unregister,
> > > > > > > >       .destroy = amdgpu_connector_destroy,
> > > > > > > >       .force = amdgpu_connector_dvi_force,
> > > > > > > > +     .late_register = amdgpu_connector_late_register,
> > > > > > > >  };
> > > > > > > >
> > > > > > > >  static const struct drm_connector_funcs
> > > > > > > > amdgpu_connector_edp_funcs = { @@ -1485,6 +1500,7 @@
> > > > > > > > static
> > > > > const
> > > > > > > > struct drm_connector_funcs
> > > > > > amdgpu_connector_edp_funcs = {
> > > > > > > >       .early_unregister = amdgpu_connector_unregister,
> > > > > > > >       .destroy = amdgpu_connector_destroy,
> > > > > > > >       .force = amdgpu_connector_dvi_force,
> > > > > > > > +     .late_register = amdgpu_connector_late_register,
> > > > > > > >  };
> > > > > > > >
> > > > > > > >  void
> > > > > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> > > > > > > > b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> > > > > > > > index ea702a64f807..9b74cfdba7b8 100644
> > > > > > > > --- a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> > > > > > > > +++ b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> > > > > > > > @@ -186,16 +186,10 @@
> > > > > > > > amdgpu_atombios_dp_aux_transfer(struct
> > > > > > > > drm_dp_aux *aux, struct drm_dp_aux_msg *m
> > > > > > > >
> > > > > > > >  void amdgpu_atombios_dp_aux_init(struct amdgpu_connector
> > > > > > > > *amdgpu_connector)  {
> > > > > > > > -     int ret;
> > > > > > > > -
> > > > > > > >       amdgpu_connector->ddc_bus->rec.hpd =
> > > > > > > > amdgpu_connector-
> > > > > > >hpd.hpd;
> > > > > > > > -     amdgpu_connector->ddc_bus->aux.dev = amdgpu_connector-
> > > > > > >base.kdev;
> > > > > > > >       amdgpu_connector->ddc_bus->aux.transfer =
> > > > > > amdgpu_atombios_dp_aux_transfer;
> > > > > > > > -     ret = drm_dp_aux_register(&amdgpu_connector->ddc_bus->aux);
> > > > > > > > -     if (!ret)
> > > > > > > > -             amdgpu_connector->ddc_bus->has_aux = true;
> > > > > > > > -
> > > > > > > > -     WARN(ret, "drm_dp_aux_register_i2c_bus() failed with error %d\n",
> > > > > > ret);
> > > > > > > > +     drm_dp_aux_init(&amdgpu_connector->ddc_bus->aux);
> > > > > > > > +     amdgpu_connector->ddc_bus->has_aux = true;
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  /***** general DP utility functions *****/ diff --git
> > > > > > > > a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_type
> > > > > > > > s.c
> > > > > > > > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_type
> > > > > > > > s.c index 3959c942c88b..d5b9e72f2649 100644
> > > > > > > > ---
> > > > > > a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > > > > > > > +++
> > > > > > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > > > > > > > @@ -155,6 +155,11 @@
> > > > > > amdgpu_dm_mst_connector_late_register(struct drm_connector
> > > > > > *connector)
> > > > > > > >       struct amdgpu_dm_connector *amdgpu_dm_connector =
> > > > > > > >               to_amdgpu_dm_connector(connector);
> > > > > > > >       struct drm_dp_mst_port *port =
> > > > > > > > amdgpu_dm_connector->port;
> > > > > > > > +     int r;
> > > > > > > > +
> > > > > > > > +     r =
> > > > > > > > + drm_dp_aux_register(&amdgpu_dm_connector->dm_dp_aux.aux)
> > > > > > > > + ;
> > > > > > >
> > > > > > > This calls drm_dp_aux_register_devnode which is also called
> > > > > > > later in drm_dp_mst_connector_late_register. Wonder if that's a problem.
> > > > > >
> > > > > > Does this patch help?  I'm not too familiar with the MST code
> > > > > > and I don't have an MST monitor.
> > > > >
> > > > > I have an MST monitor and I can give it a spin. I'll get back to you later.
> > > >
> > > > + Jerry who is following up on this issue
> > > >
> > > > Thank you Alex for your patch. Unfortunately, it doesn't solve the issue.
> > > >
> > > > Jerry is following up on this ticket, and I've added him to this email thread.
> > >
> > > Can you send me the full dmesg output?  Also, does it happen as soon as the driver loads or sometime later?
> > >
> > > Alex
> > >
> > >
> > > >
> > > > Zhan
> > > >
> > > > >
> > > > > Zhan
> > > > >
> > > > > >
> > > > > > Alex
> > > > > >
> > > > > >
> > > > > > >
> > > > > > > Harry
> > > > > > >
> > > > > > > > +     if (r)
> > > > > > > > +             return r;
> > > > > > > >
> > > > > > > >  #if defined(CONFIG_DEBUG_FS)
> > > > > > > >       connector_debugfs_init(amdgpu_dm_connector);
> > > > > > > > @@ -484,7 +489,7 @@ void
> > > > > amdgpu_dm_initialize_dp_connector(struct
> > > > > > amdgpu_display_manager *dm,
> > > > > > > >       aconnector->dm_dp_aux.aux.transfer = dm_dp_aux_transfer;
> > > > > > > >       aconnector->dm_dp_aux.ddc_service =
> > > > > > > > aconnector->dc_link->ddc;
> > > > > > > >
> > > > > > > > -     drm_dp_aux_register(&aconnector->dm_dp_aux.aux);
> > > > > > > > +     drm_dp_aux_init(&aconnector->dm_dp_aux.aux);
> > > > > > > >       drm_dp_cec_register_connector(&aconnector->dm_dp_aux.aux,
> > > > > > > >                                     &aconnector->base);
> > > > > > > >
> > > > > > > >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
