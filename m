Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D96026F19B7
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 15:35:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2582410ED73;
	Fri, 28 Apr 2023 13:35:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C13EF10EC13
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 13:35:30 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-24736992dd3so6402237a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 06:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682688930; x=1685280930;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m1dbqce3WPyFBerKsrcuez3UMJUgHZuFp1ltkV3ek/0=;
 b=EfnqdeuEHJ5PG2BYrdCPUzeXZvxGcVidzsF7t0d6wfdfYXgIXUjjBWfjdo+bIFlVm+
 vPS9LwqRCTcgkd8f7iyfapNCGDu+TaLxgFtYK778vdtFSvOcIXC5NmzU3ZAW9vEkuGub
 Dq2I1AkybP/1vGQRDXfTa5q6d9NsAHrikspOTMlygyq8j5WZW+v0N3fgLfoIiXolp4eT
 7Dmes1/Cdolve6jYW/Y7RX2cXyvKkN1WLlH/UJk6uXX2nbJb/cmR9D0GqPBl0a1xIwCo
 5hkTcD7lz+gfPkO78f09rxYC2pSnMZCX0RDhihubsa/bIYzX01L7AXyovlePahkv1bID
 OVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682688930; x=1685280930;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m1dbqce3WPyFBerKsrcuez3UMJUgHZuFp1ltkV3ek/0=;
 b=aU1TRKbJ67Ermx9oJ4sVzESW35wgn4GB10gFsNrGlwtq5SikpkJo9O5dk07ENmEwqr
 kC/3AmdPdLVLatSgK4AXYiNKvozV+ucK2ttK1oIpFH0xvtNc4/5DvUvRQj/OzoOqFR3W
 SV/nNDWCbyOIDvpXeoBWMbu55tfMxg3XcwdEAro51+T3kT7uES5vIWR74RWrt4OIbh5a
 INalnpdAZMxcZ2B2rPCyNKO2n7L0FvDbedwa7xah4i2M3dDsTMVoVSMvwgAQBhD8Uq6s
 E/gifNH08svDucVhfdIzupai+mSpoheqd+piaE3f7c5PDs9Vfo6jedJMnDo3io82VtL5
 VtKg==
X-Gm-Message-State: AC+VfDxlnHauweOnnUIJKH1SdblEZ5L/xOFsGbK5YzKcWh4BVZLhVeuS
 n1GNhkae7+5l7CBxUFqaoqo/C6stek6jivNgaJo=
X-Google-Smtp-Source: ACHHUZ5I/b3oOdldCfGZ110chEiliDhMwQMsJgWc3X/WFy660LEjKVdzOnhEJe3tqhKDXcZyEPzzOmJzI3h9WG9EgpM=
X-Received: by 2002:a17:90b:8d3:b0:23b:2f4a:57bb with SMTP id
 ds19-20020a17090b08d300b0023b2f4a57bbmr5505115pjb.10.1682688929776; Fri, 28
 Apr 2023 06:35:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230423121232.1345909-1-aford173@gmail.com>
 <CGME20230423121305eucas1p287a952d41b1884b117fa15a748b9e1a2@eucas1p2.samsung.com>
 <20230423121232.1345909-6-aford173@gmail.com>
 <b6b53da5-6986-a958-ef84-650b3a57ad9c@samsung.com>
 <CAHCN7x+vd-bP8NgS-cRrnm8ojq0kwUg6aXokJv6xSU7BrT04Vw@mail.gmail.com>
 <343f8d25-566f-9d14-64db-4e796cc9e406@samsung.com>
In-Reply-To: <343f8d25-566f-9d14-64db-4e796cc9e406@samsung.com>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 28 Apr 2023 08:35:18 -0500
Message-ID: <CAHCN7x+QU29Wv9TQEANhbxLcL4jCZUKbk+uGu2sOwhCcTt798A@mail.gmail.com>
Subject: Re: [PATCH V2 5/6] drm: bridge: samsung-dsim: Support non-burst mode
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dario.binacchi@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 28, 2023 at 7:31=E2=80=AFAM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 24.04.2023 12:00, Adam Ford wrote:
> > On Mon, Apr 24, 2023 at 3:25=E2=80=AFAM Marek Szyprowski
> > <m.szyprowski@samsung.com> wrote:
> >> On 23.04.2023 14:12, Adam Ford wrote:
> >>> The high-speed clock is hard-coded to the burst-clock
> >>> frequency specified in the device tree.  However, when
> >>> using devices like certain bridge chips without burst mode
> >>> and varying resolutions and refresh rates, it may be
> >>> necessary to set the high-speed clock dynamically based
> >>> on the desired pixel clock for the connected device.
> >>>
> >>> This also removes the need to set a clock speed from
> >>> the device tree for non-burst mode operation, since the
> >>> pixel clock rate is the rate requested from the attached
> >>> device like an HDMI bridge chip.  This should have no
> >>> impact for people using burst-mode and setting the burst
> >>> clock rate is still required for those users.
> >>>
> >>> Signed-off-by: Adam Ford <aford173@gmail.com>
> >> This one breaks Exynos-5433 based TM2e board with a DSI panel.
> > Marek S,
> >
> > Thank you for testing!  I knoiw there are several of us who appreciate
> > your testing this since it's hard to know if something broke without
> > hardware.  Is there any way you can tell me if the flag is set to
> > enable MIPI_DSI_MODE_VIDEO_BURST?
>
> TM2e board uses the DSI panel operated in command mode and handled by
> panel-samsung-s6e3ha2.c driver. The MIPI_DSI_MODE_VIDEO_BURST flag is
> not set by the driver. However, the MIPI_DSI_CLOCK_NON_CONTINUOUS flags
> is set there. I really have no idea if setting VIDEO_BURST would make
> sense together with CLOCK_NON_CONTINUOUS or not. Maybe the driver lacks
> setting it?
>
>
> > I was trying to be diligent about not breaking your boards, but
> > without your boards, it's difficult.  The theory was that if
> > MIPI_DSI_MODE_VIDEO_BURST is set and there is a burst clock set in the
> > device tree, it would use the burst clock.
> >
> > As a fall-back I could just simply check for the presence of the
> > burst_clock_rate instead of both MIPI_DSI_MODE_VIDEO_BURST and
> > burst_clock_rate.
>
> Maybe you should extend your check also for the
> MIPI_DSI_CLOCK_NON_CONTINUOUS flag? Does it make sense?

Looking at some of the devices that might attach in the future, It
appears that ti-sn65dsi86.c sets this flag.  It's a display port
bridge, so I would expect it to need a variable clock rate similar to
how the HDMI bridge that I need works.  I am concerned that I make the
burst clock dependent on MIPI_DSI_CLOCK_NON_CONTINUOUS, it might break
the Display Port bridge.

I think it's better to just check if the samsung,burst-clock-frequency
is present in the device tree and use it when present.  If it's not
present, then fall back to the pixel clock of the connected device.

I looked at a bunch of Exynos parts, and it looks like they all use
the samsung,burst-clock-frequency device tree setting.  Is that true,
or did I miss one?

adam
>
>  > ...
>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
