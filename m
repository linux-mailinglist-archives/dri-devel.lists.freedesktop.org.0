Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A05095F794E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 15:56:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B03D10E2EC;
	Fri,  7 Oct 2022 13:56:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E7ED10E2E0
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 13:56:30 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id d26so4398818eje.10
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Oct 2022 06:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gXZcvWqcPIpnVsMljnA1azLi0qLzNuQ/iTE6oM2LoVQ=;
 b=re+u4XD5diGGof3n+vKImJ2oty634MJyX7DysKZK8CPeaAuyLpLlM1RIDiVW7RfbQY
 Tgnj6J9nLicLi8tPlEFm2B53oc3zbfs19G+eTZDY5HtbjCk74T3fL8Jp/AUcJgEFWXu5
 uRBUwYTBlekXP1J5w1Sfjk7eeW3Y+LUqcm5RDzkyx8nwn71ybPw9QJaWFZtBaLHg//1v
 fdbmNstdYrVju5l8adtIEbs5zBV0sJgCOr5gyE4pFKfSN1kwb2Jbchc2LqCg6Dn8B+Bh
 cFdbG04qXNQO/3hf8GpEE0QtkiH2UsMKPCq0HhDKl/rm9K5ADcKJcz/6xWsgnokV5sQn
 Ycug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gXZcvWqcPIpnVsMljnA1azLi0qLzNuQ/iTE6oM2LoVQ=;
 b=Y0oZnWKyeu5lYBMf81WkxAOrTJyFpwvD5uF6nH/z32A+8rhhInVqy5IjwV9PHgoDTJ
 K2HdoENgeJCkIJBjOC7uFTX8eqnbr3votr+KH+DFC4kpZVmeAjc7Jy+dwcsVivLlLrnu
 5AKS2MCPOaoaQDxgNwsFzO4aryC/yTouklhd3G8vmjUtRkeeiTCQnW7lYd1NpEOiAdar
 iQOa8UxC15WuF6DbTHv5KrkZyVQpUsa8PKS+wxbyGIWI2WHoUyhsja440qexvIls7viw
 b0FKXy78Bg9CT27jFPg0SoIAB9hWmjDOUUkITEcy5cHG8PzfW0+5plHpNqmoqMFA8yVi
 yKIA==
X-Gm-Message-State: ACrzQf2ycBYRNcDHAUUbjbBbGIFrF9mc2EHPY9gtmVs2Wmpac+qhk76P
 6D8EwTsYeoYN4nUVa1XODDg2JP80UvH9g3RlNcDsug==
X-Google-Smtp-Source: AMsMyM4zEQkLi3IO+0gm/lEQGhpYUmcAvcXcnVDpqqPx8Nfz2JaMdYx+oOVCQkm5sdi1oVXUCc8XK/ShV6Vd/JRHOWE=
X-Received: by 2002:a17:907:16a7:b0:78c:2c22:d331 with SMTP id
 hc39-20020a17090716a700b0078c2c22d331mr4225381ejc.580.1665150989300; Fri, 07
 Oct 2022 06:56:29 -0700 (PDT)
MIME-Version: 1.0
References: <1661797363-7564-1-git-send-email-quic_abhinavk@quicinc.com>
 <CAG3jFytm-zGsB23j+-myS1pnZAY1y848qkr45ER4yvHv-annvw@mail.gmail.com>
 <c577e54e-675b-a9cb-556c-93ee122f2f6e@quicinc.com>
In-Reply-To: <c577e54e-675b-a9cb-556c-93ee122f2f6e@quicinc.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 7 Oct 2022 15:56:18 +0200
Message-ID: <CAG3jFytrehQ0xK6f-ehF1wzsRfVv-2aivFfnWuU+qEZcXt5zXQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/bridge: adv7533: remove dynamic lane
 switching from adv7533 bridge
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, dmitry.baryshkov@linaro.org,
 quic_jesszhan@quicinc.com, quic_aravindh@quicinc.com, quic_khsieh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 6 Oct 2022 at 17:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Hi Robert
>
> Thanks for the review.
>
> On 10/4/2022 8:55 AM, Robert Foss wrote:
> > On Mon, 29 Aug 2022 at 20:23, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >> adv7533 bridge tries to dynamically switch lanes based on the
> >> mode by detaching and attaching the mipi dsi device.
> >>
> >> This approach is incorrect because this method of dynamic switch of
> >> detaching and attaching the mipi dsi device also results in removing
> >> and adding the component which is not necessary.
> >>
> >> This approach is also prone to deadlocks. So for example, on the
> >> db410c whenever this path is executed with lockdep enabled,
> >> this results in a deadlock due to below ordering of locks.
> >>
> >> -> #1 (crtc_ww_class_acquire){+.+.}-{0:0}:
> >>          lock_acquire+0x6c/0x90
> >>          drm_modeset_acquire_init+0xf4/0x150
> >>          drmm_mode_config_init+0x220/0x770
> >>          msm_drm_bind+0x13c/0x654
> >>          try_to_bring_up_aggregate_device+0x164/0x1d0
> >>          __component_add+0xa8/0x174
> >>          component_add+0x18/0x2c
> >>          dsi_dev_attach+0x24/0x30
> >>          dsi_host_attach+0x98/0x14c
> >>          devm_mipi_dsi_attach+0x38/0xb0
> >>          adv7533_attach_dsi+0x8c/0x110
> >>          adv7511_probe+0x5a0/0x930
> >>          i2c_device_probe+0x30c/0x350
> >>          really_probe.part.0+0x9c/0x2b0
> >>          __driver_probe_device+0x98/0x144
> >>          driver_probe_device+0xac/0x14c
> >>          __device_attach_driver+0xbc/0x124
> >>          bus_for_each_drv+0x78/0xd0
> >>          __device_attach+0xa8/0x1c0
> >>          device_initial_probe+0x18/0x24
> >>          bus_probe_device+0xa0/0xac
> >>          deferred_probe_work_func+0x90/0xd0
> >>          process_one_work+0x28c/0x6b0
> >>          worker_thread+0x240/0x444
> >>          kthread+0x110/0x114
> >>          ret_from_fork+0x10/0x20
> >>
> >> -> #0 (component_mutex){+.+.}-{3:3}:
> >>          __lock_acquire+0x1280/0x20ac
> >>          lock_acquire.part.0+0xe0/0x230
> >>          lock_acquire+0x6c/0x90
> >>          __mutex_lock+0x84/0x400
> >>          mutex_lock_nested+0x3c/0x70
> >>          component_del+0x34/0x170
> >>          dsi_dev_detach+0x24/0x30
> >>          dsi_host_detach+0x20/0x64
> >>          mipi_dsi_detach+0x2c/0x40
> >>          adv7533_mode_set+0x64/0x90
> >>          adv7511_bridge_mode_set+0x210/0x214
> >>          drm_bridge_chain_mode_set+0x5c/0x84
> >>          crtc_set_mode+0x18c/0x1dc
> >>          drm_atomic_helper_commit_modeset_disables+0x40/0x50
> >>          msm_atomic_commit_tail+0x1d0/0x6e0
> >>          commit_tail+0xa4/0x180
> >>          drm_atomic_helper_commit+0x178/0x3b0
> >>          drm_atomic_commit+0xa4/0xe0
> >>          drm_client_modeset_commit_atomic+0x228/0x284
> >>          drm_client_modeset_commit_locked+0x64/0x1d0
> >>          drm_client_modeset_commit+0x34/0x60
> >>          drm_fb_helper_lastclose+0x74/0xcc
> >>          drm_lastclose+0x3c/0x80
> >>          drm_release+0xfc/0x114
> >>          __fput+0x70/0x224
> >>          ____fput+0x14/0x20
> >>          task_work_run+0x88/0x1a0
> >>          do_exit+0x350/0xa50
> >>          do_group_exit+0x38/0xa4
> >>          __wake_up_parent+0x0/0x34
> >>          invoke_syscall+0x48/0x114
> >>          el0_svc_common.constprop.0+0x60/0x11c
> >>          do_el0_svc+0x30/0xc0
> >>          el0_svc+0x58/0x100
> >>          el0t_64_sync_handler+0x1b0/0x1bc
> >>          el0t_64_sync+0x18c/0x190
> >>
> >> Due to above reasons, remove the dynamic lane switching
> >> code from adv7533 bridge chip and filter out the modes
> >> which would need different number of lanes as compared
> >> to the initialization time using the mode_valid callback.
> >>
> >> This can be potentially re-introduced by using the pre_enable()
> >> callback but this needs to be evaluated first whether such an
> >> approach will work so this will be done with a separate change.
> >>
> >> changes since RFC:
> >>          - Fix commit text and add TODO comment
> >>
> >> Fixes: 62b2f026cd8e ("drm/bridge: adv7533: Change number of DSI lanes dynamically")
> >> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/16
> >> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/bridge/adv7511/adv7511.h     |  3 ++-
> >>   drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 18 ++++++++++++++----
> >>   drivers/gpu/drm/bridge/adv7511/adv7533.c     | 25 +++++++++++++------------
> >>   3 files changed, 29 insertions(+), 17 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> >> index 9e3bb8a8ee40..0a7cec80b75d 100644
> >> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> >> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> >> @@ -417,7 +417,8 @@ static inline int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
> >>
> >>   void adv7533_dsi_power_on(struct adv7511 *adv);
> >>   void adv7533_dsi_power_off(struct adv7511 *adv);
> >> -void adv7533_mode_set(struct adv7511 *adv, const struct drm_display_mode *mode);
> >> +enum drm_mode_status adv7533_mode_valid(struct adv7511 *adv,
> >> +               const struct drm_display_mode *mode);
> >>   int adv7533_patch_registers(struct adv7511 *adv);
> >>   int adv7533_patch_cec_registers(struct adv7511 *adv);
> >>   int adv7533_attach_dsi(struct adv7511 *adv);
> >> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> >> index 5bb9300040dd..1115ef9be83c 100644
> >> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> >> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> >> @@ -697,7 +697,7 @@ adv7511_detect(struct adv7511 *adv7511, struct drm_connector *connector)
> >>   }
> >>
> >>   static enum drm_mode_status adv7511_mode_valid(struct adv7511 *adv7511,
> >> -                             struct drm_display_mode *mode)
> >> +                             const struct drm_display_mode *mode)
> >>   {
> >>          if (mode->clock > 165000)
> >>                  return MODE_CLOCK_HIGH;
> >> @@ -791,9 +791,6 @@ static void adv7511_mode_set(struct adv7511 *adv7511,
> >>          regmap_update_bits(adv7511->regmap, 0x17,
> >>                  0x60, (vsync_polarity << 6) | (hsync_polarity << 5));
> >>
> >> -       if (adv7511->type == ADV7533 || adv7511->type == ADV7535)
> >> -               adv7533_mode_set(adv7511, adj_mode);
> >> -
> >>          drm_mode_copy(&adv7511->curr_mode, adj_mode);
> >>
> >>          /*
> >> @@ -913,6 +910,18 @@ static void adv7511_bridge_mode_set(struct drm_bridge *bridge,
> >>          adv7511_mode_set(adv, mode, adj_mode);
> >>   }
> >>
> >> +static enum drm_mode_status adv7511_bridge_mode_valid(struct drm_bridge *bridge,
> >> +               const struct drm_display_info *info,
> >> +               const struct drm_display_mode *mode)
> >> +{
> >> +       struct adv7511 *adv = bridge_to_adv7511(bridge);
> >> +
> >> +       if (adv->type == ADV7533 || adv->type == ADV7535)
> >> +               return adv7533_mode_valid(adv, mode);
> >> +       else
> >> +               return adv7511_mode_valid(adv, mode);
> >> +}
> >> +
> >>   static int adv7511_bridge_attach(struct drm_bridge *bridge,
> >>                                   enum drm_bridge_attach_flags flags)
> >>   {
> >> @@ -960,6 +969,7 @@ static const struct drm_bridge_funcs adv7511_bridge_funcs = {
> >>          .enable = adv7511_bridge_enable,
> >>          .disable = adv7511_bridge_disable,
> >>          .mode_set = adv7511_bridge_mode_set,
> >> +       .mode_valid = adv7511_bridge_mode_valid,
> >>          .attach = adv7511_bridge_attach,
> >>          .detect = adv7511_bridge_detect,
> >>          .get_edid = adv7511_bridge_get_edid,
> >> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> >> index ef6270806d1d..5f590abd6403 100644
> >> --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> >> +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> >> @@ -100,26 +100,27 @@ void adv7533_dsi_power_off(struct adv7511 *adv)
> >>          regmap_write(adv->regmap_cec, 0x27, 0x0b);
> >>   }
> >>
> >> -void adv7533_mode_set(struct adv7511 *adv, const struct drm_display_mode *mode)
> >> +enum drm_mode_status adv7533_mode_valid(struct adv7511 *adv,
> >> +               const struct drm_display_mode *mode)
> >>   {
> >> +       int lanes;
> >>          struct mipi_dsi_device *dsi = adv->dsi;
> >> -       int lanes, ret;
> >> -
> >> -       if (adv->num_dsi_lanes != 4)
> >> -               return;
> >>
> >>          if (mode->clock > 80000)
> >>                  lanes = 4;
> >>          else
> >>                  lanes = 3;
> >>
> >> -       if (lanes != dsi->lanes) {
> >> -               mipi_dsi_detach(dsi);
> >> -               dsi->lanes = lanes;
> >> -               ret = mipi_dsi_attach(dsi);
> >> -               if (ret)
> >> -                       dev_err(&dsi->dev, "failed to change host lanes\n");
> >> -       }
> >> +       /*
> >> +        * TODO: add support for dynamic switching of lanes
> >> +        * by using the bridge pre_enable() op . Till then filter
> >> +        * out the modes which shall need different number of lanes
> >> +        * than what was configured in the device tree.
> >> +        */
> >> +       if (lanes != dsi->lanes)
> >> +               return MODE_BAD;
> >> +
> >> +       return MODE_OK;
> >>   }
> >>
> >>   int adv7533_patch_registers(struct adv7511 *adv)
> >> --
> >> 2.7.4
> >>
> >
> > This patch has some checkpatch --style warnings, with those fixed feel
> > free to add my r-b.
>
> I checked just now. I dont see any checkpatch errors on my end.
> I am not sure if we are running different versions of checkpatch but I
> am using the one at the tip of msm-next.
>
> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/scripts/checkpatch.pl

Ah, sorry. I made a typo in my above email. '--strict' not '--style'.

checkpatch --strict

>
> >
> > Reviewed-by: Robert Foss <robert.foss@linaro.org>
