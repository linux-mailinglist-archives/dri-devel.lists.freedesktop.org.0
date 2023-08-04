Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C7F76FF5B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 13:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13C110E6DC;
	Fri,  4 Aug 2023 11:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9E010E6DC
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 11:22:58 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6bc9254a1baso1694556a34.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 04:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691148177; x=1691752977;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vn7trNe3dp1mcfDcT90chQDFTqjFrpKrHN2t55C4hRo=;
 b=h8k1fJ86O8e50jai+n2+QbrEkHj1ndtJF3OoRpIorLn0Q8x+bb4IAOPhBIiNzHLHLv
 MQs4XP2vs+52XeoYJYQF/B1ot1IgVJr2OiugYCMi49BSeEGwTM+W1+RkvARKLX6HS9Ai
 G5xx9b+frta2ubwm3cJ0LLkXJPPnJ8P5wUcgO7n1WVKtEqeLjZioZIai0mJxEaNGFeBP
 jTioRIHx+5KuA+NGJQhscTKMq7YM+0w50h/So35ndoeWxy7D4yGzGkZP9GtiUjJg2D6T
 lfDZyaNSxRCJdSKFL5OEsJT84OiFzzXWPhb9WYIaH6nOXRAka6GW6i4enA9I92v4l3ci
 +25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691148177; x=1691752977;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vn7trNe3dp1mcfDcT90chQDFTqjFrpKrHN2t55C4hRo=;
 b=FitAF4Ziy/xuxxL/lvMrMEaoTMuDqRX0N9+FGa181TlrXuyOWJAQmhMl5lWdOkyVMK
 cJQjwTIUVryZOcLfR3bNU3rgaqLtytVTkbt+MOQlaNi1pTB3uFShFcEyoyhLxIZHbjLO
 r9FD8R47KLgGZ2qtEtWu2YQbZssOTvKHkzxs5B4aFQgSa5ZJF3Usu241KaJpn6Ccvdzt
 mqFJ/3T2ZVpbTfm0r+FnjY8Y4Oitn9yORi8GW2VAzAfBF+ZgD0sRiftZ3ZzR+F4XHkg8
 dI8Qni1V++ynTXsO7SgGvqeqj0mlg/LFF2mxToEVBfRAQx+QNAdYGosoXnYlOOtjdoUT
 6stg==
X-Gm-Message-State: AOJu0YzBSJZtHe7NkdEgZRl3nP6RerXN/2xxQ8xlDxINVCV9L77CISs/
 D5F+6uOHWgvcWCUBD6WWgWDUdD2hkY68uqLY14I=
X-Google-Smtp-Source: AGHT+IEr5d/guugs9ceHWwv9P/La9OMqu92JElPp/hvOJaD9VFuLdYPTgJrihdoG/fgD9VvxleKY5S6aTsHdKmqZr+8=
X-Received: by 2002:a05:6870:8187:b0:1b3:8cfb:78c5 with SMTP id
 k7-20020a056870818700b001b38cfb78c5mr1992428oae.34.1691148176721; Fri, 04 Aug
 2023 04:22:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230804030140.21395-1-rdunlap@infradead.org>
In-Reply-To: <20230804030140.21395-1-rdunlap@infradead.org>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 4 Aug 2023 06:22:44 -0500
Message-ID: <CAHCN7xJS6DC7BJhGWrgtczfye05z_Jeet1gjwKZkbRRrUk0cYQ@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: for GENERIC_PHY_MIPI_DPHY also select
 GENERIC_PHY
To: Randy Dunlap <rdunlap@infradead.org>
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
 Maxime Ripard <maxime.ripard@bootlin.com>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Aleksandr Nogikh <nogikh@google.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Chiras <robert.chiras@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 3, 2023 at 10:01=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> Three DRM bridge drivers select GENERIC_PHY_MIPI_DPHY when GENERIC_PHY
> might not be set.  This causes Kconfig warnings and a build error.
>
> WARNING: unmet direct dependencies detected for GENERIC_PHY_MIPI_DPHY
>   Depends on [n]: GENERIC_PHY [=3Dn]
>   Selected by [y]:
>   - DRM_NWL_MIPI_DSI [=3Dy] && DRM_BRIDGE [=3Dy] && DRM [=3Dy] && COMMON_=
CLK [=3Dy] && OF [=3Dy] && HAS_IOMEM [=3Dy]
>   - DRM_SAMSUNG_DSIM [=3Dy] && DRM [=3Dy] && DRM_BRIDGE [=3Dy] && COMMON_=
CLK [=3Dy] && OF [=3Dy] && HAS_IOMEM [=3Dy]
>
> (drm/bridge/cadence/Kconfig was found by inspection.)
>
> aarch64-linux-ld: drivers/gpu/drm/bridge/samsung-dsim.o: in function `sam=
sung_dsim_set_phy_ctrl':
> drivers/gpu/drm/bridge/samsung-dsim.c:731: undefined reference to `phy_mi=
pi_dphy_get_default_config_for_hsclk'
>
> Prevent these warnings and build error by also selecting GENERIC_PHY
> whenever selecting GENERIC_PHY_MIPI_DPHY.
>

Reviewed-by: Adam Ford <aford173@gmail.com>

> Fixes: fced5a364dee ("drm/bridge: cdns: Convert to phy framework")
> Fixes: 44cfc6233447 ("drm/bridge: Add NWL MIPI DSI host controller suppor=
t")
> Fixes: 171b3b1e0f8b ("drm: bridge: samsung-dsim: Select GENERIC_PHY_MIPI_=
DPHY")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: Aleksandr Nogikh <nogikh@google.com>
> Link: lore.kernel.org/r/20230803144227.2187749-1-nogikh@google.com
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Guido G=C3=BCnther <agx@sigxcpu.org>
> Cc: Robert Chiras <robert.chiras@nxp.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/bridge/Kconfig         |    2 ++
>  drivers/gpu/drm/bridge/cadence/Kconfig |    1 +
>  2 files changed, 3 insertions(+)
>
> diff -- a/drivers/gpu/drm/bridge/cadence/Kconfig b/drivers/gpu/drm/bridge=
/cadence/Kconfig
> --- a/drivers/gpu/drm/bridge/cadence/Kconfig
> +++ b/drivers/gpu/drm/bridge/cadence/Kconfig
> @@ -4,6 +4,7 @@ config DRM_CDNS_DSI
>         select DRM_KMS_HELPER
>         select DRM_MIPI_DSI
>         select DRM_PANEL_BRIDGE
> +       select GENERIC_PHY
>         select GENERIC_PHY_MIPI_DPHY
>         depends on OF
>         help
> diff -- a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -181,6 +181,7 @@ config DRM_NWL_MIPI_DSI
>         select DRM_KMS_HELPER
>         select DRM_MIPI_DSI
>         select DRM_PANEL_BRIDGE
> +       select GENERIC_PHY
>         select GENERIC_PHY_MIPI_DPHY
>         select MFD_SYSCON
>         select MULTIPLEXER
> @@ -227,6 +228,7 @@ config DRM_SAMSUNG_DSIM
>         select DRM_KMS_HELPER
>         select DRM_MIPI_DSI
>         select DRM_PANEL_BRIDGE
> +       select GENERIC_PHY
>         select GENERIC_PHY_MIPI_DPHY
>         help
>           The Samsung MIPI DSIM bridge controller driver.
