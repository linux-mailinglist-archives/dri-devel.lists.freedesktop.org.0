Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 147605F4701
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 17:56:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8846310E5EF;
	Tue,  4 Oct 2022 15:56:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5854D10E5F0
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 15:56:05 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id f1so12332185ejw.7
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Oct 2022 08:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=vwdvyWrlvw60ZtE+i2fI3wCAbWwvi1H2EziU3JIpXg0=;
 b=HTZGcFNoc8xYbw5KdsxeXuq/0IyBwSx1Lqxr3A50ai/3I63IxmTzyhu8xkV1NodqJJ
 o7n0Myj97k1LVEYixf5dNj3t01RboDutqXqhubD4VLnaBlQvz51Tsm/aDyc210HVPTCJ
 haO9tFqUMO8EKeHDPxg5uv6ggAEtL6Pgx+5gcrOvbM8Xqk02lLPrmQOL9EtW/E4u0j8+
 T++IdOeI8nKEsxh/sVvShTrJlyqmgBiCWThezL6MYwNEpaNxHoDSzt2vjoYyUzfP1+cu
 YFia8EgyOC2snlvFPi48wD16RzFX3iO+mFVsR84ukXz1RXJmA7TXcxYC7CEwFl6Z7stx
 QAGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=vwdvyWrlvw60ZtE+i2fI3wCAbWwvi1H2EziU3JIpXg0=;
 b=zVDKk3XUv7+FrIvlTV8/NiGMl8asvASbxXQDlrCws10k/6vnsn5vxN4R0884Vqsqi8
 ypQelust950OqWnxkTi+Byz9UveuqLcE20jyCFPzOdZLe0rUaIqvIl8Z8sNNE49v7xzj
 QhSNjDe01UHADke2VwN5b8le/2pR8hNr+gQ8Ts2CmcKXoVnkz9xxA0X0VU2urdlEj7x/
 RIz9308pIbnU13CJW7kyF4XtcFVLEc7BjXDeOZ1/U0RJcMJ4QXcfWX4FP2Bt/wyc0tBg
 etBiPcGy3kldjDDUqc5Ibd8+NQLqLQynEGRh8LOufy/vyVD2x9Kn+KU4d/pD6YGEGUAY
 jDVw==
X-Gm-Message-State: ACrzQf30M6/ixVFtQgcpXsvkE22giJDmFP0mVR5rqUDD1a6JnEGqMy1F
 xQnnj9EhR0yZUiUdtcF7JN0bqMByWi5zikj79S7t28KXOo0=
X-Google-Smtp-Source: AMsMyM7gGfJjzXw20rabjgjTCWaYPIIucUoWdH2sWkwdYGEtRTbhyv2CnW0RgC2wIU5NQY3wfxdLH4FKta0aW+BoiwU=
X-Received: by 2002:a17:906:730e:b0:783:87a1:b5db with SMTP id
 di14-20020a170906730e00b0078387a1b5dbmr20165683ejc.383.1664898963632; Tue, 04
 Oct 2022 08:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <1661797363-7564-1-git-send-email-quic_abhinavk@quicinc.com>
In-Reply-To: <1661797363-7564-1-git-send-email-quic_abhinavk@quicinc.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 4 Oct 2022 17:55:52 +0200
Message-ID: <CAG3jFytm-zGsB23j+-myS1pnZAY1y848qkr45ER4yvHv-annvw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: adv7533: remove dynamic lane switching from
 adv7533 bridge
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

On Mon, 29 Aug 2022 at 20:23, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> adv7533 bridge tries to dynamically switch lanes based on the
> mode by detaching and attaching the mipi dsi device.
>
> This approach is incorrect because this method of dynamic switch of
> detaching and attaching the mipi dsi device also results in removing
> and adding the component which is not necessary.
>
> This approach is also prone to deadlocks. So for example, on the
> db410c whenever this path is executed with lockdep enabled,
> this results in a deadlock due to below ordering of locks.
>
> -> #1 (crtc_ww_class_acquire){+.+.}-{0:0}:
>         lock_acquire+0x6c/0x90
>         drm_modeset_acquire_init+0xf4/0x150
>         drmm_mode_config_init+0x220/0x770
>         msm_drm_bind+0x13c/0x654
>         try_to_bring_up_aggregate_device+0x164/0x1d0
>         __component_add+0xa8/0x174
>         component_add+0x18/0x2c
>         dsi_dev_attach+0x24/0x30
>         dsi_host_attach+0x98/0x14c
>         devm_mipi_dsi_attach+0x38/0xb0
>         adv7533_attach_dsi+0x8c/0x110
>         adv7511_probe+0x5a0/0x930
>         i2c_device_probe+0x30c/0x350
>         really_probe.part.0+0x9c/0x2b0
>         __driver_probe_device+0x98/0x144
>         driver_probe_device+0xac/0x14c
>         __device_attach_driver+0xbc/0x124
>         bus_for_each_drv+0x78/0xd0
>         __device_attach+0xa8/0x1c0
>         device_initial_probe+0x18/0x24
>         bus_probe_device+0xa0/0xac
>         deferred_probe_work_func+0x90/0xd0
>         process_one_work+0x28c/0x6b0
>         worker_thread+0x240/0x444
>         kthread+0x110/0x114
>         ret_from_fork+0x10/0x20
>
> -> #0 (component_mutex){+.+.}-{3:3}:
>         __lock_acquire+0x1280/0x20ac
>         lock_acquire.part.0+0xe0/0x230
>         lock_acquire+0x6c/0x90
>         __mutex_lock+0x84/0x400
>         mutex_lock_nested+0x3c/0x70
>         component_del+0x34/0x170
>         dsi_dev_detach+0x24/0x30
>         dsi_host_detach+0x20/0x64
>         mipi_dsi_detach+0x2c/0x40
>         adv7533_mode_set+0x64/0x90
>         adv7511_bridge_mode_set+0x210/0x214
>         drm_bridge_chain_mode_set+0x5c/0x84
>         crtc_set_mode+0x18c/0x1dc
>         drm_atomic_helper_commit_modeset_disables+0x40/0x50
>         msm_atomic_commit_tail+0x1d0/0x6e0
>         commit_tail+0xa4/0x180
>         drm_atomic_helper_commit+0x178/0x3b0
>         drm_atomic_commit+0xa4/0xe0
>         drm_client_modeset_commit_atomic+0x228/0x284
>         drm_client_modeset_commit_locked+0x64/0x1d0
>         drm_client_modeset_commit+0x34/0x60
>         drm_fb_helper_lastclose+0x74/0xcc
>         drm_lastclose+0x3c/0x80
>         drm_release+0xfc/0x114
>         __fput+0x70/0x224
>         ____fput+0x14/0x20
>         task_work_run+0x88/0x1a0
>         do_exit+0x350/0xa50
>         do_group_exit+0x38/0xa4
>         __wake_up_parent+0x0/0x34
>         invoke_syscall+0x48/0x114
>         el0_svc_common.constprop.0+0x60/0x11c
>         do_el0_svc+0x30/0xc0
>         el0_svc+0x58/0x100
>         el0t_64_sync_handler+0x1b0/0x1bc
>         el0t_64_sync+0x18c/0x190
>
> Due to above reasons, remove the dynamic lane switching
> code from adv7533 bridge chip and filter out the modes
> which would need different number of lanes as compared
> to the initialization time using the mode_valid callback.
>
> This can be potentially re-introduced by using the pre_enable()
> callback but this needs to be evaluated first whether such an
> approach will work so this will be done with a separate change.
>
> changes since RFC:
>         - Fix commit text and add TODO comment
>
> Fixes: 62b2f026cd8e ("drm/bridge: adv7533: Change number of DSI lanes dynamically")
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/16
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511.h     |  3 ++-
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 18 ++++++++++++++----
>  drivers/gpu/drm/bridge/adv7511/adv7533.c     | 25 +++++++++++++------------
>  3 files changed, 29 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> index 9e3bb8a8ee40..0a7cec80b75d 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> @@ -417,7 +417,8 @@ static inline int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
>
>  void adv7533_dsi_power_on(struct adv7511 *adv);
>  void adv7533_dsi_power_off(struct adv7511 *adv);
> -void adv7533_mode_set(struct adv7511 *adv, const struct drm_display_mode *mode);
> +enum drm_mode_status adv7533_mode_valid(struct adv7511 *adv,
> +               const struct drm_display_mode *mode);
>  int adv7533_patch_registers(struct adv7511 *adv);
>  int adv7533_patch_cec_registers(struct adv7511 *adv);
>  int adv7533_attach_dsi(struct adv7511 *adv);
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index 5bb9300040dd..1115ef9be83c 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -697,7 +697,7 @@ adv7511_detect(struct adv7511 *adv7511, struct drm_connector *connector)
>  }
>
>  static enum drm_mode_status adv7511_mode_valid(struct adv7511 *adv7511,
> -                             struct drm_display_mode *mode)
> +                             const struct drm_display_mode *mode)
>  {
>         if (mode->clock > 165000)
>                 return MODE_CLOCK_HIGH;
> @@ -791,9 +791,6 @@ static void adv7511_mode_set(struct adv7511 *adv7511,
>         regmap_update_bits(adv7511->regmap, 0x17,
>                 0x60, (vsync_polarity << 6) | (hsync_polarity << 5));
>
> -       if (adv7511->type == ADV7533 || adv7511->type == ADV7535)
> -               adv7533_mode_set(adv7511, adj_mode);
> -
>         drm_mode_copy(&adv7511->curr_mode, adj_mode);
>
>         /*
> @@ -913,6 +910,18 @@ static void adv7511_bridge_mode_set(struct drm_bridge *bridge,
>         adv7511_mode_set(adv, mode, adj_mode);
>  }
>
> +static enum drm_mode_status adv7511_bridge_mode_valid(struct drm_bridge *bridge,
> +               const struct drm_display_info *info,
> +               const struct drm_display_mode *mode)
> +{
> +       struct adv7511 *adv = bridge_to_adv7511(bridge);
> +
> +       if (adv->type == ADV7533 || adv->type == ADV7535)
> +               return adv7533_mode_valid(adv, mode);
> +       else
> +               return adv7511_mode_valid(adv, mode);
> +}
> +
>  static int adv7511_bridge_attach(struct drm_bridge *bridge,
>                                  enum drm_bridge_attach_flags flags)
>  {
> @@ -960,6 +969,7 @@ static const struct drm_bridge_funcs adv7511_bridge_funcs = {
>         .enable = adv7511_bridge_enable,
>         .disable = adv7511_bridge_disable,
>         .mode_set = adv7511_bridge_mode_set,
> +       .mode_valid = adv7511_bridge_mode_valid,
>         .attach = adv7511_bridge_attach,
>         .detect = adv7511_bridge_detect,
>         .get_edid = adv7511_bridge_get_edid,
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> index ef6270806d1d..5f590abd6403 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> @@ -100,26 +100,27 @@ void adv7533_dsi_power_off(struct adv7511 *adv)
>         regmap_write(adv->regmap_cec, 0x27, 0x0b);
>  }
>
> -void adv7533_mode_set(struct adv7511 *adv, const struct drm_display_mode *mode)
> +enum drm_mode_status adv7533_mode_valid(struct adv7511 *adv,
> +               const struct drm_display_mode *mode)
>  {
> +       int lanes;
>         struct mipi_dsi_device *dsi = adv->dsi;
> -       int lanes, ret;
> -
> -       if (adv->num_dsi_lanes != 4)
> -               return;
>
>         if (mode->clock > 80000)
>                 lanes = 4;
>         else
>                 lanes = 3;
>
> -       if (lanes != dsi->lanes) {
> -               mipi_dsi_detach(dsi);
> -               dsi->lanes = lanes;
> -               ret = mipi_dsi_attach(dsi);
> -               if (ret)
> -                       dev_err(&dsi->dev, "failed to change host lanes\n");
> -       }
> +       /*
> +        * TODO: add support for dynamic switching of lanes
> +        * by using the bridge pre_enable() op . Till then filter
> +        * out the modes which shall need different number of lanes
> +        * than what was configured in the device tree.
> +        */
> +       if (lanes != dsi->lanes)
> +               return MODE_BAD;
> +
> +       return MODE_OK;
>  }
>
>  int adv7533_patch_registers(struct adv7511 *adv)
> --
> 2.7.4
>

This patch has some checkpatch --style warnings, with those fixed feel
free to add my r-b.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
