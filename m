Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2018A48970A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 12:11:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1CDF12BF88;
	Mon, 10 Jan 2022 11:11:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF94F12BE94
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 11:10:59 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id t24so4221553edi.8
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 03:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CXSeGDl9GEnIcylqs/1aBf6AR889kIkbNFCuxw4a9ik=;
 b=IoBifoFOlq6FSx9kh2gVTCGjkUq9zBBdlSfPS2+eyO0plmV4lQNbCONhoG0Os0yarC
 0fmGODcIpqXxJix1xJya55nFZ6n+ecPYtBnoSLPAuK1AAT6Dh0KopTEVoY8Dnzw/Z4XZ
 KpaEuMhDkkWiPivrSPaccFq0ltS8pfeqDIrlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CXSeGDl9GEnIcylqs/1aBf6AR889kIkbNFCuxw4a9ik=;
 b=jpkoxSHrCE3M00ac+t9wqyBIHt4maErCKlkICo20ZwnFkYhS/mCrnNkV2ydb/tRlT7
 rDxmNwf/sy/agCMTT81zN04rXul9goQuWeUpoOeJs/xOjv6QCrQuIiYeRkoV8V66D9O2
 6055QUmMZLcZl1dM7ZBwydJFJG0Gb5Ma22xR5hO6ZfXBzQPLbOq2CE+3KyKIXaD+MeUt
 WSZG++9U6gr9EwdZZGnsjUMjuznkf+zBVy0uQrgEnbkENp3wnSztByk74B+5HXvUZSaR
 zBDVZWMx9JnNDqsCw7kj+dJqQ7JBcMIPFMXdncQLIpdVcC/gVtX0BatlfmEZi7cPGnkH
 y8kQ==
X-Gm-Message-State: AOAM531d8M9OEEY1agZ1k6n4Ft4bxnATFK1vRNRN2xBGnc6eidCxCpDY
 w8OQVTesld9pReKy9PdidVTNrptnZeHV+1Q/TmzYEA==
X-Google-Smtp-Source: ABdhPJy9ChXkdHe6tXxzyFok8K4bUWoMxwd0LHFVjnk95naG2GfcK3LW+w+CR6DTBcKDyTaH4FDsDba3BYDoB+hAOnk=
X-Received: by 2002:a05:6402:230e:: with SMTP id
 l14mr64882839eda.370.1641813058120; 
 Mon, 10 Jan 2022 03:10:58 -0800 (PST)
MIME-Version: 1.0
References: <CGME20211215101548eucas1p2a7f4a64ae55364181eec3db3ad5d6ef7@eucas1p2.samsung.com>
 <20211215101534.45003-1-jagan@amarulasolutions.com>
 <39f646d7-9d49-045a-2cf5-3cdc12486cb3@samsung.com>
 <CAMty3ZBmZo3wqzj2Si4Ydm1RtzGs7f89aCktgVvD==appfSCPQ@mail.gmail.com>
 <fe49e59a-1df7-fcdc-8258-581509bb8fe2@samsung.com>
 <CAMty3ZCSrqcnO1i5ADJhQx_Dt5GbT+-eyhauJhqg=wJXOTWK-A@mail.gmail.com>
 <fc773566-760d-19ec-0879-3ee88c06b425@samsung.com>
 <012176de-a246-4dfe-1779-e15f498f1d72@samsung.com>
In-Reply-To: <012176de-a246-4dfe-1779-e15f498f1d72@samsung.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 10 Jan 2022 16:40:46 +0530
Message-ID: <CAMty3ZAqUtG_r9VhOcTkWQ6BRKLUT-8OZ9whaVrRhVALEab0+Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] drm: exynos: dsi: Convert drm bridge
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-amarula@amarulasolutions.com,
 dri-devel@lists.freedesktop.org, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Thu, Dec 23, 2021 at 2:45 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Jagan,
>
> On 18.12.2021 00:16, Marek Szyprowski wrote:
> > On 15.12.2021 15:56, Jagan Teki wrote:
> >> On Wed, Dec 15, 2021 at 7:49 PM Marek Szyprowski
> >> <m.szyprowski@samsung.com> wrote:
> >>> On 15.12.2021 13:57, Jagan Teki wrote:
> >>>> On Wed, Dec 15, 2021 at 5:31 PM Marek Szyprowski
> >>>> <m.szyprowski@samsung.com> wrote:
> >>>>> On 15.12.2021 11:15, Jagan Teki wrote:
> >>>>>> Updated series about drm bridge conversion of exynos dsi.
> >>>>>> Previous version can be accessible, here [1].
> >>>>>>
> >>>>>> Patch 1: connector reset
> >>>>>>
> >>>>>> Patch 2: panel_bridge API
> >>>>>>
> >>>>>> Patch 3: Bridge conversion
> >>>>>>
> >>>>>> Patch 4: Atomic functions
> >>>>>>
> >>>>>> Patch 5: atomic_set
> >>>>>>
> >>>>>> Patch 6: DSI init in enable
> >>>>> There is a little progress! :)
> >>>>>
> >>>>> Devices with a simple display pipeline (only a DSI panel, like
> >>>>> Trats/Trats2) works till the last patch. Then, after applying
> >>>>> ("[PATCH
> >>>>> v4 6/6] drm: exynos: dsi: Move DSI init in bridge enable"), I get no
> >>>>> display at all.
> >>>>>
> >>>>> A TM2e board with in-bridge (Exynos MIC) stops displaying anything
> >>>>> after
> >>>>> applying patch "[PATCH v4 2/6] drm: exynos: dsi: Use drm
> >>>>> panel_bridge API".
> >>>>>
> >>>>> In case of the Arndale board with tc358764 bridge, no much
> >>>>> progress. The
> >>>>> display is broken just after applying the "[PATCH v2] drm: bridge:
> >>>>> tc358764: Use drm panel_bridge API" patch on top of linux-next.
> >>>>>
> >>>>> In all cases the I had "drm: of: Lookup if child node has panel or
> >>>>> bridge" patch applied.
> >>>> Just skip the 6/6 for now.
> >>>>
> >>>> Apply
> >>>> -
> >>>> https://protect2.fireeye.com/v1/url?k=a24f3f76-fdd40659-a24eb439-0cc47a31cdf8-97ea12b4c5258d11&q=1&e=37a169bf-7ca5-4362-aad7-486018c7a708&u=https%3A%2F%2Fpatchwork.amarulasolutions.com%2Fpatch%2F1825%2F
> >>>> -
> >>>> https://protect2.fireeye.com/v1/url?k=a226360f-fdbd0f20-a227bd40-0cc47a31cdf8-ebd66aebee1058d7&q=1&e=37a169bf-7ca5-4362-aad7-486018c7a708&u=https%3A%2F%2Fpatchwork.amarulasolutions.com%2Fpatch%2F1823%2F
> >>>>
> >>>> Then apply 1/6 to 5/6.  and update the status?
> >>> Okay, my fault, I didn't check that case on Arndale.
> >>>
> >>> I've checked and indeed, Trats/Trats2 and Arndale works after the above
> >>> 2 patches AND patches 1-5.
> >>>
> >>> The only problem is now on TM2e, which uses Exynos MIC as in-bridge for
> >>> Exynos DSI:
> >>>
> >>> [    4.068866] [drm] Exynos DRM: using 13800000.decon device for DMA
> >>> mapping operations
> >>> [    4.069183] exynos-drm exynos-drm: bound 13800000.decon (ops
> >>> decon_component_ops)
> >>> [    4.128983] exynos-drm exynos-drm: bound 13880000.decon (ops
> >>> decon_component_ops)
> >>> [    4.129261] exynos-drm exynos-drm: bound 13930000.mic (ops
> >>> exynos_mic_component_ops)
> >>> [    4.133508] exynos-dsi 13900000.dsi: [drm:exynos_dsi_host_attach]
> >>> *ERROR* failed to find the bridge: -19
> >>> [    4.136392] exynos-drm exynos-drm: bound 13900000.dsi (ops
> >>> exynos_dsi_component_ops)
> >>> [    4.145499] rc_core: Couldn't load IR keymap rc-cec
> >>> [    4.145666] Registered IR keymap rc-empty
> >>> [    4.148402] rc rc0: sii8620 as /devices/virtual/rc/rc0
> >>> [    4.156051] input: sii8620 as /devices/virtual/rc/rc0/input1
> >>> [    4.160647] exynos-drm exynos-drm: bound 13970000.hdmi (ops
> >>> hdmi_component_ops)
> >>> [    4.169923] exynos-drm exynos-drm: [drm] Cannot find any crtc or
> >>> sizes
> >>> [    4.173958] exynos-drm exynos-drm: [drm] Cannot find any crtc or
> >>> sizes
> >>> [    4.182304] [drm] Initialized exynos 1.1.0 20180330 for
> >>> exynos-drm on
> >>> minor 0
> >>>
> >>> The display pipeline for TM2e is:
> >>>
> >>> Exynos5433 Decon -> Exynos MIC -> Exynos DSI -> s6e3ha2 DSI panel
> >> If Trats/Trats2 is working then it has to work. I don't see any
> >> difference in output pipeline. Can you please share the full log, I
> >> cannot see host_attach print saying "Attached.."
> >
> > Well, there is a failure message about the panel:
> >
> > exynos-dsi 13900000.dsi: [drm:exynos_dsi_host_attach] *ERROR* failed
> > to find the bridge: -19
> >
> > however it looks that something might be broken in dts. The in-bridge
> > (Exynos MIC) is on port 0 and the panel is @0, what imho might cause
> > the issue.
> >
> > I've tried to change in in-bridge ('mic_to_dsi') port to 1 in
> > exynos5433.dtsi. Then the panel has been attached:
> >
> > exynos-dsi 13900000.dsi: [drm:exynos_dsi_host_attach] Attached s6e3hf2
> > device
> >
> > but the display is still not working, probably due to lack of proper
> > Exynos MIC handling. I will investigate it later and let You know.
>
>
> I've played a bit with the Exynos DRM code and finally I made it working
> on TM2(e). There are basically 3 different issues that need to be fixed
> to get it working with the $subject patchset:
>
> 1. Port numbers in exynos5433 dsi/dts are broken. For all pre-Exynos5433
> boards the panel was defined as a DSI node child (at 'reg 0'), what
> means it used port 0. Then, Exynos5433 introduced so called RGB-in at
> port 0 and panel at port 1 (as described in the dt bindings). However
> the committed Exynos5433 dtsi and TM2(e) dts still defined panel as a
> DSI child (with reg=0, so port 0) and Exynos MIC as of-graph at port 0.
> The Exynos DSI code however always searched for a panel as a DSI child
> node, so it worked fine, even though the panel and exynos mic used in
> fact the 'port 0'. IMHO this can be fixed by the following patch:
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> index bfe4ed8a23d6..2718c752d916 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> @@ -1046,8 +1046,8 @@
>                                  #address-cells = <1>;
>                                  #size-cells = <0>;
>
> -                               port@0 {
> -                                       reg = <0>;
> +                               port@1 {
> +                                       reg = <1>;
>                                          dsi_to_mic: endpoint {
>                                                  remote-endpoint =
> <&mic_to_dsi>;
>                                          };
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index d2933a70c01f..e8e2df339c5f 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -220,8 +220,8 @@ enum exynos_dsi_transfer_type {
>   };
>
>   enum {
> -       DSI_PORT_IN,
> -       DSI_PORT_OUT
> +       DSI_PORT_OUT,
> +       DSI_PORT_IN
>   };
>
>   struct exynos_dsi_transfer {
> --
>

port@1 of mic is invalid, it is input to DSI so it has to be port@0
with proper pipeline on dts file can fix the things.

--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts
@@ -51,6 +51,16 @@ &cmu_disp {
 };

 &dsi {
+       ports {
+               port@1 {
+                       reg = <1>;
+
+                       dsi_out_panel: endpoint {
+                               remote-endpoint = <&dsi_in_panel>;
+                       };
+               };
+       };
+
        panel@0 {
                compatible = "samsung,s6e3hf2";
                reg = <0>;
@@ -58,6 +68,12 @@ panel@0 {
                vci-supply = <&ldo28_reg>;
                reset-gpios = <&gpg0 0 GPIO_ACTIVE_LOW>;
                enable-gpios = <&gpf1 5 GPIO_ACTIVE_HIGH>;
+
+               port {
+                       dsi_in_panel: endpoint {
+                               remote-endpoint = <&dsi_out_panel>;
+                       };
+               };
        };
 };

> 2. (devm_)drm_of_get_bridge() ignores panel's 'reg' property and it is
> unable to find a panel if there is a 'ports' child node (even if it
> describes completely different port than the one requested by the
> caller). I don't have time now to fix this, a simple and ugly workaround
> for that is to define the complete of-graph for the DSI child panel:
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts
> b/arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts
> index 22d26460f3dd..4726c325bd2c 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts
> @@ -58,6 +58,27 @@
>                  vci-supply = <&ldo28_reg>;
>                  reset-gpios = <&gpg0 0 GPIO_ACTIVE_LOW>;
>                  enable-gpios = <&gpf1 5 GPIO_ACTIVE_HIGH>;
> +
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       port@0 {
> +                               reg = <0>;
> +                               panel_to_dsi: endpoint {
> +                                       remote-endpoint = <&dsi_to_panel>;
> +                               };
> +                       };
> +               };
> +       };
> +
> +       ports {
> +               port@0 {
> +                       reg = <0>;
> +                       dsi_to_panel: endpoint {
> +                               remote-endpoint = <&panel_to_dsi>;
> +                       };
> +               };
>          };
>   };
>
> --
>
> 3. Lack of proper handling of the 'in-bridge' in the Exynos DSI after
> Your conversion. Initially I thought that this could be fixed with the
> following simple patch:
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index e8e2df339c5f..2fe9c995549f 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -259,6 +259,7 @@ struct exynos_dsi {
>          struct mipi_dsi_host dsi_host;
>          struct drm_bridge bridge;
>          struct drm_bridge *out_bridge;
> +       struct drm_bridge *in_bridge;
>          struct device *dev;
>
>          void __iomem *reg_base;
> @@ -1535,7 +1536,7 @@ static int exynos_dsi_host_attach(struct
> mipi_dsi_host *host,
>
>          drm_bridge_add(&dsi->bridge);
>
> -       drm_bridge_attach(encoder, &dsi->bridge, NULL, 0);
> +       drm_bridge_attach(encoder, &dsi->bridge, dsi->in_bridge, 0);
>
>          /*
>           * This is a temporary solution and should be made by more
> generic way.
> @@ -1674,7 +1675,6 @@ static int exynos_dsi_bind(struct device *dev,
> struct device *master,
>          struct drm_encoder *encoder = &dsi->encoder;
>          struct drm_device *drm_dev = data;
>          struct device_node *in_bridge_node;
> -       struct drm_bridge *in_bridge;
>          int ret;
>
>          printk("drm: %s enter\n", __func__);
> @@ -1688,9 +1688,10 @@ static int exynos_dsi_bind(struct device *dev,
> struct device *master,
>          }
>          in_bridge_node = of_graph_get_remote_node(dev->of_node,
> DSI_PORT_IN, 0);
>          if (in_bridge_node) {
> -               in_bridge = of_drm_find_bridge(in_bridge_node);
> -               if (in_bridge)
> -                       drm_bridge_attach(encoder, in_bridge, NULL, 0);
> +               dsi->in_bridge = of_drm_find_bridge(in_bridge_node);
> +               if (dsi->in_bridge) {
> +                       drm_bridge_attach(encoder, dsi->in_bridge, NULL, 0);
> +               }
>                  of_node_put(in_bridge_node);
>          }
>
> --
>
> but it turned out that in such case the order of the bridge 'enable'
> calls is not correct for display pipeline operation. The one that
> actually works is (sorry for the hacky code):
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index e8e2df339c5f..51b568556fce 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -259,6 +259,7 @@ struct exynos_dsi {
>          struct mipi_dsi_host dsi_host;
>          struct drm_bridge bridge;
>          struct drm_bridge *out_bridge;
> +       struct drm_bridge *in_bridge;
>          struct device *dev;
>
>          void __iomem *reg_base;
> @@ -1424,6 +1425,9 @@ static void exynos_dsi_atomic_pre_enable(struct
> drm_bridge *bridge,
>
>          dsi->state |= DSIM_STATE_ENABLED;
>          printk("drm: %s finish: %d\n", __func__, 0);
> +
> +       if (dsi->in_bridge)
> + dsi->in_bridge->funcs->pre_enable(dsi->in_bridge);
>   }
>
>   static void exynos_dsi_atomic_enable(struct drm_bridge *bridge,
> @@ -1439,6 +1443,9 @@ static void exynos_dsi_atomic_enable(struct
> drm_bridge *bridge,
>
>          printk("drm: %s finish: %d\n", __func__, 0);
>
> +       if (dsi->in_bridge)
> + dsi->in_bridge->funcs->enable(dsi->in_bridge);
> +
>          return;
>   }
>
> @@ -1455,6 +1462,8 @@ static void exynos_dsi_atomic_disable(struct
> drm_bridge *bridge,
>          dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
>          printk("drm: %s finish: %d\n", __func__, 0);
>
> +       if (dsi->in_bridge)
> + dsi->in_bridge->funcs->disable(dsi->in_bridge);
>   }
>
>   static void exynos_dsi_atomic_post_disable(struct drm_bridge *bridge,
> @@ -1470,6 +1479,8 @@ static void exynos_dsi_atomic_post_disable(struct
> drm_bridge *bridge,
>
>          printk("drm: %s finish: %d\n", __func__, 0);
>
> +       if (dsi->in_bridge)
> + dsi->in_bridge->funcs->post_disable(dsi->in_bridge);
>   }
>
>   static void exynos_dsi_mode_set(struct drm_bridge *bridge,
> @@ -1482,6 +1493,10 @@ static void exynos_dsi_mode_set(struct drm_bridge
> *bridge,
>
>          drm_mode_copy(&dsi->mode, adjusted_mode);
>          printk("drm: %s finish: %d\n", __func__, ret);
> +
> +       if (dsi->in_bridge)
> + dsi->in_bridge->funcs->mode_set(dsi->in_bridge, mode,
> +                                               adjusted_mode);
>   }
>
>   static int exynos_dsi_attach(struct drm_bridge *bridge,
>   @@ -1674,7 +1689,6 @@ static int exynos_dsi_bind(struct device *dev,
> struct device *master,
>          struct drm_encoder *encoder = &dsi->encoder;
>          struct drm_device *drm_dev = data;
>          struct device_node *in_bridge_node;
> -       struct drm_bridge *in_bridge;
>          int ret;
>
>          printk("drm: %s enter\n", __func__);
> @@ -1688,9 +1702,11 @@ static int exynos_dsi_bind(struct device *dev,
> struct device *master,
>          }
>          in_bridge_node = of_graph_get_remote_node(dev->of_node,
> DSI_PORT_IN, 0);
>          if (in_bridge_node) {
> -               in_bridge = of_drm_find_bridge(in_bridge_node);
> -               if (in_bridge)
> -                       drm_bridge_attach(encoder, in_bridge, NULL, 0);
> +               dsi->in_bridge = of_drm_find_bridge(in_bridge_node);
> +               if (dsi->in_bridge) {
> +                       drm_bridge_attach(encoder, dsi->in_bridge, NULL, 0);
> + INIT_LIST_HEAD(&encoder->bridge_chain);
> +               }
>                  of_node_put(in_bridge_node);
>          }
>
> --

I'm not quite sure of having in_bridge require explicit chain
handling. It is the job of drm code as it finds the chain and invoke
it. On the other hand, if it MIC is registered as bridge then the
respective bridge calls has to be in their driver.

Let me fix the exynos5433 and send apart of the same series. then we
can continue to see the trouble necks.

will that be fine?

Thanks,
Jagan.
