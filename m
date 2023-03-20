Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE426C0C13
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 09:21:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E88F710E255;
	Mon, 20 Mar 2023 08:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA7C010E255
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 08:21:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E3660B80CAA;
 Mon, 20 Mar 2023 08:21:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 729FAC433D2;
 Mon, 20 Mar 2023 08:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679300507;
 bh=jVn18uqDt5rfFoXE/I7E0XizLiknyMconn6QPnHtdLQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TSwW0AmSxuRFtl0g9F718VJ2W3q6LSKylGHTNj9byCTSaZa6mlm/YCrmaJK5BS5j1
 KGSEu3WXqYU/juOPwBpq7C1HipAEgLNnNrIoJnWvOolIeHrqU2KVXLXzrmoRcZEXCB
 ic9NSivyMigokjCbK3nFimEnng8NY6cvs61609sPkBvN6Fg/LW5Yh1dFrRFTTWysWm
 xTgXxDQZ/U2syZd8qk8wHLvc/yO6NTVHqYBl2RS31lX50Ti9WugSaWFtLH7sBjQZsY
 eqdFR7wvA3UbmjyV1XPTDGu3b5l2JNMcGNOETU3it5RSiMkyt0WLv0KpcPIk2ueuzf
 JkzKs4IFnOr8Q==
Date: Mon, 20 Mar 2023 08:21:41 +0000
From: Lee Jones <lee@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH 37/37] drm/bridge/imx/Kconfig: Prevent imx-ldb-helper
 from appearing in 2 separate modules
Message-ID: <20230320082141.GJ9667@google.com>
References: <20230317081718.2650744-1-lee@kernel.org>
 <20230317081718.2650744-38-lee@kernel.org>
 <fc8b6ec1f05c1514b6ed5535e16c9c2d21efea86.camel@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fc8b6ec1f05c1514b6ed5535e16c9c2d21efea86.camel@nxp.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 17 Mar 2023, Liu Ying wrote:

> Hi Lee,
>
> On Fri, 2023-03-17 at 08:17 +0000, Lee Jones wrote:
> > Fixes the following W=1 kernel build warning(s):
> >
> >  scripts/Makefile.build:252: drivers/gpu/drm/bridge/imx/Makefile: imx-ldb-helper.o is added to multiple modules: imx8qm-ldb imx8qxp-ldb
> >
> > Cc: Liu Ying <victor.liu@nxp.com>
> > Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> > Cc: Neil Armstrong <neil.armstrong@linaro.org>
> > Cc: Robert Foss <rfoss@kernel.org>
> > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > Cc: Jonas Karlman <jonas@kwiboo.se>
> > Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Shawn Guo <shawnguo@kernel.org>
> > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > Cc: Fabio Estevam <festevam@gmail.com>
> > Cc: NXP Linux Team <linux-imx@nxp.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Signed-off-by: Lee Jones <lee@kernel.org>
>
> Thank you for the patch.
>
> > ---
> >  drivers/gpu/drm/bridge/imx/Kconfig          |  7 +++++++
> >  drivers/gpu/drm/bridge/imx/Makefile         |  7 +++++--
> >  drivers/gpu/drm/bridge/imx/imx-ldb-helper.c | 13 +++++++++++++
> >  3 files changed, 25 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> > index 608f47f41bcd1..97018dcd078d0 100644
> > --- a/drivers/gpu/drm/bridge/imx/Kconfig
> > +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> > @@ -1,10 +1,16 @@
> >  if ARCH_MXC || COMPILE_TEST
> >
> > +config DRM_IMX8_LIB
>
> I would limit this to i.MX LVDS Display Bridge(LDB) library, so I
> suggest to use DRM_IMX_LDB_LIB.
>
> > +	tristate
> > +	help
> > +	  Common helper functions used by some of the drivers below.
>
> Considering to use DRM_IMX_LDB_LIB, help message can be a bit more
> specific to LDB drivers, like:
>
> Common helper functions used by i.MX LVDS display bridge drivers below.

Thanks for the help.  Leave it with me.

--
Lee Jones [李琼斯]
