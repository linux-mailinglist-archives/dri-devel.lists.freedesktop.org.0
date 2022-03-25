Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A1F4E789E
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 17:05:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F2110E97B;
	Fri, 25 Mar 2022 16:04:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACCA310E710
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 16:04:56 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id qa43so16250087ejc.12
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 09:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6FVNf3CXIs4ADO+pTktPEzSdrc+4HMS6kNJ5Y+BjhFg=;
 b=EskDP22ZZbzi3JBe6rpFhvQyWBamIO+eabzKwSsNqqsrH33JdxiaUbSZsfaIXQLUuy
 vHma+CkP//SXFuy22RivOdDm1vtjsOQP/y4n9v617HjGiIKiOKnfe5bL6TtQ6rnHsuXl
 B0of95vir0bDE0XtRFAXv8DaJiEozZ7pTdb9JMxlC7PpWc5eO4r1b9OS22puhWYMyDhf
 hlzIw5RacRWK/DhlsQD/ncSqjSAsjFVjFKilhcDGgsoofnevf3NYr+WfT7cS1bVL9t5q
 hujVizlz06ux/OsKYf9LUmfBdPlPIU755ZBVmooaGmmM2YXZHoj1c5wUFzqjg/q/a5oQ
 VvTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6FVNf3CXIs4ADO+pTktPEzSdrc+4HMS6kNJ5Y+BjhFg=;
 b=2ybTMjYQn4s77Ne29QBAyHKqV4JwL0FKzmMqk+82JEunfQR/mJkyf7Mu6EvQsFOr8R
 GuJbLvBXBAnqfg6bfIeHyhs0GYf6MOlXxsO1PIjkc239NOS7aXxUSZL7xsWM+EpKgIK3
 IbnBb5Vk3k3zmDSXTo0YdsS+adyBe9aJ3y4zGPL7+CBWFF3AYD508R8HsuMVBAUmlQKx
 RTCDRu3yKcYED4LYw6weeQmEhUnAyKPUjDvZbwYG/AmhWS1HrHhL6JSQL6nAu/qr+HB6
 fQX2d59zJn/pq6YfyFBG3iefH6S33yqcdyZgwvCnXsDUR90nFULAROYekBOWyrNF6+Qb
 ZI6A==
X-Gm-Message-State: AOAM5312fxiQOp4BlpzRt3fJPaBy3Oi19Bg3MwO4cqVYwzqTwLRsE8Zp
 +XBRBfFOnmkqRJTrTfjOa23ee/ZJe9pSDVTyuks=
X-Google-Smtp-Source: ABdhPJwFEgPuGnr+8sipW0AewDC8MEIbc4Xqb+PqZe/ONDnhs9Ewqd/3i704s1+sQGb4Vq1Ciz1NqHu5f911GchH7DM=
X-Received: by 2002:a17:907:7ba3:b0:6df:b07c:ee35 with SMTP id
 ne35-20020a1709077ba300b006dfb07cee35mr12447964ejc.588.1648224294842; Fri, 25
 Mar 2022 09:04:54 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20220303163725eucas1p26c4a165b20dd629f2129926b1b662154@eucas1p2.samsung.com>
 <20220303163654.3381470-1-jagan@amarulasolutions.com>
 <e104d9cf-73da-330a-db5a-d914839b273c@samsung.com>
In-Reply-To: <e104d9cf-73da-330a-db5a-d914839b273c@samsung.com>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 25 Mar 2022 11:04:44 -0500
Message-ID: <CAHCN7xKpHFhRKSWQNPFjpav4B=LgipuVY5wNdkCYNQu71GS9Bg@mail.gmail.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 25, 2022 at 10:00 AM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Jagan,
>
> On 03.03.2022 17:36, Jagan Teki wrote:
> > Updated series about drm bridge conversion of exynos dsi.
> >
> > Previous version can be accessible, here [1].
> >
> > Patch 1: tc358764 panel_bridge API
> >
> > Patch 2: connector reset
> >
> > Patch 3: bridge attach in MIC
> >
> > Patch 4: panel_bridge API
> >
> > Patch 5: bridge conversion
> >
> > Patch 6: atomic functions
> >
> >
> >
> > Any inputs?
>
>
> I'm really sorry for the delay on my side. I was really busy with other
> things and I was not able to check the display of the boards with remote
> access.
>
>
> Finally, this patchset works properly on all my Exynos-based test systems:
>
> 1. Exynos4210 Trats with Samsung s6e8aa0 DSI panel
>
> 2. Exynos4412 Trats2 with Samsung s6e8aa0 DSI panel
>
> 3. Exynos5250 Arndale with TC358764 DSI-LVDS bridge and LVDS panel
>
> 4. Exynos5433 TM2e with Samsung s6e3hf2 DSI panel and internal Exynos
> MIC bridge
>
>
> I will post my acked-by and tested-by tags for each patch.

Thank you so much!  I think a lot of people will celebrate when this
gets approved and merged.  ;-)


adam
>
>
> > Jagan.
> >
> > Jagan Teki (6):
> >    drm: bridge: tc358764: Use drm panel_bridge API
> >    drm: bridge: panel: Reset the connector state pointer
> >    exynos: drm: dsi: Attach in_bridge in MIC driver
> >    drm: exynos: dsi: Use drm panel_bridge API
> >    drm: exynos: dsi: Convert to bridge driver
> >    drm: exynos: dsi: Switch to atomic funcs
> >
> >   drivers/gpu/drm/bridge/panel.c          |   3 +
> >   drivers/gpu/drm/bridge/tc358764.c       | 104 +---------
> >   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 241 ++++++------------------
> >   drivers/gpu/drm/exynos/exynos_drm_mic.c |  22 +++
> >   4 files changed, 93 insertions(+), 277 deletions(-)
> >
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
