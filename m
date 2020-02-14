Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFC315F50C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 19:35:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37FF36FB80;
	Fri, 14 Feb 2020 18:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6806FB80
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 18:35:18 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id w15so12041890wru.4
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 10:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PmmqP76AVh2ig1jRds1KsUeM6ME8kWhJ7X++xhVwJKo=;
 b=G/6HtXk9E596D9fnqgbxPRaCxxpG+ZZuH47AlBtwH+OursOd2n0h1k17B1J/cmy/1o
 Nas46qUCfXLIccSmgq95ojMQIKIZUd0wza/KsQMmgFBNvuVVQ+PPDh5wu676Db9SmzHt
 9p+7wUIggJQAY3PhGG3ZGQqM8spKUiDJ1LBtA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PmmqP76AVh2ig1jRds1KsUeM6ME8kWhJ7X++xhVwJKo=;
 b=qf6/Jh2AhIFgIpTKtgLo8xh4cSYOqP9BnYYeLxWvI15R7OCClH1g60nTd3A9hPq/9A
 NrVYhoG2oVRfW8WOJqbAqkOzS4a8+rX6HwjNZkJLuzM3S/2VISlqaDetHK17/KeDwMq0
 IBPyx9uNCW7ni1nHhNn8okWiUMnfWFkp2s/Wtx2AQVCADwLmji/rr6HhBwP56zxXrhpy
 EeL/0oAdt+kXmx7Ni3T50e/nxQiDaRJf9ioLDf/JFfkw+Fk6vHQPgabPs6AkDQN1k2MR
 yAq1Rbr2rtO8jSx1PnXwEbe6Cj+LSJXXPbjnn5odjVsxY6VObuNZAuyZS7sf0NMII/Tw
 IVAw==
X-Gm-Message-State: APjAAAX7Kw+IIcZ4HeZUt7UK1klDiquyqnS4vLIqhokPuaracJmRE3fI
 Esns3uEM2bIoM0Vom1z5xH/VGD08zpY=
X-Google-Smtp-Source: APXvYqxq11V64YmozK4+R8PfAshbZDemmrkTMDGZgOUzZp4pH4Bh3B8JCQVpmSL5iTgNLLeSt2ntDQ==
X-Received: by 2002:adf:f5cb:: with SMTP id k11mr5232988wrp.63.1581705316681; 
 Fri, 14 Feb 2020 10:35:16 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u8sm8488579wmm.15.2020.02.14.10.35.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 10:35:15 -0800 (PST)
Date: Fri, 14 Feb 2020 19:35:14 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 13/15] drm/amdgpu/display: split dp connector
 registration (v3)
Message-ID: <20200214183514.GZ2363188@phenom.ffwll.local>
References: <20200207211713.3870-1-alexander.deucher@amd.com>
 <20200214073934.GV2363188@phenom.ffwll.local>
 <CADnq5_PW7QwUk6TdaWiY3i=udua1REkw0HDQZ3eBwk4Xg24OSg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_PW7QwUk6TdaWiY3i=udua1REkw0HDQZ3eBwk4Xg24OSg@mail.gmail.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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

On Fri, Feb 14, 2020 at 12:39:22PM -0500, Alex Deucher wrote:
> On Fri, Feb 14, 2020 at 2:39 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Fri, Feb 07, 2020 at 04:17:13PM -0500, Alex Deucher wrote:
> > > Split into init and register functions to avoid a segfault
> > > in some configs when the load/unload callbacks are removed.
> > >
> > > v2:
> > > - add back accidently dropped has_aux setting
> > > - set dev in late_register
> > >
> > > v3:
> > > - fix dp cec ordering
> >
> > Why did you move this back out of the late_register callback when going
> > from v2->v3? In i915 we register the cec stuff from ->late_register, like
> 
> I got a bunch of complaints from the cec code when I had it switched
> the other way.  They went away when I moved it back.  I don't remember
> the exact messages off hand.

Would be interesting to learn want went wrong, just in case there's a core
bug here somewhere that prevents drivers from tdtr. But definitely no
reason to hold off this patch.
-Daniel

> 
> Alex
> 
> > anything else userspace visible. Maybe follow-up patch (the idea behind
> > removing the ->load callback is to close all the driver load races,
> > instead of only open("/dev/dri/0"), which is protected by
> > drm_global_mutex). On this:
> >
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >
> > Cheers, Daniel
> >
> > >
> > > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > > ---
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c   | 16 ++++++++++++++++
> > >  drivers/gpu/drm/amd/amdgpu/atombios_dp.c         | 10 ++--------
> > >  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c  |  7 ++++++-
> > >  3 files changed, 24 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> > > index ec1501e3a63a..f355d9a752d2 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> > > @@ -1461,6 +1461,20 @@ static enum drm_mode_status amdgpu_connector_dp_mode_valid(struct drm_connector
> > >       return MODE_OK;
> > >  }
> > >
> > > +static int
> > > +amdgpu_connector_late_register(struct drm_connector *connector)
> > > +{
> > > +     struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
> > > +     int r = 0;
> > > +
> > > +     if (amdgpu_connector->ddc_bus->has_aux) {
> > > +             amdgpu_connector->ddc_bus->aux.dev = amdgpu_connector->base.kdev;
> > > +             r = drm_dp_aux_register(&amdgpu_connector->ddc_bus->aux);
> > > +     }
> > > +
> > > +     return r;
> > > +}
> > > +
> > >  static const struct drm_connector_helper_funcs amdgpu_connector_dp_helper_funcs = {
> > >       .get_modes = amdgpu_connector_dp_get_modes,
> > >       .mode_valid = amdgpu_connector_dp_mode_valid,
> > > @@ -1475,6 +1489,7 @@ static const struct drm_connector_funcs amdgpu_connector_dp_funcs = {
> > >       .early_unregister = amdgpu_connector_unregister,
> > >       .destroy = amdgpu_connector_destroy,
> > >       .force = amdgpu_connector_dvi_force,
> > > +     .late_register = amdgpu_connector_late_register,
> > >  };
> > >
> > >  static const struct drm_connector_funcs amdgpu_connector_edp_funcs = {
> > > @@ -1485,6 +1500,7 @@ static const struct drm_connector_funcs amdgpu_connector_edp_funcs = {
> > >       .early_unregister = amdgpu_connector_unregister,
> > >       .destroy = amdgpu_connector_destroy,
> > >       .force = amdgpu_connector_dvi_force,
> > > +     .late_register = amdgpu_connector_late_register,
> > >  };
> > >
> > >  void
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> > > index ea702a64f807..9b74cfdba7b8 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> > > @@ -186,16 +186,10 @@ amdgpu_atombios_dp_aux_transfer(struct drm_dp_aux *aux, struct drm_dp_aux_msg *m
> > >
> > >  void amdgpu_atombios_dp_aux_init(struct amdgpu_connector *amdgpu_connector)
> > >  {
> > > -     int ret;
> > > -
> > >       amdgpu_connector->ddc_bus->rec.hpd = amdgpu_connector->hpd.hpd;
> > > -     amdgpu_connector->ddc_bus->aux.dev = amdgpu_connector->base.kdev;
> > >       amdgpu_connector->ddc_bus->aux.transfer = amdgpu_atombios_dp_aux_transfer;
> > > -     ret = drm_dp_aux_register(&amdgpu_connector->ddc_bus->aux);
> > > -     if (!ret)
> > > -             amdgpu_connector->ddc_bus->has_aux = true;
> > > -
> > > -     WARN(ret, "drm_dp_aux_register_i2c_bus() failed with error %d\n", ret);
> > > +     drm_dp_aux_init(&amdgpu_connector->ddc_bus->aux);
> > > +     amdgpu_connector->ddc_bus->has_aux = true;
> > >  }
> > >
> > >  /***** general DP utility functions *****/
> > > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > > index 3959c942c88b..d5b9e72f2649 100644
> > > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > > @@ -155,6 +155,11 @@ amdgpu_dm_mst_connector_late_register(struct drm_connector *connector)
> > >       struct amdgpu_dm_connector *amdgpu_dm_connector =
> > >               to_amdgpu_dm_connector(connector);
> > >       struct drm_dp_mst_port *port = amdgpu_dm_connector->port;
> > > +     int r;
> > > +
> > > +     r = drm_dp_aux_register(&amdgpu_dm_connector->dm_dp_aux.aux);
> > > +     if (r)
> > > +             return r;
> > >
> > >  #if defined(CONFIG_DEBUG_FS)
> > >       connector_debugfs_init(amdgpu_dm_connector);
> > > @@ -484,7 +489,7 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
> > >       aconnector->dm_dp_aux.aux.transfer = dm_dp_aux_transfer;
> > >       aconnector->dm_dp_aux.ddc_service = aconnector->dc_link->ddc;
> > >
> > > -     drm_dp_aux_register(&aconnector->dm_dp_aux.aux);
> > > +     drm_dp_aux_init(&aconnector->dm_dp_aux.aux);
> > >       drm_dp_cec_register_connector(&aconnector->dm_dp_aux.aux,
> > >                                     &aconnector->base);
> > >
> > > --
> > > 2.24.1
> > >
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
