Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EBD48AA92
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 10:32:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB6D10FAC5;
	Tue, 11 Jan 2022 09:32:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D7510FAC5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 09:32:14 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id o6so64687509edc.4
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 01:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iYjXWidxFYgoQD0YGDFdZyIRW+UXRxV2xbu8DuxyOXg=;
 b=LdzaA6i4NsCQ4wJ4Oh/iH3GIonb/KkIjOawzxK4ZgSuo8yj5Bs9eRp21Z5tLAuwO1J
 ib1F3haxsQc5I33uid5xFRlN3wBU8w2JA5K5PfaKADran2vH2NusNIVuYGxcPZRmqmYA
 E0xM9OTSecIv68cuJjTybnDfXMmk9Eewn9lGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iYjXWidxFYgoQD0YGDFdZyIRW+UXRxV2xbu8DuxyOXg=;
 b=a7CI6ZaGu3xfYW+eHgX+qvWu1+3fVG+HskThBIsBlOLfIXn9CQHfigr6uaZpVU3N5j
 qMHFJs69LaR1OVE+O3EljNn3SCYyDJUdeHU+DhNuBO/jDzWmYfXKNkpTtAfvGfTpVAPg
 XMymDG0epuacDfdUcJOPssDGj8DMy748dvs77tJBEcVEItd+YDua2K5TgHm/p94NBrBS
 X8LSzqQSGkBj5fUxa1HdgyJBayeV+dNA3jneCi0WA4Fs5QM1oGA1ApJ5d6Wn+dEVZWd6
 mImpxkglWby6yYqwNmCn2QC7XhIRxQkdfBNGuhpGLXUPMSlc8/mKrmwSIukhpGttGc2N
 y2DQ==
X-Gm-Message-State: AOAM532UokqLbjQ2pfHuNyGV2Umq9Z5Ex5Rx6Mg/UbAe/i2cu/LCzWsj
 pIRzGg8sjbSfgU39RquouF7K8kbou+U9h4DaS1iMrQ==
X-Google-Smtp-Source: ABdhPJzOATTcQku7Bz9YPcIRFM69cxnolE6PXwXPolHArPL7TX23cTFlJX/FlaTQPJJP40unXdoHcfitAynDDYIQAE4=
X-Received: by 2002:a17:906:b003:: with SMTP id
 v3mr2957505ejy.770.1641893532645; 
 Tue, 11 Jan 2022 01:32:12 -0800 (PST)
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
In-Reply-To: <e541c52b-9751-933b-5eac-783dd0ed9056@intel.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 11 Jan 2022 15:02:01 +0530
Message-ID: <CAMty3ZBT0oXvT99px_vnn0xmZ3cc1H6VvAgL6nDVbhtLKFyy7w@mail.gmail.com>
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
 Neil Armstrong <narmstrong@baylibre.com>, linux-amarula@amarulasolutions.com,
 dri-devel@lists.freedesktop.org, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrzej,

On Tue, Dec 28, 2021 at 4:18 PM Andrzej Hajda <andrzej.hajda@intel.com> wrote:
>
> Hi Marek,
>
> On 23.12.2021 10:15, Marek Szyprowski wrote:
> > Hi Jagan,
> >
> > On 18.12.2021 00:16, Marek Szyprowski wrote:
> >> On 15.12.2021 15:56, Jagan Teki wrote:
> >>> On Wed, Dec 15, 2021 at 7:49 PM Marek Szyprowski
> >>> <m.szyprowski@samsung.com> wrote:
> >>>> On 15.12.2021 13:57, Jagan Teki wrote:
> >>>>> On Wed, Dec 15, 2021 at 5:31 PM Marek Szyprowski
> >>>>> <m.szyprowski@samsung.com> wrote:
> >>>>>> On 15.12.2021 11:15, Jagan Teki wrote:
> >>>>>>> Updated series about drm bridge conversion of exynos dsi.
> >>>>>>> Previous version can be accessible, here [1].
> >>>>>>>
> >>>>>>> Patch 1: connector reset
> >>>>>>>
> >>>>>>> Patch 2: panel_bridge API
> >>>>>>>
> >>>>>>> Patch 3: Bridge conversion
> >>>>>>>
> >>>>>>> Patch 4: Atomic functions
> >>>>>>>
> >>>>>>> Patch 5: atomic_set
> >>>>>>>
> >>>>>>> Patch 6: DSI init in enable
> >>>>>> There is a little progress! :)
> >>>>>>
> >>>>>> Devices with a simple display pipeline (only a DSI panel, like
> >>>>>> Trats/Trats2) works till the last patch. Then, after applying
> >>>>>> ("[PATCH
> >>>>>> v4 6/6] drm: exynos: dsi: Move DSI init in bridge enable"), I get no
> >>>>>> display at all.
> >>>>>>
> >>>>>> A TM2e board with in-bridge (Exynos MIC) stops displaying anything
> >>>>>> after
> >>>>>> applying patch "[PATCH v4 2/6] drm: exynos: dsi: Use drm
> >>>>>> panel_bridge API".
> >>>>>>
> >>>>>> In case of the Arndale board with tc358764 bridge, no much
> >>>>>> progress. The
> >>>>>> display is broken just after applying the "[PATCH v2] drm: bridge:
> >>>>>> tc358764: Use drm panel_bridge API" patch on top of linux-next.
> >>>>>>
> >>>>>> In all cases the I had "drm: of: Lookup if child node has panel or
> >>>>>> bridge" patch applied.
> >>>>> Just skip the 6/6 for now.
> >>>>>
> >>>>> Apply
> >>>>> -
> >>>>> https://protect2.fireeye.com/v1/url?k=a24f3f76-fdd40659-a24eb439-0cc47a31cdf8-97ea12b4c5258d11&q=1&e=37a169bf-7ca5-4362-aad7-486018c7a708&u=https%3A%2F%2Fpatchwork.amarulasolutions.com%2Fpatch%2F1825%2F
> >>>>> -
> >>>>> https://protect2.fireeye.com/v1/url?k=a226360f-fdbd0f20-a227bd40-0cc47a31cdf8-ebd66aebee1058d7&q=1&e=37a169bf-7ca5-4362-aad7-486018c7a708&u=https%3A%2F%2Fpatchwork.amarulasolutions.com%2Fpatch%2F1823%2F
> >>>>>
> >>>>> Then apply 1/6 to 5/6.  and update the status?
> >>>> Okay, my fault, I didn't check that case on Arndale.
> >>>>
> >>>> I've checked and indeed, Trats/Trats2 and Arndale works after the above
> >>>> 2 patches AND patches 1-5.
> >>>>
> >>>> The only problem is now on TM2e, which uses Exynos MIC as in-bridge for
> >>>> Exynos DSI:
> >>>>
> >>>> [    4.068866] [drm] Exynos DRM: using 13800000.decon device for DMA
> >>>> mapping operations
> >>>> [    4.069183] exynos-drm exynos-drm: bound 13800000.decon (ops
> >>>> decon_component_ops)
> >>>> [    4.128983] exynos-drm exynos-drm: bound 13880000.decon (ops
> >>>> decon_component_ops)
> >>>> [    4.129261] exynos-drm exynos-drm: bound 13930000.mic (ops
> >>>> exynos_mic_component_ops)
> >>>> [    4.133508] exynos-dsi 13900000.dsi: [drm:exynos_dsi_host_attach]
> >>>> *ERROR* failed to find the bridge: -19
> >>>> [    4.136392] exynos-drm exynos-drm: bound 13900000.dsi (ops
> >>>> exynos_dsi_component_ops)
> >>>> [    4.145499] rc_core: Couldn't load IR keymap rc-cec
> >>>> [    4.145666] Registered IR keymap rc-empty
> >>>> [    4.148402] rc rc0: sii8620 as /devices/virtual/rc/rc0
> >>>> [    4.156051] input: sii8620 as /devices/virtual/rc/rc0/input1
> >>>> [    4.160647] exynos-drm exynos-drm: bound 13970000.hdmi (ops
> >>>> hdmi_component_ops)
> >>>> [    4.169923] exynos-drm exynos-drm: [drm] Cannot find any crtc or
> >>>> sizes
> >>>> [    4.173958] exynos-drm exynos-drm: [drm] Cannot find any crtc or
> >>>> sizes
> >>>> [    4.182304] [drm] Initialized exynos 1.1.0 20180330 for
> >>>> exynos-drm on
> >>>> minor 0
> >>>>
> >>>> The display pipeline for TM2e is:
> >>>>
> >>>> Exynos5433 Decon -> Exynos MIC -> Exynos DSI -> s6e3ha2 DSI panel
> >>> If Trats/Trats2 is working then it has to work. I don't see any
> >>> difference in output pipeline. Can you please share the full log, I
> >>> cannot see host_attach print saying "Attached.."
> >> Well, there is a failure message about the panel:
> >>
> >> exynos-dsi 13900000.dsi: [drm:exynos_dsi_host_attach] *ERROR* failed
> >> to find the bridge: -19
> >>
> >> however it looks that something might be broken in dts. The in-bridge
> >> (Exynos MIC) is on port 0 and the panel is @0, what imho might cause
> >> the issue.
> >>
> >> I've tried to change in in-bridge ('mic_to_dsi') port to 1 in
> >> exynos5433.dtsi. Then the panel has been attached:
> >>
> >> exynos-dsi 13900000.dsi: [drm:exynos_dsi_host_attach] Attached s6e3hf2
> >> device
> >>
> >> but the display is still not working, probably due to lack of proper
> >> Exynos MIC handling. I will investigate it later and let You know.
> >
> > I've played a bit with the Exynos DRM code and finally I made it working
> > on TM2(e). There are basically 3 different issues that need to be fixed
> > to get it working with the $subject patchset:
> >
> > 1. Port numbers in exynos5433 dsi/dts are broken. For all pre-Exynos5433
> > boards the panel was defined as a DSI node child (at 'reg 0'),
>
>
> True, emphasis that it is reg 0 of DSI bus.
>
>
> >   what
> > means it used port 0.
>
>
> And this does not seems true to me. Established practice is (unless I
> have not noticed change in bindings :) ) that in case of data bus shared
> with control bus the port node is optional. In such case host knows
> already who is connected to its data bus, it does not need port node.
> And if there is no port node there is no port number as well.
>
> As I quickly looked at the exynos bindings they seems generally OK to
> me, if there is something wrong/suspicious let me know.
>
>
> >   Then, Exynos5433 introduced so called RGB-in at
> > port 0 and panel at port 1 (as described in the dt bindings).However
> > the committed Exynos5433 dtsi and TM2(e) dts still defined panel as a
> > DSI child (with reg=0, so port 0) and Exynos MIC as of-graph at port 0.
> > The Exynos DSI code however always searched for a panel as a DSI child
> > node, so it worked fine, even though the panel and exynos mic used in
> > fact the 'port 0'. IMHO this can be fixed by the following patch:
> >
> > diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> > b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> > index bfe4ed8a23d6..2718c752d916 100644
> > --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> > +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> > @@ -1046,8 +1046,8 @@
> >                                   #address-cells = <1>;
> >                                   #size-cells = <0>;
> >
> > -                               port@0 {
> > -                                       reg = <0>;
> > +                               port@1 {
> > +                                       reg = <1>;
> >                                           dsi_to_mic: endpoint {
> >                                                   remote-endpoint =
> > <&mic_to_dsi>;
> >                                           };
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > index d2933a70c01f..e8e2df339c5f 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > @@ -220,8 +220,8 @@ enum exynos_dsi_transfer_type {
> >    };
> >
> >    enum {
> > -       DSI_PORT_IN,
> > -       DSI_PORT_OUT
> > +       DSI_PORT_OUT,
> > +       DSI_PORT_IN
> >    };
> >
> >    struct exynos_dsi_transfer {
> > --
> >
> > 2. (devm_)drm_of_get_bridge() ignores panel's 'reg' property and it is
>
>
> I guess drm_of_get_bridge should not be used in exynos_dsi_host_attach
> at all - there are no ports here, only of_node of the sink.
>
> Since there is no helper to workaround the dualism panel/bridge you
> should still use of_drm_find_bridge and of_drm_find_panel pair.

We have 2 use cases so far for adding input and outputs for a given host node.

1. with ports

    dsi {
            compatible = "samsung,exynos5433-mipi-dsi";
            #address-cells = <1>;
            #size-cells = <0>;

             ports {
                                #address-cells = <1>;
                                #size-cells = <0>;

                                port@0 {
                                        reg = <0>;
                                        dsi_to_mic: endpoint {
                                                remote-endpoint = <&mic_to_dsi>;
                                        };
                                };

                           port@1 {
                                       reg = <1>;

                                      dsi_out_panel: endpoint {
                                                remote-endpoint =
<&dsi_in_panel>;
                                      };
                             };
            };

            panel@0 {
                    compatible = "samsung,s6e3hf2";
                    reg = <0>;
                    vdd3-supply = <&ldo27_reg>;
                    vci-supply = <&ldo28_reg>;
                    reset-gpios = <&gpg0 0 GPIO_ACTIVE_LOW>;
                    enable-gpios = <&gpf1 5 GPIO_ACTIVE_HIGH>;

                    port {
                                    dsi_in_panel: endpoint {
                                           remote-endpoint = <&dsi_out_panel>;
                                     };
                    };
            };
    };


2. with port

    dsi {
            compatible = "samsung,exynos5433-mipi-dsi";
            #address-cells = <1>;
            #size-cells = <0>;

            port {
                    dsi_to_mic: endpoint {
                            remote-endpoint = <&mic_to_dsi>;
                    };
            };

            panel@0 {
                    compatible = "samsung,s6e3hf2";
                    reg = <0>;
                    vdd3-supply = <&ldo27_reg>;
                    vci-supply = <&ldo28_reg>;
                    reset-gpios = <&gpg0 0 GPIO_ACTIVE_LOW>;
                    enable-gpios = <&gpf1 5 GPIO_ACTIVE_HIGH>;
            };
    };

We have a patch which do find the panel/bridge as a child node[1] via
devm_drm_of_get_bridge. However that based on the above use cases
where child panel/bridge added as per 2 use case and there is no
possibility of child node in 1 use case as it has a feasibility to add
outputs via 'ports'.

Since exynos5433 has 'ports' in host node, this patches [2] added
panel via port@1.

[1] https://patchwork.amarulasolutions.com/patch/1823/
[2] https://patchwork.amarulasolutions.com/patch/1836/

Thanks,
Jagan.
