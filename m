Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAF34F7E56
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 13:46:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0183110E729;
	Thu,  7 Apr 2022 11:46:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D26B10E729
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 11:46:53 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id l26so10315796ejx.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 04:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4/SFbBYGaVTZC2t4X1x/Ds7hQgatHQHcDR2wRDpY+Vk=;
 b=K70ML0qA5S4Q041FCB1PxShLOaGrJsg+yD/ZGuHp/nW6MYfe3nOInx4QA/SJxdSP99
 CNbOH88Xr5GEamJVgi7dmch8OhWmKsAKyPjsTVLzy57mbkeyZv7v1/tWJP0rF7fQgXie
 m4NpZxFQ7M2qh8TlmhzqyO3HCJFRFgaXj2ygk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4/SFbBYGaVTZC2t4X1x/Ds7hQgatHQHcDR2wRDpY+Vk=;
 b=hbonoBH8HBb9LRY7mLS/uNsfFuC5LNhEFOM7X6ulNU7J6gV4nFO/TiMBh5QByvH6a+
 7VfYpC0B4LAhe5zexqfq3+bfZwsWbgp3uhrnM4Y1r7nhmKeZcl+o2tvPkZwPFxuN1Hi5
 kfZR96RSuSP9/IvujVtKxL8PFl7ggGpN4tw4qjJvpqyD2cTYzFIIdDrxVmPh11qlPfFC
 VkGteonfJRhXDthn0cv4JhXDSTeLpwxZwTx2jGFSiEzFLlOIYilL3WHxN5fXO23lASVD
 kPh7irDC4D7K4ieDm47GyebMOdzB/qhbRSY2F8Wlu1my1X7p8rEX4NJwZrT6HP/lBSZl
 Z7nQ==
X-Gm-Message-State: AOAM53226Ff8Q8OBph1G48ESlsnSpmBAMdgwaishkDqfHUAUhlUqxJyz
 FpellMdJ71vlfYPtCZkMZXqdkTY5SEaCtBCKxvQRqA==
X-Google-Smtp-Source: ABdhPJwZuw6PDa9HxPOeZ8Iac9wlUL0uh6rxCT7He0vSaFVgRkWC8y4lDrezY2hnG4Oxg321KQZZ/slL96guvAVOl9E=
X-Received: by 2002:a17:906:e208:b0:6e6:df07:ac80 with SMTP id
 gf8-20020a170906e20800b006e6df07ac80mr12681468ejb.167.1649332011986; Thu, 07
 Apr 2022 04:46:51 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20220303163725eucas1p26c4a165b20dd629f2129926b1b662154@eucas1p2.samsung.com>
 <20220303163654.3381470-1-jagan@amarulasolutions.com>
 <e104d9cf-73da-330a-db5a-d914839b273c@samsung.com>
 <CAHCN7xKpHFhRKSWQNPFjpav4B=LgipuVY5wNdkCYNQu71GS9Bg@mail.gmail.com>
 <CAG3jFytFrzzXVWODccVBKaiD+ZeW-Kt7sazVdTiXxdUGjdVyNw@mail.gmail.com>
 <4fda3d0b-e787-ece5-5357-228b852c1667@samsung.com>
In-Reply-To: <4fda3d0b-e787-ece5-5357-228b852c1667@samsung.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 7 Apr 2022 17:16:40 +0530
Message-ID: <CAMty3ZDZevh0YaSPPBg-T-F2CgDAsODwzCOfsTv0T9ry4fdG_g@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] drm: exynos: dsi: Convert drm bridge
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, Adam Ford <aford173@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Thu, Apr 7, 2022 at 4:54 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Dear All,
>
> On 31.03.2022 16:22, Robert Foss wrote:
> > On Fri, 25 Mar 2022 at 17:04, Adam Ford <aford173@gmail.com> wrote:
> >> On Fri, Mar 25, 2022 at 10:00 AM Marek Szyprowski
> >> <m.szyprowski@samsung.com> wrote:
> >>> On 03.03.2022 17:36, Jagan Teki wrote:
> >>>> Updated series about drm bridge conversion of exynos dsi.
> >>>>
> >>>> Previous version can be accessible, here [1].
> >>>>
> >>>> Patch 1: tc358764 panel_bridge API
> >>>>
> >>>> Patch 2: connector reset
> >>>>
> >>>> Patch 3: bridge attach in MIC
> >>>>
> >>>> Patch 4: panel_bridge API
> >>>>
> >>>> Patch 5: bridge conversion
> >>>>
> >>>> Patch 6: atomic functions
> >>>>
> >>>>
> >>>>
> >>>> Any inputs?
> >>>
> >>> I'm really sorry for the delay on my side. I was really busy with other
> >>> things and I was not able to check the display of the boards with remote
> >>> access.
> >>>
> >>>
> >>> Finally, this patchset works properly on all my Exynos-based test systems:
> >>>
> >>> 1. Exynos4210 Trats with Samsung s6e8aa0 DSI panel
> >>>
> >>> 2. Exynos4412 Trats2 with Samsung s6e8aa0 DSI panel
> >>>
> >>> 3. Exynos5250 Arndale with TC358764 DSI-LVDS bridge and LVDS panel
> >>>
> >>> 4. Exynos5433 TM2e with Samsung s6e3hf2 DSI panel and internal Exynos
> >>> MIC bridge
> >>>
> >>>
> >>> I will post my acked-by and tested-by tags for each patch.
> >> Thank you so much!  I think a lot of people will celebrate when this
> >> gets approved and merged.  ;-)
> >>
> >>
> > Applied to drm-misc-next.
>
>
> Thanks for merging this. Today (once the patches landed in linux-next) I
> found that there is one more issue left to fix.
>
> On the Exynos4210-based Trats board I get the following error:
>
> # ./modetest -c -Mexynos
> could not get connector 56: No such file or directory
> Segmentation fault
>
> #
>
> Surprisingly, all other boards, even Exynos4412-based Trats2 with
> exactly the same DSI controller and panel works fine:
>
> # ./modetest -c -Mexynos
> Connectors:
> id      encoder status          name            size (mm) modes   encoders
> 71      70      connected       DSI-1           58x103 1       70
>    modes:
>          name refresh (Hz) hdisp hss hse htot vdisp vss vse vtot)
>    720x1280 60 720 725 730 735 1280 1293 1295 1296 57153 flags: ; type:
> preferred, driver
>    props:
>          1 EDID:
>                  flags: immutable blob
>                  blobs:
>
>                  value:
>          2 DPMS:
>                  flags: enum
>                  enums: On=0 Standby=1 Suspend=2 Off=3
>                  value: 0
>          5 link-status:
>                  flags: enum
>                  enums: Good=0 Bad=1
>                  value: 0
>          6 non-desktop:
>                  flags: immutable range
>                  values: 0 1
>                  value: 0
>          4 TILE:
>                  flags: immutable blob
>                  blobs:
>
>                  value:
>          20 CRTC_ID:
>                  flags: object
>                  value: 54
> 73      0       connected       HDMI-A-1        0x0 0       72
>    props:
>          1 EDID:
>                  flags: immutable blob
>                  blobs:
>
>                  value:
>          2 DPMS:
>                  flags: enum
>                  enums: On=0 Standby=1 Suspend=2 Off=3
>                  value: 0
>          5 link-status:
>                  flags: enum
>                  enums: Good=0 Bad=1
>                  value: 0
>          6 non-desktop:
>                  flags: immutable range
>                  values: 0 1
>                  value: 0
>          4 TILE:
>                  flags: immutable blob
>                  blobs:
>
>                  value:
>          20 CRTC_ID:
>                  flags: object
>                  value: 0
>
> (the only difference between Trats and Trats2 is the fact that Trats2
> has also HDMI output implemented).
>
> It looks that something is missing in the connector initialization, but
> I didn't dig enough into it. The emulated framebuffer is properly
> registered and displayed on the panel.

Can you please share the full dmesg?

Thanks,
Jagan.
