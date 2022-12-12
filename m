Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBA8649B3F
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 10:34:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC3DC10E17F;
	Mon, 12 Dec 2022 09:34:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16DC210E182
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 09:34:14 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id f139so12634067yba.8
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 01:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5raYu2oNzsA9lejV4fboamJeivIl4YOq/OEwskf/7qA=;
 b=mJJBPMtGj02QshpimYqAXPpFL2AXR7L5CjZAPh6lfoIop09BgQ6XUp+2qsTxz0vfV9
 dZLrphx69cxECOlcbVyhTeY8IpV5kxin2NPUZgZPcZ46fYAnZG5W9A7uy5j4PvnotM60
 NxWFlH1fH/HYveFQ/qXfT/AQ7Q8HhicnIxamc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5raYu2oNzsA9lejV4fboamJeivIl4YOq/OEwskf/7qA=;
 b=E/gC9z+aQChzR17FbEebxlz+OrBEhWgmuSxf8PiLHDYaRWqdo/KF3ydbSP67y1WcBA
 YEEu9yq8IdfjtX9yx6hboMslz+tzjRipPa1mzBnggNVbvd4ZbYfVXit/oj3CdJ3sWOyd
 MwPA1ERRLFXfrZC5KZw6P2VotZnjU0Oh0AWcLxK0uW4CkzUGYbnmeTyMwGU/cMY0MU8X
 fDGp+JFMfnyy6HJBtnWzE96CLjQrQe4pqRSQ8wBiDE20Q1/4eXyTrjbE/saQ6HKFW9HW
 mpDagt3X5y0L2+0cTlWUh/yJwnfm+sVsioiCfbwMSyrqIuA7/u4kxnS+v7/qWqDUSa3M
 /rLg==
X-Gm-Message-State: ANoB5pmQvF29lRz+xb5lsBSlK5TcvMeH4CsdmjIZ/Jq26pUkMceoM6ec
 B8+/2oxdHHULh+F8nbuSVuTNzOiZJZgneA8kr5ExiA==
X-Google-Smtp-Source: AA0mqf6R5BRsKmiHMsRjHhQ76byqJcQ6e7wHQShHmmFWKymyR/3lhF9orOCFid3UDUPSL+zGq+lC9ExFZ9McSrccgdw=
X-Received: by 2002:a25:b94:0:b0:6fc:f894:91f7 with SMTP id
 142-20020a250b94000000b006fcf89491f7mr30138074ybl.475.1670837653201; Mon, 12
 Dec 2022 01:34:13 -0800 (PST)
MIME-Version: 1.0
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
 <20221209152343.180139-8-jagan@amarulasolutions.com>
 <4396da63-d9c0-a9b4-3953-67e6bcfb1bf1@denx.de>
 <CAMty3ZBOR_Bif9PUdiFgVzFLANhFn57pQTrn5=aFXgHEnA1=rA@mail.gmail.com>
 <deb78a20-11f7-8618-4064-76f0397a2657@denx.de>
In-Reply-To: <deb78a20-11f7-8618-4064-76f0397a2657@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 12 Dec 2022 15:04:01 +0530
Message-ID: <CAMty3ZDnjHAMqS+nV+KA+x5u7_ZGve9fLu7SHP2CYdARGi4-5g@mail.gmail.com>
Subject: Re: [PATCH v9 07/18] drm: bridge: samsung-dsim: Lookup OF-graph or
 Child node devices
To: Marek Vasut <marex@denx.de>
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
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Dec 11, 2022 at 11:36 PM Marek Vasut <marex@denx.de> wrote:
>
> On 12/11/22 06:42, Jagan Teki wrote:
> > On Sun, Dec 11, 2022 at 7:58 AM Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 12/9/22 16:23, Jagan Teki wrote:
> >>> The child devices in MIPI DSI can be binding with OF-graph
> >>> and also via child nodes.
> >>>
> >>> The OF-graph interface represents the child devices via
> >>> remote and associated endpoint numbers like
> >>>
> >>> dsi {
> >>>      compatible = "fsl,imx8mm-mipi-dsim";
> >>>
> >>>      ports {
> >>>        port@0 {
> >>>             reg = <0>;
> >>>
> >>>             dsi_in_lcdif: endpoint@0 {
> >>>                  reg = <0>;
> >>>                  remote-endpoint = <&lcdif_out_dsi>;
> >>>             };
> >>>        };
> >>>
> >>>        port@1 {
> >>>             reg = <1>;
> >>>
> >>>             dsi_out_bridge: endpoint {
> >>>                  remote-endpoint = <&bridge_in_dsi>;
> >>>             };
> >>>        };
> >>> };
> >>>
> >>> The child node interface represents the child devices via
> >>> conventional child nodes on given DSI parent like
> >>>
> >>> dsi {
> >>>      compatible = "samsung,exynos5433-mipi-dsi";
> >>>
> >>>      ports {
> >>>           port@0 {
> >>>                reg = <0>;
> >>>
> >>>                dsi_to_mic: endpoint {
> >>>                     remote-endpoint = <&mic_to_dsi>;
> >>>                };
> >>>           };
> >>>      };
> >>>
> >>>      panel@0 {
> >>>           reg = <0>;
> >>>      };
> >>> };
> >>>
> >>> As Samsung DSIM bridge is common DSI IP across all Exynos DSI
> >>> and NXP i.MX8M host controllers, this patch adds support to
> >>> lookup the child devices whether its bindings on the associated
> >>> host represent OF-graph or child node interfaces.
> >>>
> >>> v9, v8, v7, v6, v5, v4, v3:
> >>> * none
> >>>
> >>> v2:
> >>> * new patch
> >>
> >> This looks like a good candidate for common/helper code which can be
> >> reused by other similar drivers.
> >
> > Yes, I have responded to the same comment of yours in v7 [1]. It is
> > hard to make this code work in a generic way.
>
> It seems the patch adds a for_each...() loop and a function call. Should
> be easy enough to turn that into a helper. What am I missing ?

What I'm saying here is, initially, I added for_each in the existing
drm_of_find_panel_or_bridge helper but it fails to handle all drm_of
use cases generically. You can find more information on this commit
80253168dbfd. I keep this in mind and will see whether it can support
the new dsi helper once this supported is merged. Hope I'm clear on
it.

Jagan.
