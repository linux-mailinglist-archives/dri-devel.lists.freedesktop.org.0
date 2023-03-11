Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 096D16B6147
	for <lists+dri-devel@lfdr.de>; Sat, 11 Mar 2023 22:53:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4976210E20C;
	Sat, 11 Mar 2023 21:53:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E643110E0B8;
 Sat, 11 Mar 2023 21:53:46 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 h11-20020a17090a2ecb00b00237c740335cso8269217pjs.3; 
 Sat, 11 Mar 2023 13:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678571626;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WWvUzJ/vsSXqgCqJy0W0J/Ox7gkmeB3VlGI6EvVj5k8=;
 b=lea7jkwid2TJToxPIPUVTE/VJHzh0bLyvgacMaTOsZsy6SD649FefSwZi86p7lecY7
 Lj41+IboRukdO9qFs8HzchEciL0m8/0IaaysSuTEy+eojz2xqDJGJxkzeVBGCRBYoneq
 a8UQFJvQ4lFIBLD29DKAsco25MtwVdbfQ+W+38rvPbCjYcLVHUpRkpwasElmrS+uMo80
 ONNWvuoQ9w6iEYM1/7Sr339uJGB3y0BGJR+FIx3w8I5+nta5TLV5t16FNJdDgt5S+32R
 PwuF1AZEfUxwVa3ZuN0YSkVmry4EsnjKUOdy9B/JcXAfz088ym2PbLFYyT+GVtHB3pRG
 jIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678571626;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WWvUzJ/vsSXqgCqJy0W0J/Ox7gkmeB3VlGI6EvVj5k8=;
 b=SVGsBPOTQOTaufUo2ZbMoNpC6hhfr8m/vg8pCU1PK9i4VzJFQD4GGLv3I/LJxfODF5
 3WNPNJBN3OcP2X+0601a8w8facX23c3X4/fmO9uNI5pCQAMHpMW8hsWZhAZ7EJwJs1Vg
 LQkzZaDjm9MsJ6xjx8ay6haCGxPo36YNceGaqBUV25iehJ3UHNXhyW+KeKhBiXMaajB3
 Lec6fSo0dBVvh5G8PnbSiVH126H87f1EvkkmOL3YAkGn+mqc/uZRwlN2xJPiDbg9l7Ng
 XZQRJzHwhocZSs0JoMwusWv9rnLARQK/cviz39t6Tvs3C+pcXgLQPxrO29KwPkQ8UWaq
 7DGQ==
X-Gm-Message-State: AO0yUKUH4QxUSgBE2NBh9pva1tUyLm/Mvm/HZ0jCBzyJUdiaL4ViAAM9
 AL5109EE/lToXRGpIDCJgjzss8vHH/eZyDGTzwg=
X-Google-Smtp-Source: AK7set8GRf0NWRmRKvfD41LLB58Fwr5Epko8QZ0t+ylNTbQw9E3+aTJKUU837RNLGu0UW4QH1YfdnrmBReHF6fvxkYk=
X-Received: by 2002:a17:90b:504:b0:233:df5f:4778 with SMTP id
 r4-20020a17090b050400b00233df5f4778mr10838326pjz.6.1678571626059; Sat, 11 Mar
 2023 13:53:46 -0800 (PST)
MIME-Version: 1.0
References: <1665522649-3423-1-git-send-email-quic_abhinavk@quicinc.com>
 <CAG3jFyshznjN8OnFA61OAp1iCydOkAp5EDmu-+44rexDOmx64A@mail.gmail.com>
 <CAHCN7xLHiP-L2jRWs0aRG5Rz0q1ez0UiFg4keJeBz-6OhiDp_A@mail.gmail.com>
 <3176511b-0a76-619f-ffa5-05902eeddacd@quicinc.com>
 <CAA8EJpoUb8n=vkTPpChvuz3AmPTMdqfV0e3DmxUZ0Z1ZqW4Apg@mail.gmail.com>
In-Reply-To: <CAA8EJpoUb8n=vkTPpChvuz3AmPTMdqfV0e3DmxUZ0Z1ZqW4Apg@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Sat, 11 Mar 2023 15:53:34 -0600
Message-ID: <CAHCN7x+U+1gaqn_-hwJbEfpozSuUfExHnT5Jay0Vr83RF5+1+w@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: adv7533: remove dynamic lane switching
 from adv7533 bridge
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: Robert Foss <robert.foss@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
 quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Mar 11, 2023 at 3:40=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> "Hi Abhinav,
>
> On Sat, 11 Mar 2023 at 23:18, Abhinav Kumar <quic_abhinavk@quicinc.com> w=
rote:
> >
> > Hi Adam
> >
> > On 3/11/2023 9:28 AM, Adam Ford wrote:
> > > On Thu, Oct 13, 2022 at 3:39=E2=80=AFAM Robert Foss <robert.foss@lina=
ro.org> wrote:
> > >>
> > >> On Tue, 11 Oct 2022 at 23:11, Abhinav Kumar <quic_abhinavk@quicinc.c=
om> wrote:
> > >>>
> > >>> adv7533 bridge tries to dynamically switch lanes based on the
> > >>> mode by detaching and attaching the mipi dsi device.
> > >>>
> > >>> This approach is incorrect because this method of dynamic switch of
> > >>> detaching and attaching the mipi dsi device also results in removin=
g
> > >>> and adding the component which is not necessary.
> > >>>
> > >>> This approach is also prone to deadlocks. So for example, on the
> > >>> db410c whenever this path is executed with lockdep enabled,
> > >>> this results in a deadlock due to below ordering of locks.
> > >>>
> > >>> -> #1 (crtc_ww_class_acquire){+.+.}-{0:0}:
> > >>>          lock_acquire+0x6c/0x90
> > >>>          drm_modeset_acquire_init+0xf4/0x150
> > >>>          drmm_mode_config_init+0x220/0x770
> > >>>          msm_drm_bind+0x13c/0x654
> > >>>          try_to_bring_up_aggregate_device+0x164/0x1d0
> > >>>          __component_add+0xa8/0x174
> > >>>          component_add+0x18/0x2c
> > >>>          dsi_dev_attach+0x24/0x30
> > >>>          dsi_host_attach+0x98/0x14c
> > >>>          devm_mipi_dsi_attach+0x38/0xb0
> > >>>          adv7533_attach_dsi+0x8c/0x110
> > >>>          adv7511_probe+0x5a0/0x930
> > >>>          i2c_device_probe+0x30c/0x350
> > >>>          really_probe.part.0+0x9c/0x2b0
> > >>>          __driver_probe_device+0x98/0x144
> > >>>          driver_probe_device+0xac/0x14c
> > >>>          __device_attach_driver+0xbc/0x124
> > >>>          bus_for_each_drv+0x78/0xd0
> > >>>          __device_attach+0xa8/0x1c0
> > >>>          device_initial_probe+0x18/0x24
> > >>>          bus_probe_device+0xa0/0xac
> > >>>          deferred_probe_work_func+0x90/0xd0
> > >>>          process_one_work+0x28c/0x6b0
> > >>>          worker_thread+0x240/0x444
> > >>>          kthread+0x110/0x114
> > >>>          ret_from_fork+0x10/0x20
> > >>>
> > >>> -> #0 (component_mutex){+.+.}-{3:3}:
> > >>>          __lock_acquire+0x1280/0x20ac
> > >>>          lock_acquire.part.0+0xe0/0x230
> > >>>          lock_acquire+0x6c/0x90
> > >>>          __mutex_lock+0x84/0x400
> > >>>          mutex_lock_nested+0x3c/0x70
> > >>>          component_del+0x34/0x170
> > >>>          dsi_dev_detach+0x24/0x30
> > >>>          dsi_host_detach+0x20/0x64
> > >>>          mipi_dsi_detach+0x2c/0x40
> > >>>          adv7533_mode_set+0x64/0x90
> > >>>          adv7511_bridge_mode_set+0x210/0x214
> > >>>          drm_bridge_chain_mode_set+0x5c/0x84
> > >>>          crtc_set_mode+0x18c/0x1dc
> > >>>          drm_atomic_helper_commit_modeset_disables+0x40/0x50
> > >>>          msm_atomic_commit_tail+0x1d0/0x6e0
> > >>>          commit_tail+0xa4/0x180
> > >>>          drm_atomic_helper_commit+0x178/0x3b0
> > >>>          drm_atomic_commit+0xa4/0xe0
> > >>>          drm_client_modeset_commit_atomic+0x228/0x284
> > >>>          drm_client_modeset_commit_locked+0x64/0x1d0
> > >>>          drm_client_modeset_commit+0x34/0x60
> > >>>          drm_fb_helper_lastclose+0x74/0xcc
> > >>>          drm_lastclose+0x3c/0x80
> > >>>          drm_release+0xfc/0x114
> > >>>          __fput+0x70/0x224
> > >>>          ____fput+0x14/0x20
> > >>>          task_work_run+0x88/0x1a0
> > >>>          do_exit+0x350/0xa50
> > >>>          do_group_exit+0x38/0xa4
> > >>>          __wake_up_parent+0x0/0x34
> > >>>          invoke_syscall+0x48/0x114
> > >>>          el0_svc_common.constprop.0+0x60/0x11c
> > >>>          do_el0_svc+0x30/0xc0
> > >>>          el0_svc+0x58/0x100
> > >>>          el0t_64_sync_handler+0x1b0/0x1bc
> > >>>          el0t_64_sync+0x18c/0x190
> > >>>
> > >>> Due to above reasons, remove the dynamic lane switching
> > >>> code from adv7533 bridge chip and filter out the modes
> > >>> which would need different number of lanes as compared
> > >>> to the initialization time using the mode_valid callback.
> > >>>
> > >>> This can be potentially re-introduced by using the pre_enable()
> > >>> callback but this needs to be evaluated first whether such an
> > >>> approach will work so this will be done with a separate change.
> > >>>
> > >>> changes since RFC:
> > >>>          - Fix commit text and add TODO comment
> > >>>
> > >>> changes in v2:
> > >>>          - Fix checkpatch formatting errors
> > >>>
> > >>> Fixes: 62b2f026cd8e ("drm/bridge: adv7533: Change number of DSI lan=
es dynamically")
> > >>> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/16
> > >>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > >>> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> > >>> Link: https://lore.kernel.org/r/1661797363-7564-1-git-send-email-qu=
ic_abhinavk@quicinc.com
> > >>> ---
> > >>>   drivers/gpu/drm/bridge/adv7511/adv7511.h     |  3 ++-
> > >>>   drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 18 ++++++++++++++-=
---
> > >>>   drivers/gpu/drm/bridge/adv7511/adv7533.c     | 25 +++++++++++++--=
----------
> > >>>   3 files changed, 29 insertions(+), 17 deletions(-)
> > >>>
> > >>> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu=
/drm/bridge/adv7511/adv7511.h
> > >>> index a031a0cd1f18..1053d185b24c 100644
> > >>> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> > >>> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> > >>> @@ -405,7 +405,8 @@ static inline int adv7511_cec_init(struct devic=
e *dev, struct adv7511 *adv7511)
> > >>>
> > >>>   void adv7533_dsi_power_on(struct adv7511 *adv);
> > >>>   void adv7533_dsi_power_off(struct adv7511 *adv);
> > >>> -void adv7533_mode_set(struct adv7511 *adv, const struct drm_displa=
y_mode *mode);
> > >>> +enum drm_mode_status adv7533_mode_valid(struct adv7511 *adv,
> > >>> +                                       const struct drm_display_mo=
de *mode);
> > >>>   int adv7533_patch_registers(struct adv7511 *adv);
> > >>>   int adv7533_patch_cec_registers(struct adv7511 *adv);
> > >>>   int adv7533_attach_dsi(struct adv7511 *adv);
> > >>> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers=
/gpu/drm/bridge/adv7511/adv7511_drv.c
> > >>> index 38bf28720f3a..4bc7aac94a16 100644
> > >>> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > >>> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > >>> @@ -697,7 +697,7 @@ adv7511_detect(struct adv7511 *adv7511, struct =
drm_connector *connector)
> > >>>   }
> > >>>
> > >>>   static enum drm_mode_status adv7511_mode_valid(struct adv7511 *ad=
v7511,
> > >>> -                             struct drm_display_mode *mode)
> > >>> +                             const struct drm_display_mode *mode)
> > >>>   {
> > >>>          if (mode->clock > 165000)
> > >>>                  return MODE_CLOCK_HIGH;
> > >>> @@ -791,9 +791,6 @@ static void adv7511_mode_set(struct adv7511 *ad=
v7511,
> > >>>          regmap_update_bits(adv7511->regmap, 0x17,
> > >>>                  0x60, (vsync_polarity << 6) | (hsync_polarity << 5=
));
> > >>>
> > >>> -       if (adv7511->type =3D=3D ADV7533 || adv7511->type =3D=3D AD=
V7535)
> > >>> -               adv7533_mode_set(adv7511, adj_mode);
> > >>> -
> > >>>          drm_mode_copy(&adv7511->curr_mode, adj_mode);
> > >>>
> > >>>          /*
> > >>> @@ -913,6 +910,18 @@ static void adv7511_bridge_mode_set(struct drm=
_bridge *bridge,
> > >>>          adv7511_mode_set(adv, mode, adj_mode);
> > >>>   }
> > >>>
> > >>> +static enum drm_mode_status adv7511_bridge_mode_valid(struct drm_b=
ridge *bridge,
> > >>> +                                                     const struct =
drm_display_info *info,
> > >>> +               const struct drm_display_mode *mode)
> > >>> +{
> > >>> +       struct adv7511 *adv =3D bridge_to_adv7511(bridge);
> > >>> +
> > >>> +       if (adv->type =3D=3D ADV7533 || adv->type =3D=3D ADV7535)
> > >>> +               return adv7533_mode_valid(adv, mode);
> > >>> +       else
> > >>> +               return adv7511_mode_valid(adv, mode);
> > >>> +}
> > >>> +
> > >>>   static int adv7511_bridge_attach(struct drm_bridge *bridge,
> > >>>                                   enum drm_bridge_attach_flags flag=
s)
> > >>>   {
> > >>> @@ -960,6 +969,7 @@ static const struct drm_bridge_funcs adv7511_br=
idge_funcs =3D {
> > >>>          .enable =3D adv7511_bridge_enable,
> > >>>          .disable =3D adv7511_bridge_disable,
> > >>>          .mode_set =3D adv7511_bridge_mode_set,
> > >>> +       .mode_valid =3D adv7511_bridge_mode_valid,
> > >>>          .attach =3D adv7511_bridge_attach,
> > >>>          .detect =3D adv7511_bridge_detect,
> > >>>          .get_edid =3D adv7511_bridge_get_edid,
> > >>> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu=
/drm/bridge/adv7511/adv7533.c
> > >>> index ef6270806d1d..258c79d4dab0 100644
> > >>> --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> > >>> +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> > >>> @@ -100,26 +100,27 @@ void adv7533_dsi_power_off(struct adv7511 *ad=
v)
> > >>>          regmap_write(adv->regmap_cec, 0x27, 0x0b);
> > >>>   }
> > >>>
> > >>> -void adv7533_mode_set(struct adv7511 *adv, const struct drm_displa=
y_mode *mode)
> > >>> +enum drm_mode_status adv7533_mode_valid(struct adv7511 *adv,
> > >>> +                                       const struct drm_display_mo=
de *mode)
> > >>>   {
> > >>> +       int lanes;
> > >>>          struct mipi_dsi_device *dsi =3D adv->dsi;
> > >>> -       int lanes, ret;
> > >>> -
> > >>> -       if (adv->num_dsi_lanes !=3D 4)
> > >>> -               return;
> > >>>
> > >>>          if (mode->clock > 80000)
> > >>>                  lanes =3D 4;
> > >>>          else
> > >>>                  lanes =3D 3;
> > >
> > > I know this thread is a bit old, but I have an i.MX8M Mini with an
> > > adv7535 HDMI bridge, and I'm able to display video on a 4-lane
> > > interface with a clock as low as 27000.
> > >
> >
> > Looks like this condition is not tracking how low the bridge can suppor=
t
> > with 4 lanes but how high you can support with 3 lanes. Thats the issue=
.
> >
> > This condition has been this way since the original bridge driver:
> >
> > drm/bridge: adv7533: Change number of DSI lanes dynamically
> >
> > Yes, its possible that with 4 lanes you can support a lower rate but
> > with 3 lanes you cannot support a higher one. So that needs to be handl=
ed.
> >
> > The extra conditional's intention was to make sure that if you try to
> > switch to a mode which has a different number of lanes than what was se=
t
> > in the device tree (basically dynamic mode switch) then fail that.
> >
> > So perhaps this condition can be modified to :
> >
> > if (num_dsi_lanes < 4 && mode->clock > 80000)
> >         return MODE_BAD;
> >
> > I think that should fix your issue. You can set the number of lanes to =
4
> > for your board if it supports that using the DT node adi,dsi-lanes.
>

Thanks to both of you for the ideas.

> I went on and looked into the adv7533 datasheet. Strangely enough
> these conditions do not correspond to the limitations from the
> datasheet:
> - "pixel clocks of up to 80 MHz",
> - "each [DSI lane] running up to 800 Mbps"
>
> So probably the conditions should be as following:
>
> if (mode->clock > 80000)
>    return MODE_CLOCK_HIGH;

This is consistent with what is happening on the 7511.

>
> if (mode->clock * bpp > 800000 * adv->num_dsi_lanes)
>     return MODE_CLOCK_HIGH;
>
> See https://www.analog.com/media/en/technical-documentation/data-sheets/a=
dv7533.pdf

These numbers would need to be changed for the 7535, the device I am
using.  So I'll submit a patch which checks these with different max
values depending on whether or not the device is 7533 or 7535.

adam

>
> >
> > >>>
> > >>> -       if (lanes !=3D dsi->lanes) {
> > >>> -               mipi_dsi_detach(dsi);
> > >>> -               dsi->lanes =3D lanes;
> > >>> -               ret =3D mipi_dsi_attach(dsi);
> > >>> -               if (ret)
> > >>> -                       dev_err(&dsi->dev, "failed to change host l=
anes\n");
> > >>> -       }
> > >>> +       /*
> > >>> +        * TODO: add support for dynamic switching of lanes
> > >>> +        * by using the bridge pre_enable() op . Till then filter
> > >>> +        * out the modes which shall need different number of lanes
> > >>> +        * than what was configured in the device tree.
> > >>> +        */
> > >>> +       if (lanes !=3D dsi->lanes)
> > >>> +               return MODE_BAD;
> > >>> +
> > >
> > > My board doesn't currently support dynamic switching, but I'd like to
> > > keep 4-lanes all the time.  However, this return eliminates several
> > > resolutions that I can successfully display.
> > > I'd like to eliminate this error, so it works on the imx8m
> > > mini/nano/plus, but I am not sure the best approach without breaking
> > > someone else's board.
> > >  > I was thinking I could add a flag to disable dynamic switching.  I=
f
> > > that flag is set, we'd return MODE_OK here.
> > >
> > > Does anyone have any suggestions on an apporach?
> > >
> > > adam
> > >
> >
> > I am thinking of this solution
> >
> > if (num_dsi_lanes < 4 && mode->clock > 80000)
> >         return MODE_BAD;
> >
> > So lets say some user tried to set number of lanes to 3 but tries a mod=
e
> > needing > 80000 clock then fail.
> >
> > That way we still dont support dynamic mode switch but also dont limit
> > the modes which can be supported with 4 lanes.
> >
> > >
> > >>> +       return MODE_OK;
> > >>>   }
> > >>>
> > >>>   int adv7533_patch_registers(struct adv7511 *adv)
> > >>> --
> > >>> 2.7.4
> > >>>
> > >>
> > >> Applied to drm-misc-next.
>
>
>
> --
> With best wishes
> Dmitry
