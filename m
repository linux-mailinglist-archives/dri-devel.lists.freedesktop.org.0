Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EAD6B5EC8
	for <lists+dri-devel@lfdr.de>; Sat, 11 Mar 2023 18:28:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41CE410E29A;
	Sat, 11 Mar 2023 17:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B4A10E29A;
 Sat, 11 Mar 2023 17:28:29 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so13033347pjb.1; 
 Sat, 11 Mar 2023 09:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678555709;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XmU4ESJ3ztA7xNGY+SEa56dN2TSyXA0lMi/v4OIwD1I=;
 b=JXcHIOC78sz5CPRCbbwxAxM3tZL1zwyyupxj1KqFwKFhCjN1VmCw/SiBRQsJwSnv/8
 UpzkvEiaSQr6yY1pq1TAw9VeS23eEG9IEB09+OxQgJMtUElKeqY/c5FIUySSkd2uKRQc
 aqseNmzl7ukXXUNbWF2O+MosvI4qdIKMsXuAWcyOUscCNGDe42/8P6NK/M9aq4IfBa50
 CeLA95ZN5AihpYScWG7yjORZRsN2hNgugFyp28ND10IamhcsifpOM6gmjPtRWSHp//Xb
 g1Y36TyksK8/2jTRXGirbgTiIKDinMdgOLvCLQO+AJEheSNELdU1DWB5h6ORbl9PSuCU
 76bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678555709;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XmU4ESJ3ztA7xNGY+SEa56dN2TSyXA0lMi/v4OIwD1I=;
 b=MTE/xiNaMTJ0dclmkDUgef7G9HpWYO2Xj2/6116CargQZUAQrOEIoSXq3cENEd217n
 VAac53wuwVuOb0+Z15RiGl2NSl9sHV3/TCXVQxqIh9szIi8YWaiadIwAPJj7nVoKWne3
 GHBbdAL1lt2ZMf2BPphDkHrNk2A+fRFNmvEQEfnb9cYn0rerSWCDBQY4c1Ks8EYQdjxG
 82afEPo1BAyub9YNDMdi9bP98QES7/1TQn7V9rUBSr/MTQXE1ZKHbIjKQXCy3jlB0yDd
 JQ0A9zC3CzoIUzPPNwtJ3kcYqSxO2xk6xt7pL3fM539PU3fmDqBLTQQfEL5sNQdznRwp
 MWOg==
X-Gm-Message-State: AO0yUKUUqY4FoIdSCAA3h0MniNPjA5hHgtlFSxQIoRriTERD9/LU2Tjs
 5fGtZmOivb7tXGIzzPMxlQmz0ws5eyS3LbAkh+I=
X-Google-Smtp-Source: AK7set+FKPoRkJA7Mw9UmGP4A/o2Nb7lHa0WtPPokjHMqfx7FJGA6yJMhit37DawGES2/smlgHG12F/HbDy7omgHmHw=
X-Received: by 2002:a17:90a:bf10:b0:237:cd62:66f7 with SMTP id
 c16-20020a17090abf1000b00237cd6266f7mr10754539pjs.6.1678555708933; Sat, 11
 Mar 2023 09:28:28 -0800 (PST)
MIME-Version: 1.0
References: <1665522649-3423-1-git-send-email-quic_abhinavk@quicinc.com>
 <CAG3jFyshznjN8OnFA61OAp1iCydOkAp5EDmu-+44rexDOmx64A@mail.gmail.com>
In-Reply-To: <CAG3jFyshznjN8OnFA61OAp1iCydOkAp5EDmu-+44rexDOmx64A@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Sat, 11 Mar 2023 11:28:17 -0600
Message-ID: <CAHCN7xLHiP-L2jRWs0aRG5Rz0q1ez0UiFg4keJeBz-6OhiDp_A@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: adv7533: remove dynamic lane switching
 from adv7533 bridge
To: Robert Foss <robert.foss@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
 dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 quic_khsieh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 13, 2022 at 3:39=E2=80=AFAM Robert Foss <robert.foss@linaro.org=
> wrote:
>
> On Tue, 11 Oct 2022 at 23:11, Abhinav Kumar <quic_abhinavk@quicinc.com> w=
rote:
> >
> > adv7533 bridge tries to dynamically switch lanes based on the
> > mode by detaching and attaching the mipi dsi device.
> >
> > This approach is incorrect because this method of dynamic switch of
> > detaching and attaching the mipi dsi device also results in removing
> > and adding the component which is not necessary.
> >
> > This approach is also prone to deadlocks. So for example, on the
> > db410c whenever this path is executed with lockdep enabled,
> > this results in a deadlock due to below ordering of locks.
> >
> > -> #1 (crtc_ww_class_acquire){+.+.}-{0:0}:
> >         lock_acquire+0x6c/0x90
> >         drm_modeset_acquire_init+0xf4/0x150
> >         drmm_mode_config_init+0x220/0x770
> >         msm_drm_bind+0x13c/0x654
> >         try_to_bring_up_aggregate_device+0x164/0x1d0
> >         __component_add+0xa8/0x174
> >         component_add+0x18/0x2c
> >         dsi_dev_attach+0x24/0x30
> >         dsi_host_attach+0x98/0x14c
> >         devm_mipi_dsi_attach+0x38/0xb0
> >         adv7533_attach_dsi+0x8c/0x110
> >         adv7511_probe+0x5a0/0x930
> >         i2c_device_probe+0x30c/0x350
> >         really_probe.part.0+0x9c/0x2b0
> >         __driver_probe_device+0x98/0x144
> >         driver_probe_device+0xac/0x14c
> >         __device_attach_driver+0xbc/0x124
> >         bus_for_each_drv+0x78/0xd0
> >         __device_attach+0xa8/0x1c0
> >         device_initial_probe+0x18/0x24
> >         bus_probe_device+0xa0/0xac
> >         deferred_probe_work_func+0x90/0xd0
> >         process_one_work+0x28c/0x6b0
> >         worker_thread+0x240/0x444
> >         kthread+0x110/0x114
> >         ret_from_fork+0x10/0x20
> >
> > -> #0 (component_mutex){+.+.}-{3:3}:
> >         __lock_acquire+0x1280/0x20ac
> >         lock_acquire.part.0+0xe0/0x230
> >         lock_acquire+0x6c/0x90
> >         __mutex_lock+0x84/0x400
> >         mutex_lock_nested+0x3c/0x70
> >         component_del+0x34/0x170
> >         dsi_dev_detach+0x24/0x30
> >         dsi_host_detach+0x20/0x64
> >         mipi_dsi_detach+0x2c/0x40
> >         adv7533_mode_set+0x64/0x90
> >         adv7511_bridge_mode_set+0x210/0x214
> >         drm_bridge_chain_mode_set+0x5c/0x84
> >         crtc_set_mode+0x18c/0x1dc
> >         drm_atomic_helper_commit_modeset_disables+0x40/0x50
> >         msm_atomic_commit_tail+0x1d0/0x6e0
> >         commit_tail+0xa4/0x180
> >         drm_atomic_helper_commit+0x178/0x3b0
> >         drm_atomic_commit+0xa4/0xe0
> >         drm_client_modeset_commit_atomic+0x228/0x284
> >         drm_client_modeset_commit_locked+0x64/0x1d0
> >         drm_client_modeset_commit+0x34/0x60
> >         drm_fb_helper_lastclose+0x74/0xcc
> >         drm_lastclose+0x3c/0x80
> >         drm_release+0xfc/0x114
> >         __fput+0x70/0x224
> >         ____fput+0x14/0x20
> >         task_work_run+0x88/0x1a0
> >         do_exit+0x350/0xa50
> >         do_group_exit+0x38/0xa4
> >         __wake_up_parent+0x0/0x34
> >         invoke_syscall+0x48/0x114
> >         el0_svc_common.constprop.0+0x60/0x11c
> >         do_el0_svc+0x30/0xc0
> >         el0_svc+0x58/0x100
> >         el0t_64_sync_handler+0x1b0/0x1bc
> >         el0t_64_sync+0x18c/0x190
> >
> > Due to above reasons, remove the dynamic lane switching
> > code from adv7533 bridge chip and filter out the modes
> > which would need different number of lanes as compared
> > to the initialization time using the mode_valid callback.
> >
> > This can be potentially re-introduced by using the pre_enable()
> > callback but this needs to be evaluated first whether such an
> > approach will work so this will be done with a separate change.
> >
> > changes since RFC:
> >         - Fix commit text and add TODO comment
> >
> > changes in v2:
> >         - Fix checkpatch formatting errors
> >
> > Fixes: 62b2f026cd8e ("drm/bridge: adv7533: Change number of DSI lanes d=
ynamically")
> > Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/16
> > Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > Reviewed-by: Robert Foss <robert.foss@linaro.org>
> > Link: https://lore.kernel.org/r/1661797363-7564-1-git-send-email-quic_a=
bhinavk@quicinc.com
> > ---
> >  drivers/gpu/drm/bridge/adv7511/adv7511.h     |  3 ++-
> >  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 18 ++++++++++++++----
> >  drivers/gpu/drm/bridge/adv7511/adv7533.c     | 25 +++++++++++++-------=
-----
> >  3 files changed, 29 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm=
/bridge/adv7511/adv7511.h
> > index a031a0cd1f18..1053d185b24c 100644
> > --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> > @@ -405,7 +405,8 @@ static inline int adv7511_cec_init(struct device *d=
ev, struct adv7511 *adv7511)
> >
> >  void adv7533_dsi_power_on(struct adv7511 *adv);
> >  void adv7533_dsi_power_off(struct adv7511 *adv);
> > -void adv7533_mode_set(struct adv7511 *adv, const struct drm_display_mo=
de *mode);
> > +enum drm_mode_status adv7533_mode_valid(struct adv7511 *adv,
> > +                                       const struct drm_display_mode *=
mode);
> >  int adv7533_patch_registers(struct adv7511 *adv);
> >  int adv7533_patch_cec_registers(struct adv7511 *adv);
> >  int adv7533_attach_dsi(struct adv7511 *adv);
> > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu=
/drm/bridge/adv7511/adv7511_drv.c
> > index 38bf28720f3a..4bc7aac94a16 100644
> > --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > @@ -697,7 +697,7 @@ adv7511_detect(struct adv7511 *adv7511, struct drm_=
connector *connector)
> >  }
> >
> >  static enum drm_mode_status adv7511_mode_valid(struct adv7511 *adv7511=
,
> > -                             struct drm_display_mode *mode)
> > +                             const struct drm_display_mode *mode)
> >  {
> >         if (mode->clock > 165000)
> >                 return MODE_CLOCK_HIGH;
> > @@ -791,9 +791,6 @@ static void adv7511_mode_set(struct adv7511 *adv751=
1,
> >         regmap_update_bits(adv7511->regmap, 0x17,
> >                 0x60, (vsync_polarity << 6) | (hsync_polarity << 5));
> >
> > -       if (adv7511->type =3D=3D ADV7533 || adv7511->type =3D=3D ADV753=
5)
> > -               adv7533_mode_set(adv7511, adj_mode);
> > -
> >         drm_mode_copy(&adv7511->curr_mode, adj_mode);
> >
> >         /*
> > @@ -913,6 +910,18 @@ static void adv7511_bridge_mode_set(struct drm_bri=
dge *bridge,
> >         adv7511_mode_set(adv, mode, adj_mode);
> >  }
> >
> > +static enum drm_mode_status adv7511_bridge_mode_valid(struct drm_bridg=
e *bridge,
> > +                                                     const struct drm_=
display_info *info,
> > +               const struct drm_display_mode *mode)
> > +{
> > +       struct adv7511 *adv =3D bridge_to_adv7511(bridge);
> > +
> > +       if (adv->type =3D=3D ADV7533 || adv->type =3D=3D ADV7535)
> > +               return adv7533_mode_valid(adv, mode);
> > +       else
> > +               return adv7511_mode_valid(adv, mode);
> > +}
> > +
> >  static int adv7511_bridge_attach(struct drm_bridge *bridge,
> >                                  enum drm_bridge_attach_flags flags)
> >  {
> > @@ -960,6 +969,7 @@ static const struct drm_bridge_funcs adv7511_bridge=
_funcs =3D {
> >         .enable =3D adv7511_bridge_enable,
> >         .disable =3D adv7511_bridge_disable,
> >         .mode_set =3D adv7511_bridge_mode_set,
> > +       .mode_valid =3D adv7511_bridge_mode_valid,
> >         .attach =3D adv7511_bridge_attach,
> >         .detect =3D adv7511_bridge_detect,
> >         .get_edid =3D adv7511_bridge_get_edid,
> > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm=
/bridge/adv7511/adv7533.c
> > index ef6270806d1d..258c79d4dab0 100644
> > --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> > +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> > @@ -100,26 +100,27 @@ void adv7533_dsi_power_off(struct adv7511 *adv)
> >         regmap_write(adv->regmap_cec, 0x27, 0x0b);
> >  }
> >
> > -void adv7533_mode_set(struct adv7511 *adv, const struct drm_display_mo=
de *mode)
> > +enum drm_mode_status adv7533_mode_valid(struct adv7511 *adv,
> > +                                       const struct drm_display_mode *=
mode)
> >  {
> > +       int lanes;
> >         struct mipi_dsi_device *dsi =3D adv->dsi;
> > -       int lanes, ret;
> > -
> > -       if (adv->num_dsi_lanes !=3D 4)
> > -               return;
> >
> >         if (mode->clock > 80000)
> >                 lanes =3D 4;
> >         else
> >                 lanes =3D 3;

I know this thread is a bit old, but I have an i.MX8M Mini with an
adv7535 HDMI bridge, and I'm able to display video on a 4-lane
interface with a clock as low as 27000.

> >
> > -       if (lanes !=3D dsi->lanes) {
> > -               mipi_dsi_detach(dsi);
> > -               dsi->lanes =3D lanes;
> > -               ret =3D mipi_dsi_attach(dsi);
> > -               if (ret)
> > -                       dev_err(&dsi->dev, "failed to change host lanes=
\n");
> > -       }
> > +       /*
> > +        * TODO: add support for dynamic switching of lanes
> > +        * by using the bridge pre_enable() op . Till then filter
> > +        * out the modes which shall need different number of lanes
> > +        * than what was configured in the device tree.
> > +        */
> > +       if (lanes !=3D dsi->lanes)
> > +               return MODE_BAD;
> > +

My board doesn't currently support dynamic switching, but I'd like to
keep 4-lanes all the time.  However, this return eliminates several
resolutions that I can successfully display.
I'd like to eliminate this error, so it works on the imx8m
mini/nano/plus, but I am not sure the best approach without breaking
someone else's board.

I was thinking I could add a flag to disable dynamic switching.  If
that flag is set, we'd return MODE_OK here.

Does anyone have any suggestions on an apporach?

adam


> > +       return MODE_OK;
> >  }
> >
> >  int adv7533_patch_registers(struct adv7511 *adv)
> > --
> > 2.7.4
> >
>
> Applied to drm-misc-next.
