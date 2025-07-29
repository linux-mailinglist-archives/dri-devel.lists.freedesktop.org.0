Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 919DCB14937
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 09:36:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA1910E5E2;
	Tue, 29 Jul 2025 07:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZXsJKAb3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3914310E5E2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 07:36:13 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id
 a1e0cc1a2514c-87f234ba1abso1103629241.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 00:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753774572; x=1754379372; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ybx9ZEB7Knt4sq4h7VniyBzicrS5wNfctmysoMkVU7g=;
 b=ZXsJKAb3tQF2xhyfHJaLrqgmNUKRhPJxt/cwq1+oPHSOpjo/DuZQm9BXX80ovk+zQk
 5bsAreOPkg6Oc97fh7Fe8cjCYiGq9JwGQfMJKICCr/ep0poN7h63oMLIVkwRjLak0btd
 VxD5XG1VJh3D/wL59NRXJFhtcPPrslThY5JqN+GD1uOQdqxpoJd9V5KUaCbwzvHGJmiZ
 GXUkmWyBG6KAf5HVRxwlVJn8pIja/rvucRTuAvZB6Su8nZUHfobESUC6atf4qHdqSR1t
 IyzD5WskDbjTdetTyLOexmsWB+RDFY9cOR7Iov3Wue+ox//AM1DJ5os92K5htFypezW0
 LNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753774572; x=1754379372;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ybx9ZEB7Knt4sq4h7VniyBzicrS5wNfctmysoMkVU7g=;
 b=lTCkJMMVY+yWH+1CJdheggWYfgJftus7KjVD2ysXiEcXCAfwWHPx6SgPtt8msObPwU
 MgSeSsWYGA6iH1WuWD/k95+vXG63knJCyJ5kd0000EIf1kkzkZoQzBPL7R8AU5KGfVtQ
 i8sqn3sQGTJc5RJRMSIwy3MMAGjp9QTHuSS6Fx9B51BrO+WxedlPzpDzOHeDlD7Hp/bL
 H6u2YaU5aJBY3YIYUoaanputM7DINk0qDhO44q7IICZvEAKlU7lF00CpSAsJKbeN21TS
 xBXrlbVAYw7+sxa3IG39alLtNOjg9OJh1B8ILqdvEUr9la+P+1fwfaaB/3l75UgjnSVi
 5/7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmBYakge6sQr2N6LSL01nC1ju03Wqc+Ql93LV2/0qdBc0/BvKdsCD9HfA4nagtygG1GJTZHOxxftU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZf9Mz44+ZtjivD8OHOwJMna1YXm58M9E1TDvq2h/TYqZG1u2g
 X834PbqwXkJU4bUU+8kDvSW2umjhGHYkwIqUUMBUhLVyAOB9ALod47FQXu0tZ1Clkt4WBdDyiK8
 ol8ROFIfHlX+1Vkrco2CCa77V2BpQ+3Q=
X-Gm-Gg: ASbGncsWZW999LJyaFUk1ziDM1hZ/4H0lEcmEK5kLXYDxV+ZM7ZSug8IERqpQgh45nb
 yQ9oC9t9hwIEDgyUgqJgtIvyF10uF/vFF7kO8mwv2DYiSa2PkEpXbZYyGxdTKde9DjrBs1em/58
 mId7JtaIwKZ2QGOC2zlpXUGnOIsrqyaXwJ2aA4VHxi1ujXLDcoRPi0Rd95yfqoW0ymn2dk7EaQN
 aIRvw==
X-Google-Smtp-Source: AGHT+IENH2AW1ZXDnTlpVuHy58DEAA8L0hmQ3yc6dY3oxN1NrLrIl4BCIubHSKcHLtCqUNYVz4YtdWuKh0KtO3j5xGY=
X-Received: by 2002:a05:6102:3053:b0:4e9:add0:2816 with SMTP id
 ada2fe7eead31-4fa3fc4c5b4mr5102345137.5.1753774572016; Tue, 29 Jul 2025
 00:36:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org>
In-Reply-To: <20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org>
From: Inki Dae <daeinki@gmail.com>
Date: Tue, 29 Jul 2025 16:35:29 +0900
X-Gm-Features: Ac12FXzR2-3ASwmrKN7QegXsTXtT3Y5L39TTtfej0LBVwYdqfV-4142nEMemsSM
Message-ID: <CAAQKjZP12LZPHcPo1ztvKq6Vts=Mp0o5NyJfdCZZoMB633wynQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/13] Support for Exynos7870 DSIM bridge
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kaustabh Chakraborty,

2025=EB=85=84 7=EC=9B=94 7=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 3:26, Ka=
ustabh Chakraborty <kauschluss@disroot.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> This patch series introduces a lot of changes to the existing DSIM
> bridge driver, by introdcing new registers and making register offsets
> configurable for different SoCs. These preliminary changes are followed
> by the introduction of support for Exynos7870's DSIM IP block.
>
> Work is heavily inspired and only possible due to Samsung's vendor
> kernel sources. Testing has been done with Samsung Galaxy J7 Prime
> (samsung-on7xelte), Samsung Galaxy A2 Core (samsung-a2corelte), and
> Samsung Galaxy J6 (samsung-j6lte), all with DSI video mode panels.

Patches 1 through 12 have been merged into the exynos-drm-misc-next branch.
- Patch 9 was merged as-is. If you decide to accept my suggestion and
submit a revised version later, I will apply it on top of the existing
patch.
- Patch 10 was also merged without modification. Although it includes
a behavioral change (removal of the fallback to pll_clk), I don=E2=80=99t
foresee any issues. If any problems arise, I=E2=80=99ll revert it.

And patch 13 has been merged into the exynos-drm-next branch.

Thanks,
Inki Dae

>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
> Changes in v3:
> - support both legacy STATUS and LINK_STATUS & DPHY_STATUS split (daeinki=
)
> - Link to v2: https://lore.kernel.org/r/20250627-exynos7870-dsim-v2-0-143=
3b67378d3@disroot.org
>
> Changes in v2:
> - added commit to isolate clock names for each variant
> - replaced clock names with generic ones (krzk)
> - added maxItems to clocks property in dtschema (krzk)
> - Link to v1: https://lore.kernel.org/r/20250612-exynos7870-dsim-v1-0-1a3=
30bca89df@disroot.org
>
> ---
> Kaustabh Chakraborty (13):
>       drm/bridge: samsung-dsim: support separate LINK and DPHY status reg=
isters
>       drm/bridge: samsung-dsim: add SFRCTRL register
>       drm/bridge: samsung-dsim: add flag to control header FIFO wait
>       drm/bridge: samsung-dsim: allow configuring bits and offsets of CLK=
CTRL register
>       drm/bridge: samsung-dsim: allow configuring the MAIN_VSA offset
>       drm/bridge: samsung-dsim: allow configuring the VIDEO_MODE bit
>       drm/bridge: samsung-dsim: allow configuring PLL_M and PLL_S offsets
>       drm/bridge: samsung-dsim: allow configuring the PLL_STABLE bit
>       drm/bridge: samsung-dsim: increase timeout value for PLL_STABLE
>       drm/bridge: samsung-dsim: add ability to define clock names for eve=
ry variant
>       dt-bindings: samsung,mipi-dsim: document exynos7870 DSIM compatible
>       drm/bridge: samsung-dsim: add driver support for exynos7870 DSIM br=
idge
>       drm/exynos: dsi: add support for exynos7870
>
>  .../bindings/display/bridge/samsung,mipi-dsim.yaml |  27 ++
>  drivers/gpu/drm/bridge/samsung-dsim.c              | 353 +++++++++++++++=
+-----
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c            |   9 +
>  include/drm/bridge/samsung-dsim.h                  |  16 +-
>  4 files changed, 317 insertions(+), 88 deletions(-)
> ---
> base-commit: 26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
> change-id: 20250523-exynos7870-dsim-f29d6eafca52
>
> Best regards,
> --
> Kaustabh Chakraborty <kauschluss@disroot.org>
>
>
