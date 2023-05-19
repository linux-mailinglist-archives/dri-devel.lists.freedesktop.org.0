Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BDB708CEE
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 02:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09CCD10E598;
	Fri, 19 May 2023 00:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B289E10E598
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 00:29:15 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-5344d45bfb0so213367a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 17:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684456155; x=1687048155;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pr3i+0Z+ZK4Cpnq2h97UEX/Scj/M44+Ofcjn0kFKHFs=;
 b=mPAnsbEXf1UYEqdXdn4+wpQQw+xZDdHa0dyi7WxOJXtBiNOaPxQb43QbrVIRmc7CIp
 9oPX1lW/Ct+jJb+mKvDH3oMvlChYRxz9uyZ8DWNRH5EmVpvQv7dh7pRngmyXRCd4Ciu+
 9CSylPc+9x+T6uzAdkP/JRGg8aKC/iRzBxvHCtdM1PKBc/QdP7wkMwhBbEizGwxRKC8+
 qUDsHWXOD9pXbP4khaGr1xfA7FqdVBi5ZbgLwSFC3+Y7hfL8UEBOd7KIOxgGipwdkEyC
 e8T+H6lBHZFHg6ATlhwdTEp4tDnI2GuMgZWIGpFzeXAhZSLZ6/lzwTdbOZHJzVgFGpHL
 n1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684456155; x=1687048155;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pr3i+0Z+ZK4Cpnq2h97UEX/Scj/M44+Ofcjn0kFKHFs=;
 b=ATTEQoVbRwQzt8iXFrApHFrXVsoKckVMfAKEZqdumOXEFZgAxO5o60g3VsRWMzPe2R
 H3NbEQjkRtPfCk/xCemIJZilFcBgHPiXw+CZlx37BlXK/I6LF8a6sSoo4kPGnoxTmR5r
 UCXdNGwk7whkFEVP10Kdax/VAd+HwZO9aL7Xk2G933K/TNrFoO6qVn9nRXNC+dWbuq9D
 995RlYz1DCyvC02VgeOoVS+3mK14AF1M4Z7JBsGcsF6+RGLyUuVMSuiR97MFpzaDEeST
 z+KEjOQHhzSazRfYqGHAfofpyk4TGScwuOgm68wkMYjlFrNp5BFTc3T+liMsRujqjfAt
 0SHA==
X-Gm-Message-State: AC+VfDyN0isGK6tpurpGPS9iQqvhTIol0IbNhliv2PvatXZEDt4PTqvV
 njtzhYSlXJDNbBfi/ZePukXBO4nlbzQJXiPj5gc=
X-Google-Smtp-Source: ACHHUZ70Qai1vCCNiurb0hcuikboFL3KM/5UVQJk243hXkVtRUDJMd+9BM+dS1BQR4BddBatuTpGzxu0SlVHa6oEvhI=
X-Received: by 2002:a17:90b:4c45:b0:250:9af3:4f89 with SMTP id
 np5-20020a17090b4c4500b002509af34f89mr469279pjb.4.1684456154724; Thu, 18 May
 2023 17:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230518230626.404068-1-aford173@gmail.com>
In-Reply-To: <20230518230626.404068-1-aford173@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 18 May 2023 21:29:03 -0300
Message-ID: <CAOMZO5DBefFuLWi39txu2RiU5vdHVx-0T48Fua6M5Y6Fr9PGNg@mail.gmail.com>
Subject: Re: [PATCH V7 0/6] drm: bridge: samsung-dsim: Support variable
 clocking
To: Adam Ford <aford173@gmail.com>
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
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 aford@beaconembedded.com, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jagan Teki <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Adam,

On Thu, May 18, 2023 at 8:06=E2=80=AFPM Adam Ford <aford173@gmail.com> wrot=
e:
>
> This series fixes the blanking pack size and the PMS calculation.  It the=
n
> adds support to allows the DSIM to dynamically DPHY clocks, and support
> non-burst mode while allowing the removal of the hard-coded clock values
> for the PLL for imx8m mini/nano/plus, and it allows the removal of the
> burst-clock device tree entry when burst-mode isn't supported by connecte=
d
> devices like an HDMI brige.  In that event, the HS clock is set to the
> value requested by the bridge chip.
>
> This has been tested on both an i.MX8M Nano and i.MX8M Plus, and should
> work on i.MX8M Mini as well. Marek Szyprowski has tested it on various
> Exynos boards.
>
> Adam Ford (5):
>   drm: bridge: samsung-dsim: Fix PMS Calculator on imx8m[mnp]
>   drm: bridge: samsung-dsim: Fetch pll-clock-frequency automatically
>   drm: bridge: samsung-dsim: Select GENERIC_PHY_MIPI_DPHY
>   drm: bridge: samsung-dsim: Dynamically configure DPHY timing
>   drm: bridge: samsung-dsim: Support non-burst mode
>
> Lucas Stach (1):
>   drm: bridge: samsung-dsim: fix blanking packet size calculation
>
>  drivers/gpu/drm/bridge/Kconfig        |   1 +
>  drivers/gpu/drm/bridge/samsung-dsim.c | 142 +++++++++++++++++++++-----
>  include/drm/bridge/samsung-dsim.h     |   4 +
>  3 files changed, 124 insertions(+), 23 deletions(-)
>
> V7:  Move messages indicating the optional device tree items are going
>      to be automatically read elsewhere was move to dev_dbg instead of
>      dev_info.  Cleaned up some of the comments to be a bit more clear.
>      Eliminated a double variable assignement accidentally introduced
>      in V6 when some of the items were moved from patch 6 to patch 5.

It seems you missed addressing one previous comment from Lucas:

"Same as with the earlier patch, this needs to be documented in the DT
binding by moving "samsung,burst-clock-frequency" to be a optional
property."
