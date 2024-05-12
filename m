Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 247F78C379A
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2024 18:44:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E389310E0E2;
	Sun, 12 May 2024 16:44:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dolcini.it header.i=@dolcini.it header.b="xiS8wpMG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC66E10E0E2
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2024 16:44:42 +0000 (UTC)
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id 940691FC1D;
 Sun, 12 May 2024 18:44:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
 s=default; t=1715532279;
 bh=y8g4w0GWcQosP0yLlaIzTp7hrfG0+IeoYR8ymAM4Vxo=;
 h=Received:From:To:Subject;
 b=xiS8wpMGPkUeYKLKwocNyJlF6WEEYRBVZbItYRlLNVqh4a1OerBOWHoOVmUuZN+p1
 2vn8Rbmkx0jxnA93kuwApaqQZhV2jbrjnwCfySKjCcxvGa1R7Ey5Jyyse7lPsa1Xzj
 YiGhVauggOe3xV63kePyF0s6kWsfhrlu/NiRPkSen3eKEPxS077LalvY/Cuw9v1TVL
 H+cyX+tvk1LfM4pXaDWCHveaMMxDXfs5LJ4w4g9UVo1t6uxU0WKwu6eALYcm30Pz/C
 3AB/b88rRfmr+GpGYGBz2UoqOe8y31y0JXfeHgKILtU+ekeRNz1DRi73YjYmBh/z/J
 Y51gbgNmln/WQ==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
 id 3FBF97F9B8; Sun, 12 May 2024 18:44:39 +0200 (CEST)
Date: Sun, 12 May 2024 18:44:39 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Randolph Sapp <rs@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>
Subject: Re: [PATCH 4/4] drm/tidss: Add OLDI bridge support
Message-ID: <ZkDx94qEVv65FquF@gaggiata.pivistrello.it>
References: <20240511193055.1686149-1-a-bhatia1@ti.com>
 <20240511193055.1686149-5-a-bhatia1@ti.com>
 <ZkCsfH1qeSsXyQz4@gaggiata.pivistrello.it>
 <e34dc434-7922-4b47-bc41-c06f13366194@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e34dc434-7922-4b47-bc41-c06f13366194@ti.com>
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

Hello Aradhya,

On Sun, May 12, 2024 at 08:53:12PM +0530, Aradhya Bhatia wrote:
> On 12/05/24 17:18, Francesco Dolcini wrote:
> > On Sun, May 12, 2024 at 01:00:55AM +0530, Aradhya Bhatia wrote:
> >> Up till now, the OLDI support in tidss was integrated within the tidss dispc.
> >> This was fine till the OLDI was one-to-mapped with the DSS video-port (VP).
> >> The AM62 and AM62P SoCs have 2 OLDI TXes that can support dual-lvds / lvds-clone
> >> modes.
> >>
> >> Add OLDI TXes as separate DRM bridge entities to better support the new LVDS
> >> configurations.
> >>
> >> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> >> ---
> >>  drivers/gpu/drm/tidss/Makefile      |   3 +-
> >>  drivers/gpu/drm/tidss/tidss_dispc.c |  11 +-
> >>  drivers/gpu/drm/tidss/tidss_dispc.h |   4 +
> >>  drivers/gpu/drm/tidss/tidss_drv.c   |  13 +-
> >>  drivers/gpu/drm/tidss/tidss_drv.h   |   4 +
> >>  drivers/gpu/drm/tidss/tidss_oldi.c  | 568 ++++++++++++++++++++++++++++
> >>  drivers/gpu/drm/tidss/tidss_oldi.h  |  73 ++++
> >>  7 files changed, 673 insertions(+), 3 deletions(-)
> >>  create mode 100644 drivers/gpu/drm/tidss/tidss_oldi.c
> >>  create mode 100644 drivers/gpu/drm/tidss/tidss_oldi.h
> >>
> >> diff --git a/drivers/gpu/drm/tidss/tidss_oldi.h b/drivers/gpu/drm/tidss/tidss_oldi.h
> >> new file mode 100644
> >> index 000000000000..5ad02ddea11a
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/tidss/tidss_oldi.h
> >> @@ -0,0 +1,73 @@
> >> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> >> +/*
> >> + * Copyright (C) 2023 - Texas Instruments Incorporated
> >> + *
> >> + * Aradhya Bhatia <a-bhati1@ti.com>
> >> + */
> >> +
> >> +#ifndef __TIDSS_OLDI_H__
> >> +#define __TIDSS_OLDI_H__
> >> +
> >> +#include <linux/media-bus-format.h>
> >> +
> >> +#include "tidss_drv.h"
> >> +#include "tidss_dispc.h"
> >> +
> >> +struct tidss_oldi;
> > 
> > why do you need this here? 
> 
> So that struct tidss_device can store pointers to struct tidss_oldi
> instances.

on this and ...

> >> +#define OLDI_IDLE_CLK_HZ	25000000 /*25 MHz */
> > this is used only on a single C files, move it there?
> > 
> > I would consider this comment in general for this header file,
> > from a quick check most of this is used only in tidss_oldi.c.
> 
> Apart from struct tidss_device being able to access struct tidss_oldi,
> there is no direct access to any of the above.
> 
> Perhaps I can move the idle clock definition into the C file.
> 
> However, before tidss_oldi.h, all the register definitions have been
> stored in tidss_dispc_regs.h. It just seemed right to keep them out in
> the header file and maintain the status quo.

... this they are probably more of a personal taste topic, just go
for whatever you and the actual maintainer (tomi?) prefer.

Thanks,
Francesco

