Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83688475B1F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 15:56:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 420E010E749;
	Wed, 15 Dec 2021 14:56:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA8F10E749
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 14:56:21 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id z5so76470502edd.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 06:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5V9h7DAwJvDlo2oUCN+HSZghVSZaWtYSWtynysZVVV0=;
 b=pSINuB/3Tg1WheR4UUf9iqEzKUUbwHb23OqqSHpasXHzqAWYFrUaf8JEEF4zYB+oFb
 WvWH3wDyihNxp0iRaFILBfKUgITxdFANtPHmr3mjwpCHoihb4Yony30s25Wh84EwkU7T
 XfTz3rKSc96+tK2NlJn5+dCfqgbyC5JGCcuqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5V9h7DAwJvDlo2oUCN+HSZghVSZaWtYSWtynysZVVV0=;
 b=TAON+oXNSwQfy2RzoZf8ezjGPmJJc4FgBjQQGzgz+yvdiqXg6CvMBLITX0cmH1IJd0
 I1j7zfVg3fRGhzzp5DFrEA7IikLwvhzA15BZVPaVsAyQj0Rf3biRIQhS51h85K54vzbb
 4Ra4TJR2D3hdqGQQOKQ98E0ZxaEPzbDSruLfCTP8YQrPb7IvscQcVECfovIDPtvdYown
 /pMBthRWIxAXKDqnJmBI6L2HiC2Gfb2UNl7eTm2Gzcy05Kg10z586TVt0KjnKXD2ZQ8I
 U++/mG+sn+DlU8+V6H0ozB3DeFCua1yj68wv8oToF2Khk+6Gy2PLvmO6ELpjEv3EDxoS
 oUZw==
X-Gm-Message-State: AOAM530js9rKCuGPX7ztSKIg7/Ah7u04d+XY5WSuDLgrAMjD+wEaVLmq
 Gy0v2iZnvCBrB/skZgF7QT+3x8i+urKSE+Nll5yL0w==
X-Google-Smtp-Source: ABdhPJy8NUAfsUPfB576kT6j0MfI3aY4wf1phYBELblfbamg/M0j9Y183fFyqmFgdEcwY4KhDfpugsG5TH8uLQY8ic8=
X-Received: by 2002:a05:6402:2744:: with SMTP id
 z4mr15238024edd.310.1639580175790; 
 Wed, 15 Dec 2021 06:56:15 -0800 (PST)
MIME-Version: 1.0
References: <CGME20211215101548eucas1p2a7f4a64ae55364181eec3db3ad5d6ef7@eucas1p2.samsung.com>
 <20211215101534.45003-1-jagan@amarulasolutions.com>
 <39f646d7-9d49-045a-2cf5-3cdc12486cb3@samsung.com>
 <CAMty3ZBmZo3wqzj2Si4Ydm1RtzGs7f89aCktgVvD==appfSCPQ@mail.gmail.com>
 <fe49e59a-1df7-fcdc-8258-581509bb8fe2@samsung.com>
In-Reply-To: <fe49e59a-1df7-fcdc-8258-581509bb8fe2@samsung.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 15 Dec 2021 20:26:04 +0530
Message-ID: <CAMty3ZCSrqcnO1i5ADJhQx_Dt5GbT+-eyhauJhqg=wJXOTWK-A@mail.gmail.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Wed, Dec 15, 2021 at 7:49 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Jagan,
>
> On 15.12.2021 13:57, Jagan Teki wrote:
> > On Wed, Dec 15, 2021 at 5:31 PM Marek Szyprowski
> > <m.szyprowski@samsung.com> wrote:
> >> On 15.12.2021 11:15, Jagan Teki wrote:
> >>> Updated series about drm bridge conversion of exynos dsi.
> >>> Previous version can be accessible, here [1].
> >>>
> >>> Patch 1: connector reset
> >>>
> >>> Patch 2: panel_bridge API
> >>>
> >>> Patch 3: Bridge conversion
> >>>
> >>> Patch 4: Atomic functions
> >>>
> >>> Patch 5: atomic_set
> >>>
> >>> Patch 6: DSI init in enable
> >> There is a little progress! :)
> >>
> >> Devices with a simple display pipeline (only a DSI panel, like
> >> Trats/Trats2) works till the last patch. Then, after applying ("[PATCH
> >> v4 6/6] drm: exynos: dsi: Move DSI init in bridge enable"), I get no
> >> display at all.
> >>
> >> A TM2e board with in-bridge (Exynos MIC) stops displaying anything after
> >> applying patch "[PATCH v4 2/6] drm: exynos: dsi: Use drm panel_bridge API".
> >>
> >> In case of the Arndale board with tc358764 bridge, no much progress. The
> >> display is broken just after applying the "[PATCH v2] drm: bridge:
> >> tc358764: Use drm panel_bridge API" patch on top of linux-next.
> >>
> >> In all cases the I had "drm: of: Lookup if child node has panel or
> >> bridge" patch applied.
> > Just skip the 6/6 for now.
> >
> > Apply
> > - https://protect2.fireeye.com/v1/url?k=a24f3f76-fdd40659-a24eb439-0cc47a31cdf8-97ea12b4c5258d11&q=1&e=37a169bf-7ca5-4362-aad7-486018c7a708&u=https%3A%2F%2Fpatchwork.amarulasolutions.com%2Fpatch%2F1825%2F
> > - https://protect2.fireeye.com/v1/url?k=a226360f-fdbd0f20-a227bd40-0cc47a31cdf8-ebd66aebee1058d7&q=1&e=37a169bf-7ca5-4362-aad7-486018c7a708&u=https%3A%2F%2Fpatchwork.amarulasolutions.com%2Fpatch%2F1823%2F
> >
> > Then apply 1/6 to 5/6.  and update the status?
>
> Okay, my fault, I didn't check that case on Arndale.
>
> I've checked and indeed, Trats/Trats2 and Arndale works after the above
> 2 patches AND patches 1-5.
>
> The only problem is now on TM2e, which uses Exynos MIC as in-bridge for
> Exynos DSI:
>
> [    4.068866] [drm] Exynos DRM: using 13800000.decon device for DMA
> mapping operations
> [    4.069183] exynos-drm exynos-drm: bound 13800000.decon (ops
> decon_component_ops)
> [    4.128983] exynos-drm exynos-drm: bound 13880000.decon (ops
> decon_component_ops)
> [    4.129261] exynos-drm exynos-drm: bound 13930000.mic (ops
> exynos_mic_component_ops)
> [    4.133508] exynos-dsi 13900000.dsi: [drm:exynos_dsi_host_attach]
> *ERROR* failed to find the bridge: -19
> [    4.136392] exynos-drm exynos-drm: bound 13900000.dsi (ops
> exynos_dsi_component_ops)
> [    4.145499] rc_core: Couldn't load IR keymap rc-cec
> [    4.145666] Registered IR keymap rc-empty
> [    4.148402] rc rc0: sii8620 as /devices/virtual/rc/rc0
> [    4.156051] input: sii8620 as /devices/virtual/rc/rc0/input1
> [    4.160647] exynos-drm exynos-drm: bound 13970000.hdmi (ops
> hdmi_component_ops)
> [    4.169923] exynos-drm exynos-drm: [drm] Cannot find any crtc or sizes
> [    4.173958] exynos-drm exynos-drm: [drm] Cannot find any crtc or sizes
> [    4.182304] [drm] Initialized exynos 1.1.0 20180330 for exynos-drm on
> minor 0
>
> The display pipeline for TM2e is:
>
> Exynos5433 Decon -> Exynos MIC -> Exynos DSI -> s6e3ha2 DSI panel

If Trats/Trats2 is working then it has to work. I don't see any
difference in output pipeline. Can you please share the full log, I
cannot see host_attach print saying "Attached.."

Jagan.
