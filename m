Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1F476FD6F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 11:36:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A49510E046;
	Fri,  4 Aug 2023 09:35:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63A9110E719
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 09:35:39 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fe2d620d17so70605e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 02:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1691141738; x=1691746538;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gG/hBNu1GQAj2OK0xpKDkaIiZaaGafuOT1wyHJ92KUE=;
 b=NxzXN8kae6zug4q6tWPIQXj58WTnWDUNK2etKvXWpMe8V9M2VrJFR1dYIvtuKa1UB4
 kRFN4jzXjGxIMhDwJjPxhvKtSYho5msJ9A0X6BpHcInDzBH0D091X8+QDwkD2PYZw+N7
 sJKGCQGSzBNxNlgzZNHpMqej8EGrEVmjYMHcm6JiPFIyj5FZyAKF0JIf3r3xcWpBSQka
 z+vKIK7O2g1trqKFsS7JSNDLWBr4RzT53cedmf/5nE5LhQzNDneVMXVzsyccQkNfeSnl
 zrk6ey0FACp+G9oq87nbNjvljvxmXNwuNrtkiwk2Cm3XNA7cljhoSygLAafz6YBuDkBP
 8NJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691141738; x=1691746538;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gG/hBNu1GQAj2OK0xpKDkaIiZaaGafuOT1wyHJ92KUE=;
 b=UDTxQCxQ7g+byWLetBeCNFWn7W/tFT0N1vmhGM66uRxthxQprkUawrC3NgYc1EutGO
 Qc8s7WzBA02HnLasRTB5If7a3oRwn54Nj/8N+eBKNonBvweG+TjCFUbE5rzq3JfHxN0G
 btyYFJdj/aUSsB0kvQNws9Qvep/tzgu/9JZYnQg+GOefLXH2hNTP72xcLIQ3uknIsYxY
 WBQK/r8hLiNjjCpG5asUnaTbkqI2eFS8ae6O/GNhTTX6h0sF5yF0r9SBz+YzCY4DGKCj
 m6ALEFY5KKLUFJ0USno+Rh1op6WiEQxhXuO17zN8raE322dKRbxKWAxGKvqUoAELU766
 x8dQ==
X-Gm-Message-State: AOJu0Yx+kokIMUf3ppaabteMwBtf1hTufP8t4Lca6xLNUqDNBp5VGXs1
 t+ftf80eKJl/IBqXQKNhtyCKy9B6dYSsUfcylWMY3g==
X-Google-Smtp-Source: AGHT+IEwo+ZtUuqQhcrazD8v+nNjuIoQZOhMJIRaf2kxpQIbs0CjisNKpq8sTDUzeUT/HeKKQIaMrZT+owjkAQx9b2k=
X-Received: by 2002:a05:600c:3ba9:b0:3f4:fb7:48d4 with SMTP id
 n41-20020a05600c3ba900b003f40fb748d4mr48822wms.3.1691141737646; Fri, 04 Aug
 2023 02:35:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230804030140.21395-1-rdunlap@infradead.org>
 <ZMyq9e/On2wzSJWj@qwark.sigxcpu.org>
In-Reply-To: <ZMyq9e/On2wzSJWj@qwark.sigxcpu.org>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Fri, 4 Aug 2023 11:35:25 +0200
Message-ID: <CANp29Y6AnNeouWgAevBEDZcYcOjzDQwxLDfLxe41Lp3BC=h8bA@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: for GENERIC_PHY_MIPI_DPHY also select
 GENERIC_PHY
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Chiras <robert.chiras@nxp.com>, Adam Ford <aford173@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thank you for resolving this issue so quickly!

I've applied the patch locally and gone through the reproduction
steps. The kernel builds fine now.

Tested-by: Aleksandr Nogikh <nogikh@google.com>

On Fri, Aug 4, 2023 at 9:38=E2=80=AFAM Guido G=C3=BCnther <agx@sigxcpu.org>=
 wrote:
>
> Hi,
> On Thu, Aug 03, 2023 at 08:01:37PM -0700, Randy Dunlap wrote:
> > Three DRM bridge drivers select GENERIC_PHY_MIPI_DPHY when GENERIC_PHY
> > might not be set.  This causes Kconfig warnings and a build error.
> >
> > WARNING: unmet direct dependencies detected for GENERIC_PHY_MIPI_DPHY
> >   Depends on [n]: GENERIC_PHY [=3Dn]
> >   Selected by [y]:
> >   - DRM_NWL_MIPI_DSI [=3Dy] && DRM_BRIDGE [=3Dy] && DRM [=3Dy] && COMMO=
N_CLK [=3Dy] && OF [=3Dy] && HAS_IOMEM [=3Dy]
> >   - DRM_SAMSUNG_DSIM [=3Dy] && DRM [=3Dy] && DRM_BRIDGE [=3Dy] && COMMO=
N_CLK [=3Dy] && OF [=3Dy] && HAS_IOMEM [=3Dy]
> >
> > (drm/bridge/cadence/Kconfig was found by inspection.)
> >
> > aarch64-linux-ld: drivers/gpu/drm/bridge/samsung-dsim.o: in function `s=
amsung_dsim_set_phy_ctrl':
> > drivers/gpu/drm/bridge/samsung-dsim.c:731: undefined reference to `phy_=
mipi_dphy_get_default_config_for_hsclk'
> >
> > Prevent these warnings and build error by also selecting GENERIC_PHY
> n> whenever selecting GENERIC_PHY_MIPI_DPHY.
> >
> > Fixes: fced5a364dee ("drm/bridge: cdns: Convert to phy framework")
> > Fixes: 44cfc6233447 ("drm/bridge: Add NWL MIPI DSI host controller supp=
ort")
> > Fixes: 171b3b1e0f8b ("drm: bridge: samsung-dsim: Select GENERIC_PHY_MIP=
I_DPHY")
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > Reported-by: Aleksandr Nogikh <nogikh@google.com>
> > Link: lore.kernel.org/r/20230803144227.2187749-1-nogikh@google.com
> > Cc: Adam Ford <aford173@gmail.com>
> > Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> > Cc: Guido G=C3=BCnther <agx@sigxcpu.org>
> > Cc: Robert Chiras <robert.chiras@nxp.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Neil Armstrong <neil.armstrong@linaro.org>
> > Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> > Cc: Robert Foss <rfoss@kernel.org>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: dri-devel@lists.freedesktop.org
> > ---
> >  drivers/gpu/drm/bridge/Kconfig         |    2 ++
> >  drivers/gpu/drm/bridge/cadence/Kconfig |    1 +
> >  2 files changed, 3 insertions(+)
> >
> > diff -- a/drivers/gpu/drm/bridge/cadence/Kconfig b/drivers/gpu/drm/brid=
ge/cadence/Kconfig
> > --- a/drivers/gpu/drm/bridge/cadence/Kconfig
> > +++ b/drivers/gpu/drm/bridge/cadence/Kconfig
> > @@ -4,6 +4,7 @@ config DRM_CDNS_DSI
> >       select DRM_KMS_HELPER
> >       select DRM_MIPI_DSI
> >       select DRM_PANEL_BRIDGE
> > +     select GENERIC_PHY
> >       select GENERIC_PHY_MIPI_DPHY
> >       depends on OF
> >       help
> > diff -- a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconf=
ig
> > --- a/drivers/gpu/drm/bridge/Kconfig
> > +++ b/drivers/gpu/drm/bridge/Kconfig
> > @@ -181,6 +181,7 @@ config DRM_NWL_MIPI_DSI
> >       select DRM_KMS_HELPER
> >       select DRM_MIPI_DSI
> >       select DRM_PANEL_BRIDGE
> > +     select GENERIC_PHY
> >       select GENERIC_PHY_MIPI_DPHY
> >       select MFD_SYSCON
> >       select MULTIPLEXER
> > @@ -227,6 +228,7 @@ config DRM_SAMSUNG_DSIM
> >       select DRM_KMS_HELPER
> >       select DRM_MIPI_DSI
> >       select DRM_PANEL_BRIDGE
> > +     select GENERIC_PHY
> >       select GENERIC_PHY_MIPI_DPHY
> >       help
> >         The Samsung MIPI DSIM bridge controller driver.
> >
>
> For NWL:
>
> Reviewed-by: Guido G=C3=BCnther <agx@sigxcpu.org>
>
> Cheers,
>   -- Guido
