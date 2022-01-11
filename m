Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6DA48AEC3
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 14:45:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D76010E535;
	Tue, 11 Jan 2022 13:45:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C150810E535
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 13:45:25 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id c71so55844063edf.6
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 05:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TrqykPNLKbqc1afwnW9pLwfcbJ3D4idndcGxi/5iX/k=;
 b=JTEDjdMc/CyCiGl8uF3l/nHqApyT2FO/feLCR3ddjPAqJJ95jSbpPikqjTGby2eIvX
 InWbiQAIXdtkqn+Piq8yWD31QhrvYbTZNKnAk0w12HwKLScKoVw7Xlxx2L1Ywy7uGVc7
 eyJXf0e881MR33fFBSHxh9uflrUYzVU6S7t8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TrqykPNLKbqc1afwnW9pLwfcbJ3D4idndcGxi/5iX/k=;
 b=C6asYWSIKGGqoR4KYrNYZQsP5OBhDW+fMmv4E4mq5oyUfKGA/inHwIxKLgTXkTKGzW
 gnHwgoe9IYr89YvrL+nxRViUDDnl4EeMxTuYGGpkXg13ZUI/B+x/6kcu5bKOJ3FuNyim
 s5u8s8plX2KqF+JGtew5tLMsqC/b9E2YBCzS2s+kt82CfVDUONL0ZPwPpcyOIhUvp6MJ
 gd3G+9ItomGOIIMk9le77OPZE8YueT6RZ1mh/Ddyc5DqI0tKXzxw2NxHdYg2NLPfKpaW
 BBLfFpvdxIqsCDkxCjemmlQd9gwtoPh7STB8RCLXXQb84bpxv6CF+bZv1fHOFn5wP5V6
 IuYQ==
X-Gm-Message-State: AOAM533CDx4nGit0z7k9Zo04hp4qTm8fwzShwN818vU8vJ/plaTFNuj2
 ZJ/ayYLNqUQVQ8wXdl8K3hqu39a4cZjtH7EqY+G2Eg==
X-Google-Smtp-Source: ABdhPJwqIJtefIDA1NaEW5o+XbGcrTgCw7WMhB9H9JN0TTjE1ChfZreTFZPoWnV1Ac3OXQGx7p8kjdddonr9+5KieeA=
X-Received: by 2002:a17:906:6a0c:: with SMTP id
 qw12mr3809115ejc.620.1641908722836; 
 Tue, 11 Jan 2022 05:45:22 -0800 (PST)
MIME-Version: 1.0
References: <CGME20211215101548eucas1p2a7f4a64ae55364181eec3db3ad5d6ef7@eucas1p2.samsung.com>
 <20211215101534.45003-1-jagan@amarulasolutions.com>
 <39f646d7-9d49-045a-2cf5-3cdc12486cb3@samsung.com>
 <CAMty3ZBmZo3wqzj2Si4Ydm1RtzGs7f89aCktgVvD==appfSCPQ@mail.gmail.com>
 <fe49e59a-1df7-fcdc-8258-581509bb8fe2@samsung.com>
 <CAMty3ZCSrqcnO1i5ADJhQx_Dt5GbT+-eyhauJhqg=wJXOTWK-A@mail.gmail.com>
 <fc773566-760d-19ec-0879-3ee88c06b425@samsung.com>
 <012176de-a246-4dfe-1779-e15f498f1d72@samsung.com>
 <e541c52b-9751-933b-5eac-783dd0ed9056@intel.com>
 <CAMty3ZBT0oXvT99px_vnn0xmZ3cc1H6VvAgL6nDVbhtLKFyy7w@mail.gmail.com>
 <44d7e2ac-b92a-b815-e4e9-9cb6ff9e8a49@intel.com>
In-Reply-To: <44d7e2ac-b92a-b815-e4e9-9cb6ff9e8a49@intel.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 11 Jan 2022 19:15:11 +0530
Message-ID: <CAMty3ZDt3__hFp+T7uScM4in2KZLgGbGgCODHcxZ8pmFc5Cf+Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] drm: exynos: dsi: Convert drm bridge
To: Andrzej Hajda <andrzej.hajda@intel.com>
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
 Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 11, 2022 at 5:20 PM Andrzej Hajda <andrzej.hajda@intel.com> wrote:
>
> Hi Jagan,
>
> On 11.01.2022 10:32, Jagan Teki wrote:
> > Hi Andrzej,
> >
> > On Tue, Dec 28, 2021 at 4:18 PM Andrzej Hajda <andrzej.hajda@intel.com> wrote:
> >> Hi Marek,
> >>
> >> On 23.12.2021 10:15, Marek Szyprowski wrote:
> >>> Hi Jagan,
> >>>
> >>> On 18.12.2021 00:16, Marek Szyprowski wrote:
> >>>> On 15.12.2021 15:56, Jagan Teki wrote:
> >>>>> On Wed, Dec 15, 2021 at 7:49 PM Marek Szyprowski
> >>>>> <m.szyprowski@samsung.com> wrote:
> >>>>>> On 15.12.2021 13:57, Jagan Teki wrote:
> >>>>>>> On Wed, Dec 15, 2021 at 5:31 PM Marek Szyprowski
> >>>>>>> <m.szyprowski@samsung.com> wrote:
> >>>>>>>> On 15.12.2021 11:15, Jagan Teki wrote:
> >>>>>>>>> Updated series about drm bridge conversion of exynos dsi.
> >>>>>>>>> Previous version can be accessible, here [1].
> >>>>>>>>>
> >>>>>>>>> Patch 1: connector reset
> >>>>>>>>>
> >>>>>>>>> Patch 2: panel_bridge API
> >>>>>>>>>
> >>>>>>>>> Patch 3: Bridge conversion
> >>>>>>>>>
> >>>>>>>>> Patch 4: Atomic functions
> >>>>>>>>>
> >>>>>>>>> Patch 5: atomic_set
> >>>>>>>>>
> >>>>>>>>> Patch 6: DSI init in enable
> >>>>>>>> There is a little progress! :)
> >>>>>>>>
> >>>>>>>> Devices with a simple display pipeline (only a DSI panel, like
> >>>>>>>> Trats/Trats2) works till the last patch. Then, after applying
> >>>>>>>> ("[PATCH
> >>>>>>>> v4 6/6] drm: exynos: dsi: Move DSI init in bridge enable"), I get no
> >>>>>>>> display at all.
> >>>>>>>>
> >>>>>>>> A TM2e board with in-bridge (Exynos MIC) stops displaying anything
> >>>>>>>> after
> >>>>>>>> applying patch "[PATCH v4 2/6] drm: exynos: dsi: Use drm
> >>>>>>>> panel_bridge API".
> >>>>>>>>
> >>>>>>>> In case of the Arndale board with tc358764 bridge, no much
> >>>>>>>> progress. The
> >>>>>>>> display is broken just after applying the "[PATCH v2] drm: bridge:
> >>>>>>>> tc358764: Use drm panel_bridge API" patch on top of linux-next.
> >>>>>>>>
> >>>>>>>> In all cases the I had "drm: of: Lookup if child node has panel or
> >>>>>>>> bridge" patch applied.
> >>>>>>> Just skip the 6/6 for now.
> >>>>>>>
> >>>>>>> Apply
> >>>>>>> -
> >>>>>>> https://protect2.fireeye.com/v1/url?k=a24f3f76-fdd40659-a24eb439-0cc47a31cdf8-97ea12b4c5258d11&q=1&e=37a169bf-7ca5-4362-aad7-486018c7a708&u=https%3A%2F%2Fpatchwork.amarulasolutions.com%2Fpatch%2F1825%2F
> >>>>>>> -
> >>>>>>> https://protect2.fireeye.com/v1/url?k=a226360f-fdbd0f20-a227bd40-0cc47a31cdf8-ebd66aebee1058d7&q=1&e=37a169bf-7ca5-4362-aad7-486018c7a708&u=https%3A%2F%2Fpatchwork.amarulasolutions.com%2Fpatch%2F1823%2F
> >>>>>>>
> >>>>>>> Then apply 1/6 to 5/6.  and update the status?
> >>>>>> Okay, my fault, I didn't check that case on Arndale.
> >>>>>>
> >>>>>> I've checked and indeed, Trats/Trats2 and Arndale works after the above
> >>>>>> 2 patches AND patches 1-5.
> >>>>>>
> >>>>>> The only problem is now on TM2e, which uses Exynos MIC as in-bridge for
> >>>>>> Exynos DSI:
> >>>>>>
> >>>>>> [    4.068866] [drm] Exynos DRM: using 13800000.decon device for DMA
> >>>>>> mapping operations
> >>>>>> [    4.069183] exynos-drm exynos-drm: bound 13800000.decon (ops
> >>>>>> decon_component_ops)
> >>>>>> [    4.128983] exynos-drm exynos-drm: bound 13880000.decon (ops
> >>>>>> decon_component_ops)
> >>>>>> [    4.129261] exynos-drm exynos-drm: bound 13930000.mic (ops
> >>>>>> exynos_mic_component_ops)
> >>>>>> [    4.133508] exynos-dsi 13900000.dsi: [drm:exynos_dsi_host_attach]
> >>>>>> *ERROR* failed to find the bridge: -19
> >>>>>> [    4.136392] exynos-drm exynos-drm: bound 13900000.dsi (ops
> >>>>>> exynos_dsi_component_ops)
> >>>>>> [    4.145499] rc_core: Couldn't load IR keymap rc-cec
> >>>>>> [    4.145666] Registered IR keymap rc-empty
> >>>>>> [    4.148402] rc rc0: sii8620 as /devices/virtual/rc/rc0
> >>>>>> [    4.156051] input: sii8620 as /devices/virtual/rc/rc0/input1
> >>>>>> [    4.160647] exynos-drm exynos-drm: bound 13970000.hdmi (ops
> >>>>>> hdmi_component_ops)
> >>>>>> [    4.169923] exynos-drm exynos-drm: [drm] Cannot find any crtc or
> >>>>>> sizes
> >>>>>> [    4.173958] exynos-drm exynos-drm: [drm] Cannot find any crtc or
> >>>>>> sizes
> >>>>>> [    4.182304] [drm] Initialized exynos 1.1.0 20180330 for
> >>>>>> exynos-drm on
> >>>>>> minor 0
> >>>>>>
> >>>>>> The display pipeline for TM2e is:
> >>>>>>
> >>>>>> Exynos5433 Decon -> Exynos MIC -> Exynos DSI -> s6e3ha2 DSI panel
> >>>>> If Trats/Trats2 is working then it has to work. I don't see any
> >>>>> difference in output pipeline. Can you please share the full log, I
> >>>>> cannot see host_attach print saying "Attached.."
> >>>> Well, there is a failure message about the panel:
> >>>>
> >>>> exynos-dsi 13900000.dsi: [drm:exynos_dsi_host_attach] *ERROR* failed
> >>>> to find the bridge: -19
> >>>>
> >>>> however it looks that something might be broken in dts. The in-bridge
> >>>> (Exynos MIC) is on port 0 and the panel is @0, what imho might cause
> >>>> the issue.
> >>>>
> >>>> I've tried to change in in-bridge ('mic_to_dsi') port to 1 in
> >>>> exynos5433.dtsi. Then the panel has been attached:
> >>>>
> >>>> exynos-dsi 13900000.dsi: [drm:exynos_dsi_host_attach] Attached s6e3hf2
> >>>> device
> >>>>
> >>>> but the display is still not working, probably due to lack of proper
> >>>> Exynos MIC handling. I will investigate it later and let You know.
> >>> I've played a bit with the Exynos DRM code and finally I made it working
> >>> on TM2(e). There are basically 3 different issues that need to be fixed
> >>> to get it working with the $subject patchset:
> >>>
> >>> 1. Port numbers in exynos5433 dsi/dts are broken. For all pre-Exynos5433
> >>> boards the panel was defined as a DSI node child (at 'reg 0'),
> >>
> >> True, emphasis that it is reg 0 of DSI bus.
> >>
> >>
> >>>    what
> >>> means it used port 0.
> >>
> >> And this does not seems true to me. Established practice is (unless I
> >> have not noticed change in bindings :) ) that in case of data bus shared
> >> with control bus the port node is optional. In such case host knows
> >> already who is connected to its data bus, it does not need port node.
> >> And if there is no port node there is no port number as well.
> >>
> >> As I quickly looked at the exynos bindings they seems generally OK to
> >> me, if there is something wrong/suspicious let me know.
> >>
> >>
> >>>    Then, Exynos5433 introduced so called RGB-in at
> >>> port 0 and panel at port 1 (as described in the dt bindings).However
> >>> the committed Exynos5433 dtsi and TM2(e) dts still defined panel as a
> >>> DSI child (with reg=0, so port 0) and Exynos MIC as of-graph at port 0.
> >>> The Exynos DSI code however always searched for a panel as a DSI child
> >>> node, so it worked fine, even though the panel and exynos mic used in
> >>> fact the 'port 0'. IMHO this can be fixed by the following patch:
> >>>
> >>> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> >>> b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> >>> index bfe4ed8a23d6..2718c752d916 100644
> >>> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> >>> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> >>> @@ -1046,8 +1046,8 @@
> >>>                                    #address-cells = <1>;
> >>>                                    #size-cells = <0>;
> >>>
> >>> -                               port@0 {
> >>> -                                       reg = <0>;
> >>> +                               port@1 {
> >>> +                                       reg = <1>;
> >>>                                            dsi_to_mic: endpoint {
> >>>                                                    remote-endpoint =
> >>> <&mic_to_dsi>;
> >>>                                            };
> >>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> >>> b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> >>> index d2933a70c01f..e8e2df339c5f 100644
> >>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> >>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> >>> @@ -220,8 +220,8 @@ enum exynos_dsi_transfer_type {
> >>>     };
> >>>
> >>>     enum {
> >>> -       DSI_PORT_IN,
> >>> -       DSI_PORT_OUT
> >>> +       DSI_PORT_OUT,
> >>> +       DSI_PORT_IN
> >>>     };
> >>>
> >>>     struct exynos_dsi_transfer {
> >>> --
> >>>
> >>> 2. (devm_)drm_of_get_bridge() ignores panel's 'reg' property and it is
> >>
> >> I guess drm_of_get_bridge should not be used in exynos_dsi_host_attach
> >> at all - there are no ports here, only of_node of the sink.
> >>
> >> Since there is no helper to workaround the dualism panel/bridge you
> >> should still use of_drm_find_bridge and of_drm_find_panel pair.
> > We have 2 use cases so far for adding input and outputs for a given host node.
> >
> > 1. with ports
> >
> >      dsi {
> >              compatible = "samsung,exynos5433-mipi-dsi";
> >              #address-cells = <1>;
> >              #size-cells = <0>;
> >
> >               ports {
> >                                  #address-cells = <1>;
> >                                  #size-cells = <0>;
> >
> >                                  port@0 {
> >                                          reg = <0>;
> >                                          dsi_to_mic: endpoint {
> >                                                  remote-endpoint = <&mic_to_dsi>;
> >                                          };
> >                                  };
> >
> >                             port@1 {
> >                                         reg = <1>;
> >
> >                                        dsi_out_panel: endpoint {
> >                                                  remote-endpoint =
> > <&dsi_in_panel>;
> >                                        };
> >                               };
> >              };
> >
> >              panel@0 {
> >                      compatible = "samsung,s6e3hf2";
> >                      reg = <0>;
> >                      vdd3-supply = <&ldo27_reg>;
> >                      vci-supply = <&ldo28_reg>;
> >                      reset-gpios = <&gpg0 0 GPIO_ACTIVE_LOW>;
> >                      enable-gpios = <&gpf1 5 GPIO_ACTIVE_HIGH>;
> >
> >                      port {
> >                                      dsi_in_panel: endpoint {
> >                                             remote-endpoint = <&dsi_out_panel>;
> >                                       };
> >                      };
> >              };
> >      };
> >
> >
> > 2. with port
> >
> >      dsi {
> >              compatible = "samsung,exynos5433-mipi-dsi";
> >              #address-cells = <1>;
> >              #size-cells = <0>;
> >
> >              port {
> >                      dsi_to_mic: endpoint {
> >                              remote-endpoint = <&mic_to_dsi>;
> >                      };
> >              };
> >
> >              panel@0 {
> >                      compatible = "samsung,s6e3hf2";
> >                      reg = <0>;
> >                      vdd3-supply = <&ldo27_reg>;
> >                      vci-supply = <&ldo28_reg>;
> >                      reset-gpios = <&gpg0 0 GPIO_ACTIVE_LOW>;
> >                      enable-gpios = <&gpf1 5 GPIO_ACTIVE_HIGH>;
> >              };
> >      };
> >
> > We have a patch which do find the panel/bridge as a child node[1] via
> > devm_drm_of_get_bridge. However that based on the above use cases
> > where child panel/bridge added as per 2 use case and there is no
> > possibility of child node in 1 use case as it has a feasibility to add
> > outputs via 'ports'.
> >
> > Since exynos5433 has 'ports' in host node, this patches [2] added
> > panel via port@1.
> >
> > [1] https://patchwork.amarulasolutions.com/patch/1823/
> > [2] https://patchwork.amarulasolutions.com/patch/1836/
>
>
> Maybe I am missing something, but you do not have to 'find'
> panel/bridge, you have it already - it is 'device' argument of
> exynos_dsi_host_attach.
>
> For me it looks odd when panel calls 'hey I am here, ready to proceed'
> (exynos_dsi_host_attach callback), and then dsi host ignores this call,
> instead it look for panel using different mechanism.

From the DSI we didn't know the given 'device' is panel/bridge right?
so instead of doing it via of_drm_find_panel/bridge we are trying to
call the common devm_drm_of_get_bridge which would compatible to other
ports based (non-child) OF graphs example i.MX8MM.

Idea is to have common finding call to make compatible between platforms.

Thanks,
Jagan.
