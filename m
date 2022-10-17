Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BA3600573
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 04:52:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9956410EC05;
	Mon, 17 Oct 2022 02:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B933510EC05
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 02:52:15 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1364357a691so11951977fac.7
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Oct 2022 19:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9rP/6LXrcKejMOXRx9c+Aj9B0Hobpt4k4fRjm5tGy7k=;
 b=bz/nzilPNshvt438l/SCKGV2hgLpWUuwHlEX8JQWf+DKFEgAfl7neZkS5vS3j2Lxur
 QtxbYEFarVe5DAsFxfh+9Kgp56fYgDhv6RvnWhdS+AqZrvqzQTr4Vp75DfTzmK1igCuK
 8tJktBI5gbK/4sN3xkwS9OjkvCgUWX5Jjl1hk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9rP/6LXrcKejMOXRx9c+Aj9B0Hobpt4k4fRjm5tGy7k=;
 b=E2WnF4uKNxu4Cj4thP4yX7R4p2r5mvqOI0sbyXH3y71Tan6SUx2aQeciMcrqQTmvg9
 3RDPTNyHj0oUuGe+pXr/MkIblsjSlckLUjVokPSaBTcbD0M3fNixnAI/7p2UVNUdZKcN
 O/M8acKVK1TgFneKF9fAThhflGw370m5rnL+gBIeov6q0NDRpJTsPN23kH0DHniB4Xji
 tY+YrnIuCN5/bgHIW4Wq8+muvhugn7fSno3ln6wK3bVXVtvO1MI+MHk3M4pcf7QjOHB7
 Va1AgWBy+z+MuhiGAZfCNjTNepUrHtlVxICpgmCVLvqDOlb2r0AqHebzz7zyG1TPGyJB
 BsyA==
X-Gm-Message-State: ACrzQf1YR2dnRhd3jZS+FOoqfEuTZsLVkWvCpBulFXXsWXwyHDzoagZ/
 IjGh0tkGjqC49hMAW4phZLW5laS9WSJnhHEMIjRXhg==
X-Google-Smtp-Source: AMsMyM4IcmRop8bVYXsoeWKKkEscTZblIgs0IVt8EpnmQ1lzsSKtdndQmyeLeg++cR8NHe5+/YIQ+X9Mu5rQyYyGKFM=
X-Received: by 2002:a05:6870:8999:b0:133:15f9:82fd with SMTP id
 f25-20020a056870899900b0013315f982fdmr4527991oaq.276.1665975134966; Sun, 16
 Oct 2022 19:52:14 -0700 (PDT)
MIME-Version: 1.0
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
 <20221005151309.7278-3-jagan@amarulasolutions.com>
 <45f9065d-7257-1050-2664-5ad55d8c14ae@denx.de>
In-Reply-To: <45f9065d-7257-1050-2664-5ad55d8c14ae@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 17 Oct 2022 08:22:04 +0530
Message-ID: <CAMty3ZBtRZ-vDPQYX+m8uWmsD+vmbFOnCGVba8swQ8GWtWaKJQ@mail.gmail.com>
Subject: Re: [PATCH v7 02/10] drm: bridge: samsung-dsim: Lookup OF-graph or
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

On Sun, Oct 16, 2022 at 3:18 AM Marek Vasut <marex@denx.de> wrote:
>
> On 10/5/22 17:13, Jagan Teki wrote:
> > The child devices in MIPI DSI can be binding with OF-graph
> > and also via child nodes.
> >
> > The OF-graph interface represents the child devices via
> > remote and associated endpoint numbers like
> >
> > dsi {
> >     compatible = "fsl,imx8mm-mipi-dsim";
> >
> >     ports {
> >       port@0 {
> >            reg = <0>;
> >
> >            dsi_in_lcdif: endpoint@0 {
> >                 reg = <0>;
> >                 remote-endpoint = <&lcdif_out_dsi>;
> >            };
> >       };
> >
> >       port@1 {
> >            reg = <1>;
> >
> >            dsi_out_bridge: endpoint {
> >                 remote-endpoint = <&bridge_in_dsi>;
> >            };
> >       };
> > };
> >
> > The child node interface represents the child devices via
> > conventional child nodes on given DSI parent like
> >
> > dsi {
> >     compatible = "samsung,exynos5433-mipi-dsi";
> >
> >     ports {
> >          port@0 {
> >               reg = <0>;
> >
> >               dsi_to_mic: endpoint {
> >                    remote-endpoint = <&mic_to_dsi>;
> >               };
> >          };
> >     };
> >
> >     panel@0 {
> >          reg = <0>;
> >     };
> > };
> >
> > As Samsung DSIM bridge is common DSI IP across all Exynos DSI
> > and NXP i.MX8M host controllers, this patch adds support to
> > lookup the child devices whether its bindings on the associated
> > host represent OF-graph or child node interfaces.
>
> This looks like a good candidate for common/helper code which can be
> reused by other similar drivers.

Tried that but unfortunately, it cannot hold to handle things in a generic way.
80253168dbfd ("drm: of: Lookup if child node has panel or bridge")

Jagan.
