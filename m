Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 391883BBC8E
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 14:01:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F8A89C85;
	Mon,  5 Jul 2021 12:01:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF8089C85
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 12:01:10 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id i20so28404913ejw.4
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jul 2021 05:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MGuPeMN8zkdPQjcnEwbeIwIBVsqBhILaUCgkLVxvDIw=;
 b=q3OLm05fCG+cXVayBfPolQ96fFMDwVcgLxLGIcY4So4KhtjqNPNTLrERdFct/xcQnG
 uIlG0SDO2xgAUTdopMDtBVQahhjaoVA/69qpm1ZspLq6Huy/YIIWqVdMGwAZbkeiuJcQ
 5pgJuce66IkiMI4ik/NnrFz3vxrQCVXjtz5g4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MGuPeMN8zkdPQjcnEwbeIwIBVsqBhILaUCgkLVxvDIw=;
 b=gtvuJMT8qE3PNPtz+262QpDoAMsvWM6wsPqzmdLngDMc+r49zt9+HtnmNMgPH0h40A
 uMbimLODgZXcC0iP87wUyv4LR/TiCGMJb6GJr/fMU/D1tDA9IyYiJOvZ/XIzlhRrmcSG
 r6zJMA3kZHAzllx6KezbBczHTTknW/L6WDsIam5oucNVJ+rWyjr3tn6MtA0JrmwGvvCs
 9eu/XJjt8hqdnuCMZV32FzsQwnR4mpbn3GLE24S24XpqbmCMvQm2imrMVrmXcCYRD6fS
 KRcnPJ3xoLttnA/bJow/uxkKQ0coGGdJVkHp7eM7Vn5ie3Zucwsw3f0Z548o9Mdel2YK
 qSVg==
X-Gm-Message-State: AOAM532UMkQNPifvAITu0J9LNuTfDasin5kJY3QeQRACkAcCd/uYJvhI
 OM0UDqOYaC5RfEZGnZHXWxWC7826ClhMkO4CBY3Cmg==
X-Google-Smtp-Source: ABdhPJwVDTheCeyDFdym6u4brcx0LurzRRARJzXqy0PRVQGeyD8MwvD5M4rgTnKegCf3lV+bZY+DgUAx4Vn9RaDMVJo=
X-Received: by 2002:a17:906:498b:: with SMTP id
 p11mr13163327eju.295.1625486468878; 
 Mon, 05 Jul 2021 05:01:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
 <CGME20210704090432eucas1p2fa4225336e35f3f5fd2fbf5da99001ff@eucas1p2.samsung.com>
 <20210704090230.26489-4-jagan@amarulasolutions.com>
 <7af964c7-0e92-f190-2a86-d7a061a05129@samsung.com>
In-Reply-To: <7af964c7-0e92-f190-2a86-d7a061a05129@samsung.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 5 Jul 2021 17:30:57 +0530
Message-ID: <CAMty3ZB6Y91iOBPujNWZh9h5kO4p04NioiL2zJY_j_c_LqOxBw@mail.gmail.com>
Subject: Re: [RFC PATCH 03/17] drm/exynos: dsi: Use the drm_panel_bridge API
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
Cc: Marek Vasut <marex@denx.de>, devicetree <devicetree@vger.kernel.org>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 5, 2021 at 5:18 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 04.07.2021 11:02, Jagan Teki wrote:
> > Use drm_panel_bridge to replace manual panel and
> > bridge_chain handling code.
> >
> > This makes the driver simpler to allow all components
> > in the display pipeline to be treated as bridges by
> > cleaning the way to generic connector handling.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>
> This breaks Exysos DSI driver operation (Trats board worked fine with
> only patches 1-2):
>
> [    2.540066] exynos4-fb 11c00000.fimd: Adding to iommu group 0
> [    2.554733] OF: graph: no port node found in /soc/fimd@11c00000
> [    2.602819] [drm] Exynos DRM: using 11c00000.fimd device for DMA
> mapping operations
> [    2.609649] exynos-drm exynos-drm: bound 11c00000.fimd (ops
> fimd_component_ops)
> [    2.632558] exynos-drm exynos-drm: failed to bind 11c80000.dsi (ops
> exynos_dsi_component_ops): -22
> [    2.642263] exynos-drm exynos-drm: master bind failed: -22
> [    2.651017] exynos-drm: probe of exynos-drm failed with error -22

Thanks for testing it.

Can you check Squash of 3,4 or 3,4,5 will work or not?

Thanks,
Jagan.
